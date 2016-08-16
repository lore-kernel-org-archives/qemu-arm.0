Received: by 10.25.21.156 with SMTP id 28csp1936224lfv;
        Tue, 16 Aug 2016 05:03:37 -0700 (PDT)
X-Received: by 10.55.15.169 with SMTP id 41mr36822085qkp.229.1471349017375;
        Tue, 16 Aug 2016 05:03:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si17319442qtb.55.2016.08.16.05.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 05:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZd5k-0000f6-S8
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 08:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5Z-0000YN-GM
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 08:03:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5V-0002eU-B6
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 08:03:24 -0400
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:35461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bZd5V-0002eN-4B; Tue, 16 Aug 2016 08:03:21 -0400
Received: by mail-pa0-x244.google.com with SMTP id cf3so5194077pad.2;
	Tue, 16 Aug 2016 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zTcRGI+wNqC32tDamNpA8kQVWnY248HLsdpIG2MK19Q=;
	b=ozOaQdCGTsuc258MTRGWUAMKDX8qahbGKNOFyQuGJtdiID4s8CYS3EDIl6RDu+/88I
	TmHVqaiy60kWOn+IF2B28n6ZlGxARRrc0UR0RR3njIvuhnSsU35nNp2ic1UWpvclvcPC
	mmDbts7mOU0PCSyaDZ9bw8M3f97UTRHRHkKFxeCzOm9zJItEObvxGcssPzWbNRpzTUQv
	xL07xCWfZy3BE9fOg13SM/Ruqy2aKWA483gliWFnUBH4tc69FFYkpjp6/60yQyiHvDQU
	Qzn9j/N7OdUlWyWrUVYX4dJW5iLelYytCc5lFRFgFqxShFR9/vTjeKGLC2er5UQGSHV7
	b9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zTcRGI+wNqC32tDamNpA8kQVWnY248HLsdpIG2MK19Q=;
	b=IWbKffiemjyNq8U/g779GJjBLPOA55ajRZIBU6ZtxmhxJ9IhpToqBmqIMNyVhHgBzW
	RsekisOcxgn3+VtkwA6qYw7bb0+cSq1F4ZVIagCzKvRZh/3zIokspfymdPwajXeXAdfm
	WZO+rnjc6wjJD1PepLBU7mnfL/YtRjQi6aLhw8oPrJxECdlN1Y+MP8Lu+21J07UYLPGj
	y2puI6qc7F+5W7QDufrnhZ5XQHjbzZuDnLikDfSthJUf49Kgdw3rAWeVt4Y0aK34qUr1
	Yawcv9/PMSvMojfPGCqwo/m3gHvLGTK3B7cUAz2zJzJ9obmk3dZhZWyFWIYdjkFld2R6
	LtgQ==
X-Gm-Message-State: AEkoousdrHQQ3ze9IrvEuJDCp/jdY+GW6tc88cM7jaGTVjgMSheqDy/VkvogrpW9DjS1JA==
X-Received: by 10.66.165.67 with SMTP id yw3mr64077970pab.8.1471348999903;
	Tue, 16 Aug 2016 05:03:19 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	u72sm38850990pfa.31.2016.08.16.05.03.12
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 05:03:19 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Tue, 16 Aug 2016 17:32:46 +0530
Message-Id: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Subject: [Qemu-arm] [RFC PATCH v2 0/2] Live migration optimization for
 Thunderx platform
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LNKWhYFztx5D

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

v1 => v2:
   - Rename util/cpuinfo.c as util/aarch64-cpuid.c
   - Introduced header file include/qemu/aarch64-cpuid.h
   - Place all arch specific code under define __aarch64__ and
     CONFIG_LINUX.
   - Used builtin_prefetch() to add prefetch instruction.
   - Moved arch specific changes out of generic code
   - Dropped prefetching 5th cache line.

Vijaya Kumar K (2):
  utils: Add helper to read arm MIDR_EL1 register
  utils: Add prefetch for Thunderx platform

 include/qemu/aarch64-cpuid.h |  9 +++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 94 ++++++++++++++++++++++++++++++++++++++++++++
 util/cutils.c                | 31 +++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 include/qemu/aarch64-cpuid.h
 create mode 100644 util/aarch64-cpuid.c

-- 
1.9.1

