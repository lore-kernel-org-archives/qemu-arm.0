Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1479063wrt;
        Wed, 10 Oct 2018 13:39:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV615Sp8t5+tDhy0lvtbGooHYWQL0ZcoIjPDxcgvLWvMJESDw9gwFyJiKBKDZXEzWZoUBQyyF
X-Received: by 2002:ac8:1770:: with SMTP id u45-v6mr29597144qtk.285.1539203951204;
        Wed, 10 Oct 2018 13:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203951; cv=none;
        d=google.com; s=arc-20160816;
        b=KV1giOfkDuR2CaW8wBMLtEhWNvo8c5+kPD2H1xNsfo1H0wCKOzcHGvqTFfGt1oZNaH
         RNnFQCaRX2j9X6nLymi4IDZdpLQviD/F86CxZmaGyxDk6LzqpL0N0VQ0k/gSce1UGUS9
         LKRjxS9kuEvoRDJwhl7xET5DBfY5NrOT9Erm+Bnh8S7zYSyDcjUuiEUL1uoVutZpvT5E
         4qHLH3VeIiKXiB7SCeEYkkZujhr0wOOWwBMfw8hWv45acDA+87OUAqGkHefXVzyUTalX
         H6JVqLZekhkSuoSU2ywHSuiMlkYXXtoTFD+guD45yg1dllwbWUqkLNrNpu+2dpt4U+yo
         DFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UXPD8KhgIRR+aP3UPZnC5gnhN4pMpEVIMIIDlkzVIRI=;
        b=eKzWfEakrYot/cuD6iIYUhrez6vJWqMEaVmI3WAywVeiQBJswqp/IrDHtcC0eyuLoY
         V0Hs0pidsUD2y3adbVVgOEq5jkcGb7GLsX5PIIEYGvTkgTqmqhqdH3UWLXHBkRrg+bo8
         iITJb9cKWfDu8fXXFG2vFszESuPy06cXzJ6tDQhKQznEDOC+P6+9RxaTSxBnp0yLqwil
         Rg9uq2bQbw3T2xJKmWvh9MgloPb6MVny1hnAiYGv5/mZX301CMvbAEwaJshmS13UpzO3
         W1EvSlAh7bGXTO0EbIxrt+doZlBdeMUWwhSHGCyUmQhc9SIh7vRKShhriOc9z7Q97aUO
         e3/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sh3HycZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188-v6si3470235qkk.236.2018.10.10.13.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sh3HycZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALGA-0003Bk-Kz
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002os-5i
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFX-0002Rr-Uh
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yw1-xc32.google.com ([2607:f8b0:4864:20::c32]:33952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFX-0002RM-P6; Wed, 10 Oct 2018 16:38:31 -0400
Received: by mail-yw1-xc32.google.com with SMTP id m129-v6so2731057ywc.1;
	Wed, 10 Oct 2018 13:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UXPD8KhgIRR+aP3UPZnC5gnhN4pMpEVIMIIDlkzVIRI=;
	b=Sh3HycZCpo39UHuL/cEXJzlDyI9VQAOxIim0St/ThAAFUzxnAAtYTR4PWR82MSmAJD
	8qP2m56nt45/h7qIToaBeC5cTAdQ7fI6hTKwBbRRMiciyEUXkzAHhiPUDFtpxQPe+QWF
	e4NdZ7PZpPZdnS9ZahifS5xnCDholYifQH82b3/IqBzcRvRZDMs0piGr1B4IisiCnOvB
	R9Xh6vl8V546gC4kzjV3teRIUqBhXoPxisM9AHf4uOQ8TpLn14QQvJIFnMX101zLl9yQ
	TWSISewDBEAt9sBLdq8TFnT8GRe15/Dvyr/t5ZJBH/r3+yGw0S/zvBXggGLWGZLC9JyN
	TqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UXPD8KhgIRR+aP3UPZnC5gnhN4pMpEVIMIIDlkzVIRI=;
	b=rX4fu8UiLAbxxxYyhrLry576dXC98GOBuA3vJdt3y8cK36ioYr5vyQPpI5viso5ALi
	RHCvHdCBCl1PNSJA8FPFEb+jAjerWiOSM1ZAYHIhQcWLHXi4k0sacFrU1XyAscKmku0a
	+q51Ss3XuaVbKWHkSpHf+tJVcywenJZPRzwp/mDlCLMA9WxTI6J5v4SVZqmt/OrC0+4j
	rTWlCYMqS+mRY7PXuwlTzSG3sn5oyWbwqNceuidE87Dr3e0ujcjtk6bpbPm30BkeBRAx
	SXraz3HKg5aEx7zSIn3/ZLxI+BVepwqQwZXQByAFiwjITTh9+c6OUBpAhT1POxGe2Lpu
	8jxQ==
X-Gm-Message-State: ABuFfojZ9/D7JU77H+GMF5UHrv1ZAjGATcg1d+Pr2GCtUJ4BwcZNO3O7
	tdXHruUvdSkvcEU8eKG6ybysgOjY
X-Received: by 2002:a81:2d54:: with SMTP id
	t81-v6mr19619082ywt.69.1539203911053; 
	Wed, 10 Oct 2018 13:38:31 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:30 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:29 -0400
Message-Id: <20181010203735.27918-9-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c32
Subject: [Qemu-arm] [PATCH v6 08/14] target/arm: Implement PMOVSSET
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqvgoSuxs4rg

Add an array for PMOVSSET so we only define it for v7ve+ platforms

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e804caaced..f3c00c3db0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1309,6 +1309,13 @@ static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmovsr &= ~value;
 }
 
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &= pmu_counter_mask(env);
+    env->cp15.c9_pmovsr |= value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1662,6 +1669,24 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
+    /* PMOVSSET is not implemented in v7 before v7ve */
+    { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
+    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
+    REGINFO_SENTINEL
+};
+
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -5116,6 +5141,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
-- 
2.19.1

