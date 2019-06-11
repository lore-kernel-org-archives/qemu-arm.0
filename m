Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4235642wrg;
        Tue, 11 Jun 2019 04:33:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzI43pH0gMsGw7Vi5USn4LuyY71KSxV9D7AR7TJsDz568m9ThYEcntZxJ8Abh6ank/mg6I2
X-Received: by 2002:a37:72c5:: with SMTP id n188mr8935170qkc.181.1560252836766;
        Tue, 11 Jun 2019 04:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252836; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvLhDRz2VNxEy4MKw+b3uMLDlBsz9r/vPer7zzzWsfqy7DUHaG6we5WmT8U81ycywq
         XXQwknlPW35zZlptsqOKO4AmUmGHDiQ1FTdOuhiOFw4ehabcS3apwghjE2UoDv5r26gM
         LFjtRiKCpNVy492FltUqVDBlRd7Sia4RaG4op+q0twjTL1qAsJyDPvrREu/P7tjcE9wo
         K5XEmTFqcf6JWSyJBc7x9KUwqkjwKQhhnOKLyXR3KdM4PEpK3j3qKJ8if1HS/g7seito
         G6HCyBfbpVNExgfVPSE6t2TEgvuxddy3CKvy+AQ/YUXcDbg63sh51dRM96nwvdAZY3jK
         bEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZPtpQbYnqnO0AW8FSKJH17NNbI92/M4av0fUdFiBpKI=;
        b=DqsSishPc4XtpEkmdRSjrO8uy0ff4XxUw4Wgi5RJwrcuPPwAtKBd86AGKh2lOhC3t7
         7yQhzGjJrFc8lRH16kqOSz7lWDX80hb4+LJcmN9K0+Kw397De0zpDZd/Iud+lJFoIN+z
         9x+K76HPkoZaGDtuNFY74yrTG2SEFkeva3kO4/Wv+Er528EjcpfeMWqYYIjmPR0QHTmT
         sa1wcM75arHHpKj5XvLKoBdbPUoHgpcs5MnTuj6//cQUk2ei8O5PF3QEx///oUMLh3IH
         fHUDwlKhbCVyZPCQYK2df4ETFAxlzgaOyLxLVBYTrh0sZ/KtZZ5D3KLvH5ml/EE1Ksye
         BesA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dHxEYC3x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si870031qth.392.2019.06.11.04.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dHxEYC3x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haf2K-0007XP-A1
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39609)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQO-0007an-Vw
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007rZ-8A
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:44 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007eA-Np
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id g135so2422159wme.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPtpQbYnqnO0AW8FSKJH17NNbI92/M4av0fUdFiBpKI=;
 b=dHxEYC3xnSNYr11Jb+v3P/HvFLW2rFNu15ZaYeNmNj8SCocTPqqU/T3Gsm6p5etvG4
 6ksqERbqdKKbo6yrfSt1fs2zTZIf9P5eKoJIsT0MrIF2svaiWzWizWYu6KSjWO495CrZ
 7oR6o4zjgxYwoR8JjN415c6A6UJzE7rIBj/htElzjJbUmvIpjibajL5uxTea/6BcxVWy
 klBzO6vtOKUgIhCtBeOXaidc0jRgUN4ymwL5fvMpblILwi0SSgAlMzwoW4ENaatcNgUc
 tk2m+tI/AZwiczGzUy18n3bvbLX+klLAaA2ZJd49BglDabpo3P7JgNiQr+fe9bQpadOr
 P85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPtpQbYnqnO0AW8FSKJH17NNbI92/M4av0fUdFiBpKI=;
 b=Jf8SiG0nc4drcxJSFJVk3m4bNaYvldneIfUaYlErzSdDbtuk+g7kzLIvOLzEEZdrAs
 Es7bvUPnwNBVB3oGw1il3KpMnCQv2DwcvFbqcuBKsVQF9Tl+Pv8QKLE+32+yyECnq2W7
 micFAeh0/JRdWK2ML4vsRus1Um4oeLh0zpM09RmjkIXSM/8D3/rOutdVJQJ34FgCOo+t
 JmJu5tYjZMcEc4Zg6FJTfgOUwVa3ZxpXXcv1FFzWubRr9yO2kYLx+Zd37tNzlrI7dAip
 1IeD6KGSkZxB4mwKoWuiyQTRVy14cfCnbgCMTc+2pf7GQva843q6yt+V9kcVEWm9+2vd
 emGg==
