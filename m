Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2433580lft;
        Sun, 3 Jul 2022 01:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcnzfrdxP+o1tjlt7r5Fwfl/2xHgAdLVbALnQ43yv+y/4hX/Zl1MUpH9ZIDDHxog8Rd+vt
X-Received: by 2002:a0d:d685:0:b0:317:73f9:ebac with SMTP id y127-20020a0dd685000000b0031773f9ebacmr26872998ywd.232.1656836705920;
        Sun, 03 Jul 2022 01:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656836705; cv=none;
        d=google.com; s=arc-20160816;
        b=zVC4hM7hieAvc4ly0PVLJTQKigRZRbt/TShQ6fBT/B+Y7zyZkpu7M0ZOlnOD8Kt1n1
         T20tQ0Z2Zq88UPg4eFh66uSh1nSY7eMETur91wUWwfC9r0vzMHcqAerXBCL6eVJRjbqj
         zZbFki+29run9IEbjg3HjTG/IQMvtFF+IGnw2+dEB9t04uqq3MWqpESbjDsq27jYMqhS
         g5au1Tl7vML7ZN2AcoW4Z1OvaRUV3lToGTwgGEfPre6K2z9Kgwsg8pFuH3H9aJfV5SlN
         ViGEUHiDiIhm05jmXGMateIN8QcYZiSnRojCIm08V8OH/Tt5MLNSomjSLl9VOMX0v/aU
         TJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vbeQfFOZRxgjST6VhHPHw0Aocd+Vk/eMVmhwzhfwMAo=;
        b=O/4NbJiy2sy70x2WG7FwPjJO64qWpkt5eGhT/3dwX+mZy02QAFja4PcwFz8pfp43MM
         Lg953FxdX+5VEmUTrAI56joJA2eGOOONgn7gMjXClkTGuIbfa8JaneTKM7F1L/LhnP5u
         MNeRQRyLleVFFP9whhyg/m2KWIp5YO+ndFfRZ/Ptw9TeCoy7u0yx80grqRi69wn52Y41
         nknl7KvLV/iZ6Apl2+X5bLY7Rf9HR2ww3JbL6yInccAWCd9CjxxFSDoy4lwkQXmhyJ/I
         owvcvZgGW9b0Ri26jDHOxH9qIC2UGRPNb+gBgm9GqneZg3/C1Dzz38Gvgv0rAhcfdo9u
         ezMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZFadF2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a25b044000000b0065cabbe7127si40482245ybj.123.2022.07.03.01.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZFadF2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7uuf-0006Lr-B4
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuA-0006HC-V6
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:34 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu9-0005o3-91
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:34 -0400
Received: by mail-pg1-x536.google.com with SMTP id 23so6238225pgc.8
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbeQfFOZRxgjST6VhHPHw0Aocd+Vk/eMVmhwzhfwMAo=;
 b=IZFadF2JtOwSikHfzQhBY1cZBZ3jjvQ1v5FyHvncvCFiKugtcp1mkbottcr73UE5wF
 /jL7fLaCRlPhYUQ1a6oFjNlMEh9goQW67mviJ0esESdRGlNfWYZF+pVrMKmYIT0h5xlw
 E5ROtB57nvNN0+8m9n330ixsDtPpKaU1hWLGR2cjTT0wIOo71JvN0G2dYt7I5JuXXxcZ
 QjLGpIUYzCeSNqjFaKVK6mNWXnV8eu3wtzgduy/lVz7qw4fTu0uLDX6s7OYaJAhWLEJ3
 uNDd23W3ELgDP4BoBpACw/K+/f7xCmXmyfpXTj9btDKitVNuVqJKLfKq8JYu+OHfStP8
 x40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbeQfFOZRxgjST6VhHPHw0Aocd+Vk/eMVmhwzhfwMAo=;
 b=UoWgc+1HeiKM2PQdKp9jI0htAdLeSm0Ps4KDvXBf4LNN/1pYMFU4LhXExAmptFai8t
 nzd1z8XQ0BwgGfwgugpE1t1qtsmckTGDLv2Vu+i8pOrnCtD29Z/DhP1dIH5L7nkEP48q
 LKrK8GmkhJfggY8lDnJSdzccN4/N1IJ4jXyjg7BK7n65W9rTM0NqFF7J/+rIa79kylKX
 9VNelHuLAsjajIX0ejhbK1cl7EOFp0L9goCVhuOb6HwnFKce85z9WUfepUm7cdoo6Tuh
 DJRC33YFSNVf+fOLNaJMNULsXPOs5dT6ZF41Rgqgm7RX9pdKOVUoaUZAHaSspOlalERq
 dCCw==
X-Gm-Message-State: AJIora/JtfAqgaDqbl3u36xceHj1F/38fEdBX9Wqg+eUTH7pv6hyVfkx
 KchytH46oXXULu4F3+kXZW2OSn+3thvJc5sl
X-Received: by 2002:a63:6cc8:0:b0:40d:e553:f200 with SMTP id
 h191-20020a636cc8000000b0040de553f200mr19271338pgc.166.1656836671862; 
 Sun, 03 Jul 2022 01:24:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/62] target/arm: Enable PageEntryExtra
Date: Sun,  3 Jul 2022 13:53:19 +0530
Message-Id: <20220703082419.770989-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: jvHrIgTWN8Kb

Copy attrs, sharability, and the NS bit into the TLB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  |  8 ++++++++
 target/arm/internals.h  |  5 +++++
 target/arm/tlb_helper.c | 14 ++++++++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb12427..a14f167d11 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,14 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+/*
+ * Extra information stored in softmmu page tables.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA
+struct PageEntryExtra {
+    /* See PAGEENTRYEXTRA fields in cpu.h */
+    uint64_t x;
+};
 #endif
 
 #define NB_MMU_MODES 15
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c66f74a0db..2b38a83574 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
 FIELD(V7M_EXCRET, S, 6, 1)
 FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
 
+/* Bit definitions for PageEntryExtra */
+FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
+FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
+FIELD(PAGEENTRYEXTRA, PA, 12, 52)
+
 /* Minimum value which is a magic number for exception return */
 #define EXC_RETURN_MIN_MAGIC 0xff000000
 /* Minimum number which is a magic number for function or exception return
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c4..9de3099153 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -226,21 +226,31 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         &phys_addr, &attrs, &prot, &page_size,
                         &fi, &cacheattrs);
     if (likely(!ret)) {
+        PageEntryExtra extra = {};
+
         /*
          * Map a single [sub]page. Regions smaller than our declared
          * target page size are handled specially, so for those we
-         * pass in the exact addresses.
+         * pass in the exact addresses.  This only happens for M-profile,
+         * which does not use or require PageEntryExtra.
          */
         if (page_size >= TARGET_PAGE_SIZE) {
             phys_addr &= TARGET_PAGE_MASK;
             address &= TARGET_PAGE_MASK;
+
+            /* Record some particulars for later lookup. */
+            extra.x = phys_addr;
+            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, ATTRS,
+                                 cacheattrs.attrs);
+            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
+                                 cacheattrs.shareability);
         }
         /* Notice and record tagged memory. */
         if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
             arm_tlb_mte_tagged(&attrs) = true;
         }
 
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+        tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
                                 prot, mmu_idx, page_size);
         return true;
     } else if (probe) {
-- 
2.34.1

