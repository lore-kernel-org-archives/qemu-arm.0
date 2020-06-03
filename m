Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp38128lfc;
        Tue, 2 Jun 2020 18:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCOn4dQ+NP41zuk1CDhnEHQpR2PTBDaQPg7dlulOMmOGNvoB3kj49j4HhH4H5ySZSuQ6f+
X-Received: by 2002:a25:1645:: with SMTP id 66mr47611181ybw.332.1591147564188;
        Tue, 02 Jun 2020 18:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147564; cv=none;
        d=google.com; s=arc-20160816;
        b=imS226Q4e2cFV2KKEmfUIgB/S5BmXOaa7J84U/6Cyc96QQMLFjToyVaNlnbvDrgNxS
         Ezt80Pymure1G6F9bB/EYBYLN2ITVgL5Xh6KPfKA99z6cjFOe98Xg1TyncVA1qnQQyt5
         R8Ll8+4UN1lahxVHqwXayka/p0640hYiUmKIFPoXOixC5VjQTgNbj97/dce3+M1hfF+P
         gBPvHxahvLuq7Ya/aSLSfY1LlbLgRYIVB1iECuate2KYL+kfsNuLCsB4l1D2li5XWrU6
         XBncPOoWTF6sSlCJmwLPQ5gKok44I1ByYXyv4KMTZi/IHh5svggH7OWzfuakmdkU5NgE
         YcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AEdNLYFCyfyMqsP9U02w6IsvCKyLZbP9JA6vNA4o+yc=;
        b=ajBzTvxnFj1U4zEQtYM4cOIgqjDBS1igtdT9OgZBimWpZE1ffhrnlXDE7+2itHP4AE
         /mfSIrkOgo5l2tYjKkVJbKyMshIMO/7WeIsEJ9HfJ/zKmeJpvl1ECAtl2iPdc8SaXN2n
         AQpDZHaRlu7Fe6yrH0oFGgXzlozCJ0yjCaKKlOjxjNZ5uO4jDu7vPZdVUGRhQHKA5ATf
         tYBS30YxdBlHDWn9x+jiHZ+xcg1ZBcYY6SPQxclrvuDZryzv8h4JHJqLkIdYAzuf2EK5
         TnYl7cbiBlQ0HYXn4D0E8OQjjo+45+oKbOU13s9cCdzlZSVID5bpU4HfcI3MriPiUowC
         6KmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PGfxWPg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f31si334897ybi.229.2020.06.02.18.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PGfxWPg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIAN-00025x-Gs
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyY-00049H-GT
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyV-0003aw-Bs
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id n2so187046pld.13
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEdNLYFCyfyMqsP9U02w6IsvCKyLZbP9JA6vNA4o+yc=;
 b=PGfxWPg8A1ZHVs+Pwb/SugE/9/Q8U0LxulnXFVjawH4hRZaDumiiZn3ZUdyua63jpg
 n57CX7aHu0LX4mzYqCACULh4KfDwfF7kKGZgiISeaviByx2mjRpvsMUTuUnk0IDV1oF1
 A/Hjays5tdQMQ4ZN8GS8CVbC88fRc84tgaUxHzRlj/mJlKeudMATl3TKQMxe5QX7TDJd
 zIPh55y5e0ttT7MrLE+sJUpvu+J3p3sOlwx0UUKad21fZ68OwOLvq+n61ndyMrDttBSE
 uQPC37xd9nR1ZzBGraq3Nd3CDbYR31hqdOnkgSJdq0ciY/x3MwVxEsjPXMpkcReGIOFu
 c8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AEdNLYFCyfyMqsP9U02w6IsvCKyLZbP9JA6vNA4o+yc=;
 b=oJ1KwBoAhZlf/twjO241+Ykmkh03KoFmFpmDothbj/kGpKLW78DIooerI08bUZ8Cam
 Acg3gWys0bvVt09L+4OIriwYU1YXOLqr2IZjmsBMXOuDbIgjs6pwNDzlxUi0nIu55S9W
 gB0zotNcG1y3MQ4dImCX2xugeBHkmxc8E/iMlDdmqAHr2s8Vo5E3u78VtOgl4ETt0hH8
 FpT6Hf3Tp7G6DDpTgC1X456ydcuP3DsucSniWw/5vb2mgdryT8iXEZJhc+eIf4kdn5yI
 0gAxt9nVXGW57FDMIDo8iAnc/QAb+nXW0sL7uYYC8qxO3liaiUad72NkNtqSopW4vaho
 5cOw==
X-Gm-Message-State: AOAM53199cdHCQE/Emjl/ta9Z6ifrUlQ5+FT99ThjRUHjb7WHxAeTiti
 AQY4HB+v8HXAFOhiDYmp7ul18g==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr25067287plt.77.1591146825964; 
 Tue, 02 Jun 2020 18:13:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/42] target/arm: Move regime_el to internals.h
Date: Tue,  2 Jun 2020 18:12:56 -0700
Message-Id: <20200603011317.473934-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i4TbRNxOjbYa

We will shortly need this in mte_helper.c as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/helper.c    | 36 ------------------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5c69d4e5a5..c36fcb151b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -913,6 +913,42 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the exception level which controls this address translation regime */
+static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_E2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    case ARMMMUIdx_SE10_0:
+        return arm_el_is_aa64(env, 3) ? 1 : 3;
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20d7bf4ee1..bad639e2a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9791,42 +9791,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the exception level which controls this address translation regime */
-static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_E2:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    case ARMMMUIdx_SE10_0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return 1;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-- 
2.25.1

