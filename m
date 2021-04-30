Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp516750lfg;
        Fri, 30 Apr 2021 14:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsCEoJbLfT+7w5ZpaYMduMCgIatOyBinVX7yTxf2KN1lsSlu6v16WhLPn7yPpvGRJHopht
X-Received: by 2002:a05:6808:253:: with SMTP id m19mr12280256oie.56.1619818617591;
        Fri, 30 Apr 2021 14:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619818617; cv=none;
        d=google.com; s=arc-20160816;
        b=vHohb7ohJ9q1ih3FuIso97YfxrubgJXb80Kl57+8eDkHA0zYkQgeXPJLH8ghGOXPqq
         9hxa5iWfDCGq89F+xCYrJfSEictkX46eVv6VHAU0muWI4x6WbCZgMNt6ZPZNv3jkuRJ7
         Kqs5SylOh/XLVUA9cEQArxD+GY/HAZwc+J+uZqksKYokaffSo0DcHLRkiOSThKSFhAOc
         CzB4IfPl3JCy+s9NIOFD9u1xfh7BBtEdRr+hQH+XmMm+XpqZcmkqknqTgFDc/CPVXHlp
         bfkvSFcEJ+GWRl8YYYiVqNNMycQJcOMBUsjIzQTk2KnjYigah32yWYdrz9MkeoVp2ppM
         Fgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BAqr4W6B826glKmooOGK9KlVf8wkCriM0YiYwy5pluA=;
        b=p+0OMw8dPYub++i+yUOt/ZQrxVrzXRI0EMRkzg9Ma3s4sycfHK8/+VjzAzQsZ15g4/
         PN0vDTdY/3fIeRanb2hgoh9pXog/jF5OUk+JZ78e8yoc5A3aTZio48byB+zcUa4wC3kk
         IXUtaSYoJj/ZoHUTK3UJwBo3/74IloyhIjkekOKy386+jrQz2o8OJ2B6NGwQOq2ZBoIg
         BlPcinTNhI0VDRGFGAPEHzUK9BCRDfmGJlvpQ9wB1vDFFG79iKuBdhGXyiqQcikb6qzb
         Qu9qWEv5yNmTEurdQmP/wJQ3N8zcw83pJX/5f/ApPR9QkpS0E+e4C9sAVSFHyeT/6crr
         bsdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTnAeyK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si4695043ooj.15.2021.04.30.14.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTnAeyK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaoi-0000lW-R8
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZoy-0006ks-Ae
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZot-0000rp-Lt
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so2354013pjj.3
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BAqr4W6B826glKmooOGK9KlVf8wkCriM0YiYwy5pluA=;
 b=UTnAeyK8a7JJOdheRaaSDnKifPiR1/6PeejNk//7QyAc0uJFVIK3WEgsx/VrWSj3lp
 7N0kyUC96Upe7MNYyFcCkkD+k7FJ1HhvVeyy1/4mBOK9wLkzr9WjRZN+TZmopghdYaeL
 UnNStcnm41VrcegIUWTGl8xh1s1SqxLRwa+MgzRijeEYdIdpFniW7mebhCeuB5oe/EoU
 g31KZhcFoLwrFP/ywzAsR5HV4kYK08eda/pSb0Cq0854XQB+wXX+ijLoIQ62jYwBc7BY
 3gJLK+Y5ObEg8ZAQJcnvOAv9Yxa/Xvtbth8Los7FhQ/qAnIuiFH/b8HGrOruXs6DbthS
 6vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BAqr4W6B826glKmooOGK9KlVf8wkCriM0YiYwy5pluA=;
 b=gfFmTKFKMJ/FH1iuv9M2uuR2PN8CdQMbhJ8H2BFPXggrS/uu27Wgk2EZbwfuDPWeCg
 q1F/sKfE7N7hhNNK7ixmpl4eLErmfAZ+svQ7WF7QvPrrgHLliV9I0HtB8bQd5rcbw1JZ
 HJhX9lKaluwVveX/0S7pkq9bDmZvWHFYTK39xlezpbr4W659XZXsB1UfCdxa+Wm8iCXA
 UAhJJksr4ey432U7BooTazhO252BkYFB3L2M+MBFVbkuNDg2O5R4XviVkhFQh36LYNbh
 PHZ24uXXRbQi+UtZC5VTXy7eQlltbgTpS5iU5/2hMbF//0nAQzt7xUQrEF/KPfBaEfYx
 AZFQ==
X-Gm-Message-State: AOAM533a0x1qU8cyaRNSmsq5S9tHRct0fkGjaVINwyuuZKq43RsLt1WK
 Pw9qblJ2o0JzzEy2IMaxr6kt8AHVURQ5yw==
X-Received: by 2002:a17:90a:4108:: with SMTP id
 u8mr7165208pjf.126.1619814781364; 
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3792511pgt.42.2021.04.30.13.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 80/82] target/arm: Implement integer matrix multiply
 accumulate
Date: Fri, 30 Apr 2021 13:26:08 -0700
Message-Id: <20210430202610.1136687-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zn3dJHFwiXDz

