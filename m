Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253677dyc;
        Fri, 4 Jul 2025 07:29:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU+oIvBccBr3Nn7gvSWROCLYTRXuUNOmb+KF5hJkFmB/6kwD/gJEtlKCbSrzWVpeitz9IWEcYs8XBKfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGe5ZJn7s3AC1jIYj74U1aXDnw4NttXOB23X3VhDXtKbKJGKnqm9DvCA8fNPhbObYXxgLSy
X-Received: by 2002:a05:622a:1a19:b0:4a9:76fa:8728 with SMTP id d75a77b69052e-4a9964e692fmr37276001cf.18.1751639345424;
        Fri, 04 Jul 2025 07:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639345; cv=none;
        d=google.com; s=arc-20240605;
        b=NKoWaU25z/cSPHamvAItq6n8ppX/LnjmKIT02WcEwRLHPlA6PjiWFdVRBRDeGFGYYU
         NI1Vi6pDJxc2P6TrAEdTLuOsArZdC3Oo8iJVGa+TSV/SKf9Hdde1Jk+vts4QP7+EIgNI
         yvKn2+KoBrxkd8qzWxPmIBoW7+/RwFLc/b+Zo/qvV+HPCJ/5fJNnWEdwu3vdLXDOD8ud
         FdeHIFL4oQOUiUqYGpqpJeSyge9LfJrhWSdnsDpeB4tnn3QwRnEDg4510iiwgBOOuZwE
         ZmWpoT+u3OCb3IxGdu9yDLB5QdkQbn2oBanjz94JYy1JZ9H03VSv9yUbjOhtdgqG8msA
         ZfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EW2bJzirUC9Q++64fS4FwLYtCnIkFQU62Sb4cmXxlXU=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=dK+Vz0Qr2At0fLsxfJPKTFjT29AGZMbb+0FCEHtHp1GZjCWMnZqjitaxjwXh6paRiX
         N0ueD4jh1MYsQ/nuW9mM+qCsKZjFnGpHjQyq2fVpCZ0Fu1hOEFoqn09jqdROMl7i39X/
         Qt9gnLi+H4HwfZerg3gMNIYrX8WNoKtjwcMqGajnFS9O47Dsp1PdnArtST5qBJvyqpn5
         yTmPy867vgOFUPsoUR9zm2UxQZkKA8wpM1T4x7pJqaymgwxaACu5eXbWsCEy6VYUH5SF
         5QWAth+o+y8/+20OLK43iYLRDvQzZMzEkCylhN3O2qXINpThfcWumQ5Pky4Pms9ql8vq
         Ea5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TPcvVGfF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ab3f05si20761851cf.231.2025.07.04.07.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TPcvVGfF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhO5-00008c-Jj; Fri, 04 Jul 2025 10:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLb-0003YE-7X
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:03 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLY-0007cG-Lg
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:02 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-611a7c617a7so288427eaf.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639099; x=1752243899; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EW2bJzirUC9Q++64fS4FwLYtCnIkFQU62Sb4cmXxlXU=;
 b=TPcvVGfF2+gOZp9Tcqchr0RdUAhIsP5CffRQvXqFMCXOnDj3zktwTHLG3hF9mWd661
 2tDE7B6TMvAIC5eQ1Ng3wGG5T/2wny5o4478A14p/iRJD/hOaM+mWYviT+cMjY8udspl
 JjjhEOzY3QIAFWN4e74SZ+x6aOiz6+wf6Ro1e9sFP2T7DpijUc/0PSkh7J5RaTdXkyWL
 ZRp5XR/QCk6NSlrbHu/l3rbHI59qHFz3kKcIRyyMCGf7v42fpzFzbKFGRzwd/sKT36zw
 3mByltIUnHUS5jwuXnN+eMVcMWXgbNK46sC+i+gyvE0H5ChBU4Lq9cgf+gvBSMWqKSMl
 t9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639099; x=1752243899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EW2bJzirUC9Q++64fS4FwLYtCnIkFQU62Sb4cmXxlXU=;
 b=sVLybxyd1rzU+hmnNHQGadCDVJW21qV+G63bw4rsDykCgPG8SQMvz4XSA/Pj4ixfJ4
 6utkFyuCJ3FvZtaW0FOd3YgoZdktXMK9xs2EDyNSvBE8oubKTjgTjv8jBxyJVIPfKG46
 IxFPwch6nAWpPpjrFNM5JrFh/0D0sQ02ASMrL88h+eRbs3MockLS5YM3MKEd5gCd6/EM
 vfcQbs1PiQ42LDlzDM7XMI4osswuPfqPGFXGeOZ9Ct7lQBcoJWGRP10/Yn6rQO8rJ/d/
 lSf3KjxQqaxBSMt1X6feU6Q7Isxu0PfUIAHLXesA0LZVlXwhC7XmU+UxZs+YTOGorY2p
 mbwg==
X-Gm-Message-State: AOJu0YwrNThcAeoYxdcedmOqJRY+8mrCZyg4kCVrciZsXbU4qWc/FXW/
 K92js1imeP06WGhqD96vLP2ZDq1wR030ZlFaFO9JmkSJ4ObGZBfyraPHAMRYBS/ojNQFCB2BoRc
 MOKi9fRY=
X-Gm-Gg: ASbGncsZbibyxuQwpvTSRLTIIBfAztZ5ZRyQbW9rNLjbkYG9g6RljPR/xv3dH5I6eMY
 +/jQLx5BUy1ptdFn6DRa8oQlLy8dkDOJxOYMQfbn/KcvM+cfPR/pZKe4rklCuEu5zEyJtr9Web0
 mVziMT8o/8puDwy7bqv4NS555htRL24B+6BL15ZbLtCJZJRrpG4pklBI6M19WyIdcS2b8bb4psP
 zWFlmlITAWmnK/PdItr7Ui6LloFLs+MGw99/hQq1qyh2iLigv/kOvQPy71FP8kJNs4wpwvEMcDZ
 HyJ6tG+i2KE88/m/q85CyXmzrccJotd55nyoIEQYN68ZgX9Pvc3H1AGScL1x3F/q1aOSi/ToP3M
 xHHRIqqztV3jrTQ7Zpoj73XUf6lSYEJw/xFeOz0xXHMM0VxeMv3O9MEiP62E=
X-Received: by 2002:a05:6820:174b:b0:613:7eb8:a4a6 with SMTP id
 006d021491bc7-6138fd5e525mr2320024eaf.2.1751639099221; 
 Fri, 04 Jul 2025 07:24:59 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 042/108] target/arm: Rename SVE SDOT and UDOT patterns
Date: Fri,  4 Jul 2025 08:20:05 -0600
Message-ID: <20250704142112.1018902-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NkIK5UbkuBuR

Emphasize the 4-way nature of these dot products.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

