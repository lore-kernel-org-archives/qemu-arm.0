Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608535lfy;
        Mon, 24 Aug 2020 07:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtrOiG9dsRWqFDAeFdXRVszIpOVafrHpLawMF73f8CRX5D13ZL8jExDRoaYYnElPeEQGZS
X-Received: by 2002:a9f:25c1:: with SMTP id 59mr2640754uaf.49.1598279581989;
        Mon, 24 Aug 2020 07:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279581; cv=none;
        d=google.com; s=arc-20160816;
        b=rkpGrqsclg10J1DsxoFdokqD472NGDkq39DlpD224PJ4+5Sad9hurgC7LLBhJOD7Dz
         Op/yNrUNJJFdiI0iSTnEKEKkMQtAxf7gIChjbhnADGkJMDNDgWCYZ/bJyKJyoA4Krg4m
         BweVEeufpcE+5aF1Td6RhHCkEpSeNQa4YxwAZMR3IwsHMgIOoYxlkiXB9QJ5DB3d+P19
         W3SyfBgJJmb5YVjkqNKJlUnSU6wJHJUgoMqjW0GYCQoSJyu0z/1ai8zi/J9nk8VUWOpH
         xn4LN0JtmR4GAkWa97/pDqcgD9v1fkn2A17sSo2srFGejRHa71jH/5+Iri00UpO7cDgo
         gOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ieVYT61uv3P/29Z5WNyTLZsT3nOfGLVCnc4unaU9P8c=;
        b=VDyoY77WzY898/wBrAMDxHJXKaGIzbL7Tw3klnFOkk0Iimfhnuhk7qldGE+fDIlAvY
         bUEoFg9ngbP9wq35uDX4bLombV4CgOV3WwV8dIUzva5mnzhq6ce/JK/nr6LCUracHqJO
         r7uprWhPgricc+b44NB7XYlQdtlYtNVJX6TmTiWjEXSZooZ5nZBOKUB9bSzwMTikC0d3
         q/RYR6qCn1Rk5IkAyomzJr2pIG/MCDwT1En5Ywd0GueHVSEl6JIL+1wlfjj1cE4i9UYp
         j3A21kXIwyeXW2RWOVedahTdByDhhhMbBkF34OMbvRVUmgvzejz0p2GzIr/y93Xkkn0t
         HlBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUVbCBmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si1543805vsa.404.2020.08.24.07.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUVbCBmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADWv-0005Ac-8Q
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTp-0008K1-Gc
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTn-0002hK-J8
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id t14so8327869wmi.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ieVYT61uv3P/29Z5WNyTLZsT3nOfGLVCnc4unaU9P8c=;
 b=eUVbCBmfVMDOvK+ry4nm0Pql553gN3AasPw1btpYLzi0JNTQJby7AXw8vOd1kgicE3
 I3umkY9tUc+RFWa59oqbvzm2QgVUDirftEcQnPUPcZ/uKeAkJ9NEhRcnrzT4ViQchctv
 McJO1SGHRIO1inkmkdCKXvWE5/Os2ei7u+n8blsRo+EGMZYpYDRaLudIKtilWi3mMD0D
 S7Epfj8QktQJaJfw8iZjZVDlojMeacwKcuNFcIlGjKYhkreaeavlKjsm61civ0tBytn2
 Zxj2OJLt5IfdAuLhPFMOd0euw8wKYKpv5eNVUqssWedTaGOrT4gUfYXrB/WXLhRBQ9LU
 eWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ieVYT61uv3P/29Z5WNyTLZsT3nOfGLVCnc4unaU9P8c=;
 b=j4iPGwJT7ox8QI2eF9w5VmotwOmipKTnIbLXo0bZJzHKtpmXT/9TbkrVJr9M7JFcDb
 SgrfdxsyHfsJD8n+/ydQPdr5OiJKJop8MRZQJbqDkYZoHsADvnVPg4CHnBvz87ASUV/r
 02cST901uOgm9ABsu90JArKcclwMAl3A2nCMbmnjISmO7KYqGnRRh3xLJEtf3RArExwV
 31OHmPn8UQJJRod1doAgxPAz4vJcgCQOcWT9QUs74frZppGlVKTdFFAEetn9feYSmAxZ
 E4yraqEjhcgSls9+/pgzmXl9W2z5VD5ZgdmO1f56/1D2Kd2T7VHgaZ6fH2FHxuGhUt1F
 gksg==
X-Gm-Message-State: AOAM5339DwjFVzLXnbA7U2oGIugm99sXunA3BgBdzC8sm3cfcwuY9ZT2
 Di+FqwLrYTbkTvaXuwVeWhG0Tlu8j07j+9Xg
X-Received: by 2002:a1c:de54:: with SMTP id v81mr6284118wmg.65.1598279385527; 
 Mon, 24 Aug 2020 07:29:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/22] target/arm: Implement VFP fp16 for VABS, VNEG, VSQRT
