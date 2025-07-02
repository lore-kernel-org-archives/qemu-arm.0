Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3706712qtb;
        Wed, 2 Jul 2025 05:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWns5zRB+A8Z4ZkR6NVErNOpliNQ3fidlE7TKRSAH0YSxeFuCZHd9JsjmDN66cZDh9hhTWdwwu819SNNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGf41y1/6BQSsddGTYBr6ZyW/65Mnt0GcVtCLXRBFwnBFFYbIBmLBHXprudh8BUmft91ar2
X-Received: by 2002:ac8:6f15:0:b0:49d:89bf:2982 with SMTP id d75a77b69052e-4a9769246d6mr49605191cf.17.1751459938949;
        Wed, 02 Jul 2025 05:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459938; cv=none;
        d=google.com; s=arc-20240605;
        b=Kxg3sPJIY70oGu9ID0q7K9QUQPprx4PfCTj3bYSGlK23BsMA5KzFV9mNinv5wIzpyd
         QC9dYvbrmriW5fCwx5P7FPZp89YUf71Yst7uGg4+QDZJc3s04qmGBh3XN2ROJHrsmA2A
         qKwJv91bedW0r7as9JQzoLtwIJlwBg1/JLSbLbrivMD6RleAXxdfpAL5vKvkP3omY1XX
         YniSiWRulJz7USAOb8hyfp93yhMpaICt7D9aTyMG/gLAE73O2BzpCqmYEXW/tIx7XSgH
         KE9M0xz8FIBnmjBtwejreFiS/+MVB+qqstFM5ASju1OvYKwIxbpjLKhpaEtmivJ+Z3Hc
         WmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KSHykoMbntdKCV7ON1jZJaLFKnxkO6WGHgQsyobJ4D0=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=cKpyMrqxxWFGJyVij42A8f32JVDGkxS4r8rpvdNBJbC7uJ0J1K7+GHs/bh8s2ql/tT
         V7vlWZ+aysOLV3Ni03hIN+SGkCY5vhL4Ism2fNOxVLVXhV1na5L61Q9zuIByz3gfDm+Q
         H5MkHDKvXjTxlfGG1TriF0xTKqO6gJTMldSNC4H5WUS0/41S0uSdfFfbIkWdRBtGE8QT
         dm4abRm37q/oMw0pP/zplGtZvu+I2uvjxnbOsRR+n9sfkmyqP8obz8Vl/JJ0Fmb5/EOQ
         3gJPQUo2nyD+m8fj00Hu1ZlA29uUhvwLQ95R1Zv+yuR6Ch8+nSXsIlXc7NiVoD6lhXOw
         1eyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knxoyE1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57631asi122522291cf.620.2025.07.02.05.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knxoyE1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwhP-0001IO-NB; Wed, 02 Jul 2025 08:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgI-0008Gl-Ss
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:18 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg0-00017L-Dx
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:18 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2c6ed7efb1dso3180426fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459692; x=1752064492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSHykoMbntdKCV7ON1jZJaLFKnxkO6WGHgQsyobJ4D0=;
 b=knxoyE1ZrRD1U9QNvUIcvr5YqKQEzZTHLJ2+GqMYmiMLYzoakLf9jVILQf0Z1uaeiF
 0uc7n2uEW1x3h7Bp2jhUMTSPTybH2CtEFxxsVd042bTjNbxTr77A8QderPiaC/76T3wF
 zbcMtom4lHZ1SZmufJdaoyOI2OApecB7NoOlhkWj8ZETs8j3BZePyF829dcIsyouY5mi
 zuSZpzxc3F5rdK+r80lgAgz+rJKrFax8fn+LEoHofoB1Oiwxd1CdfoAqKVeXq4ZL11VH
 S8oBD7GWlyUws1q9Eu7HREGhwr+DHPZXu80crhLIX71GHmgm1r30isgxiH7av+XlPEaS
 hwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459692; x=1752064492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSHykoMbntdKCV7ON1jZJaLFKnxkO6WGHgQsyobJ4D0=;
 b=uTAhmCyvxyf2tBO66OTXUDrkb/WnpiB1JYex0KPsZ788AKVLs0XzKrU1p7wupKuUJB
 dtrFNEh++Ri4QHaJ5lBSbDaIVkIaoAQ2Iy3FH6G9Fqy7rT7oqHAc9UNGMFCUy7Rg/dMN
 Kv6ziewMF9zPsmrqdeY718HIyWXipJ817FlKCHAYTxdc0euxBKP9cRg4lKVXiGEIKN9N
 K8eYrSZjBjqmAEnR4dbkPA70GA47+QpPYaxHsBe7j7jqG7fkQoWDJCZNpPN5300P+V8D
 6SbmKftJcMRdG4kt9U2UrKnqxcNJrEI5G9dYl/6bpRAxToNbSqzcVJcaLVHmTTnAYezb
 GSGw==
