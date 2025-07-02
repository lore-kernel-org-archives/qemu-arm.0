Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3790545dye;
        Wed, 2 Jul 2025 05:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0c2mrOn0dcjT8sXxRNQEmuFPfuokODiJL+XY5/Hfh8xs/qtymhPCgQHCPDHQZEBTu5axSqX4TJXN6PQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFezGJNUkk3RqTeX+401Trkn8dqV9WUr7cQC9anyCvHXVPhIBaBBtJ16ZV0Did+8jSNAWz2
X-Received: by 2002:a05:620a:24d0:b0:7d4:1686:659b with SMTP id af79cd13be357-7d5c46649e7mr363833385a.1.1751461110061;
        Wed, 02 Jul 2025 05:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461110; cv=none;
        d=google.com; s=arc-20240605;
        b=aUp1PptL+ltCC2clR2Oh+Nw5J6GOJVo+bjRP+DgDNO4gyIvpW88bJbeZBVXtnJ/R/x
         OBfpXYFT3SFA9KqHOd9VmLP8RJVpylz0qI5lYXWSsU8kDGh3vkRzT8kiPr9IlnVkKyCM
         XNM0w5rPH3ka8moAY0I2vxLpKE0Zdp3YfyCpBO1RWXzc1Wg6pYwBV8e+Ciud6VUL83TF
         WWnycsQVl0VCndnFF1VRkzSXECxh2Z9/xE78WsHbxRnM98qjoKKZXcaMW8a01oSuBqQm
         QEWK5cz1odz/m4o+ZVDhPDsXNKup05zvIMtDVHSUcUS7TAJd1v/admgSoz/sgdTzkq8k
         4SRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=phmIfMds8E5RxRVs9U5IB61cQYJsfJm2GIn7j+DSAc4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=dZdBju98XwCvGg1bnQHLwYIrgYrPylPcp1k5dyrrSuHdLuDuLIIEjWCInE7cwUhKvv
         QZjU/gcQ4kRvwchX4v72PixUZYkpYqnXIfap3bmM3bAnu7rRUa1zdOqQP+B9HOsrJ1Su
         9RDlQeuN734PFdFgS7lWhTjNHLfeyJOoIhTVqeavBR2EpCgR2MoHMCs/7nnxZCjOh/tg
         2LIG61unJHrR9L/bFKJdLGqLgY3i7fccUMOb0FEyVXF18ZYqM58kJ+7eyRhE+e4qPVgf
         0FLkXrseeI7zgcijkejCFAfmhzKwaIlX7htDKa17JSAwKzpy6rGALS2SD0sASXzxvo5a
         rATA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAE1pCQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443225727si1119942985a.280.2025.07.02.05.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAE1pCQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwic-0003Il-Fk; Wed, 02 Jul 2025 08:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgS-0008Qv-1u
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:28 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg7-000183-Ns
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2ea35edc691so1680535fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459695; x=1752064495; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phmIfMds8E5RxRVs9U5IB61cQYJsfJm2GIn7j+DSAc4=;
 b=uAE1pCQ1YxPMrZ4pIkVmcj5csk2LQX2TB2ijppYvIsw99JwBSkk4v7NgUxwdDWY1Il
 iYJruvAf9jzZOGs9Ws92vnFUbydhkcfIdUJGJapjaAepChfWXQu0mtftXGQIL8IJL0BK
 mIbWLXRZGlc6uXVWMoHxQBsQAdi8hB/YnQv+sWJ7gT+kCyNFVdXQca77yTSYmUjbPUF3
 mnkZ5fa37qVLQwCcrcV619c4xsgqY30VIG54bm7Dnhg/BZRXDbobfasfkaif9zL6B7sm
 3VBabiXYzdMHRV72zw+nKlkRrEgtG4MsyRtIajrfzLXlGgcz5FjaC4eKxwrs/9YRwXFg
 0Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459695; x=1752064495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phmIfMds8E5RxRVs9U5IB61cQYJsfJm2GIn7j+DSAc4=;
 b=EHOFnIgpTlCaBLGp60Bnj1mAoCq2j4gAEPtBJAq/Wx4uKGjAVZDhpGnkrDZq4H2f0W
 3QsQpE49bX7zDwBfFDPgWQT2qp8AEzJlVSKE18kQaY1LlHmrPU3OgVNP98XMx44GcBlO
 y8H5E25GGlMLt/ufi9I5VfReT36P9Ly51vcoLxrSj7k2khO5Hbp7t0E681Hsqg3kcABm
 wT8wB4V7r/3V088QVfXBInn2ky3dUXUadHU4vqWXGsNREU1aRlMyT82Z/l4PpxDFjhxy
 WBIstAUxnX3gQnxqTU68pFLjEFl6aP5ai79Sb7gV5U+AAgHrwfNshaONknDjxCgT4CJF
 yAAg==
