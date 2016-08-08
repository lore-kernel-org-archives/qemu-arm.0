Received: by 10.25.21.156 with SMTP id 28csp103485lfv;
        Mon, 8 Aug 2016 09:53:18 -0700 (PDT)
X-Received: by 10.200.45.8 with SMTP id n8mr29913499qta.57.1470675198129;
        Mon, 08 Aug 2016 09:53:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15si8073837qtc.59.2016.08.08.09.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 09:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWnnh-0001mk-Gj
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 12:53:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnm9-0000q5-Qr
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 12:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnm7-0004O5-Fn
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 12:51:40 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bWnm2-0004Mv-6R; Mon, 08 Aug 2016 12:51:34 -0400
Received: by mail-pf0-x243.google.com with SMTP id g202so25375011pfb.1;
	Mon, 08 Aug 2016 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cQDsVEcC711i1/TtYVZc+apD/toxUY0vKEJ/1niQ6sQ=;
	b=XyVhacBfRI6LdkloGGkRDSzzPxbXKi8A6jMImBbtQpToUJ3i+/H1aFieLKR0GYg5WU
	sFZG5VoIH9BZcEbuk6dWYVnODW30FIk1Amm+ptWhAIblOTLF5gjWwv8SZlcGGm0CWLhA
	Osckvht4b9sRzZ9e/P2zL5Z2ciWVR8hOKYdu4S+daSSpAbx10AdFB4w/QwYXkkAd4+xJ
	rNQWPtsczMV61lPjRKP6nqGU0eXd6tyXImuUxxLGXzxilHZ9oB6LvzlDjR/rnTBly8tz
	EwBoSq7Ww5lrX+OVgFeff5xZM0nuSsFqS2M2jjUa/uS42vo/L4+fAm0tOqGtyQd6CmJI
	Zwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cQDsVEcC711i1/TtYVZc+apD/toxUY0vKEJ/1niQ6sQ=;
	b=Ja4qTKr/LBMUDSVe2cnzTNxkUBYbm1PTFEEXdBwx/abwo9p1PhMirxuG2um+E/AE6K
	xuZPnnvhJwH5ey8XX7Ql4pqBUm5xwwVkBQnxHrz1m5lLGatNtwZ6i7unKwRqTwFalrYI
	c4dZhcw/UDXv6pY92awSEdgnv/iObI2EIBehYWACJKUrEurHVqs2igLnzzf1ItqQZ8pJ
	HFr32jqJvoi9MF/1PvboRp8SjFG3lm55yfKCS0KuwpnvD+QAhMlY1r8dwhH8tYBimfm3
	+v6Y+VcQAeZTQOBwxBg/JeZG6KTEMYLJUQqlPdzK7V4B1It9tEIxJKg3EQ75ctkPaQwz
	snCg==
X-Gm-Message-State: AEkoouuQ23I3sBximVWkGVdrrGuVCE51kkzA+0W3SKoPxYFRpuA59GGPjW33C/NtcsWaIw==
X-Received: by 10.98.15.145 with SMTP id 17mr164046807pfp.40.1470675093130;
	Mon, 08 Aug 2016 09:51:33 -0700 (PDT)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id 6sm40282916pab.11.2016.08.08.09.51.29
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:51:32 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Mon,  8 Aug 2016 22:21:09 +0530
Message-Id: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [RFC PATCH v2 0/2] GICv3 live migration support
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sIcLx3H8cua4

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

Vijaya Kumar K (2):
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Implement get/put functions

 hw/intc/arm_gicv3_kvm.c       | 474 +++++++++++++++++++++++++++++++++++++++++-
 linux-headers/asm-arm64/kvm.h |  17 +-
 2 files changed, 478 insertions(+), 13 deletions(-)

-- 
1.9.1

