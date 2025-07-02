Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3791073dye;
        Wed, 2 Jul 2025 05:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOKN9QA9OSSLWYb/IRKe1AtIw9i/gcX/iUTnhyFpom4IeUmUGx33+QBDQnktKpJn4cv+zw1iXoIdGZ6A==@linaro.org
X-Google-Smtp-Source: AGHT+IFxsVqRMsv8rGYmOyti2p2s9067OGMrhWXftAbIyW6ORsqpLCv7zB2S8vvX2cdBD8HBux3m
X-Received: by 2002:a05:6214:dcd:b0:6f5:3cae:920f with SMTP id 6a1803df08f44-702b1b376ffmr38483306d6.27.1751461172905;
        Wed, 02 Jul 2025 05:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461172; cv=none;
        d=google.com; s=arc-20240605;
        b=Br/pZdbkpZ0iXbcDXAvoA32zOOhdtycTvcrZdDHzm3XGViwAc74gLLxULLcZPEG0cq
         L0nljSz6ZpwZP38FYVZdBquWoAeiYWEKDVnlDbJhRN52h5veAjEKzte1CCDkj0cFZJJ6
         VHxRahXnKZLuox/ggv8mr+YJ/OwyQvfxE3icW4c0dDURaJt4QeyHL1HJI0Bh/IKWQFUv
         hGQ4CI7tl8zTpvIliC+QVfSIAB5pOxq8ESMDAnL+cyXDcZoWYqq/XbbBFKO3mxpTnNGc
         4CDhL4K3MHa5FTq5ipp5EtumfBtkKc1QTkNaXHYuiHmZyL7D766HupX3lpBe90aOXhyh
         79lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9JmrM0K8ZLfI+GER2A7TZLp0p7wKAFK1cAuaQ0BJ0Lc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=ch5f4HZP310IdvZZwbeWO5smdojPDI24s9eVb51ug6hCqpzzZMS+AOKh7XsDH10yFq
         /u3ZesyT//i0Q4lvkPuc2fffjOC22zrgeSysoXzBdKloTQb72JAFAhfgsgp06KUT/y6t
         hBPoE3cORpQFPfcxukiCaHF8Ef2WCgaSc7JwdOWWxqRcQdiOHoEmjI+sgRJXkVkirk23
         SjsO4wrh2OV5ojnJOo6Vmu1VGSk6aEOYL1OaGpShaeLpVCAHQmgo9kcrrYJuTyQk3gRf
         UnrcY8QdJb2bSWQG0hDHSNlMLBATQNVvleTiFYg+JRhpIDvJTN+xt2dNUdzzX9r+XAs8
         zbnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXpT690x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-700c4b9dbf8si89970066d6.334.2025.07.02.05.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXpT690x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwhe-00026o-84; Wed, 02 Jul 2025 08:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg6-0007vj-Ph
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:07 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfo-00014x-75
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:04 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-73af5dc0066so1561542a34.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459685; x=1752064485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JmrM0K8ZLfI+GER2A7TZLp0p7wKAFK1cAuaQ0BJ0Lc=;
 b=PXpT690xw5uMw6RYTynLoLYbBJrshmkVbrBy29jcw0hrellOvHXQIA4LFxZaFEdU9j
 9V6a7hGCC8SgtugOFoe4ZUCPkVuVRH0vQ3PQMTifZh7mLLC25E/6t5xc8Hze3AY0v02x
 wLGpmqWFTk0fEsWl8hM8gVOj4G2TLBq5TbOVVOxJA29JYUJ2TOcX1tjA5999KnqbDntI
 njPxaLpoieqxgeONl8NqzakMENFQnGzH3PA6CfsJ8qcAZ/nP+JqEzmZ9iYUnYqVqv3sU
 6j3dZoc4/NiyYBzq00f+7SYKMYR1z0YEO1BOWEZKHrPF+suCxfdub460erjbe5ri4K0A
 H19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459685; x=1752064485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JmrM0K8ZLfI+GER2A7TZLp0p7wKAFK1cAuaQ0BJ0Lc=;
 b=B06ynkBen2SXEb8z8OAQlTeiXrLw0rst6E2bSED2k2/b8SnmISF6j9BGNBVOTGkS0O
 l7ajMAZjJS0nUh4Dpjhs2aJbSbhfZbL5XRXus5EEfGUwtQBEG1X0AX0tVwfTjOKUsJ5L
 BF1WMsu4Q/6Mx8wQKZ2kT4tBszb3pXYBpQCRy11/lVANDyc1U1uvjVxDpLL03kXw/VwK
 4wSIk6mw040FjpIQ8BOJcga3XBXNiOCqNShsOXJWrsM8On36OqQBPqmNMD961MxPrqfO
 7asThr+t+quTnfZrjgBm9L5eCyHwE0knbm7HswKYxQML3Iq9G9nU034Upb6P4PRPLTcV
 HR3Q==
