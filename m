Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp527265wrh;
        Fri, 26 Apr 2019 05:15:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzy4X4pX/YgCbAvYoY+YVJo4u51LET4IdDg+pw217i5JZ1ArAOON/dgK++oHuLZu760tiMr
X-Received: by 2002:a5d:6987:: with SMTP id g7mr28767653wru.299.1556280932699;
        Fri, 26 Apr 2019 05:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556280932; cv=none;
        d=google.com; s=arc-20160816;
        b=u0drSc+2dUhpaaXks5tLz+oosgOGJm7yjcadFzC0HQY6ryhw+Mnsr0H7Bgbq4WFNDp
         qxGc3ojD+AbURZvqkrAlnaqZIm5f47nao7aEf2rwEImAu2Mnr3zn3lghTH9Zq33akeZo
         Cb57ogeqkSHeQSiFhE02Q3+uu0Rpd6ZezBF9b/haUaP43hzVYLFPvBiGQd2zse5z7JBr
         /a59Xp11p8B+wP51uVfmHNEbzAv1qZg9a4C2SXjeWmE5XAawByGEZcbpXigRd2zD6epP
         vk6PXi7tRGAhJLdBuL0miCo9w/A4ePYle9pCFTmDfNTKu0aulZ3f96lTrwWw2bdf4m5z
         5hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=JhNXNGh515Tl+jXLBPwVw4yVfmme7OaqVOPHASsKSTQ=;
        b=LmfW7uPJABNlMkNBQwoxV9NWjaoNV4snhTn+r5p85SeQTYcwuoxVFhDovDEdJn+vsi
         dNE6UwCj8qzeG9gtDMXiOkStPnVT3giemrTaa20RLKtHM0qIS58fbtB+IiaDyO7ncbdl
         CZNI2i2P10QFVB543IaCW6vj1pTOAHcTCV6TqmaiEZCdWVknONlHjVZhUdQfcjBxVppI
         AIpAD10/0xwsnNgqdivrYMIfky0U9VAmA1WjGb8UA2au8cOxuhk04nTEe8WX9XyVULBg
         vrV8gAE3fZR8V/7/dfbUZCsCWL4qFLmLQvdF06s1swS47IghB8y6behD48bKyRySqSCp
         gg5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGRx8uDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si3339185wre.118.2019.04.26.05.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Apr 2019 05:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGRx8uDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJzlJ-00029c-LU
	for alex.bennee@linaro.org; Fri, 26 Apr 2019 08:15:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hJziI-0008PM-FX
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 08:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hJziG-0005oy-IR
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 08:12:22 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hJziD-0005kH-5P
	for qemu-arm@nongnu.org; Fri, 26 Apr 2019 08:12:18 -0400
Received: by mail-oi1-x243.google.com with SMTP id k10so2725123oik.7
	for <qemu-arm@nongnu.org>; Fri, 26 Apr 2019 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JhNXNGh515Tl+jXLBPwVw4yVfmme7OaqVOPHASsKSTQ=;
	b=QGRx8uDq0v5FinbFwzNiSa96y/bkbnLt331BerJ9yEYOOa3HLA4LReVz6ZlRjSPbYg
	nxTdytyAqHSYaRDFanfdMMm9eLuFIleWIHM+RbojnTMz+68Vhdd0TPjA+dXJNeWkNvhc
	c+Ffi9nNROo6tUlseTMJUjU/INd5qn6AyR7jytXkWXOxqTqg+rLOSVTPlcbN/Ic9wbYk
	T5DOvX81mM6wCI772kgM3zJnrAdjjt4HmtsNxsHOyvt4I3bytbyKvQIwPw8MvzzOglum
	43SlnqDPphEMSJibMOUEd/AAcsmyJ5NQDyRZxoHNfzuq5MXMm9QdMvxoFx8OWp3uoJGP
	5/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JhNXNGh515Tl+jXLBPwVw4yVfmme7OaqVOPHASsKSTQ=;
	b=UDE5qI0pD7nGwww6Ma2A8aAeqH1T/OGqe4ymiqGcfoE0SJkWMHgjrfJJ9rvxAxSMYr
	xmn664/9Z4qxmcvOifg9IAc/C5LQL2dpZJL6klkoN0jEdwXV13QLooIQ44xcxpslmx/z
	QrFVUcZrIH52J4CuHljNyo2l8nLf5H85ZDuzVvFJhCqSk2oO/kx/2CaxHCbvSGwskMcy
	rku5L6LL0Fn9hLEinvnhR/rxACVt7RsDTqStarqz/ljRw4CUtMtrZ0Ckh7h6V6QDRkAk
	1haiqNu1NVmdveo/P6C+06E8qsc9hOF5uXkH72IWph6zdwaDHCSyHjNokn1uJLzLYfSA
	GYlw==
