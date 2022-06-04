Received: by 2002:a05:6512:3108:0:0:0:0 with SMTP id n8csp1710260lfb;
        Fri, 3 Jun 2022 21:33:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2kpPebDOv8UvXiTS1GqTBdlufRy65SrfI8S4db8yyvUn/Y46v9jHl9rlMZqcQoLNDHGe2
X-Received: by 2002:a05:622a:178b:b0:2f3:dd55:d513 with SMTP id s11-20020a05622a178b00b002f3dd55d513mr10631511qtk.134.1654317237185;
        Fri, 03 Jun 2022 21:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654317237; cv=none;
        d=google.com; s=arc-20160816;
        b=oZ7/VqZBXxTsoUhF+YbkhlsB6WJ0dfZfG7IcsphccNuRC3PLvVLsUmf43Upt32YQce
         Fv1taC5eJ5bkNu7wsH+adP1lGF8f0i8m0Gj4L8mjLRHLueXwtGoMoDHP9U6YUsj4JEq2
         tdsZiXnNPUe3mBW+n7M8yn1xePZnU3YaIKccCH8HzBorRehBFUB+tNiv2y0g5PvuJJJ6
         1eF/yMCltiJlTkKlEYLNd0cvOWEFaQiVXz5uw6nn18XOh9X0a5zxc4y54/mSLlB8zqby
         T2rW21T89lv/HRu+GSrJhbvRSKjZJXdTWDpV+7ycJZLJhmtwdrTeAbEgO8rCfM4PRPHK
         Utmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wKwxgmTTnQp5W/CZg2mnGE7auUJpNoW6/0mxrOpi9ls=;
        b=v40smyi3UAF7CVASVModxpmARYyFHpOJ6VwCCUdUoNxJ6wQ7eDBa+sLkrs8fY69wa+
         PirJiGPqFARcJjzJqqVHGopfkiRHUBt9hPTZU1RkAqcngjqinT2ClP7vZSZAfRGvFSfr
         xB5mu1GZIsGbruANG/Neec+4xiEHLjMDKCjSjlynkN9SszIOOjc+gi6etM6ajdzyF72C
         yBFpOdfVL6C2969nIJpo1qcJPKJCpxTgi397vJdFHXn1jivuleU+m83ueZI7kNtwbRpc
         eZmLSdPpaJ9ME084zC5s7/gw0eeP3EMtCiPZ44JDzyNydLMWBlnnOkF5WDEYF2yHbGF/
         YX+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jltRyuAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020ac81496000000b002e1fbf3c018si4191621qtj.521.2022.06.03.21.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jltRyuAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLU4-0002HA-Mo
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3W-0008I8-LF
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3U-0008WU-5E
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so13546760pjo.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKwxgmTTnQp5W/CZg2mnGE7auUJpNoW6/0mxrOpi9ls=;
 b=jltRyuAND+N1NSRUviNYNAQ12GjK7A+EjLxjC+donEQ//VD9E+Rr+ularAWcS3PUDg
 q4FPtpVSn7hxtIEgumtVaO4+WSQfoP63IG1KKGWinvufSGqLpVGMFt8Fm/jQmDGSA43m
 MSdTXCHVWMwJspAZK5Q/0fREYU97e9WlsBUknEwjX8nzweL5SP1nV/npWRZJN0mRK1E2
 xV9wY0YRjDPn/EEgEjCg3xF2Qo3xxz4DE753hjoosR75+9CZQP3NhG4s1Rq54/oWRigV
 /lK9rNjMs5zVjT3/47vaEFThyPjbaSnCUpEVTNJEV521O6cfGV7jxw5M8hbe9lgHNMAK
 PdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKwxgmTTnQp5W/CZg2mnGE7auUJpNoW6/0mxrOpi9ls=;
 b=vqpiJkMs6mbYgIoWJ758jtFyzMJ5Vg4rAWOLoRHpIwVn2LsnYeMyxgwNUxgkYuk3Bn
 yHRfXZyY8NEJQQtCCG377qm8dq9nEvtRTDtcDZXY+EOZdb/L5FwXzQaOUnSgzeYBc7yi
 UsS6EaTAixob7H3qGtxbyuMOu7+jElVZYpafrQAt/5D6wb5tGAtHzBKReQBg+ON6AgkB
 QS1a7YGUqI7ylYv2mp4coy96C8oojCRrkw3VIVMQXnGjybKY9W7oZd8mfqHHev8ne1+Z
 rqVOYKh1lt8yHHjhg7jD5FgrOt+IucWPObTh+HHAFXuI1GddSEZU9TdZKMGtCajO/v1k
 KLiA==
