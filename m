Received: by 10.28.4.212 with SMTP id 203csp598613wme;
        Fri, 27 Apr 2018 03:36:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrzflnoceoM7YEJEBSPxN9Zn+QhPBxFtbbRBiRJ0+b2wFLwXUbuTsI5BBWDLNM3JqY21nBR
X-Received: by 2002:a0c:9487:: with SMTP id j7-v6mr1370503qvj.104.1524825368922;
        Fri, 27 Apr 2018 03:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524825368; cv=none;
        d=google.com; s=arc-20160816;
        b=FzqX5kaoxpIFe3KvcySuLX62j95jI207lYPN9qz1/oXBqPFJU2YDkze0OUygyk/SkV
         Q60yGn06WhvCyLuMm9Q2xS7+rkZSoKAQOAYOPRjTP7YlK7dxtUtBUecZAnZrQtXCHGas
         ROqLRoSJjcKdrQAWW2RpqoVwcraYXmkPi9HifkCWBbO6IlasiLoZ3WbNIuS8hUvovYhG
         C/z/bDWNRGw9t+2VrhGvmvkho9yO4f7TPslp9xsFcJPsAHcT20GhdBeDoKdfeApiLr34
         Ilmrat3vI1MrH1gGfv7T+TvgkO9KBlyyn++Eh+aCMx2540wcoY87fmAjVShd2v+GEdDg
         u6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aoeCZOm1j2c4tTL9Ex+n9mB3KB/H97dv7qmUFBarg+M=;
        b=HhQvfkg/qsstkq7LpB1qblvOOLItmYt7J4N/xZIvmpQ04Fp9ESlsu6FklvNmfwH6v+
         P/hkxOO/OGd2KWgu630ugzhLpWq5X4TQvLObpMS3GYA6isUYr0w+YNZbMblNHRyt1zCk
         DJrwJk6sr3EIh44Jp/29+OAn3TLWhcdK0LEGaMJ6qDSIFhaulbFAs1D+OAC3uw4O6/FB
         LtVX5W3RK7dL5oR6YkZhdH+sr2C1Ar2aCBP+Og7V1vrqIX1gj+2nMa8lNc+wPM25WqM4
         eeYLZot+U5Ko0xD06272JMT/8HvYIGHu7M5xhAPJrErsFWc8rEkMkj8255dD77ofHpdY
         NcyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e10fT6SD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p54-v6si1030685qtj.296.2018.04.27.03.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 03:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e10fT6SD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC0jY-0005dL-Ej
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 06:36:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC0jN-0005by-AF
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC0jM-0001Ze-76
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:35:57 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:43870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fC0jM-0001ZQ-0g
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 06:35:56 -0400
Received: by mail-ot0-x229.google.com with SMTP id y10-v6so1472445otg.10
	for <qemu-arm@nongnu.org>; Fri, 27 Apr 2018 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aoeCZOm1j2c4tTL9Ex+n9mB3KB/H97dv7qmUFBarg+M=;
	b=e10fT6SDHUYBRvxbRoB+eEE2VUo1brYiybq5+JOGcdhVLGDAMXNVFPFIlyWm3E2pAr
	t73DF6ZdtHaXn7K4+j8N6Ks+L0GNGRMrfExJFUfpT6ZKStUzPxNrbai11m2+5Ukvh9SH
	LF7MIlfnniSsyTiB8IADjt4VNgig3WM9xokP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aoeCZOm1j2c4tTL9Ex+n9mB3KB/H97dv7qmUFBarg+M=;
	b=JySwI8Gk747vyXzYM9yryZAEB0S3N4XfdBFoR5Xd0h1Yh9D11BB4tVIEMOSFkUks/V
	UU5ifrXtKivegOHcU4zfOqwXXOLuGV7PwOI1NbWODatLwGexrYAepbkJkF2rJrURurn9
	6nKdS8YGzrizII702JZV9wcLRQ57eBDrmc6Tx5Ghz4v1CSzXMuo0M4K9khQQ5ycm5r1l
	qRUq5H+WQjkodfUZ5bAxZQqY9zKxiVljxJW5augE8IltgDdUh0IfzJ5mnoWTszA3dbGF
	mPuBjte0nb+uTbA4PQLlMfp6NJPpRzUsIvZcOp9om1rF65SOc4ojPUe027V59/kvelQK
	kjgg==
