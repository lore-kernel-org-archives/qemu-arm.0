Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1609535njm;
        Thu, 6 Mar 2025 08:41:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTgjtCvCncEZn40ELKiKqFeFBHnBV9ljw/Uxlg9qopwTJpUSelH8iloPXmpYBOTQCvjfNVfxIwxmqxug==@linaro.org
X-Google-Smtp-Source: AGHT+IGW6rchUCK6yM1Dq5JvaIAUZVY5FyVIGI3nipIkcTvVHkv6ue5f4ZwejbsKEJP5fi1QB+3h
X-Received: by 2002:a05:6102:a47:b0:4c1:903e:7bed with SMTP id ada2fe7eead31-4c2e243d847mr5291821137.0.1741279293491;
        Thu, 06 Mar 2025 08:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279293; cv=none;
        d=google.com; s=arc-20240605;
        b=SLiSHlhOkRsDz1FVmHJznKpfmcuvrAdUnwS4HQKF/zit9ko0POwRksq/mRWVspiMGZ
         ak8OzmsvOj5TZiOlaE7EX6kLvXrzE6E6/gbHfRHn/FrlsWxlUVB3Zjmyy7cHBrOP7Es6
         bvYFmiMfLX9VUv0fdcUomuh3+ko4Qd/15XKP6tYUna5GgUDkSIsry4TTLvTq+lbPdgkY
         A8FufWNbgAL25IPM/9gLRw2nwahPhu1GPD8SmIN4jZbh4AWOK9yjh9mZH4tBpH6bGDpp
         MISpl5CSDBf1M27GYjbDKwNNDNZhSgRCmO/bwOCHw2yhNqTrhDv8nARYvLDmNmnfgu8J
         Up6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=buL5XagIeXqBLgJBqfarfsuVQtwTrOnKW/TPgRyLsQw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eFJ+YH1pRdqSw3ZtFO2bJbLCYrhIcAlyFHD/AWvkO3kZvhxShHLgh82PzJA5o+TioA
         pyrqXK9bE80frg7FSyJnabgoXQFMhroMnWMS4efa5UFnClKEy5r7MxcuWvsbv6mYbyb+
         r49bM77n4amiliS2P7Dmp476Mpyb2PvcklPh+z4gT3fseOvHD0b0UkiUyr97xahKVPzf
         ESwgsJopf6LofUB9esJYiOFszBL1LmvOs7++nEo80DIP0tnbQbb/Tak4/d9tzVuYxngt
         RDhY/yovEjk5AaA1e7oOmGVjfViDeAopzTba/Qb8AVfNot5T28Kj69F9tBAd6/rgcqQe
         CosA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQ1+eKJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc720f9si371819137.209.2025.03.06.08.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:41:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQ1+eKJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEGC-0006yW-82; Thu, 06 Mar 2025 11:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFz-0006lY-ED
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFx-0004ZX-HL
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:35 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso10697845e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279172; x=1741883972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=buL5XagIeXqBLgJBqfarfsuVQtwTrOnKW/TPgRyLsQw=;
 b=iQ1+eKJl5E/ZjpTszX6H/5GYgVqaAa8JF/fX54uXq5xM+qwDqZCgURHxpUWlhki9CT
 Sr2RMTRq17rbOIaZ//nBhoRX9K7kHVYsYJf0FfstVFE0pXvw/tohuH8+tM+9TmkvXpX4
 Y3bfNFZb+3CaNogGL5nsZnCoXFtYHExwdImX7EzgR/1URs/jspCwqDcUdnj374+XZCVi
 HaYNOAwwNBnhIeMyLFuDhJdN6WX07s4QGJZ9L6WqMRoFyxQRIeyGk0tQ+ZHN4HD72E/g
 9aFsLs711BO8sZCxayPOSgGS7dailEnTHq9gbV+GV9DKqQiybrsOCt4uHsYXZ+KRy/Ci
 VfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279172; x=1741883972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buL5XagIeXqBLgJBqfarfsuVQtwTrOnKW/TPgRyLsQw=;
 b=wkRDbIHvkqz6cKbmqo3NS4Cee6shHuT+o10KumFkPcIov7fqFt4/m4ansr4nr0CB35
 +CQ703evlDQs++x/YhF6jprN8lCYWbxxaGsjZNRE/WQHrg6R1TpjDOQmu4/u2fWIDz9X
 4M7WUR4F/53lkeUqaWlhl4ZYnSidLBvbtC9u7TLgjCkoVnLNmFSvlWxNZirMZqjxfNti
 m+WerKWQnAYOfNCxuUFyFykMGrVMqHzVz5DIsgXMsE5c4xu+z0P2u2IuVXIBxioBNTxO
 llDm3n+0Aj0kIZyIlrk2MUjwLu8Ry+1KoflQJsUdUYYdRUxCpHT9FUTzhPnSta+vI1fo
 5QZw==
X-Gm-Message-State: AOJu0YzwXHUYEgdi+i9Rm2oL7EZWJvh+6UajU/TihxNpW6MaasZeXpoG
 POMY0wQJ6YJdBJu8WVZbaL3oS6922UEOjuX9zwHm90LD2aZ2zcatmoOKw1yrGxYeKpqnNdsyWaT
 Q
