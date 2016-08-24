Received: by 10.25.21.156 with SMTP id 28csp273622lfv;
        Wed, 24 Aug 2016 04:25:57 -0700 (PDT)
X-Received: by 10.55.191.2 with SMTP id p2mr2627287qkf.77.1472037957178;
        Wed, 24 Aug 2016 04:25:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q66si5991655qkb.116.2016.08.24.04.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 04:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcWJg-0004BN-LV
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 07:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJd-0004BE-Pv
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJY-00056S-QV
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:25:52 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bcWJY-000566-Kv; Wed, 24 Aug 2016 07:25:48 -0400
Received: by mail-pf0-f196.google.com with SMTP id g202so1079256pfb.1;
	Wed, 24 Aug 2016 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ygBFzrfFGGss1md2rH+d3FVQT6KfApqZzmJD8ZwqAOk=;
	b=UybSghxq8FwXy7wwvF7cmuNo1zKgn840O/1kN8m53gx7a8olrYKbuey2ZXKWGD8XvZ
	KlWsXTqbNF5TNnZxN4O0FE7rsjVjksakvoPZGFM8ny+sttQQw9M36wjYCKIRqDLlG0kM
	nUxUc8eT8zkJNgkuok7snNVPFQrVNi6x3V308ykx+QMfto4LZMww5yqwIrLOKcFPplZ/
	Eb/pGKt3k+jtMQK/HWX+QqG7vdKitFRBucDIviE67iNKqs3c6kCqhqv8ttDlhEXD33x6
	++Pv6ORd0ecqnRl6zhau0WQa0JPey3env8A243owsZPM3Xzddl9EBQOUS4n9PPh46YD3
	MeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ygBFzrfFGGss1md2rH+d3FVQT6KfApqZzmJD8ZwqAOk=;
	b=BMXdwD02ZJH1LipBRwJ4rW0+1Q0nPPGI4b8J3ZgBmzFYJsBu5aE13C1FSsrsC3rUmQ
	16W+4KpeezNNuaowJFCOWlu6Yr5dKg/3kEEdIRO79+qS0g6rDafbgFlZx4nYn9O45EoN
	KWvwGeReSvcaUycBKv8sEL8Zh7ufMoCq7lUdcDi4FWxbcoVrSz4dhQFl1BZMqJtkFtGO
	HelNC9JuBRdg5nlXbUkyT8UTsBMXYR8uF2gHV3PKFTXhfjtXyjWet0uHaZvipXset+jB
	G3sOo8VIoziDVtezxrBgjUwHTp0Bfm2UIxQgbrngCGwzI24wC+Kfeba/zOc+jQIERPNj
	mm6w==
X-Gm-Message-State: AE9vXwNWo3qUEDREbCnV91l5sQiOxFoX4AMzgV8GNUwagjRtZkQXZhp1jh1P/92NGGZ0Kw==
X-Received: by 10.98.60.217 with SMTP id b86mr4624773pfk.129.1472037887590;
	Wed, 24 Aug 2016 04:24:47 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	p187sm12919193pfb.5.2016.08.24.04.24.44
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 04:24:47 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed, 24 Aug 2016 16:54:32 +0530
Message-Id: <1472037874-4356-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.196
Subject: [Qemu-arm] [RFC PATCH v3 0/2] GICv3 live migration support
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
X-TUID: WWEkuOH9+80W

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

v2 => v3:
 - Dropped offset GICR_SGI_OFFSET
 - Implement save/restore of irq line level using
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
 - Fixed bug with save/restore of edge_trigger

Vijaya Kumar K (2):
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Implement get/put functions

 hw/intc/arm_gicv3_kvm.c       | 518 +++++++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h      |  29 +--
 linux-headers/asm-arm64/kvm.h |  24 +-
 3 files changed, 541 insertions(+), 30 deletions(-)

-- 
1.9.1

