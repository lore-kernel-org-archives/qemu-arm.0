Received: by 10.25.0.6 with SMTP id 6csp228996lfa;
        Tue, 9 May 2017 09:51:04 -0700 (PDT)
X-Received: by 10.200.36.232 with SMTP id t37mr1125861qtt.264.1494348664058;
        Tue, 09 May 2017 09:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494348664; cv=none;
        d=google.com; s=arc-20160816;
        b=nQe9aC/FlYCG15ZoivGW0tXI2zemFYpHMhh/9HHYzXzE517jPXeZgpNQFZIizth4Nh
         4r0iOu9B9thzlLL7AhMP0ccV2w8qx2GPVHQenxhHhsw0KO9A+v2GWukzh4LWhttOXfSE
         DNFqlKum2mDPA4hvsLpdHkPPzkMEu+RPbzXEDUgZNM7vjll1S93+LRn0RXJvarnI0Rsz
         EY8MrQFgl6kTPPYH54UHLEF+DxgsTzuvaIhpqaMmcSLxvCwtm5LX9CnXa32Zfp/DHLTg
         UEVDrKiKrEH+1zcqJpS0OBLyDv4irclZqCHxxTUn9/l3mWbUkjo7boQIea10KsmTGzpQ
         Vs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hH5RmFeGHzr6kXcvWp8HlI97S0oyuFyxOsssafGyUUw=;
        b=IE2pzIa+ryZjldsUfEXwuuB6szTLDFCRzkJ+4XT9J/XnmRt+AaVdDH9h7W706Ga2y8
         h4kYEpz6Ib0YEY7yLSRSQlo9wlUEkNtJpTAVOvSq+XV/X1zk/fAkpdEmyNMCy5GV3x0w
         lbiqNzsxHAEYubQgFSeN5CgOuDbvlc2cw0JAlTT2YPjvneNdig+X+lmKboz5uyhB4TU2
         FoUKOpt9qAHFMlW3T4hw68kVtVXG22ov12HtmBehEojUk+QtYmHdSEAIFpgklZxANgdl
         YAEIUywrNAob9aqapalTNwqJnaLLfey9zl83cAyDy3g33UU/ixpIPsFZBOqJKhAqNOMX
         ZceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si543278qkl.160.2017.05.09.09.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 09:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d88Ln-0003zy-HK
	for alex.bennee@linaro.org; Tue, 09 May 2017 12:51:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88KJ-0002vg-0r
	for qemu-devel@nongnu.org; Tue, 09 May 2017 12:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88KH-0006jx-Qv
	for qemu-devel@nongnu.org; Tue, 09 May 2017 12:49:31 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88KB-0006fy-Jk; Tue, 09 May 2017 12:49:23 -0400
Received: by mail-qk0-x244.google.com with SMTP id u75so917287qka.1;
	Tue, 09 May 2017 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hH5RmFeGHzr6kXcvWp8HlI97S0oyuFyxOsssafGyUUw=;
	b=VjKDVSeAAzb77ZdiY9AWkZi+ldNEhrecP1yJSBx1FWWdlnKUV2xcipGMSx1J9L7aJg
	81zRW2sOXI254/wxQxFwFt084wvDlbXE5aweKDeur215Ytmdy3w+NEB0k5dst6FtGgkn
	sHRfPskR7zU1NFh4T8Ic/Fb+L1a9gT5+eJQ+qfQrw7yDPV/KNy2KYHxr06rrkp2othpQ
	mf+kKVnhl6hkxwqQL0e381pPtJMWllxVC1wIQInZ/409dDmMlTH8kNTOk4Cy5JN5MgAh
	UI5bDQOh3eeAYOAsoWzKVIlyG09Pj507L/aMdnRiIlvq0Mt1ivbYFRalNyIQBY5/wP13
	Zq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hH5RmFeGHzr6kXcvWp8HlI97S0oyuFyxOsssafGyUUw=;
	b=jFvnpWe8ROaOLSLa670ThzuAAB+PjtITovPNPMBPDrSGHvStcEXAXa2P8cljVKumHN
	cYNS4aRW8QVpbKSr/1Hru9PfX+TinbSsl2gKfWhkwnJWuvEIp15E+unIRJqxRJ6jcOzT
	f7l8KQHy4HsJkhCyjHQGPucW/RjJQYxed40yYDLS8ehln3QfVoJ3G/De33zcvTvuZhi8
	V/UKPIite7jx6KZTKRjZ4zIDzPRfYkyXy01TpfU9rZRZqKyjs2v+CySpBJ0Ae7u20Fym
	s7qYbHNbJEmMYt98gwiW8jR+4qpi2IKocZRlY1pzplZPGMZ1H+a7x9B/MLsGtL3DmiEI
	LNjA==
