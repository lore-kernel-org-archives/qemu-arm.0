Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4906851lfm;
        Tue, 25 May 2021 16:01:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynfg053rlHPzCw4KBbymF370tVub1ScoMe8mdvWIZu/YNyE3Dj/m15AabaoCjFCBxl4Aic
X-Received: by 2002:aa7:db94:: with SMTP id u20mr34145109edt.381.1621983682055;
        Tue, 25 May 2021 16:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983682; cv=none;
        d=google.com; s=arc-20160816;
        b=fh3RXdmWLESXLpCjgOURS0Rx8Xc1iafeGXQ2kySmpuK6BmI30TYgQPxG2QTWIEPs9f
         XZerUt7H7q62YP4kIqKJTDVFAWLCA/Gq68EFwfCJ5QHzFb8T0Tt2XpYVclpBboU1pXC/
         bSohUm2yN/U4fKvIA0+yWwAHN7EjU7ntT3Ad3MXl/liSPPU2om2JDWdA0oDTWwUWr8oh
         H1gU/MJqW/4fNm0u++uydcfmKMbngbeXalTSuTc1xroQ8o4ObJFyM7eeIUAF3NA2mVYW
         yIXN21ORtC+QixWThM94eYtJmMMrzQThDhXQGki7sakTsrse+JCenJXCZe2G86wpDgDd
         LF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MzWGJSozIBbfglC7WTEZiiQbdD24PRiuEVX0rE+xf2I=;
        b=OQ25ixaxi26nOcb+msxW3QfvhuSlsS/rFO9gcr0DIPQOe5SwNJtP/XJ26Q5ZQZ7gFz
         TbVDoOp4D1+SdGOS8ZSqOod4/awjkGPHfIn9Nacj6/hcaIO9kypQz8KjukP3Wk9x7Tca
         c9kJJ/YvGepHtK2344Cc7yZINS2g+tosNwXfhZSWZec6V1h75wtEu3GM7l4VACBBpNfX
         zDJn+dnUZm7/vqftiwgnISIf+99BrBZQ1VGCBpwWO+Cf7n0YxskG9MRrbOJU3Gb94oac
         Rjokz1qpKEzP2QYbNYyjh6Gwy91qwyeKG7NuwAei+bMMr/YPySnJ+HWGnH2zqAVCzM8+
         NDsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSAU7bT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cq22si15840149edb.134.2021.05.25.16.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 16:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSAU7bT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg36-0001X8-Vm
	for alex.bennee@linaro.org; Tue, 25 May 2021 19:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0X-0002w3-K1
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:41 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0H-0004qE-Lk
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id 29so12852448pgu.11
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzWGJSozIBbfglC7WTEZiiQbdD24PRiuEVX0rE+xf2I=;
 b=RSAU7bT1myypfKClb1iEVWrdjz4IJmRuO31kSm724tuTi5X4AyIcHC1szuzLFUz4QS
 nRhkdmEqXU6r2S/THqhgK66kNIkv57xCrFSDpjKjHbUeHCrPe7J109W3oJLtfut0GjaU
 OziN3lYx1t1zZ/aTIfao94pu1pJ/C6mGfeGaTotM3YATE/ANH5Wrc61x++paFPyfQb+s
 J4+s+AcIAI+0hW8MOT56vlGgDb0pV4kKBK9coXRUho2PwtTidaPLpnm2buICZ8vU1okZ
 EEeWXLDhY0gbrIvv6dIjp0KSPsYngp5jkjBAEiKWIav3LvxdMhipoSF97sBhG4kJPs3N
 3Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzWGJSozIBbfglC7WTEZiiQbdD24PRiuEVX0rE+xf2I=;
 b=rKK1ljnckSt3oB+ShA7hY4ywRN4+V7udG1YS67ybleF1UlQO1RVeOg0lS+24I5cFr/
 xAxEHwleNa9hBVc6y9zMKBEOwJgL6rpN7Oy+/5098F8HFFpyxYcPkSyNpuNDxpR3tZaO
 LVpsS4tPgsGqsp1wE/1mGdwz9hod3IOlksZl04Gz527MPGgn5jvZgr7313W0RkDi7jgo
 mjejE/LegpXNvg5y3CwRRDoBJ2ydKp9Ignz9wKo2xENJpQ7oqPxoctc4bOtuFyekkCla
 CyWSIb6nDcUR8jWUWaNPrI9cC4Jz8cUAtZOV1kBGyiUq1NzjPgR0AP8C44GIgZnlDn0o
 /0qw==
