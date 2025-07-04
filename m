Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1263480dyc;
        Fri, 4 Jul 2025 07:45:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYUN9PAZiypZ4bFMdVpZbCRfPR027js7dGlh40HRXoR8t4Nyie42TUWPm7Pw+r6fatbeqeglgJ4IOgjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFa3A2YE5dj6RW/Q7rfxIiIihaby3qjXJ7gchNwA6hijOf4O+ZxYCjaw6sWTbnlGb0lOct5
X-Received: by 2002:a05:6102:94e:b0:4e6:dbbc:16d0 with SMTP id ada2fe7eead31-4f2ee1d450cmr2318678137.14.1751640322146;
        Fri, 04 Jul 2025 07:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640322; cv=none;
        d=google.com; s=arc-20240605;
        b=VfJNdCZuzrLZMYsD4FkGiiGEgz2pX6FSw8IJKb4Py1N7SEetbaVFv1EmfcSugin9X3
         82GV5aFXZg91esT2Ux9ENtHWJ6+IlFu+P26bcUvz16o2wwiS2DH47eewaBDnFtYXjgbm
         9fxzn1gtYlajDkZzJQpI+XV+Ct3X59BMJ+gFU2zU3f0lkTMkSnZB3z65DaGGi1RQiFRw
         oPzz2D9wrrCAPGhccsHe/snURfoEjpWCy+G5k9IKM0C8k2lNpbxMS4mvX4GX1wwTYy1i
         OmxMUNKXrwgyyRT47idcSUGdlFuQTPv47sRrDYpT6IJ59CnTNvFNEJeZePUAUgMk+41E
         4b7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/wIP0g8QImX1YU2+8fuv8jxqBGCPi7uC7BhVnJEvQgc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=PJ1kVhwjzUedFo04+5RnfxLh6776iWKvy9HhqqZqQYzidI32XavRcddbnOprHqwCAD
         keLmycTCol097MB9MCPMFRiPiTJlEnGI2t6x2SVq/QgWkLoT65oo8HVMm5gC5fI9ZO/4
         802oe4c5o3EaVbCam2U0L2WqXTFnHne0wCvI35kBeEv8GuPqE/3T3WKLeHaVY0xX3nrc
         x59TLUN0PjQPIgscJISfiV5DopHT7JOIoyyzPMYG5tvodUVo/mtDs4MhLDg4hJpLQXQW
         WiVBg4Rts8v5qZQv3BS40WXF0mtKwh/wE1Nbhrdf2U+Uw+pp535BWw/Oxee2tvAFs2y0
         DvpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zn1mM8CU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-886e93dee30si570302241.105.2025.07.04.07.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zn1mM8CU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhQ3-0003z3-Su; Fri, 04 Jul 2025 10:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLo-0003xj-7S
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:19 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLj-0007ug-Kr
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:15 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-73a9c5ccfcdso586501a34.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639110; x=1752243910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wIP0g8QImX1YU2+8fuv8jxqBGCPi7uC7BhVnJEvQgc=;
 b=zn1mM8CUMRRnSxSfkCMhizQwsPIX493v3Ke5Te7nfnFV7Tu2FqMoVz6K7Tdcq6MfJ2
 eaydvVACUx5IuTEFZ2YupEvrSiER4h6v2zYu77sb8HcxPEIMVwuDziTeG8GWxeV3Q/QK
 I5uCZ3LJz1qEm645nnc20iomOAM2QF/Uin6lseRYTyax+J9rtzy2/Ws/0nFeX/EdbPAW
 mRPLMWgA7lSEcUjF062M5bOf5JAZeuNpmC4hu3X+tOnQu2Wod82WJhl388zVKhn3n4Lk
 kDCLB8EO7mT3FqdtAexs/E2FSK3gJV/iDYDdi9uCSQiyGS96ZHw+UAYP1sx0CLZB7K58
 14KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639110; x=1752243910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wIP0g8QImX1YU2+8fuv8jxqBGCPi7uC7BhVnJEvQgc=;
 b=Uq8ZVHs2mp3cbVjjjz8LUAlBkc0lubs1V1BOO9Q/iRg+dRQtuM5WedLyQ5Se/GgdHZ
 qACWdV1k8N95H7APtV2h+Ph/kSElkc0lx4tdkYketHf+DlpLnY9qnZJhc4WewxD9pqyx
 YD2lWGdHDGkRGvCAiv2GjwVuM4trXtX+l96vBv4dc60ov71rp3yiXssrmXaY63U4ccpY
 rvVfsbSxahm3bZvcg2v46wzP3MAIgera2VyMnmHy3P1BBpHM5Je/fu9s74wD+P9GnD/p
 KL6mnYudx/LJPxYSqYu9o/5uwEEtULE0xb0G4iNWbGgXVvmpymPt8Kji2vp6YcjBD7Wf
 PbVg==
