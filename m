Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3911218wrx;
        Tue, 16 Apr 2019 06:12:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlo40mZ8KQOsV8Kc5UMGBeGojMEa4WdvF/6nNByZi0cw8/CMj8osZDdwgOdey2e7TbCkQc
X-Received: by 2002:a1c:f909:: with SMTP id x9mr28035901wmh.18.1555420374873;
        Tue, 16 Apr 2019 06:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420374; cv=none;
        d=google.com; s=arc-20160816;
        b=FDpfHObGZmlNAWqTQ1YqIYjGWnrZHb/+wXxVTloLMo6ialYM1e5vYdAETXfIuFS/YP
         NBzIxrcpUo0Vc9kujWgHsOWgzPaS/uUHQF2lE2Wspi+iNmDSggSBB3liMG0YUh9J3iz/
         fhJL2MiGCNrq7edc9gDFQ+u0IFcyt+/qd1JjvJvTuGr3QPjE2gd99QLshBmOv8IDbpXn
         850JiH+JRrX8Zagmqm4kkM30+slAG8ubaNGcQRYzP6wMuuQvRKXvJ+02bn91P73Rjhwj
         m03P9hQpb9A326FztE6NqRWsgpMv8dMHccW7j+St8oDUYCcYPlz1Q0CmoLGDEIAGhgV6
         NCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Tkj4srWAc4/EjY7BD+Il79S6ivdgS+b3NoUBeFSWH/s=;
        b=ApHAN/0Mz0z0awWk1K07rW/4loTNtZCdk9Y84D17UcmQC4lcQEI0yT9QyvBs+MAnm2
         qcjclsygqhGgdeLtMmH5PRhxkXxhTj8pg30LhBB1nnP4lXK3iPWfIwOJoBH0f2hdpatB
         ifEZPOzZ4MMWpSRiwTfawGfQGbhHcMSU0fdhTiaVmCQM6Qnbi27SDWCEUb1JZ8eX6M8I
         mD0HXnWCAlfGNWS7/VqcVgJrUqI1tlKZkK3Lev6CZbx6mZwZd4rDnksnoCBvfJmeDnuJ
         645z0DqLk/JRUxPoGsmPldPhHm6RLgtgVpNKLN5W0bjFd0GosFDI3IwAd2gyzeGz+0XF
         EBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bvBj8Do/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z126si12997195wmb.161.2019.04.16.06.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bvBj8Do/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNtN-0008Sz-RZ
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:12:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfS-0004zG-Jp
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfQ-0001RN-NI
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36440)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfN-0001OR-Ml
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:26 -0400
Received: by mail-wr1-x443.google.com with SMTP id y13so26979595wrd.3
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Tkj4srWAc4/EjY7BD+Il79S6ivdgS+b3NoUBeFSWH/s=;
	b=bvBj8Do/aVo7szYKVJdS0iWwv7zlN9y6RwnKkVpG5o0WfZ4oRP+MsZoRQqc/X98we1
	sk7ahAnpQ1TwVnJOZw67//M3nuozxjATPzw+AIo/g9upZco1MILS4GpJmjyNFaMhQb+V
	l2CzMb0o3y99sPg82KvA+e0S+kMaW2rV2p8q0pPqWMrhe36FlAgvvi5YLb5y7hVIY8ue
	4ikKGXxxzahIL/6mRMG3OacmegyZRWbj+Mi9oyY7Y/bBnYiCedIWw/kjcz30R3rj0+6n
	c72+nv2zF1fPl0g9zaBrVDQfo57Z9tMd80B6Md1R3cnd7zQfMNhregdCgtFsGxBp45oX
	Cd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tkj4srWAc4/EjY7BD+Il79S6ivdgS+b3NoUBeFSWH/s=;
	b=V+j0tfYjYfzpWsRSiEqXYLuxnGixJ/FECdPhRkShKmGSezLDWqPRLTzVSTRaDskYid
	9TflonEB0bHR6LfIm3p91f65CwjxFlQ96/riVcYbabn/+dQ1yx5O1/6hK1PHLF975Qqw
	NDj8KQcbPXP/H2dQKg0TS6X4e3MI8qbH7ke6HKvgUabDKlnzRFSNkb6oS9cQa/NynNav
	Ac6wPLHB2aJpr6SJYithJiVoRc4ry3P8BObgdL9zvXQH2LDPM9cSOfPKp62GSP83uIg9
	yMZzjJNhQflnBtNkVJUWHQ1mEEzciaWBn4tClGyl7CJgWi5svH6AJd+Cf9u7VjP+nA2u
	m7gQ==
