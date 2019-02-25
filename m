Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10001098wrx;
        Mon, 25 Feb 2019 06:35:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaWpCMea1h1Eq9b6mZNdDbHoDqtJMKVdD95gxPqnlqfmvJd+vDCvqfZLHqLEugv/cAp9w4m
X-Received: by 2002:a25:bcc9:: with SMTP id l9mr12668923ybm.324.1551105303618;
        Mon, 25 Feb 2019 06:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551105303; cv=none;
        d=google.com; s=arc-20160816;
        b=Yp2dx41wCSrQe6o5Vx9wSMUAq7hUejIPWYiECaEpvoYASZRFXJuZkwQzqpcX9EaTBw
         xnZGzcpcAFfarpowVufzVLtO4+L08OpPnTpnqEcDuECvndXAyHIl3nA+lP9n7TsqFy88
         wC6dMjh4qUjd01v4jdzjKCPU55Cec+LUmiJ4avxJLJg0fARnLs4XFulMNxM0XX9GQ2Pk
         PPEv9XkNLoIlG21RRZCCVjLoTtd9P7Ltkenrl/N0H9Sx4hz52/fkvEE7yOc/pMBejBGs
         tVI6tKrgtJrNPyIddiT7gl65Kje9hrF99pBo+3qwRhod/hlZlsJNqUpYvof6hKE10Ovo
         26QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI3Yyf+eSJBUhahiOmIrRgBP5o83HHx/WSTbFLV76PA=;
        b=GAQpbfJYqZwluSmOLH5z9pVG6xn7qBvHfxiLUneXdNTWmDKytrmBPSyQKAORljoznY
         ArClNv8781++aAcSSFIXwTpQYEuXLpRknr9d1LobbGp3wSxlcQwqp5XwlX6DoB9vh39e
         1RUDWy3RApTIEPeAIeUKH4/C1cqrlA5j00Mrmu6/83qIktsyfEh93NFMF9FEHyFL2jgT
         sRKX1pbs5lEhOh4k8EL6rIqf2m3W9mwDgAXQZLrgolxoKljuZkNTJXXlrECzI8N6bvch
         xquySN5v0VvXCj+X/sxwtDI0CfIGGUKNeG6O9AB5hVfAX7LP/68q7OerHRPjXk87TluK
         6LTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zn90Ufr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si5276471ybk.349.2019.02.25.06.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 06:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zn90Ufr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyHLT-00080Q-4j
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 09:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHLC-00080E-Sf
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHLB-0001B8-Uu
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:34:46 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44625)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gyHLB-0001A8-GK
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:34:45 -0500
Received: by mail-oi1-x244.google.com with SMTP id a81so7355039oii.11
	for <qemu-arm@nongnu.org>; Mon, 25 Feb 2019 06:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sI3Yyf+eSJBUhahiOmIrRgBP5o83HHx/WSTbFLV76PA=;
	b=zn90Ufr8QZZEqc01DaCh6vtSLy/R1mER/wWYzMiOphUy83ew4ItR9kChmiMugceTeq
	iBnrnWg5ebDO5AyGmkvLerSsGnpez+6iC/DuxS4eYY9CWFvcdCRudeE0hnwhu4EwQ7V3
	HnDL+Kz9QbPZ9oIGPAanRPhftKoTY+0LdGRyugVA7bywuvB0SRzo7Pi9yTA8z+zT+UeK
	DpZWwkhpJxeZqNvrdhi6dN0eer9MLfDa8APtnBZcLb6u9jEpmeHL2ERf89NHLI1u6WfE
	XjB0D60bSsB1GpkWRK59OoJgSDvcCXIcV8yxQAkPWjg8hbMQA/jdcQLZIAjD7x9unfiJ
	uI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sI3Yyf+eSJBUhahiOmIrRgBP5o83HHx/WSTbFLV76PA=;
	b=t6eDWkn/IV+CyRLpISCgwYwDiOKBhapRr+tBKQ1IvccSqZaC+iBR5FeKpxVXRoDF45
	I7rkspPuLqpnCzdNUyWH9jue+2qZLXZs6imZVrih/uykgfWiGqtL4/76mZjaZcwylaO9
	FgdCS9/67IQjTqXCyPy3AceVnc7zyUzBZo/dbfvs/7W6dptssCMF3aIsnADwP7tew6NV
	oaZT2vTQHaKmlhbDeNgbZilTqp5kaIAMF92uhDS+5ZBR6jPzdOUKQBkHKGwJ+J9uJ0Xg
	7+y7wGzhocxelTgSMtdYWAuHQOnObLk9Mkqr9xfv2OBi4HAFvuqbnOOuK3CW60GaZfvw
	qmIw==
X-Gm-Message-State: AHQUAuayvMyAKcSyiITu1ebe2ZbETh2duYMPm5k0hytfhzIqqkvosgLp
	BChy1jD1nyLNPGlu1BfuzdDN5fqk1EFRqTJJYU6bZLuf
X-Received: by 2002:aca:b341:: with SMTP id c62mr10624360oif.112.1551105281761;
	Mon, 25 Feb 2019 06:34:41 -0800 (PST)
MIME-Version: 1.0
References: <CADdcL-_0R4fPFjyMZMHWy43iB=F6Y_ZF1F3CbhMAd_Kv0MsatA@mail.gmail.com>
In-Reply-To: <CADdcL-_0R4fPFjyMZMHWy43iB=F6Y_ZF1F3CbhMAd_Kv0MsatA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Feb 2019 14:34:30 +0000
Message-ID: <CAFEAcA8kPURbMiVfEdg0qMOuZcNhfNVnvYP_C3FxXyEcXrpDEQ@mail.gmail.com>
To: Benny Baraz <benny.baraz@hexatier.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] ARMv8 (aarch64) emulator
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
X-TUID: ycNL4v64YkNK

On Mon, 25 Feb 2019 at 14:18, Benny Baraz <benny.baraz@hexatier.com> wrote:
>
> Hi,
>
> I have to run ARMv8 (aarch64) emulator.
>
> I have created an image centos7-arm.img with
> qemu-img create -f qcow2 centos7-arm.img 40G
>
> I run the qemu-system-aarch64 on Fedora on Xen.
> (particularly
> qemu-system-aarch64 -boot d -cdrom /root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda  centos7-arm.img -machine virt
> )
>
> But there is a challenge - it answers
> Unable to init server: Could not connect: Connection refused
> gtk initialization failed

This looks like the problem is just that you are not set up
to be able to run graphical (X) programs on wherever you're
running this: it's not specific to QEMU.

You should start by checking whether you can run other graphical
programs, like "xclock" or "xlogo". If not, then you need
to fix that first. Or use one of QEMU's other UI frontends,
like Spice or VNC, which can run over the network.

Alternatively, if your guest image can be configured to use
a serial console then you can tell QEMU to use a serial
port with "-nographic". But this will only produce output
if the guest is sending it there -- you would need to
investigate how to get Centos to do that.

https://translatedcode.wordpress.com/2017/07/24/installing-debian-on-qemus-64-bit-arm-virt-board/
has instructions on how to install Debian via a serial console;
I haven't ever tried Centos.

thanks
-- PMM
