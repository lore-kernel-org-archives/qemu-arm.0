Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196907njb;
        Wed, 11 Dec 2024 08:42:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcLWlvV46TZW9fzql9HFPniQBtRAmFnHQe2hK8YzJ1m3UHRqjIGjabO3FUVUSjsImaK8O5dmArDdQTYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGXiUndTB6jdN8RB90uNShLicVqtYsjVBEuaTqeqEX7qqKkyqLJrEDeZE7U/UdZLEvB1jMx
X-Received: by 2002:a05:622a:5a0b:b0:466:a06f:ae0a with SMTP id d75a77b69052e-467961afe84mr359551cf.32.1733935350098;
        Wed, 11 Dec 2024 08:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935350; cv=none;
        d=google.com; s=arc-20240605;
        b=II9JMpgusZubrse+wwVucFtpDiDMS5BdP+nIkKkcCCHnbzDysLjw0c3pjTAZxy9tYI
         rd8b57ZJZu6c4zR9AL9YULt5jvQbeYxuFTxS69zuzJGG+8xLtZxEjl7hGu6L52c5P46/
         QOsKJGs3v54TBWAtIcT5llPElqMS6XcawSpoxENAvSzn56WfrX1rYkYccLjKoMoWeU7+
         hii3NrFwjL2DWZwgX5kRSEX5DwbwT7i+yCGGWgJ1+bgWnriKLJjgd+JKLUpPiAtpE1V1
         JS3LHjnbT1HVZYdw5WSgh7vYSeA9JsvfIGRoGu7fK4/g7VmvOJ6a0bCLXcGaaEg/Yijy
         1O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LP+xhFXhMSFpk8Idh6nMwcjag+1jgex/sd+PLnXhOns=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=kCTSSTsVDR9YiLoV+KqrSUIa0RuE4YgCHh+YhHLEXdioagnTadZHlh/PoZkS5x+cYS
         j0lldHif3oIk/blZs4+XFcBwcSlykbHXWG2E1faxqbhteDYa84Pvl4+n1pZh73Y3Wm2J
         4fmC6qqSEJcrDoVyHiXUqt38r6okfn/cw+mlO0y/fgpKHhgUeQk52AAop3slIJGLPFBX
         vWl1/D2Xtuv7MXA/ICh3sheBCmLajFBcNrRoeUJC8YlAdA0HHm/YShXhpCx+0hktQYOi
         4UHDPUjMKJVqtkhS9LZ1Jcs1wlpn/60Bq4F+5pAALN+hkIYWFNkSnu6WGM/DP4rZCBQt
         xZiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fge2gZYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4679473977asi3869911cf.478.2024.12.11.08.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fge2gZYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhS-0000Ml-JK; Wed, 11 Dec 2024 11:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhO-0008Lj-D8
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:30 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhM-0002BK-48
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:30 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-467918c35easo7319331cf.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934987; x=1734539787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LP+xhFXhMSFpk8Idh6nMwcjag+1jgex/sd+PLnXhOns=;
 b=Fge2gZYoPCJu+tUfmnRA+ywe2/svr0hxyCrzyXp9hcb6Eg07JF6vL3dAm3y5a0cPdk
 Atej0pbBjafeMRZGywe/mw7YzYVWuUNZL42NhqrWgtDtx/RdjucWYCfgvMFVn3TvuuYK
 G4ylU3oLbSglRganyiUq4OUbsvvG73EyxaZ9duotLB+0aSDLB308frN0PZadUtChh3td
 aP9xYXOp/dchYAoFHhSUyShWdjNiUzZ+0qYEN6a+/dmM/hSVbUxCaWE0YRkcShoOpewT
 k99PRiaRWs68GGhCcJkFm2Stsm3KOtgyMe44/BJaCbFZgyq7LnF7kfaoX2yiyyk339fK
 egVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934987; x=1734539787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LP+xhFXhMSFpk8Idh6nMwcjag+1jgex/sd+PLnXhOns=;
 b=I/cAtxaXkNYNXT+6E/PBcFLzZkyHCjI6bNj7GIaNxschsxlg6Aop0l5ESrMevXA9aI
 0bbuJueQpLzEPqCFWIwJXvmVlBC1Qu5E+PJ2/pOMguySrRSNijbQdfzrNRvKDXhD5KNd
 S00ZfsX6kQiKhqilp9PVyzD2yDKaF4lcMmOCWg96HOZ+SoI2mguKb44cS4vrYRFdMWbR
 9j5FxRbeY28u+yXHuVqn7/xWOOoGymN7Pq7g/ydDY3pT9C5YwtI0iVo8kFEeHhjQQrPN
 ibmtXYzcGXDwj3iW2/pl/cthXlrmUOKNfq1lvwApfDKH5iltq9qRbgeH4LbtRLSg19RY
 mPdg==
X-Gm-Message-State: AOJu0YyDQ7FiqAaohur6+xDH6mM4orS+x+GsR7RIqQWDx/vuBR4ivFyD
 j332U5nvUfmXlI6EVchhoKLn2Q+5jdfXskkP6t9zL1JXDi6ywLqje+0RUIem30MDD1zhOOnpWeK
 Us3yrecSp
