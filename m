Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3804245dye;
        Wed, 2 Jul 2025 06:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfAu565DTuLKer1Y8KvlW//SYBuSKCgNb6gqS94p4TRef4AJb3v5LnJDipiZgzMpRRxCLj2QFJnmLcFA==@linaro.org
X-Google-Smtp-Source: AGHT+IGFzpbS0ZtCJ7TcFMrI8tm6TIgHFgOjU3cw17bCvRkJYb+qfzab4er0xZ5Zb3ZX7ePA2wTY
X-Received: by 2002:a17:906:6890:b0:ae3:a716:492f with SMTP id a640c23a62f3a-ae3c2c7fcddmr241622066b.61.1751462140983;
        Wed, 02 Jul 2025 06:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751462140; cv=none;
        d=google.com; s=arc-20240605;
        b=GD2XwrbPJm+W6fddTyIejoPKFnp7YN474i5ld9ZfK9duldRpggu9pdwdKGzwrZNMOm
         IOHzruR8bsI/xdlEf5U31OJ5sJRC6TRZK/rjiVxANozmZ+F9B1i/8DulXA9Hq2iK0nHl
         A6I+RTZuaSna5KWhxJx4sqCyI9l4aIMw3yKnDtPQ6JFUx0+za8W4+UsrDT5JWnQIIUre
         6H1TqNJFMmbAFtolN0SEkdYiPn3a269e6IH5OrMJ7OKfXqxs0u0X+GqoHAWeJc9GSuBe
         N0SkUMmgvbgKjq4E2qhKY9LCSNqCAUkvOVCgZ0RJVjrYyssy9h4+UekC1DCtr2gWj0SJ
         0Wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lr+1Q+4HQrkLwxVzhzbDGgM0JcjXpo7ZMJemC3MVnNE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Jm/Y9QWL2UBOZz1batGKiPATBpcVXqQvHvTS2+ImKc39lNyn0apn+woSlRAgudJvVF
         eh27ffr6gp+DfiqotVvasj9EzxsTr8v00/EdNlz+YWOxHgGQIHXk8eXwAadQ2vKM8iuv
         3hertVIdq0jHpPxC1whMbNz4WtSKTHaRpKY2QRT7cBeo+ue4vpnQEbftepxMnUErSzCc
         X464cmDyVBWBlwoYtbK63t7FshujNENboPZDcx08KQ0f5HT2viuUlfto3BJDro9Q+QkE
         MOBzWygeivCI6hzZf788b/ELlchfXGeneAMDkjIDcRVNL5vtSHXs0xh8NcAVTEQnFi6h
         nvsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiFPiaRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-60c8289313csi9881614a12.11.2025.07.02.06.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiFPiaRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwls-00065K-D6; Wed, 02 Jul 2025 08:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj8-00049D-UZ
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:16 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj2-00021W-Se
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:14 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2e9071e3706so2779109fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459885; x=1752064685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lr+1Q+4HQrkLwxVzhzbDGgM0JcjXpo7ZMJemC3MVnNE=;
 b=WiFPiaRYKFTyZ4zn5fB/fZfAk+iFRuXNjlsBZPYHq2gB+axRCsNLSdQZCUYZ8XQaye
 Hdog0RAiYRXnkuhPqV38XcW+x72TGwuk0cF5tkdZXHO5CywEQYyodJk6EJ1twvLuwud0
 L4fR7y4rc8GmIc4mZh3wdblR6SFy4N/VLX+NHEtJiUxFOaRWg7WOhRmXawxGUFguuGhw
 pPDLujQAyD7QlQv5GnwwchjqC5pCOLBYRo2kp8QaBoy8ftLy7DElUD0OLRzd0Bv09/ym
 /UL3m0dBj4QEJCAxQ96coqb+VziAqcBTyETNWtxrB6lPysgNvoDOIO6r17PLSEk8qhxs
 1V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459885; x=1752064685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lr+1Q+4HQrkLwxVzhzbDGgM0JcjXpo7ZMJemC3MVnNE=;
 b=uC1bVKglZr3PwRHIEOUwLEZ9iO0ckJk7HRZL6LFaU1ZjfUYV4EfYVXzT+cR3a9rRuc
 yykUmZdDEBdkUSFIU0i/cp9NzMppbijm/bmwHjKRta05XH+ASOOCMlf8r8qaYII8I6Nd
 3Pv5BUnR3HoojSPtZ9XU2tpxvSF90F8eOAFzBwRSl+XKOxo0EaxjraQUB9vkUOEmwkfx
 vadzPa9Jotz35GbtmcA8zmG8lYpsYFRnWpB6VTxHmIzvW9Ah53WZRMlIFG1suJyZN3BS
 2JiZ8SFGf6uMBMjGmfH8VladkstmsNTgO60h90F4VIYcr+eaBmtiBWJkyITPOjQCsK5G
 bHRw==
X-Gm-Message-State: AOJu0YyOc6u9XiB9nG1hYLOqRm8kfojdwo8X6ro2djJMCg5UUF0wrBd6
 hcN2DPYi+9UQP8FELnHCxYHmydXcS0e2UIOUiyY6UTD2KnlU8CG7uRqdY0ZdvI1wkoJUH50B3nJ
 WnknR6JI=
X-Gm-Gg: ASbGncsq+qabgvYJwo7obl1WuUkn3CpC+G28uuK11Zkn3MVivVN/4SdAOlubg3bBuC1
 vrhNrGA8AQM8DUjaJQyb5YpZA0WienGOameXLmB6V94WGcVRrBaNIc29EqK2gVIr1HkK+xNWxu/
 m6P0lCaKKxtqdGVXgZ9hFRI8Im8n+EPtADDDtY9OH8xTPY/2cs2CRay8rJIBkbnSo0dtgD6Y9Kh
 N1UMnHW9QFjeSmAI+ELLigBhB2Xeidw7MbIkoEGLIPmfqhi5W9/qiZYM2t8BY/IUpaM7iyupbnV
 915aAI/WdLdsxDGSHMjl5CjPYntGQDvWnz7B8tU3dRZ2Xwlk5qkofE8RujHABOgWW4ighw==
X-Received: by 2002:a05:6870:288b:b0:2d4:e101:13ec with SMTP id
 586e51a60fabf-2f5a8d3f1b6mr2038531fac.33.1751459883892; 
 Wed, 02 Jul 2025 05:38:03 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 41/97] target/arm: Implement SME2 ADD/SUB (array
 accumulator)
Date: Wed,  2 Jul 2025 06:33:14 -0600
Message-ID: <20250702123410.761208-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: 2s9c1A7wt1/L

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

