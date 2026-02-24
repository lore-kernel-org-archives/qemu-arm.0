Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510A9F4BB7A
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 19:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuy8Y-0002fy-1I; Tue, 24 Feb 2026 14:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy7U-0001sQ-Uq
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:31:09 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vuy7N-0000oL-9c
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 14:30:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso49974685e9.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 11:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771961445; x=1772566245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChlHn875Dvv2jy+w+z550jf4WHfHLtbl/BnX8u6SJxg=;
 b=kakVuhwSMpp9SI+tSfJZSkfy0NNJ1QRSqDi4v2oTEInD0FotqcqsFaFbJSINfUVSwl
 DGU9S2Cs1V9KZXByUUXzmn3dIWI0+OODEPopFfsC54/wDIJOLyW86j4XWB7EpYfK2PLd
 lXoNf/XFo9zSmKw6erAqjg9vet1lFxY29UevGarsVS3bSr89OJ16Nf7ru79PQuLnyNpV
 DKoEsC73hfdsLB/M35KkUmIOuu6hnwsywn63qFFCGEg6YQUExhJrtharoApwX4dEavtf
 hWuYXK+uPth3UJJ/ATAFxHqzPfqOkQMqZbDH2RImC8zt8cDnIp4DB5VxCZQsz5REDaa/
 rYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771961445; x=1772566245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ChlHn875Dvv2jy+w+z550jf4WHfHLtbl/BnX8u6SJxg=;
 b=rcnM7d5QjBxyjtPZGFe1dycKIJ7aYVfGLggCk81gv6V0soktfbGHWzcuQAxOnHdzh8
 ieuTM5LRRxuAnVikrHpJJjJIpVF37qFQAZLQDrZQ2ec0PE8FJ1xW/LyJa756jTkre0QG
 Lxw2A07GFVNU4nh8JwdWdXrf5TYK1aMhN0LtlrsuwkTbXyDlnVQMhsBDundqdf5bXoXr
 i1QAiLabXw776mV8ZGBsTgRkuPbPcG1zjjPte+wBPtMvs1/2tte22yX18n/oDOketIMo
 C6TAc1QrSDW/pfvgKoz+Q21dNBBnLeMXh+vBMe1q6KWTFj2TGY6IlyvW6r3rdnsNCB+s
 Cezg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMjgozBJ8hLjhMS9oFsLm/NuvA6KauQTlkcSkYxtf+mJ7A8NQSqyCms8UZi1Ad2FlCXHrHQAvyEw==@nongnu.org
X-Gm-Message-State: AOJu0YxyllnMPsDMeULxkkk6I3KaUcXrN60lpkqmNvMbaxrNJOpb5Hoe
 84NOaM6ukLj22zXT3bUOJKOEJndtOLwW8IJqxgroAqiiWx12RKWKQDCchekZqinW52c=
X-Gm-Gg: AZuq6aIcZ87ASj+7NghQUlFQZZ4rqxuaIH39aMBhRp18GVenZkWaeKrUlyNuhArffxY
 tGG67rTdpzYIVT/d/rYTuebqp2H2yjuhrdK+PCTHz1/fCBDamHcU92TcyowoW+InMiEay8Jvo4X
 VXfkY5/zqLHKD35EKHVmZxd/mL+4SwHZ+t7Euc5jYGnzay93wXd6dlcCW5SY+Ff1gNjN32/dyeU
 SH9uUu/pqTxGX0uDhisFLwWtUv0YBQ+QO4a6tpYMUDktCHbcqYLJngkfUtpQ4g2SWhDm8A3uRWa
 AeI6e5acYfl/Oq/5YcyWJtcj3HmabYoCqEOCKQHU+8p0Kl/0f9kbY46DtXQ7cDtP72TkC2IQiFd
 ++04ejQFZAmCfyICdqfbBkMBpMLjdjo8ulgMaxMHdSZjzkHZVsJ1hWfHIESQIgoFzKLCyxziQoq
 1LHFb9UYHph04eUloCyKq1FgnRKu4sb7poUlIiFYycqaeGVmUmq/inIxT4/l1OjLoDmGJjp5Vu
