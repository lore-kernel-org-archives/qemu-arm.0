Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3920370ejx;
        Tue, 8 Nov 2022 05:54:15 -0800 (PST)
X-Received: by 2002:a17:90b:3594:b0:213:bf67:4d50 with SMTP id mm20-20020a17090b359400b00213bf674d50mr54692739pjb.32.1667915654839;
        Tue, 08 Nov 2022 05:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667915654; cv=none;
        d=google.com; s=arc-20160816;
        b=RQ/Iyw15IoyThemFH5yjI/qR7Twy8q6fKOmr0f0DqINRVzxpZGJ+CwEzKJF7LtYyUR
         vYpKSCX/Td4YpybmvsL3GPcDYwVdIp9F9QnJcdI33djsjBN/wATGcX8PiRTK+MlXi+VQ
         7+QGuCWzPJ8kXqlwiTcYIk0zNIMqxpIc0XSCpZ8BXgTsLo2hKwSAKWe9ACliLsMPzbNE
         FQTAZl/oNmnQ/r/9Y4tKBBRq3jAqSwVD63Kokq3U29ZRCdJbjcAsh7vneZlrtggyvNT8
         Z+rsY1c1qhOJjNFLy16dqmPgO47UvTqeS8MTuOKYtt1dsw42hi+v5ZAvuD083NwXqsks
         y4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LligLA02rgybM0rqciJkrzq+sTunsvgYrYQnCuJa3mE=;
        b=xFXaRAbn/ZL5F7rYK6xPgtUnEwj5bzD5jh5pKEg/VGEvaAXEZA4rHINXo3QNPlytEL
         odII80zwWdU+h4EySb9Dbd1G82G4QA266Yp+BmAY4kk/Nm5ih8zrG9+wU6bbJ1bpuTTU
         AmtT17szDw3aPuS0wLFHKY/xyzfj7GR3GurWG/yiglgMF2c8K8/3XveXTZ9HVRWNq54j
         X/oTqd3pqSo1thPVsWXjoC5llU73LgsELLF71qtYg6u5CVrlpj14xedkwD5He3vtKAfh
         GPalqvIlMu+dVj49f3nFWoVcD1VFiZ2jE8ONM0cA+EXsqUD6B5AoUFH8KshqYG9OP4dR
         nvrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sU91FQmW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c11-20020a170902f30b00b0018049353467sor4604403ple.171.2022.11.08.05.54.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Nov 2022 05:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sU91FQmW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LligLA02rgybM0rqciJkrzq+sTunsvgYrYQnCuJa3mE=;
        b=sU91FQmW5PGaNz8OJUZSFNXylTnOTy1ZkA9lG/b899TlavvD45IOjWYKt5izD8tJaj
         DTNx0ljdsvstcX1gmrkzDiGhO1EhDVhRokJyZTDGdw363ny3DRKyiIuHwZCfexy5iba5
         VSOI2xKnUcrUVsiaTQtO2inZlRUqpXcJlUbMxqzECLpWMpSg18sOP+mEBEvJfo85sN4e
         IwrghCNz+I1ezTyZPMETwfkO731MEAZr8l51n39d3/uXGTTF013oQ3tsO/b5aNCTVJkw
         pWRbRlb4VuJAZBTLhhF78gaK/tUrTSXUT2yP2JGVc4DeAo2WapVSStxUnBxwxt4PxuZG
         U9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LligLA02rgybM0rqciJkrzq+sTunsvgYrYQnCuJa3mE=;
        b=vjwZmPvsbCjH7ZPmnykPapdQ8hpYVTJjbKu65W8+0eTLdZcTMRH7NFyJP4GHU5NgXf
         zOhv6ItyhPgZYA2Kvga6MHeDoA+eM+YqtmfBRz2TQ8KWsl/u/JvaSutkrtWQEZTxS1gT
         iwBbp47UL7Dh1DX4PiZd7/UKev8dz5VB82czIIejGIVKqkcJB4zmDEibVuXWJGNNqHOT
         aUTD7Fl9j65LittZvzB8oAUqxinuuCZbiGSWIFqqDkSMZ8Txu56EfKByKUTW9ewwzEJc
         HMJtIgO+4ifRXKR/jd4xIClSLLlWLFSdAKOzmDCZvKeryfrl5uEkRj/stQEtIthn2TTk
         4mTA==
X-Gm-Message-State: ACrzQf3okbT/r0Ajfz1K4COVtw87TLD+8udHFcgTs+HAVJCumSwTJPqP
	KS/m0xbXuar14x8K3rK1h+myHdYLUOeRYXOIDckU95gj
X-Google-Smtp-Source: AMsMyM7l3UV+tabcCQd4vZGwNiBl25EyCEGCA/HT+tN9Z9U56kl5a/JEvLtnvPheESuCzwHd93lbKxcsJvSI7JhbpHY=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr56093144plb.60.1667915654375; Tue, 08
 Nov 2022 05:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
In-Reply-To: <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 13:54:02 +0000
Message-ID: <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hO2+xoX5goyP

On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > There is a whole comment in boot.c talking about keeping initrd within
> > lowmem:
> >
> >     /*
> >      * We want to put the initrd far enough into RAM that when the
> >      * kernel is uncompressed it will not clobber the initrd. However
> >      * on boards without much RAM we must ensure that we still leave
> >      * enough room for a decent sized initrd, and on boards with large
> >      * amounts of RAM we must avoid the initrd being so far up in RAM
> >      * that it is outside lowmem and inaccessible to the kernel.
> >      * So for boards with less  than 256MB of RAM we put the initrd
> >      * halfway into RAM, and for boards with 256MB of RAM or more we pu=
t
> >      * the initrd at 128MB.
> >      * We also refuse to put the initrd somewhere that will definitely
> >      * overlay the kernel we just loaded, though for kernel formats whi=
ch
> >      * don't tell us their exact size (eg self-decompressing 32-bit ker=
nels)
> >      * we might still make a bad choice here.
> >      */
> >
>
> I think this lowmem does not mean below 4GB. and it is to make sure
> the initrd_start > memblock_start_of_DRAM for Linux address range check.

The wording of this comment pre-dates 64-bit CPU support: it
is talking about the requirement in the 32-bit booting doc
https://www.kernel.org/doc/Documentation/arm/Booting
that says
"If an initramfs is in use then, as with the dtb, it must be placed in
a region of memory where the kernel decompressor will not overwrite it
while also with the region which will be covered by the kernel's
low-memory mapping."

So it does mean "below 4GB", because you can't boot a 32-bit kernel
if you don't put the kernel, initrd, etc below 4GB.

thanks
-- PMM