X-Gm-Gg: ASbGncv+ZLZxOvy8SDNTyxnswOUsOdWLH91VJGjh2sCoobxV0eX+FMbsXCT/EZEuDHz
 R3HbcCwhZaYNUls9w9D46nzXNiaUobBcLCr5anPZFxfLvJr71HrreqrRhxTviSVBxUgnpbIJzh6
 DEgAKq/s+4AWPy8YQzMPyRBZD5lCgzH1FZFn0lewVt2B8BjZ7rTaCxODSkBuPv0gmJaOeDNBjAe
 Ikz/aJ+K1EVx38zWJmDaA4Hb0IZe1UJZu5maqS3ZxywNXDCqiQE3AkDJvs979dQalfqdI026JSh
 QWE5F+sGTiuKuKs6sHG7UZBSeavBXHr5PJkJb2WRw4osobS933o=
X-Received: by 2002:a05:600c:3b88:b0:43b:da79:582b with SMTP id
 5b1f17b1804b1-43c601d67edmr1966075e9.18.1741279171939; 
 Thu, 06 Mar 2025 08:39:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/arm: Move arm_cpu_data_is_big_endian() etc to
 internals.h
Date: Thu,  6 Mar 2025 16:39:19 +0000
Message-ID: <20250306163925.2940297-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VlLmJLvm+Wff

The arm_cpu_data_is_big_endian() and related functions are now used
only in target/arm; they can be moved to internals.h.

The motivation here is that we would like to move arm_current_el()
to internals.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 48 ------------------------------------------
 target/arm/internals.h | 48 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5ae40f32491..16c9083be61 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3030,47 +3030,6 @@ static inline bool arm_sctlr_b(CPUARMState *env)
 
 uint64_t arm_sctlr(CPUARMState *env, int el);
 
-static inline bool arm_cpu_data_is_big_endian_a32(CPUARMState *env,
-                                                  bool sctlr_b)
-{
-#ifdef CONFIG_USER_ONLY
-    /*
-     * In system mode, BE32 is modelled in line with the
-     * architecture (as word-invariant big-endianness), where loads
-     * and stores are done little endian but from addresses which
-     * are adjusted by XORing with the appropriate constant. So the
-     * endianness to use for the raw data access is not affected by
-     * SCTLR.B.
-     * In user mode, however, we model BE32 as byte-invariant
-     * big-endianness (because user-only code cannot tell the
-     * difference), and so we need to use a data access endianness
-     * that depends on SCTLR.B.
-     */
-    if (sctlr_b) {
-        return true;
-    }
-#endif
-    /* In 32bit endianness is determined by looking at CPSR's E bit */
-    return env->uncached_cpsr & CPSR_E;
-}
-
-static inline bool arm_cpu_data_is_big_endian_a64(int el, uint64_t sctlr)
-{
-    return sctlr & (el ? SCTLR_EE : SCTLR_E0E);
-}
-
-/* Return true if the processor is in big-endian mode. */
-static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
-{
-    if (!is_a64(env)) {
-        return arm_cpu_data_is_big_endian_a32(env, arm_sctlr_b(env));
-    } else {
-        int cur_el = arm_current_el(env);
-        uint64_t sctlr = arm_sctlr(env, cur_el);
-        return arm_cpu_data_is_big_endian_a64(cur_el, sctlr);
-    }
-}
-
 #include "exec/cpu-all.h"
 
 /*
@@ -3256,13 +3215,6 @@ static inline bool bswap_code(bool sctlr_b)
 #endif
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline bool arm_cpu_bswap_data(CPUARMState *env)
-{
-    return TARGET_BIG_ENDIAN ^ arm_cpu_data_is_big_endian(env);
-}
-#endif
-
 void cpu_get_tb_cpu_state(CPUARMState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *flags);
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a6ff228f9fd..70d1f88c20b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -392,6 +392,54 @@ static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
     return arm_rmode_to_sf_map[rmode];
 }
 
+static inline bool arm_cpu_data_is_big_endian_a32(CPUARMState *env,
+                                                  bool sctlr_b)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * In system mode, BE32 is modelled in line with the
+     * architecture (as word-invariant big-endianness), where loads
+     * and stores are done little endian but from addresses which
+     * are adjusted by XORing with the appropriate constant. So the
+     * endianness to use for the raw data access is not affected by
+     * SCTLR.B.
+     * In user mode, however, we model BE32 as byte-invariant
+     * big-endianness (because user-only code cannot tell the
+     * difference), and so we need to use a data access endianness
+     * that depends on SCTLR.B.
+     */
+    if (sctlr_b) {
+        return true;
+    }
+#endif
+    /* In 32bit endianness is determined by looking at CPSR's E bit */
+    return env->uncached_cpsr & CPSR_E;
+}
+
+static inline bool arm_cpu_data_is_big_endian_a64(int el, uint64_t sctlr)
+{
+    return sctlr & (el ? SCTLR_EE : SCTLR_E0E);
+}
+
+/* Return true if the processor is in big-endian mode. */
+static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
+{
+    if (!is_a64(env)) {
+        return arm_cpu_data_is_big_endian_a32(env, arm_sctlr_b(env));
+    } else {
+        int cur_el = arm_current_el(env);
+        uint64_t sctlr = arm_sctlr(env, cur_el);
+        return arm_cpu_data_is_big_endian_a64(cur_el, sctlr);
+    }
+}
+
+#ifdef CONFIG_USER_ONLY
+static inline bool arm_cpu_bswap_data(CPUARMState *env)
+{
+    return TARGET_BIG_ENDIAN ^ arm_cpu_data_is_big_endian(env);
+}
+#endif
+
 static inline void aarch64_save_sp(CPUARMState *env, int el)
 {
     if (env->pstate & PSTATE_SP) {
-- 
2.43.0

