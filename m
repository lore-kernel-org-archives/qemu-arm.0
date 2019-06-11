Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4253859wrg;
        Tue, 11 Jun 2019 04:52:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySbMUwyzlaP8V1PJhDGvCMgMGl9aiwoJKUdI1cUg/Ue8fevcVVPlUo0QZ8fZ1cJI0XT1iq
X-Received: by 2002:ae9:ec14:: with SMTP id h20mr59440595qkg.254.1560253964478;
        Tue, 11 Jun 2019 04:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560253964; cv=none;
        d=google.com; s=arc-20160816;
        b=xuFnk2oUNXZF1AINv65XzfXBFi/bXvC7mQHWfLthmYkpS5AYq4qFR+OA7pxP2m364+
         Za4/qx3jhBhdmZUNKA0vmyRGyt9IsObq05K7LJo109GE53sBVMdKm9i9O5jkgtwp5MQM
         RFmmd1qPY5fnnzRcRDDIwkZSzoEKSbwpSZu8EPySS5dnPAlEq9G89x4zw+9WZD+PUvXa
         L9sZQ5yETAysewrO1oL/Vo2AJvA979BShiAIrwEENs7cF1gSDXWbN7diZuMaYjx0r4LH
         EPpVlluj1KoKgb5nzbncsIuVFKYKHDKayIzjTPvNSobd64pl4xYtbqy6yIQyf8IrksPJ
         UVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1Cb4GG/N0hQlMvIMpbgSnw6lrsX++V30qcwL0TcatYU=;
        b=woCZQEtcj/4S6/4PEss1dsGboOgXqq+OedeyQTTni5BYUAdWnMKZUc9TdZ3chuGJss
         yTFzMFw3qnZIZlVDomlK9WDM2/SyP27qkwBwP9hi5x4CB7iFXGpMUPzKE435DRoxYN90
         Ec4E2khlY730vD2okETf1ovehKLIoC5QUTm2ONq+mUu75slCTIf0J9MtM3loq1WIb/fa
         27dCzOFPZmbBaSx/edVByEdZny3aJ0XR3Cmku/bFSAdKzSoTqbmhD46CuZmlbXqM/rOA
         QysT7sGZzeUo4FMbicTyavO0OWU1typl3MbM5d1xwwZd06zEJoHLQaDQ/YYPHUWZA+H3
         mY6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MjuxaPYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d188si220521qkf.189.2019.06.11.04.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MjuxaPYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hafKV-0000vF-Rn
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQT-0007iI-3g
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007sf-LE
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:49 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50495)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007i8-83
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wm1-x342.google.com with SMTP id c66so2436934wmf.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Cb4GG/N0hQlMvIMpbgSnw6lrsX++V30qcwL0TcatYU=;
 b=MjuxaPYw8gZ0fEudszZMotW98mjs6hyxWmS/Wv4nepPT77OE3T3LfZoT5BOkfimoSQ
 82psXIrCmPcZdzBQGvJLCQrA7XGiuiaOGzh73QEUmRYEG083Y5OnhbEm2vRUOhLPcNKl
 uNWBmQuXAF+NEs7d7fOD8z0mm8JFiNNaWTdw7cDMQWfOvnUsg80bjsJqzW3sFh1zPud/
 ihZ0TcueJTGCxUulY6dBJdSii+2PEAWm4ny/mCzMjxu3IXyuz+oBBocp8k4KkemmULdm
 /loozQfDy/Sm9Pcd4CNeXRMMs3GWGVOOK23tEf+SeNTMkv8DliuMZ8EtARds7UDhVP3x
 +RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Cb4GG/N0hQlMvIMpbgSnw6lrsX++V30qcwL0TcatYU=;
 b=rKOikC4QR2BoG5gS6ZoTUZIyjD4nVTSq1R22rBC736jrfAxwTNecNBDvTnkHgGv0p9
 +DxghD1qCX4Y51CJ0OXW6R9U3zaDvUNX3GkXyYXcZI0XLhh+pMbwkS1/SGjPrk2lpbaC
 CaORy8Z7z1hQRK2IRKsr7jL4CFAjQ0cRIsmShofFNVSpD7uA0zhSWEy0KRTioddBUK5W
 Xt/xS9I/+8BzU+oW2mOXvk6guNE4Z/tUnQtRuKgA1CzzkF9rfSV/hLd40cdNW/zu73HH
 7Xolb6WZhLELf3niiag45bZFiBscs6opmjMOWZ2IixusigFnrdD4PtZZ3LvO4jcXPI78
 DQaA==
X-Gm-Message-State: APjAAAUWhSf7hdb+MSyIzIZ5KYmrg1jnoxCLNlXeBhYuca5yZ9F4TNiE
 2N6exgyCf18pEnTHbdrJHtdE8eOv7hpWhA==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr16505061wmd.139.1560250469238; 
 Tue, 11 Jun 2019 03:54:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:42 +0100
Message-Id: <20190611105351.9871-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 33/42] target/arm: Convert VFP comparison
 insns to decodetree
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
X-TUID: SoOl4oTz9JgI