X-Gm-Message-State: AOJu0YxbrGfk+l8JM8Oe/ldzg7M9aPCdL1AIUl1VSCAEwC56AtSINAHF
 aDgBg9Iub5lEtvE3+SMVgeiaZKdWCefyfVQRt51mrIb085d5lpHTcq/AE6HMrt15Qj8=
X-Gm-Gg: ASbGncvLfRWWnS3GNaNXbfWycVaMPuw7PdAFGgoF58JG6VCnIwvOxuEX5G5Uqqg7FLJ
 +CeMt3xoOEATpmUUfU6ZSvT2qrY5Cy3wLb2r8ovz8jakua8SCmY50vNa0KDxyfu+8tzOEMKJcVR
 zohlOgruSlAUUX2f82JhSXYHkWgIXyb3ax64N22ISrdma6aSvuVKb8Rum3uR5YZ/fGuJ6or94JF
 yid4J136l4N8q261cxD/EEwSe0B03rJ4yUY0f58tViy1pDN+DnhDnv2xUa/flobFthtE7XaNXFN
 cm4mxoG6RarhKS019pceA9oZaSlkb0cM9xGIikBztABWmnuGPTz/f7/pE1NagG6HkwCObQ==
X-Received: by 2002:a05:6830:8206:b0:72a:1625:ef11 with SMTP id
 46e09a7af769-73b4ce34d95mr1825192a34.27.1751459685171; 
 Wed, 02 Jul 2025 05:34:45 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 26/97] target/arm: Implement SME2 FMLAL, BFMLAL
Date: Wed,  2 Jul 2025 06:32:59 -0600
Message-ID: <20250702123410.761208-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
X-TUID: M3LZovUIEr1w

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 98 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 71 ++++++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index aabdb96675..9ec02d960d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -805,3 +805,101 @@ TRANS_FEAT(ADD_azz_nn_s, aa64_sme2, do_azz_nn, a, MO_32, tcg_gen_gvec_add_var)
 TRANS_FEAT(SUB_azz_nn_s, aa64_sme2, do_azz_nn, a, MO_32, tcg_gen_gvec_sub_var)
 TRANS_FEAT(ADD_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_add_var)
 TRANS_FEAT(SUB_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_sub_var)
