Received: by 10.28.4.212 with SMTP id 203csp1226277wme;
        Wed, 2 May 2018 15:25:17 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqTcx+AE9hZVkeWxvTllOKcYeBWH2IyXQX29aEifAwOHLaVAEPnPy92EXeL1Hb6zOxqIezq
X-Received: by 2002:ac8:3f58:: with SMTP id w24-v6mr17408327qtk.217.1525299917830;
        Wed, 02 May 2018 15:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299917; cv=none;
        d=google.com; s=arc-20160816;
        b=ahYXLKQuTlyBHhw70pDrFQwMyoVU9mQeZghJz2wRLrm3o+fNe3dUyemH3WQgs1QRCp
         6XZ3cj22lRjCUttmDb+ynreHmeTZOijly1N29x2HqGDfvZIbx12uJ1+UJYN+MhnYgi84
         R0fudVUVb6olN2wj8S3z+rF0/H5KMd7IbLNxJtlpkBYu8CPMG4HPgtpVY+cByquDpNpO
         GAJcZMCMoxf+hka1WYIgGw1EFMRIPZ1mq0145mBLxxv0evhxDYIOmyyD48K8UHogOrRG
         ZGAhHFVJ267vOm75Qdi6Km8Y87iO06sEqrlpms0SNOnsMDlUFDOZt+wTqZWnKat7U/WU
         QpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=4QcG9pnmYxuAv/iY+aAUQ08duv6GdfnD0qVmKawXzqg=;
        b=nj42WREmxFSzunmDBLU8lqyqT01HC6KY4qgUn+Oy2nLjubuRirxFzBIUSzjloZ+OV3
         kJr0UAuGP5Nb32QmAakkDdPHNNsNVFedzEtPk5u2KLSQTZgPgTN9YG/H4mKdq8kWoS/M
         4XSUfEQfAnjloXJIB6D+dPBWeGL3b9si4MG5ugTzkKVtxFGqNuNBDX3ElV3YVEOISHmW
         OOAiXfDRQHC9rNsPCjNdjZC3dh89Il8XoSWquE6wn+fwdh3FcONlh8WoSsGkD0V9L5IG
         YIhfL3iq08AuoBsFh5QICkywLnGU1h0Z/ywzbnCC4gohOBc19QszJaqJaruCDR4zkuJP
         nYYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O6G1H5bw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si6427538qti.144.2018.05.02.15.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O6G1H5bw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE0BZ-0008Cu-9m
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:25:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02i-0000kb-Fi
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02g-0007vw-7Q
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:08 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:33603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02g-0007vM-0l
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:06 -0400
Received: by mail-pg0-x242.google.com with SMTP id i194-v6so11634116pgd.0
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4QcG9pnmYxuAv/iY+aAUQ08duv6GdfnD0qVmKawXzqg=;
	b=O6G1H5bwAy6nF1xzP92ziwnJEMyNGIxbdKwGR8DY3gAbzjAHG1agj0myOwkc+ZEOMX
	PaIP/AA5g8qEZPo3qz8GTTKE4alzlfWKILBNxuNbv/EemkCfgerRjrtUtYvcw+3ILuEF
	mIxKVEiyg21xFWxxTznC7xdKOpEBsFWki5FwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4QcG9pnmYxuAv/iY+aAUQ08duv6GdfnD0qVmKawXzqg=;
	b=W2VDqvXUdu2tKBH/hCEaJXLKD76a9rYQkzM92m6pOtCdX9AAO0b0NzQL90dBIvKvu5
	VSLiroiehMknnXWYV6XLa/TJCRRLabpgEuCdRrRwpRJ+eLSyEYl/HYhvZpN1h3uMoj/Z
	BXma6T1SmGsdi7Qhd74F+wh4JiHof98LCaE/6BH0ia7XPf7Qew8up//q7ZM5Wnk8NbLk
	kQPF6inOD1Z57H4Z0F8ZTtjFvcdlNbuJQGmJyJuRdIWsHc6NiyVdIJTGuSQoi22sOYR7
	+yDz6m2CZaQuAtLcXAppJpPaFlNIPQW8RNuqyB/jBDSi1yf+LTzcPIMq3WZWVC1TN0AU
	pNMA==
