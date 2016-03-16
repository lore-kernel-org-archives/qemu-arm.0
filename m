Received: by 10.25.208.211 with SMTP id h202csp1299610lfg;
        Wed, 16 Mar 2016 09:54:51 -0700 (PDT)
X-Received: by 10.140.232.211 with SMTP id d202mr7221717qhc.27.1458147291136;
        Wed, 16 Mar 2016 09:54:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si3951333qkl.103.2016.03.16.09.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 09:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:57554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agEig-0002FH-MG
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 12:54:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agEid-0002DY-HT
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 12:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agEic-0002gc-6w
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 12:54:47 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agEic-0002fO-1L
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 12:54:46 -0400
Received: by mail-vk0-x230.google.com with SMTP id c3so69520731vkb.3
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ix+rRagCt2p0LF+sKqOAAEilrr3lDz9nT62S2l6Gaa0=;
	b=FNnUhwn9G8JOHKeiozR858ZN+Kv0fc+0HfkPYq/jR3IjP/ZgB3zSmzKW7nIWkxlO/2
	iPI1WG2rluLxWvk4jHZGYHPgGdUIn8/xGbZwqQnv/mBvgEgGByJ3akt1fcY9O9etmezz
	GsJStx9Z6r0mTAYEV610i1oOeGOsNZ6kvmHzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ix+rRagCt2p0LF+sKqOAAEilrr3lDz9nT62S2l6Gaa0=;
	b=Jve5zgXi9JskDVrvcApakmBDafbH1drkjWE4bCBt1NuezgZcL22kpBjhHooO7d1/Vv
	grXD06bLz5SNQkI1Q1rSPSlWjzHcmVAl5sY5kzbAr64c6J1tsC7NmcQF5CRW8pcjPcZu
	3RqV1ECMGFioxc5IaqywVzQYD0/WlHTvR97yRdHYDroiHgJuC4iH/gKRmiIuX94PB1wR
	ihQMM1I9dyeG4U5YQ8f5u3TaGMuLacPnDerCDDEwdDNkRSsTwoxPmx3kB5lQUzz9h5Ir
	xj8dzYKDNc5W/IK9NRdkUUeGvE2VvDZdiHdoZn4seEPqxk5K2gGzpCUg+gWYaTWzbkH7
	OmYg==
X-Gm-Message-State: AD7BkJJAK4DQAWhdfswMgSQvpg+DLbI/c0uKV+bf2ROWfGUpyOkNoDOsNX4dOwfcWj/1nx8NmguKrBOxeKgnYvUf
X-Received: by 10.31.8.17 with SMTP id 17mr5097041vki.139.1458147284440; Wed,
	16 Mar 2016 09:54:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 09:54:24 -0700 (PDT)
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 16:54:24 +0000
Message-ID: <CAFEAcA_6NvDW4LYHTmcuH3j07zQds6gH=J2FC4zV9JDg13JWwA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 0/5] Raspberry Pi framebuffer,
	DMA and Windows support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R9Li/i77Go4M

On 8 March 2016 at 20:05, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> This patch series adds support for the AUX (second UART), framebuffer
> and DMA controller on Raspberry Pi 2, and enables booting Windows on
> this device. As with the previous series, it is heavily based on the
> original (out of tree) work of Gregory Estrade, Stefan Weil and others
> to support Raspberry Pi 1.
>
> After this series, it is possible to boot Windows by following the
> instructions at https://github.com/0xabu/qemu/wiki. You also boot
> Raspbian to the GUI using a command such as:
>
>   qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
>   2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
>   console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
>   -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio

So I tried something like this, and the kernel gives a WARNING with
a backtrace, and then hangs:

[    5.413943] VFP support v0.3: implementor 41 architecture 4 part 30
variant f rev 0
[    5.976888] pinctrl core: initialized pinctrl subsystem
[    6.171197] NET: Registered protocol family 16
[    6.286799] DMA: preallocated 4096 KiB pool for atomic coherent allocations
[    6.366889] cpuidle: using governor ladder
[    6.391665] cpuidle: using governor menu
[    6.401604] bcm2709.uart_clock = 3000000
[    6.478063] ------------[ cut here ]------------
[    6.481052] WARNING: CPU: 0 PID: 1 at
/build/buildd/linux-3.18.0/arch/arm/mach-bcm2709/armctrl.c:148
armctrl_xlate+0x188/0x274()
[    6.484474] Modules linked in:
[    6.489783] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
3.18.0-20-rpi2 #21-Ubuntu
[    6.502781] [<80016ab0>] (unwind_backtrace) from [<800129d0>]
(show_stack+0x10/0x14)
[    6.506355] [<800129d0>] (show_stack) from [<805fee10>]
(dump_stack+0x9c/0xd4)
[    6.508946] [<805fee10>] (dump_stack) from [<80026ed8>]
(warn_slowpath_common+0x70/0x8c)
[    6.511251] [<80026ed8>] (warn_slowpath_common) from [<80026f90>]
(warn_slowpath_null+0x1c/0x24)
[    6.512797] [<80026f90>] (warn_slowpath_null) from [<80022044>]
(armctrl_xlate+0x188/0x274)
[    6.514558] [<80022044>] (armctrl_xlate) from [<8007399c>]
(irq_create_of_mapping+0x64/0x110)
[    6.517173] [<8007399c>] (irq_create_of_mapping) from [<804c4ef4>]
(irq_of_parse_and_map+0x24/0x2c)
[    6.518741] [<804c4ef4>] (irq_of_parse_and_map) from [<804c4f14>]
(of_irq_to_resource+0x18/0xb8)
[    6.520209] [<804c4f14>] (of_irq_to_resource) from [<804c4ff0>]
(of_irq_to_resource_table+0x3c/0x54)
[    6.523598] [<804c4ff0>] (of_irq_to_resource_table) from
[<804c25b8>] (of_device_alloc+0xd8/0x180)
[    6.528838] [<804c25b8>] (of_device_alloc) from [<804c26a8>]
(of_platform_device_create_pdata+0x48/0x98)
[    6.535352] [<804c26a8>] (of_platform_device_create_pdata) from
[<804c27f0>] (of_platform_bus_create+0xec/0x3ac)
[    6.539440] [<804c27f0>] (of_platform_bus_create) from [<804c2860>]
(of_platform_bus_create+0x15c/0x3ac)
[    6.541217] [<804c2860>] (of_platform_bus_create) from [<804c2c28>]
(of_platform_populate+0x5c/0xa0)
[    6.542770] [<804c2c28>] (of_platform_populate) from [<8088cad8>]
(bcm2709_init+0x64/0x3fc)
[    6.546211] [<8088cad8>] (bcm2709_init) from [<80888870>]
(customize_machine+0x20/0x40)
[    6.547711] [<80888870>] (customize_machine) from [<800088bc>]
(do_one_initcall+0xd8/0x208)
[    6.549200] [<800088bc>] (do_one_initcall) from [<80885ef4>]
(kernel_init_freeable+0x1fc/0x29c)
[    6.551771] [<80885ef4>] (kernel_init_freeable) from [<805f9298>]
(kernel_init+0x8/0xf0)
[    6.553319] [<805f9298>] (kernel_init) from [<8000efe8>]
(ret_from_fork+0x14/0x2c)
[    6.556670] ---[ end trace 088ba587f0a009cc ]---
[    6.649948] No ATAGs?
[    6.658029] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4
watchpoint registers.
[    6.660393] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    6.664206] mailbox: Broadcom VideoCore Mailbox driver
[    6.693912] bcm2708_vcio: mailbox at f300b880
[    6.703745] bcm_power: Broadcom power driver
[    6.707642] bcm_power_open() -> 0
[    6.708671] bcm_power_request(0, 8)

Does that look familiar? (My first guess is just that it wants some
bit of hardware we haven't got a device model for yet. I haven't
tried to investigate at all yet.)

thanks
-- PMM
