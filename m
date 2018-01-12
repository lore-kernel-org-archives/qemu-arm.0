Received: by 10.28.173.206 with SMTP id w197csp1756302wme;
        Fri, 12 Jan 2018 04:03:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBosGWwEKe4AfoIAw71BrLOudFvh2OYDWpgAG+5qU0dOhzm+YoKyMJNNHMhy5nqPhT/vmETUD
X-Received: by 10.13.193.67 with SMTP id c64mr917658ywd.197.1515758590652;
        Fri, 12 Jan 2018 04:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515758590; cv=none;
        d=google.com; s=arc-20160816;
        b=feaVqpe9SxFI11O9D0JZuJmXjkBuKwQhSh7jKj7YfmoEiwaPhBWssGmJhI9Zaaj+6q
         6dewXhFF5KE05ERfct0xnq57R7aZ0tBA+mAowz9XmhSo91/JLb50hMyjUgGCDsA30yWx
         hLEw3pWZGSl4jWpUZBTV4E4+he2l4qBbO1VhrFvrTfZzcRF7Pi8my3AlFGEWAzrnrexi
         4EtU8TKsTtpShH13wI7+zpK2Qpe4vLKS7ZkujXjD9HX21oa8uv5MIKHn7j/OSBZQrvYw
         ybplBCj45uYlqGCzbof2ad1Ri5NN4CO+l3tfGTruYdtxuB8wK3vTsxm7eXOvO9S+K9v0
         t/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fUMmx7HndI1ekjfFYYI8dkPSHuAhEJv0LKDu9nwoa/w=;
        b=OdkV1j45WNIMi0pgUvt5Qongj9L+vljswsm6G2uaZi2vgQdiJ7g4RbqkaPjKdpw6O/
         DF6Rbnk+t5w1bANU2nB+NwHPlo2G7amlUQqVAcsrlq1YPhpRgD81aEqedQOWPTuD85Ad
         v+L/SlrrB8vPU8t451Efu9BTIODtVUqlmHG7OU23bwVfC/pmRyOii08tL5cqb/P51h2A
         l+kPoWqGiOfgN7yE3inpUhpSUvzExYYv4VietTEsQplQR8Qr4CeY5yT/7RR38qFllzHT
         BC8NcQR06bWCFWjZ9kNfFWWduj/ejQMPX2hfVEBxrRUgGkH6LzS0mDFBIrYr5x4+gvKa
         qZIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YCFAH4TB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si453355ybk.255.2018.01.12.04.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 04:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YCFAH4TB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZy3A-0001Tc-Dh
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 07:03:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZxyJ-000625-PC
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 06:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZxyI-0002gP-Bo
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 06:58:07 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:39902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZxyI-0002fv-47
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 06:58:06 -0500
Received: by mail-ot0-x22f.google.com with SMTP id 37so4836116otv.6
	for <qemu-devel@nongnu.org>; Fri, 12 Jan 2018 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fUMmx7HndI1ekjfFYYI8dkPSHuAhEJv0LKDu9nwoa/w=;
	b=YCFAH4TBHMh+rxbM1vuffu/5+PBIx9BxIVD6L+l7WM0vIAxrgJoD+ECFlMnQD8zeQy
	dmbtfBfvT0KFpmdjtUxfwswXVn6bXydvRAHGlSZ+Jo8WM5470XwSYQlqZXZiQcTC5B9e
	c7g/VYuy1JEnW2J7vI5YsHLskplp+QiZahhhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fUMmx7HndI1ekjfFYYI8dkPSHuAhEJv0LKDu9nwoa/w=;
	b=U1zAgsiW246eR2SC5oBPbEggnoqm7AzuXhgFPP6m9Yy2xCqjfwSSmsTwc5FZiyChtw
	kcsHzfagphEIxW3QOGJLM2Ww08yu+xESzQL8o6obiFwKK2EUxWDuyzcNuP5xTozt7gL3
	ISAYCXHJUDInwk7JoWpMnN0Pc1YFmOh9rgSYbaohXJpW2uXFZh3IKVoKw0EagOU5qUgg
	PBX7Dhoo+eLgtvSH8sXwVa7oGwHT2hZ0mAd2T6mcf+rJt8L2G1tS/tim/oK9Qaz5xFs8
	PLUNe+DTDwx+nnVf/WVFOcUDLN4CpSqHRoi370sqVlgIK/3jw6Cmv6XqFbB9+Skj3H+V
	SaEQ==
X-Gm-Message-State: AKwxytfJp+21SGW0wYI6DYPOcTt38hO5I03l6pC+RKGr+atebd9ADpOX
	qKJr+SO2zCFz4Sdj3LG71yUZeHplB1o3+wEr/geoXw==
X-Received: by 10.157.52.215 with SMTP id t23mr6674079otd.54.1515758285080;
	Fri, 12 Jan 2018 03:58:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 03:57:44 -0800 (PST)
