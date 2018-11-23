Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2020544wrt;
        Fri, 23 Nov 2018 05:20:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5fLCZVzzCJy9e9j80Qc1rY5Rqxtm1dPT+nQ4WcDN8y9yfkZhJAPajUpMdih3DS0mMt4K4RY
X-Received: by 2002:a81:a80a:: with SMTP id f10mr16337062ywh.389.1542979249604;
        Fri, 23 Nov 2018 05:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542979249; cv=none;
        d=google.com; s=arc-20160816;
        b=hkSFQqFGcHcC3hvRgneHSJkkrf8yhodH6RqyAqGpefDF/osrIxa1QNvaYDH9TlbO37
         gu8BmBezU3a+YdizOXQJGyiCTpfhMpAcCPeoj5xZNP+eIqr+i4cA+BTen09JHNP0lZCB
         iloFytLFcuhQ6HJT76BpDqauXqL1SpeS0yK+6Edw0WVJd9wagsXZJNgsfBKDtqz5r9sd
         ELhb3WMCttfQFYx1jKXSQch0va4TjaAs8I6uR7/r6tfFjcWMZ5POdAzbr7l0IhwmN3+Q
         a6eSyCuYzNSGsnDTPIWr6v0HS1f6LRV3ILLvP1KXDzNPUVDs4DvMeRpIs4RhIZPgL3/d
         p8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=thPndj0LFqQ71sWDgazer9zv4zfVadXlBPCUn+343tk=;
        b=dtX5dmvEWL/SbZAAY/I8a4gY/RYK66xpKQEvi8F1KTXEKOkZ8HwRnkmZnF00gRJBe+
         HCtLWl/p+zV7lU+i1/X2bjByb5r0RF/h4mDwrU4CUUaDQKotDFNhU0Pj0OoaFoRU3Wls
         576mU81KeETIA+xKlHs9PEih9qLR4dX0NzmcYIV4VuumjGlJiGlHGOfhEUkC9QCXZ6PF
         kAtwhakTaaZHszXDZbXex9qPJp/XETyjTtiNIbwZbFwe5Y2k+Pz3UDlT1rl6/p0CcKvn
         mJszIoSMRpZoS1sE7tfvDxuKkQjAZdm4pA+bOaP8hOdnAvmK5IJLNyqjmSYHfi8j5E0c
         y3Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N7boHjos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q188si24087565ywc.111.2018.11.23.05.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 05:20:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N7boHjos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQBO4-0001nc-5q
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 08:20:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBNm-0001lP-3d
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 08:20:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQBNl-0004MH-02
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 08:20:30 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQBNd-0004CM-H3; Fri, 23 Nov 2018 08:20:21 -0500
Received: by mail-lj1-x242.google.com with SMTP id n18-v6so10657652lji.7;
	Fri, 23 Nov 2018 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=thPndj0LFqQ71sWDgazer9zv4zfVadXlBPCUn+343tk=;
	b=N7boHjos0UYjC/G7a4UM66iwEjVWEuGL82WIFTQ7N3DXWCzame0OJuvMy29EInQm29
	2UM4mHF+JWkLsssZQvIEV/Qrrl+EziVzKEBVw5uOzMhOgFhblIycuZH5wCWVN+RMvUjK
	V258r2oz9olYJZl9+zHwUOng3L3A0X+CAdKa+9gxSNM8U0L2+tKJlP0hGhTBGEIEb8zn
	Q8piCTCVqiMfaA3qCMFsbOffocy3J8Bu0t1dPy6ZGvkL2oVPiGsqaAImKkHFlALQ2v/l
	wPcAZGv7ojMiOvrHUvI+hpcVARIok4xbXybpM9trRORiJOnujwN6PwL+Ioz/GkiirSiH
	PXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=thPndj0LFqQ71sWDgazer9zv4zfVadXlBPCUn+343tk=;
	b=QfgToLN7PzOrUMYoeh7GfAywTTgErnN1IJo+rbEZYy428nTA00ooYoaXQDH6YeAwwD
	HbgLBzihEN9gQvS+JQsnmxnBHWdFhpjnoOhHdyUVSzC0mQBOV72/4LJQcGXecwAdYVRJ
	kUuyq33KCV/7sHZuJjZKaq7d4/tjzrEgoPpBQPW44y2QVw8S/+PEa0sIYAJZGuzUUrgg
	8A2OnFHVdr3uUwUQAh5UwIgFNX3f6XXY/ZUBmvqkjHkBn3RY92L4tHRHk0AF6rqzwjhp
	2veTRBaOP/5rsmJJHl/A10lJG1pTYWllCvalf6ljIfC1S+2X5XjzmPygDIMF+g8EusEd
	IpBA==
X-Gm-Message-State: AA+aEWYE1/kDAHUDSbKbwTw0BunFCn19CKX8aJZFc004ijcX7TH3Yjni
	6oejRGIK0sICpEqiYlNtlWw=
