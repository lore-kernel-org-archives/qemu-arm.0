Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252677dyc;
        Fri, 4 Jul 2025 07:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD2JxRZUbaih1UWLNtk55YY7Fm08b+uugPgU/154r5J5sfWFmM+Fj2jpXpeJql6MUzPBuMqVYdFnLIaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHtVKcKoQxjmeLKjjC/gnZIaL/3Mjtu6fnWyKPC614nIliCK42xznet/C1w/0bqk5My4Rm+
X-Received: by 2002:a05:6102:cce:b0:4e9:c7c8:5dff with SMTP id ada2fe7eead31-4f2f2445888mr1545432137.15.1751639233425;
        Fri, 04 Jul 2025 07:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639233; cv=none;
        d=google.com; s=arc-20240605;
        b=FxgkTW+akcEtFAYxw7s6Hx4X08UsABaITVjwznkMyIDyLqofGmz1y2WmJ0VrQ0TpIQ
         jyvigVCKQeI5ZFF/NqdnCFnPsz5f+Pz5RYK1+hUckKRPf328d9ZlFALKJsTpRZUWE88r
         34U3hYWvMjv59cRdhe2MQ7uMFdIx+QkC1d+ZVSlDvVWlWi8i+xAKIWguK0LKMycdHVJz
         7GCZDiGPlu0JFKSwj8GufCXBMCaAwwLVorRyBIvwvAsLCJWB0+XPxrL4Bw3CfoQ4Uk+o
         Hq4Nv9DMYYHazcdMxHgkPPSVfTViPP5EIqZtTiBgFa5E9Xrq+2GXXXGx5km+RQ2lsEi6
         DYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hgAkAg7YJqGfUg4WhfoOWkT+HZptAFeo1x8ZSeNdF3g=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Syv5WxVb4IwJTbSA2+DFvqQJeb8ODNWFP9S/Or9xhZ3Ep13RW1X8v0MSmsy+z6YcB/
         hiHPuXMmXXPVXS0xosIpa6zamgiYEenh93vsQCuQbtcIKNsaWkizk+V8KqUpwqTCnh/m
         xwX3h8AmiyQYnUbAjVPx2CuSYpYGKgd6yQOdkvum4UWVz7jsG6wKFTWatz1ISBzd+4W9
         Ev75bzq7CIds6zHWhXuUP/gTF8/G59XsEKmnZxH6GJpbyHfQ56jxhwze85/zmrjQz34i
         azazp65ynH1+4tSR9penGBkaAr7vV9Eca6n8Ad/6GweUfHhmvpgfY7cSIPmOSXozMLZX
         zPbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhk+5QQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6b2603si776701137.302.2025.07.04.07.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhk+5QQ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLC-0002U3-5j; Fri, 04 Jul 2025 10:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIV-0005Rk-GC
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:51 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIT-00067l-Pu
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:51 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2e9a38d2a3aso1076797fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638907; x=1752243707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgAkAg7YJqGfUg4WhfoOWkT+HZptAFeo1x8ZSeNdF3g=;
 b=uhk+5QQ6H/vh6VjONSgQRcdVuM3mtU2NDpH0SG+C9AcMMqXRg6mb5+lgJWD4CaFxRS
 HSJwOVqfDPjO3kqiCDwd+qL8f98NQySuypzkqEuSnD+VFThnhkPD7Nxm9UxZPS+ke6FA
 ZXHK46Xwy4uOZ/dm+2/qCexm9CTjbvurTfx5YHJzWwBWhmOsiDTl/3KpOyA/7yYo0U7q
 2x52LcfElg6PxGb2jNuqRvi0Ggy3menmKnYijRv18FwbDk8xPcADsJlvicRa5Wc/xbyw
 nD8VtD7tekCVFuoKjk/vEU0BWMgxXTnpPx/FOC/pVZhn1qAVXfm0claUgSLa/JtULRm+
 DSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638907; x=1752243707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgAkAg7YJqGfUg4WhfoOWkT+HZptAFeo1x8ZSeNdF3g=;
 b=HzaAGD2YCMrjwen5YfcWJw8AivQF4tcsUPeNKd0Ret3f2Mh3wRqq3OfCuhaSj+5kdG
 u9hNG146+LtXtquG5Oe64m/mQB+aDOBYzxGELwL59TxA/ufimrBiwIVOTBbTVaunJKkZ
 Q6VAmNUFAc0KwrqyX41Ghrn27GfCLZ77e+Mlwz/m/dJSUPgBmb8kinopIJm3opcHSIyA
 I7qT1iJya5pXIAQtsMWhs1sPn9DOtvlxzueUZdh9gwZv/+tYbjTv19BBiXDDoVZcZyvr
 LWQ9Fhnzi48WHGj86fubs+9KGEelMpeXUdbj4IPqlXqKJel007UEiaBabjeVDZXKNyuR
 Q0nw==
X-Gm-Message-State: AOJu0YxYyWAbq5DBO2LwcAOeHin5WqbnkkVcBwO/dA6JzyhxVEQhgwuS
 VW2JB6UdRdJ68qi2e8bif9kkCifJfC56agwnvy7nEPj3O/VzA+62DCHqra1ikNUlU/gtFUb/Kbz
 Ucb5q9S0=