+
+/*
+ * Expand array multi-vector single (n1), array multi-vector (nn),
+ * and array multi-vector indexed (nx), for floating-point accumulate.
+ *   multi: true for nn, false for n1.
+ *   fpst: >= 0 to set ptr argument for FPST_*, < 0 for ENV.
+ *   data: stuff for simd_data, including any index.
+ */
+#define FPST_ENV  -1
+
+static bool do_azz_acc_fp(DisasContext *s, int nreg, int nsel,
+                          int rv, int off, int zn, int zm,
+                          int data, int shsel, bool multi, int fpst,
+                          gen_helper_gvec_4_ptr *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / nreg;
+        TCGv_ptr t_za = get_zarray(s, rv, off, nreg, nsel);
+        TCGv_ptr t, ptr;
+
+        if (fpst >= 0) {
+            ptr = fpstatus_ptr(fpst);
+        } else {
+            ptr = tcg_env;
+        }
+        t = tcg_temp_new_ptr();
+
+        for (int r = 0; r < nreg; ++r) {
+            TCGv_ptr t_zn = vec_full_reg_ptr(s, zn);
+            TCGv_ptr t_zm = vec_full_reg_ptr(s, zm);
+
+            for (int i = 0; i < nsel; ++i) {
+                int o_za = (r * vstride + i) * sizeof(ARMVectorReg);
+                int desc = simd_desc(svl, svl, data | (i << shsel));
+
+                tcg_gen_addi_ptr(t, t_za, o_za);
+                fn(t, t_zn, t_zm, t, ptr, tcg_constant_i32(desc));
+            }
+
+            /*
+             * For multiple-and-single vectors, Zn may wrap.
+             * For multiple vectors, both Zn and Zm are aligned.
+             */
+            zn = (zn + 1) % 32;
+            zm += multi;
+        }
+    }
+    return true;
+}
+
+static bool do_fmlal(DisasContext *s, arg_azz_n *a, bool sub, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                         (1 << 2) | sub, 1,
+                         multi, FPST_ENV, gen_helper_sve2_fmlal_zzzw_s);
+}
+
+TRANS_FEAT(FMLAL_n1, aa64_sme2, do_fmlal, a, false, false)
+TRANS_FEAT(FMLSL_n1, aa64_sme2, do_fmlal, a, true, false)
+TRANS_FEAT(FMLAL_nn, aa64_sme2, do_fmlal, a, false, true)
+TRANS_FEAT(FMLSL_nn, aa64_sme2, do_fmlal, a, true, true)
+
+static bool do_fmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
+{
+    return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                         (a->idx << 3) | (1 << 2) | sub, 1,
+                         false, FPST_ENV, gen_helper_sve2_fmlal_zzxw_s);
+}
+
+TRANS_FEAT(FMLAL_nx, aa64_sme2, do_fmlal_nx, a, false)
+TRANS_FEAT(FMLSL_nx, aa64_sme2, do_fmlal_nx, a, true)
+
+static bool do_bfmlal(DisasContext *s, arg_azz_n *a, bool sub, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                         0, 0, multi, FPST_ZA,
+                         (!sub ? gen_helper_gvec_bfmlal
+                          : s->fpcr_ah ? gen_helper_gvec_ah_bfmlsl
+                          : gen_helper_gvec_bfmlsl));
+}
+
+TRANS_FEAT(BFMLAL_n1, aa64_sme2, do_bfmlal, a, false, false)
+TRANS_FEAT(BFMLSL_n1, aa64_sme2, do_bfmlal, a, true, false)
+TRANS_FEAT(BFMLAL_nn, aa64_sme2, do_bfmlal, a, false, true)
+TRANS_FEAT(BFMLSL_nn, aa64_sme2, do_bfmlal, a, true, true)
+
+static bool do_bfmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
+{
+    return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                         a->idx << 1, 0, false, FPST_ZA,
+                         !sub ? gen_helper_gvec_bfmlal_idx
+                         : s->fpcr_ah ? gen_helper_gvec_ah_bfmlsl_idx
+                         : gen_helper_gvec_bfmlsl_idx);
+}
+
+TRANS_FEAT(BFMLAL_nx, aa64_sme2, do_bfmlal_nx, a, false)
+TRANS_FEAT(BFMLSL_nx, aa64_sme2, do_bfmlal_nx, a, true)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index a6dee08661..9850c19d90 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -261,6 +261,30 @@ SUB_azz_n1_s    11000001 0011 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
 SUB_azz_n1_d    11000001 0110 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=2
 SUB_azz_n1_d    11000001 0111 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
 
+%off3_x2        0:3 !function=times_2
+%off2_x2        0:2 !function=times_2
+
+@azz_nx1_o3x2   ........ ... . zm:4 . .. ... zn:5 .. ...    \
+                &azz_n off=%off3_x2 rv=%mova_rv
+@azz_nx1_o2x2   ........ ... . zm:4 . .. ... zn:5 ... ..    \
+                &azz_n off=%off2_x2 rv=%mova_rv
+
+FMLAL_n1        11000001 001 0 .... 0 .. 011 ..... 00 ...   @azz_nx1_o3x2 n=1
+FMLAL_n1        11000001 001 0 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=2
+FMLAL_n1        11000001 001 1 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=4
+
+FMLSL_n1        11000001 001 0 .... 0 .. 011 ..... 01 ...   @azz_nx1_o3x2 n=1
+FMLSL_n1        11000001 001 0 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=2
+FMLSL_n1        11000001 001 1 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=4
+
+BFMLAL_n1       11000001 001 0 .... 0 .. 011 ..... 10 ...   @azz_nx1_o3x2 n=1
+BFMLAL_n1       11000001 001 0 .... 0 .. 010 ..... 100 ..   @azz_nx1_o2x2 n=2
+BFMLAL_n1       11000001 001 1 .... 0 .. 010 ..... 100 ..   @azz_nx1_o2x2 n=4
+
+BFMLSL_n1       11000001 001 0 .... 0 .. 011 ..... 11 ...   @azz_nx1_o3x2 n=1
+BFMLSL_n1       11000001 001 0 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=2
+BFMLSL_n1       11000001 001 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -280,3 +304,50 @@ SUB_azz_nn_s    11000001 101 ....0 0 .. 110 ....0 11 ...    @azz_2x2_o3
 SUB_azz_nn_s    11000001 101 ...01 0 .. 110 ...00 11 ...    @azz_4x4_o3
 SUB_azz_nn_d    11000001 111 ....0 0 .. 110 ....0 11 ...    @azz_2x2_o3
 SUB_azz_nn_d    11000001 111 ...01 0 .. 110 ...00 11 ...    @azz_4x4_o3
