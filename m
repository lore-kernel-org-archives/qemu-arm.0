Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4229475wrg;
        Tue, 11 Jun 2019 04:26:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXcot0nzRLohWiHGffKzmU4gQdusVyLCne71ZA04KJkcvbb7O5xl3oek75NaDyc9tk8r3+
X-Received: by 2002:ac8:2537:: with SMTP id 52mr63444606qtm.5.1560252418574;
        Tue, 11 Jun 2019 04:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252418; cv=none;
        d=google.com; s=arc-20160816;
        b=ZB/pWARSq1R935Z50o570j6gM3C4emp+ru29FO5+AJdhRvw5A507OackVh+pOm2UdC
         nQbPDufsb3lO9ck6yktDZXUsxU1B7/ulj8ghJK0maO+hOmk5d0Kc2JsY5G4vg7/qYIbG
         HuvdGn+3yKZsknKCVtEDcyHsGMgkMAwk/Q62kzZbrXXBTClxz/l2MwMMyz03QMPHPtD2
         NRgTPqpTgnODxsfQDSKE2/OCxRozVGBxnxfwEoXE/vl/lUETBVZGqouGme4N0WUaO22y
         ZrIsLfKSOO0KfEQAbmanMOSQoyypUE0bds6A4N9Nsb4/EX4rjAGBbKaXMFnfC5OsZnaU
         DoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=o1g1mlYqkXicG5tKMTS6P/rwrLfAalPOGhMe2aL61GY=;
        b=yNhqIR+fEWYy8fcNHfJjNXZa9RXo1l5bHEEcoieAxUsCz2W5YRW1tjDK/V+UO1AkKh
         QDuV0Dmv0M7ScRQQPhR5jy39zAlbDnnj+C86AbF0mZoxu9TMsBixCqdsuX3hUTRTV/Vt
         Qf7x/WF5tGjJ7aUzxas6AEh10ewCe5gW172+0Vn5jutJzDX+8MTbufL29hr/SeHyE2xj
         iDxiDB2m4ROmZ2jWD0DLPwKN9Q+gPo0u1Jim9vmAOXYN/MHhL46r3qhaywvqP7mplScn
         47HXB+kQhpC/gYsyvyItc2rJCMKHvErnOoXGwLs794hEchxIlY68yc9rK+QIjSeMh0dL
         V/rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yMYbKOQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si3829007qtb.57.2019.06.11.04.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yMYbKOQW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeva-0001n6-5W
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39199)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePy-0007Gy-IW
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007UC-RD
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:18 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePu-0007QY-GG
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: by mail-wr1-x443.google.com with SMTP id f9so12456799wre.12
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o1g1mlYqkXicG5tKMTS6P/rwrLfAalPOGhMe2aL61GY=;
 b=yMYbKOQWsut0TtFHRpRd1JuyEAa9J2shtRO/Yndu3Y/YBbTluc/0NFnO9x2tfYPptS
 EqNCApf51R1Cxbyu28A9lLmsH20YPdAJ8oEBDUVxIjA7wtpakx6wNNC3LwcRRSjE7iye
 /ZTRph8K1Osx1v7jQOgSkIDnS1UIes825S6sp7KVekxOyau0i4KNNlxYhKmSNBpXYs0Z
 7pBUilAGSkhipE3XisvrJVZoCtr7GKX7/4P9+Um/dXadcqmijYZo1DHoFRngRamGK3Bq
 2NDqBiPsW8FFeAhjnz0iKlacEbcU4ccayGhnae9yu81uT+MqFMklDXahQwq4v0hq/V75
 9Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o1g1mlYqkXicG5tKMTS6P/rwrLfAalPOGhMe2aL61GY=;
 b=ZWNwpydunM1e4OCDtUYvLEDzDAonjQ7oLmj4ELQ8sRMgquQagrRUur9DiuoQRUC9n5
 ikb8R0gUOf+/Wa6SVAg4q45OxPE036h7Vhj/NCbnr4YOllxX15YjI7vu8ryp8IEfsNc6
 mDtkB0TyCpHp45i5Tb9dbIZ6eaNCpTmBvjxDXpiatRlxX6ArF+6x029EFDXnEs/TWkZU
 OcotQtyb5u4fobVje2UxDC+sQ9vWjhbsIcdNBQR3ZYpkKFJVDxtymt+kJlHJxDzaUs3n
 IJXYIism5WkNj1wm62EmM9qc499rKV8da/WcC+Cz2WOH6+t3dhNSjxPBZjuwbxrpaF2c
 mMQg==
X-Gm-Message-State: APjAAAURllGrV3lQaNbCMtCXGqkX/+tsA6XmpU0Lb+T0J4PxaFhFq+mN
 xsfkdZTniU469OiUf4cMgFnngee0MSxVRQ==
