Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp751417lfb;
        Thu, 19 Nov 2020 14:00:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6LMk8jozqm2vWYyiGcsS2eMnsro3W97TP2VnBmijXzgdILgB2TXnZccdtq/+5YZHPdI6b
X-Received: by 2002:a25:6e43:: with SMTP id j64mr17259566ybc.183.1605823216269;
        Thu, 19 Nov 2020 14:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823216; cv=none;
        d=google.com; s=arc-20160816;
        b=j6jPIulq4IXiAPU3d4SdyDKijxDCSMW8SzZ9i6F3tgjCT2B4KWbBsKg8l3cpCJivSG
         LxoWYZhNS9wxSblGdigSwK3N/AnHqOonzx+/vG2Fpiqg7bZzsQ8aGIw7YwM5hPqLPRDx
         NjtMtbJtVl7vN42wa4LqEUMwTg3jrC2cH99L0tonV2rZtT4dz/5/Mo+jzKp/EJeZuEDM
         5dAMajQUWl2SbzL75VdpWv7EfnxTPA7hvGjbunZQIpiCr0gM0YQU+J6fkjy+EcnQXOeI
         wp3woOUKfOWSb/0YRbsb2P3AxeRhGH49ekR3Cw1Z3rs7vgq25z7PW4OyeV9+KwhHUUF2
         jWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6ZUEsNLnkcWrUFTIwzA/F8jefuZJiQAaCiyi3H4CQDk=;
        b=FrX2dsYr59SgTHIo3MSXyEUaohY5BG9B8VgbO82D4PoUUs7HgdG+ZdZDPJ1OTdpVwM
         XUc3EoUMJLpR1/Urpzpqnf8hYluO7a9KfHP+Z4bGeiEIuulFOjzcXvHCbo2113EJRSnR
         tcUGV6OPGyUEsHcr1TizGPJ1rLqHqjTL/83NzPuezQVFVy2TeYIuCsbpXMzYklbEV7D1
         fd10paQ3/r/59/yFAvQipXLkQyybtTl78xH5khv0VtJG7nRWvh3eHGr9M0z6/4xzGfb5
         rh70p8m8L+k9h4HB6R8S/Al+eIkq/u8FtzaFwjw8Nf5BV2nDPlUoE+Rw1zEwPqZzEE6B
         ZQwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OXGhp5s/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si787406ybc.186.2020.11.19.14.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OXGhp5s/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfryR-00056K-KU
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrum-0000as-Cp
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruk-000480-Hf
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:28 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l1so7973190wrb.9
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6ZUEsNLnkcWrUFTIwzA/F8jefuZJiQAaCiyi3H4CQDk=;
 b=OXGhp5s//6VwqHwYzKZD0fmVFg2mZv7f4BtWyVhhd/IzqjvbOeZNiAWIuaCqjHtZ5U
 H9PriM6SC3nmucTaskw7YlrKBNKwHGO5ht/mgd9OMmDK7wa3QscxvWAVon06DTJbG5Zv
 gq5AreQ70jaYPaFvTvB3AlKOLAB8p42RuN6jNZsqdV9M3zD5mnLowLjQePMrhIhu3+68
 pJKaErh++gOc1yvl1PaE8JDZ7d4v+BhVXkR2g51QY8r6TJyqX45XHuDw6a+kLMRFZRh4
 NfqvbTzv1DakET1pfw1zm7hMLq9y6foexbd64GhA84A3SwWNhBZUk9trr1AHTLz0JiTX
 OtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ZUEsNLnkcWrUFTIwzA/F8jefuZJiQAaCiyi3H4CQDk=;
 b=rVQqWTyuu7vruVVQ1A1318hOhnM2/tgIR0pPqxKgXgwnt8/9J+5V9JuJDvAuQ79wGK
 xSCF92PP9Fclpxr9tE+ERkHT6GGkpGPhC+Hyr3ZWumi4BHKWfS65VCZ2UMRnUg40PIgK
 cVra4jEoWl7EMlEPiqQfpcgw57y+fox24QbyGtXSmRWQWmieFb6fAhu0LwuIghu7cpHk
 PIAlgnPsG/T3UYWw5EFllMVeTUebx/qus8HLh4vaJDEa7AphXAbsQmNRhet97udH9eFu
 Dha5q9gi8glFCOB3XKe9mRn6w7EypKQY/zzIsXZ9wnXNR9AcahPxImKgNnxogameRSBV
 HpMA==
X-Gm-Message-State: AOAM530dCrQuP4aL0oS+mD7RH762ak/Ux2nl0/C1KsCoSv9YEm3+CiXI
 DTOw/cRJhXXpSiKl9VScudA/E3cJT/YCVQ==
X-Received: by 2002:a05:6000:11c2:: with SMTP id
 i2mr10628297wrx.21.1605822984741; 
 Thu, 19 Nov 2020 13:56:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/28] target/arm: Implement VSCCLRM insn
Date: Thu, 19 Nov 2020 21:55:53 +0000
Message-Id: <20201119215617.29887-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: CPpvYK7vrOAw

Implement the v8.1M VSCCLRM insn, which zeros floating point
registers if there is an active floating point context.
This requires support in write_neon_element32() for the MO_32
element size, so add it.

Because we want to use arm_gen_condlabel(), we need to move
the definition of that function up in translate.c so it is
before the #include of translate-vfp.c.inc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  9 ++++
 target/arm/m-nocp.decode       |  8 +++-
 target/arm/translate.c         | 21 +++++----
 target/arm/translate-vfp.c.inc | 84 ++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c82862..11400a9d248 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3555,6 +3555,15 @@ static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
 }
 
