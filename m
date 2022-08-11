Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp655311ejf;
        Thu, 11 Aug 2022 10:25:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6C0YY2XOpk/lfqembLnu48eHjC7R6L4hhXuxSTvG/aZV/A3rqfTqpk4LqneF1M/p2PwzxY
X-Received: by 2002:a05:622a:134e:b0:31e:f195:2560 with SMTP id w14-20020a05622a134e00b0031ef1952560mr172221qtk.2.1660238708693;
        Thu, 11 Aug 2022 10:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238708; cv=none;
        d=google.com; s=arc-20160816;
        b=uA4Bbr2I9GDZ2v9nAYMyctkznC0sma9nK1n8W7Q8bd6Bg+znF2yS1zt+7gKW7hdctn
         sIXFLvmX9Em4gcFV1vtPeM+1JSNXLixxHVXv/uvPZ0WPqgvd5wI7GGoPYeUN4roL0Cve
         tqYQR3nKBKNXZY77RdlllTFWlqzVhv7Ifz2DDy5Q1vB/QAcxhWHsRG4fRhNkJfyclXkP
         PlJ6nl4cyi1fU7F44t2rAqdQx161sz/M13kldO1s306PdsOhHESywO8NaeNqtK9Z8uop
         TrqIWqkJWC9ojfeRm+2+xH7Z3o0O1ysuYUjTShWM9sjMqrWuMVnyzoHN6+1nyqG2WNU/
         KUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cLYZa9syzOzFbEHzRWobfZOnBIH37RGsYCkH7ST7i5w=;
        b=BU17wigI//FS3zPww3qCg4J7DWDWAEYiP8TrJanrhhrAsIfAJV7xE/4S7mLOBiJqYO
         S+8FgQ0Q1eaYAIE/JW22QoTIYXRV5Pbu95B3lxYT8hlC2x00PduG6Wx1hEKRjUwQjBpF
         01z3BBqgTNLxQ+v/WaUX4Rl1R37siTQbrOzYFHrfPjoAJyFmt9lVZHmVE+WavTPKKrC2
         kLEeBC0Ed8b++HGXf7wVzK1v7vi7cMg3ctB5C3THXI/8mugbi3cAo7zsJYJnbAamiJ+1
         wZSd6lBtSSW9xfJh3A8QP65GOEH+baiAak7kyTvNQvCM7oWNo9gbo+0u0n7SAUM1QAH7
         M4cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yngm7okk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js6-20020a0562142aa600b004735dc40465si1860241qvb.441.2022.08.11.10.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yngm7okk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBvf-0007rd-VC
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnK-0006tM-Jb
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0000u6-0k
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h13so22075334wrf.6
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=cLYZa9syzOzFbEHzRWobfZOnBIH37RGsYCkH7ST7i5w=;
 b=Yngm7okkwjvpniEmjAR1RtrXxlmoeVVzU+nCIbTLPa6upYUFbop0qjeyjI0cLsNtv1
 29ggIuvn4p2IcNhKOW3rKuNOdteZJFbmo36Eoc3fri+A1Wj6pgahSgcjo/3ctCVIzjdA
 j1nk11HWA5gd3vpHJh6UWHmb204RsewVBLyRHG9hskpI4lMfSGXSmQtFEdbhousH00tZ
 9h31ZUo2K/hjt7MPaCDksOhhdCH7Nun0zDo018hfIgRRRuvRp32gEmCiyPu+ann2tNuQ
 5Nq8w6Ic5BC7+MfAD4QQax4EtcJDwoNB6clzz4v0vKAKoxX7FnjpaZ+Kjb1s6jBpia3O
 nBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=cLYZa9syzOzFbEHzRWobfZOnBIH37RGsYCkH7ST7i5w=;
 b=S3+pXOvmHiHw+VSIyCt85HpKw7m7YEQ0hrNeoN6bgH38g45tM4emJk/DAKXEmbv7AI
 Mk+cyLWK2DdEmpWWlThpab9f1RAV5TcBwMrPCQM2TtHiQ0K2lMMLMkLlkF90l+fgJRLX
 t5GpmnGmRk2pqg1IC2K7L6NHh9L69IaN9xyrBYfjVwcr9ES5CzoP25ept0jcVne7lw8C
 l525odhtDQKY/Bxet7FEnQVH6pUf2kYDLTRppYKbY9JtGUvFiL9GvgxKsuIvK8d0lH2e
 zECbRv3yM8UW4f+EfrZc2VErSRsq9K8famVqgZZ7AhDGiqWG9U4Rege/8/9QDI7lyMML
 pHEg==
X-Gm-Message-State: ACgBeo2A/ygvGAUk6CWxfgoouQjRRp+0OYRFR00LSppexn4WERX/kj0c
 +rS6JIZs3XcZkyD1t3o+txOMFrdg7JNpZQ==
X-Received: by 2002:a5d:4204:0:b0:21f:a52f:a36e with SMTP id
 n4-20020a5d4204000000b0021fa52fa36emr25841wrq.458.1660238188219; 
 Thu, 11 Aug 2022 10:16:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Date: Thu, 11 Aug 2022 18:16:17 +0100
Message-Id: <20220811171619.1154755-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lEDDaKgxM3Nq

FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
which disable the cycle counter from counting at EL2 and EL3.
Add the code to support these bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 20 ++++++++++++++++++++
 target/arm/helper.c | 20 ++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 122ec8a47ec..9e7fe64ceae 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1332,6 +1332,8 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_MCCD     (1ULL << 34) /* MDCR_EL3 */
+#define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
 #define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
@@ -3724,6 +3726,13 @@ static inline bool isar_feature_aa32_pmuv3p4(const ARMISARegisters *id)
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
+static inline bool isar_feature_aa32_pmuv3p5(const ARMISARegisters *id)
+{
+    /* 0xf means "non-standard IMPDEF PMU" */
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 6 &&
+        FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
+}
+
 static inline bool isar_feature_aa32_hpd(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, HPDS) != 0;
@@ -4048,6 +4057,12 @@ static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
+static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 6 &&
+        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+}
+
 static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
@@ -4221,6 +4236,11 @@ static inline bool isar_feature_any_pmuv3p4(const ARMISARegisters *id)
     return isar_feature_aa64_pmuv3p4(id) || isar_feature_aa32_pmuv3p4(id);
 }
 
+static inline bool isar_feature_any_pmuv3p5(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pmuv3p5(id) || isar_feature_aa32_pmuv3p5(id);
+}
+
 static inline bool isar_feature_any_ccidx(const ARMISARegisters *id)
 {
     return isar_feature_aa64_ccidx(id) || isar_feature_aa32_ccidx(id);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9507375b8e2..f601025cc40 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,8 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
-#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_MCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
@@ -1120,8 +1120,20 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
-    if (prohibited && counter == 31) {
-        prohibited = env->cp15.c9_pmcr & PMCRDP;
+    if (counter == 31) {
+        /*
+         * The cycle counter defaults to running. PMCR.DP says "disable
+         * the cycle counter when event counting is prohibited".
+         * Some MDCR bits disable the cycle counter specifically.
+         */
+        prohibited = prohibited && env->cp15.c9_pmcr & PMCRDP;
+        if (cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+            if (el == 3) {
+                prohibited = prohibited || (env->cp15.mdcr_el3 & MDCR_MCCD);
+            } else if (el == 2) {
+                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
+            }
+        }
     }
 
     if (counter == 31) {
-- 
2.25.1