X-Gm-Message-State: AOAM532CKBjkCsEuXpXrISvo4EYSHncTwLc4hZXH31N1mBrCRHmRLle+
 UwxATl77X2N46d54Z8y+N9NgRQ==
X-Received: by 2002:a17:902:cec5:b0:166:3418:5260 with SMTP id
 d5-20020a170902cec500b0016634185260mr13053523plg.129.1654315587334; 
 Fri, 03 Jun 2022 21:06:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/28] target/arm: Move check_s2_mmu_setup to ptw.c
Date: Fri,  3 Jun 2022 21:05:59 -0700
Message-Id: <20220604040607.269301-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dp7y5ZrkwsdO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 70 ---------------------------------------------
 target/arm/ptw.c    | 70 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 72 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 93147e0b06..a71161b01b 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -27,8 +27,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                    ARMMMUIdx mmu_idx);
-bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                        int inputsize, int stride, int outputsize);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7aadc6eeb9..5dfe1f9cc0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10578,76 +10578,6 @@ int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
         g_assert_not_reached();
     }
 }
-
-/*
- * check_s2_mmu_setup
- * @cpu:        ARMCPU
- * @is_aa64:    True if the translation regime is in AArch64 state
- * @startlevel: Suggested starting level
- * @inputsize:  Bitsize of IPAs
- * @stride:     Page-table stride (See the ARM ARM)
- *
- * Returns true if the suggested S2 translation parameters are OK and
- * false otherwise.
- */
-bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                        int inputsize, int stride, int outputsize)
-{
-    const int grainsize = stride + 3;
-    int startsizecheck;
-
-    /*
-     * Negative levels are usually not allowed...
-     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
-     * begins with level -1.  Note that previous feature tests will have
-     * eliminated this combination if it is not enabled.
-     */
-    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
-        return false;
-    }
-
-    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
-    if (startsizecheck < 1 || startsizecheck > stride + 4) {
-        return false;
-    }
-
-    if (is_aa64) {
-        switch (stride) {
-        case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 42)) {
-                return false;
-            }
-            break;
-        case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 40)) {
-                return false;
-            }
-            break;
-        case 9: /* 4KB Pages.  */
-            if (level == 0 && outputsize <= 42) {
-                return false;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
-        /* Inputsize checks.  */
-        if (inputsize > outputsize &&
-            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
-            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
-            return false;
-        }
-    } else {
-        /* AArch32 only supports 4KB pages. Assert on that.  */
-        assert(stride == 9);
-
-        if (level == 0) {
-            return false;
-        }
-    }
-    return true;
-}
 #endif /* !CONFIG_USER_ONLY */
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index af9ad42028..525272e99a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -615,6 +615,76 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
+/*
+ * check_s2_mmu_setup
+ * @cpu:        ARMCPU
+ * @is_aa64:    True if the translation regime is in AArch64 state
+ * @startlevel: Suggested starting level
+ * @inputsize:  Bitsize of IPAs
+ * @stride:     Page-table stride (See the ARM ARM)
+ *
+ * Returns true if the suggested S2 translation parameters are OK and
+ * false otherwise.
+ */
+static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+                               int inputsize, int stride, int outputsize)
+{
+    const int grainsize = stride + 3;
+    int startsizecheck;
+
+    /*
+     * Negative levels are usually not allowed...
+     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
+     * begins with level -1.  Note that previous feature tests will have
+     * eliminated this combination if it is not enabled.
+     */
+    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
+        return false;
+    }
+
+    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
+    if (startsizecheck < 1 || startsizecheck > stride + 4) {
+        return false;
+    }
+
+    if (is_aa64) {
+        switch (stride) {
+        case 13: /* 64KB Pages.  */
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
+                return false;
+            }
+            break;
+        case 11: /* 16KB Pages.  */
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
+                return false;
+            }
+            break;
+        case 9: /* 4KB Pages.  */
+            if (level == 0 && outputsize <= 42) {
+                return false;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        /* Inputsize checks.  */
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
+            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
+            return false;
+        }
+    } else {
+        /* AArch32 only supports 4KB pages. Assert on that.  */
+        assert(stride == 9);
+
+        if (level == 0) {
+            return false;
+        }
+    }
+    return true;
+}
+
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
-- 
2.34.1

