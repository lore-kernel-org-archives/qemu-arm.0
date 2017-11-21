Received: by 10.223.159.82 with SMTP id f18csp595862wrg;
        Tue, 21 Nov 2017 04:06:29 -0800 (PST)
X-Received: by 10.28.137.5 with SMTP id l5mr1041920wmd.123.1511265989770;
        Tue, 21 Nov 2017 04:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511265989; cv=none;
        d=google.com; s=arc-20160816;
        b=e+hALwCN7krkm+5BkMbLh0hMNv7lxnGjD/poi15MH/Mxp43CsviUYzswK1LYCChO/j
         oQkB+N3jMGDXXDYTMDOOHWWNrZMao1wd3pvhmK96/vhTdoKDUQ5lUs1KrjlgVfjU7yyO
         Vd63tjtvMqwaQEW3VqC7kUBVFTAZoHK75E093x+1CNjOXZK0DMjpPHCbAsUUHo5nh874
         S2Eh9p5snSGyjyAet2UC3H2vU+C8N4CGDzEuvV5LPgxE4XPKPlJrjZWEmnSycRWii+fl
         VkJ7Zc19IG7uDaGZWrI6FEWy6DicwaqzD3rcGN/IqvuztmZiGt5WmJJtdy6TCv2rajHK
         2/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=W0GSlBXm4VaujmoDsY2FwA69eO28eONcxWID3n/vNHk=;
        b=xeht5Y5WuaB+efbEEdTuWZ4qmjyNcerXPMkkMCwD95ewXHpoPPwyA3ONawWdj8QL2H
         6v46ugGMoCVveU9/Q1NtCI5OCK2nkq4A7Tnh/iLfbhLBCS42lBOyHycFAVzyNiOFRukr
         FurEa424GSLECju4lCVI+FIA9KXStn6Kmt6HLhs97MX+rz1iuc+RbzJc2dm+zEG0Qlca
         HGeVvdzPX8ED5n0yTkSlsAMrMHlokjSpmaizB1AC47ec/0K05MAbdWQ85VxQVfxMS+++
         FAk8hNBXF+SlZgEXnBLCjavA9nEzcxGQ1E85LzfqUleOo0VLXplbmbHG9hxhT+gNNlg6
         6Mtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTVULywU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 56sor4724615wrx.88.2017.11.21.04.06.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Nov 2017 04:06:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTVULywU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W0GSlBXm4VaujmoDsY2FwA69eO28eONcxWID3n/vNHk=;
        b=GTVULywU3rgAz4dP/fkcZS/SOc8HiVfmhZHPWsE7tnqs17osGzg9WFOy3bJm0kUAsV
         RFUbGJqO1ovAdbWI0gtvLbtzXHXDFOE9VKijThpc7dCO1ImqLy0QQeM7bB4u7FfkMrzF
         sHyijQ9p5G7WLxsl9WiMg0r+QuDnGmUywpu3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W0GSlBXm4VaujmoDsY2FwA69eO28eONcxWID3n/vNHk=;
        b=R6Jf56pIkrA4KhRTA8krfl2r7fecUO18pSCWs3QH4vcJXDHdnVVYuy72q50sU1ASqD
         6v5DxCMVzT6mq6qhwcO+PpA6uYzP5hTGXiyzZ9wpL0jWDIpuAGqg7WQaI21sFLE1ue3o
         BwBzyXgT3tP6Gfwfbgf+lTiBARVO4bCflWZJoknZ7Vhnravw7qVjPrmFvTVkm6CXNkvh
         ZMgtVEVSc5Q2kcSN+3bhQrO0BLEDyI33kk2Xnp9IyHUd3DadE+9hrrKmttduFVNjuyTY
         EOpIF89RPqAFkOBd9b2BITfrI3MVgtbC99homhdh7lD2e6qk47AoEYjc3gIqhztxyH3n
         ZjfQ==
X-Gm-Message-State: AJaThX7IUqQdw+NfwTGwKz2z6iNfDcXYYPHy41xtFDzAg3e3ZVatBh/Y
	MG4qFf0mdNNmxiXJcAZHlJi2ldLjqr5BLjavwbeudewgNZ8=
X-Google-Smtp-Source: AGs4zMYXPkfX161/Y7OPiAxmY68hlwNehBK29CfQ14aSKhRuQMsH8usbkRFGNGx8hDWgUyajcFy1tlT8h7B4J4v8Hwo=
X-Received: by 10.223.175.100 with SMTP id z91mr13498756wrc.138.1511265989173;
 Tue, 21 Nov 2017 04:06:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.187.195 with HTTP; Tue, 21 Nov 2017 04:06:08 -0800 (PST)
In-Reply-To: <20171031145444.13766-7-alex.bennee@linaro.org>
References: <20171031145444.13766-1-alex.bennee@linaro.org> <20171031145444.13766-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 12:06:08 +0000
Message-ID: <CAFEAcA8X-Nv7i5EOMR=WvAtjXfuSyoQCd6ntCY7T99t4J6H45A@mail.gmail.com>
Subject: Re: [RISU PATCH 6/7] risugen: support @GroupName in risu files
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: lZyqtEiB3UKm

On 31 October 2017 at 14:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> The existing pattern support is useful but it does get a little
> tedious when faced with large groups of instructions. This introduces
> the concept of a @GroupName which can be sprinkled in the risu
> definition and is attached to all instructions following its
> definition until the next group or an empty group "@" is specified.
>
> It can be combined with the existing pattern support to do things
> like:
>
>   ./risugen --group AdvSIMDAcrossVector --not-pattern ".*_RES" aarch64.ri=
su foo.bin
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