In-Reply-To: <20171218174552.18871-2-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 11:57:44 +0000
Message-ID: <CAFEAcA9A85CnzizK8rYNZCDgmszG5NL3=1QOetTcOS3gijzCAA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-devel] [PATCH 01/23] scripts: Add decodetree.py
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IpndR5Z4cExW

On 18 December 2017 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
> To be used to decode ARM SVE, but could be used for any 32-bit RISC.
> It would need additional work to extend to insn sizes other than 32-bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I have some comments here (mostly about the syntax, error checking
and generated code, rather than the script itself), but overall I
like this approach and I think we can drop the "RFC" from the patchset.

> ---
>  scripts/decodetree.py | 984 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 984 insertions(+)
>  create mode 100755 scripts/decodetree.py
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> new file mode 100755
> index 0000000000..acb0243915
> --- /dev/null
> +++ b/scripts/decodetree.py
> @@ -0,0 +1,984 @@
> +#!/usr/bin/env python

I asked on #qemu-devel for some review from people who are more
familiar with Python than I am. One of the suggestions (from
Marc-Andr=C3=A9 Lureau) was to run pycodestyle on this and fix the
(mostly coding style nits) reported by it. (pycodestyle may
be called 'pep8' on older distros.)

> +#
> +# Generate a decoding tree from a specification file.
> +#
> +# The tree is built from instruction "patterns".  A pattern may represen=
t
> +# a single architectural instruction or a group of same, depending on wh=
at
> +# is convenient for further processing.
> +#
> +# Each pattern has "fixedbits" & "fixedmask", the combination of which
> +# describes the condition under which the pattern is matched:
> +#
> +#   (insn & fixedmask) =3D=3D fixedbits
> +#
> +# Each pattern may have "fields", which are extracted from the insn and
> +# passed along to the translator.  Examples of such are registers,
> +# immediates, and sub-opcodes.
> +#
> +# In support of patterns, one may declare fields, argument sets, and
> +# formats, each of which may be re-used to simplify further definitions.
> +#
> +## Field syntax:
> +#
> +# field_def    :=3D '%' identifier ( unnamed_field )+ ( !function=3Diden=
tifier )?
> +# unnamed_field :=3D number ':' ( 's' ) number
> +#
> +# For unnamed_field, the first number is the least-significant bit posit=
ion of
> +# the field and the second number is the length of the field.  If the 's=
' is
> +# present, the field is considered signed.  If multiple unnamed_fields a=
re
> +# present, they are concatenated.  In this way one can define disjoint f=
ields.

This syntax lets you specify that fields other than the first one in
a concatenated set are signed, like
    10:5 | 3:s5
That doesn't seem to me like it's meaningful. Shouldn't the signedness
or otherwise be a property of the whole extracted field, rather than
an individual component of it? (In practice creating a signed combined
value is implemented by doing the most-significant component as sextract,
obviously.)

> +#
> +# If !function is specified, the concatenated result is passed through t=
he
> +# named function, taking and returning an integral value.
> +#
> +# FIXME: the fields of the structure into which this result will be stor=
ed
> +# is restricted to "int".  Which means that we cannot expand 64-bit item=
s.
> +#
> +# Field examples:
> +#
> +#   %disp   0:s16          -- sextract(i, 0, 16)
> +#   %imm9   16:6 10:3      -- extract(i, 16, 6) << 3 | extract(i, 10, 3)
> +#   %disp12 0:s1 1:1 2:10  -- sextract(i, 0, 1) << 11
> +#                             | extract(i, 1, 1) << 10
> +#                             | extract(i, 2, 10)
> +#   %shimm8 5:s8 13:1 !function=3Dexpand_shimm8
> +#                          -- expand_shimm8(sextract(i, 5, 8) << 1
> +#                                           | extract(i, 13, 1))

Do we syntax-check for accidentally specifying a field-def whose
components overlap (eg "3:5 0:5")? I think we should, but I didn't
see a check in a quick scan through the parsing code.

> +#
> +## Argument set syntax:
> +#
> +# args_def    :=3D '&' identifier ( args_elt )+
> +# args_elt    :=3D identifier
> +#
> +# Each args_elt defines an argument within the argument set.
> +# Each argument set will be rendered as a C structure "arg_$name"
> +# with each of the fields being one of the member arguments.
> +#
> +# Argument set examples:
> +#
> +#   &reg3       ra rb rc
> +#   &loadstore  reg base offset
> +#
> +## Format syntax:
> +#
> +# fmt_def      :=3D '@' identifier ( fmt_elt )+
> +# fmt_elt      :=3D fixedbit_elt | field_elt | field_ref | args_ref
> +# fixedbit_elt :=3D [01.]+
> +# field_elt    :=3D identifier ':' 's'? number
> +# field_ref    :=3D '%' identifier | identifier '=3D' '%' identifier
> +# args_ref     :=3D '&' identifier
> +#
> +# Defining a format is a handy way to avoid replicating groups of fields
> +# across many instruction patterns.
> +#
> +# A fixedbit_elt describes a contiguous sequence of bits that must
> +# be 1, 0, or "." for don't care.
> +#
> +# A field_elt describes a simple field only given a width; the position =
of
> +# the field is implied by its position with respect to other fixedbit_el=
t
> +# and field_elt.
> +#
> +# If any fixedbit_elt or field_elt appear then all 32 bits must be defin=
ed.
> +# Padding with a fixedbit_elt of all '.' is an easy way to accomplish th=
at.