X-Gm-Gg: ASbGncvjZMdP/wiDENWn7LsPbyEgA7nBA5gBO+xymCoTKCTwn/I59RYKgFTCRPYgB/N
 FYmZZCSU7nz/Hs+kX9xGs5n0K/WsF0AAepOqovkEwx1TrT2GUNV1F/h+V6RoOaoq/ukwhyAV7QN
 C+ELaiIhffY5/Hzbr7xxxChcYhLh0liX3BWWYuY9ryzRocIH2QDGy5DkCyPQXMrY+ZUMdSWv38V
 /Q4ZAPPTsxPMVUAisAobSmHCuSmPwj2H7tuzjWXg6IZ0iH0MsdTgo4TiiyNwA==
X-Received: by 2002:a05:6214:246d:b0:6d8:a64d:da51 with SMTP id
 6a1803df08f44-6d9348d2129mr62615956d6.8.1733934987021; 
 Wed, 11 Dec 2024 08:36:27 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 49/69] target/arm: Convert XTN, SQXTUN, SQXTN,
 UQXTN to decodetree
Date: Wed, 11 Dec 2024 10:30:16 -0600
Message-ID: <20241211163036.2297116-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zCgY7msT4oIu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 153 ++++++++++++++++++++-------------
 target/arm/tcg/a64.decode      |   9 ++
 2 files changed, 102 insertions(+), 60 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0e8e867058..7b76945b0a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8921,6 +8921,62 @@ TRANS(CMLE0_s, do_cmop0_d, a, TCG_COND_LE)
 TRANS(CMLT0_s, do_cmop0_d, a, TCG_COND_LT)
 TRANS(CMEQ0_s, do_cmop0_d, a, TCG_COND_EQ)
 