This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
and V{S,U,US}MMLA.S8 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  7 ++++
 target/arm/neon-shared.decode |  7 ++++
 target/arm/sve.decode         |  6 +++
 target/arm/translate-a64.c    | 18 ++++++++
 target/arm/translate-neon.c   | 27 ++++++++++++
 target/arm/translate-sve.c    | 27 ++++++++++++
 target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
 7 files changed, 169 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e8b16a401f..33df62f44d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -994,6 +994,13 @@ DEF_HELPER_FLAGS_6(sve2_fmlal_zzxw_s, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_smmla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 5befaec87b..cc9f4cdd85 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -59,6 +59,13 @@ VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp q=1
 
+VSMMLA         1111 1100 0.10 .... .... 1100 .1.0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUMMLA         1111 1100 0.10 .... .... 1100 .1.1 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSMMLA        1111 1100 1.10 .... .... 1100 .1.0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=1
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 63870b7539..3d7c4fa6e5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1364,6 +1364,12 @@ USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
 EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
 EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 
+## SVE integer matrix multiply accumulate
+
+SMMLA           01000101 00 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+USMMLA          01000101 10 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+UMMLA           01000101 11 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+
 ## SVE2 bitwise permute
 
 BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c875481784..ceac0ee2bd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12182,6 +12182,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_i8mm, s);
         break;
+    case 0x04: /* SMMLA */
+    case 0x14: /* UMMLA */
+    case 0x05: /* USMMLA */
+        if (!is_q || size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_i8mm, s);
+        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -12226,6 +12235,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
         return;
 
+    case 0x04: /* SMMLA, UMMLA */
+        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0,
+                         u ? gen_helper_gvec_ummla_b
+                         : gen_helper_gvec_smmla_b);
+        return;
+    case 0x05: /* USMMLA */
+        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0, gen_helper_gvec_usmmla_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index b7774caf9e..7232685106 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4036,3 +4036,30 @@ static bool trans_VTRN(DisasContext *s, arg_2misc *a)
     tcg_temp_free_i32(tmp2);
     return true;
 }
+
+static bool trans_VSMMLA(DisasContext *s, arg_VSMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_smmla_b);
+}
+
+static bool trans_VUMMLA(DisasContext *s, arg_VUMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_ummla_b);
+}
+
+static bool trans_VUSMMLA(DisasContext *s, arg_VUSMMLA *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usmmla_b);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index acb8603418..5037e6b7eb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8543,3 +8543,30 @@ static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
 {
     return do_FMLAL_zzxw(s, a, true, true);
 }
+
+static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_smmla_b, 0);
+}
+
+static bool trans_USMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_usmmla_b, 0);
+}
+
+static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index ea08b15c55..6c9f1e5146 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2578,3 +2578,80 @@ void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz * 8, simd_maxsz(desc));
 }
+
+/*
+ * Integer matrix-multiply accumulate
+ */
+
+static uint32_t do_smmla_b(uint32_t sum, void *vn, void *vm)
+{
+    int8_t *n = vn, *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static uint32_t do_ummla_b(uint32_t sum, void *vn, void *vm)
+{
+    uint8_t *n = vn, *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static uint32_t do_usmmla_b(uint32_t sum, void *vn, void *vm)
+{
+    uint8_t *n = vn;
+    int8_t *m = vm;
+
+    for (intptr_t k = 0; k < 8; ++k) {
+        sum += n[H1(k)] * m[H1(k)];
+    }
+    return sum;
+}
+
+static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
+                      uint32_t (*inner_loop)(uint32_t, void *, void *))
+{
+    intptr_t seg, opr_sz = simd_oprsz(desc);
+
+    for (seg = 0; seg < opr_sz; seg += 16) {
+        uint32_t *d = vd + seg;
+        uint32_t *a = va + seg;
+        uint32_t sum0, sum1, sum2, sum3;
+
+        /*
+         * Process the entire segment at once, writing back the
+         * results only after we've consumed all of the inputs.
+         *
+         * Key to indicies by column:
+         *          i   j                  i             j
+         */
+        sum0 = a[H4(0 + 0)];
+        sum0 = inner_loop(sum0, vn + seg + 0, vm + seg + 0);
+        sum1 = a[H4(0 + 1)];
+        sum1 = inner_loop(sum1, vn + seg + 0, vm + seg + 8);
+        sum2 = a[H4(2 + 0)];
+        sum2 = inner_loop(sum2, vn + seg + 8, vm + seg + 0);
+        sum3 = a[H4(2 + 1)];
+        sum3 = inner_loop(sum3, vn + seg + 8, vm + seg + 8);
+
+        d[H4(0)] = sum0;
+        d[H4(1)] = sum1;
+        d[H4(2)] = sum2;
+        d[H4(3)] = sum3;
+    }
+    clear_tail(vd, opr_sz, simd_maxsz(desc));
+}
+
+#define DO_MMLA_B(NAME, INNER) \
+    void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+    { do_mmla_b(vd, vn, vm, va, desc, INNER); }
+
+DO_MMLA_B(gvec_smmla_b, do_smmla_b)
+DO_MMLA_B(gvec_ummla_b, do_ummla_b)
+DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
-- 
2.25.1