X-Gm-Message-State: APjAAAWpi1VeKIP+YJEwknP9SYtcqFJ6hxdP1ffXzUExs0UfFHiq6I4E
 qV8ea/nYutNDUlpbpsQPkejPIw==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr17046256wmc.1.1560250464070;
 Tue, 11 Jun 2019 03:54:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:37 +0100
Message-Id: <20190611105351.9871-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v2 28/42] target/arm: Convert VMOV (imm) to
 decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ACfdNSLlkE3

Convert the VFP VMOV (immediate) instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 129 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  27 +------
 target/arm/vfp.decode          |   5 ++
 3 files changed, 136 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index ba6506a378c..a2eeb6cb511 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1602,3 +1602,132 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_sp *a)
 
     return true;
 }
+
+static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
+{
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i32 fd;
+    uint32_t n, i, vd;
+
+    vd = a->vd;
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0x18;
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = s->vec_stride + 1;
+        }
+    }
+
+    n = (a->imm4h << 28) & 0x80000000;
+    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
+    if (i & 0x40) {
+        i |= 0x780;
+    } else {
+        i |= 0x800;
+    }
+    n |= i << 19;
+
+    fd = tcg_temp_new_i32();
+    tcg_gen_movi_i32(fd, n);
+
+    for (;;) {
+        neon_store_reg32(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+    }
+
+    tcg_temp_free_i32(fd);
+    return true;
+}
+
+static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
+{
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i64 fd;
+    uint32_t n, i, vd;
+
+    vd = a->vd;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (vd & 0x10)) {
+        return false;
+    }
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0xc;
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = (s->vec_stride >> 1) + 1;
+        }
+    }
+
+    n = (a->imm4h << 28) & 0x80000000;
+    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
+    if (i & 0x40) {
+        i |= 0x3f80;
+    } else {
+        i |= 0x4000;
+    }
+    n |= i << 16;
+
+    fd = tcg_temp_new_i64();
+    tcg_gen_movi_i64(fd, ((uint64_t)n) << 32);
+
+    for (;;) {
+        neon_store_reg64(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+    }
+
+    tcg_temp_free_i64(fd);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 150e9e64cc3..b0a12991131 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3033,7 +3033,7 @@ static void gen_neon_dup_high16(TCGv_i32 var)
  */
 static int disas_vfp_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, op, i, n, delta_d, delta_m, bank_mask;
+    uint32_t rd, rn, rm, op, delta_d, delta_m, bank_mask;
     int dp, veclen;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -3093,7 +3093,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 13:
+            case 0 ... 14:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3279,29 +3279,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 14: /* fconst */
-                    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
-                        return 1;
-                    }
-
-                    n = (insn << 12) & 0x80000000;
-                    i = ((insn >> 12) & 0x70) | (insn & 0xf);
-                    if (dp) {
-                        if (i & 0x40)
-                            i |= 0x3f80;
-                        else
-                            i |= 0x4000;
-                        n |= i << 16;
-                        tcg_gen_movi_i64(cpu_F0d, ((uint64_t)n) << 32);
-                    } else {
-                        if (i & 0x40)
-                            i |= 0x780;
-                        else
-                            i |= 0x800;
-                        n |= i << 19;
-                        tcg_gen_movi_i32(cpu_F0s, n);
-                    }
-                    break;
                 case 15: /* extension space */
                     switch (rn) {
                     case 0: /* cpy */
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 37eec0e1310..1818d4f71e1 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -151,3 +151,8 @@ VFM_sp       ---- 1110 1.10 .... .... 1010 . o2:1 . 0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=2
 VFM_dp       ---- 1110 1.10 .... .... 1011 . o2:1 . 0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=2
+
+VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
+             vd=%vd_sp
+VMOV_imm_dp  ---- 1110 1.11 imm4h:4 .... 1011 0000 imm4l:4 \
+             vd=%vd_dp
-- 
2.20.1

