Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B3CCE7B08
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 13:17:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJtfn-0006Mp-Un; Fri, 14 Nov 2025 08:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtfU-0005tL-TP
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:16:55 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtfT-0002IR-9W
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:16:48 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-640f2c9cc72so1514287d50.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763126206; x=1763731006; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4IyIKZFBmHVETvf09ZtZ3Oav8iu5fHOkmm9MGs84064=;
 b=Ip9+PS2fvXysGjP1uAuVvr6zOzGaaNPhNzY/HLVrNWjfvOP1R7q3oQaLuD1pwOZC0j
 x3+46XQV9YT+BsnxXlenO88h43LjlVybKN/Ga+cSGpyCioykAYAO5MUSQHIVj2HFNWYQ
 jDsgfMahkp1LNwAMZfkt/a13+FAehsrmuX6nCc8bsPAU5J7B4DyGxtTxNsRD8+9xomht
 ry6sbNgVO75YAHgDGrc+x423JV768FFa4owHTL4CfhwaMvgPnDGAssiXGLIGvz+OPcKq
 Hvix76yJsqwBGoFTGlpF90/WxCQe0W3pW0Y0VVG4qildB6OYAehdgl+a991zAPQFeExD
 WBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763126206; x=1763731006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IyIKZFBmHVETvf09ZtZ3Oav8iu5fHOkmm9MGs84064=;
 b=aJaoJT5zep5IZGWDYeMg++Xm1MbNSBUX4bM5Re5SlJPqiNOlZeijpoI66guommabK8
 QsRpt72QUC7tQ00juUAMnW3w3JCoof1ClmaFqrCUr6hvaSNbE39BqCrsfRvR/ttBLC7C
 S1D7KJbsE+DAx7hBZYVr5p+/RRGwUgDs7W5JgFUMp94TGsOfcML6hFciFTGNZkE84HuH
 CZf/ySmdjcgURuVam/YIVJhyPA3/OqODVpKGZN+b7j/jAMMLuOcd/mFc24416wTz1tRh
 wxpyhSfdinf0RIfWUVGFzZNIBDc1ZBw5qHctv2Wp0PLCWy+8tk4esAVk1av60+L5/oyw
 vOLQ==
X-Gm-Message-State: AOJu0Yxg/TMjYxwZPO6ik3xrN7nPGrrEjnwG758H8/pHHCPPXdgw58cV
 9gCmnXTy7LTVoQ8kTtqafTgGJrtmopJ7tyOv+XaYnX8yOOIoy2ZwVbPZGmhTd1RMlL7JLR73Asp
 ujxGTCHZl1j/NXhQRhSD1Ufr/HmP/38hYY5rjZ2j36Da/FiAb4SkTVoA=
X-Gm-Gg: ASbGnctGFvucGs2jfZxs5P3rPzmhNEBbul8DQ4cvHnzIYKudM1L86haCvB+PUNCXb1k
 xNb/RNys/GFd0cwYIxagm1nnkAFhGGzKg3hADywRlV8p2xSefacO+eXjc0Iz5UhKST0Jj5ZrREW
 rt6twwez1m6gdhewlasmK7FB+v+WwhGSB/ATK6wVxuTSEPKqQe86annBH0YJotArJ2u4v5j//6e
 VkDkKyOi6DHOELVPmt+aEODcp2bFGPtiIBpyzFDG4XZtmsTVXZInjjIivdqXhzURdVh+mYg
X-Google-Smtp-Source: AGHT+IFhRN+Azr3gUEK0bqvU3vlEQ3RfVgtnw7N5+2b8L9y4y+PKuDF7mUf3YbAdY7GwiqaKLerUAEG+gcIwCtKbWK8=
X-Received: by 2002:a05:690c:5086:b0:788:e1b:5ee6 with SMTP id
 00721157ae682-78929f4086emr40008227b3.70.1763126206095; Fri, 14 Nov 2025
 05:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20251107143913.1341358-1-peter.maydell@linaro.org>
In-Reply-To: <20251107143913.1341358-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Nov 2025 13:16:34 +0000
X-Gm-Features: AWmQ_bnB8ak65mO4-BDrYlIMr9FeSdCSz2rNziwD75WVUlq1J-S332_kcYFbtjw
Message-ID: <CAFEAcA_M6dO2L8GEFm_LafpK8sbGWTiTp1aD3sWxQxtsjnV5aA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Account for zero length in
 fimd_update_memory_section()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

Ping for review?

thanks
-- PMM

On Fri, 7 Nov 2025 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In fimd_update_memory_section() we attempt ot find and map part of
> the RAM MR which backs the framebuffer, based on guest-configurable
> size and start address.
>
> If the guest configures framebuffer settings which result in a
> zero-sized framebuffer, we hit an assertion(), because
> memory_region_find() will return a NULL mem_section.mr.
>
> Explicitly check for the zero-size case and treat this as a
> guest error.
>
> Because we now have a code path which can reach error_return without
> calling memory_region_find to set w->mem_section, we must NULL out
> w->mem_section.mr after the unref of the old MR, so that error_return
> does not incorrectly double-unref the old MR.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1407
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/exynos4210_fimd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index c61e0280a7c..eec874d0b1d 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1147,6 +1147,13 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
>      if (w->mem_section.mr) {
>          memory_region_set_log(w->mem_section.mr, false, DIRTY_MEMORY_VGA);
>          memory_region_unref(w->mem_section.mr);
> +        w->mem_section.mr = NULL;
> +    }
> +
> +    if (w->fb_len == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "FIMD: Guest config means framebuffer is zero length\n");
> +        goto error_return;
>      }
>
>      w->mem_section = memory_region_find(s->fbmem, fb_start_addr, w->fb_len);
> --
> 2.43.0