X-Received: by 2002:a05:600c:3b28:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-483a95a2320mr224146815e9.0.1771961444951; 
 Tue, 24 Feb 2026 11:30:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f2f88sm20104885e9.2.2026.02.24.11.30.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 11:30:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [RFC PATCH 2/5] target/tcg: Rename crc32*() helpers
Date: Tue, 24 Feb 2026 20:30:24 +0100
Message-ID: <20260224193028.2370-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224193028.2370-1-philmd@linaro.org>
References: <20260224193028.2370-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In order to avoid symbol name clash when building
a single binary, rename TCG helpers prefixing with
the target name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-defs.h                     |  4 ++--
 target/i386/ops_sse.h                            |  2 +-
 target/loongarch/tcg/helper.h                    |  4 ++--
 target/mips/helper.h                             |  4 ++--
 target/i386/tcg/ops_sse_header.h.inc             |  2 +-
 target/arm/tcg/arith_helper.c                    |  4 ++--
 target/arm/tcg/translate.c                       |  4 ++--
 target/loongarch/tcg/op_helper.c                 |  4 ++--
 target/mips/tcg/op_helper.c                      |  4 ++--
 target/mips/tcg/translate.c                      |  4 ++--
 target/i386/tcg/emit.c.inc                       |  2 +-
 .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 5a10a9fba3b..a9e3583e2bb 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -493,8 +493,8 @@ DEF_HELPER_FLAGS_4(crypto_sm4ekey, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_rax1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
-DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
+DEF_HELPER_FLAGS_3(arm_crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
+DEF_HELPER_FLAGS_3(arm_crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
 DEF_HELPER_FLAGS_5(gvec_qrdmlah_s16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 99c4728ec81..3c683185253 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2115,7 +2115,7 @@ void glue(helper_pcmpistrm, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
 #define CRCPOLY        0x1edc6f41
 #define CRCPOLY_BITREV 0x82f63b78
-target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
+target_ulong helper_x86_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 {
     target_ulong crc = (msg & ((target_ulong) -1 >>
                                (TARGET_LONG_BITS - len))) ^ crc1;
diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index e36dd2f5de3..35b055eb3bc 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -12,8 +12,8 @@ DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
-DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
-DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(loongarch_crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(loongarch_crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_2(cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
 
 /* Floating-point helper */
diff --git a/target/mips/helper.h b/target/mips/helper.h
index 1c9f76f0c9c..e70a3942fac 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -21,8 +21,8 @@ DEF_HELPER_FLAGS_1(mips_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #endif
 
-DEF_HELPER_3(crc32, tl, tl, tl, i32)
-DEF_HELPER_3(crc32c, tl, tl, tl, i32)
+DEF_HELPER_3(mips_crc32, tl, tl, tl, i32)
+DEF_HELPER_3(mips_crc32c, tl, tl, tl, i32)
 DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
 
 /* microMIPS functions */
diff --git a/target/i386/tcg/ops_sse_header.h.inc b/target/i386/tcg/ops_sse_header.h.inc
index bbeb7301c33..8569f9935e3 100644
--- a/target/i386/tcg/ops_sse_header.h.inc
+++ b/target/i386/tcg/ops_sse_header.h.inc
@@ -337,7 +337,7 @@ DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistrm, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_3(crc32, tl, i32, tl, i32)
+DEF_HELPER_3(x86_crc32, tl, i32, tl, i32)
 #endif
 
 /* AES-NI op helpers */
diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index cc081c8f966..3a5cb41c7a9 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -275,7 +275,7 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
  * The upper bytes of val (above the number specified by 'bytes') must have
  * been zeroed out by the caller.
  */
-uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
+uint32_t HELPER(arm_crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
 {
     uint8_t buf[4];
 
@@ -285,7 +285,7 @@ uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32(acc ^ 0xffffffff, buf, bytes) ^ 0xffffffff;
 }
 
-uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
+uint32_t HELPER(arm_crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 {
     uint8_t buf[4];
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f9d1b8897d2..24cd316ee7a 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3348,9 +3348,9 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     }
     t3 = tcg_constant_i32(1 << sz);
     if (c) {
-        gen_helper_crc32c(t1, t1, t2, t3);
+        gen_helper_arm_crc32c(t1, t1, t2, t3);
     } else {
-        gen_helper_crc32(t1, t1, t2, t3);
+        gen_helper_arm_crc32(t1, t1, t2, t3);
     }
     store_reg(s, a->rd, t1);
     return true;
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index 6b4fe535300..427b1da4004 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -60,7 +60,7 @@ void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
     }
 }
 
-target_ulong helper_crc32(target_ulong val, target_ulong m, uint64_t sz)
+target_ulong helper_loongarch_crc32(target_ulong val, target_ulong m, uint64_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
@@ -70,7 +70,7 @@ target_ulong helper_crc32(target_ulong val, target_ulong m, uint64_t sz)
     return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
 }
 
-target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
+target_ulong helper_loongarch_crc32c(target_ulong val, target_ulong m, uint64_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index 83c340e38e0..723253da59d 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -145,7 +145,7 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 }
 
 /* these crc32 functions are based on target/loongarch/tcg/op_helper.c */
-target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
+target_ulong helper_mips_crc32(target_ulong val, target_ulong m, uint32_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ?
@@ -157,7 +157,7 @@ target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
     return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
 }
 
-target_ulong helper_crc32c(target_ulong val, target_ulong m, uint32_t sz)
+target_ulong helper_mips_crc32c(target_ulong val, target_ulong m, uint32_t sz)
 {
     uint8_t buf[8];
     target_ulong mask = ((sz * 8) == 64) ?
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a63aa67808e..7ffa0d77273 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13440,9 +13440,9 @@ void gen_crc32(DisasContext *ctx, int rd, int rs, int rt, int sz,
     gen_load_gpr(t1, rs);
 
     if (crc32c) {
-        gen_helper_crc32c(cpu_gpr[rd], t0, t1, tsz);
+        gen_helper_mips_crc32c(cpu_gpr[rd], t0, t1, tsz);
     } else {
-        gen_helper_crc32(cpu_gpr[rd], t0, t1, tsz);
+        gen_helper_mips_crc32(cpu_gpr[rd], t0, t1, tsz);
     }
 }
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index ce636b6c56c..47b3940e943 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1916,7 +1916,7 @@ static void gen_CRC32(DisasContext *s, X86DecodedInsn *decode)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_trunc_tl_i32(tmp, s->T0);
-    gen_helper_crc32(s->T0, tmp, s->T1, tcg_constant_i32(8 << ot));
+    gen_helper_x86_crc32(s->T0, tmp, s->T1, tcg_constant_i32(8 << ot));
 }
 
 static void gen_CVTPI2Px(DisasContext *s, X86DecodedInsn *decode)
diff --git a/target/loongarch/tcg/insn_trans/trans_extra.c.inc b/target/loongarch/tcg/insn_trans/trans_extra.c.inc
index 298a80cff55..0a45f6c16a2 100644
--- a/target/loongarch/tcg/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_extra.c.inc
@@ -101,11 +101,11 @@ static bool gen_crc(DisasContext *ctx, arg_rrr *a,
     return true;
 }
 
-TRANS(crc_w_b_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(1))
-TRANS(crc_w_h_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(2))
-TRANS(crc_w_w_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(4))
-TRANS64(crc_w_d_w, CRC, gen_crc, gen_helper_crc32, tcg_constant_tl(8))
-TRANS(crcc_w_b_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(1))
-TRANS(crcc_w_h_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(2))
-TRANS(crcc_w_w_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(4))
-TRANS64(crcc_w_d_w, CRC, gen_crc, gen_helper_crc32c, tcg_constant_tl(8))
+TRANS(crc_w_b_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(1))
+TRANS(crc_w_h_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(2))
+TRANS(crc_w_w_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(4))
+TRANS64(crc_w_d_w, CRC, gen_crc, gen_helper_loongarch_crc32, tcg_constant_tl(8))
+TRANS(crcc_w_b_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(1))
+TRANS(crcc_w_h_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(2))
+TRANS(crcc_w_w_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(4))
+TRANS64(crcc_w_d_w, CRC, gen_crc, gen_helper_loongarch_crc32c, tcg_constant_tl(8))
-- 
2.52.0