X-Received: by 2002:a2e:9957:: with SMTP id
	r23-v6mr7792878ljj.98.1542979219533; 
	Fri, 23 Nov 2018 05:20:19 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	l21-v6sm7780443ljj.48.2018.11.23.05.20.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 05:20:18 -0800 (PST)
Date: Fri, 23 Nov 2018 14:20:17 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mbilal <muhammad_bilal@mentor.com>
Message-ID: <20181123132017.GJ1148@toto>
References: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
	<CAFEAcA_EM39P8HFoC=B=XP3Ax8NgNSotn=wMJJsG05P8Ywdruw@mail.gmail.com>
	<abd7b108-4d21-9c1c-16d3-6d31d47f74eb@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd7b108-4d21-9c1c-16d3-6d31d47f74eb@mentor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-discuss] How to select specific qemu net 'nic'
 device
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bVcqXmYJhIV2

On Fri, Nov 23, 2018 at 02:59:32PM +0500, mbilal wrote:
> Hi,
> 
> Thanks for reply.
> 
> According to your suggestion I've tested with 3.1 rc2 release and problem is
> still exist in this release also.
> 
> Here is my reproducible scenario.


Thanks,

I've had a look and the assert looks bogus to me.
We shouldn't be asserting on RX descriptor setups when the receiver is disabled.

I'll send a patch in a moment.

Best regards,
Edgar



> 
> QEMU launching
> --------------
> 
> ./qemu-system-aarch64 -M xlnx-zcu102 -m 1G -kernel /dev/null -S -s  -net nic
> -net nic -net nic -net nic -net user,hostfwd=tcp::8080-:8080 -smp 1 -serial
> stdio -serial /dev/null
> 
> gdb session
> ------------
> 
> (gdb) file zcu102_net_uni.out
> Reading symbols from zcu102_net_uni.out...done.
> (gdb) tar rem :1234
> Remote debugging using :1234
> _ld_text_start () at os/arch/armv8/common/arch_asm.S:381
> 381	    MOV     X14, X0
> (gdb) load
> Loading section .text, size 0x59c0c lma 0x0
> Loading section .rodata, size 0x2bbc lma 0x59c0c
> Loading section .rtl.data, size 0x770 lma 0x5c7c8
> Loading section .data, size 0x4dc lma 0x5cf54
> Start address 0x0, load size 381972
> Transfer rate: 23313 KB/sec, 2021 bytes/write.
> (gdb) c
> Continuing.
> ^C
> 
> 
> So any breakpoint or Ctrl-C asserts the QEMU.
> 
> qemu-system-aarch64: qemu-3.1.0-rc2/hw/net/cadence_gem.c:982: gem_receive:
> Assertion `!first_desc' failed.
> 
> 
> Our networking demo application running fine unless you interrupt the GDB
> (either with breakpoints or interrupt signal).
> You can see following message on QEMU console which is the indication of
> demo is fine (it also well tested on actual hardware)
> 
> Open the following Nucleus node address in your web browser:
>     http://127.0.0.1:8080/
> 
> 
> I'm attaching demo application binary.
> 
> 
> 
> 
> Thanks for care about this issue,
> -Bilal
> 
> 
> 
> On 11/23/2018 01:59 PM, Peter Maydell wrote:
> > On 23 November 2018 at 04:13, mbilal <muhammad_bilal@mentor.com> wrote:
> > > Hi,
> > > 
> > > I'm using qemu emulation for xilinx zcu102 platform, this board have four
> > > networking GEM0, GEM1, GEM2 and GEM3 devices.
> > > 
> > > To run network demo on this board *only* require GEM3 device to be configure
> > > while other GEM devices don't need to be configure, that's why u-boot and
> > > other RTOS only configure GEM3 device.
> > > 
> > > 
> > > QEMU is enabling these GEM devices  with networking '-net nic' option and
> > > QEMU consider first '-net nic' option for GEM0 and second '-net nic' option
> > > for GEM1 and so on. that's why if need to enable GEM3 network device we must
> > > need to give following full command line options
> > > 
> > > -net nic -net nic -net nic -net nic -net user, ...
> > > 
> > > In this way all four GEM devices would be enable but first three GEM0-GEM2
> > > devices are un-configured and useless. In our case QEMU is being *crashed*
> > > due to trying to use these un-configured GEM devices to o send/receive GDB
> > > breakoint/interrupt cause. IIUC QEMU uses first device in the -nic loop
> > > i.e
> > > 
> > > qemu-system-aarch64: hw/net/cadence_gem.c:921: gem_receive: Assertion
> > > `!first_desc' failed.
> > 
> > If QEMU asserts like this, this is a bug in QEMU. I've cc'd
> > the maintainers of the Xilinx board.
> > 
> > Could you provide a complete set of instructions to reproduce
> > this bug, please ? (full command line, guest image, etc)
> > 
> > Could you also tell us which version of QEMU you are using?
> > If possible, try with the current git master or
> > with the 3.1 rc2 release candidate we've just put out, to
> > see if it's already been fixed.
> > 
> > thanks
> > -- PMM
> > 


