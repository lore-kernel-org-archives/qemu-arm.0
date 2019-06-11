Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4248266wrg;
        Tue, 11 Jun 2019 04:47:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqzdUOK/ftTWRh/pl1EaYLPlEw+EhkAb1ukPHtKmVqAI3xmxT46SoBr7GowP7zSx/tZz70
X-Received: by 2002:a37:68d2:: with SMTP id d201mr60761619qkc.65.1560253624844;
        Tue, 11 Jun 2019 04:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560253624; cv=none;
        d=google.com; s=arc-20160816;
        b=URw/eXe4aPwSdsqThM14oMm2t44XHTIzoWlSh/U4+91PDxWhJTOlDtQTTVEx8Sp/Ny
         RPJQTjAUMvRSz9mSlPqpPsH8D/Ii9wsW98jHg4o8lo8vAuRVz8QgbT9BCcIcB2Nr5125
         hyWJTz2taWM+wA4zYL1zRzME+hJA1PLeu/f5tNWYGd31n1w8AcHWz/GNnMhOpBuxB8ZA
         Wh5SywOzvxDQddzpsW9+DlNBs0ZWfd+AGhdOBvlkj3VYVi1oNa7YIrZEQIyjgWFKf533
         8AIy42L5MEuJgTWQc8ZjFXOpR2ZOnoYr4QgRWY08FMPR7GrZWnGecotgqP9eyI8ReDbM
         P33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=N8BOuezDpp42OnyV20yZBqANiSyilNmhgxUgVqhZzZc=;
        b=dQAfgAtxxC6M32yltPwup0A62UmNpoIhZSmXq+RbPFrjkpYFcuOSG+u/K7o8V/O/m+
         k9sx8zy3pm1N16hMa7kjZ9T809y5cLJ/liASjPD366Z1tRYe9dDwlSEDQVSa7xX0OnXu
         joM0zlTu7Sy3GkZiamoYXXtzonVGnFTXGhohih6QlVNUeAVEPqNcFs3mftm23N2jbGpZ
         tRNKwhaOXWvXqXKolHpALRQ+RfbQofjtL7lzPqw4CcJduaEgSFn7aNErCXBHhWQelZ3P
         DI2o42+um8dslUusTMjpi/jJpoIMQ4W3ONDPHQtnikQ5AP1P0YDyxgRclbRb/p9Z9Jld
         nILg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xpIiy7rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u54si8550339qte.102.2019.06.11.04.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xpIiy7rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hafF2-0002QY-C7
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQS-0007gd-G3
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007sn-MG
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:48 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007fJ-6B
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wr1-x441.google.com with SMTP id d18so12481048wrs.5
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8BOuezDpp42OnyV20yZBqANiSyilNmhgxUgVqhZzZc=;
 b=xpIiy7rWyDUQhlNkVsTB0l81I2HfGBOEcc405QF6gh6QS1U2Xpg/3WLjD/Ye5qSXrG
 JztndLjMvNg1vpXTEnaQCLYZn48xGI4np0E94CeqrZCKx/oTpNDXADgjKGNRrF7/EGTc
 ogP0uLcIdybascNH3/6SB+p49LYepCQIcTMakRONpxH79gGLq7mVsieK3cce+rzkLnkU
 wqNcda9SZ35421zH5OTf44kWjK2aTkfWjWRUkIk9MihdHfJHcWiLEohBkl7E7RBO6q6Y
 g2qHj2VyLr8yOQG4b4g3wlg3WY/wCUEQxmqwVwdaGblyQM7jt+9d2Dr9mLY1s38i6J/7
 H9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8BOuezDpp42OnyV20yZBqANiSyilNmhgxUgVqhZzZc=;
 b=PwQgpAeaKqSMM8Sf0sENZ/fyXuB1tI5HZlFeJRkF+ecKVrLbU84E+wrYxVau3Ct7rN
 sUJXNDRSwK610Y6KsHJZEG0whhVkzGwFYRGoHPV+drM8iqJGaoUzwdZtTRL9mpZ8lx1x
 N2lZTFv2g6RNrnug2HIa/zOID+cl2zTJt5QRuVEdWk9PpMbXVp0HAPIH9bsWtZ06pDzL
 yoVcMyn9KbqSR54Zi3gyQ/TnxGxKE9zU53QtM//29PxoAGbC0V0KUfXQG+ZKBoe3nefN
 x2PXk8Y2gjIej2cesU8hYWhOOWtDF9bFazERkHyF45iODPBjBjATeQQknll02TtZvkPN
 MdTw==
X-Gm-Message-State: APjAAAX1iIVHWS0lMY8WBHRx4Rdotu7XoVUPkXxgJG7xjLGDIjcCV4EP
 abrJ8c13GmbnpEWdX6LDX2q64caMzAF8CA==
X-Received: by 2002:adf:dd89:: with SMTP id x9mr14089087wrl.7.1560250465386;
 Tue, 11 Jun 2019 03:54:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:38 +0100