+static bool do_2misc_narrow_scalar(DisasContext *s, arg_rr_e *a,
+                                   ArithOneOp * const fn[3])
+{
+    if (a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        TCGv_i64 t = tcg_temp_new_i64();
+
+        read_vec_element(s, t, a->rn, 0, a->esz + 1);
+        fn[a->esz](t, t);
+        clear_vec(s, a->rd);
+        write_vec_element(s, t, a->rd, 0, a->esz);
+    }
+    return true;
+}
+
+#define WRAP_ENV(NAME) \
+    static void gen_##NAME(TCGv_i64 d, TCGv_i64 n) \
+    { gen_helper_##NAME(d, tcg_env, n); }
+
+WRAP_ENV(neon_unarrow_sat8)
+WRAP_ENV(neon_unarrow_sat16)
+WRAP_ENV(neon_unarrow_sat32)
+
+static ArithOneOp * const f_scalar_sqxtun[] = {
+    gen_neon_unarrow_sat8,
+    gen_neon_unarrow_sat16,
+    gen_neon_unarrow_sat32,
+};
+TRANS(SQXTUN_s, do_2misc_narrow_scalar, a, f_scalar_sqxtun)
+
+WRAP_ENV(neon_narrow_sat_s8)
+WRAP_ENV(neon_narrow_sat_s16)
+WRAP_ENV(neon_narrow_sat_s32)
+
+static ArithOneOp * const f_scalar_sqxtn[] = {
+    gen_neon_narrow_sat_s8,
+    gen_neon_narrow_sat_s16,
+    gen_neon_narrow_sat_s32,
+};
+TRANS(SQXTN_s, do_2misc_narrow_scalar, a, f_scalar_sqxtn)
+
+WRAP_ENV(neon_narrow_sat_u8)
+WRAP_ENV(neon_narrow_sat_u16)
+WRAP_ENV(neon_narrow_sat_u32)
+
+static ArithOneOp * const f_scalar_uqxtn[] = {
+    gen_neon_narrow_sat_u8,
+    gen_neon_narrow_sat_u16,
+    gen_neon_narrow_sat_u32,
+};
+TRANS(UQXTN_s, do_2misc_narrow_scalar, a, f_scalar_uqxtn)
+
+#undef WRAP_ENV
+
 static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
     if (!a->q && a->esz == MO_64) {
@@ -8964,6 +9020,37 @@ TRANS(UADDLP_v, do_gvec_fn2_bhs, a, gen_gvec_uaddlp)
 TRANS(SADALP_v, do_gvec_fn2_bhs, a, gen_gvec_sadalp)
 TRANS(UADALP_v, do_gvec_fn2_bhs, a, gen_gvec_uadalp)
 
+static bool do_2misc_narrow_vector(DisasContext *s, arg_qrr_e *a,
+                                   ArithOneOp * const fn[3])
+{
+    if (a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_new_i64();
+
+        read_vec_element(s, t0, a->rn, 0, MO_64);
+        read_vec_element(s, t1, a->rn, 1, MO_64);
+        fn[a->esz](t0, t0);
+        fn[a->esz](t1, t1);
+        write_vec_element(s, t0, a->rd, a->q ? 2 : 0, MO_32);
+        write_vec_element(s, t1, a->rd, a->q ? 3 : 1, MO_32);
+        clear_vec_high(s, a->q, a->rd);
+    }
+    return true;
+}
+
+static ArithOneOp * const f_scalar_xtn[] = {
+    gen_helper_neon_narrow_u8,
+    gen_helper_neon_narrow_u16,
+    tcg_gen_ext32u_i64,
+};
+TRANS(XTN, do_2misc_narrow_vector, a, f_scalar_xtn)
+TRANS(SQXTUN_v, do_2misc_narrow_vector, a, f_scalar_sqxtun)
+TRANS(SQXTN_v, do_2misc_narrow_vector, a, f_scalar_sqxtn)
+TRANS(UQXTN_v, do_2misc_narrow_vector, a, f_scalar_uqxtn)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9546,38 +9633,6 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         tcg_res[pass] = tcg_temp_new_i64();
 
         switch (opcode) {
-        case 0x12: /* XTN, SQXTUN */
-        {
-            static NeonGenOne64OpFn * const xtnfns[3] = {
-                gen_helper_neon_narrow_u8,
-                gen_helper_neon_narrow_u16,
-                tcg_gen_ext32u_i64,
-            };
-            static NeonGenOne64OpEnvFn * const sqxtunfns[3] = {
-                gen_helper_neon_unarrow_sat8,
-                gen_helper_neon_unarrow_sat16,
-                gen_helper_neon_unarrow_sat32,
-            };
-            if (u) {
-                genenvfn = sqxtunfns[size];
-            } else {
-                genfn = xtnfns[size];
-            }
-            break;
-        }
-        case 0x14: /* SQXTN, UQXTN */
-        {
-            static NeonGenOne64OpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_narrow_sat_s8,
-                  gen_helper_neon_narrow_sat_u8 },
-                { gen_helper_neon_narrow_sat_s16,
-                  gen_helper_neon_narrow_sat_u16 },
-                { gen_helper_neon_narrow_sat_s32,
-                  gen_helper_neon_narrow_sat_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0x16: /* FCVTN, FCVTN2 */
             /* 32 bit to 16 bit or 64 bit to 32 bit float conversion */
             if (size == 2) {
@@ -9618,6 +9673,8 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
             }
             break;
         default:
+        case 0x12: /* XTN, SQXTUN */
+        case 0x14: /* SQXTN, UQXTN */
             g_assert_not_reached();
         }
 
@@ -9653,22 +9710,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x12: /* SQXTUN */
-        if (!u) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x14: /* SQXTN, UQXTN */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_2misc_narrow(s, true, opcode, u, false, size, rn, rd);
-        return;
     case 0xc ... 0xf:
     case 0x16 ... 0x1d:
     case 0x1f:
@@ -9742,6 +9783,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x9: /* CMEQ, CMLE */
     case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
+    case 0x12: /* SQXTUN */
+    case 0x14: /* SQXTN, UQXTN */
         unallocated_encoding(s);
         return;
     }
@@ -9939,18 +9982,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
-    case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-
-        handle_2misc_narrow(s, false, opcode, u, is_q, size, rn, rd);
-        return;
     case 0x13: /* SHLL, SHLL2 */
         if (u == 0 || size == 3) {
             unallocated_encoding(s);
@@ -10142,6 +10173,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x9: /* CMEQ, CMLE */
     case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
+    case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
+    case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f3488766b2..295329448f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1642,6 +1642,10 @@ CMEQ0_s         0101 1110 111 00000 10011 0 ..... .....     @rr
 CMLE0_s         0111 1110 111 00000 10011 0 ..... .....     @rr
 CMLT0_s         0101 1110 111 00000 10101 0 ..... .....     @rr
 
+SQXTUN_s        0111 1110 ..1 00001 00101 0 ..... .....     @rr_e
+SQXTN_s         0101 1110 ..1 00001 01001 0 ..... .....     @rr_e
+UQXTN_s         0111 1110 ..1 00001 01001 0 ..... .....     @rr_e
+
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
@@ -1667,3 +1671,8 @@ SADDLP_v        0.00 1110 ..1 00000 00101 0 ..... .....     @qrr_e
 UADDLP_v        0.10 1110 ..1 00000 00101 0 ..... .....     @qrr_e
 SADALP_v        0.00 1110 ..1 00000 01101 0 ..... .....     @qrr_e
 UADALP_v        0.10 1110 ..1 00000 01101 0 ..... .....     @qrr_e
+
+XTN             0.00 1110 ..1 00001 00101 0 ..... .....     @qrr_e
+SQXTUN_v        0.10 1110 ..1 00001 00101 0 ..... .....     @qrr_e
+SQXTN_v         0.00 1110 ..1 00001 01001 0 ..... .....     @qrr_e
+UQXTN_v         0.10 1110 ..1 00001 01001 0 ..... .....     @qrr_e
-- 
2.43.0

