Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930731njk;
        Fri, 24 Jan 2025 08:35:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVBL+SuaymFtbCBpuRAktZXeDRxvQIc+xsQf9cC2quWsJS2DjdS6lh52bkQMoUgBTVqfSxqut8KeZimnA==@linaro.org
X-Google-Smtp-Source: AGHT+IG85iF0zMlCcNHKodkA04AZd0Y61WTTtmvytuygjwGbDNsrxBs5E70CGb3DH+R5Qqd1ir1w
X-Received: by 2002:ac8:5419:0:b0:46e:23dc:97cb with SMTP id d75a77b69052e-46e23dca6a0mr264290181cf.10.1737736539053;
        Fri, 24 Jan 2025 08:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736539; cv=none;
        d=google.com; s=arc-20240605;
        b=XqmA/0xdFqfJgpBwXmlacfWvrhD1UcbwcBI18+fKZozt1NubSTjiOzn8v8TboKWRxo
         zoYUc6EgKo92FSjC3ehFozgPk2o2DyoSrtTnErPpFZ9OEFFJRhLZmHusapJKk5z/I70T
         qv/O+KJYwDi9XozYe50PGG1xPD4KOy7OHWBSyuJ3HlwKY+h5pE5PPyZL4lpMR/8rJ2ZK
         oF1lDSayE6t4O6gtFIXGi7wAY5n44aVG/O+YJFaemfgF2OryLJtYGUzIv0q4u4x6FsP/
         wEL1z0m/WRRSnFufThn062Cl70QpVGWE22DpEK32KbF+TlbYUKXvovj40Wk/2Nqv4ioc
         +I6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hvxFIxBSlWCivkIbjXPJQuTkInwCZsZuntD1e414ySM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=JIZlkIPiOFXblChL+vkJYYxEqpWwFCvPn8VDh6LhMu1LpeGQitKxaCRmdp9I+vzZQ/
         P5jROEWO4Y3+wdNz4S9uvvWbdYPPBpY9QCF+fwOsW/QJGx8UvMY8AVf4OCyj1AdwKxMj
         mouygN3ZeZvRaGmMLeTEs3h+Wq6Qj84rRBvGHbAzdR8wCV+ZQFhgDzho//JCWpbZmW+4
         2pL9tpvR5D7zEH0IWc9a4egIkWThIQJYTW11I4n2nOmckaZwoocd//bu3QS31jXepnS0
         ri0PK0VZ4KZi29CrRbZYJjv9ouIMGifOdFFwJyEyE3IqIDF210ugnFpue6/D3FXkimlG
         4enQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ndyae6lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bccceesi29776471cf.662.2025.01.24.08.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:35:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ndyae6lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYg-0004PY-Js; Fri, 24 Jan 2025 11:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYK-0003sC-95
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYE-0005Ra-Ms
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so15087505e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736137; x=1738340937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hvxFIxBSlWCivkIbjXPJQuTkInwCZsZuntD1e414ySM=;
 b=Ndyae6lRTgiJ637HzHBLun3Ik2jdHQCuJW2PaHqT6XcMEJ8TdXoZj2bTD4BofT+4xn
 Rj+Zmkd0Jjcv/tKgbe5Oo7JXVvIfaTyOiAaRMzdJUaiY+5K5WP5/ZXirWIIDXBfNdm+u
 iA5o/DcE6bmQx8e+RrvGbhmDJhUPSPvYuBVttA/cE7mC3ZSIkbfDTWgbvm5N6dwF7gpi
 DQ9WgMvFhZfaNgiyilQWcGNRkLEyy2a4BNHAUTcHQvlDyrNRGulYmnW56YgjcGTEKjoA
 0k1Fla7cdMNk75wHZR2dXEAWNQaYN729DaQwgIXjaPM/6qG5irsiV0qHycdDbrO6dNu2
 20CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736137; x=1738340937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvxFIxBSlWCivkIbjXPJQuTkInwCZsZuntD1e414ySM=;
 b=n0PtHZxF74pMJgE0SszUQ4ixuaq4vDRuwtat67BU4uN1jYS3PPrJn17vL88iV8wjP1
 zy3/Yu+oKT1y8NprrBi+sWEtM9xFjdOaEkCo8gVYelIlfS4oAfB4sGTbXlNz27uXw+Rd
 NWW6lADbo3mDLs7wEdP4meo3BAiMxMhfUmsrQDV5vnQKfh89kVQz15xI2trXyOdUt4cy
 qJmbK1ZVTE49Z2jAT3D1jLCqY12pVBGIFVNyMNF9qqCTav82jCKNgZ4B3ksoA/+3pZuV
 X3cZDYdhtqCVyOelrj3/c204U+SyRW76AgxsBe06dZXIU55C56uxa2z3/A9VNSp2V2Ky
 Q+QQ==
X-Gm-Message-State: AOJu0YwbAZNymxws2MW+CunlVmC5HPKb4956YnkZNgT6xW055WqMske2
 b9hvvCSdtC5JL5bfnAkNScrY6w/34gCh0pPwOgy0Cw7ieX4PCoMSf66TcU70MoTV+ZCIZcgMgeW
 A
