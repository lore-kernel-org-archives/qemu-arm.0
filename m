Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9FBC44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 15:57:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjfUx-0004Ly-AL; Tue, 14 Jul 2026 11:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wjfUw-0004LV-9V
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:56:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wjfUu-0001Ye-QQ
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:56:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47dec32798aso4585617f8f.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784044599; x=1784649399; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pO6YrnYZsOpecMewyft93OrYcmGVXrjV/BFO5izC+4g=;
 b=E6TXIsAJv/2g3O/f5pEXHppEA8HSD4/PCtz1lVHYRVlCMN9+fRMjKMUjyduxDoEsiR
 Q2voGanOrFG37ohgHH2BxyU0DM+TayGz2DxG/rRC4dzPBxhyQDzlnO8flLL3qMxFRNCX
 PyYMeX4NQkqJktBcsxvdEgGqj5rgF+n9hEZIN8YmKAkUEyNexNWWy7cY8ws4oWzotEXT
 cYYCgpviiQdq2oQsdb2yQdlLSbA0tGSE8JpZ0ybnZ4XOShhzfrr5slGPRQCs5N5TxMz5
 f3h7o8Aycy+f5xACWtkoIwtirHpaAU4y8uNIOWWsL4iIy7qgMkZssjYmeXHisjZBOYST
 Vy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784044599; x=1784649399;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pO6YrnYZsOpecMewyft93OrYcmGVXrjV/BFO5izC+4g=;
 b=S/ErggvtBwI4BppzNOOkhPxiPEKFfzyZeomt7W63MUVpGopoE3oCSY3nQRsyzYBoKu
 NWviIAkBVLWeW1W7ssvGeDWvZCJRAX7hKWxDZQeZslNU1QPCP+5uzL/yAvh0UghtAFV+
 WZDSqwU8zzoKuWxtKTif6ofyTvnBxV8pBRsAt1G02+X9B01ZuTg+SRO2roAE+eiI9ZQ4
 fK3bi8NJQ1fY52r6nwrRRvKMAxIU9xEViHx1kLB56Z2HJ2dpcmsW9OCh2+Sk9iewf7WQ
 BC66P0LK3U5jUgPw2CU0qSolpRhT5beXfM/difU2gP/PYIePow16x66J6pz2yETNet6R
 l5BA==
X-Gm-Message-State: AOJu0Yw57BwOh4Y32bnFYbY0ATkTd7LwWeL0mfLt/F0Tkb7GYard1lFz
 4seZ+edQ9mbRFXpXSof6Hf5wAN5ZZqyr2z94ZpK5sf1mddKtHhcGjTK3sgJwvs2ZNpQ=
X-Gm-Gg: AfdE7cnDROjnHafq7VB4t4GySwniSR8vh5bhoSvA16FCrSwuBcwggAcidVwAfBmcezq
 cOTSiTJE7PwCnFhjFQUmu0BGl+Ur45rHtBhsS0HAR9fJBk3L0p0FOsCdZQAcpArzGHfrCUFwmko
 QIPLeby8E/zOIwJPsceU46cGah4fAQj96wgxTuFyGf0D569jBPOOU8WGp+3bb5ulTxN1on4VgcL
 pSs5YE1iQ9155xoaVQpZZTJOowhS0jRdTrRhDgIG2GvutGkoHwsVeWKAxJLlXlwPT3vDiMddVD6
 3nVRZdDrfz0DHaobfztqKwmGcwoFwYMNA3dpIW2sVuAwMxm8+VuWkz43fQom0pSkyutMcFnL7mP
 2VdJDPE/OIGor7llEPEhtHNOd814ygOzY78IjVoyAtMIejknte7upb0FC2gqb93g0pZSa5AtAf9
 8t3MYkfViVGvPQiItcurIpPAY=
X-Received: by 2002:a05:6000:46c2:b0:47f:48d5:2986 with SMTP id
 ffacd0b85a97d-47f48d52b4bmr2418529f8f.53.1784044599163; 
 Tue, 14 Jul 2026 08:56:39 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:c8e:44fa:aef8:4850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f462e0cb2sm9122294f8f.0.2026.07.14.08.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 08:56:38 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:56:37 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 5/9] hw/dma/soc_dma: dma bytes is uint64_t
Message-ID: <alZcNcl77Z9Yqicv@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710105907.2570621-6-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x432.google.com
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

On Fri, Jul 10, 2026 at 11:59:03AM +0100, Peter Maydell wrote:
> The worst case number of DMA bytes that omap_dma will ask us to
> transfer is 0xffff * 0xffff * 4 == 0x3fff80004, which is slightly
> larger than fits into a uint32_t.  Move the byte count to uint64_t,
> and adjust code that passes it around to also use uint64_t.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/dma/soc_dma.c         | 6 +++++-
>  include/hw/arm/soc_dma.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


