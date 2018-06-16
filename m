Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2065619wrq;
        Sat, 16 Jun 2018 08:08:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIznJSQH0hfwNMeBY3FDx9bE4z8m52bO852m8qZETqPLgAAesM7MXLqypCiFzb/PcvEvl2f
X-Received: by 2002:a0c:9123:: with SMTP id q32-v6mr5122140qvq.136.1529161709863;
        Sat, 16 Jun 2018 08:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529161709; cv=none;
        d=google.com; s=arc-20160816;
        b=fNvD4CxXbOTOpMH+ThUX12xYW1zJhSW1F9g5w+pOXmysxp9He5D1NCzAClbDWyUi7R
         MuBFXRaqxeZrzi+OJ4zlaLAj6DATkhAAfOJXpv6Jv84EIJQpsJ8uOsVMlMBPdwfwZ0ZQ
         AwekTG05uslG9FzbWeBBcfVMSik+TMxMU2/2O4GVGRD39Cvsp8Y84O+VwONqF1LQCbOq
         Vflgk6x26K+j4B/2zLiCQMGhJ+P3t4GRcGuuBmG5BVjY6umZJHHmQy6mit49AVvx2rZs
         qnopLoEDSRMnjZyt5kLaLfIrOwudKzobgnQcwVQmOe1nyOlidOIENhmeYCNNMe9T6Ith
         y0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=PGYWpWQz/nzTPIB7185GTrW5lu1hP0wvZbUzaUfI4kI=;
        b=LOI1JLelDfmeybIQShI2onKaT2GmNOK+kVltYtD1UsHj738WsGqV2pCurYmmv/Vv4i
         0ZZy9Hzg6aWCIBi3PbHueoNp3O4kZUR8Fx44ydSmDGFSg/dEdDYoaCUmzk6D2MeHvuWd
         YnykXVure07+PlSSQLZ2QXfYil9AIb1ezIOuMkq1aSpgE3N5SsZUlv/+Z1BZsEOZ7hCL
         0kef6/A57G6CN6Ll/y+31Gaq3V1jPJQubBJe2r/Fwi9Gh5NSk+eP//jwC7WiXc06yQuC
         SyxpGtxRNBsRy1ptesujBmE0IPkBLOAwGXzTrvywHt0DNKDs0WXZ9VKe/KWA1Sox6VJb
         OE7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XsJ2jC8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f36-v6si10234747qtf.100.2018.06.16.08.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Jun 2018 08:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XsJ2jC8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUCoX-0000Ak-AB
	for alex.bennee@linaro.org; Sat, 16 Jun 2018 11:08:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fUCoO-00009P-PB
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 11:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fUCoL-0004ix-H9
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 11:08:20 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:42587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>) id 1fUCoL-0004iZ-7u
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 11:08:17 -0400
Received: by mail-pl0-x244.google.com with SMTP id w17-v6so6811158pll.9
	for <qemu-arm@nongnu.org>; Sat, 16 Jun 2018 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PGYWpWQz/nzTPIB7185GTrW5lu1hP0wvZbUzaUfI4kI=;
	b=XsJ2jC8faBKCgPX02QOSDR0s0CNaDrLOC5o79/Girtb9N+hjqZ9YzIL9nRQgdiEyLz
	RfaPVAozu3EFK16Tt/9547vrVt0PhlwBRZuderMUR+zuQ5dCPha4n5JECtlwuXT+FTCK
	thnvFoi0JV9VWwWqEF4cOVzjkkGQ466wXJKrwxBiHiGwfVodZK39Yzn2YjGTzIwW/L9x
	RC+6chSSBt2c//6pI0melWuW4KXLREt8AfiIi6roEeKJ+r4Uu7P6o2K71bZtcWOYuv2L
	Cjsf+UePno4RqBA7pUfRltNjGoMlqZqrZ/XY00QUhF0IbHqYnOR5qHUpJbDP9nvV+6dv
	KppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PGYWpWQz/nzTPIB7185GTrW5lu1hP0wvZbUzaUfI4kI=;
	b=OoGODM5HxxRQE8+T/gmu3LAYAY+WPs+gYIrwWJJv7ypUnkR0iAaDMkeKbTDF8MhJpS
	9xjbQKP1xpHvR6MCy0wmeQ98aAJl6qZXJ7DxJaIGqLOgTS1iBKpvjs2SoCkoRGjo1FqZ
	GIilPwUMDeZyEk30J5ia9sKAY10SHOrJ5sxR0FzP7ugBp0rnYRcNXOrGTNwniyfNUROu
	NUlmAVK6ITrptvBV3lnfC30G2k5gBP6kGOgw4XH+QFpbnWXO8HxwJ0vy/MpLzYotXPA3
	uoD8OkO/WUHMuyVfGea7XqIBAoAIURRaLyJQOLjpsSpsmtIwSP9H82+mtGOV6mIMjNUo
	dXYQ==
X-Gm-Message-State: APt69E0Wri98fbxyZpPD/SYp3NeZh2GYXOEiFyq953pVhdmY/0F2hYuU
	r6li/V/OeGc+ANGAjE+Gy4ATkw==
