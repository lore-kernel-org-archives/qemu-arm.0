Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2457999lfj;
        Mon, 16 May 2022 22:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZD1PU8o93jP3OVStqXTTb8TvqSfsiGh6HE5uhF2JRSMAR6/y6/E3NxsLZDuF3bRObO+cN
X-Received: by 2002:a37:4651:0:b0:69f:eb93:d212 with SMTP id t78-20020a374651000000b0069feb93d212mr15007488qka.613.1652766702775;
        Mon, 16 May 2022 22:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652766702; cv=none;
        d=google.com; s=arc-20160816;
        b=0o/EvaqfMIECAnyfGtD5poUyuz5yqDjuFaUjJVe90v6CqyrNdoCtv9rRL8faQjULdh
         qvvAOvwrAJOPFIMf9Krq9und6our62eHb4cmApsSKqOYG5Le6sDl9ELmJvu6Ox2Z54lr
         zRxVgVQOSVsZx3wHSU7Lr8IwoDYCTk0DA05jpIXR5G44T8DyzlWJqnS7PitH9IefWxh8
         g6YGTxsTeqXD8iYOiGtKRL58xyjcbUYU4MJinyxcXOjGyCK6EwJ6GYTl29Z/rJ0T0UHQ
         bReiMHtdkhyg2AF0Fl8xE2SoO/roBnzz1jmIN7qhiTqIJN9irWDnQzBpDp3JVHQ8S6kU
         9SUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lmHQQPYKlDu3aWdQHOeaVIIUIVTyse+PwW1XBQtfA78=;
        b=n63UyMODtYfaWShVrS5JkUXS+5ejla6Rxj0m5ilEnFkygyTDkjTGWo9HUNWTuZvUDg
         N7ny/FMepIkp4Bda9T4n+10RwlrwxBFcnrFU5RKcUe52XTjXEbyqTl0pQnoGUzpKQ2+S
         5ib499BgYIIHRwvYRhn1YU+YXPLvBASMq6+7j1n3LfMg9uOBNTEVDBgICkKGuPrEVg+i
         b8olAYfJSQItnefMlMqUxnbWFqvunHYh9dsWCkJkLsDzKpOhpKH7bYENCCqL6Z/rn5YH
         KEa2y3KN02eh8LerhRwV4iH1F47w6YEUHcmzaCRRM/srb3wZ/MlATvGt7foX1R7fvL2o
         njpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGV7ETBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a378602000000b006a001510645si7366931qkd.39.2022.05.16.22.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 22:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGV7ETBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqq7S-0001Nq-8r
	for alex.bennee@linaro.org; Tue, 17 May 2022 01:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4r-0000U7-8O
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:49:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4m-0007nw-G6
 for qemu-arm@nongnu.org; Tue, 17 May 2022 01:48:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q18so16406791pln.12
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmHQQPYKlDu3aWdQHOeaVIIUIVTyse+PwW1XBQtfA78=;
 b=cGV7ETBX0EQw4hCrNIxB8c5H7+FhLuLVgD/Q+KMxCmgy+VOoCo0ax9d8/lCyU0+WmS
 zy1pa5WOJCdjf+LvCpitdP6mNzHY3ayIuw50W7uuSeNvRz0wh7hvr5N8X89+yQklgRwl
 K2AL3N2dW+3mNo4HooDBnnhh19n/HEmm6jZ8eKArFcihq6euwLgRrAaDgtEOLGTgv+Hc
 rXZ4xK8Ba5Uo3nuVrshreXg9T9+SGtXkU+JjM2XJ/08X2Bh/tzf64RVVWbPeIJHyJjpr
 jxtWBnnMYf/HFgVcQKYdHCt+3Mj+Yc1P+n2J1BSvUSz1mDXrJQFPoyH4rzLuHlU1YHxz
 BbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmHQQPYKlDu3aWdQHOeaVIIUIVTyse+PwW1XBQtfA78=;
 b=bOCsFJumtYKkTudBGVOauQl9iVJ6XqhMvnvNGw12aWOLPDkbhTXp/EjcsPBbwkH1c+
 IjBwmtMyKO9qtbrng0YMj/5Ik83KlbVgxPGZXgKJIVXbP8sW+P0KBFQW4nBujeYuBPj1
 o94BJkH5aMy+naHbN1E3EYWT8ytLswqcuG/AM0+7j67aPvzaRZbi7FI7leECbYhNTjk2
 7RfwxRhksT0HVEdi0PstwK5B+8iKO8ovvI1JH1ctOShnTV+OlRB9J7YGn68M58aafVyX
 1aLJWBv953xiMSp2cQJpBLXxWS0krNfIaB51urUrAo9bGrA9jwiJZStI6CffIMwoF00E
 x+SA==
X-Gm-Message-State: AOAM533t4HKp4Ammy8o9RnS+o3GnI/uNLeOI7UmWT1Gg3ykNSsNXwSm0
 f2S7Sc2gn+rdaBShyD5ng9TOGQ==
X-Received: by 2002:a17:902:f684:b0:161:8b4d:adf5 with SMTP id
 l4-20020a170902f68400b001618b4dadf5mr6159456plg.112.1652766535108; 
 Mon, 16 May 2022 22:48:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 4/7] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Mon, 16 May 2022 22:48:47 -0700
Message-Id: <20220517054850.177016-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: YKYT3lryvb11

This function is used only once, and will need modification
for Streaming SVE mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6ca0e95746..36ff843cef 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -189,17 +189,6 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-/**
- * aarch64_sve_zcr_get_valid_len:
- * @cpu: cpu context
- * @start_len: maximum len to consider
- *
- * Return the maximum supported sve vector length <= @start_len.
- * Note that both @start_len and the return value are in units
- * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
- */
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5fd64b742a..0308920357 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6218,40 +6218,32 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    start_len = MIN(start_len, ARM_MAX_VQ - 1);
-    end_len = start_len;
-
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
+    uint32_t len = cpu->sve_max_vq - 1;
+    uint32_t end_len;
 
     if (el <= 1 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
+    end_len = len;
+    if (!test_bit(len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, len);
+        assert(end_len < len);
+    }
+    return end_len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1

