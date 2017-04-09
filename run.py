#!/usr/bin/env python3

import argparse
import textwrap
import speech_recognition as sr


def format(string, args):
    lines = textwrap.wrap(string, width=args.width)
    result = '\n'.join(lines)
    return result


def do_it(args):
    r = sr.Recognizer()

    with sr.AudioFile(args.file) as source:
        audio = r.record(source)

    raw_result = r.recognize_sphinx(audio, language=args.lang)
    result = format(raw_result, args)

    print(result)

    output = args.output
    if output:
        with open(output, 'w') as f:
            print(result, file=f)
            print("Result saved to {}".format(output))


def just(func):
    parser = argparse.ArgumentParser(description='wav to text')

    parser.add_argument('file', type=str)
    parser.add_argument('-o', '--output', nargs='?',
                        type=str, help='output text file')
    parser.add_argument('-l', '--lang', default='fr-FR',
                        choices=["fr-FR", "en-US"], type=str)
    parser.add_argument('-w', '--width', type=int,
                        default=70, help='line width')

    parser.set_defaults(func=func)
    args = parser.parse_args()
    return args.func(args)


if __name__ == '__main__':
    just(do_it)
