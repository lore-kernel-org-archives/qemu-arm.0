Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608922lfy;
        Mon, 24 Aug 2020 07:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7dW7dnkvZVSu8muonzYEdLDYL7aa1i9u1T/D2Jjkj3SRBVGtqFdXy0ldQr2wBbsu2fUWf
X-Received: by 2002:ab0:6ec7:: with SMTP id c7mr2935237uav.31.1598279615859;
        Mon, 24 Aug 2020 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279615; cv=none;
        d=google.com; s=arc-20160816;
        b=iet9v2T2//yMb0BbSv0U2fW4noPMXC8v29nXJNWSeI+Iqk8modl+WYV2iEVH7iJ/io
         CXRgZWPBBs+iE/TgL28jTs0tdoyZ+R9Z9tLGEtmPNP2UGEVMh1/rvSHtPam39kpHf6tn
         0TnXF/IzUsu8NSGxTMu+ec8AUHYKhIZsALLBINL0ZKZXBToZ408+JtLbmQ2TsDx+c+mt
         Bl5R0nZiPRXG4zeFsosAQ3W+dnwgL4YDLHOwA6y0an2xPGENP38zti91Vmo+z6wIrdrF
         y3PejuP0U4jLRj98i2XdUe5kdGahqbncsZHJuZi84HlL4/j6B2aBGjDqS1FKT8u8KWUq
         y9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ns18dr1TbvMInuyF6XsP9cAv2g8MfPEdo1sa6I2VYXQ=;
        b=MIHc8qjf7cx+xwzkT0k0Qy7ZjSjEJOyRSFodItatC6eOMH7Uwv74FgdWCroA/EAGYK
         mr7r/DW/860AUpRaLoWFrl74PTPNcRAI4UFxteVB/SYJPdd+MqZe7xTsWbHGnf2BvrID
         8ykg62oa6quqDwzJquYoUsiQrS4zFzxV5H3OhCXvFz+rFSDcTNYkhgIyY5B7N9LFNJgO
         OB/BGzMTiHH+Nui5uZgyJAE28S3aglbshwx32JQ0OPvgFnKIjjlS2Wr/iJLCQ4bCHNAI
         GNj6CLpw0iOk6ar/EU09k21g3FdLoAlVG6ctDbzf8slfp3XMlalWaTlCyF0gWal6JTwP
         rUaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAhDzBaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si1657558vkw.61.2020.08.24.07.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAhDzBaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADXT-000625-1t
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTs-0008Ss-Ud
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTr-0002id-33
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:52 -0400
Received: by mail-wm1-x342.google.com with SMTP id u18so8543899wmc.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ns18dr1TbvMInuyF6XsP9cAv2g8MfPEdo1sa6I2VYXQ=;
 b=DAhDzBaAB97/DphOstN0z5yRydSyUtL0benuls/OFabBeKPbpca5FTRYz3o+gXOyKa
 RrRsqOt2X2oTECiqnzE3g4qDGfGV2RK/M33reOWu097XTGcIsno3zJTM89T+IaRCk5Va
 amBWF5+OqkzEkkqxMI/xaVBpePnUXCqTG9wiUTTqbvzH7imaBGahM6vLBaKnBWbhW344
 JdEMxolO/QeY+1GtBU+kSrZCVlxXqWP7ggZMyBgJHoo64TSTPOjX8e2ew5YAH/lsdl+e
 ZSTDSDk4hb8ckgaXi8qWQ/l0ULSqhW+PTbT5lbFEjeY2SzakbVadrgjf2dr/hVJJHohg
 vhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ns18dr1TbvMInuyF6XsP9cAv2g8MfPEdo1sa6I2VYXQ=;
 b=qhT5qarPYgnVi7+BsCjSWMriweIYA483C8Sa/jfTrXMpRP2XnyD38RZdpj0ENKSj2W
 /zjSXfG7j4dGVel/a/DK9Rrz7OsgfWJwTAt/IS7HFetCJPG0LW+zcJl7bkHc0Fk1aa6f
 hti+GyvXRvjSj74e8PuQ+U0SmVIOOSbWbYyariAUOQra8/gS9WpZqdj5calmMOgscjl5
 aJaoviBLBPlv1tr9Tjr2jFW+OkwjRo2qCZVHDTb4XA9S62q0ay5ORLirWxW5ZfDmEro1
 O6k1BrbzyUopXLNJeRksqb1zNKiyokx9CldT2bMLn5Tc/KMyI3SCrv8WXLXu+KMKRwCW
 pFUg==
