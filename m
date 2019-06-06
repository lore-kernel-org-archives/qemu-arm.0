Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4770503wrg;
        Thu, 6 Jun 2019 11:09:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+KWQHdQ6722ie2zS9nzXv+wWaPeknCFtz0uyaqJQDeBzkUvO90UYiNWVFWhJM3xn1pQw+
X-Received: by 2002:a05:620a:624:: with SMTP id 4mr40314217qkv.15.1559844581713;
        Thu, 06 Jun 2019 11:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844581; cv=none;
        d=google.com; s=arc-20160816;
        b=n14uQnxTY6EPXvNYKaiTaQBZ1TF/9zpPhl6sLL1gZLeYj8Lb2fTeNPRGMkpAFAvN2E
         JKoAUmbf8m42MZh6YsHXpiD04mhN2hrZo5uGUVQ3XxfXxTK22ZrF0w+Vi0EAExOP+iWl
         q76JVr+adxHsxj8ghmoXlbeFLkvGOlpLWId7uURGAvNR3mC3SdPtS2zJpkotH1cmNhLX
         t6GVTzzUAEH7E1GdwX5bK/uqXKkcZuctY/WyqlAJHQqxbWWRclebFmzbrjhD772Fjkqm
         mzt9LVJNYN3uPq0XalIrtWmLxZoWFtYKH0QeH9MO+yrbvMTVRaDOCaM94w0eMh5sWHEl
         Wg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Nhyme5lhykh5XVXz5eoRB8o/u66NAipPBCokmUZB+qw=;
        b=qL57h3e28qO8EbELQx7GiPnYKaN3ic6qGMIMc7dvQnEAWCeduUrquTsZ+2twX1deeE
         6iNj0bf7A2UWzvUjm2JzRsM8MXK0vqwfn0ud0+OCOacLBKnC/EdyKW0Tu2N0/R0BJWvb
         csm4hfIJWdAkJLCZTeKNv+i/IlQMTu7ZHYRLpGyYlGv56kUvSj1r8uLfHtQXKw1Aej0t
         QX3Jil23ZJ/Tdmk0xWeTxepmm/PR2rQXwWVN5NoEb8+2r2sjyYiLBH/b5tbuDGd1VpYM
         yVUEATrOt9G+ARCe4OrIEPAhHVI4Z+qWD7/lHbSwVgIMfxdgQLAFCLNhWZtiReJ1k0V0
         DNmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FVkdeOsg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si2420137qtd.251.2019.06.06.11.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FVkdeOsg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwpZ-0001aW-3a
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:09:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwUD-0004dJ-H5
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU7-0004Do-Vw
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwU7-0003Hx-Ht
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:31 -0400
Received: by mail-wr1-x441.google.com with SMTP id d18so3338360wrs.5
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Nhyme5lhykh5XVXz5eoRB8o/u66NAipPBCokmUZB+qw=;
	b=FVkdeOsgjI6pu6E83Ue8VNDuvwldZ7TXUaWm/20n1q7nQE2Db478VLZM3u8AdyTYTa
	sdmlb6AM0NV/Kon6yiTLu2rQuweW5a65d0vT3wkEurPm7UCsza7HEJsGhFb7f/ZR0d5u
	P6XkBvKMhdUWV87mFY5RxzvhfrvrMV2mQiBXzqxcK9DiaWK2u5UBDNbvCRy0GLaNH8LP
	Q3ggseLdoggALLa84NcZfHvIgupb/4kJhsLa9jNKN9mNbXNwFyzLmwBSeTufNN5w5iEG
	/M2uX7ZzCr+fRriT82h/HoN4rjwVCgTbnfDQNww8JIQwIRklu9hXGI0nZ5WaJN1mA+7i
	uX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nhyme5lhykh5XVXz5eoRB8o/u66NAipPBCokmUZB+qw=;
	b=aGTngtsQBSRYu1tMXgrd/h+AOWNRb127DaWKc7Y2Ww3JTFcTRY0+haHwlt10hDAfZL
	I+YPJa4K9Qy0hd73jQlOcj+NX0X583GXPCgIwQYt3Rdyf0I+HHiO2f/umsjW+6bFQN9f
	AZ3KIYwChqU9I30MoGdYuppVxs3iGTncKRmKyD9PDFMjJ3UrZGv3u3ESTFkZCuuKWnSY
	URzWclWTArNxvSIdiWh5OkgYNbWu0NzEFRdOZj+SJAzurI+Jf0BcP29Hh+KmNLkVebP3
	4f5TO+Bugvuz61KdfanUDyxEAJXTGgxjvBKYKCnhK5Kux3xQu4xLZmvwXUD2vdiNf8re
	CydQ==
X-Gm-Message-State: APjAAAVOSYXDU7LmD5YuZZF58LTrbK1gblWDdZoN76gsMz6upt9ZJvEX
	SdAkRM60rf+5iIiPltOYrgTPEiVko6UkUA==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr2087317wro.262.1559843209136; 
	Thu, 06 Jun 2019 10:46:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:46:01 +0100
Message-Id: <20190606174609.20487-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 34/42] target/arm: Convert the VCVT-from-f16
 insns to decodetree
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
X-TUID: dq9Hdu0h4gMf

Convert the VCVTT, VCVTB instructions that deal with conversion
from half-precision floats to f32 or 64 to decodetree.

