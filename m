Received: by 10.28.71.27 with SMTP id u27csp143871wma;
        Tue, 13 Feb 2018 15:36:49 -0800 (PST)
X-Google-Smtp-Source: AH8x224zgiug4spsB9/dJHrvcc3Bd7+Fgldwei/NFYL4eWVVNA4Tu2RnR+E18AamoYUH8mopylf2
X-Received: by 10.13.221.139 with SMTP id g133mr1997702ywe.50.1518565009500;
        Tue, 13 Feb 2018 15:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518565009; cv=none;
        d=google.com; s=arc-20160816;
        b=p8zikDuAZ4Olsscdl2Dk0I9iAiW10MgDZ5bCkdqhQ/ifrQoF/8R63h34Byp0WIvvyZ
         q87NpqmzpAQxcHoQLQakxK+eMdBR+PUQkTfTgSaUDnuIYQD75tJHTciQgCKC10BVGvrp
         UyqvSviEk/+B2Qi4L97paRhWlEN0ttaXHYIQjGM6JdhRHODX5VJcWCOyViZKaDghi5Bj
         ezORSzFGkFnZCyIybN8DjYapxfaqL4G+un7bLWqqt3/2KPfcAvuE0CJdEjbsOIS6uOO4
         d6xLf9o3ybKuL77p/WitRvehbtDATe6hDg/RnnMmagDvmfiRIgMrO2O8jP5RY9o1aFaa
         3m2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gUJrldJnL1lkG058iLn4cfM82OkWjR+sV6zEv1PFc3U=;
        b=RrzvFbWIlxc/Ia3NHcI1P4UwJtU6LWFoZUO8AkcZNGs7bFTGPdGFIwidhyclv5v7cj
         W44uwkupY7P6aNesAe6epqQ8M+FuE5jJWRK/V7XlfRqP8s1QGKnS3bete7y3eXXmeAZC
         G9tkkmhz8EGYwh7L+gaSdoyVMUDKehOEbp36bEC8AwRFJqljB2BOVMjH8LcAKrr8uZnm
         MOyLAeCvfb4hRrcGJYB0IheJsmu0X0gZwB7syR53n5FO9lRGCtP5hfApIupwtUyoU5nm
         wB0OQB1cRHNWKGsdcDLuQ4B7g9EaMGoRnrE+Ulw3JrmeBcabUT2v3Mq5e5QJMgTEygvU
         qEOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTXFMFIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y186si1795965ywa.439.2018.02.13.15.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 15:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTXFMFIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elk80-000134-Qt
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 18:36:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elk5G-00077J-S6
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 18:33:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elk5F-0003oe-Ia
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 18:33:58 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:46293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elk5F-0003oQ-Cl
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 18:33:57 -0500
Received: by mail-ot0-x242.google.com with SMTP id w10so5329472ote.13
	for <qemu-arm@nongnu.org>; Tue, 13 Feb 2018 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gUJrldJnL1lkG058iLn4cfM82OkWjR+sV6zEv1PFc3U=;
	b=fTXFMFIPB+OUIOePpwPom5RIdVtJI0D5atGBg7DaF5RJVolA+nA/BHi42vcziLo//3
	iPWTxR+jMfMxMBrSlFc4UfpnIKoAzanBH+wqzQfsgJdHyEgLxHvY7NKvuxv98+ueSBsM
	lR2CfnlG2+wm176K8tBu4jLHKWv/UwDQZ4kcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gUJrldJnL1lkG058iLn4cfM82OkWjR+sV6zEv1PFc3U=;
	b=T4mauQ5AXVW/+6kLXsYftpFQrgjiHbqm7s7FkpONquJu7bT2Bn29BmqZ+7fg+N4UY7
	550sZMf7RwHivzft3Hj+YWxgJpMpgb7HJ4sSXgbBL9wKqBIDwR33N1cHfI/HUm73TvjC
	CCQp4kDHTudAOZMbwCH9smO3KsWosBkGeFfBPSur3PtDomb/SEYOFPK/b/RCnG/sTVTV
	NGzAyHL6xwYalCL3o19zzFrb9rOTtFTIJvk4DkR9a2thNMZJb8pvbkaz6Z+Wmx9Ly4kP
	GxqvIGjgHXiRHr4KoMaKXmM36HQJpjNYZsytEbNbHeA1JrRNFrGiGnMR1kWFB7D4JRbe
	mK6Q==
