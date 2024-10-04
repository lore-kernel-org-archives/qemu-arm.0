Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp327681njb;
        Fri, 4 Oct 2024 02:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXyzlSccZVgyWxc02TBWElaqKZanS8hcw5v2PBZvc4z0W2/Tc9rZ/K08JtcyL7IGJn4OQP8Eke+okSQOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGnynMWkqx1sVsuShBJ1gFHNlsXb9GKcP+/QX5JmX43JDHilHTNjfNCSrfOJnUVeHll/LRq
X-Received: by 2002:a17:907:7f8a:b0:a90:b67e:7aa9 with SMTP id a640c23a62f3a-a991c00e6eamr226772966b.55.1728035274438;
        Fri, 04 Oct 2024 02:47:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1728035274; cv=pass;
        d=google.com; s=arc-20240605;
        b=UpgddNVoR0FaEAb02MFowJQUZPpPe84L/7JRfLzgehTKudhVcm4FRkaL/WaoBG77de
         ZvytSjL/KN69As9xdv5BC9k5wprI6LK+k+O/wdk3vERtnpK6LA9d2PdI62YMax/rV9qh
         3huFc0Xb3gPBlZ6fsHp2Gm0b6cYm1WGUok5JsZt4Kuka8b7q4AfT+VAvLkUUb3ykiGu1
         38uOE2eIBKnAGE2mORr/J8vasa/pIhlMRlcFUx+T8TP3pp0KLKYxm6nt909v5rdEigKk
         7IZ108FYtaVzcMMGSDiwl+5gX3iPKdtAEowqXuN3g4vXYYyhxXZNzIOwKxJaVnchtlRy
         B/qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:cc:subject:from:content-language
         :user-agent:mime-version:list-unsubscribe:list-subscribe:list-id
         :precedence:date:message-id;
        bh=CH9Ob3/24kyKjBwPSzohqTpn6jQ2y8wLpB5aWES6wsU=;
        fh=Eh/1jBSxyuqbj22vSoqQpYnCWJX2VVd7UDggprZ2e88=;
        b=ZMPlPv6/8MqMwRb/6elRJcp+Gxo3dtTs+7CkAao+MVfL0H2EO2FPXTxHuSmiC47Irz
         2my7YHZWZ10rRKB0gBZcbZodkSJUGGkbN5gyB/NU74a/lR0O03ITjjPMjQ2l9pUe+YiE
         0rRKrsMK5a32FTgVTfFiDT76cgBsJgWML/old5t+g/v4eHWLmOW/6+3tgVydwYFFvkWM
         lawe9FVtVkMxyDrYQZlDmz7yUtBKBa8y4lVx64hHwMrgL47JgAabJXyr1jEzi8qKZpjU
         tr/C3bPsf3CMj0fJSMAihba6CfqUZGXxI1tVPThtwspt8D6JEhzd1ighqgkjFJTOhG/s
         +osw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=pengutronix.de);
       spf=pass (google.com: domain of kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev"
Return-Path: <kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9910fd2940si200778266b.332.2024.10.04.02.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 02:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=pengutronix.de);
       spf=pass (google.com: domain of kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvmarm+bounces-16146-alex.bennee=linaro.org@lists.linux.dev"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AD461F21BDB
	for <alex.bennee@linaro.org>; Fri,  4 Oct 2024 09:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91B912EBE9;
	Fri,  4 Oct 2024 09:47:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14433FD
	for <kvmarm@lists.linux.dev>; Fri,  4 Oct 2024 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035269; cv=none; b=J92FK3kP73wK/xz4Q2T0YEyGDSQoBaMqQIKXxMaWX6iAVVzBFKlmym29Uz8Ir+k7LfSooiJpuvhhkvDjDdE/YmtEyCiYywqsA3mhN8sbBgQJiBR8EB3BsnGGEpC4Nu5JWoxJlRqJpvGBtpy/m9Yp5HdU3VtU0e4ga7bKtbKEfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035269; c=relaxed/simple;
	bh=9A6k4PPTKD+QchoqbxsN/vE8iMob1frembJFyHQRBTE=;
	h=Message-ID:Date:MIME-Version:From:Subject:Cc:To:Content-Type; b=exVxUv8mM9iy3vqIrEyyx0+DydWliDlgNvBG2yY/ymftJuWG5AQuSTQHFcQ5XjxF2+goyYg2n7gflKylEZ5qg5SNnu6pIIZSxknyIxEwYLpCAcX5TF4LI/q9p6ruYX6ak93rEU35hQ6WQtdIvvKJdVjTvfij++D7oGGfHgQj/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1sweuW-0007En-7h; Fri, 04 Oct 2024 11:47:44 +0200
Message-ID: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
Date: Fri, 4 Oct 2024 11:47:41 +0200
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
To: qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kvmarm@lists.linux.dev
X-TUID: OZoK3bpS3upA

Hi,

I am investigating a data abort affecting the barebox bootloader built for aarch64
that only manifests with qemu-system-aarch64 -enable-kvm.

The issue happens when using the post-indexed form of LDR on a MMIO address:

        ldr     x0, =0x9000fe0           // MMIO address
        ldr     w1, [x0], #4             // data abort, but only with -enable-kvm

Here's a full example to reproduce this:

start:
        mov     w10, 'o'
        bl      putch

        bl      amba_device_read_pid

        mov     w10, 'k'
        bl      putch

        ret

amba_device_read_pid:
        ldr     x0, =0x9000fe0
        ldr     w1, [x0], #4             // data abort unless #4 is removed or KVM disabled
        ret

putch:
        ldr     x8, =0x9000018
1:
        /* Wait until there is space in the FIFO */
        ldr     w9, [x8]
        tbnz    w9, #5, 1b

        /* Send the character */
        mov     x9, #0x9000000
        str     w10, [x9]
2:
        /* Wait to make sure it hits the line, in case we die too soon. */
        ldr     w9, [x8]
        tbnz    w9, #5, 2b
        ret

It assumes 0x9000000-0x9000fff is a PL011 UART as is the case on the Virt platform.
It will print an 'o', try to access 0x9000fe0, which contains the first byte
of the AMBA Product ID and then print a 'k' using the same PL011.

To build:

  aarch64-linux-gnu-as reproducer.S -o reproducer.o
  aarch64-linux-gnu-objcopy -O binary reproducer.o reproducer.bin

To run (whether -bios or -kernel doesn't seem to matter):

  taskset -a --cpu-list 2-5 qemu-system-aarch64 -bios reproducer.bin -machine virt,secure=off \
  -cpu max -m 1024M -nographic -serial mon:stdio -trace file=/dev/null

When run _without_ kvm, this will output:

  ok

When run with -enable-kvm, this will trigger a data abort in amba_device_read_pid:

  o

The data abort can also be avoided by removing the post index-increment:

  -ldr     w1, [x0], #4
  +ldr     w1, [x0]

This doesn't introduce a functional difference, because x0 isn't used again anyway,
but it makes the code work under KVM.

I am using debian-arm64 Bookworm on an Amlogic A311D (4x CA72, 2x CA53) with:

  QEMU emulator version 9.1.50 (v9.1.0-704-g423be09ab9)
  Linux 6.11-arm64 #1 SMP Debian 6.11-1~exp1 (2024-09-19) aarch64 GNU/Linux

This issue was first noticed by openembedded-core CI while testing this patch series
adding support for testing the barebox and U-Boot bootloaders:

https://lore.kernel.org/all/ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de/

AFAICS, the U-Boot breakage has the same root cause as barebox', except that it's
a str instruction that has the post-increment and the PCI MMIO region is what's
being accessed.

I haven't been successful in getting QEMU/GDB to trap on data aborts, so here's an
excerpt from my original barebox stack trace instead that sent me down the rabbit
hole:

  DABT (current EL) exception (ESR 0x96000010) at 0x0000000009030fe0
  elr: 000000007fb2221c lr : 000000007fb22250
  [...]
  
  Call trace:
  [<7fb2221c>] (amba_device_get_pid.constprop.0.isra.0+0x10/0x34) from [<7fb01e3c>] (start_barebox+0x88/0xb4)
  [...]

This looks pretty much like a bug to me, but then I would have expected more
software to be affected by this.. Maybe it's memory mapping related?
I only tested with either MMU disabled or MMIO region mapped strongly-ordered.

Please let me know if there's further information I can provide.

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