+static inline bool isar_feature_aa32_m_sec_state(const ARMISARegisters *id)
+{
+    /*
+     * Return true if M-profile state handling insns
+     * (VSCCLRM, CLRM, FPCTX access insns) are implemented
+     */
+    return FIELD_EX32(id->id_pfr1, ID_PFR1, SECURITY) >= 3;
+}
+
 static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
 {
     /* Sadly this is encoded differently for A-profile and M-profile */
diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index 28c8ac6b94c..ccd62e8739a 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -29,13 +29,17 @@
 # If the coprocessor is not present or disabled then we will generate
 # the NOCP exception; otherwise we let the insn through to the main decode.
 
+%vd_dp  22:1 12:4
+%vd_sp  12:4 22:1
+
 &nocp cp
 
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
   VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
-  # TODO: VSCCLRM (new in v8.1M) is similar:
-  #VSCCLRM      1110 1100 1-01 1111 ---- 1011 ---- ---0
+  # VSCCLRM (new in v8.1M) is similar:
+  VSCCLRM      1110 1100 1.01 1111 .... 1011 imm:7 0   vd=%vd_dp size=3
+  VSCCLRM      1110 1100 1.01 1111 .... 1010 imm:8     vd=%vd_sp size=2
 
   NOCP         111- 1110 ---- ---- ---- cp:4 ---- ---- &nocp
   NOCP         111- 110- ---- ---- ---- cp:4 ---- ---- &nocp
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d04ca3a8a0..9f2b6018a21 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -100,6 +100,15 @@ void arm_translate_init(void)
     a64_translate_init();
 }
 
+/* Generate a label used for skipping this instruction */
+static void arm_gen_condlabel(DisasContext *s)
+{
+    if (!s->condjmp) {
+        s->condlabel = gen_new_label();
+        s->condjmp = 1;
+    }
+}
+
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
@@ -1221,6 +1230,9 @@ static void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     long off = neon_element_offset(reg, ele, memop);
 
     switch (memop) {
+    case MO_32:
+        tcg_gen_st32_i64(src, cpu_env, off);
+        break;
     case MO_64:
         tcg_gen_st_i64(src, cpu_env, off);
         break;
@@ -5156,15 +5168,6 @@ static void gen_srs(DisasContext *s,
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
-/* Generate a label used for skipping this instruction */
-static void arm_gen_condlabel(DisasContext *s)
-{
-    if (!s->condjmp) {
-        s->condlabel = gen_new_label();
-        s->condjmp = 1;
-    }
-}
-
 /* Skip this instruction if the ARM condition is false */
 static void arm_skip_unless(DisasContext *s, uint32_t cond)
 {
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 96948f5a2d3..2a67ed0f6e2 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3406,6 +3406,90 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     return true;
 }
 
+static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
+{
+    int btmreg, topreg;
+    TCGv_i64 zero;
+    TCGv_i32 aspen, sfpa;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        /* Before v8.1M, fall through in decode to NOCP check */
+        return false;
+    }
+
+    /* Explicitly UNDEF because this takes precedence over NOCP */
+    if (!arm_dc_feature(s, ARM_FEATURE_M_MAIN) || !s->v8m_secure) {
+        unallocated_encoding(s);
+        return true;
+    }
+
+    if (!dc_isar_feature(aa32_vfp_simd, s)) {
+        /* NOP if we have neither FP nor MVE */
+        return true;
+    }
+
+    /*
+     * If FPCCR.ASPEN != 0 && CONTROL_S.SFPA == 0 then there is no
+     * active floating point context so we must NOP (without doing
+     * any lazy state preservation or the NOCP check).
+     */
+    aspen = load_cpu_field(v7m.fpccr[M_REG_S]);
+    sfpa = load_cpu_field(v7m.control[M_REG_S]);
+    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_andi_i32(sfpa, sfpa, R_V7M_CONTROL_SFPA_MASK);
+    tcg_gen_or_i32(sfpa, sfpa, aspen);
+    arm_gen_condlabel(s);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
+
+    if (s->fp_excp_el != 0) {
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return true;
+    }
+
+    topreg = a->vd + a->imm - 1;
+    btmreg = a->vd;
+
+    /* Convert to Sreg numbers if the insn specified in Dregs */
+    if (a->size == 3) {
+        topreg = topreg * 2 + 1;
+        btmreg *= 2;
+    }
+
+    if (topreg > 63 || (topreg > 31 && !(topreg & 1))) {
+        /* UNPREDICTABLE: we choose to undef */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    /* Silently ignore requests to clear D16-D31 if they don't exist */
+    if (topreg > 31 && !dc_isar_feature(aa32_simd_r32, s)) {
+        topreg = 31;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Zero the Sregs from btmreg to topreg inclusive. */
+    zero = tcg_const_i64(0);
+    if (btmreg & 1) {
+        write_neon_element64(zero, btmreg >> 1, 1, MO_32);
+        btmreg++;
+    }
+    for (; btmreg + 1 <= topreg; btmreg += 2) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_64);
+    }
+    if (btmreg == topreg) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_32);
+        btmreg++;
+    }
+    assert(btmreg == topreg + 1);
+    /* TODO: when MVE is implemented, zero VPR here */
+    return true;
+}
+
 static bool trans_NOCP(DisasContext *s, arg_nocp *a)
 {
     /*
-- 
2.20.1

