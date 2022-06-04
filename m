Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6076122lfh;
        Fri, 3 Jun 2022 21:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcBrrdj4zIAttCqXpYbTz+oipotvPE2puPyf8TXnxqYRadXjVRCryXSv6lxN5j+rPJohc1
X-Received: by 2002:a05:622a:3ca:b0:2f3:da3a:6e98 with SMTP id k10-20020a05622a03ca00b002f3da3a6e98mr10520651qtx.166.1654316523119;
        Fri, 03 Jun 2022 21:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316523; cv=none;
        d=google.com; s=arc-20160816;
        b=b/4QS0k0tYo8SKK9ZxhFn1qRG+zTG+6yaAUPwfQNQq3cSKsuJeFo7s86zmajhl4TXR
         YfdVGreEgOfNyE3i1b1oMtgP9j4mh5b6kNetIKDppOFmIJ1oKMvU4unmIWIrBTFucpW6
         +jzT1f4m+hiUbtBLbrZv2K9iOt9OFALX1cGI8gkX85IAd6XFH547Ta71itUhYmiytZVY
         jQJOgtw/5CVCJ0QQmRpaKMZNTCHNKMYvAnmk+meR4U4z4keKOD1DsoxQhfwcE3MqwClH
         Fk+k9mf4RhtSeaTOrTP0Jpjx5jzMizmq62QaX7949+pT6Ay140dWl5lmWkb5AX17/ZrV
         OLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yFIaCaxXJf8mp665jzJyOMjbEY0cC7z6g35E7VMLSz0=;
        b=lPCskQ5KYKmgw5RQSYc23PFStsd6RmzM2UA4yQIR67jrVDIkrEGIa5GhBiVrcgTwKD
         GPTbnUFbI6Ff1bGnOuWega4M7Qslxw+IWfcHPjuT2KPlvnhkdVr6FDwQofx8FP9qNAoa
         Mi2qw1jg2P3mCElLEwRt4u2vWRG0y7g0Ci0gAxUsUI+Hds/uvOv1sceI5Cri3qJepDz1
         CLa/+MQjFZa84faGXlnsrFkir9aQkq9exITkF1BL3ONUPAhmiIigt0duGy8sFD4Qgzds
         oMwiK+oEhseYrYL6TFN3HQx6L5BozLgq43uAbXBS4e7LxvaoSsnzJnAXLwpHEgClU09D
         Qj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeYvK6wU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib1-20020a0562141c8100b00459e17a3f8esi4704453qvb.205.2022.06.03.21.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeYvK6wU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLIY-0005fC-Ju
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Q-0007ug-Fg
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:24 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3O-00007Z-ME
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id d129so8635287pgc.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yFIaCaxXJf8mp665jzJyOMjbEY0cC7z6g35E7VMLSz0=;
 b=XeYvK6wUz5IM9HZS1fDpgg0uPKNX/Oq4NoOYkuscT1mjn/CaevBl3gHHB6tSL0Ugg9
 nEMOUYMg5ni6SaGvFTSO3pdGHsS7nyG5nZCKqmf7/54Raz8dfzbGf7YRGwUPQuDqxA8a
 +dqr45kIY8DFJLhZWl2a0DW1aAw7AvHG9lregVwoaDPeCtuy44pdBu1etW2kpGD80Xsl
 Y+sYOiw322G3VVRofzEE+YxwGnTu7wJOQRoC1ViBXTr+gRfhTd15CrGYU2K0oHG0kYIl
 IE8omKj07tQBNI9AaGW70lzfRbhED5kFw+PaYhkMIoN+q6Ed+mdqvhNeou2H9im8+udl
 f2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFIaCaxXJf8mp665jzJyOMjbEY0cC7z6g35E7VMLSz0=;
 b=AhSinZQEarYnXJMv3F4xGfI8fNBQeIcw/ykOPvLU/v/olXQIK2tdF5APU2zXicbFTL
 4MoNXNNFSiBDSJ/Pl3pvC8a02WOkX7fC9Jq0hptY3PK8CXA6WvSBVCdukpti8rl4gUod
 y/cxtu3bjlMsjNof64ZmygsyAQCn5bggKyXBxPvDJy+PaEJEfSSu3dvoN9MRrHMevXLI
 bqceT3+YrzlEqgt7JCvzvkjx5KnyNdWuX4NdEbKAwKD9GR6AooAIsbPFDuaK6NR9bZXv
 Dw6b/VUY+zT9DFvJz6ScZW0B5iHgo6iv67UVdyYAPsIjWtS4viLNBmbLlB872/jVXL3O
 CbdA==
X-Gm-Message-State: AOAM531xKs2tNYjyDY12s63Uspu3fEWvIcCmyP5Dvl0EbmgcV7Ilw+W0
 5kMiVxoRQ1GQVLT3EuJmAlrbwEoX57YdAQ==
X-Received: by 2002:a63:6bc7:0:b0:3fd:1b8d:d114 with SMTP id
 g190-20020a636bc7000000b003fd1b8dd114mr6163703pgc.308.1654315581244; 
 Fri, 03 Jun 2022 21:06:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/28] target/arm: Move get_level1_table_address to ptw.c
Date: Fri,  3 Jun 2022 21:05:52 -0700
Message-Id: <20220604040607.269301-14-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: cf4Jd+1kjjtT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  4 ++--
 target/arm/helper.c | 26 +-------------------------
 target/arm/ptw.c    | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 6c47a57599..dd6fb93f33 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -18,11 +18,11 @@ uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
+uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
+
 ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                  ARMCacheAttrs s1, ARMCacheAttrs s2);
 
-bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                              uint32_t *table, uint32_t address);
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
 int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 937971730c..50c4576544 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10446,8 +10446,7 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
 }
 
 /* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
+uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return env->cp15.vttbr_el2;
@@ -10738,29 +10737,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                              uint32_t *table, uint32_t address)
-{
-    /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
-    TCR *tcr = regime_tcr(env, mmu_idx);
-
-    if (address & tcr->mask) {
-        if (tcr->raw_tcr & TTBCR_PD1) {
-            /* Translation table walk disabled for TTBR1 */
-            return false;
-        }
-        *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
-    } else {
-        if (tcr->raw_tcr & TTBCR_PD0) {
-            /* Translation table walk disabled for TTBR0 */
-            return false;
-        }
-        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
-    }
-    *table |= (address >> 18) & 0x3ffc;
-    return true;
-}
-
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 32ba2e5e8b..5737a3976b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -15,6 +15,29 @@
 #include "ptw.h"
 
 
+static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                     uint32_t *table, uint32_t address)
+{
+    /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
+    TCR *tcr = regime_tcr(env, mmu_idx);
+
+    if (address & tcr->mask) {
+        if (tcr->raw_tcr & TTBCR_PD1) {
+            /* Translation table walk disabled for TTBR1 */
+            return false;
+        }
+        *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
+    } else {
+        if (tcr->raw_tcr & TTBCR_PD0) {
+            /* Translation table walk disabled for TTBR0 */
+            return false;
+        }
+        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
+    }
+    *table |= (address >> 18) & 0x3ffc;
+    return true;
+}
+
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
-- 
2.34.1

