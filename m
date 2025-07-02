Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3707806qtb;
        Wed, 2 Jul 2025 05:41:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7pNgX8EI9xhSrirFArMskargt7ji8dT16wJ+lnzUOmTHX31P1+bJTWdaCpk8wiiyaJlD0UOvSol97Rw==@linaro.org
X-Google-Smtp-Source: AGHT+IE7gyt8QYZzlNnweQ52Dy9Gn/58rCevCRDP0Y99L82HFrl8WDJCvDiykRRb5Kx/pZoCpHYa
X-Received: by 2002:ac8:6f12:0:b0:494:b377:a77b with SMTP id d75a77b69052e-4a976a204dcmr52295801cf.27.1751460068482;
        Wed, 02 Jul 2025 05:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460068; cv=none;
        d=google.com; s=arc-20240605;
        b=X3TI+3xT59+/B5B3xtLJD0ksCgpjYkgRP+y5LmengCUz77N1hZGSrgYDh8u+HEo5Mn
         q6eJxcOlnGc7483fUQxz0kIPvRzCrjrgmtk/sUZYrC3DE8M3SWZDvTRdzO9O4p9hsaRb
         hpQPtbBt06umNW65RDRHtufEVPJyrRVao6gDtMBi1LrCMQXRENXiErSAqbLIh36W0Bu4
         VgB5O7E6X3BoFDJhPPTzJNrShQreiBKczIgDsG3PkUybLnOAq8OONknIvll0kB+RrAZN
         A1EacYikCDH0LNDzRiHewsfnLtrtGEdbaF+T0LTAjubdmgEU8T6RswjDFHqEoGwfQ1SO
         Uk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tcfx0Rug4rrD3mpx1vWRP1AZ5OZLQ91BzLxLARSGtZE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Agk/THZkTviLhhJFdzMsuk3ISq2b7SEtywJTNUeILV/CybrYan8vqii5u7tqnrv2CM
         68U4qlR9vk+/dM0RWdwD3xkdtjZvCqAhkxtDG2RBTmoFQiwUUJkJn3T0Os/xo0HeP11t
         1Xa7LzDqwnbvAbpdRDwGCh3A2UTEu+zJqdV8crZy3SxJek7+Ya2/v7Ez7GiICoeDC1Uw
         AZiJ23sQ92WnI7BXFpaMcesNUIrNiG1K2WyX7fQZbcxUQqeWmvBmckBO6lOo1Zsf8Nkg
         HFVQbmTpy0vR6gUrqD37e2pArzOKDTxW3N1qicFkyFm45mVJA/D5djqyKcBzneS0cOBn
         bFcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjY2wOAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a97bfefc43si9953611cf.501.2025.07.02.05.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjY2wOAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwhW-0001Xv-1F; Wed, 02 Jul 2025 08:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgN-0008OT-Nn
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:23 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg5-00018y-D7
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:23 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-73af5dc0066so1561587a34.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459699; x=1752064499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcfx0Rug4rrD3mpx1vWRP1AZ5OZLQ91BzLxLARSGtZE=;
 b=SjY2wOALeuro8c1qIjxaH9DYBhQ8/+0yjiKZhdASNDT3sA6Gz6MM3rj084ATrUtIM1
 92hqsC72bnVj+PlGEQ2uYCK5zs3jqYN6loK0ovbNM3ZoR8SOoTIaYAh/TmaftzUSxZS0
 QaS8nIsfo0Yn6rBcs39OmVJCeY1oLBwzyb75f94ONVL8mxs6EvrZBbx/yegS0+jtdwRG
 EUWBwc8JkDq3y9mY/s/3AhYaVB7Byll+D7dTIRfGAxgytn+LVSqjfEGH2WCAxhxKtOjU
 GRSFTmrXf+p4BZPZu9s5BFaelIgn0wSQ6TSXC6FHJk1gBH/m65xN+iACO3sdytEukt6G
 flSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459699; x=1752064499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcfx0Rug4rrD3mpx1vWRP1AZ5OZLQ91BzLxLARSGtZE=;
 b=luPKrpLSk3FScpieWYCs0pAG/H1h0CnXGSakMdCqT0gBOmJsol6Hw/GI0KgufT+X7u
 kUOupBjJvToD7JL9c8K7jCtGNTTLm4dHkTFWQ8Hw4Z9C76g5gXj0CuGbchBshD+CPulW
 8YESUuS+5tRLX9WPWASiazlNa3TO8H+dfmr+OGZmgL/QjOXya0uL9whcbTePzN0sD7Xo
 3CimWohN52XXhZFY4R/vDiXdVLnCkfDThWXVHADyRtN3Koheq2MBsaSyWDju3U1pgAu/
 Blwa9np1UYKx22gTN6ZA/X3oHJktzrwPDBqnGNeh5QRaDM12iV0KfQpklgFNBqF/eNrv
 Rkgw==
