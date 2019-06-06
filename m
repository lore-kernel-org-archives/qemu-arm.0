Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4754212wrg;
        Thu, 6 Jun 2019 10:54:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEphUBakeZVBI+/cU2s+Ni60dOgtVHhvJJaEmjJwZeC/+SJ+JqGaTPLgNd4eKtJMlnKm6I
X-Received: by 2002:ac8:17f7:: with SMTP id r52mr42565361qtk.235.1559843641346;
        Thu, 06 Jun 2019 10:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843641; cv=none;
        d=google.com; s=arc-20160816;
        b=W8kXgUfxxAyeDGay+JRC8VCWFoGRj/xcEZRleQ9ordapIAYfguhujJkkjkR4XZNyYg
         9KLmR1/9mEvGxm0wRaJrpJz34ZHgcSeFPmMd+MQz1Enugp1IRHQGJFQ3zFjnXe4KORng
         sF1Usm9Hk88XNHvO3uh/dnqhI4eBn8w532eyrikdDp70au9ld6Ey87XjSi7O8ShfUvKq
         E/c7AaA+6meAEqUGASqocju5bo2tmo6z6DfQ8lHND/Rq1wR9OLkqxO6PlW+MHSQvdIz5
         TJ14sUNKV9hKiozUcdHajE68zkOSN5Yh91uvIRDtgjF4Mpg6lGGwhG9VT+4JkY4vQwbU
         uKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NQ8T/GOkVDAd68jEmVhy7qJ1i07QRbWGhEaUw7D8jjQ=;
        b=JuFz7/LHIID1ANYrcu7m4LJmF4+X2crTc9Bksr35mBtXxxiFtnkvpnv7XVP18Lwf0+
         Ygho2E8DVFXO79/nZxkICxx5gtrny+lcehupbG/dgur9uQsGJFOSKs2SkPk8qFgwsaKw
         4WKka9h32i0TZFBPi3v2astgkW57lbhDB3kFaVPn1dWjXoFKiwGxd8IVdpMOb4SF7yf4
         AJLykVigmszK7p1ba2/Z3C18sFtjV/sViC2k8QnA9JReQGWGlHhu+48bDTHNM8PWWsY/
         PdCHrquOgBRmw3uo1SHfOxdeE2HIzognBAB6E1PVmAMUQ2LB6RuSl9R+2eO9UImbvLtE
         73yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ek0asgyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si2151176qth.257.2019.06.06.10.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ek0asgyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwaO-00026K-PG
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:54:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU3-0004Of-0L
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTz-0003xK-PR
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:26 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37177)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTy-0003Cu-I6
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:23 -0400
Received: by mail-wr1-x443.google.com with SMTP id v14so3346695wrr.4
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NQ8T/GOkVDAd68jEmVhy7qJ1i07QRbWGhEaUw7D8jjQ=;
	b=Ek0asgyYBkmZOcrh2J2MHcZPuNQUWh5or+5sfjPhN/67nwsyI3jLeOTEz+vc6U820y
	3sp/UKuInPlOhbik4X5ywBIs4HQ291X0pzV99lfXUvBVv/moEBljZAQXtbS6wdop+kyw
	W5L0LfxIMpZzYsyqW2PLRu9LpIN5BdhlTnoyu/bZZMLwgpsC0GGg8flPagGwnQuwcuIf
	70h0wO+JjnHaLP8mqaz8lx4Knd5yhuYEn6DKYjxHW8Fx5pNaNFAz9HvQG3QtvBg57vzo
	UOFOzxbq6wduAAdKZjME/p3w8+NRWrWlPImgoY/Vk3JK6rPoGqP9qpgoZJHeH8/C47sw
	IqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NQ8T/GOkVDAd68jEmVhy7qJ1i07QRbWGhEaUw7D8jjQ=;
	b=awOXzAI5AWhnDZUqc7A7+3jrDE0x0WHdY3tCOPN7/0iIs3PRwwfVtDdI00k4vOa3LE
	uYTg7lKrufrMvC306G7fvGxAgXifr1CXK7GhNUYou7ZylvIbOBj/YgnnbQpZU7ZgTzTK
	6yGzzkVd90Zd7CSYxqnuqxdvuF2/nEWDDvzbusP4pC1ObUv4xWxXdAMHghXYsyVH6qF3
	Uu26bsttyMYaJnGYCoRv1v4ihocZkGhUgIzeW/9a+5NNUniMMXmZyH4OzhdRA++Jf8vd
	R25fYE78uPj/bzcq0pYZWE4Mev1nLwU0f6rdWTuTAqjwfbYlct58v5nS6nM0gd3pMto6
	mzwA==
X-Gm-Message-State: APjAAAWKHzAVLs0DOCrKs/jj26G66cxPIvgOqO9UsQ6gVI3l3VoMID+0
	1YAAiJln5Agu6Kv0aa1S3YjD7bxI7fKojw==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr17204790wre.294.1559843202395; 
	Thu, 06 Jun 2019 10:46:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:55 +0100
Message-Id: <20190606174609.20487-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MkWIAkTRHREb

Convert the VFP VMOV (immediate) instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index e8785fd26e6..38ec026d865 100644
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

