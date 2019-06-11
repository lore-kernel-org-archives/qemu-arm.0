Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4225058wrg;
        Tue, 11 Jun 2019 04:21:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDLps31Bu0YXJF6TDRkCbzE3I7q+QuBYxLfnb7Vn2VbU+qRwDRVATPcJxjDKqJ3AkFlgZf
X-Received: by 2002:ac8:525a:: with SMTP id y26mr64340239qtn.297.1560252117000;
        Tue, 11 Jun 2019 04:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252116; cv=none;
        d=google.com; s=arc-20160816;
        b=YS6xIM6XsYr9dsaOu4eonwCZ5NXvf2q/J7Em93grVTc0QjWRESk5lK+RmcV8Zqhndk
         8wYUBAAlMldaHk1vOryDlGuzgcsiyN8RldnWKSg7gVK5uV92w8Xw7PqXpNUvPrkYyklk
         X6cf9YAxZles+ngWFmyAZji3JBJNV49vS1KULEhYE/VpwYFXv3gORFTH7DYJ7vrh9HSg
         YwdlMYMSzN5MiLzmoqIe6CKbX07SBNprNPxyO6FgV7hDdJ+Eh3QIL1IGchxi+g0rrJHV
         UhWTVmrBR5E9wqHG/hFcY3T2Bxuo4nnusF66EjLWX1f2JG5VABSV9QtETaGbyhKNy9xg
         yfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=78Ipc5UK7B7ARzS4SX5cy/iMal0ICqCZUARVRbwaHD8=;
        b=GR6346FLDY4z8W8idC9HvTDR3ItsQ5zxlphSsxqJHLvaoczl2k5eWiDs3CkxlhSApN
         3MErt66tBsAvB4QB1HjXwpqXrsP0SPSNercdGeisyNr+w8GVi9ae7hYX0s31W9LJotKi
         1gVhGTtpC1jrLRLN4JUfegWLOHm4OMYbEoVc3ou/c4B8ixvbNErvuhIFQiS2EdHPd/px
         wIuVe+R0+GbIYKfyk8IW4/6Q7kLGqy8E2xvLMUh9vjXVKkvPsR8cW49monCO5uRlgd5c
         I1vR/1L7P8kr8ZbzH32oKoUHFR8XHb9JVja2WxzI6n7+3V8HzsWk9l58Bb8q+t3YnoYK
         q5Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d41y8Qw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c45si2915181qta.244.2019.06.11.04.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d41y8Qw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeqg-0005g6-Uv
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQQ-0007e2-HT
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007sE-FX
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:46 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007ka-1I
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wm1-x342.google.com with SMTP id s3so2440098wms.2
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78Ipc5UK7B7ARzS4SX5cy/iMal0ICqCZUARVRbwaHD8=;
 b=d41y8Qw7hXXr/ASEX4OaDToKboEiRHtpCeLUCaSP+oMX42nz+xtM1E0uzxzgBvp/jq
 FaBYGiF4i8G2D69O7Jydys+BdELmnYRW1LNvhg8rAtp+iK1ZRq7jg3FpygulKqnEgtjI
 EzFHRj9eQqG6EXY3vXrNnLD69nzMKur4LkCHGV3NJpdS+R2nuEd1REANKtwjPOMMNLv+
 CQfTaYBdCuNuCGnXmNLUMUl+FpUr+nDWxvt1w664ZsH9AHdCMEQ2bq6HhH9VFQfM92t7
 qoHxTFaZPNIlYk3CXvL/JqE1WBoL3v3Mo8czOMIbdJPQtAWDgLtA5Fw2KxrJtWO0Znk9
 9TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78Ipc5UK7B7ARzS4SX5cy/iMal0ICqCZUARVRbwaHD8=;
 b=ODCIGL4wsuQqigS9e7BV9BJqVlppeh7gapi6oSsy8ETcIR5H4Xeozu3bpzju60It/D
 PIkasabplBYzJ0CbF7HwOVwQz6WvSesIrKIo5cQ9MG/1Cn0RiJVSFPhrJRj7ZBLnMx74
 9YVf7I+SjNP+yafAYu35dhhcw8iz+JIPCuyciHpG4ToLkw9+/7E8h95MH7e5HK1xYLZP
 toX8WNEiq2kEXIkwoVLJP0pf1vuNJQ3Cqhghi9mt9gaaiXHJp884hAxlxASW2u/gsOav
 7OMHntJ9z4dYB2nyUwoBuV+vdJZ47MdocJl5iO422Hp7wDb5Huq6OLgkNB6ZBWseF3tk
 szVA==
X-Gm-Message-State: APjAAAXpBKdG3M2k4r+cQThpwMLWOoLtVrbR/rdbijGVGxYRJQNfo1Nm
 zKNpuKuIBI12LwImAIQYH5FdZk/9xLHTzw==
X-Received: by 2002:a1c:b684:: with SMTP id
 g126mr17092577wmf.176.1560250473428; 
 Tue, 11 Jun 2019 03:54:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:46 +0100
Message-Id: <20190611105351.9871-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 37/42] target/arm: Convert double-single
 precision conversion insns to decodetree
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
X-TUID: bszgGstptP7z

Convert the VCVT double/single precision conversion insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 48 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 13 +--------
 target/arm/vfp.decode          |  6 +++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index e94a8f2f0c5..c50093776b6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2320,3 +2320,51 @@ static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
     tcg_temp_free_i64(tmp);
     return true;
 }
+
+static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
+{
+    TCGv_i64 vd;
+    TCGv_i32 vm;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    vd = tcg_temp_new_i64();
+    neon_load_reg32(vm, a->vm);
+    gen_helper_vfp_fcvtds(vd, vm, cpu_env);
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i64(vd);
+    return true;
+}
+
+static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
+{
+    TCGv_i64 vm;
+    TCGv_i32 vd;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i32();
+    vm = tcg_temp_new_i64();
+    neon_load_reg64(vm, a->vm);
+    gen_helper_vfp_fcvtsd(vd, vm, cpu_env);
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i64(vm);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 412d8aaedb2..05ee76da77c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 14:
+                case 0 ... 15:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3063,10 +3063,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x0f: /* vcvt double<->single */
-                    rd_is_dp = !dp;
-                    break;
-
                 case 0x10: /* vcvt.fxx.u32 */
                 case 0x11: /* vcvt.fxx.s32 */
                     rm_is_dp = false;
@@ -3185,13 +3181,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 15: /* single<->double conversion */
-                        if (dp) {
-                            gen_helper_vfp_fcvtsd(cpu_F0s, cpu_F0d, cpu_env);
-                        } else {
-                            gen_helper_vfp_fcvtds(cpu_F0d, cpu_F0s, cpu_env);
-                        }
-                        break;
                     case 16: /* fuito */
                         gen_vfp_uito(dp, 0);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9942d2ae7ad..56b8b4e6046 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -208,3 +208,9 @@ VRINTX_sp    ---- 1110 1.11 0111 .... 1010 01.0 .... \
              vd=%vd_sp vm=%vm_sp
 VRINTX_dp    ---- 1110 1.11 0111 .... 1011 01.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+# VCVT between single and double: Vm precision depends on size; Vd is its reverse
+VCVT_sp      ---- 1110 1.11 0111 .... 1010 11.0 .... \
+             vd=%vd_dp vm=%vm_sp
+VCVT_dp      ---- 1110 1.11 0111 .... 1011 11.0 .... \
+             vd=%vd_sp vm=%vm_dp
-- 
2.20.1

