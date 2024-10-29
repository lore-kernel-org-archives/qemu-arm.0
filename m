Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp550996njj;
        Tue, 29 Oct 2024 14:21:06 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:4a5:e5b6:25d1 with SMTP id ada2fe7eead31-4a8cfb83185mr12206713137.15.1730236866013;
        Tue, 29 Oct 2024 14:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730236865; cv=none;
        d=google.com; s=arc-20240605;
        b=GM8A4D/95li9iBfh5DFXQBQa3ouel4smWN8wlcfWoYi03lHRhs9O9vkeKXzsdNzb7o
         hntIfNRozm6ZDgfFqdPWlbo0rjsd9ZwFtO8B6nlzpwqE0hzXXmjTZlIBPcSZbICoZAv/
         BrBm30wnJjb/E3kXcd37gop12FwxnDPx0OPA4lA18/yxc6RO4XVAscDJupzpQxbEbH1M
         c/0oGFpyh5gabb2x3lCDIFDqv9yrorPdzMhQXwNTsA+4tilIZh/+O6oaqA4RbrVAfgDH
         nGQ1Fhqf+BniLI77y2KdSxSCQtJIl17Yi4W0cy284DlqbzlcwLaTeuEzUuyvvhL0fyRe
         qB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vM4TwgSByAwjE/8uPmOkWGdQzOQ04DQhkwgOetgVghY=;
        fh=3xyYzkKeA3JtDjLKVEnOzljpFRwT6zGEOAjXqvseqIg=;
        b=Hdc1LS6/17nxwN8wTyrKke98KaIWZcXc1RXG3fFXc7u38kIxV2K/iHRS5mO1gYNbQ3
         EioSPmA2OHiLcXjj1Md0iCWOPwy9dFsKA4RQXWKwEm8FRcv3IuyD2HX+TJ6fu86yM0/A
         59KPBYtEKiXOXAV8VcKGffCLzjQIJyqsSUCVMzC9A+9guojWZ5kR44pRajMMRttJMNZz
         2V99UISsz91iLjE53dCg14I56AQK+gSlkRiJ4uALC2svTf+5DLGSyY/MrCtjZpiNhHA7
         QTdD6a1n0P9eDXw9/+NDlxRgUMnRzuVp8Qvn1u8v/jOTVu/GL7ryN4p2GCtGtEwBfLE4
         w1Wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e+Nr6fh8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by domain of phil@philjordan.eu) smtp.mailfrom=phil@philjordan.eu;
       dara=neutral header.i=@linaro.org
Return-Path: <phil@philjordan.eu>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1e0cc1a2514c-85580a6a7a0sor1660281241.2.2024.10.29.14.21.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Oct 2024 14:21:05 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by domain of phil@philjordan.eu) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e+Nr6fh8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by domain of phil@philjordan.eu) smtp.mailfrom=phil@philjordan.eu;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730236865; x=1730841665; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vM4TwgSByAwjE/8uPmOkWGdQzOQ04DQhkwgOetgVghY=;
        b=e+Nr6fh8bqaENQRviuTkfw8frvrqC/oEETKxMEki2yKKjAbWII5GCrE6U6kDk1X2D6
         ttMBuhQCvrUa+A/6B4oQB+J4O2dnVmZ8eZj/XcrZCTP1WWEXkgnEK8IWjwDqCJ3f9QmX
         FaGjA2xxkqGDfmD0qx7KnRVZuQ4Jjm+INMwdHdntkAugxdWqPMADpW+bEplVwhOG3bkP
         bcyNp6G34H+DQKvFaV5a7ReqjUUqEVOCDnPMo5u1mOculskxfQhYKVAg3CUB9EqkQ8u1
         h1EWwVyGuwN8CQtgGYP7YX+n5WMGlXRXtm4lyAV/XowkclmVn8N1xx4RqfEE9mF6XPkY
         GGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730236865; x=1730841665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM4TwgSByAwjE/8uPmOkWGdQzOQ04DQhkwgOetgVghY=;
        b=jKjKRAv/Sxxr+qBFzc+KzPY/0YX8YqrSws0VDPsDoTsRfftPWfRN7wcEOAsqwxNGA3
         rlvxNyJLE/9cn6LHJBzyyDnReSAAu1JVnH7MBJ/2H4yN7JGonlr0py8GCp0uTo1NbVCX
         FvwiqxSVTrJ9/Epn6tE5v6cxOci6idOBVR/Lh9bjcrlZhJIAh/GK8pEYOf+/BYqxVE4q
         YPrcL1hRHZrZBIaskBhw7NUHXtM5kjx6vCIItaiXgEeHJbMnFgcVxEzpb15bAsHrG8wO
         jMwclU1QClxybKNoD0b/mv6WP07+YDvSUsmphC2DEybeio+bJN7lhZR8YPLICHtuoB1z
         bJ+g==
