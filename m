Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6074997lfh;
        Fri, 3 Jun 2022 21:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBEwyOdSEhLeuiTPJSr6jPOAxA4XbQvm3H6PKM5ccRHmHbRs3K7j+WmA/B1fw67j4Zi3CJ
X-Received: by 2002:a05:620a:27cd:b0:6a3:756f:8267 with SMTP id i13-20020a05620a27cd00b006a3756f8267mr9034585qkp.374.1654316312605;
        Fri, 03 Jun 2022 21:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316312; cv=none;
        d=google.com; s=arc-20160816;
        b=Vjf751JKtHVo9uarURN9SUJvC7hBQzlj0YOxD3rVIA9WiRau1edw4aZJ/evjfiDnK2
         Km3j+yQqQEnRlmXZUzO6c6ucCLyiaaaPgwkDDw4Sa+qw1DB+2e64PzRoit+FDy2HQ7iD
         i76ypBIZSx+dGhfLc4z4RcDZjLxT3AEkKheVRjQAYVwp8yQonDX1rfwzSAR89cKyUTA3
         B7YLNhQvSdSTynGl60Dn1nb7EUkzwCpO5iOjCpJqZy+FvsvijHTp2CC2pkveonFJ9gaP
         vKCr9mbvXZuju483LcblVKbtOIOkDTAGyybj/KQRb7kJ3zgM17lZUX9//jRtI8+AP7CV
         a+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WU5z3Bzu3rwceAokLvQLv9D+G/DS17uNqZgTXkFyI+0=;
        b=ePlSRZEkyC5FUl347so55j/e33KYiTAXPDOmMRAta3Mz8CyGMLNzqQbG2yCxF+iHWi
         WNXeI4N5d3ee/Esu0TNeEFjyX6yFP2yTJYjQ13+PoUVQLY3/UTGvROEbxAp7KB/aca+j
         UfSrdhbSnQ7Q1f5vGHqNcQuTEje++O+J3N3Ynlz1SUnCo8NGRynhlRzlzzL1Cj+tm/Pg
         DeUU5+YM7HFV3K9LlUzurUzpAV6zWPcAGGQOrtb9l2xwxxD2cfkhr3HNm/JP6WE/vorq
         J1QIrnQbaqnxKSHKPfTf0y8s73BkYGoE6K5ZMNun2AJImJLobKlGnlE3krsgzTqAM+ky
         Jddg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmLbh34I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23-20020ac81417000000b002f53104ea7esi4101082qtj.577.2022.06.03.21.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmLbh34I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLFA-0001Ej-3S
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Y-0008Of-4j
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3W-00007Y-3K
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id y187so8665024pgd.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WU5z3Bzu3rwceAokLvQLv9D+G/DS17uNqZgTXkFyI+0=;
 b=KmLbh34IZ1M3NvbeZtmVafdeC4d+uPFC9VVEsXJY/aUZOEQ8OtviIOz8NWVL5Pg4sB
 BEzdd3KZ7zCFAOgLZrjmJECRuHrRVv4WrGyWzJMZ9MRE9ufPpzO9V9bKMiHeKfYTx9nR
 1Ge1O2ZjmOvOgi18at/yLDM2c20870RfkMc3uci7CMhUaGyHMRI0+OxcuPCcKFzMkdWc
 yApTDtv12ErW7AWbrFW6uiPLXg7QocYNvktZpkiFRDSmPiXK+KxdGv3hIMDSZl4KeILD
 aKXZE5TEKOXaDhJiYRYtFNkNYuxR38U4NkDSwapwf01aMg3kR14/nGxBjqOyw2C5/ACj
 6mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WU5z3Bzu3rwceAokLvQLv9D+G/DS17uNqZgTXkFyI+0=;
 b=LgWcvCFckrufStnvtRAR+hhTgLGxF54mrKYk7smul9Dm9nELYRWDqDIvs8COPTYSHh
 2cnc/0A8FgSN3OZzNATiYXrcbpToC7gg+LMU7SQPFLvEZN7Su2eybkZ6syOQha7LXdij
 wggUT9/j4a3wW3UR/1cHFEMIrgEKNdP+AwPSeP/4roYyQAqMXgt6/2EUmNDyVIjfAmVG
 3gkz+zgzTBjJrFZxgzP81nGlNM8T2ntZBFxm0TooP3zSjLy5LTPD7s1I1aMORCT5IzxN
 EGWhuV/QE7pE8QZ+N5LvHQOO2RD8CwbzGdIGzk1UjNNqkOvsZbV1WX5Wp/PofEQ5jvl8
 OeCw==
X-Gm-Message-State: AOAM533smp++vXFtK/PUkaG2VlL7Fjd7Wcqw3RBLU2lh3ii0i80DR4oh
 XS186HCdCtyxhpzEYPi0OeqvM3u79gmAQQ==