Date: Mon, 24 Aug 2020 15:29:20 +0100
Message-Id: <20200824142934.20850-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: ra/Mmtm0TqvY

Implement VFP fp16 for VABS, VNEG and VSQRT. This is all
the fp16 insns that use the DO_VFP_2OP macro, because there
is no fp16 version of VMOV_reg.

Notes:
 * the gen_helper_vfp_negh already exists as we needed to create
   it for the fp16 multiply-add insns
 * as usual we need to use the f16 version of the fp_status;
   this is only relevant for VSQRT

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h            |  2 ++
 target/arm/vfp.decode          |  3 +++
 target/arm/vfp_helper.c        | 10 +++++++++
 target/arm/translate-vfp.c.inc | 40 ++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3c3be97a4b0..ab3a9bd5d7e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -128,8 +128,10 @@ DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
 DEF_HELPER_1(vfp_negh, f32, f32)
 DEF_HELPER_1(vfp_negs, f32, f32)
 DEF_HELPER_1(vfp_negd, f64, f64)
+DEF_HELPER_1(vfp_absh, f32, f32)
 DEF_HELPER_1(vfp_abss, f32, f32)
 DEF_HELPER_1(vfp_absd, f64, f64)
+DEF_HELPER_2(vfp_sqrth, f32, f32, env)
 DEF_HELPER_2(vfp_sqrts, f32, f32, env)
 DEF_HELPER_2(vfp_sqrtd, f64, f64, env)
 DEF_HELPER_3(vfp_cmps, void, f32, f32, env)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index af4829e201b..5c64701dde0 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -162,12 +162,15 @@ VMOV_imm_dp  ---- 1110 1.11 .... .... 1011 0000 .... \
 VMOV_reg_sp  ---- 1110 1.11 0000 .... 1010 01.0 ....        @vfp_dm_ss
 VMOV_reg_dp  ---- 1110 1.11 0000 .... 1011 01.0 ....        @vfp_dm_dd
 
+VABS_hp      ---- 1110 1.11 0000 .... 1001 11.0 ....        @vfp_dm_ss
 VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 ....        @vfp_dm_ss
 VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 ....        @vfp_dm_dd
 
+VNEG_hp      ---- 1110 1.11 0001 .... 1001 01.0 ....        @vfp_dm_ss
 VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 ....        @vfp_dm_ss
 VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 ....        @vfp_dm_dd
 
+VSQRT_hp     ---- 1110 1.11 0001 .... 1001 11.0 ....        @vfp_dm_ss
 VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 ....        @vfp_dm_ss
 VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 ....        @vfp_dm_dd
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index c492e8ef876..2f04dcf0582 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -276,6 +276,11 @@ float64 VFP_HELPER(neg, d)(float64 a)
     return float64_chs(a);
 }
 
+float32 VFP_HELPER(abs, h)(float32 a)
+{
+    return float16_abs(a);
+}
+
 float32 VFP_HELPER(abs, s)(float32 a)
 {
     return float32_abs(a);
@@ -286,6 +291,11 @@ float64 VFP_HELPER(abs, d)(float64 a)
     return float64_abs(a);
 }
 
+float32 VFP_HELPER(sqrt, h)(float32 a, CPUARMState *env)
+{
+    return float16_sqrt(a, &env->vfp.fp_status_f16);
+}
+
 float32 VFP_HELPER(sqrt, s)(float32 a, CPUARMState *env)
 {
     return float32_sqrt(a, &env->vfp.fp_status);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f891d860bb9..99b722b75bd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1469,6 +1469,38 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     return true;
 }
 
+static bool do_vfp_2op_hp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
+{
+    /*
+     * Do a half-precision operation. Functionally this is
+     * the same as do_vfp_2op_sp(), except:
+     *  - it doesn't need the VFP vector handling (fp16 is a
+     *    v8 feature, and in v8 VFP vectors don't exist)
+     *  - it does the aa32_fp16_arith feature test
+     */
+    TCGv_i32 f0;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    f0 = tcg_temp_new_i32();
+    neon_load_reg32(f0, vm);
+    fn(f0, f0);
+    neon_store_reg32(f0, vd);
+    tcg_temp_free_i32(f0);
+
+    return true;
+}
+
 static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
 {
     uint32_t delta_m = 0;
@@ -2244,12 +2276,19 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
 DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
 
+DO_VFP_2OP(VABS, hp, gen_helper_vfp_absh)
 DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
 DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
 
+DO_VFP_2OP(VNEG, hp, gen_helper_vfp_negh)
 DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
 DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
 
+static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
+{
+    gen_helper_vfp_sqrth(vd, vm, cpu_env);
+}
+
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
 {
     gen_helper_vfp_sqrts(vd, vm, cpu_env);
@@ -2260,6 +2299,7 @@ static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
+DO_VFP_2OP(VSQRT, hp, gen_VSQRT_hp)
 DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
 DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
 
-- 
2.20.1

