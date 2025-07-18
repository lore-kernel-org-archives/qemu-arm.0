Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8E0C83F17
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucp6S-00073L-G1; Fri, 18 Jul 2025 13:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucov2-00054k-B6
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucouz-0000sA-DV
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1483282f8f.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859844; x=1753464644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvEZoZH3mUSnAV2VTJKTR+Ia4eaH8LTVsbCwMx9JGI4=;
 b=dOFS40arjTd82yGeo/6/JZeJh8EtxaQ3O+PQu8GCP9We7ZQLMSe65/svq0PzjwdRgA
 cgDTpmj7xEF3YwT3SLemPul9AtqCoQ+pR0vedc8l4qr2GxhtnQvkl3gXmMuFzq3+e/PM
 BgMwh/vwnhwIFFdJbWY2FLz8ELccxJjA50DlWjtKQGm8aGkYHBS+b6NDT8nWnm1ujslp
 QcfAM6y0bcVawBQDDynGbPBjeRM4/Tv1SVWWDLZRt5UF+fipOg+Y1Ij2qvNV+i0r7DaL
 rlOLhkOPR4Wj6yFtut1Jt3WtfjROhfPt5LD6TiDGRt3jkIMN6R7AXFSeaEsH4scG9ZFL
 FXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859844; x=1753464644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XvEZoZH3mUSnAV2VTJKTR+Ia4eaH8LTVsbCwMx9JGI4=;
 b=MXpG9EkwtAXc+CAp2OTpgsFkGC0bYsMfAtCfSaGrwZDNUnJyytW29vdJSR/uAvUaoZ
 HnOdVwnQw7QB4WP6/f+qNEGSe7ju7cITUgZjaTrMRqpwB7ftCED6O5Z7Q+fTSptiMgDX
 N6WoHyUUXS7ERNZoYh+O3RELs/rmMW+S3odSTUdUt/5jLohqgfSAQVb7pJfK2Uo0go5N
 FiLCgzx93tg40DVJAWXjnJpSruPTltdS7caL4VhDCfx/nDgsvzBXQISRT9P0Y4YXf1yY
 iiLfYIZKpEUQAi8kGc8bHHvGBBDWFosw/UHUq+/A61VRATxcZlCsGbb9SE7WylQ4kIJ1
 ejCw==
X-Gm-Message-State: AOJu0YxLhJAvDT9XORmBtDyl3wr/y0Ora63tEicJk7aV8AMlUPGsPMcs
 g3bqYnbVogXhEd9Y7vX7uTf2UktfHxV/Qp5fivNJMC54msj+7mOzsYsKQ4PQCKy2JXXeU/3KG0s
 Uah02
X-Gm-Gg: ASbGncsnbuwAYAiOo1RuGg+MV/o43+/W6rRJ3D8yWMLCadKENmFTAHaNcgcegvmjWv+
 RRKQKL+TylcqIb7HQ645QmfWS9/vPPcDcMQkFh57amnCxTS7saVqvcsZWZFmTaln768yJTv8ggO
 h1CaN0r3D6G8egC89WEm5kEZnzMZan65npJOsjYVXa7tl7HzqwxkIUYaQiBQis6mXCFbGy++HWM
 AINHM98zHsSzdVRcOom0hbnUA689R4TJGvcqiTM5zb23nMTpLlfdYBUlLpdHG0JL6YWNhdKrHmT
 gcaS+X9tMi936QYdOPV91gPuHnIGSG7EjvnxzkKVzdYtBg0wh9oKrGXqvrZ3oI95tTOr1SZhCE2
 4vm77imhrgykEpBhgWmwErEFVsRcuFYcZV/1ItE4=
X-Google-Smtp-Source: AGHT+IFrnkwHPbSooHVEXVPASDSTgFr48II+Atg7XpMzelaM+pU51pxQrmZcUuFUHaUMFnjvgtSzvQ==
X-Received: by 2002:a5d:5f47:0:b0:3a5:7895:7f6b with SMTP id
 ffacd0b85a97d-3b613ab26f5mr7415234f8f.7.1752859843644; 
 Fri, 18 Jul 2025 10:30:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 07/10] target/arm: Correct sense of FPCR.AH test for
 FMAXQV and FMINQV
Date: Fri, 18 Jul 2025 18:30:29 +0100
Message-ID: <20250718173032.2498900-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718173032.2498900-1-peter.maydell@linaro.org>
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

When we implemented the FMAXQV and FMINQV insns we accidentally
inverted the sense of the FPCR.AH test, so we gave the AH=1 behaviour
when FPCR.AH was zero, and vice-versa.  (The difference is limited to
hadling of negative zero and NaN inputs.)

Fixes: 1de7ecfc12d05 ("target/arm: Implement FADDQV, F{MIN, MAX}{NM}QV for SVE2p1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index fc76624b5a1..2ed440aff15 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4020,7 +4020,7 @@ static gen_helper_gvec_3_ptr * const fmaxqv_ah_fns[4] = {
     gen_helper_sve2p1_ah_fmaxqv_s, gen_helper_sve2p1_ah_fmaxqv_d,
 };
 TRANS_FEAT(FMAXQV, aa64_sme2p1_or_sve2p1, gen_gvec_fpst_arg_zpz,
-           (s->fpcr_ah ? fmaxqv_fns : fmaxqv_ah_fns)[a->esz], a, 0,
+           (s->fpcr_ah ? fmaxqv_ah_fns : fmaxqv_fns)[a->esz], a, 0,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 static gen_helper_gvec_3_ptr * const fminqv_fns[4] = {
@@ -4032,7 +4032,7 @@ static gen_helper_gvec_3_ptr * const fminqv_ah_fns[4] = {
     gen_helper_sve2p1_ah_fminqv_s, gen_helper_sve2p1_ah_fminqv_d,
 };
 TRANS_FEAT(FMINQV, aa64_sme2p1_or_sve2p1, gen_gvec_fpst_arg_zpz,
-           (s->fpcr_ah ? fminqv_fns : fminqv_ah_fns)[a->esz], a, 0,
+           (s->fpcr_ah ? fminqv_ah_fns : fminqv_fns)[a->esz], a, 0,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 /*
-- 
2.43.0


