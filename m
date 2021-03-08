Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1842907lfg;
        Mon, 8 Mar 2021 05:38:03 -0800 (PST)
X-Received: by 2002:a02:a90f:: with SMTP id n15mr23718678jam.110.1615210683718;
        Mon, 08 Mar 2021 05:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615210683; cv=none;
        d=google.com; s=arc-20160816;
        b=JMmtZlBGIhPG07vD9sPPfuvOHQD5Lj8OHJXpFTlwg5fYhvTYmwbcG0NnjdxctxQVM6
         Xud2VrngqUzjU/2hBX6IdMMumfM6EjiL6u0OmwwY9hNlKmlk09vtk1T/OzDpTbSX6d1x
         3rvsrQ7UEP4S91Gdla01ABRXlGQaBmuB9Qd7+gntOZ0r8SMUfsqPFhWpr1NiiSz5mUri
         rPHTDrT+juiBYvf6jyoeX6EHHgGPfS7DcWK56U7K5j+oBeNCa12JPOX4Xd8QStgu+5AJ
         3hsQeFoxSn+PxSRWynO8PJv4SEUJkC5jNHU7LkxpBRCC74hOJ8eUhAban59TMuxGShay
         a99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yRZZ3NmuNmMen6Ygr2JxTxV9jSL4/3wNcB5Wux9QOQU=;
        b=avQAZ2RqQKZ/XIVoR19Dk9pKyR5DoM/KlDqqNh/CGGcAz3JQDkIAatU9kXLc7+j+Iw
         +heM00djXp1JbX/6t9rsPT76TaTjbfWkVMd3EgYsGqHmrfIuCv589e8z9qlt6cBdQ9Gf
         QuiOZpmoQYgqrA4KvMriimySNgSwSe66lpRA3ayiVt7/l4Uo9AT6KLnzvSNsA+5T+567
         4DwQoWNcJsi5wQBx0WrCOwM1M3/nN+nfGOoi6+jz3OdpThaTiOn9pC/ofaOpb+drAIT9
         8Uj8cUWLMqjWTqvdClpE3h10NvijBrpCfw2pYDA4SXCKoRofsL0/iADgCMtmRZ1iAtNr
         ltpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hI4Fy0vi;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p63sor6028474iod.31.2021.03.08.05.38.03
        (Google Transport Security);
        Mon, 08 Mar 2021 05:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hI4Fy0vi;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yRZZ3NmuNmMen6Ygr2JxTxV9jSL4/3wNcB5Wux9QOQU=;
        b=hI4Fy0vi9FW5ST0Gnf6+tO30c9DCA1hwaJlQ6xcJtVAzIcd6JhvGO4VoXrkmlvU0+f
         Uj/YqCQAYkAvxEj08zozGthSjn5jgxrn5qy1s/MSlEU8BT0jAGyQ6UOPG4Y0YIRAVreb
         97pGzQsi2ar2WJsSIDGoO+Og4IX7T/ff9OQ80SuD2cRdWWdmILXtn1AL3lZNCt0Dr3Ro
         aLNf1wNX7JH5t4LmyeEyyrvdMW/ymnvJw69vDTc4htK2Yh5bKCv6QHl1b713lwWz6C1E
         l+t1ollv8tqkIwCpmc1Yej20fwt2+EuydBN3nln03u6nFzRMX88vVwAWL8EjNfp1w5JL
         Fv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yRZZ3NmuNmMen6Ygr2JxTxV9jSL4/3wNcB5Wux9QOQU=;
        b=CPRQ8v9ykdnbimTT7NO7MPkdTWBIll6ZeUte9aLkmCTSrinZV0xRnfUQyLbigluHWo
         4GvoOK583st64oUZDsynjdBZ5tUKjd/tvVutKZqnau4JUS+nJUr05X4QUu3inAhHmpzk
         RPTV0aNiHH34pLXPfSe39qdKbNVXZE/C4w6usUR7RvGZWyIhaLuRcj5qgpX9E0X4d6kt
         +x1yCT1BtxXSFj6X1dLygByNn4jLx8SEAaEyFUaHCcp3gvmy8sBKeOH1lqEmhut62FaN
         4OrJmBEWhiHdR97QjjgIC6V3gKvqP3wAlgPcxb0cia/NgYy45gpDpPsCemNIN/QGUql6
         HQIQ==
X-Gm-Message-State: AOAM5327oKlgUPgk5iryOdhTT6ky2L96aqB8SCR9HRbreaExDdKCpgXC
	Zw2uzzRjXnIctNCWIqM3e66xdF42gUgGFNRBjdw1TjrmgGOnzw==
X-Google-Smtp-Source: ABdhPJxbrEkWSF7CgK3+YztN7QniYLnNxfa+QbAD+wEiitVRABqUoOCUP95BFwKSLtvSjN8vQza4PSYVeXXt4/pireU=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr23025681jap.26.1615210683172;
 Mon, 08 Mar 2021 05:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org> <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com> <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com> <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com> <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
In-Reply-To: <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Mar 2021 08:36:44 -0500
Message-ID: <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Packard <keithp@keithp.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XWM3iIoAzb+f

On Mon, Mar 8, 2021 at 5:10 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 6 Mar 2021 at 16:54, Keith Packard <keithp@keithp.com> wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > > Part of why I asked is that the current RISCV implementation
> > > is just looking at sizeof(target_ulong); but the qemu-system-riscv64
> > > executable AIUI now supports emulating both "this is a 64 bit
> > > guest CPU" and "this is a 32 bit host CPU", and so looking at
> > > a QEMU-compile-time value like "sizeof(target_ulong)" will
> > > produce the wrong answer for 32-bit CPUs emulated in
> > > the qemu-system-riscv64 binary. My guess is maybe
> > > it should be looking at the result of riscv_cpu_is_32bit() instead.
> >
> > Wow. I read through the code and couldn't find anything that looked like
> > it supported that, sounds like I must have missed something?

riscv_cpu_is_32bit() is somewhat new, so it might not have been there
when you wrote the patches.

>
> I thought Alistair had done that work (which brings riscv into
> line with the other 32/64 bit QEMU targets, which all support
> the 32-bit CPU types in the 64-bit-capable executable). But maybe
> it hasn't landed in master yet?

I have started on the effort, but I have not finished yet. Adding
riscv_cpu_is_32bit() was the first step there and I have some more
patches locally but I don't have anything working yet.

Alistair

>
> thanks
> -- PMM