X-Gm-Gg: ASbGncvyFXUonCY22JsjZV6mLCvOPWflbl5ZxaXAcbNPJovT/2h0oFJxERXv9F5B2Uh
 ng7gUwRKFA7sR3kUeRBaRJx8Ric4kL/V0KTN2bjdiRpCPypCDK9xkr0P7whyyd8/tpZGBgRzJB4
 HJWUDmDucXQK0Kr4oesoYC1pf5a1QIYfAZ9vnDvBxR5OtAf8ur5bOnRitmAQb0m+uYW8/8pLUPR
 KCYiGJmE+zhyBwB296MMUt+aBBtes/8YqG7hvzEH1L4oHp7T4mzvthiXAH5xP98DyoGz5Hnuual
 ZlK6xbPWTnsCci5WtBLR3ueCtMQCBuh/uBY28YusEQa2XTi1y7Ok9bqUUhtyQ1Ngfl5P7GtjBOw
 q39QtcsY/we758qK0jIWlD8MOY0w4ZAYAo1jzk8p+KF3C+CmBANnjNvk5WdQ=
X-Received: by 2002:a05:6871:7823:b0:2f3:e087:6b08 with SMTP id
 586e51a60fabf-2f796c685bdmr1760676fac.24.1751638907369; 
 Fri, 04 Jul 2025 07:21:47 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 032/108] target/arm: Implement SME2 ADD/SUB (array results,
 multiple and single vector)
Date: Fri,  4 Jul 2025 08:19:55 -0600
Message-ID: <20250704142112.1018902-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4bKvr0dQZmqb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  2 ++
 target/arm/tcg/translate-sme.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 15 +++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a18d07540e..f974996f3f 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -643,6 +643,8 @@ typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 typedef void GVecGen4Fn(unsigned, uint32_t, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
+typedef void GVecGen3FnVar(unsigned, TCGv_ptr, uint32_t, TCGv_ptr, uint32_t,
+                           TCGv_ptr, uint32_t, uint32_t, uint32_t);
 
 /* Function prototype for gen_ functions for calling Neon helpers */
 typedef void NeonGenOneOpFn(TCGv_i32, TCGv_i32);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 0a6a10b63d..4bb880d9ef 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -745,3 +745,33 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
 };
 TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
 TRANS_FEAT(FMINNM_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fminnm)
+
+/* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
+static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
+                      GVecGen3FnVar *fn)
+{
+    TCGv_ptr t_za;
+    int svl, n, o_zm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    n = a->n;
+    t_za = get_zarray(s, a->rv, a->off, n, 0);
+    o_zm = vec_full_reg_offset(s, a->zm);
+    svl = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; ++i) {
+        int o_za = (svl / n * sizeof(ARMVectorReg)) * i;
+        int o_zn = vec_full_reg_offset(s, (a->zn + i) % 32);
+
+        fn(esz, t_za, o_za, tcg_env, o_zn, tcg_env, o_zm, svl, svl);
+    }
+    return true;
+}
+
+TRANS_FEAT(ADD_azz_n1_s, aa64_sme2, do_azz_n1, a, MO_32, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_azz_n1_s, aa64_sme2, do_azz_n1, a, MO_32, tcg_gen_gvec_sub_var)
+TRANS_FEAT(ADD_azz_n1_d, aa64_sme2_i16i64, do_azz_n1, a, MO_64, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_azz_n1_d, aa64_sme2_i16i64, do_azz_n1, a, MO_64, tcg_gen_gvec_sub_var)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 470592f4c0..8b81c0a0ce 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -245,3 +245,18 @@ URSHL_nn       1100000 1 .. 1 ..... 1011.0 10001 .... 1    @z2z_4x4
 
 SQDMULH_nn     1100000 1 .. 1 ..... 1011.1 00000 .... 0    @z2z_2x2
 SQDMULH_nn     1100000 1 .. 1 ..... 1011.1 00000 .... 0    @z2z_4x4
+
+### SME2 Multi-vector Multiple and Single Array Vectors
+
+&azz_n          n off rv zn zm
+@azz_nx1_o3     ........ .... zm:4 ...... zn:5 .. off:3     &azz_n rv=%mova_rv
+
+ADD_azz_n1_s    11000001 0010 .... 0 .. 110 ..... 10 ...    @azz_nx1_o3 n=2
+ADD_azz_n1_s    11000001 0011 .... 0 .. 110 ..... 10 ...    @azz_nx1_o3 n=4
+ADD_azz_n1_d    11000001 0110 .... 0 .. 110 ..... 10 ...    @azz_nx1_o3 n=2
+ADD_azz_n1_d    11000001 0111 .... 0 .. 110 ..... 10 ...    @azz_nx1_o3 n=4
+
+SUB_azz_n1_s    11000001 0010 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=2
+SUB_azz_n1_s    11000001 0011 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
+SUB_azz_n1_d    11000001 0110 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=2
+SUB_azz_n1_d    11000001 0111 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
-- 
2.43.0