Convert the VFP comparison instructions to decodetree.

Note that comparison instructions should not honour the VFP
short-vector length and stride information: they are scalar-only
operations.  This applies to all the 2-operand instructions except
for VMOV, VABS, VNEG and VSQRT.  (In the old decoder this is
implemented via the "if (op == 15 && rn > 3) { veclen = 0; }" check.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 75 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 51 +----------------------
 target/arm/vfp.decode          |  5 +++
 3 files changed, 81 insertions(+), 50 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a7e4ae31985..ebde86210a6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1938,3 +1938,78 @@ static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
 {
     return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
 }
+
+static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
+{
+    TCGv_i32 vd, vm;
+
+    /* Vm/M bits must be zero for the Z variant */
+    if (a->z && a->vm != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i32();
+    vm = tcg_temp_new_i32();
+
+    neon_load_reg32(vd, a->vd);
+    if (a->z) {
+        tcg_gen_movi_i32(vm, 0);
+    } else {
+        neon_load_reg32(vm, a->vm);
+    }
+
+    if (a->e) {
+        gen_helper_vfp_cmpes(vd, vm, cpu_env);
+    } else {
+        gen_helper_vfp_cmps(vd, vm, cpu_env);
+    }
+
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i32(vm);
+
+    return true;
+}
+
+static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
+{
+    TCGv_i64 vd, vm;
+
+    /* Vm/M bits must be zero for the Z variant */
+    if (a->z && a->vm != 0) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i64();
+    vm = tcg_temp_new_i64();
+
+    neon_load_reg64(vd, a->vd);
+    if (a->z) {
+        tcg_gen_movi_i64(vm, 0);
+    } else {
+        neon_load_reg64(vm, a->vm);
+    }
+
+    if (a->e) {
+        gen_helper_vfp_cmped(vd, vm, cpu_env);
+    } else {
+        gen_helper_vfp_cmpd(vd, vm, cpu_env);
+    }
+
+    tcg_temp_free_i64(vd);
+    tcg_temp_free_i64(vm);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ad723466b18..761e8347fa0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1390,30 +1390,6 @@ static inline void gen_vfp_neg(int dp)
         gen_helper_vfp_negs(cpu_F0s, cpu_F0s);
 }
 
-static inline void gen_vfp_cmp(int dp)
-{
-    if (dp)
-        gen_helper_vfp_cmpd(cpu_F0d, cpu_F1d, cpu_env);
-    else
-        gen_helper_vfp_cmps(cpu_F0s, cpu_F1s, cpu_env);
-}
-
-static inline void gen_vfp_cmpe(int dp)
-{
-    if (dp)
-        gen_helper_vfp_cmped(cpu_F0d, cpu_F1d, cpu_env);
-    else
-        gen_helper_vfp_cmpes(cpu_F0s, cpu_F1s, cpu_env);
-}
-
-static inline void gen_vfp_F1_ld0(int dp)
-{
-    if (dp)
-        tcg_gen_movi_i64(cpu_F1d, 0);
-    else
-        tcg_gen_movi_i32(cpu_F1s, 0);
-}
-
 #define VFP_GEN_ITOF(name) \
 static inline void gen_vfp_##name(int dp, int neon) \
 { \
@@ -3091,6 +3067,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             case 15:
                 switch (rn) {
                 case 0 ... 3:
+                case 8 ... 11:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3135,11 +3112,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     rd_is_dp = false;
                     break;
 
-                case 0x08: case 0x0a: /* vcmp, vcmpz */
-                case 0x09: case 0x0b: /* vcmpe, vcmpez */
-                    no_output = true;
-                    break;
-
                 case 0x0c: /* vrintr */
                 case 0x0d: /* vrintz */
                 case 0x0e: /* vrintx */
@@ -3240,14 +3212,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             /* Load the initial operands.  */
             if (op == 15) {
                 switch (rn) {
-                case 0x08: case 0x09: /* Compare */
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_mov_F1_vreg(dp, rm);
-                    break;
-                case 0x0a: case 0x0b: /* Compare with zero */
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_F1_ld0(dp);
-                    break;
                 case 0x14: /* vcvt fp <-> fixed */
                 case 0x15:
                 case 0x16:
@@ -3357,19 +3321,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                         gen_vfp_msr(tmp);
                         break;
                     }
-                    case 8: /* cmp */
-                        gen_vfp_cmp(dp);
-                        break;
-                    case 9: /* cmpe */
-                        gen_vfp_cmpe(dp);
-                        break;
-                    case 10: /* cmpz */
-                        gen_vfp_cmp(dp);
-                        break;
-                    case 11: /* cmpez */
-                        gen_vfp_F1_ld0(dp);
-                        gen_vfp_cmpe(dp);
-                        break;
                     case 12: /* vrintr */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(0);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index b72ab8b8067..9db7aa7021a 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -176,3 +176,8 @@ VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 .... \
              vd=%vd_sp vm=%vm_sp
 VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VCMP_sp      ---- 1110 1.11 010 z:1 .... 1010 e:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCMP_dp      ---- 1110 1.11 010 z:1 .... 1011 e:1 1.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

