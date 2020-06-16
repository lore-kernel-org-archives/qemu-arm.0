Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2799287lfm;
        Tue, 16 Jun 2020 10:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFplTOm0lVsPQe7Jgk+jDh8BTXxj7BtTVykekOK9BnwMiKZ6xEnZE5X1/5yKUj3NMvx0xp
X-Received: by 2002:a25:e8b:: with SMTP id 133mr5504343ybo.13.1592327347318;
        Tue, 16 Jun 2020 10:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327347; cv=none;
        d=google.com; s=arc-20160816;
        b=YASb5YQXX2i7zeFw4Cv+UPtFrbC2eDSDlogxlnmgl4zy/DmeYuyU8JkKBBMipJcPfy
         0yBGJxqs8fy6y5wSfRJOhW5YY4Wv9mMnZmHS4ltWjX1VUuwaRo12M5g3TVh2FoQelZYm
         XTeGr0fVKj1Nbp0x7yGitBbnTa0Kzw3+35JXEnxCNgJxvF8KZl8W+7mL/z5acaBU5xGl
         d3Hyxz3hXUgaEzQg2YUSztt9yjhJbV09vnEOttwDs6p/4LvS5Mw+qOUW3aXJpjgP4RCj
         JC3ikMK0RxyKlIv8zFzOljNUJvs+O4K98BtZzglIMF4chIoqQGMwjyHQv4GGnIyJnlPP
         CvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E6Ba71ZojrSQiEwq3jLvy+1jV83eO5SPEj+02tPSt+E=;
        b=KVxgijVKu7wSJJaXZKEkLd8Q1e8j/x3lh+cToXUvL94lFR21Ln4f6jn+aPSYAsfxyH
         ka60m85UHQaYLH89xJ1Q+qxHBZSeSPwTQvfr0rj+5NIWR/H9EyzmNxO4UgOIeBWavTeZ
         Dzoh0Z/emJl1ShwzUH1FrTwB90xxNMXXAsFqTemC2kqF59n1niHG9bDFFwU76vQEJOOk
         twFiFqUy/W8ue6j4Mgp7VJxVVc5i1wNMQP6qj1qRlsYGbi+QwAj0ln2B12kR+nBb1ebW
         bYFhWTNaRfE8mmiSJeXKYgmwGRqNb5/nZwA0do7B5/6h4j0KT/ZdAp3uefmzycRnMexc
         ATSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKWUleQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si7596876yba.363.2020.06.16.10.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKWUleQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlF58-00017i-HH
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF4y-00014E-5d
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:08:56 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF4w-0007Rh-Eb
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:08:55 -0400
Received: by mail-wr1-x442.google.com with SMTP id p5so21542334wrw.9
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6Ba71ZojrSQiEwq3jLvy+1jV83eO5SPEj+02tPSt+E=;
 b=TKWUleQnpRfB/KjVkc78M58O7JJ/4xCqHfZ69YLjuv/+Dk07EROtY2eYZR69ajD3B6
 ET7rEWO2K+L5PtUsTqHQUgMiUo6Oe1+J8r9o38HclFd1BE8m0VkqGN3Wj0eJNt1ew84k
 YIUVwVRlVVpRsrwdqsXZcuhiSmJU0jUAokH5izVt2k2OCHIOoKQ8HGymJhnND3F7mPMv
 YbXJP4lNTHzsRZLR70ZcpUpXYuV3BEc9eE5TFE73g3zUIQqLEVLpe49SoEF9hBkyKLxu
 De6TBwPs1jFCD2gOQpn/Xh6H7uTAvleY3KvdfKvcajQSM+huFadhlQ3nn7LtJROuFpn7
 d6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6Ba71ZojrSQiEwq3jLvy+1jV83eO5SPEj+02tPSt+E=;
 b=gI9i5AGXe06jSKpQEQNlDwUXe8eGPvFY4VcgEfxcx/lqXQRQN6JCdohW7JroN1LkkA
 W8SOh03SfEGyr48M2OXcfnAIqbE9T3MnqG7ONgboO6UuNFbAgFlNC9bp3lkut2K+DCel
 GCAzg4NmsGGpgD2DM8ZECl8VvdPacLERkGeh6l2kObUnuvumbFZKMIkiRHV/Ki+ZQFnz
 +f86TDeC6rglzSVqHm4/xJUtsXruSDpiISpGP/9irGS+NCT33FzGaCI3hsW9RLRrv7u6
 fAJ3+ZMWPqqxWDYvAOeRenR0vR4VduvGqbaB6OkwBjZZN9kQ7DeRSMe42dOfHSyMBeMi
 btGQ==
X-Gm-Message-State: AOAM532G4u/sZCezm8MsdDYvfcKZxLAoW9K/19Ef3CXFo1/73nirP8qg
 3vhkuO4Z+xDeT6WzypzX6DYkDlVnVGWdUA==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr3990279wrm.72.1592327332507; 
 Tue, 16 Jun 2020 10:08:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:08:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/21] target/arm: Convert VZIP, VUZP to decodetree
Date: Tue, 16 Jun 2020 18:08:26 +0100
Message-Id: <20200616170844.13318-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616170844.13318-1-peter.maydell@linaro.org>
References: <20200616170844.13318-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdKYGHZfTyGe

Convert the Neon VZIP and VUZP insns in the 2-reg-misc group to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 ++
 target/arm/translate-neon.inc.c | 74 ++++++++++++++++++++++++++
 target/arm/translate.c          | 92 +--------------------------------
 3 files changed, 79 insertions(+), 90 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index dd521baa07d..ad9e17fd737 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -447,6 +447,9 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
 
     VPADAL_S     1111 001 11 . 11 .. 00 .... 0 1100 . . 0 .... @2misc
     VPADAL_U     1111 001 11 . 11 .. 00 .... 0 1101 . . 0 .... @2misc
