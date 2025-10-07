Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF36CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:30:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68e2-00082k-QL; Tue, 07 Oct 2025 10:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68e1-0007yZ-0d
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:26:25 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68dw-0004os-Sr
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:26:24 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-74f6974175dso74969797b3.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759847175; x=1760451975; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dI/+xF9c5C0CJKAVVpvG45vrmOQqi9/gLVngvJOEKeI=;
 b=aXLXLkZVxL0T/SArAeNPOvgMHkc8vUQcB9gNKLQ6OdBCF5qtmlusaoWAiUyv6q5NHA
 cCXR5Mb/WPTKfib57Dnjgb9Z+S99OWTBIexgCTyTpTvZNAzFlU7QA5/nKPI6VJgeJX4B
 3LIbnRUeuWAsAWkCw/mDk+mnhyAIVkRN4D/6jQKVyY6aD6gvQB6F/8eU39EUWsDMJvbQ
 KE9sqz5XbKsZrkRwp9S3yd6spOikGLOKFyE4+vYFSFUtSotrxoh8zxZFmF8yq6m7XvMQ
 eFdV1Itsgr6Z7w/ad98YaqrGvuIYkabG9NhHVaMo/pC7GUL1XuHhYmi32J53T6kOGBNe
 qSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759847175; x=1760451975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dI/+xF9c5C0CJKAVVpvG45vrmOQqi9/gLVngvJOEKeI=;
 b=wjKE86OJf+wLVMxJe7WczIXFGRc0OF9xM/Vh7+IFYxG1/+E13jMGtkdqTih+2BqG+q
 TI1U7q5IGookDtlrU/vnUMCf5u2m46loWAiFP0lERX3qYvnXq/4lrlP0/KaA2rsGelzW
 OT2x8JQHuh6z9Q+4cjxIJ5gwTXLvqC8V93JrU6NAdbpfRAyXyiGD5ZSJ+IDab/cQqon2
 bkZ21F/kzLkHa6kNoFCg0hmJiqJXVMQCuvF/GbvhYJk4XrHCkyau/cgCh5zM6GjX4qtl
 z96ZL2iuAsZ5SgzBJcbxEIZHQwyEwD07GZtoKEsrTQy6xPNby81CaTF19Ge75QwCDkhX
 CQdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYkc5u4dIM2ZzlzZiq6xaKkGFwJXwp67lAVCe5tcaSbfUU6Br246rPaTssxlwYsLSLEYFtPU+7Cg==@nongnu.org
X-Gm-Message-State: AOJu0YyyC50ylIsW/lqsYKmA8duApoogDcQHfayVRnDrTjwPAL/g/gLc
 uB9+6q9P5sUdO13T6Ves7Tn451beUxkki6G6XUs0zlvDZFa1/xMO1xjCQ9/VWnRHuhLFDrVoL8q
 QX03A4X84b04eVWapCV2pq9QJqDWdZrLWy+M8gC0s0g==
X-Gm-Gg: ASbGncvey5gIH1hhASA+x6sV0IEKiphEuepdaUQfniSfIlg5W8Am6RVic9mDXYuo96r
 X2dXTgwS6NfmMDJ/nWetFq0aGED6Dgm2WHb5PV87DTjmmWP0KFtyGGwate0Iyf5/BavBSiwAKGj
 HzueWAULCD4P8Me1VhmeF7l0kI2AfZwme8KIEgRxVnKdOl+nGjjYb9cSM3VCVL2DzmYoYjes8Lw
 qAF8byrl33BE0fEQByTwa1N4Ls3JQZuZvWvjQnEdO7HEMI=
X-Google-Smtp-Source: AGHT+IHzKTljwEunbKa+FNSKjQrRQv0JLDroM+spja3yji1VjMK604lmHohapAMidHKA6m+C719l2pAnPYt/PuBFTAc=
X-Received: by 2002:a53:bbc2:0:b0:63b:7b61:df69 with SMTP id
 956f58d0204a3-63b9a10aaccmr12960332d50.47.1759847175072; Tue, 07 Oct 2025
 07:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:26:03 +0100
X-Gm-Features: AS18NWCtxZ978AAkLjYesGD7o8LHFxdwT1LxsOHfDcai8k6qPFi2zkyrmF7gdus
Message-ID: <CAFEAcA_=B12vT2UOSBH2O209agNxNCrzONbQp08q=wiZ_036AQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/73] target/arm: Implement FEAT_GCS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Fri, 3 Oct 2025 at 18:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes from v5:
>   - Master now includes the accel/tcg/ patches.
>   - Updated TF-A/TF-RMM tests for FEAT_S1PIE and FEAT_GCS.
>
> Patches lacking review:
>   34-target-arm-Make-helper_exception_return-system-on.patch
>   35-target-arm-Export-cpsr_-read_for-write_from-_spsr.patch
>   38-target-arm-Add-arm_hcr_el2_nvx_eff.patch
>   39-target-arm-Use-arm_hcr_el2_nvx_eff-in-access_nv1.patch
>   40-target-arm-Split-out-access_nv1_with_nvx.patch
>   48-target-arm-Implement-GCSPUSHM.patch


I've reviewed these; other than the 32 vs 4 array size thing I
think we're good to go. I've put the FEAT_RME_GPC2 series that
you reckoned would conflict with this into the arm pullreq I
just sent out, so once that's upstream if you send out a
rebased series we can get it in fairly quickly I think.

thanks
-- PMM