X-Received: by 2002:a65:668b:0:b0:3f6:4026:97cd with SMTP id
 b11-20020a65668b000000b003f6402697cdmr11453154pgw.420.1654315589269; 
 Fri, 03 Jun 2022 21:06:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/28] target/arm: Move ap_to_tw_prot etc to ptw.c
Date: Fri,  3 Jun 2022 21:06:01 -0700
Message-Id: <20220604040607.269301-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gnJ1deSn3Lm1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    | 10 ------
 target/arm/helper.c | 77 ------------------------------------------
 target/arm/ptw.c    | 81 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 87 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 9314fb4d23..85ad576794 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -15,15 +15,5 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
-int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                  int ap, int domain_prot);
-int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
-
-static inline int
-simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
-{
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
-}
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 02e65c9e98..3a39a10e43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10501,83 +10501,6 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         g_assert_not_reached();
     }
 }
-
-/* Translate section/page access permissions to page
- * R/W protection flags
- *
- * @env:         CPUARMState
- * @mmu_idx:     MMU index indicating required translation regime
- * @ap:          The 3-bit access permissions (AP[2:0])
- * @domain_prot: The 2-bit domain access permissions
- */
-int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
-{
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    if (domain_prot == 3) {
-        return PAGE_READ | PAGE_WRITE;
-    }
-
-    switch (ap) {
-    case 0:
-        if (arm_feature(env, ARM_FEATURE_V7)) {
-            return 0;
-        }
-        switch (regime_sctlr(env, mmu_idx) & (SCTLR_S | SCTLR_R)) {
-        case SCTLR_S:
-            return is_user ? 0 : PAGE_READ;
-        case SCTLR_R:
-            return PAGE_READ;
-        default:
-            return 0;
-        }
-    case 1:
-        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
-    case 2:
-        if (is_user) {
-            return PAGE_READ;
-        } else {
-            return PAGE_READ | PAGE_WRITE;
-        }
-    case 3:
-        return PAGE_READ | PAGE_WRITE;
-    case 4: /* Reserved.  */
-        return 0;
-    case 5:
-        return is_user ? 0 : PAGE_READ;
-    case 6:
-        return PAGE_READ;
-    case 7:
-        if (!arm_feature(env, ARM_FEATURE_V6K)) {
-            return 0;
-        }
-        return PAGE_READ;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/* Translate section/page access permissions to page
- * R/W protection flags.
- *
- * @ap:      The 2-bit simple AP (AP[2:1])
- * @is_user: TRUE if accessing from PL0
- */
-int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
-{
-    switch (ap) {
-    case 0:
-        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
-    case 1:
-        return PAGE_READ | PAGE_WRITE;
-    case 2:
-        return is_user ? 0 : PAGE_READ;
-    case 3:
-        return PAGE_READ;
-    default:
-        g_assert_not_reached();
-    }
-}
 #endif /* !CONFIG_USER_ONLY */
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 427813ea56..9ab77c3998 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -211,6 +211,87 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
     return true;
 }
 
+/*
+ * Translate section/page access permissions to page R/W protection flags
+ * @env:         CPUARMState
+ * @mmu_idx:     MMU index indicating required translation regime
+ * @ap:          The 3-bit access permissions (AP[2:0])
+ * @domain_prot: The 2-bit domain access permissions
+ */
+static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot)
+{
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    if (domain_prot == 3) {
+        return PAGE_READ | PAGE_WRITE;
+    }
+
+    switch (ap) {
+    case 0:
+        if (arm_feature(env, ARM_FEATURE_V7)) {
+            return 0;
+        }
+        switch (regime_sctlr(env, mmu_idx) & (SCTLR_S | SCTLR_R)) {
+        case SCTLR_S:
+            return is_user ? 0 : PAGE_READ;
+        case SCTLR_R:
+            return PAGE_READ;
+        default:
+            return 0;
+        }
+    case 1:
+        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
+    case 2:
+        if (is_user) {
+            return PAGE_READ;
+        } else {
+            return PAGE_READ | PAGE_WRITE;
+        }
+    case 3:
+        return PAGE_READ | PAGE_WRITE;
+    case 4: /* Reserved.  */
+        return 0;
+    case 5:
+        return is_user ? 0 : PAGE_READ;
+    case 6:
+        return PAGE_READ;
+    case 7:
+        if (!arm_feature(env, ARM_FEATURE_V6K)) {
+            return 0;
+        }
+        return PAGE_READ;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
+ * Translate section/page access permissions to page R/W protection flags.
+ * @ap:      The 2-bit simple AP (AP[2:1])
+ * @is_user: TRUE if accessing from PL0
+ */
+static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
+{
+    switch (ap) {
+    case 0:
+        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
+    case 1:
+        return PAGE_READ | PAGE_WRITE;
+    case 2:
+        return is_user ? 0 : PAGE_READ;
+    case 3:
+        return PAGE_READ;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
+{
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+}
+
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
-- 
2.34.1

