Received: by 10.80.163.71 with SMTP id 65csp881251edn;
        Mon, 12 Sep 2016 09:44:56 -0700 (PDT)
X-Received: by 10.55.11.137 with SMTP id 131mr20125030qkl.65.1473698696258;
        Mon, 12 Sep 2016 09:44:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o63si11645454qkb.89.2016.09.12.09.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 09:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjULn-0000f4-Po
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 12:44:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bjULg-0000cn-Kk
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 12:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bjULb-00025F-EE
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 12:44:47 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bjULb-0001x4-8Q; Mon, 12 Sep 2016 12:44:43 -0400
Received: by mail-pf0-f193.google.com with SMTP id i75so3400560pfa.2;
	Mon, 12 Sep 2016 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XhWaZSrngBoDnwxUeiQ/FeuvLXL/YgoASCm2tVuSuks=;
	b=nLWsxlYwPTpzbrCnWPr/D/03DT5xc0LlAn20HuDDASCOJx97grnhqUYMh8z8pvrQ0X
	kmK4foaIvm2YxmrkFrp1OCs/RuIGgdlqrkn9XcMTwTVy7IftbkAIlaOBe0qOhAJpHb0k
	qZPnGebtXwY/IY1Qg/OxFG+SPWjkN9xmbK6evSiQzLbIVtpQAjaIsJfRLfABLdd1/YrG
	Q9dERUADaezJBI2r+bq84oeGj3LwByKQbutnLUni9XlCwB+qIMDdFQ1+heqDaNZjqGI4
	PyekB4+ZhoCKMCSfPxkRflo2PRUC3f9v/SN0277WMWsggh0Aw3XJ/w+vxmrfLdhdTH4C
	a6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XhWaZSrngBoDnwxUeiQ/FeuvLXL/YgoASCm2tVuSuks=;
	b=bBXW27cGXVI1FHnIDWKmTnhB9kxsLKvREpgoHIN2TLieKYu5ub8NvEF/pTXvkeBd/C
	iH7in4ipc6JOb0j0+f9FqgZVvRyZqqeQodvddDmfHwe36+z/mq92zB81nnWx412nX5G/
	vETxByT9xourRqXuCapqUnLRuzFyzD6klc4l0w0u/uihYhmRQF9Pn0+7WRPaqhH1w3Bm
	OVI+hnCeAucdtUKNCo9xMAQ4wdLeKiK4gsDGAHFvRPxMuDcz6s2aIEQKAVNoKW+l+Z2J
	z/iEevCSZ9D9xjPyhJNb6oRg+d8M5Gjnw+ibZQSlcqDJA+HtQwYdOMIPMOpPRRXaVyGN
	XGeg==
X-Gm-Message-State: AE9vXwOPcISZcYWpudfmyZvzLqZJNTCWlfXGII7lfwGj7z5T2thcvrcht9h+tSbq8UdFFA==
X-Received: by 10.98.0.69 with SMTP id 66mr22791673pfa.140.1473698600082;
	Mon, 12 Sep 2016 09:43:20 -0700 (PDT)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	s12sm25734728pfj.73.2016.09.12.09.43.16
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 09:43:19 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net, marc.zyngier@arm.com
Date: Mon, 12 Sep 2016 22:12:55 +0530
Message-Id: <1473698577-18365-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.193
Subject: [Qemu-arm] [RFC PATCH v4 0/2] GICv3 live migration support
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
Cc: p.fedin@samsung.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rCtVMxQzV+kA

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This series introduces support for GICv3 live migration with
new VGIC implementation in 4.7-rc3 kernel.
In this series, patch 1 of the previous implementation
are ported.
https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg05284.html

Patch 2, is based on below implementation.
http://patchwork.ozlabs.org/patch/626746/

Kernel patches which implement this functionality are:
http://www.spinics.net/lists/arm-kernel/msg519596.html

This API definition is as per version of VGICv3 specification
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/445611.html

Patch 1 of this series will be synced with KVM patches
in next revision.

Tested Live migration of Idle VM running with 4 VCPUs and 8GB RAM.

v3 => v4:
 - Reintroduced offset GICR_SGI_OFFSET
 - Implement save and restore of ICC_SRE_EL1
 - Updated kvm.h header file in sync with KVM v4 patches

v2 => v3:
 - Dropped offset GICR_SGI_OFFSET
 - Implement save/restore of irq line level using
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
 - Fixed bug with save/restore of edge_trigger

Vijaya Kumar K (2):
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Implement get/put functions

 hw/intc/arm_gicv3_kvm.c            | 530 ++++++++++++++++++++++++++++++++++++-
 include/hw/intc/arm_gicv3_common.h |   1 +
 linux-headers/asm-arm64/kvm.h      |  13 +
 3 files changed, 534 insertions(+), 10 deletions(-)

-- 
1.9.1