X-Gm-Message-State: ALQs6tBRFPijAWsAJwaJUZM5kPb8iIh3Ztg7jp1Ilp2PUksetqdXk3IK
	5qD7lxRIpJmhI6unT3qj87iCSA==
X-Received: by 10.98.129.5 with SMTP id t5mr20762673pfd.215.1525299365040;
	Wed, 02 May 2018 15:16:05 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.16.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:46 -0700
Message-Id: <20180502221552.3873-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v2 08/14] target/arm: Introduce and use
 read_fp_hreg
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wuwt1GJKiUlh

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e19d97e8f1..8c63d5e743 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -614,6 +614,14 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
     return v;
 }
 
+static TCGv_i32 read_fp_hreg(DisasContext *s, int reg)
+{
+    TCGv_i32 v = tcg_temp_new_i32();
+
+    tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg, MO_16));
+    return v;
+}
+
 /* Clear the bits above an N-bit vector, for N = (is_q ? 128 : 64).
  * If SVE is not enabled, then there are only 128 bits in the vector.
  */
@@ -4644,11 +4652,9 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
 static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
 {
     TCGv_ptr fpst = NULL;
-    TCGv_i32 tcg_op = tcg_temp_new_i32();
+    TCGv_i32 tcg_op = read_fp_hreg(s, rn);
     TCGv_i32 tcg_res = tcg_temp_new_i32();
 
-    read_vec_element_i32(s, tcg_op, rn, 0, MO_16);
-
     switch (opcode) {
     case 0x0: /* FMOV */
         tcg_gen_mov_i32(tcg_res, tcg_op);
@@ -7543,13 +7549,10 @@ static void disas_simd_scalar_three_reg_diff(DisasContext *s, uint32_t insn)
         tcg_temp_free_i64(tcg_op2);
         tcg_temp_free_i64(tcg_res);
     } else {
-        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-        TCGv_i32 tcg_op2 = tcg_temp_new_i32();
+        TCGv_i32 tcg_op1 = read_fp_hreg(s, rn);
+        TCGv_i32 tcg_op2 = read_fp_hreg(s, rm);
         TCGv_i64 tcg_res = tcg_temp_new_i64();
 
-        read_vec_element_i32(s, tcg_op1, rn, 0, MO_16);
-        read_vec_element_i32(s, tcg_op2, rm, 0, MO_16);
-
         gen_helper_neon_mull_s16(tcg_res, tcg_op1, tcg_op2);
         gen_helper_neon_addl_saturate_s32(tcg_res, cpu_env, tcg_res, tcg_res);
 
@@ -8090,13 +8093,10 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
 
     fpst = get_fpstatus_ptr(true);
 
-    tcg_op1 = tcg_temp_new_i32();
-    tcg_op2 = tcg_temp_new_i32();
+    tcg_op1 = read_fp_hreg(s, rn);
+    tcg_op2 = read_fp_hreg(s, rm);
     tcg_res = tcg_temp_new_i32();
 
-    read_vec_element_i32(s, tcg_op1, rn, 0, MO_16);
-    read_vec_element_i32(s, tcg_op2, rm, 0, MO_16);
-
     switch (fpopcode) {
     case 0x03: /* FMULX */
         gen_helper_advsimd_mulxh(tcg_res, tcg_op1, tcg_op2, fpst);
@@ -12015,11 +12015,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (is_scalar) {
-        TCGv_i32 tcg_op = tcg_temp_new_i32();
+        TCGv_i32 tcg_op = read_fp_hreg(s, rn);
         TCGv_i32 tcg_res = tcg_temp_new_i32();
 
-        read_vec_element_i32(s, tcg_op, rn, 0, MO_16);
-
         switch (fpop) {
         case 0x1a: /* FCVTNS */
         case 0x1b: /* FCVTMS */
-- 
2.14.3