X-Received: by 2002:a17:902:5a09:: with SMTP id
	q9-v6mr6870865pli.300.1529161695943; 
	Sat, 16 Jun 2018 08:08:15 -0700 (PDT)
Received: from server.roeck-us.net
	(108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
	by smtp.gmail.com with ESMTPSA id
	j21-v6sm1897248pfn.121.2018.06.16.08.08.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 08:08:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
Date: Sat, 16 Jun 2018 08:08:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
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
X-TUID: KxGvAidpxSaC

On 06/16/2018 04:13 AM, Peter Maydell wrote:
> On 15 June 2018 at 19:13, Guenter Roeck <linux@roeck-us.net> wrote:
>> After hacking qemu to accept the ELF start address and to set
>> initial_msp to 0 (a whopping 6-line patch), I get a bit further.
>> The boot now hangs because the devicetree blob is not recognized.
>> Does qemu load and pass the provided dtb file ? I didn't
>> immediately find any code doing it for armv7m/an385.
> 
> As you've discovered, we don't. The assumption for M-profile
> is that you're just passing us an image file, we don't attempt
> to do anything with initrd or dtb. I'm not sure I really want
> to get QEMU into the business of being a boot loader for
> M-profile (there is enough of a mess with just doing that
> for A-profile cores, and most people running code on M-profile
> devices aren't running Linux, so there's less justification
> for special-casing Linux kernel boots). I would recommend
> arranging for the images you want to load to be self-contained
> with a vector table (either by having the kernel build process
> do that, or with a guest-code wrapper.)
> 

I would tend to disagree. If we get it working, it would exercise
both qemu and the Linux kernel quite significantly, thus helping
both sides to improve functionality and stability. Also, the changes
I needed to make are not really that invasive. Embedding everything
on the build process or with a code wrapper would be much more complex
and add complexity where I don't want it. I had tried that with some
other targets, but it is just too fragile for automated testing,
and I don't do it anymore. Your call, of course.

FYI, here is where I am:

- Added support for passing the entry point and the dtb start address.
- Added support for loading dtb.
- Added support for loading initdrd

Adding support for an entry point and for the rest wasn't really
that bad - I did it in armv7m_reset() and it's just a few lines
of code. To load the dtb I leveraged the existing load_dtb()
in hw/arm/boot.

On the Linux side, the only change I had make was to enable the SIO -
the kernel assumed that it was enabled at start and ended up in an
endless loop waiting for space in the Tx FIFO.

Anyway, here is where I am.

...
Timer with delta zero, disabling
[    0.292470] sp805-wdt 40008000.watchdog: registration successful
Extra peripheral region @0x40020000: unimplemented device read (size 4, offset 0x8000)
Extra peripheral region @0x40020000: unimplemented device write (size 4, value 0x1, offset 0x8000)
[    0.294377] leds-syscon 40028000.fpgaio:led0: registered LED userled:0
Extra peripheral region @0x40020000: unimplemented device read (size 4, offset 0x8000)
[    0.294816] leds-syscon 40028000.fpgaio:led1: registered LED userled:1
Extra peripheral region @0x40020000: unimplemented device read (size 4, offset 0x8000)
Extra peripheral region @0x40020000: unimplemented device write (size 4, value 0x1, offset 0x8000)
[    0.295647] ledtrig-cpu: registered to indicate activity on CPUs
[    0.296294] NET: Registered protocol family 17
[    0.296756] Key type dns_resolver registered
Timer with delta zero, disabling
[    0.305642] Freeing unused kernel memory: 80K
[    0.305915] This architecture does not have kernel memory protection.
Timer with delta zero, disabling
[    0.316536]
[    0.316536] Unhandled exception: IPSR = 00000006 LR = fffffff1
[    0.316836] CPU: 0 PID: 1 Comm: init Not tainted 4.17.0-11928-g2837461dbe6f-dirty #4
[    0.317029] Hardware name: MPS2 (Device Tree Support)
[    0.317231] PC is at ret_fast_syscall+0x2/0x58
[    0.317350] LR is at tty_ioctl+0x2a5/0x528
[    0.317455] pc : [<21009002>]    lr : [<210d12f9>]    psr: 4000000b
[    0.317604] sp : 21825fa8  ip : 0000001c  fp : 21b17d86
[    0.317733] r10: 00000000  r9 : 21824000  r8 : 210091c0
[    0.317855] r7 : 00000036  r6 : 21b9cee0  r5 : 00000000  r4 : 21b9cf3c
[    0.318013] r3 : 00000000  r2 : 3d9adf25  r1 : 00000000  r0 : 00000000
[    0.318159] xPSR: 4000000b
[    0.318242] CPU: 0 PID: 1 Comm: init Not tainted 4.17.0-11928-g2837461dbe6f-dirty #4
[    0.318417] Hardware name: MPS2 (Device Tree Support)
[    0.318985] [<2100bd8d>] (unwind_backtrace) from [<2100b13b>] (show_stack+0xb/0xc)
[    0.319228] [<2100b13b>] (show_stack) from [<2100b87b>] (__invalid_entry+0x4b/0x4c)
Timer with delta zero, disabling
qemu-system-arm: terminating on signal 2

 From this point it only really makes sense to spend more time on it
if there a path into upstream qemu. Let me know.

Thanks,
Guenter
