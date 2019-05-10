Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1460312wrh;
        Thu, 9 May 2019 18:42:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/aIuU/I1sVZhOATAsJi+0DvBB2ymlwkzCZV8/w8PhkSww79lEI2g8msXzEFPtyglKlUXK
X-Received: by 2002:a1c:4909:: with SMTP id w9mr5133220wma.17.1557452554153;
        Thu, 09 May 2019 18:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557452554; cv=none;
        d=google.com; s=arc-20160816;
        b=rLdmEPG3uOpd2PvzMKOmt/i83bVXfczGFDlgy8+bb/9TzKk7bDvRH1aY4/vW72bQf4
         cHPXhw3e4aUH6Al8gIShehsxGjTh2okxzq/1nA0JHT9kqQG6yASyvR6I/QA+E3+EQ7FJ
         2YnDDNOsWzXgr3CfKlM4mXKqhTXxWnntRKOKcu3VFb0LZr1IrvM2z+BP2k8+AYEgZkv5
         jj5ZdDoP9NWF650GSwURoma0ags8SJxECYSJwtzsM6j8CtT904gDpqw7PAkE83ohbKeg
         VPl9wcrdGnFozp31TFlTEKUT6mkuRfICd4GWym7aKoIXP8oWzWVvT07n9vREHzyDaI9t
         6McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6a5iGBwRtD5hTTLS6rzCG4hSulwi7yefRB4mjcj/bzk=;
        b=0T1MKc0EE9niseFLV+9QMklGzygh4/AIMYveg7HejKfy9Xj28fCiKe0FNR2e2vLz18
         Cavz/lIXazAgmYDrqcbskEn0MqdJ6pa/UnT9WeLDAsF8LyNPTiRAqNmqiy14sBhqELBu
         mfdus7LoEtGeOwgqax1F8nvPH0xRxqqEj9N24/Brbfui+FQAox/1MtotS/fz2rulDXw1
         dkkJnP/na2YCB/QNdT5UhNz/8SX+v2s2sBpHUbf5r7UGMBYYxLLiesls0d07I5TP2XGh
         SiGB8oSryYQ1/HNoRgf7fyNu44CLl131KQbTwTvSIAVtxx0HMl+YBXl6g6PfVmjV4OEh
         Yw3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uBPl2xjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si3660400wrb.440.2019.05.09.18.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 18:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uBPl2xjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOuYT-0004q6-9u
	for alex.bennee@linaro.org; Thu, 09 May 2019 21:42:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHx-0006TJ-UE
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOuHw-0001PY-Th
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46178)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOuHw-0001P5-NX
	for qemu-arm@nongnu.org; Thu, 09 May 2019 21:25:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id y11so2239473pfm.13
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 18:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6a5iGBwRtD5hTTLS6rzCG4hSulwi7yefRB4mjcj/bzk=;
	b=uBPl2xjNQdlFp1d6IlgqDxsR/CXuB/2pc+qELra6ukOQq81OpdorQYN2Y6Ip9JhnhX
	vgfcZh1UHJygFhYKM0NV44O60dIbwVcjjuiOICF74Vw6l1ZIa5yDV1SY8+nRGBFZEMz9
	ozzSXJy3Wh5QVM9GyS2RU1CSsvtgFmPf87TbC2g5oUIih31ebSpW1Heu9fQrqxNaKjGh
	jiH920xo0vySE85FRBVkk7IMj+dn9C8qELkM2nhjgTqd3G4HXitFauLFc8ViNNhMuQzA
	j+hfTWNCeT2SoG6Sc7NEqKv0szrMhR0PFGgSCMe+rjmK0cahE4CtR+sUXsYVH7vFd3wq
	kFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6a5iGBwRtD5hTTLS6rzCG4hSulwi7yefRB4mjcj/bzk=;
	b=H1SKZQx4gI6IYKuoPUt3oTtDslO3wUjBTPVHDWXIVkzDHKmsMVs/xZe71YcIYQ9DOf
	Y4EMezvWxdplsYyIuW3A43Y/na6uR28/eEA2Jy4k/eQ0IqHfsMJXm4GNcl5ycChHM1Qy
	w18vQczUHeo90UNxZZcHcLynetViF4Xe14fFzY1XBEB7I4Y6qVFBSQPfjCHpDtmlesu/
	pWQbM7mwVc80pESVntlgDBofajhPzDyBIRp4ZkamJ066L7r6SNAir87OTjf0awP6p2A3
	oNAOpztF0LP9hw3zk/re88afFKhzSfH3JbPpyVH3hgv60bchEUws6lR6+xpaTavGg+Z+
	Wc5Q==
X-Gm-Message-State: APjAAAWf3T4roI49xc0V03Uanb4xz5Ld2xDd48nW3NV3y6cv7rIgwNMV
	Q1dOIB9ZPHd/8M1UKgiKdKIIag==
X-Received: by 2002:a63:cf:: with SMTP id 198mr9672036pga.228.1557451527252;
	Thu, 09 May 2019 18:25:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	n18sm8252700pfi.48.2019.05.09.18.25.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 18:25:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 18:24:56 -0700
Message-Id: <20190510012458.22706-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510012458.22706-1-richard.henderson@linaro.org>
References: <20190510012458.22706-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v5 22/24] target/arm: Implement ARMv8.5-RNG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j8MENRj/cS8W

Cc: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Log errors with -d unimp, for lack of a better flag.
---
 target/arm/cpu.h    |  5 +++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 892f9a4ad2..c34207611b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3521,6 +3521,11 @@ static inline bool isar_feature_aa64_condm_5(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) >= 2;
 }
 
+static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
+}
+
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 228906f267..835f73cceb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,6 +310,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e88b2cadd..9642070194 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -22,6 +22,8 @@
 #include "fpu/softfloat.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-target.h"
+#include "qapi/error.h"
+#include "qemu/guest-random.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -5746,6 +5748,45 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
     REGINFO_SENTINEL
 };
+
+static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    Error *err = NULL;
+    uint64_t ret;
+
+    /* Success sets NZCV = 0000.  */
+    env->NF = env->CF = env->VF = 0, env->ZF = 1;
+
+    if (qemu_guest_getrandom(&ret, sizeof(ret), &err) < 0) {
+        /*
+         * ??? Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return the
+         * timed-out indication to the guest.  There is no reason
+         * we know to expect this failure to be transitory, so the
+         * guest may well hang retrying the operation.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      ri->name, error_get_pretty(err));
+        error_free(err);
+
+        env->ZF = 0; /* NZCF = 0100 */
+        return 0;
+    }
+    return ret;
+}
+
+/* We do not support re-seeding, so the two registers operate the same.  */
+static const ARMCPRegInfo rndr_reginfo[] = {
+    { .name = "RNDR", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 0,
+      .access = PL0_R, .readfn = rndr_readfn },
+    { .name = "RNDRRS", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
+      .access = PL0_R, .readfn = rndr_readfn },
+    REGINFO_SENTINEL
+};
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6690,6 +6731,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_rndr, cpu)) {
+        define_arm_cp_regs(cpu, rndr_reginfo);
+    }
 #endif
 
     /*
-- 
2.17.1

