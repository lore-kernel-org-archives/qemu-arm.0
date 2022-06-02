Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5221935lfh;
        Thu, 2 Jun 2022 15:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7HuPkrCOeyX0sR6NParGSUknh4CB76D3/N9C2NexN54QNvjLoUXbyY22XhhRdVZ40+SFz
X-Received: by 2002:a05:622a:1304:b0:304:92fa:2423 with SMTP id v4-20020a05622a130400b0030492fa2423mr5617770qtk.304.1654209908993;
        Thu, 02 Jun 2022 15:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654209908; cv=none;
        d=google.com; s=arc-20160816;
        b=cdyk5G+/8NkxjlidSJNdJAXGMYyCtUXBs50zXzdcOUBp3eGPbzXOFQR0USIEH0wCMe
         oHx+pf3IjRAA/3fxhTVXMMDEMqKNjdMj2LeHWFoJlZ2fNZ7RiIVeKdP/lPuENHUwnLVE
         SmcIMZO4oWIFMFalRP02BSexNmPtDYt//ms0INHAoSTlZ4BzeTscZJoTxrwt7PVREASu
         VHfgtnIYXuCtQT7T00wWRBbGKnCg/NRZmgETU+XRTBFgjLCvuLCd2HIyM7ROUA/dkl1V
         962xgh+OadI39KDa8srGym998IrZlq3SJUuloxO7tVAg+kFX7cy8EzM9mPqTtbyCxreC
         bi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5Y6c86S49EQ/11CGVeXxn3v5RBBipyfm3CtBQLEKQtA=;
        b=lq6zx1xZ98W2MJxBs8L66mQZJp0zEEEFIA1GdFPXJNnKrF/5ozORdOM0PvG/rb7OPB
         8/XHd+Dzt0an2bizUL2u5xHQNKmkZElBoHeVeOit7mx1qdE/9vS7tqr8cha5wtnFNA8X
         wB5RPE6zx9YO07NbHOI5fMTEUXe7cDHVCwYwPeEhb4pRr9u3HjGFD3mDpl77YqcVOiK6
         ogrsHF8qmUjN/M7Vnv6OiKybdsmu3lmPRvHRvAHVRh3mn7xAw1lDd2dypwiUVtjRnWmu
         j4UpqLqhrp9/kPxt1s0OKuyTY8iWOs+Au5ayx38TyQ3iNiPvoH91+LY0Z+2622GhPcLD
         8TRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlNUVBJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz12-20020a0562140e6c00b00464557eb527si2333028qvb.240.2022.06.02.15.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlNUVBJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtYy-0005BS-FR
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0001dK-Fk
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskH-0000vt-Nh
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w21so5850188pfc.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Y6c86S49EQ/11CGVeXxn3v5RBBipyfm3CtBQLEKQtA=;
 b=mlNUVBJ10G63GYtD4IxlLZ66HnnEGG5SFgKRx2AagAlDe87hZwjtvMn26iJX78skTh
 MylgRYQcSVqGUG04CIqoUJJCwpQ7IXbYa32c43vP6JNyta23a3kAISqAsT2SocFxov86
 jiOm+3rJDsVjjBlSnVgEda3LpD10jgUcXQHgBrL5aJ/P6zGDs1qo74dLLEtq3Zj98nQo
 otRA7mj5a0Z/m53KCPz8h5P93D0hfrxtD6HdWhuEmd9crrBRfzdKmA0IoDWamuqEYjpv
 3DexLj7eWLyBjhzbAJ4qu3KrjF0tzCh3/w9e4saGPXojnHb8MdL8JkfnTz3FwLpdKytC
 9xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Y6c86S49EQ/11CGVeXxn3v5RBBipyfm3CtBQLEKQtA=;
 b=gxxFPtwop6F50ZrMryAtYR7Ba2xWFwVp/ZoiDqxcFXmI3Qrj3rsLZ7JsPGFwCjbWUJ
 uYnkuvXIfKdnjzT2UhoXQz+3FJCIShM3Wc54gVCiKVNKIS2MSDYPocKU0OjX7HLfAzcR
 U1wMZgs0VBqpQug85Zqdd3nYiCInkgmv4PsrsJo4obLEN/eVt4Dd6y2X8BfsWR3+gSdQ
 aLQDng51wktlCsBeKNlFT0ZIAzI1uXEqRalObdsoHUd48xKoPIRrGnI1zti7xxB8Xn4P
 2z9wp4KHlKi/CL1BvqrVrkExEGn5oJIipbVn/I7Y50gMnJe4jsfH04644jN9WCdMmZqW
 QoOg==
