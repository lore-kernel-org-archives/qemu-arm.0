Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4236866lfb;
        Tue, 8 Dec 2020 10:07:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw++b+PSOTfZcq+NpAEevKRRS5dOS3EzC2C0hfOaEvb1KgR3Uh9f6Rxi5AU0xqnuG87j3UL
X-Received: by 2002:a25:9106:: with SMTP id v6mr6768469ybl.408.1607450840011;
        Tue, 08 Dec 2020 10:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450840; cv=none;
        d=google.com; s=arc-20160816;
        b=cx9WufEzBBD/uFMuEMAAiRhS09lgfgfyvZoW8QMVujcKSKrqwyo2PeAxzpY9mNpF/V
         TGdY7cddO+tpM8fl3+AJpwMTrT01M5CHKPNE+1KopabhsrUqsXO2VXLHg/LwNB/3Tplj
         xvcZP0X3lzkaNI+O2hUEViKqZPEXh7cwKgwOUYtwvZv2cAgcbz3Ou0SYmEfwR7rE1bdm
         EZPd6B3zKJmjJsXO3/ExK1TBBZBvcmqlGtEMjanrYr0jxW5sj+IquoR+lB53dheEohEG
         s6Tkm+9kBk9elygfxnyk+UzJazjszRRciJbGKQcrwQa0CTE0ca69YZaI7EJ/7W6D4M/y
         +KOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wXxlIHEHV0RVDyckAtbEiZsJCIXIPBDl5ZKGc44kZZY=;
        b=zdmwZ1zhpnuJrOQmC95qzZyTeu3O38QzekpfH0Mj7F10wxqkzEKGw6buOPxYpAQgxP
         uQy65+Dt48jqBaXtSDOCl6156YnAmX+XMT5MmZYa9NK1eWH0hfpnld58Oh9lRBT8WLCB
         Yg2BTBaVgwIvOX354Yu1+cTepoGIdlEkgtLT7APrZwAcGTRNceE0Pro8mDlUQdWTe0mN
         m44ZE7XrvRpK+OwGSJPPVIFtzOgP6rSZt2kErxbHyfUTa3ytM3ZEifryw/k7fVX97gTe
         oWJrTl7Y9onxz53SRoIJJtr+uqtOfMmctPqPLEssfzuCGgVGJ+hijTZeQD6h/0eDRohW
         L9SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HLjHtvA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si15202472ybs.480.2020.12.08.10.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HLjHtvA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhOR-000423-BP
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIv-0007WQ-7i
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:37 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIp-0006LQ-Bm
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:36 -0500
Received: by mail-oi1-x235.google.com with SMTP id l207so17413730oib.4
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXxlIHEHV0RVDyckAtbEiZsJCIXIPBDl5ZKGc44kZZY=;
 b=HLjHtvA0lWB8x7nePXTlbZplRmtil20swZHbwsJjXiZBDzVJjtx7j4FF/9VViwRd/Q
 Pvk6c4hbY+ozKQ2FcNkg1H8s+/9LOTB+d+RXw1QUdfR2VeB0Ltx02UWxbJ2EjSfFQERE
 uG609SXQg36wYiRUFE4q1Skt4AKKTrB1JLtIscMGOFurQ6m1O1r60pOXRU3snqqUcVNc
 IqmX74DA2niLK6cJn4t71DT22W/DM1KDHZqoCl8jGCtIngGEMQ3vppiWl6KDcAzC4GVe
 voaaDauT6ntGVRyFbQTwnd6uLZ3sWUP7Wy+Ggk3Lra8my/MYT8vhuuUqrs/TKI763r7B
 SrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXxlIHEHV0RVDyckAtbEiZsJCIXIPBDl5ZKGc44kZZY=;
 b=ggbZUEOBbdM9RjvVmACRn6KMiDxxHrMz9tT4qJ7LgD/GkceS1px20Mn4AwrMlWweHy
 iT+2AWmapvqIrwgxQ32qpFOINWnBxC0Z+0RzvBQ9fyGo8JVio97t6KNl+M5LpDTAsbfS
 2xHPqgnFqTj51iUu7gR6AwnYbpN6+9KvSiJlrc5aI0enISdMaqT7Oivsq3m0OmR3Hzp/
 apRXaSK7gqQQfQ6Nng44AmfMQ9PLajrEPqJSBG6lZgz83Mx3VYoFEoS+mcAjmYA18YI5
 DAoXEPQDfEZCuybbHoERAO3RLQniaFqDcjYWTEBC02kf3vrhmkol7pAAW+k2Ihg+lrh1
 Z1TA==
X-Gm-Message-State: AOAM533BnSitFB1kbcgQRT++ZUq/l+dephyLe9QeFAZGwLsLhmfYqX6q
 VKFD7QFv+95cT2E7t3mf81ePdg==
X-Received: by 2002:aca:bb0b:: with SMTP id l11mr3630747oif.16.1607450489984; 
 Tue, 08 Dec 2020 10:01:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
Date: Tue,  8 Dec 2020 12:01:00 -0600
Message-Id: <20201208180118.157911-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9k4Pdc1SgMMs

Adjust the interface to match what has been done to the
TCGv_i32 load/store functions.

This is less obvious, because at present the only user of
these functions, trans_VLDST_multiple, also wants to manipulate
the endianness to speed up loading multiple bytes.  Thus we
retain an "internal" interface which is identical to the
current gen_aa32_{ld,st}_i64 interface.

The "new" interface will gain users as we remove the legacy
interfaces, gen_aa32_ld64 and gen_aa32_st64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c          | 78 +++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  6 ++-
 2 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef9192cf6b..f6007c23a6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -916,6 +916,37 @@ static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
     tcg_temp_free(addr);
 }
 
+static void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    tcg_gen_qemu_ld_i64(val, addr, index, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+    tcg_temp_free(addr);
+}
+
+static void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_rotri_i64(tmp, val, 32);
+        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
+        tcg_temp_free_i64(tmp);
+    } else {
+        tcg_gen_qemu_st_i64(val, addr, index, opc);
+    }
+    tcg_temp_free(addr);
+}
+
 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
@@ -928,6 +959,18 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
+static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_ld_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
+static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_st_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
 #define DO_GEN_LD(SUFF, OPC)                                            \
     static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
                                          TCGv_i32 a32, int index)       \
@@ -942,47 +985,16 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_ld_i64(val, addr, index, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-
-    tcg_temp_free(addr);
-}
-
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_rotri_i64(tmp, val, 32);
-        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-        tcg_temp_free_i64(tmp);
-    } else {
-        tcg_gen_qemu_st_i64(val, addr, index, opc);
-    }
-    tcg_temp_free(addr);
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
+    gen_aa32_st_i64(s, val, a32, index, MO_Q);
 }
 
 DO_GEN_LD(8u, MO_UB)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c82aa1412e..18d9042130 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -494,11 +494,13 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
             }
-- 
2.25.1

