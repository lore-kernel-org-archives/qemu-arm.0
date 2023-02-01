Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp251490ejb;
        Tue, 31 Jan 2023 21:46:07 -0800 (PST)
X-Received: by 2002:a05:6402:1505:b0:4a2:254f:6b1a with SMTP id f5-20020a056402150500b004a2254f6b1amr718866edw.11.1675230367648;
        Tue, 31 Jan 2023 21:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675230367; cv=none;
        d=google.com; s=arc-20160816;
        b=PyNSKgqMDjS5gt7xJzn/rx6STtpS+OX75FemUrvntLW7VRC/coDOQNWNSQkSV1x+Dr
         eLAa4OAdx9VFP9EGvxVNShh6Xm4bwmBAB3ejPR9uLP81hzsKjkrGyW5rVE/avSGEq6GS
         sO3UF4Kdwgxg2nHXHl+fEqFiMCleqIDJ+sqijqd/dfoMvsetVwCV2JQ3aKKjH2Jf9Fjg
         8q38OTM/fADI8jDV9qY8/meOEH82rU4b5DvFzlejQMMXmCBDNaUb6RfeRUzLz7PcpW5j
         MgaK+Mq7IIOeAHx5o60DYR8PmJ7s6q2Hq3VIGw0wK+ttqFO1kuCKe3dk4UdjnmshS/I7
         xwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WnIT0gyJ7a7z0k/MzNTbP6PIX/2r5Z1ysnVnvNAbbrg=;
        b=WEEpCfwy+v3r/pGPqQTT5r+0bJHVL6FXnpsZzkAs7pE1bPxhUZ2jAW5AT0ambFOnWT
         aFg83aJ2xc8SG90mXTXBQRdDnXVQNNPdHbrQVLAWhTcVdIpTaFJfe6A31KeZFcqPH09z
         n8KbV1Xv/6f36moNke3G6vBE2K+OMxeDIcupQcxOI1s7A3RjqC8Zk3kstQelFiMvh9xg
         LfSxqbYAoderxa3cutRgSHOwZS4jgrKXmV5DtICRym5k5QkWXJXyOEAMCkPC/AL4EicH
         iYm+c5I+FmK733m3Eviisq+wdqrN8PDpnBMYklyEFW6Zl3jayZOnOBFQdivW3yjs+R9V
         yIDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=OsJhzbwc;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10-20020a1709066bca00b0087bdacbb929sor7628249ejs.25.2023.01.31.21.46.07
        (Google Transport Security);
        Tue, 31 Jan 2023 21:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=OsJhzbwc;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnIT0gyJ7a7z0k/MzNTbP6PIX/2r5Z1ysnVnvNAbbrg=;
        b=OsJhzbwcPKDe8FG2pykn1jG8whalvpwo2YfR87t0zkhrYrr86Olw7a8/BvdrSqQ0oD
         2HV2WTB/2IrTyBAl7MOiYaQbTLEczRQfGUZXoVEHsXImcv1pmlw/P9+A68YR42E48SLV
         vunyTmFOCLrc7Tl84YUm5LWbGAzoSIdSCBhAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnIT0gyJ7a7z0k/MzNTbP6PIX/2r5Z1ysnVnvNAbbrg=;
        b=ChHzf8LTZ57ECM3X2431stqAoV3BwV8fTsM1dHLsrkewNzOkKCkYCEZuw2k5nBQw0q
         pjSFwn1jZBxrNR81YfQfwyHsuuK9sCoNRFKvygNsKNjZp9R72+Q0ko6RDOkf/A/iYbTh
         2ol0wVFSjo1Cw90qGPwn5BJLxj6Ll7KR/QYOvsQw0aooIaqzhHkkp6JlRWgMIIBVqbB4
         Vt9EZN3KgzuPT5wdlegEL7w/FF7cIhsbyQkZesbT6EPSqWx7L/noJUgP79PKq4Vcwix9
         g/+CONGi8CyPL20HlEJDwZOrsEO6IH4JcxraELn2hSxEnFNxRVZmoLiXw3IQelcqGlPG
         mq1g==
X-Gm-Message-State: AO0yUKX1YOEzlEvw0eZZBVUyX1S9ASc3in1v3gcNQbsh99HUjsQl+y6q
	JdMolTEmG+X5/xe+Y1BQPygperZ9whXiaYqrImg=
X-Google-Smtp-Source: AK7set9FcbzThg/7R/HM/0n0mCd1jEOgszkhi/+W/e0WsnMOx7KFW5vmmrSliR2VxIqA0wnKCuSxdmExlBl2NqsFk50=
X-Received: by 2002:a17:906:e2d8:b0:88a:119:4d98 with SMTP id
 gr24-20020a170906e2d800b0088a01194d98mr285640ejb.111.1675230367114; Tue, 31
 Jan 2023 21:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org> <20230119123449.531826-10-clg@kaod.org>
In-Reply-To: <20230119123449.531826-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:45:54 +0000
Message-ID: <CACPK8XeiDT9N9RbdEat4WyC=HPyTuNL+1-oM9WLBCgETUxkvTA@mail.gmail.com>
Subject: Re: [PATCH 09/25] hw/core/loader: Remove declarations of option_rom_has_mr/rom_file_has_mr
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3bqQaFCGMPRy

On Thu, 19 Jan 2023 at 12:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
> option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish clean=
up.
>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/loader.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 70248e0da7..1384796a4b 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -251,9 +251,6 @@ void pstrcpy_targphys(const char *name,
>                        hwaddr dest, int buf_size,
>                        const char *source);
>
> -extern bool option_rom_has_mr;
> -extern bool rom_file_has_mr;
> -
>  ssize_t rom_add_file(const char *file, const char *fw_dir,
>                       hwaddr addr, int32_t bootindex,
>                       bool option_rom, MemoryRegion *mr, AddressSpace *as=
);
> --
> 2.39.0
>
>