X-Gm-Message-State: AOJu0Yy98DGHPN+HMqa7srBH+WCNxKMwIaBe/yi7BzLIrPIBIRhribgR
 2JMuRaPmU7zCwnP8dTYRhBf2+3DNGgKRbhQwCfIkIFjtohTRyb2iQMKtEtWYLiIswNw=
X-Gm-Gg: ASbGncsilWQh9cGA4mS50aJEOVnRowtwALVaUwfbbn2dmovFVZP3Z58VI1vtv1EvAlf
 NgjQ8XzFBg1Kx7YwjLpTqpQQtrEEUR1GqEqLIiZR4WBN6VTfFKpGfNglIrKLXir2iV+8lR4UtAI
 vaKBItVfv8SGN7Bfv1sCr17jAefx8NVfOWUAqZYZIx2FRTXK75rz7VOBnfG3OYysRl8ReubHQNp
 2Cco/sLLA029hB4uzROfNpy0mTUR96z57209WtkZNTV/xDHOxbEG3deq3heNMFgiHGQ0WpqPUfK
 iDGOEq+/1M13RSZexU4bOTf44xRaIdpC5rk8tYT7QDglb2aaDofc/KqXMz8huU8ClTZeUw==
X-Received: by 2002:a05:6870:1b15:b0:2eb:87a9:7fc1 with SMTP id
 586e51a60fabf-2f5a8d27727mr2047246fac.27.1751459694942; 
 Wed, 02 Jul 2025 05:34:54 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 34/97] target/arm: Implement SDOT,
 UDOT (2-way) for SME2/SVE2p1
Date: Wed,  2 Jul 2025 06:33:07 -0600
Message-ID: <20250702123410.761208-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
X-TUID: 9tL6IZjuc+lg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 10 ++++++++++
 target/arm/tcg/sve.decode      |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c82a0f771d..10261e25f9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3426,6 +3426,11 @@ TRANS_FEAT(SUDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
 TRANS_FEAT(USDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_usdot_idx_4b, a)
 
+TRANS_FEAT(SDOT_zzxw_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sdot_idx_2h, a)
+TRANS_FEAT(UDOT_zzxw_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_udot_idx_2h, a)
+
 #define DO_SVE2_RRX(NAME, FUNC) \
     TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
                a->rd, a->rn, a->rm, a->index)
@@ -7154,6 +7159,11 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
 TRANS_FEAT(USDOT_zzzz_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_usdot_4b, a, 0)
 
+TRANS_FEAT(SDOT_zzzz_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_sdot_2h, a, 0)
+TRANS_FEAT(UDOT_zzzz_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_udot_2h, a, 0)
+
 TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
                         gen_helper_crypto_aesmc, a->rd, a->rd, 0)
 TRANS_FEAT_NONSTREAMING(AESIMC, aa64_sve2_aes, gen_gvec_ool_zz,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 401c025852..83c259def6 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -856,6 +856,9 @@ SDOT_zzxw_4d    01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_4s    01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_4d    01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+SDOT_zzxw_2s    01000100 10 0 ..... 110010 ..... .....   @rrxr_2 esz=2
+UDOT_zzxw_2s    01000100 10 0 ..... 110011 ..... .....   @rrxr_2 esz=2
+
 # SVE2 integer multiply-add (indexed)
 MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
 MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
@@ -1597,7 +1600,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
-## SVE mixed sign dot product
+## SVE dot product
+
+SDOT_zzzz_2s    01000100 00 0 ..... 110 010 ..... .....  @rda_rn_rm_ex esz=2
+UDOT_zzzz_2s    01000100 00 0 ..... 110 011 ..... .....  @rda_rn_rm_ex esz=2
 
 USDOT_zzzz_4s   01000100 10 0 ..... 011 110 ..... .....  @rda_rn_rm_ex esz=2
 
-- 
2.43.0

