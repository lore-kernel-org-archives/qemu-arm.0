Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6079075lfh;
        Fri, 3 Jun 2022 21:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZb9zFzeASrczfYogpTYKSbMLtUjFYCax+PRHlSmTrJlz+dEMP2e5IQacHT5N+SB3U8RPa
X-Received: by 2002:a05:620a:244b:b0:6a5:b92e:9b with SMTP id h11-20020a05620a244b00b006a5b92e009bmr8949677qkn.610.1654317081635;
        Fri, 03 Jun 2022 21:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654317081; cv=none;
        d=google.com; s=arc-20160816;
        b=zgD8rr3GAUiJuWAFCXtzcH3m1zmWX368bpubuokVbnog6ko1xuShivSivySC+kenIG
         BeGaA8H0TMKBBm/Omu47g9Zgrz6sUwhaopaR7xjbT2fwboHSpWv/ullyXOwvt3qYBALV
         dlXjsVLx3eIdnCRToMBiyExOfysToRmpLHMiIpHtqzUN9MEZ2tpqQhNvgKtChTmp88HC
         ohExSihC00tO9dXnGOBv8cDOK6SPMkXVoHWBs+2lXZw5a31doZdbbenfhl2OEp13IR1G
         HNYOyKCMfkL3ol7iFYwgjq/Y782bzHYqpUc1AZV/CILUe+hDK5oGjmlIqN5is9TBGS75
         hxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qkd0B4g6jM3nkL28VlmdmN6+46UTMQek41TjlfeZ+tg=;
        b=ND1d0b30uJns07Q2gZcCJsj9LBpelPNbIeHy1DcTlxQl9O7qUvqOcRvKOq8h3w8wUm
         Bf1rtzrOFbRut6ZbaUAaxa+XnD4C3o7v/qbrpvVHp8lm3JoLmjU6w5a7HDIzTQ+ZxccA
         PD4O4SUvr0mJ2tRC5xAHWMawzWgVufnLicfW2JZMLX0JMuB9Uf5alZI+xW7OLZV1jYVU
         WiPGQB1pq9hjAsqWyHhydB30YRF12LpTYXzdY6VYHCjSNjTax+I4wCT9ZoZjv0ZPDTxW
         v1ERKxj69IGBPPhWvegyNUF2TMg4Chmp0b3s4Eoy5Ut8eEqdP/nfiryNf6vDcQVttc0k
         YFnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKfnAh48;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020a05620a025000b006a69b65717asi2030740qkn.377.2022.06.03.21.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKfnAh48;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLRZ-0007lN-5P
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3V-0008BF-0u
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3S-0008V4-Hc
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:28 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e24so8741524pjt.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkd0B4g6jM3nkL28VlmdmN6+46UTMQek41TjlfeZ+tg=;
 b=QKfnAh48w/6pL2qxSb4QBEVbra2oS9p4L4Ckt3nlLJ9YZC+50zh/86TlIow5GGanHY
 ORV87jwPPI/XavX/yPqLgto6PIbHKp4T0yTPqReRyBhRqYAaO3q1ojmRb5YMKSFUIuBf
 jgT01XeGP8FOaJFIWXaY178Qmxgk8AAn/Xs6VsAMxKH+nKqdoHIscYvq1HLIp4CQL4q2
 R8J8NF1ijCno+XeK4QQDWzDEIFTeOmFTlaLCmcQo15k1F/IwaQKL19XoNMklWK5/XlcB
 qpGaN0dZ638ZdD9rR7WV3tivf/CDNVLVo8CgOC2kJqS0M6qo0vu15dhbZieLzQTKkpg1
 dPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkd0B4g6jM3nkL28VlmdmN6+46UTMQek41TjlfeZ+tg=;
 b=AByWfONLYwWnkHN6otY33b80uxX0O5u51CQVU5C9+fgF3FDIUOh0gIOj6COx4A3A6e
 eCMJpE61NAMptrP6sNyl0AvlHW1ZtdiCsb3yDaAxuC79mM6KrUhbAroQkT76jc99L6Ul
 QyC2YYu8rkm/JMq/veD4L+o/phqLC5iCHYFhnEvZVhLPiafr5yE5Qd82oV/YASSPaDgf
 G1pPlLD3x9PWUIEE/QF29whcOoH/SaJZsmDmrEpwXo7DCjChGTiEMMCJpelXt63lKQl+
 lV4ounpK54HHUZvS38ePFQnHysCKZodtfdgb2T66AoW3Nvc/6hm4Y5p/W6ca+iDePcvb
 lPPw==
X-Gm-Message-State: AOAM533cRCD3F90OXWM/eZB5YC+1Jy8QjE/cXDoXfmLtUoTy6dbeux87
 L4hG0RNKTzfByBqa24LNscLtvJnyoglR5A==
X-Received: by 2002:a17:902:a507:b0:162:2a77:7363 with SMTP id
 s7-20020a170902a50700b001622a777363mr13336670plq.115.1654315585767; 
 Fri, 03 Jun 2022 21:06:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/28] target/arm: Move arm_pamax, pamax_map into ptw.c
Date: Fri,  3 Jun 2022 21:05:57 -0700
Message-Id: <20220604040607.269301-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: E+gKQgix6BVV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 25 -------------------------
 target/arm/ptw.c    | 25 +++++++++++++++++++++++++
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 28b8cb9fb8..fba650d01c 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,8 +11,6 @@
 
 #ifndef CONFIG_USER_ONLY
 
-extern const uint8_t pamax_map[7];
-
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4ed2093acf..001d632cd1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10778,31 +10778,6 @@ bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
-const uint8_t pamax_map[] = {
-    [0] = 32,
-    [1] = 36,
-    [2] = 40,
-    [3] = 42,
-    [4] = 44,
-    [5] = 48,
-    [6] = 52,
-};
-
-/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
-unsigned int arm_pamax(ARMCPU *cpu)
-{
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /*
-     * id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.
-     */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e4b860d2ae..d754273fa1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -23,6 +23,31 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
     __attribute__((nonnull));
 
+/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
+static const uint8_t pamax_map[] = {
+    [0] = 32,
+    [1] = 36,
+    [2] = 40,
+    [3] = 42,
+    [4] = 44,
+    [5] = 48,
+    [6] = 52,
+};
+
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-- 
2.34.1