X-Gm-Message-State: APjAAAUk5P9SjfYyDMnvuDFfuCWxFPzDs2gV/WoKI3Xmp4l/JB1j1tj3
	Gr+UcVfsf+Y1lkhXv0t4NC8L5O2fWfGY4goFl+DQPQ==
X-Received: by 2002:a05:6808:301:: with SMTP id
	i1mr3857642oie.163.1556280734491; 
	Fri, 26 Apr 2019 05:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13>
In-Reply-To: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Apr 2019 13:12:02 +0100
Message-ID: <CAFEAcA_bS_Oz+shCU1U5rN_DMP9_osQXXmh470OP1r-9GQ4=ag@mail.gmail.com>
To: =?UTF-8?B?QmrDtnJuIEhhYXNl?= <Bjoern.M.Haase@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] Regression tests for Assembly libraries for
 Cortex-M: More recent qemu versions core-dump or fail with warnings
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cupudBtN6zYq

On Thu, 25 Apr 2019 at 23:33, "Bj=C3=B6rn Haase" <Bjoern.M.Haase@web.de> wr=
ote:
>
> Hello to all,
>
> I'd appreciate some advice on how to
> - simulate a ARM Cortex-M4 system with large amount of RAM
> - together with semihosting (stdin, stdout and files) on the host CPU.
>
> The background of my question is a bit different from the conventional QE=
MU use-case for full-system simulation:
>
> I am working on CC0 crypto libraries for the Arm Cortex-M series (see e.g=
. https://github.com/BjoernMHaase/fe25519). There is a lot of assembly opti=
mization and assembly code-generators behind the scenes which need extensiv=
e tests. I'd like to publish my code together with a regression test librar=
y running on Qemu (specifically regarding the asm stuff). The regression te=
sts best have access to files and need to be executed without the code-size=
-restriction and memory constraints of the tiny embedded targets (which mig=
ht not even allow for stl containers, e.g.).
>
> The problem is that the regression suite code is too big to fit onto any =
embedded target. I.e. I'd need to simulate a cortex-m4 system with, e.g. 25=
6 MByte RAM and with file access using the semihosting support. So just run=
ning on the embedded target is not an option :-(. The use case is, thus, no=
t to simulate real-world CPUs but to simulate CPUs that are not available i=
n the real world.

This is unfortunate, because one of the general principles
we have with QEMU models is "emulate the real world hardware,
don't make things up that don't exist". Heading down the
"make stuff up" path has got us into awkward hard-to-maintain
corners in the past.

> With the older versions of QEMU, I succeeded with using
>
> qemu-system-arm -nographic -monitor null -serial null -semihosting -cpu c=
ortex-m4 -m 256M -M integratorcp -kernel ./test_naclM4

This only ever worked by pure fluke and because your test
code never needed to interact with interrupts or access
any memory-mapped system registers. The integratorcp board
is an A-profile board which does not have an NVIC (which
in QEMU's implementation means that none of the memory
mapped system registers will be present and anything to
do with interrupt handling is likely to crash).
We tightened up our error-checking so that we no longer let
users accidentally create some of these command line
combinations which work only in very restricted cases.

> Unfortunately the more recent versions of QEMU either core-dump or give w=
arnings.
> On Qemo 4.0 I get the result "qemu-system-arm: This board cannot be used =
with Cortex-M CPUs".
> I did some attempts using e.g. the lm3s811evb targets. However, I constan=
tly get failures such as
>
> "qemu-system-arm: Trying to execute code outside RAM or ROM"
>
> most surely since qemu checks for the limitations of this specific microc=
ontroller memory sizes, which I want to exceed intentionally!

Typically the thing that limits the RAM size is the
physical address map of the board -- if the board
doesn't provide lots of RAM then QEMU won't model it.
The lm3s811evb boards are particularly small-ram setups.
The various mps2 boards have 16MB (they are cortex-m3
or cortex-m33, rather than -m4, but we don't have
any -m4 boards at the moment.)

> Also I believe that semihosting will not be supported on any of the nativ=
e cortex-m machines? Any advice would be very appreciated.

All the cortex-m systems support semihosting. (Note
that the ABI for M-profile semihosting is not quite
the same as the A-profile ABI -- it uses a breakpoint
insn, rather than an SVC insn.) You need to enable
it with the -semihosting option, and you can't use
it from non-privileged code (this is the same as the
A-profile semihosting).

> - Is there some documentation on how to add a new machine to the qemu cod=
e? I did not actually find the place where e.g. the lm3s811evb configuratio=
n is stored within the source trees.

There is no documentation -- the best thing to do
is look at existing code (preferably a newer board
model, as we have a lot of old legacy code that's
not written to current best practice). Board models
for Arm systems are in hw/arm/; the mps2 boards are
fairly new and a good example. If you're going to
hack QEMU for this you might be able to find a place
in the MPS2's memory map to put a larger lump of RAM,
rather than writing a whole new board model.

thanks
-- PMM