X-Gm-Message-State: AOAM532Xw94sCdA8qYrzGBAhW0cmrOmkxsidatbYG/N0DKh8Y6jNsuss
 oLN/Ft1QZF7R2FDy4bJsazFbo8i8Ev5G55Sh
X-Received: by 2002:a1c:740e:: with SMTP id p14mr5786304wmc.179.1598279389443; 
 Mon, 24 Aug 2020 07:29:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/22] target/arm: Implement VFP fp16 VCVT between float and
 integer
Date: Mon, 24 Aug 2020 15:29:24 +0100
Message-Id: <20200824142934.20850-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVrsE3EJDJXE

Implement the fp16 versions of the VFP VCVT instruction forms which
convert between floating point and integer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          |  4 +++
 target/arm/translate-vfp.c.inc | 65 ++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 37f96e2d261..642ec039e3c 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -210,6 +210,8 @@ VCVT_sp      ---- 1110 1.11 0111 .... 1010 11.0 ....        @vfp_dm_ds
 VCVT_dp      ---- 1110 1.11 0111 .... 1011 11.0 ....        @vfp_dm_sd
 
 # VCVT from integer to floating point: Vm always single; Vd depends on size
+VCVT_int_hp  ---- 1110 1.11 1000 .... 1001 s:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCVT_int_sp  ---- 1110 1.11 1000 .... 1010 s:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
@@ -229,6 +231,8 @@ VCVT_fix_dp  ---- 1110 1.11 1.1. .... 1011 .1.0 .... \
              vd=%vd_dp imm=%vm_sp opc=%vcvt_fix_op
 
 # VCVT float to integer (VCVT and VCVTR): Vd always single; Vd depends on size
+VCVT_hp_int  ---- 1110 1.11 110 s:1 .... 1001 rz:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCVT_sp_int  ---- 1110 1.11 110 s:1 .... 1010 rz:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_dp_int  ---- 1110 1.11 110 s:1 .... 1011 rz:1 1.0 .... \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 59ef4d4fbc3..0140822d183 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2845,6 +2845,35 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     return true;
 }
 
+static bool trans_VCVT_int_hp(DisasContext *s, arg_VCVT_int_sp *a)
+{
+    TCGv_i32 vm;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    neon_load_reg32(vm, a->vm);
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    if (a->s) {
+        /* i32 -> f16 */
+        gen_helper_vfp_sitoh(vm, vm, fpst);
+    } else {
+        /* u32 -> f16 */
+        gen_helper_vfp_uitoh(vm, vm, fpst);
+    }
+    neon_store_reg32(vm, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
 static bool trans_VCVT_int_sp(DisasContext *s, arg_VCVT_int_sp *a)
 {
     TCGv_i32 vm;
@@ -3067,6 +3096,42 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     return true;
 }
 
+static bool trans_VCVT_hp_int(DisasContext *s, arg_VCVT_sp_int *a)
+{
+    TCGv_i32 vm;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    vm = tcg_temp_new_i32();
+    neon_load_reg32(vm, a->vm);
+
+    if (a->s) {
+        if (a->rz) {
+            gen_helper_vfp_tosizh(vm, vm, fpst);
+        } else {
+            gen_helper_vfp_tosih(vm, vm, fpst);
+        }
+    } else {
+        if (a->rz) {
+            gen_helper_vfp_touizh(vm, vm, fpst);
+        } else {
+            gen_helper_vfp_touih(vm, vm, fpst);
+        }
+    }
+    neon_store_reg32(vm, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
 static bool trans_VCVT_sp_int(DisasContext *s, arg_VCVT_sp_int *a)
 {
     TCGv_i32 vm;
-- 
2.20.1

