Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3791261dye;
        Wed, 2 Jul 2025 05:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKDTyHkc1ZXiZPkR1YRQjnaqmOaDeaexbog4hJUB43Q6izEWBYndQXGyBv3i/wUcDqju9FP1kgHojKuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGjuBQLl0YClj7Q43MdE4kI0pnV7LJHynmNV9HEmPqYhX4ZUqVO9YDr5bm3wc4NTg+nA8iM
X-Received: by 2002:a05:6214:2a4f:b0:700:bc46:5355 with SMTP id 6a1803df08f44-702b1be8784mr43719476d6.28.1751461195040;
        Wed, 02 Jul 2025 05:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461195; cv=none;
        d=google.com; s=arc-20240605;
        b=GY2oUunaCOxQ0xgcyy2ZIj7kX8h8G4RJQTPi1ViBX8L81XBTKGbTKTKLgytqNFRKcq
         TqQ5QlKCk2OTvKA1bkDJ0W7wXoMpZ4j81inXKHVIeU1kiSCaoYKk/xW6jNE58KOmE4Ca
         gYHC9WXiqsKzwG+9bvXU/0fCZRBKCwBIiNUknX2fFMw7pBYUH+J/reLaYYLZ+/qMWaY3
         xDEp6z2jJyEUcsf3EtX098/6fvrLn9SkLGHBCefd8uehz2mKSnFR8MIQEpzmvvXsaPtS
         4oA5Fzlm5m3rW/x6wO9TRwC0rc3zNfhtij4D/AfmrTLEISJHgZWsNP1TwOiwZ5+1ta1V
         D/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AQf/TObpoRHlubh31JKaROZXrhMyeMqBNp1Pj+KLbEk=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=ebGerEVpgWjQmB7OsiRPqQqNnlQFyJFAyRA7qTbdeKgQy1wnc/JcltRF1ZGWRmcII9
         8PFj2KnQyaFnhJdqxNbaGHop3/rtXmHx0JeXyUkPXjJLKR8APlK6hZCvyPdez15anqK9
         2McguFGeuj5TV7WkayVXKRNxGza4OGycjhGnQAnXU2J/hbA531+PYghAF3/9GBvZtAzl
         lFEPTCrWRAlVnMWu+gqEHhjCd6oGpz9AuJZiH5/RCoa9C0PPM7GI2Er7aEYqpPkVTGST
         Ot0jXE11tVrs6N39DAc+8XqfJc5T3EGJIxWSg+L1ovusZ6avL6/GsAIkNkuODX3GH1MA
         b1og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UfXZI1/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7728725csi153114556d6.13.2025.07.02.05.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UfXZI1/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwha-0001na-JM; Wed, 02 Jul 2025 08:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg5-0007vQ-OR
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:05 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfl-00013Y-Dg
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:02 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-60efc773b5fso3535122eaf.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459682; x=1752064482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQf/TObpoRHlubh31JKaROZXrhMyeMqBNp1Pj+KLbEk=;
 b=UfXZI1/rLu4h0yp9//OiiWGtCfTl7ozxRH73T+nt6UCvy8wPoDwS1zdJaZjxe2y/8x
 s7urvzXxVTyps7YBb/9PIaLq251ZWjUI87xNIuBThVKQ8FtVDhAaX+Ui+Vk138wLi9RC
 xl6vaepB4vHQqgZ7659H7FVVxds5VT+bSkfl0pOQaswHtrBC9KGk1F4gdXU+6C2WOhqT
 AOsT2ghNyCJkEzMLp4mtewPSNOmC/wRvY9epTZnsovnW2jZRiC8OmsDbJgDWu8kjtddc
 5rB74xvg8du1/IHyF2wUCQpJqYAHNFb/WLNoxnSI9CW7ovRcKwm/YrqBeOaqOYfnMCrp
 QUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459682; x=1752064482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQf/TObpoRHlubh31JKaROZXrhMyeMqBNp1Pj+KLbEk=;
 b=Gs4Xsl5Tunn0Ii/T2zd4c5QEcVMOXKJhkQ7H6ksoeGYl6jEt4FUHzyv3UsVIFRAILd
 iR70fVj5QfzmirNl9ldrqIj7MQpTgIAR0qEiiK5mm4gr1deu7F2l2dGCnMv7KvYDOq/c
 pVy0yy6mRfzS6GMm/7hkZc4aZi2dnEB6u9wxFGS1fyz7uVPIFdYrTu3Vz3BaNSEEpEO6
 jN/V3N5j8qAIPSwbMaXrop0H6KplJUHwXykfTstVxr4iqdypyrdQnjbq6HlG9gRhvhzc
 pemYU1rGuuGSiAKCbVIcENAMn9jf1lcbch1ttNwduLr2JXC9kU7gLyr2tPhCFqGThavv
 q0GA==
X-Gm-Message-State: AOJu0YxXs6YL3FBWIxSqPq2e/FnE88MLqOJnTXviL1DK4BSYEVAf6wr9
 U9mn3tit2t0r/OadwTTej6l07VUX1vWY6ckqT4DKAMIA3ywiaPpMXrRhj/vWe7X8shClUAatuHz
 U0/3cV5w=