X-Gm-Message-State: AOJu0YzNYIH8gO1HzPGMvD8zXqu9uW0EF8UnTS8LAjCUrolVf7J7Q5/8
	zAesgFlu/zV5b0oRLZNNq+snanKlqR6ppZKVIWUskRkrwqYWtEnQmn7bM+6A8+eeFxjOoLTKBDd
	92HeA6oA34FNiGISu8v+NlW50AIIzaqeuppEuBRGXTpUjoqv29Q==
X-Google-Smtp-Source: AGHT+IFCZUDVtQPvXMT+DM7TUBuVOxKbphCii00tVwzsU2yHo08+YD7nTKeDPcXYYXsva8aRFM6sBzrlzGHvK2Njfoo=
X-Received: by 2002:a05:6102:f13:b0:4a4:9194:d2c1 with SMTP id
 ada2fe7eead31-4a8cfd72365mr11581446137.27.1730236864115; Tue, 29 Oct 2024
 14:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240928085727.56883-1-phil@philjordan.eu> <871q0xmwzb.fsf@draig.linaro.org>
In-Reply-To: <871q0xmwzb.fsf@draig.linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Tue, 29 Oct 2024 22:20:53 +0100
Message-ID: <CAAibmn0wc6a-BM+kC6MJDTAFJoaAR4cVnVd6dr1G6eC8Lt_QBw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] macOS PV Graphics and new vmapple machine type
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org, 
	pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
	marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com, 
	slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
	marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
	chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com, philmd@linaro.org, 
	shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
	bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
	zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, 
	berrange@redhat.com, akihiko.odaki@daynix.com, qemu-arm@nongnu.org, 
	qemu-block@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a9d1580625a42988"
X-TUID: QSBhcFZSklwQ

--000000000000a9d1580625a42988
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Oct 2024 at 10:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> > There are currently a few limitations to this which aren't intrinsic,
> > just imperfect emulation of the VZF, but it's good enough to be just
> > about usable for some purposes:
> >
> >  * macOS 12 guests only. Versions 13+ currently fail during early boot.
> >  * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some difference=
s
> >    between Apple M series CPUs and TCG's aarch64 implementation? macOS
> >    hosts only because ParavirtualizedGraphics.framework is a black box
> >    implementing most of the logic behind the apple-gfx device.)
>
> We don't currently have TCG CPU models for the Apple Silicon processors.
> They are not too hard to add (basically setting the correct ID register
> bits, c.f. aarch64_neoverse_n1_initfn for an example). However that
> would only cover Aarch64 architectural features. We do no modelling of
> the extra instructions that Apple added (although in theory that should
> only be run in Apples own ML libraries).
>

This really isn't my area of expertise, and I don't see myself attempting
to make it work with TCG. Given that the OS only boots with the PV graphics
device, you can only really use this machine type on a macOS host, so there
aren't many reasons to use TCG over HVF. I suppose it might make debugging
the myriad other rough edges easier!

--000000000000a9d1580625a42988
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Oct 2024 at 10:06, Alex Ben=
n=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
&gt; There are currently a few limitations to this which aren&#39;t intrins=
ic,<br>
&gt; just imperfect emulation of the VZF, but it&#39;s good enough to be ju=
st<br>
&gt; about usable for some purposes:<br>
&gt;<br>
&gt;=C2=A0 * macOS 12 guests only. Versions 13+ currently fail during early=
 boot.<br>
&gt;=C2=A0 * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some diff=
erences<br>
&gt;=C2=A0 =C2=A0 between Apple M series CPUs and TCG&#39;s aarch64 impleme=
ntation? macOS<br>
&gt;=C2=A0 =C2=A0 hosts only because ParavirtualizedGraphics.framework is a=
 black box<br>
&gt;=C2=A0 =C2=A0 implementing most of the logic behind the apple-gfx devic=
e.)<br>
<br>
We don&#39;t currently have TCG CPU models for the Apple Silicon processors=
.<br>
They are not too hard to add (basically setting the correct ID register<br>
bits, c.f. aarch64_neoverse_n1_initfn for an example). However that<br>
would only cover Aarch64 architectural features. We do no modelling of<br>
the extra instructions that Apple added (although in theory that should<br>
only be run in Apples own ML libraries).<br></blockquote><div><br></div><di=
v>This really isn&#39;t my area of expertise, and I don&#39;t see myself at=
tempting to make it work with TCG. Given that the OS only boots with the PV=
 graphics device, you can only really use this machine type on a macOS host=
, so there aren&#39;t many reasons to use TCG over HVF. I suppose it might =
make debugging the myriad other rough edges easier!</div><div><br></div><di=
v><br></div></div></div>

--000000000000a9d1580625a42988--
