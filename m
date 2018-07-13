Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp809047wrq;
        Fri, 13 Jul 2018 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd2ZUk73x0hZmQYdpeo4XA1sm0jAxLXCbYWT/oE4H27uooHwUbNXpZom8LcU9Aob3LLb5tl
X-Received: by 2002:aed:24f0:: with SMTP id u45-v6mr6330340qtc.340.1531495367645;
        Fri, 13 Jul 2018 08:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531495367; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsFoAzs4bSng1d66Lm0SPvolRrAq/Rp+KNVBDExr6cdCQ27y+qECHlgeDPWAfEa553
         8OMddlTPbqoNd935bkDfkN0H7OsyEYlqZkupKWGqB9vphxoD2rxiBc1/w9AUFHa5ns6P
         pDnZhKBVjGtBxZoqJr1+e/Og8J9V/kiU6STXTVaaG+f7BRNc1r37j0SnhKF4rRVdTYGx
         27GkGRCwIwziMn4MLPLVrmx8MzLtciX8L7M5nzBNkp3PbCOtXreSfWPzQxjHpB3+RN7/
         tIW0e3xZlwamAn8TIZDs4aX3KKEq+qGIqf2ZKeoeYb9srdeycIs9LRN63ceM1UZCYIG4
         opBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iOq36oD1JBZwzHUFHc36Kl506pmU3FH4UYKdYyFes5Y=;
        b=UI1wpDzY0MC4UP7OZn+ZOTy8JoYTf5ujHtImbKjQOqSxlKHlYsrXxkgLBaS5M/OBji
         I34/e6z/7K67LGL0KYnHOt519rJkc6fv4b81FLQhCFpyeMuK5zdP2u2hFTo6dFBuManQ
         2gcBKoCHiB9XXuiPXXnqCVNABNaLcGrPJFCR8fDlrE+C2KKI1CIR4au4BCcqeH11VDUh
         24eUS3WGrHmOwI60or8TLQPSo89KiXYa7YT/fBQI0jc7AQ+niPaksIcYJuanriEqSfPd
         9890gvZqkrjf3nf7jRA3UPNVoPoF/f/MX4Cj8i949Rt//3fw1IU1Mfa8+uLcqF6RxB0n
         ASfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mz3FjZSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d79-v6si9004719qke.177.2018.07.13.08.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 08:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mz3FjZSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdzuB-0004iN-5d
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 11:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdzu1-0004i1-Lo
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdzu0-0002F9-OW
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:22:37 -0400
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:36609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdzu0-0002El-Aj
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 11:22:36 -0400
Received: by mail-oi0-x233.google.com with SMTP id r16-v6so62915061oie.3
	for <qemu-arm@nongnu.org>; Fri, 13 Jul 2018 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iOq36oD1JBZwzHUFHc36Kl506pmU3FH4UYKdYyFes5Y=;
	b=Mz3FjZSY5omG/C28lDfJX9D8sg4JOM7Bi9vql2ZhaLfvkdt6DuL7L9QPr634ER0pjv
	xECN9ejlyW9u/PbXnXahOd2GbQ0tY6wKBXJVLmNnoZ9XxgPSrNBz5BfrQVDuHIcfITmV
	75hj0yRugdRP++/J/sl4b0x1gwoHXL87i0MNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iOq36oD1JBZwzHUFHc36Kl506pmU3FH4UYKdYyFes5Y=;
	b=D9i3lqCgDl65Sfcq9IIo3bsNrpQ0LtwSRgyvGzQeaxPkh/0JQlm11w7zvwgR885/WW
	VLxOPXTGxrsaQCoqETQ8snEbF+L1i6wHrh35OhCJ62CgXDIoM4UFmioNJXARkZazfcf4
	DnaZPkxTnx91kVK6uC0cKy00AHhTUH2iUNbkX10hHTNLPZgQpxdxBKQlkF8rpAi6Q2Dh
	gryeN//OQ1TafYC0tT19itN0mTlPa1aSYE6mnIzWgMxGkq1QplfH/JLVeLyCB1tZmfJ3
	7hsLuCDGVrNtJOd6HmO5vUVyEuoiU43EGSHdM78nKvX7mgWgyZVjl1mOAyNqkFlZgYSb
	uWRA==
X-Gm-Message-State: AOUpUlEpO2u42bcJ2PSqArzCnW5jg7dYBkmLc1GcYmSeZR3r6yIAw0Oi
	jm7RNXtscXyK8ROEGtLx//kyPgPoWJGKxVcfpqqVAQ==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr7749835oie.80.1531495355623; 
	Fri, 13 Jul 2018 08:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 08:22:15
	-0700 (PDT)
In-Reply-To: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
References: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jul 2018 16:22:15 +0100
Message-ID: <CAFEAcA8v762p3JSQ=9Vu68-evYS5MMH467pAo8=XZWsw+x6s7Q@mail.gmail.com>
To: Kevin Loughlin <kevlough@umich.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-arm] [Qemu-devel] Native Memory Virtualization in
 qemu-system-aarch64
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZcDEvyrwsP26

On 12 July 2018 at 17:48, Kevin Loughlin <kevlough@umich.edu> wrote:
> I know TrustZone has support for memory virtualization in AArch64, but I'm
> looking to create a different model. Namely, I'd like to fully virtualize
> the memory map for the "virt" board.
>
> As a basic example of what I want, assuming an execution environment that
> runs in a 1GB physical address space (0x0 - 0x3FFFFFFF), I'd like to be
> able to switch to a second execution environment with a distinct SW stack
> that runs in the second GB of a board memory (0x40000000 - 0x7FFFFFFF). The
> key points for my desired memory virtualization are the following...
>
>    1. Both of these environments should have distinct virtual address spaces
>    2. The OS in each environment should believe it is running on physical
>    addresses 0x0 - 0x3FFFFFFF in both cases.
>    3. Neither environment should have access to the physical memory state
>    of the other
>
> I initialize distinct AddressSpace and MemoryRegion structures for each of
> these GB blocks. Because all I want is a simple shift of physical address
> for one environment, I hesitate to mirror the (relatively) complex address
> translation process for TrustZone. Does anyone know if it would be better
> to either (a) provide custom read/write functions for the shifted
> MemoryRegion object, or (b) modify the target/arm code, such as adding a
> shift to get_phys_addr() in target/arm/helper.c?

I'm a bit confused about what you're trying to do. Without TrustZone,
by definition there is only one physical address space (ie all of
memory/devices/etc are addressed by a single 64-bit physaddr).
There's no way to cause the CPU to not have access to it.
With TrustZone, you can think of the system as having two physical
address spaces (so to access something you need to specify both
a 64-bit physaddr and the TZ secure/nonsecure bit), and the CPU
and the system design cooperate to enforce that code running in the
nonsecure world can't get at things in the system it should not have
access to.

The whole point of TZ is to allow you to do this sort of partitioning.
Without it there's no way for the system (RAM or whatever) to know which
environment is running on the CPU.

You could in theory design and implement a non-standard extension to
the architecture to do equivalent things to what TZ is doing I suppose,
but that would be a lot of work and a lot of fragile modifications
to QEMU.

thanks
-- PMM