X-Gm-Message-State: AOJu0YxyyLpi38ZUKF8aXG8Red+Fuayf8vxAqFCJ24naGbu8XX7P/o8Z
 GcznfhnRrZO6vPhM2ksV3r3X1IsZHK2ZFrG3Kl5x2BSdGiBTybblV+dQFC7mGfGBBdE=
X-Gm-Gg: ASbGncuFMrGDj6NxhwXD7LtTScSSSY0RzUa5WPYcUovVGYJEBRcL0Bwsc8HyFf/417+
 JP60uAO6jwDnq+j6HeZrJq9bXmM2JGdBamC4/5yfzegkOmYf9Q7PrHKHpc0T8JSDoeedXo0+n/f
 gW4hLqHdZW9LyLemPfThRFeCMjPOdkKe3pAiRBBuKb9cnzkACOXxy6P/0HTR0NQsLqF4IpxyINw
 hdzT6axrVm6FZP9T3BGhCnZvNsbKvE3TyrugtJE7cuObUOsOqsZmtYbS5ylMzA8ctqzdbdi8X3d
 3PwI6b22lR/SYM5QzfN1DVXsWGweJpxbxsBJ1kVfCVtOIel+8iV3PtNLA/wFuEVlstsPPmQI2wf
 eSEzc
X-Received: by 2002:a05:6830:6c0f:b0:72b:7cc8:422 with SMTP id
 46e09a7af769-73b4ccf6ab7mr2002568a34.20.1751459698128; 
 Wed, 02 Jul 2025 05:34:58 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 37/97] target/arm: Rename gvec_fml[as]_[hs] with _nf_ infix
Date: Wed,  2 Jul 2025 06:33:10 -0600
Message-ID: <20250702123410.761208-38-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: OilBXAUHrbwX

Emphasize the non-fused nature of these multiply-add.
Matches other helpers such as gvec_rsqrts_nf_[hs].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h         | 8 ++++----
 target/arm/tcg/translate-neon.c | 4 ++--
 target/arm/tcg/vec_helper.c     | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index c4a208e3ba..b741470b51 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -790,11 +790,11 @@ DEF_HELPER_FLAGS_5(gvec_recps_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_nf_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_rsqrts_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
-DEF_HELPER_FLAGS_5(gvec_fmla_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
-DEF_HELPER_FLAGS_5(gvec_fmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmla_nf_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmla_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
-DEF_HELPER_FLAGS_5(gvec_fmls_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
-DEF_HELPER_FLAGS_5(gvec_fmls_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmls_nf_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmls_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_vfma_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfma_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index ea04336797..844d2e29e4 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1010,8 +1010,8 @@ DO_3S_FP_GVEC(VACGE, gen_helper_gvec_facge_s, gen_helper_gvec_facge_h)
 DO_3S_FP_GVEC(VACGT, gen_helper_gvec_facgt_s, gen_helper_gvec_facgt_h)
 DO_3S_FP_GVEC(VMAX, gen_helper_gvec_fmax_s, gen_helper_gvec_fmax_h)
 DO_3S_FP_GVEC(VMIN, gen_helper_gvec_fmin_s, gen_helper_gvec_fmin_h)
-DO_3S_FP_GVEC(VMLA, gen_helper_gvec_fmla_s, gen_helper_gvec_fmla_h)
-DO_3S_FP_GVEC(VMLS, gen_helper_gvec_fmls_s, gen_helper_gvec_fmls_h)
+DO_3S_FP_GVEC(VMLA, gen_helper_gvec_fmla_nf_s, gen_helper_gvec_fmla_nf_h)
+DO_3S_FP_GVEC(VMLS, gen_helper_gvec_fmls_nf_s, gen_helper_gvec_fmls_nf_h)
 DO_3S_FP_GVEC(VFMA, gen_helper_gvec_vfma_s, gen_helper_gvec_vfma_h)
 DO_3S_FP_GVEC(VFMS, gen_helper_gvec_vfms_s, gen_helper_gvec_vfms_h)
 DO_3S_FP_GVEC(VRECPS, gen_helper_gvec_recps_nf_s, gen_helper_gvec_recps_nf_h)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index c9d1b09268..e03db47ef7 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1668,11 +1668,11 @@ void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
     clear_tail(d, oprsz, simd_maxsz(desc));                                \
 }
 
-DO_MULADD(gvec_fmla_h, float16_muladd_nf, float16)
-DO_MULADD(gvec_fmla_s, float32_muladd_nf, float32)
+DO_MULADD(gvec_fmla_nf_h, float16_muladd_nf, float16)
+DO_MULADD(gvec_fmla_nf_s, float32_muladd_nf, float32)
 
-DO_MULADD(gvec_fmls_h, float16_mulsub_nf, float16)
-DO_MULADD(gvec_fmls_s, float32_mulsub_nf, float32)
+DO_MULADD(gvec_fmls_nf_h, float16_mulsub_nf, float16)
+DO_MULADD(gvec_fmls_nf_s, float32_mulsub_nf, float32)
 
 DO_MULADD(gvec_vfma_h, float16_muladd_f, float16)
 DO_MULADD(gvec_vfma_s, float32_muladd_f, float32)
-- 
2.43.0

