Received: by 10.25.21.156 with SMTP id 28csp1645073lfv;
        Tue, 26 Jul 2016 04:02:45 -0700 (PDT)
X-Received: by 10.37.201.131 with SMTP id z125mr17276791ybf.183.1469530964549;
        Tue, 26 Jul 2016 04:02:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p186si123684qkf.249.2016.07.26.04.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 04:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS08J-0008EQ-Po
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 07:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS082-0008Ds-7W
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS07y-0002nw-55
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:25 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bS07x-0002ng-UA; Tue, 26 Jul 2016 07:02:22 -0400
Received: by mail-pf0-x242.google.com with SMTP id g202so13763838pfb.1;
	Tue, 26 Jul 2016 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uKj17i8s0F8eiS/6TevROz4e0YnnBuHfbV3eCL2Aftc=;
	b=PMRnP0oT7IIWHKWg+izArWFQDA2BzDkbaGj7JlcHis1t1rLmLLrAeT+X+RPcLNEYyA
	0i+rOk/73p+H8/mXTWMDBTDYfy8Kn2zb1wUWk2YDfHlwqMCgYD+1LlrNs/8bM/Yrzsh0
	Pw+uYAu8BviWc1W/h9o/mxJt+BRLaieQJtmEUsVEUQcOgTyxaG8q+LCxJZ8skiR8W/YR
	sxrAaBxEtvTMxQEvs9U57gJ2AX5V/v0buRlbc6UPdsS0vO6eM2hjH8LP7qvVXUALFfBq
	oemKR3CK5eqO1BUL3gRTvRzDxUu99QylnXaSS/i577vMgTtVtOYiYIERF1omE/czx8UC
	67Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uKj17i8s0F8eiS/6TevROz4e0YnnBuHfbV3eCL2Aftc=;
	b=XKEm8/sE/MAhZcM9L7e5WalxSDCQ9ithcxhixQbirszAO87tgKi0zZn6/TqNJgKybV
	wSMj5/HN8N+umXWbHgIV1UQds5aliOmk24BQH8sOJosBr9bjiiOjwfZDYPfLa+JCVha0
	9fcZDk6QgTKSYnVhKGPaCAnOHzUQJyV2UM+shY2bT4R3g4UxL5r3UM9Suo/PgusifK8B
	ShT1nAKMpsc1kwpEksI4YBYbeNtAr2m9HH/xk+x/7WciAlTvbIUnYCTGrX33OlknHfbc
	a2ARszOq3xW5juQS0m+UEz4QvlgRw9pEN8QTKv2HP9kLJGre8m0e4+X24PvvWntxhQ6+
	GT/w==
X-Gm-Message-State: AEkooutZQirTI0DPZV5cQ3Sl7j8pGHQK1mrVE2I6stdpDU7oVNzqzKY4nAHmXF311jJCug==
X-Received: by 10.98.138.153 with SMTP id o25mr9253486pfk.80.1469530939558;
	Tue, 26 Jul 2016 04:02:19 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm584826pat.27.2016.07.26.04.02.16
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 04:02:18 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue, 26 Jul 2016 16:31:54 +0530
Message-Id: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [RFC PATCH v1 0/2] GICv3 live migration support
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
X-TUID: SvtzjNqZeIJT

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This series introduces support for GICv3 live migration with
new VGIC implementation in 4.7-rc3 kernel.
In this series, patch 2 & 3 of the previous implementation
are ported.
https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg05284.html

Kernel patches which implement this functionality are:
http://www.spinics.net/lists/arm-kernel/msg519596.html

This API definition is as per draft version of VGICv3 specification
https://lists.cs.columbia.edu/pipermail/kvmarm/2016-May/020355.html

Patch 1 of this series will be synced with KVM patches
in next revision.

Tested Live migration of Idle VM running with 4 VCPUs and 8GB RAM.

Vijaya Kumar K (2):
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Implement get/put functions

 hw/intc/arm_gicv3_common.c         |    3 +
 hw/intc/arm_gicv3_kvm.c            |  496 +++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |  113 ++++++++
 include/hw/intc/arm_gicv3_common.h |    1 +
 linux-headers/asm-arm64/kvm.h      |   22 +-
 5 files changed, 624 insertions(+), 11 deletions(-)

-- 
1.7.9.5