+
+@azz_2x2_o2x2   ........ ... ..... . .. ... ..... ... ..    \
+                &azz_n n=2 rv=%mova_rv zn=%zn_ax2 zm=%zm_ax2 off=%off2_x2
+@azz_4x4_o2x2   ........ ... ..... . .. ... ..... ... ..    \
+                &azz_n n=4 rv=%mova_rv zn=%zn_ax4 zm=%zm_ax4 off=%off2_x2
+
+FMLAL_nn        11000001 101 ....0 0 .. 010 ....0 000 ..    @azz_2x2_o2x2
+FMLAL_nn        11000001 101 ...01 0 .. 010 ...00 000 ..    @azz_4x4_o2x2
+
+FMLSL_nn        11000001 101 ....0 0 .. 010 ....0 010 ..    @azz_2x2_o2x2
+FMLSL_nn        11000001 101 ...01 0 .. 010 ...00 010 ..    @azz_4x4_o2x2
+
+BFMLAL_nn       11000001 101 ....0 0 .. 010 ....0 100 ..    @azz_2x2_o2x2
+BFMLAL_nn       11000001 101 ...01 0 .. 010 ...00 100 ..    @azz_4x4_o2x2
+
+BFMLSL_nn       11000001 101 ....0 0 .. 010 ....0 110 ..    @azz_2x2_o2x2
+BFMLSL_nn       11000001 101 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
+
+### SME2 Multi-vector Indexed
+
+&azx_n          n off rv zn zm idx
+
+%idx3_15_10     15:1 10:2
+%idx2_10_2      10:2 2:1
+
+@azx_1x1_o3x2   ........ .... zm:4 . .. . .. zn:5 .. ...    \
+                &azx_n n=1 rv=%mova_rv off=%off3_x2 idx=%idx3_15_10
+@azx_2x1_o2x2   ........ .... zm:4 . .. . .. ..... .. ...   \
+                &azx_n n=2 rv=%mova_rv off=%off2_x2 zn=%zn_ax2 idx=%idx2_10_2
+@azx_4x1_o2x2   ........ .... zm:4 . .. . .. ..... .. ...   \
+                &azx_n n=4 rv=%mova_rv off=%off2_x2 zn=%zn_ax4 idx=%idx2_10_2
+
+FMLAL_nx        11000001 1000 .... . .. 1 .. ..... 00 ...   @azx_1x1_o3x2
+FMLAL_nx        11000001 1001 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_o2x2
+FMLAL_nx        11000001 1001 .... 1 .. 1 .. ...00 00 ...   @azx_4x1_o2x2
+
+FMLSL_nx        11000001 1000 .... . .. 1 .. ..... 01 ...   @azx_1x1_o3x2
+FMLSL_nx        11000001 1001 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_o2x2
+FMLSL_nx        11000001 1001 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_o2x2
+
+BFMLAL_nx       11000001 1000 .... . .. 1 .. ..... 10 ...   @azx_1x1_o3x2
+BFMLAL_nx       11000001 1001 .... 0 .. 1 .. ....0 10 ...   @azx_2x1_o2x2
+BFMLAL_nx       11000001 1001 .... 1 .. 1 .. ...00 10 ...   @azx_4x1_o2x2
+
+BFMLSL_nx       11000001 1000 .... . .. 1 .. ..... 11 ...   @azx_1x1_o3x2
+BFMLSL_nx       11000001 1001 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_o2x2
+BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
-- 
2.43.0

