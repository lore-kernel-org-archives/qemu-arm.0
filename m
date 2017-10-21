Received: by 10.223.197.9 with SMTP id q9csp9001935wrf;
        Sat, 21 Oct 2017 09:45:20 -0700 (PDT)
X-Received: by 10.237.36.145 with SMTP id t17mr12088851qtc.162.1508604320319;
        Sat, 21 Oct 2017 09:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508604320; cv=none;
        d=google.com; s=arc-20160816;
        b=CU1oIy1Jn5rCaTuYvANfMFHMxcTeiB0HzT5aA1PQRZ9iAdU9KG7QkH/ZRMhvQg9udU
         w227Am3GBCIhMKs1INlClDnoRShGXeDzAQB9yk37UXES1UO3jDUW8O9Oc5alYWKk2blY
         hp/+oAtWoQDHmlOAbAaACbZv8svfJkIZezngtXSNekujZ1PRpt00FCe4R+qLBxjRAugW
         uQiW+m2iJE6k3yX4Q8Q+AD0Zn3KLo000/UlLVP9vYsWHXNtvS1hLMzapsbG66VqXIjUA
         Y4fqbhSgtVNGAfIbgCWoykEYByoOjHRA2SFRy90cNq3jVV3PiH4MNerui41PaDiL9PIy
         ilMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VAiK5NEBWaapZuFphDBDGpb2Z7wC75idYnCqf5CaYRI=;
        b=dt09Zr9KaVhW9YqftIvhxXa5Job6r0E/pnopo9O+J2wqRabYok/id3fXlgTmKbRldo
         ewT/2rEK8FFNbJvcESU0xiuWZJLxa34CLIjvJQJleWw/omUAD9LKwMO7Lm2UeOLzpSOQ
         ct/3QAwCceN2LLoCy8UEIhL3Dy20q03Cfbz5IFaD2rPno25XpAZ3mxnF7JHbISNReX8J
         aIcGjR5mhaTUY33gkVKv2fZsGYcJLFfLozTcUVHmYB2qwChnTTu9ngxsthSzipW4c14e
         2kDRQ5ygPjkrHzbLF6NFvm6SJjtHLE11fp+RMd5JHpyEQCyvBZE9DWPz9yHxS0b/Kj1p
         zFpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e/4gqF9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r124si2881126qkf.182.2017.10.21.09.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 09:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e/4gqF9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5wti-0002qs-4U
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 12:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5wtb-0002pa-LZ
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 12:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5wta-0003g9-Mb
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 12:45:11 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:45579)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5wta-0003eh-GJ
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 12:45:10 -0400
Received: by mail-wr0-x22e.google.com with SMTP id y9so1464822wrb.2
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VAiK5NEBWaapZuFphDBDGpb2Z7wC75idYnCqf5CaYRI=;
	b=e/4gqF9Pl1e66tBJ154W+FtrC6APGkUn9521gZeIk01fyMB7Q0U6vxKcXOLVxNuRtd
	JkUp5pPZ1Ey3TCEKFXPJP9+72ZsVG2oRZZY1d/hLL0Xqx1DaNtMI/l2YEON5Bf4MUovu
	X8Gx4wKd2qofO2nQrznSLocTQkITgpjIVoazs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VAiK5NEBWaapZuFphDBDGpb2Z7wC75idYnCqf5CaYRI=;
	b=GoO5DMz+fkaEXWF/dXoeUV0K5s0eGQWqQvonHq9CUDrMgRf4iaYqv0ONWseriUHKXO
	dzagNLofF2La8hs6hcRBO7F2XlGCpiR+rddZge1ZR2anj0F/bTvOG0dv7gehifHaLlJV
	tGjmCYYmLi9Hll1xznh8nakTriZySCgCAih/lWQDCeDN9wG3K4FE/AH/NQHf5eAhwQRz
	4Px+QG83+QmUdlTxvSB+9CvmpgDwmLVCZ63+q5YJKv360wWIPc4+pnP7aeLJOjjJnCmG
	Oy1xaSGXULYXbB2xES+lYPbFyb8xqLNtlkrEm9t5bHERLCTIcB4VjsUM34dzfzGPMiko
	vDLA==
X-Gm-Message-State: AMCzsaU79roaT2pFB+I3fQqRqv4abrOhzhf9DYqYNTGcSNjnRO3ofXQ/
	XCtNodkOzqJsFZqKZWSUZY1PFquSnljZBfoo1MTz6Q==
X-Google-Smtp-Source: ABhQp+S/GbIx5yItBX97As5L5QPkLproWB7JQKYNSo0hvcN8v3vJZxlHZwjrpXE+Van2Kd7J73ht6Ydr+3ogE+PPqME=
X-Received: by 10.223.171.161 with SMTP id s30mr1084558wrc.194.1508604309023; 
	Sat, 21 Oct 2017 09:45:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Sat, 21 Oct 2017 09:44:48 -0700 (PDT)
In-Reply-To: <CAPLZ2xM+1MwjYgmLYWo_gWctN_B10zma+X1iUKB-0G4iau_=zQ@mail.gmail.com>
References: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
	<CAFEAcA8TfRzsP2TuK9_MeP=puPV-+3ivL=R8F3LkGcnMCDLEQA@mail.gmail.com>
	<CAPLZ2xM+1MwjYgmLYWo_gWctN_B10zma+X1iUKB-0G4iau_=zQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Oct 2017 17:44:48 +0100
Message-ID: <CAFEAcA9+3N_7q5-htk3vReuyXf9iio3UO3Tn9rh=5vh3AcMcnQ@mail.gmail.com>
To: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] .bss more than LM3S6965evb RAM size
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
X-TUID: WvuyAdiVPeli

On 21 October 2017 at 12:10, Hui Yie Teh <hteh703@aucklanduni.ac.nz> wrote:
> I see, thanks for your reply Peter!
>
> What if I have a stack size of 2048*4 as I'm using 4 threads with that stack
> size? Will that be in the RAM as well?

Your stack certainly should be in RAM. If it gets put
anywhere else then you will find it doesn't work. (This is
actually a fairly common mistake with hard-to-recognize
results: when the program uses the stack the writes go
into nowhere and the reads come back as zero, so the
result is weird behaviour as variables stored on the
stack silently get zeroed...)

> Also, this is the memory map of my linker:
>
>> MEMORY {
>> RAM_INT (AIW) : ORIGIN = 0x20000000, LENGTH = 16M
>> ROM_INT (RX)  : ORIGIN = 0x00000000, LENGTH = 64M
>> }
>
>
> I was wondering if it means that I have 16MB of RAM and 64MB of ROM? Or does
> it not affect the original RAM and ROM sizes?

What you tell the linker affects how it tries to place
things in the executable it produces. You can lie to
the linker about what the hardware has (or in this
case about what the QEMU model has). The effect will
be that the linker will believe you and produce an
executable that doesn't work. I would recommend fixing
your linker script.

thanks
-- PMM