X-Gm-Message-State: AOJu0YxRJ5BIPwNmQNr8atG613JNvY5gzDpB5fZJruLemTujbC/40NmE
 lfMpAKq+wY1IE4BB2ys3NirD0TZqkTy89CmFHMGRhUYMHe6y/jPbfGojqr8fdLbmqClGqyTuMB8
 hekda0jA=
X-Gm-Gg: ASbGncvgfjKiQ/vZNZUnGpmDE3hItgz6oP00cKHLcxBEyU5F+jYmgctEi9JaDKeFkh4
 L97OfGdzhVlSSOpx0G0jmsdYy+BDrOzzKphFky9hS1ODVMKJdwIVmHxYsczSf1vHGLycJlEix+t
 RhjdJWkpTI4wdBT1kOyfEpeDf7Zp/qq4AdWZEMaSyQQT+ZB2fVGo1oy8hhSdLZOe6vFF41MAHrC
 Rw/lcU7vc5ftMhuXwGnMmACnYMKXKmjcdQ1c/4kQlgn1dOz9XQcYI37tbWWLghZV/nm/rG8XNOg
 ALUUW9uRmrJHJfGHNXfieHbELAaHNR1+wwM9ruLuHfhPD6zFCCFDI298PzLtM+TDD7NrG+NhA8p
 A5t2xxUOd4+nD0WIZgU0cIiQAaOjDS0v2WnMehCLtP9AJrAED
X-Received: by 2002:a05:6830:3494:b0:72b:b8b9:9cc1 with SMTP id
 46e09a7af769-73ca119d9b3mr2393673a34.5.1751639109829; 
 Fri, 04 Jul 2025 07:25:09 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 051/108] target/arm: Implement SME2 ADD/SUB (array
 accumulator)
Date: Fri,  4 Jul 2025 08:20:14 -0600
Message-ID: <20250704142112.1018902-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mXLOUoflexQp

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 28 ++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 664fdd86aa..4c3b9aa7d6 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -806,6 +806,34 @@ TRANS_FEAT(SUB_azz_nn_s, aa64_sme2, do_azz_nn, a, MO_32, tcg_gen_gvec_sub_var)
 TRANS_FEAT(ADD_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_add_var)
 TRANS_FEAT(SUB_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_sub_var)
 
+/* Add/Sub each ZA[d*N] += Z[m*N] */
+static bool do_aaz(DisasContext *s, arg_az_n *a, int esz, GVecGen3FnVar *fn)
+{
+    TCGv_ptr t_za;
+    int svl, n;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    n = a->n;
+    t_za = get_zarray(s, a->rv, a->off, n, 0);
+    svl = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; ++i) {
+        int o_za = (svl / n * sizeof(ARMVectorReg)) * i;
+        int o_zm = vec_full_reg_offset(s, a->zm + i);
+
+        fn(esz, t_za, o_za, t_za, o_za, tcg_env, o_zm, svl, svl);
+    }
+    return true;
+}
+
+TRANS_FEAT(ADD_aaz_s, aa64_sme2, do_aaz, a, MO_32, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_aaz_s, aa64_sme2, do_aaz, a, MO_32, tcg_gen_gvec_sub_var)
+TRANS_FEAT(ADD_aaz_d, aa64_sme2_i16i64, do_aaz, a, MO_64, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_aaz_d, aa64_sme2_i16i64, do_aaz, a, MO_64, tcg_gen_gvec_sub_var)
+
 /*
  * Expand array multi-vector single (n1), array multi-vector (nn),
  * and array multi-vector indexed (nx), for floating-point accumulate.
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 0badc8f9fa..22e2a68b1b 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -708,3 +708,15 @@ BFMLS_nx        11000001 0001 .... 1 .. 1.. ...01 1 ....    @azx_4x1_i3_o3
 FMLS_nx_h       11000001 0001 .... 1 .. 1.. ...00 1 ....    @azx_4x1_i3_o3
 FMLS_nx_s       11000001 0101 .... 1 .. 0.. ...00 10 ...    @azx_4x1_i2_o3
 FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
+
+### SME2 Add / Sub array accumulators
+
+ADD_aaz_s       11000001 101 000000 .. 111 ....0 10 ...     @az_2x2_o3
+ADD_aaz_s       11000001 101 000010 .. 111 ...00 10 ...     @az_4x4_o3
+ADD_aaz_d       11000001 111 000000 .. 111 ....0 10 ...     @az_2x2_o3
+ADD_aaz_d       11000001 111 000010 .. 111 ...00 10 ...     @az_4x4_o3
+
+SUB_aaz_s       11000001 101 000000 .. 111 ....0 11 ...     @az_2x2_o3
+SUB_aaz_s       11000001 101 000010 .. 111 ...00 11 ...     @az_4x4_o3
+SUB_aaz_d       11000001 111 000000 .. 111 ....0 11 ...     @az_2x2_o3
+SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
-- 
2.43.0