X-Gm-Message-State: AODbwcBCrHX9OO+JTAlE7Rduifs7z8SyxDbtTxTQ3D8UG+fBp7F8MHvn
	3ZUBqHRD7m6XQQ==
X-Received: by 10.55.179.1 with SMTP id c1mr1114337qkf.232.1494348562941;
	Tue, 09 May 2017 09:49:22 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id p48sm357558qte.4.2017.05.09.09.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 09:49:22 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-3-f4bug@amsat.org>
	<2cd1e7a1-7f92-88a2-cf98-0dcea0a2f9b1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f7e86a1d-f53e-5dfa-e8d2-5dd2e860879a@amsat.org>
Date: Tue, 9 May 2017 13:49:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2cd1e7a1-7f92-88a2-cf98-0dcea0a2f9b1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [RFC PATCH 02/11] hw/pci: define msi_nonbroken in
 pci-stub
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jISEBdqcZH2z

Hi Thomas,

On 05/09/2017 02:19 AM, Thomas Huth wrote:
> On 09.05.2017 01:39, Philippe Mathieu-Daudé wrote:
>> This field is accessed in hw/intc/arm_gicv[23*].c
>
> default-configs/arm-softmmu.mak sets CONFIG_PCI, so this should not be
> necessary, I think. Otherwise, you should extend your patch description,
> to elaborate on what you're trying to do here.
>
>  Thomas

Sure, I'm willing to add basic support for the TI Hercules MCU which is 
a big endian SoC (without PCI support).

I'm using the following config:

$ cat default-configs/armeb-softmmu.mak
# Default configuration for armeb-softmmu
CONFIG_ECC=y
CONFIG_SERIAL=y
CONFIG_PTIMER=y
CONFIG_SD=y
CONFIG_SSI=y
#CONFIG_USB=y
CONFIG_PLATFORM_BUS=y
CONFIG_ARM_V7M=y
CONFIG_ARM_GIC=y
CONFIG_ARM_TIMER=y
CONFIG_PL011=y
CONFIG_PL022=y
CONFIG_PL031=y
CONFIG_PL041=y
CONFIG_PL050=y
CONFIG_PL061=y
CONFIG_PL080=y
CONFIG_PL181=y
CONFIG_PL190=y
CONFIG_PL310=y
CONFIG_PL330=y
CONFIG_BITBANG_I2C=y
CONFIG_GPIO_KEY=y
CONFIG_HERCULES=y

I had to modify default-configs/arm-softmmu.mak to restrict a bit 
hw/arm/Makefile.objs, see:

https://github.com/qemu/qemu/compare/master...philmd:armeb_wip

In this branch I run:

$ ../configure --target-list=armeb-softmmu && make -j
[...]
   LINK    armeb-softmmu/qemu-system-armeb
../hw/intc/arm_gicv2m.o: In function `gicv2m_realize':
qemu/hw/intc/arm_gicv2m.c:154: undefined reference to `msi_nonbroken'
../hw/intc/arm_gicv3_its_common.o: In function `gicv3_its_init_mmio':
qemu/hw/intc/arm_gicv3_its_common.c:110: undefined reference to 
`msi_nonbroken'
collect2: error: ld returned 1 exit status
Makefile:201: recipe for target 'qemu-system-armeb' failed
make[1]: *** [qemu-system-armeb] Error 1
Makefile:327: recipe for target 'subdir-armeb-softmmu' failed
make: *** [subdir-armeb-softmmu] Error 2

This MCU does not use a GIC so I can also remove it, but this error 
seems odd to me.

As I understand the 'msi_nonbroken' is a kludge (there is no intrinsic 
relationship between PCI/MSI and this particular interrupt controller).
Since it is declared as extern in "hw/pci/msi.h" why not define it in 
pci-stub?

Regards,

Phil.