X-Gm-Message-State: ALQs6tCOsubuHGZmGQtyb+unhaAMz7ao6EwzTib3Iue0yxI+XHqcsvNI
	Dd0mqe99x0+qHHGIHy2eod8sNGdeMX+Z0717Vhvn1A==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr1128840otd.316.1524825355267; 
	Fri, 27 Apr 2018 03:35:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 27 Apr 2018 03:35:34
	-0700 (PDT)
In-Reply-To: <CAG0V3WRaw45=ERc+8L3PRdL3gSEjN1BtW7xxerNU2rRK7AHzDg@mail.gmail.com>
References: <CAG0V3WRaw45=ERc+8L3PRdL3gSEjN1BtW7xxerNU2rRK7AHzDg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Apr 2018 11:35:34 +0100
Message-ID: <CAFEAcA9qXrLVvcsT=GpXO3oRWF98AYjE=yYK-n_QZwjgERW3SQ@mail.gmail.com>
To: Eva Chen <debby83729@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-arm] Ask about how DMA is implemented in qemu-arm-system
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
X-TUID: tabSb+ZDU+XX

On 27 April 2018 at 07:23, Eva Chen <debby83729@gmail.com> wrote:
> Hello,
>
> I want to learn the implementation of simulation DMA, including the flow of
> DMA read/write.
> The first step I tried is to learn it by debugging qemu-system-arm. The
> machine I used is raspi2. Bcm2835 DMA controller is initialed during
> booting, but I find that there are no other devices use DMA read or write
> during the booting. (I set breakpoint at dma_memory_rw() )Therefore, I have
> no idea how to observe the behavior of DMA read/write.

There is no single set of functions that all DMA operations
go through, I'm afraid. You need to look at the device
that you're interested in and see what it does.
In the case of bcm2835_dma, its main loop for doing DMA
memory transfers is bcm2835_dma_update(), which does loads
and stores via ld_le_phys() and stl_le_phys().

The dma_memory_rw() function is primarily needed for devices
which might be in a system using KVM -- that is where the barrier
operations that it enforces become important. Devices that are written
to only need to operate in a pure-emulation environment, like
bcm2835_dma, don't necessarily use it.

> I have read the files under /hw/dma, but these files only describe DMA
> structure, they are not related to the behavior of DMA read/write. What I
> want to learn is how QEMU dispatch the DMA read/write(using other threads
> except cpu thread to do read/write?), and how to invoke guest CPU that the
> DMA read/write finish( send signal to main loop thread or CPU thread?).

A device that does DMA is just doing memory accesses. Those accesses
are generally done synchronously, because for QEMU memory access
is fast in comparison to other things. We only implement "DMA controllers"
to satisfy guest code that requires them to be functional, not because
doing memory transfers in parallel with CPU execution is faster.

> As far as I know is that using DMA read/write will call function
> dma_memory_rw(). I don't know how to invoke DMA read/write in the guest
> application. Is there any way to invoke DMA in application? or any method
> that I can learn how DMA is simulated in QEMU?

A guest application interacts with emulated hardware in QEMU by
writing to that hardware's registers, the same as if it were
talking to real hardware. Generally it will do things that
trigger DMA accesses by programming the emulated hardware
appropriately. QEMU will then do what it has been told to do;
if this also means it needs to signal an interrupt to the guest
CPU it will do that (via the emulated interrupt controller).

thanks
-- PMM
