Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp878846wrq;
        Fri, 15 Jun 2018 06:55:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJMoc4ggv3qSdcCBXAzeO46xV2w+HOefG3FoVkmeXIFeqrUverJ9oMznn00v+paIj42ogAl
X-Received: by 2002:a37:e103:: with SMTP id c3-v6mr1430316qkm.69.1529070907326;
        Fri, 15 Jun 2018 06:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529070907; cv=none;
        d=google.com; s=arc-20160816;
        b=HGzTStaPy8V7bs/WPIga7N33i1OJn0Y1CPhd7UnSp50MXDJPJUYY3h0g7RkqjXWATd
         fW2q0snFv57BHTHB5gKLq2e+scPZ7Nod97tJc51APtZQQndVfijy/hW4T3K3Myk8faPF
         JFSlu2S+tgF1E8Yu/ELEslvWixfjDQhrTOzONiaquR2jJ67Nlv7PYc7WxWoqaLiU8MMY
         rUx3Oyb9eIYPDi8ILHdL0A6VapZVKjT9OickdYsrr4SVKFY2fvePmQZ5idssRbOqtSz7
         AYLDutwfohF1Sv31KUjgq/b6EUEWwySvGj2ZL5SxiZV+zEIC3NEDdAq0WxOqgwAWr/VK
         U/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EVu46tv4g370p397NcKnw3+QfVd/X0/GfVlJ54G+aQI=;
        b=wWrngWRydfpFkFZdBvwwDy+RVxLEBR/Ea3ehWKr5s2BsF9ku0TBCu1+YPzM8hyBXrh
         /IeHVAfjy2OnaNhy0ePMPPpoLpQIohRfWal3hpsVvh1pCD5NBVOy6vSXZYqZ3/B1WeZE
         xp+PgFPq6q8hptMa96+ssH2NGwGMo6Y0bYzpZlc44xUAWAPXZNHAl7s72oo7gzTRq7N4
         XBNgENKoGGqdzd0khoOgOuX8CKrOHkBrRrNLTBKrnwT9bKWktwsPbulefqlCErCBGW5+
         lmcxNw8+HPU8RE1rS6BDZDXr+rzHBbMloPYdiO4UnPUsXRE8BNUYzsm1Z0a1/nexpsJt
         c5pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KubHy0Hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s69-v6si7574545qkl.373.2018.06.15.06.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 06:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KubHy0Hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTpBy-0004m6-SO
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 09:55:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTpBo-0004kx-53
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTpBn-0004RA-3g
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:54:56 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:37064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTpBm-0004QU-LY
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:54:55 -0400
Received: by mail-ot0-x22f.google.com with SMTP id 101-v6so11074542oth.4
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EVu46tv4g370p397NcKnw3+QfVd/X0/GfVlJ54G+aQI=;
	b=KubHy0HwMH+yRTHLQOQt/z6/fXHmGGGCNMaXUMcvQUuSu8ZrlRN7J/TKpLFYhrQV7J
	RcAPtwcMotiNJP19BrGYh0nKzHX7ZiPUH+A+MhpHvnwOBwoBJ3ah3o9A4YoUW2rineu+
	3Fn5PmxctNutpre3am3Ke7WieJE9ZEdFa8Jis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EVu46tv4g370p397NcKnw3+QfVd/X0/GfVlJ54G+aQI=;
	b=t9lI813uVvv9F9RGl6jdkH1d/bER2Ld+WCWCsn8sTOOWaAPkrR4HSaVl3bdLFJnJ8j
	09mEcpL339LNMyz6LLk76a3a3d6nyw/6nDjRfqi6vLeXAXlbNyFS1W72tGmLT3PGZBkU
	Gf2PRZHxueLuAjtd4l+XleBoCBWbxZ98XH/2r1JS3IBtEKROXKOlQhIUxSOUqtzOtb4+
	hRO8D5qaoNWBwxSu+I8Iu1dDVtQ5XtmqA19yk93TphwI7tQ47aP6O/szD9tyL4NGTIyN
	1criFyKXL6ZhTw3gOEeFUri8iAVoRXZaW9071nd+ECdVQ4n8ylyxHdFwgXTEVXT+ygKz
	OrGg==
X-Gm-Message-State: APt69E02WWXSqHks5n54zO/YIR0d81IdMsiUnACCZnuzmOoSU2NAXYa1
	mnGqX8UtZQ7r9DGhhN3x0L8azHdf5QULdutqvfGfCA==
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr1123778otc.294.1529070893788; 
	Fri, 15 Jun 2018 06:54:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 06:54:33
	-0700 (PDT)
In-Reply-To: <4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 14:54:33 +0100
Message-ID: <CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
X-TUID: g2hPznoaLePh

On 15 June 2018 at 14:30, Guenter Roeck <linux@roeck-us.net> wrote:
> Anyway, my problem is much more basic than device support. Whatever I try,
> I always get
>
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)
>
> R00=00000000 R01=00000000 R02=00000000 R03=00000000
> R04=00000000 R05=00000000 R06=00000000 R07=00000000
> R08=00000000 R09=00000000 R10=00000000 R11=00000000
> R12=00000000 R13=ffffffe0 R14=fffffff9 R15=00000000
> XPSR=40000003 -Z-- A handler
> FPSCR: 00000000
>
> even when I use a toolchain specifically built for Cortex-M3 and thumb2,
> and no matter which image I try to load. Presumably that means that it
> tries to execute or jump to a non-thumb2 instruction, but that doesn't
> really help me. Any idea, or should I just give up ?

Reading the runes that looks like an attempt to start an
image with no vector table in it: R15 is zero, R14 is the
magic "we just took an exception" number, R13 looks like
probably what you get if you started with a zero SP and
then pushed an exception frame.

Try running with -d in_asm,cpu,exec,int,unimp,guest_errors
which will print some logging which will tell you what it
tried to do. But I'm pretty sure what's happened is:

 * on reset, we read the initial PC and SP from the
   non-existent vector table; both are 0
 * in vector table entries, the LSB is the arm/thumb bit,
   so 0 means try to execute from 0 in arm mode
 * any attempt to execute in arm mode is an INVSTATE
   UsageFault
 * ...but at startup UsageFaults are disabled, so we
   escalate to HardFault
 * because SP was 0, the stack-frame setup for exception
   entry pushes it around to 0xffffffe0. This isn't RAM,
   so we take a derived BusFault on exception entry
   (which also escalates to HardFault)
 * we read the PC for the HardFault entry point from the
   vector table. This is 0...
 * ...so we again execute from 0 in arm mode, and fault
 * but because we're now in a HardFault handler we can't
   escalate our UsageFault to HardFault and instead must
   go into Lockup
 * QEMU doesn't implement the architectural lockup behaviour
   so we just abort().

Note that for M profile QEMU, the thing you pass to -kernel
must be be either (a) a raw image file which starts with a
vector table and is intended to be loaded at address zero,
or (b) be an ELF file which we will load at whatever address
it asks, but which must include a vector table at address
zero, because we don't honour the ELF entrypoint address
but instead always load the initial SP and PC from the
vector table.

thanks
-- PMM
