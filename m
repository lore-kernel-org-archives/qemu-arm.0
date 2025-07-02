Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3710469qtb;
        Wed, 2 Jul 2025 05:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0MxNaWLOJWSpr3/6bvmGQ5aCfiaoBEG8mWqMWdA7p+OyAu15Nz/6IRcKTR8bINjn2xygiBJBguEp81Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEWrRlsD01VmI1d2wrtb+EUh6rb8m+rkayZvr0EkcqGb5GAni3oksHDzjNebd2EFK3HyDUd
X-Received: by 2002:a05:620a:4409:b0:7ca:cd16:b433 with SMTP id af79cd13be357-7d5c4718c73mr394030585a.31.1751460392753;
        Wed, 02 Jul 2025 05:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460392; cv=none;
        d=google.com; s=arc-20240605;
        b=OLHvOvBn2rF6yY84mQjCDuS5Z5f6KX5lS8E2O7DjYcxuUKcy8RxluaKaxncjWJGwvD
         Jls9t3sQK83PrHuPGT5AgiHpcYktc+LHGVr8wAj9e6aJHE8yrAPCCBZmL18kcxklGJEt
         vMVDY4hYOMjiBlhOK5rgPuLzZvzdxnOV9N3ask9oow3J2lbM0H4NBsma8z/qSSnW26bK
         7dB/0ZXdNBGI4OTXjVcaYzEVdz/V8+NKlydfJVckBH99Z6nAaUnVPoL0k+TjThrJ0v3g
         YDiEWYvd0nVjgIGJVWRLvq2BtdDhVqdI8Z2bXBlUj2tu3ZtkWXjfiIYt7ewGcqohXVvx
         Ho6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jfD7brFizp76W5ey2BEJuLnJue/+9RsnLtE1z9wY2gg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=cgcMD5RNzFSVvJUQKtfEVYrrBM8kOEgyZHqiBvwi8r3kDr+uNccMopzfUVfqcLHRtH
         Uuy5mIQVvuH0J7u5OgoA4OCfXfiSWlYP4dCSuh0YvL7nrPf+pUSXTNzNk1ePeZYDKfkj
         72j/A/YDcFkXy/iUVtQZhUuGwX93qjQJ3cQP149crYCp9vUL/6sQg+SBS6BSxBWcOgKf
         5UklCByT9YITr8UF+apj8ivDsf2ojsVV9/moZdmtAuhTYyneluvXStf7bC/L3zwDYBA5
         LnryeO8cG954da8FyF0i5KMMhzdXnzSGm1S2SI3mSanm7R4N3O+0LnW8DU+KCr1Ui+ha
         C2vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gS8Bu2rR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d45830901bsi719289385a.123.2025.07.02.05.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gS8Bu2rR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgM-0008MX-Sj; Wed, 02 Jul 2025 08:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg2-0007pm-1C
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:03 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfk-00013B-EI
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:58 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2ea35edc691so1680473fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459681; x=1752064481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfD7brFizp76W5ey2BEJuLnJue/+9RsnLtE1z9wY2gg=;
 b=gS8Bu2rR0oGJqPa5dM8JyM/C9OKLzVnlhP9BaxZR4NTGawqIVCNLYbFtG4hy9b9EqY
 H58gGJp1p+ob5XvULHaBaU1BKvgC9lPGc7yJWBMncLqGX/vAGWMRRyEhSt01ir086uWS
 H+z53cPYzBunB4VDuXMflq3PHA9iPLLohWDxLdzxS0BvOgx/9lIs5fK/z9nZ5uRwD6qC
 cbo/Dv4ns6Hawx00ufkJUCwvbOsZD8uHpDB7RyFv1/NcZLZlcCMPrNeDWNf0sBoEbiC+
 lum6ttiAEktaJVsH0MkL6gpcjkxRgXd5gkAWj7UToCneDZGOZpxhMeZ73dDWr9o/+obI
 kuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459681; x=1752064481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfD7brFizp76W5ey2BEJuLnJue/+9RsnLtE1z9wY2gg=;
 b=WjNhjd+99PPeWBXxGKYgzmNtjRXiy4mWWcbWDAeY+nlUl3O8+E66+EnJfJ+GMfxq8z
 lDnLL5K5998GXSIa00ghxEQz1M5UKRcIQq0eFEYHM+ZLCZLOeiRS9JFPeErT2+kPXh4c
 g0dtLofLDOYvTKiwXRjM6wljlhp5QemYVRVhmyzXk8PLD0yGCcuNzCRAJnwqIT0l8Q4k
 B261Ue5TCkVCcHKLVxz12IlYpsE4mN1T5P8iKfsxf0oEIkQVopv3wUgk36dXRBB6arGm
 5YFvvCzGH8Qy5Q4pmYV4K900bsmHQMVCm2VDI5m1PYBcoZuKpVN2qI3PLoyziuwojrZT
 V4Tg==
X-Gm-Message-State: AOJu0YxC4gDt4fvfgzt7dx+E2u94fdQgljKigXaFy4BHPPGwCAZq//rT
 0WnLIjX9qrdyIVPcmAGG4KYJWyTvegicoHji7gvvE/7C+zzg6rmxYQBA0vec3lss6bA=
X-Gm-Gg: ASbGncsRQyXfMSXOZnTIMCiq2fx27PX6uNGV1HmrbMKc+hE1Qf6jHhbsf7lN8cM1v50
 RKTBZ+i6YXVYI2Cs1x/mIJXQPBc/YoYIBti60meHft3YghIclh3DD2RKMEzlXWtNCF8zja8bhDV
 yjU/eunRh7QBCjoinX25UoNsF8bQ8G5EnyE9sy+pcNZiJwq3EoQ10WxvkFj4AB+ibUkymDSA5di
 CDE/JTzVwRFoj8u3aRRMcmyo7yssDnf/GsZ64EEsj+eL96doiyzfEbdfloN80NnnvmSBFXJ5Zzt
 QgxEt7WxRG6bhKoWoTVML5q1+ERzP0yFv3MXJ+/7oG8kGQY41Hw3L/Wn+/fQlT2CbNc0lMHvXtu
 oiwQx
X-Received: by 2002:a05:6870:1b15:b0:2eb:87a9:7fc1 with SMTP id
 586e51a60fabf-2f5a8d27727mr2046558fac.27.1751459680746; 
 Wed, 02 Jul 2025 05:34:40 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 22/97] target/arm: Implement SME2 ADD/SUB (array results,
 multiple and single vector)
Date: Wed,  2 Jul 2025 06:32:55 -0600
Message-ID: <20250702123410.761208-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
X-TUID: D089wPoBZ5Wg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  2 ++
 target/arm/tcg/translate-sme.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 15 +++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 1b29b958f3..acfc00be78 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -642,6 +642,8 @@ typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
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