X-Gm-Message-State: AOAM531hodAIhhkQCltp+p4gjTLN9RuGyi/egfxDSk5SUed2/bF3R7r+
 UMUFGAyVgrwcIPK1WNZ79447TQ==
X-Received: by 2002:a63:f455:0:b0:3fc:e1c1:bf10 with SMTP id
 p21-20020a63f455000000b003fce1c1bf10mr4387956pgk.467.1654206763515; 
 Thu, 02 Jun 2022 14:52:43 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 56/71] target/arm: Implement SCLAMP, UCLAMP
Date: Thu,  2 Jun 2022 14:48:38 -0700
Message-Id: <20220602214853.496211-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IuVx2p0SgJ7E

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  18 +++++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c | 102 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  24 +++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5bca7255f1..f9bc4b29b4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1017,6 +1017,24 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_sclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_uclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d1e229fd6e..ad411b5790 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1695,3 +1695,8 @@ PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
                 @psel esz=2 imm=%psel_imm_s
 PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
                 @psel esz=3 imm=%psel_imm_d
+
+### SVE clamp
+
+SCLAMP          01000100 .. 0 ..... 110000 ..... .....          @rda_rn_rm
+UCLAMP          01000100 .. 0 ..... 110001 ..... .....          @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1129f1fc56..40c5bf1a55 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7438,3 +7438,105 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     tcg_temp_free_ptr(ptr);
     return true;
 }
+
+static void gen_sclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_smax_i32(d, a, n);
+    tcg_gen_smin_i32(d, d, m);
+}
+
+static void gen_sclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_smax_i64(d, a, n);
+    tcg_gen_smin_i64(d, d, m);
+}
+
+static void gen_sclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_smax_vec(vece, d, a, n);
+    tcg_gen_smin_vec(vece, d, d, m);
+}
+
+static void gen_sclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_smin_vec, INDEX_op_smax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_sclamp_i32,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_sclamp_i64,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(SCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_sclamp, a)
+
+static void gen_uclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_umax_i32(d, a, n);
+    tcg_gen_umin_i32(d, d, m);
+}
+
+static void gen_uclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_umax_i64(d, a, n);
+    tcg_gen_umin_i64(d, d, m);
+}
+
+static void gen_uclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_umax_vec(vece, d, a, n);
+    tcg_gen_umin_vec(vece, d, d, m);
+}
+
+static void gen_uclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_umin_vec, INDEX_op_umax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_uclamp_i32,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_uclamp_i64,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(UCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9a9c034e36..f59d3b26ea 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2690,3 +2690,27 @@ void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+#define DO_CLAMP(NAME, TYPE) \
+void HELPER(NAME)(void *d, void *n, void *m, void *a, uint32_t desc)    \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {                        \
+        TYPE aa = *(TYPE *)(a + i);                                     \
+        TYPE nn = *(TYPE *)(n + i);                                     \
+        TYPE mm = *(TYPE *)(m + i);                                     \
+        TYPE dd = MIN(MAX(aa, nn), mm);                                 \
+        *(TYPE *)(d + i) = dd;                                          \
+    }                                                                   \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                            \
+}
+
+DO_CLAMP(gvec_sclamp_b, int8_t)
+DO_CLAMP(gvec_sclamp_h, int16_t)
+DO_CLAMP(gvec_sclamp_s, int32_t)
+DO_CLAMP(gvec_sclamp_d, int64_t)
+
+DO_CLAMP(gvec_uclamp_b, uint8_t)
+DO_CLAMP(gvec_uclamp_h, uint16_t)
+DO_CLAMP(gvec_uclamp_s, uint32_t)
+DO_CLAMP(gvec_uclamp_d, uint64_t)
-- 
2.34.1