X-Gm-Message-State: APf1xPBx7KUUsg7HZjBdOEtoBvVp438BM8cvAhnRbIvRqqxbPCyZiTYy
	p8XgfFC46XNf0egoBAwv6jwpVE5+/MsJr9qgwj+uSA==
X-Received: by 10.157.16.77 with SMTP id o13mr2103014oto.54.1518564836460;
	Tue, 13 Feb 2018 15:33:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Tue, 13 Feb 2018 15:33:36 -0800 (PST)
In-Reply-To: <CANN23NnJWS-dT8yDZnZW_wf-L88rMU7n5fzfsgEE3b61Zoa-Rg@mail.gmail.com>
References: <CANN23NnJWS-dT8yDZnZW_wf-L88rMU7n5fzfsgEE3b61Zoa-Rg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 23:33:36 +0000
Message-ID: <CAFEAcA80NDQu0t8U4vajvjyKicfzEzmXPGCoVj+iSgmmAmfAEg@mail.gmail.com>
To: patrickelectric@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] Running qemu-system-arm with stm32f303
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
X-TUID: +vJNxEiApFBi

On 11 January 2018 at 00:07, patrick JP <patrickelectric@gmail.com> wrote:
> Hello,
> I am running QEMU v2.11.0 to run my .elf, a bare metal code.
> The .elf runs in my stm32f303 board, flashed via stm32flash.
> My objective is to run the .elf in my machine to do testes over the serial
> communication, running socat PTY,link to create a bridge between
> /dev/deviceIn and /dev/deviceOut, where /dev/deviceIn would be qemu -serial
> argument and /dev/deviceOut the path for my python script.

Hi -- just noticed this mail to the list a bit late, but:

> Right now, I am running:
>
> qemu-system-arm -machine versatilepb -cpu cortex-m3 -nographic -monitor null
> -serial null -semihosting -device loader,file=file.elf
> output: segmentation fault (core dumped)

This is an incorrect commandline. The "versatilepb" machine
will not work with M profile CPUs: it is a development
board for the ARM926 CPU. (I really should make this
fail with a helpful error message rather than crash.)

To use the cortex-m3 or -m4 you need to use one of the machine
models that works with it, which is

lm3s6965evb          Stellaris LM3S6965EVB
lm3s811evb           Stellaris LM3S811EVB
mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M3
mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3
netduino2            Netduino 2 Machine

(if your QEMU is older you may not see all of these.)

Generally you should select the machine with -machine,
and let it take care of picking the right CPU.

netduino2 is probably the best bet as it is an stm32f205,
but you should check that your test binaries are built to
be able to run on whatever board you pick. (In particular,
don't build them to use the FPU, because QEMU's M profile
CPUs don't emulate the FPU yet.)

Also, if you pass '-serial null' you're telling QEMU to throw
away any serial output to /dev/null, which is probably not what
you want.

> qemu-arm -d cpu,in_asm -cpu cortex-m3 -B 0x08000000 file.elf
> log: https://pastebin.com/FyA1pc8m

qemu-arm is for running single Linux binaries, not bare metal
executables. If you try to run a bare metal executable it
will crash as soon as it tries to look at an address
which hasn't had RAM allocated for it, which is what that
log file shows is happening. For M profile binaries it
doesn't make a great deal of sense to try to use qemu-arm.

I would start by getting your test binary to run "by hand".
Once you've done that there's things you can do (as James
Hanley suggests) to arrange to connect the serial port
up to a TCP socket or a FIFO or whatever your test harness
should be talking to.

One final point: I would recommend that you make sure
you're using QEMU 2.11, because we did a lot of bug
fixing on M profile emulation recently.

thanks
-- PMM