X-Gm-Gg: ASbGncuynw68jay2EssvjtJ7Re9b+fmrbq3t314q2CgWb+yJs3WsFQbQn/PhPHU1bnH
 WW2eHQg73Jb3XGBMYAQDtDtuPB2zmfbZtc+KTUZZXi2MZeiEX4ZpkPuCiMlwyz5NblA5uRBH77P
 4QXgrnIujpFNt8UL4H4d1AtxiP8TGRat1ykIz0OgfiEIMlxmQQU5EQ94wkg+78NU6TPWrzKIX/y
 WYRJ8dTYe/Ibtr1fIqOelpVPxaR91EiGPpnWhWXbXiBZz1YLACIdn16EUbC4ORzAkNeDKzrAAS2
 LmXo5OKjMjFBAVmPcRbfqQwx+P+yOJuShsRndNmSBI/ua4RX+QmH4mSNChY5cQtPemKKdg==
X-Received: by 2002:a05:6870:d394:b0:29d:c85f:bc8c with SMTP id
 586e51a60fabf-2f5c7be7b23mr1948709fac.36.1751459681993; 
 Wed, 02 Jul 2025 05:34:41 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 23/97] target/arm: Implement SME2 ADD/SUB (array results,
 multiple vectors)
Date: Wed,  2 Jul 2025 06:32:56 -0600
Message-ID: <20250702123410.761208-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PzYtrCgAcNKm

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 4bb880d9ef..aabdb96675 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -775,3 +775,33 @@ TRANS_FEAT(ADD_azz_n1_s, aa64_sme2, do_azz_n1, a, MO_32, tcg_gen_gvec_add_var)
 TRANS_FEAT(SUB_azz_n1_s, aa64_sme2, do_azz_n1, a, MO_32, tcg_gen_gvec_sub_var)
 TRANS_FEAT(ADD_azz_n1_d, aa64_sme2_i16i64, do_azz_n1, a, MO_64, tcg_gen_gvec_add_var)
 TRANS_FEAT(SUB_azz_n1_d, aa64_sme2_i16i64, do_azz_n1, a, MO_64, tcg_gen_gvec_sub_var)
+
+/* Add/Sub each vector Z[m*N] to each Z[n*N] with result in ZA[d*N]. */
+static bool do_azz_nn(DisasContext *s, arg_azz_n *a, int esz,
+                      GVecGen3FnVar *fn)
+{
+    TCGv_ptr t_za;
+    int svl, n;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    n = a->n;
+    t_za = get_zarray(s, a->rv, a->off, n, 1);
+    svl = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; ++i) {
+        int o_za = (svl / n * sizeof(ARMVectorReg)) * i;
+        int o_zn = vec_full_reg_offset(s, a->zn + i);
+        int o_zm = vec_full_reg_offset(s, a->zm + i);
+
+        fn(esz, t_za, o_za, tcg_env, o_zn, tcg_env, o_zm, svl, svl);
+    }
+    return true;
+}
+
+TRANS_FEAT(ADD_azz_nn_s, aa64_sme2, do_azz_nn, a, MO_32, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_azz_nn_s, aa64_sme2, do_azz_nn, a, MO_32, tcg_gen_gvec_sub_var)
+TRANS_FEAT(ADD_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_add_var)
+TRANS_FEAT(SUB_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_sub_var)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 8b81c0a0ce..a6dee08661 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -260,3 +260,23 @@ SUB_azz_n1_s    11000001 0010 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=2
 SUB_azz_n1_s    11000001 0011 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
 SUB_azz_n1_d    11000001 0110 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=2
 SUB_azz_n1_d    11000001 0111 .... 0 .. 110 ..... 11 ...    @azz_nx1_o3 n=4
+
+### SME2 Multi-vector Multiple Array Vectors
+
+%zn_ax2         6:4 !function=times_2
+%zn_ax4         7:3 !function=times_4
+
+@azz_2x2_o3     ........ ... ..... . .. ... ..... .. off:3  \
+                &azz_n n=2 rv=%mova_rv zn=%zn_ax2 zm=%zm_ax2
+@azz_4x4_o3     ........ ... ..... . .. ... ..... .. off:3  \
+                &azz_n n=4 rv=%mova_rv zn=%zn_ax4 zm=%zm_ax4
+
+ADD_azz_nn_s    11000001 101 ....0 0 .. 110 ....0 10 ...    @azz_2x2_o3
+ADD_azz_nn_s    11000001 101 ...01 0 .. 110 ...00 10 ...    @azz_4x4_o3
+ADD_azz_nn_d    11000001 111 ....0 0 .. 110 ....0 10 ...    @azz_2x2_o3
+ADD_azz_nn_d    11000001 111 ...01 0 .. 110 ...00 10 ...    @azz_4x4_o3
+
+SUB_azz_nn_s    11000001 101 ....0 0 .. 110 ....0 11 ...    @azz_2x2_o3
+SUB_azz_nn_s    11000001 101 ...01 0 .. 110 ...00 11 ...    @azz_4x4_o3
+SUB_azz_nn_d    11000001 111 ....0 0 .. 110 ....0 11 ...    @azz_2x2_o3
+SUB_azz_nn_d    11000001 111 ...01 0 .. 110 ...00 11 ...    @azz_4x4_o3
-- 
2.43.0