Message-Id: <20190611105351.9871-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2 29/42] target/arm: Convert VABS to decodetree
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
X-TUID: SZ6K+RQrphva

Convert the VFP VABS instruction to decodetree.

Unlike the 3-op versions, we don't pass fpst to the VFPGen2OpSPFn or
VFPGen2OpDPFn because none of the operations which use this format
and support short vectors will need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 167 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  12 ++-
 target/arm/vfp.decode          |   5 +
 3 files changed, 180 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a2eeb6cb511..d0282f1f921 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1111,6 +1111,14 @@ typedef void VFPGen3OpSPFn(TCGv_i32 vd,
 typedef void VFPGen3OpDPFn(TCGv_i64 vd,
                            TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst);
 
+/*
+ * Types for callbacks for do_vfp_2op_sp() and do_vfp_2op_dp().
+ * The callback should emit code to write a value to vd (which
+ * should be written to only).
+ */
+typedef void VFPGen2OpSPFn(TCGv_i32 vd, TCGv_i32 vm);
+typedef void VFPGen2OpDPFn(TCGv_i64 vd, TCGv_i64 vm);
+
 /*
  * Perform a 3-operand VFP data processing instruction. fn is the
  * callback to do the actual operation; this function deals with the
@@ -1274,6 +1282,155 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
     return true;
 }
 
+static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
+{
+    uint32_t delta_m = 0;
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i32 f0, fd;
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0x18;
+
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = s->vec_stride + 1;
+
+            if ((vm & bank_mask) == 0) {
+                /* mixed scalar/vector */
+                delta_m = 0;
+            } else {
+                /* vector */
+                delta_m = delta_d;
+            }
+        }
+    }
+
+    f0 = tcg_temp_new_i32();
+    fd = tcg_temp_new_i32();
+
+    neon_load_reg32(f0, vm);
+
+    for (;;) {
+        fn(fd, f0);
+        neon_store_reg32(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+
+        if (delta_m == 0) {
+            /* single source one-many */
+            while (veclen--) {
+                vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+                neon_store_reg32(fd, vd);
+            }
+            break;
+        }
+
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+        neon_load_reg32(f0, vm);
+    }
+
+    tcg_temp_free_i32(f0);
+    tcg_temp_free_i32(fd);
+
+    return true;
+}
+
+static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
+{
+    uint32_t delta_m = 0;
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i64 f0, fd;
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((vd | vm) & 0x10)) {
+        return false;
+    }
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0xc;
+
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = (s->vec_stride >> 1) + 1;
+
+            if ((vm & bank_mask) == 0) {
+                /* mixed scalar/vector */
+                delta_m = 0;
+            } else {
+                /* vector */
+                delta_m = delta_d;
+            }
+        }
+    }
+
+    f0 = tcg_temp_new_i64();
+    fd = tcg_temp_new_i64();
+
+    neon_load_reg64(f0, vm);
+
+    for (;;) {
+        fn(fd, f0);
+        neon_store_reg64(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+
+        if (delta_m == 0) {
+            /* single source one-many */
+            while (veclen--) {
+                vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+                neon_store_reg64(fd, vd);
+            }
+            break;
+        }
+
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+        neon_load_reg64(f0, vm);
+    }
+
+    tcg_temp_free_i64(f0);
+    tcg_temp_free_i64(fd);
+
+    return true;
+}
+
 static void gen_VMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 {
     /* Note that order of inputs to the add matters for NaNs */
@@ -1731,3 +1888,13 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     tcg_temp_free_i64(fd);
     return true;
 }
+
+static bool trans_VABS_sp(DisasContext *s, arg_VABS_sp *a)
+{
+    return do_vfp_2op_sp(s, gen_helper_vfp_abss, a->vd, a->vm);
+}
+
+static bool trans_VABS_dp(DisasContext *s, arg_VABS_dp *a)
+{
+    return do_vfp_2op_dp(s, gen_helper_vfp_absd, a->vd, a->vm);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b0a12991131..dc9076a60a3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3096,6 +3096,14 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             case 0 ... 14:
                 /* Already handled by decodetree */
                 return 1;
+            case 15:
+                switch (rn) {
+                case 1:
+                    /* Already handled by decodetree */
+                    return 1;
+                default:
+                    break;
+                }
             default:
                 break;
             }
@@ -3104,7 +3112,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
                 case 0x00: /* vmov */
-                case 0x01: /* vabs */
                 case 0x02: /* vneg */
                 case 0x03: /* vsqrt */
                     break;
@@ -3284,9 +3291,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 0: /* cpy */
                         /* no-op */
                         break;
-                    case 1: /* abs */
-                        gen_vfp_abs(dp);
-                        break;
                     case 2: /* neg */
                         gen_vfp_neg(dp);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 1818d4f71e1..7035861c270 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -156,3 +156,8 @@ VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
              vd=%vd_sp
 VMOV_imm_dp  ---- 1110 1.11 imm4h:4 .... 1011 0000 imm4l:4 \
              vd=%vd_dp
+
+VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