X-Gm-Gg: ASbGncuPgf3jj3c5r100LodQ3PAcXWZZV8K+bGy6Fjbe46NTFlezh6Iyzt3oqWhWJ00
 MVqxO1lUl2Voaeem/BemdHC1wQpA+be0gcsM1gOgpfdJ3G54PJBPr/NfWxQZLO0rK7bGYPuOmbK
 lg4RvzGIa6wimAUldb5glxOaxtekFX9VIX6vlgtJ6BfmtrgBKWhMtB84zTuWdsPPKT6qeTfXMBg
 Eitm4RIEk47UyPMB3AwBhPnPChQsXllo/OlZ4cNzlmg2ipDDt/KEV96zjQJ1VmQS31fjEoHP5le
 U8MHk99yjykeJYmi5qoKKQ==
X-Received: by 2002:a05:600c:138f:b0:436:ed50:4f8a with SMTP id
 5b1f17b1804b1-438913caeb9mr326394245e9.10.1737736137213; 
 Fri, 24 Jan 2025 08:28:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/76] target/arm: Use FPST_FPCR_F16_A32 in A32 decoder
Date: Fri, 24 Jan 2025 16:27:36 +0000
Message-Id: <20250124162836.2332150-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9TXEJ7KgI6oI

In the A32 decoder, use FPST_FPCR_F16_A32 rather than FPST_FPCR_F16.
By doing an automated conversion of the whole file we avoid possibly
using more than one fpst value in a set_rmode/op/restore_rmode
sequence.

Patch created with
  perl -p -i -e 's/FPST_FPCR_F16(?!_)/FPST_FPCR_F16_A32/g' target/arm/tcg/translate-vfp.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-vfp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index e1b8243c5d9..8eebba0f272 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -460,7 +460,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
     }
 
     if (sz == 1) {
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
+        fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     } else {
         fpst = fpstatus_ptr(FPST_FPCR_A32);
     }
@@ -527,7 +527,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     if (sz == 1) {
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
+        fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     } else {
         fpst = fpstatus_ptr(FPST_FPCR_A32);
     }
@@ -1433,7 +1433,7 @@ static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
     /*
      * Do a half-precision operation. Functionally this is
      * the same as do_vfp_3op_sp(), except:
-     *  - it uses the FPST_FPCR_F16
+     *  - it uses the FPST_FPCR_F16_A32
      *  - it doesn't need the VFP vector handling (fp16 is a
      *    v8 feature, and in v8 VFP vectors don't exist)
      *  - it does the aa32_fp16_arith feature test
@@ -1456,7 +1456,7 @@ static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
     f0 = tcg_temp_new_i32();
     f1 = tcg_temp_new_i32();
     fd = tcg_temp_new_i32();
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
 
     vfp_load_reg16(f0, vn);
     vfp_load_reg16(f1, vm);
@@ -2122,7 +2122,7 @@ static bool do_vfm_hp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
         /* VFNMA, VFNMS */
         gen_vfp_negh(vd, vd);
     }
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     gen_helper_vfp_muladdh(vd, vn, vm, vd, fpst);
     vfp_store_reg32(vd, a->vd);
     return true;
@@ -2424,7 +2424,7 @@ DO_VFP_2OP(VNEG, dp, gen_vfp_negd, aa32_fpdp_v2)
 
 static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
 {
-    gen_helper_vfp_sqrth(vd, vm, fpstatus_ptr(FPST_FPCR_F16));
+    gen_helper_vfp_sqrth(vd, vm, fpstatus_ptr(FPST_FPCR_F16_A32));
 }
 
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
@@ -2706,7 +2706,7 @@ static bool trans_VRINTR_hp(DisasContext *s, arg_VRINTR_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     gen_helper_rinth(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
@@ -2779,7 +2779,7 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
     gen_restore_rmode(tcg_rmode, fpst);
@@ -2859,7 +2859,7 @@ static bool trans_VRINTX_hp(DisasContext *s, arg_VRINTX_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     gen_helper_rinth_exact(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
@@ -2983,7 +2983,7 @@ static bool trans_VCVT_int_hp(DisasContext *s, arg_VCVT_int_sp *a)
 
     vm = tcg_temp_new_i32();
     vfp_load_reg32(vm, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     if (a->s) {
         /* i32 -> f16 */
         gen_helper_vfp_sitoh(vm, vm, fpst);
@@ -3105,7 +3105,7 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
     vd = tcg_temp_new_i32();
     vfp_load_reg32(vd, a->vd);
 
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     shift = tcg_constant_i32(frac_bits);
 
     /* Switch on op:U:sx bits */
@@ -3273,7 +3273,7 @@ static bool trans_VCVT_hp_int(DisasContext *s, arg_VCVT_sp_int *a)
         return true;
     }
 
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
     vm = tcg_temp_new_i32();
     vfp_load_reg16(vm, a->vm);
 
-- 
2.34.1