+
+    VUZP         1111 001 11 . 11 .. 10 .... 0 0010 . . 0 .... @2misc
+    VZIP         1111 001 11 . 11 .. 10 .... 0 0011 . . 0 .... @2misc
   ]
 
   # Subgroup for size != 0b11
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 2f7bd0d556f..f4799dd9770 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -3169,3 +3169,77 @@ static bool trans_VPADAL_U(DisasContext *s, arg_2misc *a)
     return do_2misc_pairwise(s, a, widenfn[a->size], opfn[a->size],
                              accfn[a->size]);
 }
+
+typedef void ZipFn(TCGv_ptr, TCGv_ptr);
+
+static bool do_zip_uzp(DisasContext *s, arg_2misc *a,
+                       ZipFn *fn)
+{
+    TCGv_ptr pd, pm;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vd | a->vm) & a->q) {
+        return false;
+    }
+
+    if (!fn) {
+        /* Bad size or size/q combination */
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    pd = vfp_reg_ptr(true, a->vd);
+    pm = vfp_reg_ptr(true, a->vm);
+    fn(pd, pm);
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
+static bool trans_VUZP(DisasContext *s, arg_2misc *a)
+{
+    static ZipFn * const fn[2][4] = {
+        {
+            gen_helper_neon_unzip8,
+            gen_helper_neon_unzip16,
+            NULL,
+            NULL,
+        }, {
+            gen_helper_neon_qunzip8,
+            gen_helper_neon_qunzip16,
+            gen_helper_neon_qunzip32,
+            NULL,
+        }
+    };
+    return do_zip_uzp(s, a, fn[a->q][a->size]);
+}
+
+static bool trans_VZIP(DisasContext *s, arg_2misc *a)
+{
+    static ZipFn * const fn[2][4] = {
+        {
+            gen_helper_neon_zip8,
+            gen_helper_neon_zip16,
+            NULL,
+            NULL,
+        }, {
+            gen_helper_neon_qzip8,
+            gen_helper_neon_qzip16,
+            gen_helper_neon_qzip32,
+            NULL,
+        }
+    };
+    return do_zip_uzp(s, a, fn[a->q][a->size]);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4405b034f77..442f287d861 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2934,86 +2934,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
     gen_rfe(s, pc, load_cpu_field(spsr));
 }
 
-static int gen_neon_unzip(int rd, int rm, int size, int q)
-{
-    TCGv_ptr pd, pm;
-    
-    if (!q && size == 2) {
-        return 1;
-    }
-    pd = vfp_reg_ptr(true, rd);
-    pm = vfp_reg_ptr(true, rm);
-    if (q) {
-        switch (size) {
-        case 0:
-            gen_helper_neon_qunzip8(pd, pm);
-            break;
-        case 1:
-            gen_helper_neon_qunzip16(pd, pm);
-            break;
-        case 2:
-            gen_helper_neon_qunzip32(pd, pm);
-            break;
-        default:
-            abort();
-        }
-    } else {
-        switch (size) {
-        case 0:
-            gen_helper_neon_unzip8(pd, pm);
-            break;
-        case 1:
-            gen_helper_neon_unzip16(pd, pm);
-            break;
-        default:
-            abort();
-        }
-    }
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(pm);
-    return 0;
-}
-
-static int gen_neon_zip(int rd, int rm, int size, int q)
-{
-    TCGv_ptr pd, pm;
-
-    if (!q && size == 2) {
-        return 1;
-    }
-    pd = vfp_reg_ptr(true, rd);
-    pm = vfp_reg_ptr(true, rm);
-    if (q) {
-        switch (size) {
-        case 0:
-            gen_helper_neon_qzip8(pd, pm);
-            break;
-        case 1:
-            gen_helper_neon_qzip16(pd, pm);
-            break;
-        case 2:
-            gen_helper_neon_qzip32(pd, pm);
-            break;
-        default:
-            abort();
-        }
-    } else {
-        switch (size) {
-        case 0:
-            gen_helper_neon_zip8(pd, pm);
-            break;
-        case 1:
-            gen_helper_neon_zip16(pd, pm);
-            break;
-        default:
-            abort();
-        }
-    }
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(pm);
-    return 0;
-}
-
 static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
 {
     TCGv_i32 rd, tmp;
@@ -5082,6 +5002,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 case NEON_2RM_VREV64:
                 case NEON_2RM_VPADDL: case NEON_2RM_VPADDL_U:
                 case NEON_2RM_VPADAL: case NEON_2RM_VPADAL_U:
+                case NEON_2RM_VUZP:
+                case NEON_2RM_VZIP:
                     /* handled by decodetree */
                     return 1;
                 case NEON_2RM_VTRN:
@@ -5097,16 +5019,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         goto elementwise;
                     }
                     break;
-                case NEON_2RM_VUZP:
-                    if (gen_neon_unzip(rd, rm, size, q)) {
-                        return 1;
-                    }
-                    break;
-                case NEON_2RM_VZIP:
-                    if (gen_neon_zip(rd, rm, size, q)) {
-                        return 1;
-                    }
-                    break;
                 case NEON_2RM_VMOVN: case NEON_2RM_VQMOVN:
                     /* also VQMOVUN; op field and mnemonics don't line up */
                     if (rm & 1) {
-- 
2.20.1