X-Gm-Message-State: AOJu0YwiBBkkwPKceGLPVAF1qUgv31J7rciwHV5/w8thXru1bvvG6vaT
 kUPmTWeiqzbBXKehkxybym+tKrOFPPvs3bLHJVssvhtE6M33DTzn4ui3ODb8UeRvZ4+HR7q0U4I
 3jRgGjuY=
X-Gm-Gg: ASbGnctDNFaYHaTDUvugx9+QolKejl/ccqs0pZf5bXrngw64i1/MKk+43aaGxqhmYhK
 w/W/Do5IjnPD3K6Dz95uyeJC3E5zhAtJ1RI0cMoZjXJzZ3lnek7ZgnEPrmtBo7WdoFLD5xTJfej
 ZG7qBGBAFvD0SFRnX6MaQ7dVx7xVo1dVNfX0DeOLlYPeUYiWuhvmxwQbEUc0chISRxFy2WrLt2h
 zuBa2fXFfPG/YESMKRflaDJUw88w7lA1PTrqmkuPWviQXGcfm5/KYAD9mCwAQtsOOBehjp5A+0+
 Q1U8WNlVIo+ZEdhrjh4ogq0GjA29NOAFmiaqhgkMSWQy8KXON4PXWU4P6d3Ps5vjrxACzQAMca/
 uaiud
X-Received: by 2002:a05:6871:9d1e:b0:2d4:ef88:97af with SMTP id
 586e51a60fabf-2f5a8d27c9fmr2031716fac.3.1751459692318; 
 Wed, 02 Jul 2025 05:34:52 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 32/97] target/arm: Rename SVE SDOT and UDOT patterns
Date: Wed,  2 Jul 2025 06:33:05 -0600
Message-ID: <20250702123410.761208-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: 3iuIR99J19/R

Emphasize the 4-way nature of these dot products.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 12 ++++++------
 target/arm/tcg/sve.decode      | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 1564ee2558..56353b3bb4 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3412,18 +3412,18 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-TRANS_FEAT(SDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(SDOT_zzxw_4s, aa64_sve, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_sdot_idx_4b, a)
-TRANS_FEAT(SDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(SDOT_zzxw_4d, aa64_sve, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_sdot_idx_4h, a)
-TRANS_FEAT(UDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(UDOT_zzxw_4s, aa64_sve, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_udot_idx_4b, a)
-TRANS_FEAT(UDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(UDOT_zzxw_4d, aa64_sve, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_udot_idx_4h, a)
 
-TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(SUDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_sudot_idx_4b, a)
-TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(USDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_usdot_idx_4b, a)
 
 #define DO_SVE2_RRX(NAME, FUNC) \
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 5970ed9ac4..51847ea56e 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -851,10 +851,10 @@ CDOT_zzzz       01000100 esz:2 0 rm:5 0001 rot:2 rn:5 rd:5  ra=%reg_movprfx
 #### SVE Multiply - Indexed
 
 # SVE integer dot product (indexed)
-SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
-SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
-UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
-UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
+SDOT_zzxw_4s    01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
+SDOT_zzxw_4d    01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
+UDOT_zzxw_4s    01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
+UDOT_zzxw_4d    01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
 # SVE2 integer multiply-add (indexed)
 MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
@@ -873,8 +873,8 @@ SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
 # SVE mixed sign dot product (indexed)
-USDOT_zzxw_s    01000100 10 1 ..... 000110 ..... .....   @rrxr_2 esz=2
-SUDOT_zzxw_s    01000100 10 1 ..... 000111 ..... .....   @rrxr_2 esz=2
+USDOT_zzxw_4s   01000100 10 1 ..... 000110 ..... .....   @rrxr_2 esz=2
+SUDOT_zzxw_4s   01000100 10 1 ..... 000111 ..... .....   @rrxr_2 esz=2
 
 # SVE2 saturating multiply-add (indexed)
 SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
-- 
2.43.0