X-Received: by 2002:a5d:4bc7:: with SMTP id l7mr20781538wrt.96.1560250452059; 
 Tue, 11 Jun 2019 03:54:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:26 +0100
Message-Id: <20190611105351.9871-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH v2 17/42] target/arm: Remove VLDR/VSTR/VLDM/VSTM
 use of cpu_F0s and cpu_F0d
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qgy8w4KaJfot

Expand out the sequences in the new decoder VLDR/VSTR/VLDM/VSTM trans
functions which perform the memory accesses by going via the TCG
globals cpu_F0s and cpu_F0d, to use local TCG temps instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 46 +++++++++++++++++++++-------------
 target/arm/translate.c         | 18 -------------
 2 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 32a1805e582..9729946d734 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -857,7 +857,7 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_sp *a)
 static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 {
     uint32_t offset;
-    TCGv_i32 addr;
+    TCGv_i32 addr, tmp;
 
     if (!vfp_access_check(s)) {
         return true;
@@ -876,13 +876,15 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         addr = load_reg(s, a->rn);
     }
     tcg_gen_addi_i32(addr, addr, offset);
+    tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_vfp_ld(s, false, addr);
-        gen_mov_vreg_F0(false, a->vd);
+        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        neon_store_reg32(tmp, a->vd);
     } else {
-        gen_mov_F0_vreg(false, a->vd);
-        gen_vfp_st(s, false, addr);
+        neon_load_reg32(tmp, a->vd);
+        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
     }
+    tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
 
     return true;
@@ -892,6 +894,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 {
     uint32_t offset;
     TCGv_i32 addr;
+    TCGv_i64 tmp;
 
     /* UNDEF accesses to D16-D31 if they don't exist */
     if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
@@ -915,13 +918,15 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         addr = load_reg(s, a->rn);
     }
     tcg_gen_addi_i32(addr, addr, offset);
+    tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_vfp_ld(s, true, addr);
-        gen_mov_vreg_F0(true, a->vd);
+        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        neon_store_reg64(tmp, a->vd);
     } else {
-        gen_mov_F0_vreg(true, a->vd);
-        gen_vfp_st(s, true, addr);
+        neon_load_reg64(tmp, a->vd);
+        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
     }
+    tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
 
     return true;
@@ -930,7 +935,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
 {
     uint32_t offset;
-    TCGv_i32 addr;
+    TCGv_i32 addr, tmp;
     int i, n;
 
     n = a->imm;
@@ -976,18 +981,20 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     }
 
     offset = 4;
+    tmp = tcg_temp_new_i32();
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_vfp_ld(s, false, addr);
-            gen_mov_vreg_F0(false, a->vd + i);
+            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            neon_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
-            gen_mov_F0_vreg(false, a->vd + i);
-            gen_vfp_st(s, false, addr);
+            neon_load_reg32(tmp, a->vd + i);
+            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
+    tcg_temp_free_i32(tmp);
     if (a->w) {
         /* writeback */
         if (a->p) {
@@ -1006,6 +1013,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
 {
     uint32_t offset;
     TCGv_i32 addr;
+    TCGv_i64 tmp;
     int i, n;
 
     n = a->imm >> 1;
@@ -1056,18 +1064,20 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     }
 
     offset = 8;
+    tmp = tcg_temp_new_i64();
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_vfp_ld(s, true, addr);
-            gen_mov_vreg_F0(true, a->vd + i);
+            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            neon_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
-            gen_mov_F0_vreg(true, a->vd + i);
-            gen_vfp_st(s, true, addr);
+            neon_load_reg64(tmp, a->vd + i);
+            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
+    tcg_temp_free_i64(tmp);
     if (a->w) {
         /* writeback */
         if (a->p) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a9d0c30d3d..c197084e925 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1522,24 +1522,6 @@ VFP_GEN_FIX(uhto, )
 VFP_GEN_FIX(ulto, )
 #undef VFP_GEN_FIX
 
-static inline void gen_vfp_ld(DisasContext *s, int dp, TCGv_i32 addr)
-{
-    if (dp) {
-        gen_aa32_ld64(s, cpu_F0d, addr, get_mem_index(s));
-    } else {
-        gen_aa32_ld32u(s, cpu_F0s, addr, get_mem_index(s));
-    }
-}
-
-static inline void gen_vfp_st(DisasContext *s, int dp, TCGv_i32 addr)
-{
-    if (dp) {
-        gen_aa32_st64(s, cpu_F0d, addr, get_mem_index(s));
-    } else {
-        gen_aa32_st32(s, cpu_F0s, addr, get_mem_index(s));
-    }
-}
-
 static inline long vfp_reg_offset(bool dp, unsigned reg)
 {
     if (dp) {
-- 
2.20.1

