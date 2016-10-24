Received: by 10.80.166.35 with SMTP id d32csp2468182edc;
        Sun, 23 Oct 2016 22:55:56 -0700 (PDT)
X-Received: by 10.200.49.240 with SMTP id i45mr13668491qte.40.1477288556679;
        Sun, 23 Oct 2016 22:55:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si10021393qkd.76.2016.10.23.22.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 22:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byYEl-0002xH-Jk
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 01:55:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEg-0002x5-RE
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEc-0004gd-TR
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:55:50 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1byYEc-0004gL-KQ; Mon, 24 Oct 2016 01:55:46 -0400
Received: by mail-pf0-x242.google.com with SMTP id 128so15540146pfz.1;
	Sun, 23 Oct 2016 22:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M25tStJortNdecASMkSanwHFXzZIYF8Zg+jtw3EvDRI=;
	b=W+2GrUjyjLSoc+g7z3aNNsN4CBCBKso59W6E2fZo4HkuHxxnTdYBX6jcMDgAuVGyDF
	nFM+WEOPTCWNi+VcF9oy6Thpo0j77cse2ARSkYsCl2hruaRYhhPKwUwCYykro58wdwdP
	/WxStRz0PwCuKuNuhA9NOqWXQGllcu6LEKWRTEdAag0KnICfmj8NSVZFHYmUh2nT+Gff
	ms8/17xKS2Bw4LvFw0RznvjGtB1CtunYX5BoqLpy7N4dKH2+/749Gye/pGOmO12Nm1bz
	9nwwEnfIE6v6i8d8YN284u8C+0YIi1bpdPcHZwgTaPH3gU3dDYM997stTWgKNIYUpVlk
	z+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M25tStJortNdecASMkSanwHFXzZIYF8Zg+jtw3EvDRI=;
	b=AqA4yLDtjhfKhPulkTflHdiYw9LbGghd5nz6KzVecSj2X3uKir/Txl1zTurLD6H5Ea
	+yhpojgEAGW/NFXKF+wh6D2B6p4q4D1GE70j/0uI7gEwBwE0v4J6Sc09LOTOq2cThxbW
	7vhNWRFbVoXD/FWq9tlGK7lor4Y76Fepm4LiTTNdJJAL01pSng4KJh20Itz2g+2szWEB
	IyCGDUIJ3JaRK1xHzjDTpGTm05WCixLM94hk0N6rNF6uRjfiqRGvGY8J0I9BfIgbzM4i
	CNQdQUrXh+p7Yeuf5lrtIwXGoSYflsnxhlvyYexHlkA/tspfCz7khfBgPjHjSLUkwV5n
	P1pw==
X-Gm-Message-State: ABUngvevMM27ko7cCMnimDVu/AjeLE8vxWe8LpI84uewuLF23wOxBKOO/wgqOXgwODv5Kw==
X-Received: by 10.98.193.68 with SMTP id i65mr15905014pfg.155.1477288544204;
	Sun, 23 Oct 2016 22:55:44 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c5sm21627558pfj.71.2016.10.23.22.55.41
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 22:55:43 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Mon, 24 Oct 2016 11:25:20 +0530
Message-Id: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 0/3] Live migration optimization for Thunderx
 platform
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
Cc: qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tv2YF32Ub10N

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

The CPU MIDR_EL1 register is exposed to userspace for arm64
with the below patch.
https://lkml.org/lkml/2016/7/8/467

Thunderx platform requires explicit prefetch instruction to
provide prefetch hint. Using MIDR_EL1 information, provided
by above kernel patch, prefetch is executed if the platform
is Thunderx.

The results of live migration time improvement is provided
in commit message of patch 2.

Note: Check for size of while prefetching beyond page is
not added. Making this check is counter productive on
performance of live migration.

v2 => v3:
   - Rebased on top of richard's patches.
   - Consider cache line size and line number to prefetch
   - Passed optional parameters to __builtin_prefetch
v1 => v2:
   - Rename util/cpuinfo.c as util/aarch64-cpuid.c
   - Introduced header file include/qemu/aarch64-cpuid.h
   - Place all arch specific code under define __aarch64__ and
     CONFIG_LINUX.
   - Used builtin_prefetch() to add prefetch instruction.
   - Moved arch specific changes out of generic code
   - Dropped prefetching 5th cache line.

Vijaya Kumar K (3):
  cutils: Set __builtin_prefetch optional parameters
  utils: Add helper to read arm MIDR_EL1 register
  utils: Add prefetch for Thunderx platform

 include/qemu/aarch64-cpuid.h |  9 +++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
 util/bufferiszero.c          | 45 ++++++++++++++++++++---
 4 files changed, 137 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/aarch64-cpuid.h
 create mode 100644 util/aarch64-cpuid.c

-- 
1.9.1

