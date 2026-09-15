Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDDC88E53
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:24:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T93-0006t2-6z; Tue, 15 Sep 2026 09:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T8w-0006n2-BW
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:24:17 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T8u-0001Sk-11
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:24:13 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4aaf2ecfso2646686d50.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478650; cv=none;
 d=google.com; s=arc-20260327;
 b=ccOVA8a6rT5eU5O5uom13oCI4u5jfr2LM1EC5VqeJh6tDe9lagGiHkJaXZmT/f45GW
 5DFVD9n7kHuWBvdiS3hxGEBZDzXLDqIKIg1jICnsabORcgwkgx15hgN1R2hs1f4WmWRg
 Gxbpa+Bt9q6QhuLsI4dlYFzK9wNlzlRMdYv312qOnH8VPrTm2wVfMxxqBruhCJlWAvC7
 +fmVOX61jVZ/8jFwLwis6oPnkrQe4fzJTr/VJyI551qBSwYcLKXRlEMMRUSUSQSfTxCs
 8dStckZqFR7K+aduTOQxK7LgNAjdR2YF8ghaacMZE/ke8qxSSfgLT34xcmFliefQAwBo
 mKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z+LYvIcju2WpXeok+AWw5FmBhtN3Wn+MgNOU4JqJKy0=;
 fh=GLFuKfqEv8rcyvHSS1qC5pchRuFiuuJze/WBLvBL+7o=;
 b=VLotHTQrUymiDYzHPlBB/fPJjCRV3GJL5MLg1YHSXFHbCuMR5R/2QpmlG6zzdP51YD
 WKzdoB1ANqXpQbkdS3tbIYVIRKhUWx5x3qnFNAION8Na2MoX86p6JIXWAK8TriFkfmRx
 811S3gy1hidGMeAOXFNj447NEtk1zljt3s96eH6YQ/zUlorBw8uVRG7o9mcxxVg3Su4o
 7pAPIS8i867lQyQwiTWxif0Is/JB8uY82SA1CfixUiDiHFHkv5iPWeJGSf1KZ64IVZrC
 SwcoKSeDLnL2oBJ2PWsKOEaYLjvbDqNyS/tMXgIbatf1URQ9GbgCiwbBaRbdnBzYAteO
 zahQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478650; x=1790083450; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=z+LYvIcju2WpXeok+AWw5FmBhtN3Wn+MgNOU4JqJKy0=;
 b=zEVf/HgnOFz399Y2ZMZSGTOwOLmdFPRUnxHpMymWvX6uHaFsQkTaoQ3kfH3jE9n/l2
 cCGtHclgyFZh0fFQEPW2vsdA7pDI/rpO6UCzV2aERSlMwFtc8QBzdPS5Y3xL45Mo1p9T
 S020VKnUQWW2x1qeeTYtwEG8q9Ici29chLiXPPzDN2j8U+ko4RibiGBQhUCrpmMRdluH
 fqgsMVUl01lw4AIgBSkFTqFT26oTPXmy+f+PTuHk0Ri4AOhpMOyuX5bTzV7IlkDBk7gl
 FkxNbZVLFjYGB9P6LkIjG+UOfY1fWX4/AErYiEdZcyZroPukv7qVwMfOgcBM/e0MDpei
 vLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478650; x=1790083450;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=z+LYvIcju2WpXeok+AWw5FmBhtN3Wn+MgNOU4JqJKy0=;
 b=A3AYDO1r6IZiRw/KjRNEPd+Ph4pbIP0Q2nB2uUy4RV2V/9f7Kt7pSVnp/BzPLfGoxu
 KIXaPrzZ41RkOU/IHu7qZp8zYfi5kVRIsr3VUDggWddyRb2XQBt5SAi713kt3VgYNDpL
 xSTK1vZbOnD9heJBzKjjYztslpimmltBIWyLNJmbtdXQ8pX6OM+reIVyreZabwsjY/nP
 Y/upKYjeU1e21aJatjug4c9v/ldlB+50vwRPKMHtWKz+5gfoA4P3QVBfzMwktGK6in1/
 1dDMuKZxuaLupNkES/mZS1L3QFe6jloxgPuG/SWLnjXXRllAqlhqJIZ1aRAxjH+vQAoV
 kSyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwrqmXhdBEn8n6aBicZN6Fnv4p8rnHKNXZBuEgxjkK8NDGyY+sFeTsV1qS1aGy96FDzm/x71RPh9A==@nongnu.org
X-Gm-Message-State: AFuF++ko4w2Ch4QcYVnUst6Rr2pUCuJLhyb4sGIMJl3ctBm2OP2zQQ+T
 QhzWX9JYdquPQKox2WyyeQSd7m/imzziFo/KtCRjKJtTe/1gVfT901KbdHxEwTTyeNOGXKBp9kb
 y1gN9EL1s5FX2Vz3DRSfL5TolZwYxB0NtveyroyW2Vw==
X-Gm-Gg: AYBFou0m21I5KThh1dXEEEpCZMPilTHwiaSjKUl7cty1RRNEDFOJnJOS9vJcV2OEK8J
 kL1Ux2aG5PcMvwURLVyf5feGGbceHBsycg0OamaadOTbLcMKbVxDMoyAlg3sWlXHie8l5JSOoxY
 HkdZvZFRs6KVEYfeJOh/NVQyYbFn+CCjAqVzSdPlViqofW6cjzdGnb9Ng88cZswtNUsetSFfydc
 nQk1gdHQ3DdtYFH6ZHmE2C4p8mxFBHy5pfjvaMPyba+gAnQ/71zJUzdFf/TIn16AqwQJSfUpMtI
 ma1t5I8SL+SXgN1bAg/Y2jIrVYhqbJ8B9hwI+mLCTySgvwlorPnqhmJGPDFVj2+cxa82C+3rhCP
 E3z+GA+FhXB14vZRBcuejT8ZI6wI3dxNWPSvDlm8P
X-Received: by 2002:a05:690e:d8d:b0:66e:6089:b3ab with SMTP id
 956f58d0204a3-6714e1c1506mr1875802d50.47.1789478650022; Tue, 15 Sep 2026
 06:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-7-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-7-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:23:57 +0100
X-Gm-Features: AcwNN1XZmMCEGv5Nnl5PnCWDKWB3SBOqaf67rRMjKBYTK1XNvjpMz7qO_L5hf9U
Message-ID: <CAFEAcA_33b2zu_JEdQvyPyRS8+wikhz7aKAbFA0C8j348gMBdw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 6/6] target/arm: extend PMSAv7 support to v6-M CPUs
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Mon, 14 Sept 2026 at 20:29, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> QEMU conditions PMSAv7 storage, reset, allocation, the pmsav7-dregion property,
> migration and address translation on ARM_FEATURE_V7, which prevents the Armv6-M
> MPU from being used. The checks are widened to also accept ARM_FEATURE_M while
> preserving the PMSAv8 path for v8-M CPUs (PMSAv8 is tested first and the
> migration vmstate excludes v8-M with !ARM_FEATURE_V8). This lets a Cortex-M0+
> declare and use its MPU regions without setting ARM_FEATURE_V7, while v8-M CPUs
> continue to use PMSAv8 storage and migration.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