What is a format that doesn't specify the full 32 bits useful for?
Do you have an example of one?

> +#
> +# A field_ref incorporates a field by reference.  This is the only way t=
o
> +# add a complex field to a format.  A field may be renamed in the proces=
s
> +# via assignment to another identifier.  This is intended to allow the
> +# same argument set be used with disjoint named fields.
> +#
> +# A single args_ref may specify an argument set to use for the format.
> +# The set of fields in the format must be a subset of the arguments in
> +# the argument set.  If an argument set is not specified, one will be
> +# inferred from the set of fields.
> +#
> +# It is recommended, but not required, that all field_ref and args_ref
> +# appear at the end of the line, not interleaving with fixedbit_elf or
> +# field_elt.
> +#
> +# Format examples:
> +#
> +#   @opr    ...... ra:5 rb:5 ... 0 ....... rc:5
> +#   @opi    ...... ra:5 lit:8    1 ....... rc:5
> +#
> +## Pattern syntax:
> +#
> +# pat_def      :=3D identifier ( pat_elt )+
> +# pat_elt      :=3D fixedbit_elt | field_elt | field_ref
> +#               | args_ref | fmt_ref | const_elt
> +# fmt_ref      :=3D '@' identifier
> +# const_elt    :=3D identifier '=3D' number
> +#
> +# The fixedbit_elt and field_elt specifiers are unchanged from formats.
> +# A pattern that does not specify a named format will have one inferred
> +# from a referenced argument set (if present) and the set of fields.
> +#
> +# A const_elt allows a argument to be set to a constant value.  This may
> +# come in handy when fields overlap between patterns and one has to
> +# include the values in the fixedbit_elt instead.
> +#
> +# The decoder will call a translator function for each pattern matched.
> +#
> +# Pattern examples:
> +#
> +#   addl_r   010000 ..... ..... .... 0000000 ..... @opr
> +#   addl_i   010000 ..... ..... .... 0000000 ..... @opi
> +#
> +# which will, in part, invoke
> +#
> +#   trans_addl_r(ctx, &arg_opr, insn)
> +# and
> +#   trans_addl_i(ctx, &arg_opi, insn)
> +#

I notice in the generated code that all the trans_FOO functions
are global, not file-local. That seems like it's going to lead
to name clashes down the line, especially if/when we ever get
to supporting multiple different target architectures in a single
QEMU binary.

Also from the generated code, "arg_incdec2_pred" &c don't follow
our coding style preference for CamelCase for typedef names. On
the other hand it's not immediately obvious how best to pick
a camelcase approach for them...

> +if sys.version_info >=3D (3, 0):
> +    re_fullmatch =3D re.fullmatch
> +else:
> +    def re_fullmatch(pat, str):
> +        return re.match('^' + pat + '$', str)
> +
> +def output_autogen():
> +    output('/* This file is autogenerated.  */\n\n')

"autogenerated by decodetree.py" might assist some future
person in tracking down how it got generated.

> +
> +def parse_generic(lineno, is_format, name, toks):
> +    """Parse one instruction format from TOKS at LINENO"""
> +    global fields
> +    global arguments
> +    global formats
> +    global patterns
> +    global re_ident
> +
> +    fixedmask =3D 0
> +    fixedbits =3D 0
> +    width =3D 0
> +    flds =3D {}
> +    arg =3D None
> +    fmt =3D None
> +    for t in toks:
> +        # '&Foo' gives a format an explcit argument set.

"explicit"

> +
> +def main():
> +    global arguments
> +    global formats
> +    global patterns
> +    global translate_prefix
> +    global output_file
> +
> +    h_file =3D None
> +    c_file =3D None
> +    decode_function =3D 'decode'
> +
> +    long_opts =3D [ 'decode=3D', 'translate=3D', 'header=3D', 'output=3D=
' ]
> +    try:
> +        (opts, args) =3D getopt.getopt(sys.argv[1:], 'h:o:', long_opts)
> +    except getopt.GetoptError as err:
> +        error(0, err)
> +    for o, a in opts:
> +        if o in ('-h', '--header'):
> +            h_file =3D a
> +        elif o in ('-o', '--output'):
> +            c_file =3D a
> +        elif o =3D=3D '--decode':
> +            decode_function =3D a
> +        elif o =3D=3D '--translate':
> +            translate_prefix =3D a
> +        else:
> +            assert False, 'unhandled option'

A --help would be helpful (as would documenting the command
line syntax in the comment at the top of the file).

thanks
-- PMM
