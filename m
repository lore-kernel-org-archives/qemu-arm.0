Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2608093wrp;
        Thu, 26 Sep 2019 13:32:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCi9/x/lbKLL4MfWpCSu9uCvy2V3TLWcLPZVng/rb/RTsnSe7vUTt9fHlYfm+ERHhBgL7x
X-Received: by 2002:ac8:74d0:: with SMTP id j16mr6161057qtr.244.1569529958392;
        Thu, 26 Sep 2019 13:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569529958; cv=none;
        d=google.com; s=arc-20160816;
        b=sZtcKC1C3Rv0Yj07t13biGaTnvdpjycm8T16zylsiXzj5zFHEo9FMWKPqYUnU9idnn
         3V8bVMrpGTEWqFV9nkNN5QDjEd0QsSmMzMEEQcmLHY9NcYl7elxO9Fwc5ToQBitQGLar
         CDikFQ9du3eD86gMT6nKilYI3K0HyBEroa8hrazYvkaujUtdjEv+ww75FhFM+9Da2ILZ
         gzpqb42O/ggfG53RHch4ZyJT1DMBc4Nki56PWRELM9gZ0OqmWmqXfOPe8/GK6E4+gd85
         R1pu+ydiy6B4sMojcgC209Al7D9ccEUdud/KgutfY6UWVfEe6JgR/eFXk5k4vvBREeFq
         ycYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-id:mime-version
         :user-agent:references:message-id:in-reply-to:subject:to:from:date;
        bh=L9h0mhiqNP2PDE5Y/fNuPpCKjF5BmhZS5jh2cwso+/E=;
        b=lY4vZIE/IACjZkwDB8KJvmuDgmlfL//ruZ29toBv1uicmVrUecGg+Ii7Ho+ADT14wv
         eSrofVuf5KV1qGrjbKXxBXqz6fLvugaIQhNq7lCkf6uW9xcsrfwncJcmnzwWNLwn9trh
         nMRSEOuJJQ5DTjRtrJV6MwmUR7XhmF5/UFOtylizBlIxKAcIKoHvLefh75CW9ef2JcQT
         p2dygjClos+QA6jKJISVif+xFAQ6fdfdUDnxvl0FYbLz288cKJoQOXTgdW5XDT/99vVN
         ZeMn35LptizH2J1akV1PoGpYWrd6jYGdmS+pFKtfkV1I8dfpwexoTdE3S4nqJqHvNkH3
         4r9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si2586712qtj.349.2019.09.26.13.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 13:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDaRJ-0002wm-Sy
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 16:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1iDaR9-0002wQ-5H
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 16:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1iDaR6-0008Ds-Pn
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 16:32:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:50249)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1iDaR6-00085U-JU; Thu, 26 Sep 2019 16:32:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6994574AAAC;
 Thu, 26 Sep 2019 22:32:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4CF1B749FDB; Thu, 26 Sep 2019 22:32:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4BB25749EDE;
 Thu, 26 Sep 2019 22:32:14 +0200 (CEST)
Date: Thu, 26 Sep 2019 22:32:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/19] hw/arm/raspi: Improve Raspberry Pi 2/3 reliability
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.21.9999.1909262221020.91838@zero.eik.bme.hu>
References: <20190926173428.10713-1-f4bug@amsat.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-895926101-1569529556=:91838"
Content-ID: <alpine.BSF.2.21.9999.1909262227160.91838@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Put/e9Xab/V9

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-895926101-1569529556=:91838
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-ID: <alpine.BSF.2.21.9999.1909262227161.91838@zero.eik.bme.hu>
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Sep 2019, Philippe Mathieu-Daud=E9 wrote:
> and got it almost working (boots Linux kernel to userland, sadly
> I'm still having timeout issues with the eMMC block).
[...]
> $ make aarch64-softmmu/all check-venv
> $ ./tests/venv/bin/avocado --show=3Dapp,console run -t machine:raspi2 -=
t machine:raspi3 tests/acceptance
> JOB ID     : 10bf6593659f0b191941265c19fe3dbf1652c3e7
> JOB LOG    : /home/phil/avocado/job-results/job-2019-09-26T19.04-10bf65=
9/job.log
> (1/4) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
raspi2_uart0: \console: [    0.000000] Booting Linux on physical CPU 0xf0=
0
> console: [    0.000000] Linux version 4.14.98-v7+ (dom@dom-XPS-13-9370)=
 (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1200=
 SMP Tue Feb 12 20:27:48 GMT 2019
> console: [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARM=
v7), cr=3D10c5387d
> console: [    0.000000] CPU: div instructions available: patching divis=
ion code
> console: [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT a=
liasing instruction cache
> console: [    0.000000] OF: fdt: Machine model: Raspberry Pi 2 Model B
> console: [    0.000000] earlycon: pl11 at MMIO 0x3f201000 (options '')
> console: [    0.000000] bootconsole [pl11] enabled
> console: [    0.000000] Memory policy: Data cache writealloc
> console: [    0.000000] cma: Reserved 8 MiB at 0x3b800000
> console: [    0.000000] percpu: Embedded 17 pages/cpu @baf2e000 s38720 =
r8192 d22720 u69632
> console: [    0.000000] Built 1 zonelists, mobility grouping on.  Total=
 pages: 243600
> console: [    0.000000] Kernel command line: printk.time=3D0 earlycon=3D=
pl011,0x3f201000 console=3DttyAMA0

Not sure what timeouts you get related to eMMC but previously we've found=
=20
that panic at boot due to mmcblk not ready is avoided with the "rootwait"=
=20
kernel option which does not seem to be present in most of these tests.=20
(It's also not present in images for real hardware so likely this only=20
happens with QEMU but not on real hardware. Could it be that real hardwar=
e=20
is slower so timing is different?)

Regards,
BALATON Zoltan
--3866299591-895926101-1569529556=:91838--