X-Gm-Message-State: AOAM531LM6f3do7oBPpX3qTH863eWzufd35wqun3CbO3LBLc2lB1osHe
 am/zAKssTCEUiO2qKdHa9kj/IQ==
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id
 136-20020a62148e0000b02902e4e5a57e33mr24155847pfu.9.1621983504399; 
 Tue, 25 May 2021 15:58:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] target/arm: Implement bfloat widening fma (vector)
Date: Tue, 25 May 2021 15:58:14 -0700
Message-Id: <20210525225817.400336-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVm7Gk1D+J/o

This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
and VFMA{B,T}.BF16 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  3 +++
 target/arm/neon-shared.decode |  3 +++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 13 +++++++++----
 target/arm/translate-neon.c   |  9 +++++++++
 target/arm/translate-sve.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c       | 16 ++++++++++++++++
 7 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index af75d7f25f..36b3c9dd2d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1010,6 +1010,9 @@ DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_bfmmla, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 4e0a25d27c..b61addd98b 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -70,6 +70,9 @@ VUSMMLA        1111 1100 1.10 .... .... 1100 .1.0 .... \
 VMMLA_b16      1111 1100 0.00 .... .... 1100 .1.0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VFMA_b16       1111 110 0 0.11 .... .... 1000 . q:1 . 1 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=1
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6c17898dee..5281164eea 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1627,6 +1627,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point bfloat16 dot-product
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9f8dae90ba..2a99e015ca 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12235,9 +12235,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_bf16, s);
         break;
-    case 0x1f: /* BFDOT */
+    case 0x1f:
         switch (size) {
-        case 1:
+        case 1: /* BFDOT */
+        case 3: /* BFMLAL{B,T} */
             feature = dc_isar_feature(aa64_bf16, s);
             break;
         default:
@@ -12331,11 +12332,15 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     case 0xd: /* BFMMLA */
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
         return;
-    case 0xf: /* BFDOT */
+    case 0xf:
         switch (size) {
-        case 1:
+        case 1: /* BFDOT */
             gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
             break;
+        case 3: /* BFMLAL{B,T} */
+            gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, false, is_q,
+                              gen_helper_gvec_bfmlal);
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9d227a1e13..4d0c2494dc 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -4135,3 +4135,12 @@ static bool trans_VMMLA_b16(DisasContext *s, arg_VMMLA_b16 *a)
     return do_neon_ddda(s, 7, a->vd, a->vn, a->vm, 0,
                         gen_helper_gvec_bfmmla);
 }
+
+static bool trans_VFMA_b16(DisasContext *s, arg_VFMA_b16 *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda_fpst(s, 7, a->vd, a->vn, a->vm, a->q, FPST_STD,
+                             gen_helper_gvec_bfmlal);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4f575dc334..ba8f5d7b7d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8689,3 +8689,33 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
     }
     return true;
 }
+
+static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
+        unsigned vsz = vec_full_reg_size(s);
+
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, sel,
+                           gen_helper_gvec_bfmlal);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_BFMLAL_zzzw(s, a, false);
+}
+
+static bool trans_BFMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_BFMLAL_zzzw(s, a, true);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 27e9bdd329..d82736b5e6 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2512,3 +2512,19 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
+                         void *stat, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    intptr_t sel = simd_data(desc);
+    float32 *d = vd, *a = va;
+    bfloat16 *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        float32 nn = n[H2(i * 2 + sel)] << 16;
+        float32 mm = m[H2(i * 2 + sel)] << 16;
+        d[H4(i)] = float32_muladd(nn, mm, a[H4(i)], 0, stat);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1

