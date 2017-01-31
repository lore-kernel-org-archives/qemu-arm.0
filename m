Received: by 10.25.77.65 with SMTP id a62csp46880lfb;
        Tue, 31 Jan 2017 09:11:16 -0800 (PST)
X-Received: by 10.55.5.11 with SMTP id 11mr27928107qkf.262.1485882676333;
        Tue, 31 Jan 2017 09:11:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si12378930qki.207.2017.01.31.09.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 09:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYbxb-0004WP-Mw
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 12:11:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDH-0001By-PL
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDH-0001G8-1L
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:23 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYbDG-0001Fn-SF; Tue, 31 Jan 2017 11:23:22 -0500
Received: by mail-pf0-x243.google.com with SMTP id 19so28543276pfo.3;
	Tue, 31 Jan 2017 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TYCBImyZNkx0E0I+UqndVhLqkWaD4AtCP3eImJOXMBs=;
	b=Cw2297lacSxRYprEwRZqQ0RY3fuBjGSOACZgyF/YdpMRvZ4GxUAhzaxPO64GNeAccH
	4Hz++yFl9pLsM9TOhlsrFusRY1uurmS4urAkh/1VD3Hxn88O9RSSVMIAf/S2gbhDlMQP
	FIcgBhfw5fCxvdzVH/2nA56ylmqhwAuZxj7GB2pGwosyITpedniwKvI7QAs6rq5AeQlY
	C+WEL6WGh4DRwcgWCze+rJdqQmI4VW58fh2jcoFrSM15IkwrXDLIYghh/dWSASdPeiqr
	YK+hz87pfE2b6PuMTccgcKvNCP4vBSqlGqpWJkUdFea8gyQYoiorjtls9PGfkwE9ZYfB
	A+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TYCBImyZNkx0E0I+UqndVhLqkWaD4AtCP3eImJOXMBs=;
	b=ABu0qLD9Iz9LXl9UICFmGX6QrsriwIonVd0IvWHBFmBpyYZSfPE1ccjQO7ID+1SGll
	NYTEWJggAc36P1LmF+lXr+qEtBXcTgLfxyIPoB88ExUrnwc7fyDen7TbZI6MHiVYdQhN
	Ejlf1fJeIr1UgvrVSB7+wMhy7hUOTwk7sjXCMxGEKrRYtx1b4FN5Tks/pzuQ+LlcRCHJ
	21MoCjSdSNv5GdmkUgdJBVt3hEOQdrh1fhiGjTdp6DdpKqluYkR9kDFfKSsfsBgIQNBW
	nMClZJaw70us3FMY+dQZfVBKlFsEda1m2my1tV54Wu+nfXy1Tijw2jaun8yIPJ+Cf2Qk
	TOfQ==
X-Gm-Message-State: AIkVDXK8epzrd/omtclhHYDt7+WIIx5Qi/hwSbwbRWK8Eiedsmvlp1lyre9HYTgWdV/oTg==
X-Received: by 10.98.37.132 with SMTP id l126mr30333879pfl.45.1485879801960;
	Tue, 31 Jan 2017 08:23:21 -0800 (PST)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	z70sm42377261pff.26.2017.01.31.08.23.19
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:23:21 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:52:59 +0530
Message-Id: <1485879782-6075-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v7 RESEND 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXLObOGuJ7IB

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

To Save and Restore ICC_SRE_EL1 register Add ICC_SRE_EL1 register
to vmstate and GICv3CPUState struct.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_common.c         | 1 +
 include/hw/intc/arm_gicv3_common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0f8c4b8..f3245d9 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -68,6 +68,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
         VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
+        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
         VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
         VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
         VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 341a311..183c7f8 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -166,6 +166,7 @@ struct GICv3CPUState {
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
     /* CPU interface */
+    uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
     uint64_t icc_pmr_el1;
     uint64_t icc_bpr[3];
-- 
1.9.1