I think the general idea here is fine but some extra checking
of syntax in the implementation would be good.


> ---
>  README  | 10 ++++++++++
>  risugen | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/README b/README
> index 312e9cd..9946e6e 100644
> --- a/README
> +++ b/README
> @@ -75,6 +75,10 @@ reads the configuration file arm.risu, and generates 1=
0000 instructions
>  based on the instruction patterns matching the regular expression
>  "VQSHL.*imm.*". The resulting binary is written to vqshlimm.out.
>
> +An alternative to using regular expression patterns is to use the
> +--group specifier. This relies on the configuration file having been
> +annotated with suitable @ markers.

If I say "--group foo --group bar" am I asking for insns which
are in both group foo and bar, or insns which are in either
foo or bar or both ?

> +
>  This binary can then be passed to the risu program, which is
>  written in C. You need to run risu on both an ARM native target
>  and on the program under test. The ARM native system is the 'master'
> @@ -140,6 +144,12 @@ Lines starting with a '.' are directives to risu/ris=
ugen:
>   * ".mode [thumb|arm]" specifies whether the file contains ARM
>     or Thumb instructions; it must precede all instruction patterns.
>
> +Lines starting with a '@' are a grouping directive. Instructions
> +following will be assigned to a comma separated list of groups. The
> +list of groups is reset at the next '@' directive which may be empty.
> +This provides an alternative method to selecting instructions than RE
> +patterns.
> +
>  Other lines are instruction patterns:
>   insnname encodingname bitfield ... [ [ !blockname ] { blocktext } ]
>  where each bitfield is either:
> diff --git a/risugen b/risugen
> index 8bfb0e9..aba4bb7 100755

> --- a/risugen
> +++ b/risugen
> @@ -34,7 +34,10 @@ my @insn_keys;
>
>  # The arch will be selected based on .mode directive defined in risu fil=
e.
>  my $arch =3D "";
> +# Current group, updated by @GroupName
> +my $insn_group =3D "";
>
> +my @group =3D ();                 # include groups
>  my @pattern_re =3D ();            # include pattern
>  my @not_pattern_re =3D ();        # exclude pattern
>
> @@ -122,6 +125,11 @@ sub parse_config_file($)
>              exit(1);
>          }
>
> +        if ($tokens[0] =3D~ /^@(.*)/ ) {
> +            $insn_group =3D $1;
> +            next;
> +        }

Here, the syntax we're parsing is supposed to be @ followed
by a comma-separated list of groupnames, right? But we treat
everything after the '@ as a single opaque string.
I think we should properly parse this, allowing whitespace
before/after commas, maybe restrict the set of characters
we allow in groupnames, and store them as an array of group
names rather than a raw string.

> +
>          if ($tokens[0] =3D~ /^\./) {
>              parse_risu_directive($file, $seen_pattern, @tokens);
>              next;
> @@ -239,6 +247,9 @@ sub parse_config_file($)
>          $insnrec->{fixedbits} =3D $fixedbits;
>          $insnrec->{fixedbitmask} =3D $fixedbitmask;
>          $insnrec->{fields} =3D [ @fields ];
> +        if (length $insn_group) {
> +            $insnrec->{group} =3D $insn_group;
> +        }
>          $insn_details{$insnname} =3D $insnrec;
>      }
>      close(CFILE) or die "can't close $file: $!";
> @@ -249,6 +260,12 @@ sub select_insn_keys ()
>  {
>      # Get a list of the insn keys which are permitted by the re patterns
>      @insn_keys =3D sort keys %insn_details;
> +    if (@group) {
> +        my $re =3D join("|",@group);
> +        @insn_keys =3D grep {
> +            defined($insn_details{$_}->{group}) &&
> +                grep /$re/, $insn_details{$_}->{group}} @insn_keys

This implementation is implicitly permitting regex characters in
the user-specified --group argument. Is that intentional?
If we store the group names for the insn as an array of names
then we can just check for an explicit match in them against
the user's provided set of names.

> +    }
>      if (@pattern_re) {
>          my $re =3D '\b((' . join(')|(',@pattern_re) . '))\b';
>          @insn_keys =3D grep /$re/, @insn_keys;
> @@ -277,6 +294,7 @@ Valid options:
>      --fpscr n    : set initial FPSCR (arm) or FPCR (aarch64) value (defa=
ult is 0)
>      --condprob p : [ARM only] make instructions conditional with probabi=
lity p
>                     (default is 0, ie all instructions are always execute=
d)
> +    --group name[,name..]: only use instructions in defined groups
>      --pattern re[,re...] : only use instructions matching regular expres=
sion
>                     Each re must match a full word (that is, we match on
>                     the perl regex '\\b((re)|(re))\\b'). This means that
> @@ -305,6 +323,7 @@ sub main()
>      GetOptions( "help" =3D> sub { usage(); exit(0); },
>                  "numinsns=3Di" =3D> \$numinsns,
>                  "fpscr=3Do" =3D> \$fpscr,
> +                "group=3Ds" =3D> \@group,
>                  "pattern=3Ds" =3D> \@pattern_re,
>                  "not-pattern=3Ds" =3D> \@not_pattern_re,
>                  "condprob=3Df" =3D> sub {
> @@ -319,6 +338,7 @@ sub main()
>      # allow "--pattern re,re" and "--pattern re --pattern re"
>      @pattern_re =3D split(/,/,join(',',@pattern_re));
>      @not_pattern_re =3D split(/,/,join(',',@not_pattern_re));
> +    @group =3D split(/,/,join(',',@group));
>
>      if ($#ARGV !=3D 1) {
>          usage();
> --
> 2.14.2

thanks
-- PMM