X-Gm-Message-State: APjAAAVydegIFf67bjRhydTeLs7LKb/5V+jFs/NYBg6Hxr1Tjpu9941h
	IGqwujSD3/dyxx9g1l9gYgk8ohbiTo8=
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr21425562wru.150.1555419503330;
	Tue, 16 Apr 2019 05:58:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:35 +0100
Message-Id: <20190416125744.27770-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 17/26] target/arm: Overlap VECSTRIDE and
 XSCALE_CPAR TB flags
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BkBifkgiOJeW

We are close to running out of TB flags for AArch32; we could
start using the cs_base word, but before we do that we can
economise on our usage by sharing the same bits for the VFP
VECSTRIDE field and the XScale XSCALE_CPAR field. This
works because no XScale CPU ever had VFP.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 10 ++++++----
 target/arm/cpu.c       |  7 +++++++
 target/arm/helper.c    |  6 +++++-
 target/arm/translate.c |  9 +++++++--
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c436f628987..a4e4d17e787 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3139,6 +3139,12 @@ FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
 FIELD(TBFLAG_A32, THUMB, 0, 1)
 FIELD(TBFLAG_A32, VECLEN, 1, 3)
 FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)
+/*
+ * We store the bottom two bits of the CPAR as TB flags and handle
+ * checks on the other bits at runtime. This shares the same bits as
+ * VECSTRIDE, which is OK as no XScale CPU has VFP.
+ */
+FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
 /*
  * Indicates whether cp register reads and writes by guest code should access
  * the secure or nonsecure bank of banked registers; note that this is not
@@ -3148,10 +3154,6 @@ FIELD(TBFLAG_A32, NS, 6, 1)
 FIELD(TBFLAG_A32, VFPEN, 7, 1)
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
-/* We store the bottom two bits of the CPAR as TB flags and handle
- * checks on the other bits at runtime
- */
-FIELD(TBFLAG_A32, XSCALE_CPAR, 17, 2)
 /* For M profile only, Handler (ie not Thread) mode */
 FIELD(TBFLAG_A32, HANDLER, 21, 1)
 /* For M profile only, whether we should generate stack-limit checks */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3f9c81e7e9e..dd6c4f6da8d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1035,6 +1035,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_THUMB_DSP);
     }
 
+    /*
+     * We rely on no XScale CPU having VFP so we can use the same bits in the
+     * TB flags field for VECSTRIDE and XSCALE_CPAR.
+     */
+    assert(!(arm_feature(env, ARM_FEATURE_VFP) &&
+             arm_feature(env, ARM_FEATURE_XSCALE)));
+
     if (arm_feature(env, ARM_FEATURE_V7) &&
         !arm_feature(env, ARM_FEATURE_M) &&
         !arm_feature(env, ARM_FEATURE_PMSA)) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0c5b0a73e95..d8a9620b870 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13375,7 +13375,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
-        flags = FIELD_DP32(flags, TBFLAG_A32, XSCALE_CPAR, env->cp15.c15_cpar);
+        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
+        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+            flags = FIELD_DP32(flags, TBFLAG_A32,
+                               XSCALE_CPAR, env->cp15.c15_cpar);
+        }
     }
 
     flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d280b3a9a3a..9172a382c4d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -13329,8 +13329,13 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
     dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
     dc->vec_len = FIELD_EX32(tb_flags, TBFLAG_A32, VECLEN);
-    dc->vec_stride = FIELD_EX32(tb_flags, TBFLAG_A32, VECSTRIDE);
-    dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
+    if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+        dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
+        dc->vec_stride = 0;
+    } else {
+        dc->vec_stride = FIELD_EX32(tb_flags, TBFLAG_A32, VECSTRIDE);
+        dc->c15_cpar = 0;
+    }
     dc->v7m_handler_mode = FIELD_EX32(tb_flags, TBFLAG_A32, HANDLER);
     dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
         regime_is_secure(env, dc->mmu_idx);
-- 
2.20.1