Since we're no longer constrained to the old decoder's style
using cpu_F0s and cpu_F0d we can perform a direct 16 bit
load of the right half of the input single-precision register
rather than loading the full 32 bits and then doing a
separate shift or sign-extension.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 82 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 56 +----------------------
 target/arm/vfp.decode          |  6 +++
 3 files changed, 89 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 872b01621cc..3ad93cc48f4 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -30,6 +30,26 @@
 #include "decode-vfp.inc.c"
 #include "decode-vfp-uncond.inc.c"
 
+/*
+ * Return the offset of a 16-bit half of the specified VFP single-precision
+ * register. If top is true, returns the top 16 bits; otherwise the bottom
+ * 16 bits.
+ */
+static inline long vfp_f16_offset(unsigned reg, bool top)
+{
+    long offs = vfp_reg_offset(false, reg);
+#ifdef HOST_WORDS_BIGENDIAN
+    if (!top) {
+        offs += 2;
+    }
+#else
+    if (top) {
+        offs += 2;
+    }
+#endif
+    return offs;
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -2005,3 +2025,65 @@ static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
     }
     return true;
 }
+
+static bool trans_VCVT_f32_f16(DisasContext *s, arg_VCVT_f32_f16 *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 ahp_mode;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_fp16_spconv, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(false);
+    ahp_mode = get_ahp_flag();
+    tmp = tcg_temp_new_i32();
+    /* The T bit tells us if we want the low or high 16 bits of Vm */
+    tcg_gen_ld16u_i32(tmp, cpu_env, vfp_f16_offset(a->vm, a->t));
+    gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp_mode);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_i32(ahp_mode);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
+static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 ahp_mode;
+    TCGv_i32 tmp;
+    TCGv_i64 vd;
+
+    if (!dc_isar_feature(aa32_fp16_dpconv, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd  & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(false);
+    ahp_mode = get_ahp_flag();
+    tmp = tcg_temp_new_i32();
+    /* The T bit tells us if we want the low or high 16 bits of Vm */
+    tcg_gen_ld16u_i32(tmp, cpu_env, vfp_f16_offset(a->vm, a->t));
+    vd = tcg_temp_new_i64();
+    gen_helper_vfp_fcvt_f16_to_f64(vd, tmp, fpst, ahp_mode);
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i32(ahp_mode);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_i64(vd);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 26994e0d427..65e69873654 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3066,7 +3066,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 3:
+                case 0 ... 5:
                 case 8 ... 11:
                     /* Already handled by decodetree */
                     return 1;
@@ -3080,24 +3080,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x04: /* vcvtb.f64.f16, vcvtb.f32.f16 */
-                case 0x05: /* vcvtt.f64.f16, vcvtt.f32.f16 */
-                    /*
-                     * VCVTB, VCVTT: only present with the halfprec extension
-                     * UNPREDICTABLE if bit 8 is set prior to ARMv8
-                     * (we choose to UNDEF)
-                     */
-                    if (dp) {
-                        if (!dc_isar_feature(aa32_fp16_dpconv, s)) {
-                            return 1;
-                        }
-                    } else {
-                        if (!dc_isar_feature(aa32_fp16_spconv, s)) {
-                            return 1;
-                        }
-                    }
-                    rm_is_dp = false;
-                    break;
                 case 0x06: /* vcvtb.f16.f32, vcvtb.f16.f64 */
                 case 0x07: /* vcvtt.f16.f32, vcvtt.f16.f64 */
                     if (dp) {
@@ -3239,42 +3221,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 4: /* vcvtb.f32.f16, vcvtb.f64.f16 */
-                    {
-                        TCGv_ptr fpst = get_fpstatus_ptr(false);
-                        TCGv_i32 ahp_mode = get_ahp_flag();
-                        tmp = gen_vfp_mrs();
-                        tcg_gen_ext16u_i32(tmp, tmp);
-                        if (dp) {
-                            gen_helper_vfp_fcvt_f16_to_f64(cpu_F0d, tmp,
-                                                           fpst, ahp_mode);
-                        } else {
-                            gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp,
-                                                           fpst, ahp_mode);
-                        }
-                        tcg_temp_free_i32(ahp_mode);
-                        tcg_temp_free_ptr(fpst);
-                        tcg_temp_free_i32(tmp);
-                        break;
-                    }
-                    case 5: /* vcvtt.f32.f16, vcvtt.f64.f16 */
-                    {
-                        TCGv_ptr fpst = get_fpstatus_ptr(false);
-                        TCGv_i32 ahp = get_ahp_flag();
-                        tmp = gen_vfp_mrs();
-                        tcg_gen_shri_i32(tmp, tmp, 16);
-                        if (dp) {
-                            gen_helper_vfp_fcvt_f16_to_f64(cpu_F0d, tmp,
-                                                           fpst, ahp);
-                        } else {
-                            gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp,
-                                                           fpst, ahp);
-                        }
-                        tcg_temp_free_i32(tmp);
-                        tcg_temp_free_i32(ahp);
-                        tcg_temp_free_ptr(fpst);
-                        break;
-                    }
                     case 6: /* vcvtb.f16.f32, vcvtb.f16.f64 */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(false);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9db7aa7021a..53d9544f7cd 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -181,3 +181,9 @@ VCMP_sp      ---- 1110 1.11 010 z:1 .... 1010 e:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCMP_dp      ---- 1110 1.11 010 z:1 .... 1011 e:1 1.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+# VCVTT and VCVTB from f16: Vd format depends on size bit; Vm is always vm_sp
+VCVT_f32_f16 ---- 1110 1.11 0010 .... 1010 t:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCVT_f64_f16 ---- 1110 1.11 0010 .... 1011 t:1 1.0 .... \
+             vd=%vd_dp vm=%vm_sp
-- 
2.20.1

