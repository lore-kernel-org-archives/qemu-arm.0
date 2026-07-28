Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C12C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:10:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohZ9-0006Co-Iz; Tue, 28 Jul 2026 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohZ7-0006Bx-7T
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:09:50 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohZ5-0001jR-RU
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:09:48 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66771ded50aso5013837d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244185; cv=none;
 d=google.com; s=arc-20260327;
 b=OHt9uHd+1VBTqZHBvIw4FaLP7T3HO7PSLpaw86eshpbCjAVtf0h/N/LX9AgVCHbIP+
 +vxOenDTMP3hcfxgP8NntrSycceLZw/pGzi9ieXGSBdpDRAlPRj0Qx6JL+Yo5Lfq6bRz
 WHGJ90zqKaFmb+kMRt91Lkc9U4bS5uO0Kz3qVLyVVail6o/fjYhHrAkU/bK7AeaNA9t7
 rSjVgtJxCpJn3ysnJt6TqW6jAQmgkpeqJdkLNxPp4YZkKavkvhQv4AKuqnbHIIytpS8v
 lNXTjdGBsmhItuaDqvtfzUOzoOpQRYYwZHLfY0EVcJjVLJPhUyW9Nbk5WMCMmUcKL0HG
 0kFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zju3GeMwtSPiKXUgxlCqXU91qwnJyMRcuBsKA0ohWRE=;
 fh=9BAYfCkZZr6UMFYG1KYTKRstJuc60Q6H3cQPEGZyQ6I=;
 b=f2v1rVvVJkBeRchp87LwLTg5TVoQABDbBlgZrVj9ZUGn/iywt/KbXbJr2v6aMzW/Lc
 t3V6OMPgCXOIpFFHAhaE1940tJ03tYYU4iDBwLHzB3RrCFgTgyHQCJEb4osp9w91QxpV
 F1RuBcV9N3opb5NYpjYnrxT3rcD2MyJ6MlzQ+5sV405wrplzND/XOXQWBo1y7ZdNAqlQ
 QACuBEqt1k6zPdDK9t8yZQD3Qsfd5NPJHGtst7m83wQEmhbecSTsWj4QWqX2HlXDq+HI
 7HrXxr/5BsuoL6Mp5lPTHlnPqAUlLNNnKHUpmosTMMxdNR6KH5Gcdny6/mRNW9iaP1NS
 gy5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244185; x=1785848985; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zju3GeMwtSPiKXUgxlCqXU91qwnJyMRcuBsKA0ohWRE=;
 b=c59GmQ/ZrBazO64CcnA1KRhIo0HHVHaLnPU5bgK3VyMGU6y5KyRJgtFdM7y4W0ICoG
 bMGXOazeJbgr0p8fcskk+Aip5OOfdz5yWO5Lri817nQJ4zXi6ZFJJZtupIvBOvDPTrbe
 NFhWmyIksEfzy3k7C0/bB4qOr1xPxcJU3JNPLzpl56+Cd+fJoZnIb+bIoLGY4xUVphr4
 6u1eOiNgLXZOoNWx6XX1YhEmeFNyqW/t49+6wuO9eQOVNzcthT32VQhDxgH/7MaiQ3Hw
 TmPST7xXvpuuleNEo/wo6SIH3rFqkyba0OPfp180jDMbY/dc4edXZz5Ezg+xc3F0l5F0
 qG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244185; x=1785848985;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zju3GeMwtSPiKXUgxlCqXU91qwnJyMRcuBsKA0ohWRE=;
 b=Z34kN3+1Lex4V3aLznnr2NN94Bpa0u1YUpd+HGRs/qKscSLxuVgqojt1rk/Oue1jZR
 o+BrT66kOyE2TH6o0Qy49wHEiClLu/qHAt5oC0CS8yXGCsxo+bMzcK3nqGATwBTXSlYN
 BcWnXy8TRLZNL4uYShmAoc9doXRuagngPIDHgiQrJg49LZ/KPWm2eR+mk/BXxXfu1AT3
 zTWUZKfs5UBt9wuckL/0xqFpisNySkjQZeqLVy4td46U2mt16pLqoUNCyK0oC3HMFAz9
 l3hMCtyhlZPhDvNM9gTVw1Qsy5CB2MMAKqxclAv6USfKc123mywEXnvHyY2KEtJ53uF2
 DLEg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrM08hyhvPcXJ41BSxylVOjODsM48EICTKaNzMeLIVq9xhWbVDz+2MNBe46EK5nixpuDyX2O2b8rQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVmDNkTB1ELWqsfEN4spKFPTPiXQnxI7kFV6SX2jCAfZlV6e/r
 dXdQzNSfcBvMi8tOoxdh0Rixt3OBZ8LUYDEY1C6+N6+hwSon5dvcFztXYAJK/VcLGVKslLqCepz
 y4LPefTxLtxhnD6Z9v26rRbfMG3FE1WsxLcvZq0lhMA==
X-Gm-Gg: AR+sD13SyGkvcr8GjB6tF6r+WRIeUS7m8M2oWFCmK/lwR/vo9CFg3JoaIlEXgJrzX1U
 tr3Rv8Gdx9fDZO/FPnknrP6QwO00AV70+cfDjTYniiHKU+QPn3ckWWcK0hm3j5JaDiLB/vfFT6k
 0CUce8lcrx2sYKWvuyvY3kqNq5T7/qODz4KAQwztswk0KxUwouSEfOdrq/HTFvdH33L68KwjuKS
 fc6HpXn+E2h1Pd+QfRLki8zcoH9UJerydOwBIdznq1vVXmAstVhpc1FkG7vRV5ikZ7kde0PjP/w
 Hbs4cuonAfj46sRlH3R9xQihLGD4SSd1pkyqDWsVmw/taidfVAzz0sjLNFHILJBGmrazPCZSuyV
 f94qrfi+B7TWcMmjy13/oQWTm+7Hy
X-Received: by 2002:a05:690e:1697:b0:667:8b90:3572 with SMTP id
 956f58d0204a3-6690587ef89mr1156445d50.100.1785244185133; Tue, 28 Jul 2026
 06:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-5-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:09:32 +0100
X-Gm-Features: AUfX_myNc4bA7rvIwAsOP2oKsYKIRAPESKwQM8WFSKCVA2kO1MGfj8CKdXHW0Hs
Message-ID: <CAFEAcA-X7hqFtivmjGrNqAaeep0CFfTX6wemF5ELoG4iP8uOLA@mail.gmail.com>
Subject: Re: [PATCH 04/10] target/arm: Implement BFTMOPA (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme-defs.h |  2 ++
>  target/arm/tcg/sme_helper.c      | 54 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   |  3 ++
>  target/arm/tcg/sme.decode        |  2 ++
>  4 files changed, 61 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

