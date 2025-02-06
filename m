Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1780602njb;
        Thu, 6 Feb 2025 12:03:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV18ppdUSC8u6KfvIdQZunDypBEG+2eaYmuuGlad10y8xS0W23obDsZTDNZ0EkBwYnVGjxJRut/M8fM0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH2hpqqZGRV+AzETiszzffIjHLw2+eeQkY9TMYk7sy044Xm3oU4CCNmDcgD78yuiITyIrf/
X-Received: by 2002:a05:6102:4b0d:b0:4b6:35c4:6fcd with SMTP id ada2fe7eead31-4ba85de8db4mr516152137.7.1738872185629;
        Thu, 06 Feb 2025 12:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872185; cv=none;
        d=google.com; s=arc-20240605;
        b=Yhwt5OKURw0Cd3aHWubCDt0pM+VevO2aDZKHrYKhXa38RbhVQnkNci+iRRXu2KNrfL
         g7ymkm+8Mbx+Yk6wAk9K+BGiMji5vgCiqseYcyH6ufqhPYZuPEFbTejHf9qId5EsnD4u
         rBqnWopVjjI/leN2stWkw23NJN7ceKmyn1L5dQHZGYElCflFiS6SKd+5HcctYzgOAonK
         JGI4zYWjsaCYuzonwLYIxkME1jriqkq+onhOsz4Q4H5OQ8VSaspNtri+a3TpTgPctM0u
         dLVBfkHYAMj6JBAQ+SmrgRd2ShSXm1PRGBBRNMrXWph3YRug3ssLnt9P3B3iZT/v6EfP
         5ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TQCjgYiJ38m/dRuOCrueWQOvHfQiGoL/F0IUorE2POg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=aXOv+aQ9F3/N7FpDTkayklKQXyMdNhVbGiubQLshp1vhtOqptHPkZk0ffOUjd33cd1
         IKqiZmIX3sec+j37Snqb8TX6Yqv6PlAmE0pAF0vSoFAE0/IjeSxTW7l6S7UV9/yLj9af
         fA+kteFWdPAoZIfLH0qnqhJwT9+wF4ki218Q5cAz5RBCPck8KFCBK3V/eDMrWo6hgNj+
         TtNu6C8uOijieeVliHFTL4WQdh1z1xpE+RdjwI7VY2i8aQYxXQTOsgVta8BqrXS+N+z6
         zUzPg8wAjgZr5TbcFGOozigv11w1xfoOK+RW8SOq0hbWtm5MuEbRW1Tbuub9mYD81XuG
         mqYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQIBIpcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba77861caesi427187137.292.2025.02.06.12.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQIBIpcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80t-0008Is-CA; Thu, 06 Feb 2025 14:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80P-0007Ij-JW
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:45 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80K-0000Zy-Sw
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:45 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fa0892f9bdso1736413a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871858; x=1739476658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQCjgYiJ38m/dRuOCrueWQOvHfQiGoL/F0IUorE2POg=;
 b=bQIBIpcR5BQBU7pmWcM/u2DNZD68+t4gdm6IVWIqLKE77pcqLs1XmkcH3iW/luRmhP
 J3a3dUez9HODzATjsFkmsdmT9hfkw8cUmzgjZhXlyUTpBXrXKJn+AxcFKLerkPsaf8oE
 1sPO5ljQI4/WwpTGZzhw7Nu0u8VFMI/3QPJX2MXo488gNQ+lRJnmPJI1EKad9rb789aA
 WbBobEWeRBmXfRjKjSAvf5fySEv2y8CswR8MTVLxVF14xTd0jD/rrJIOpZClflQkrRm0
 +hZ/+NI1mqYArNLSqKjL3e9P5eNlGv2SSD8A28UoZmxsnuguEGxIxf+ESeuNsEGYMgXH
 oK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871858; x=1739476658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQCjgYiJ38m/dRuOCrueWQOvHfQiGoL/F0IUorE2POg=;
 b=HO/tRkfFKgMrw9d6fsPs02XyuDWWGuf2zcdp8f9FnRZw14ZMu6rFIO09pgPEGpHdi2
 8JCQuqjqUNCjh1LzxnuiJUhpgKuQk/31PU4t4WSg0AFv1KHqZuIJ+8i+woQj+hDVr15+
 /W/jM21wwLS6vpkEGypUSDE5t4gdQ3ysTDN4LjYXy2Mb5SSeLq9itaZo22ppkH+bNUsp
 j4RZQoVfVuf3yre9uE0Ey0VuKiRUYnVZ/K2lKoiaMM9edRQ6vlOCHRQabvHcIQRdDtI/
 HBu/tE38FU1a0ZXEvc0IirkXp6C+AEcFkoKv2T0VDBEAPrd/TP1RtIucN5vKfhsF2rc9
 83jQ==
X-Gm-Message-State: AOJu0YyyfSFQm7Kj0zazmglht+0mJuzCUFLgkw+9xpE6BB5yY3Y23iA2
 aCqRij9Ma9LBs6eZV34tQ8GeJXsm6MCvRvVtUGx9F0biYv995fYqca31bcCpHJlU1QSeBX91oms
 W
X-Gm-Gg: ASbGncsAR1mBLYiQZuIh/F92I9d3Uy/+F8v0wlWhOEUslLjA0cT+jSb207HJnyQxdbB
 V0cjamZ8OVLGHBOr0BMHoTNfvho0S3SbWlpspUp6N0NIvpc6eK3KPvxISYGvCe8fYoRfrHiyuno
 frYwQkiEt2gm+ak3LWZ9VCjqqjl7xJscOrkfpQ0eMn0/7aDXzi/fSxveJcj8JZdHNdi8JCSiI14
 7fY2G+khod0JF9HIqoyBKzh2nd4qcJr4Byzze99u2oiPuU5WrFoQazDNlyQmaQBryI9i/baJX6c
 IJLDvuW1Ka1nK9UK52yj/RgEXPh6eBaxx3ZbrqotdcFQgog=
X-Received: by 2002:a05:6a00:1f1a:b0:725:a78c:6c31 with SMTP id
 d2e1a72fcca58-7305d4135demr1005204b3a.3.1738871858455; 
 Thu, 06 Feb 2025 11:57:38 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 29/61] target/arm: Implement SME2 ADD/SUB (array results,
 multiple vectors)
Date: Thu,  6 Feb 2025 11:56:43 -0800
Message-ID: <20250206195715.2150758-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: MQWUPhGx3YQ+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 31 +++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 20 ++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 09a4da1725..8aae70201c 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -692,6 +692,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
 TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
 TRANS_FEAT(FMINNM_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fminnm)
 
+/* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
 {
@@ -720,3 +721,33 @@ TRANS_FEAT(ADD_azz_n1_s, aa64_sme2, do_azz_n1, a, MO_32, tcg_gen_gvec_add_var)
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
+    t_za = get_zarray(s, a->rv, a->off, n);
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

