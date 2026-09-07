Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF773C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 08:51:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3V44-0004XX-Ij; Mon, 07 Sep 2026 04:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3V43-0004Wr-Ck
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 04:50:55 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3V32-0004iJ-Ny
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 04:50:55 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-836ce6cbe1eso24880207b3.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 01:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770991; cv=none;
 d=google.com; s=arc-20260327;
 b=L6Y1+w5F3AVe+HuV0bxMQOZntWvsbk9iMYPtUxd3CL5UDRK8r05ZGvr6gPamry81Wg
 jEaU9SkI8W4vH/SaX9hckTRL9prvB/BQ0pHzj3Cr0le4dyHO1beXW6tZNJJs2NHXItr5
 2ejZ0eb53LxPTBbQwWVTdF3I8M9kXndunHDPC4yhkPs+MFOGFPbOO/cpW2CPg8YMjf5j
 xW4k9H2vctR1cKYNxtyJeoAV4C97TAA8dFquanUaF69Uoa+56TTzSl5pRs5COLwIFrB/
 GMsQyB7qXmFmeSXShW+JXcld1QYY6pyUR1sb00kPQd42jgoa5zl1/fKzq/YOfYjluEJm
 Adkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qW4G7OEwi0ISWEae7VLuLCQ+DDySvb+wENV6SUFyX20=;
 fh=bH+13c2snE6+aVES3F9NmshYSXIHTP9fmBd7Q3NSEDU=;
 b=SQ7JQxwHfxiH6MaMuYbF/yNyTv1jRj7aFmOXGaw8VOwwPiSlCC6xRW6dFBLF8Zn2B+
 WgXWICKVS7zVUS4/V2VQf4URJSqZqxn7TwBjm9Eixb3Uk6U7Ua+CQCyFTQaqUfmh5hV7
 EPfjHJmQWacOyuVmx33gF6qr8YFkkOHYnkPczjN42swm29K/eccT9V700iYsikTYCQdQ
 2jwUWHkHi/34iNq9oxOo7umVX0mZCqBR+Tsug5+/8RI8ijtnEwLmQDGBrCfZBJS4JxrO
 9th8POIUZk7TpkD071S4ipmhARgjD8x639VQIc5XEGiIJV3tOFxRTVA39CwM0a5ErLNF
 W95g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788770991; x=1789375791; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qW4G7OEwi0ISWEae7VLuLCQ+DDySvb+wENV6SUFyX20=;
 b=lguO7cGQ34YmrrYkuwfDZAmogGGeJy5b2peXwefEgQCbtvvxV5obiowqHzQOuPBG82
 Pzs9ReCJpe2CeixAwGR9TBQhw5+u7GNo/ezIYkj98kEU1BNCL/+tkL0sa5wnOvMsKbT+
 tfjJPK5mNkmkCgUdBXKFFBg1Jr9lEdpDvZo3nao54CIChRYZ2z57b3rN4PKY1xJqf80B
 GgMDDJ0fcsm+wHUOqVGN7WFcgtlh5GUBiycDszpWeUzMYe2Irf5MDROnjmvhrbFCDV1/
 mB50OrbvzXrxq+oRbJjJuRlFQnA+UAXmdjP2hHRPQrZRNUSy06I6C4UabkSgxTYtXMgm
 6bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788770991; x=1789375791;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qW4G7OEwi0ISWEae7VLuLCQ+DDySvb+wENV6SUFyX20=;
 b=mo1hfR9vAWhFyR0TvJAh83HTVcjdFMopMu7WRButpY1D2cNI9ZX6ig2VEkYMjTqoIA
 jGSSs1qUDbE8JLBwBo04C69ezIic/YhWIBFXYev277tpItuz4tb9FUJEwCzCRzB3kvwC
 gyf+kDSUXpbesueFuwv3Qkp+s2QqHZcahvkDx2yX/A8EOpFkl9gaii4ZV+duGIiVISO2
 +s0PbC0AYgvT0x8MXhs9XE+jpyLMcbTeiI0skhrcv3BgsgbSYw0XgK1UQwObeqH4rVnL
 z3NkjTzgP7y66KutFagLgYgXjY5+IGgMQYD6KqoyXCjWgq9obrEWaLNZdmP913/yVK8a
 UxtQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxapDmv+BWkfslRBFNGnwiWCO1Cht5byH+5EtIgnRBXM8kvPeAsd871dZ4xJ+bXN+sP3P3Wn1MhcA==@nongnu.org
X-Gm-Message-State: AFuF++lrcvPWSrvrmwyRNHY2GoAMohdo4eItAbYJNgzKGrmW12rFD8Ng
 8x4rZqoBO0/bnN7BIYpf+730iey0o5eq7ErXotPXrwb+lxn826ZmHpFAiwEot6YC35M6xmA3u9O
 ImYCkXLgpbV9JCTeq6S85ZO4mXcuU8S1A6kz1AiVaKw==
X-Gm-Gg: AYBFou0PMUtVm/Qlqqv9Een1h+tZatcU7Yj567j/i46eI+1Igcu7s70x9Gt1t41gpCc
 vgqGk6R1MZ36NhgcsnQFxSmlgQXxNYKmkYUve6Qqv9bTKRtaEEY0srzIKIVuqJ2nVx8dHp2uhqZ
 11iDa+qXo09WDLzJLzZXTLW68O0CDb7oA75jVrs8htNCA4qlKFPgu7FBpxJPqaRDACY0pB3upBY
 IF5r0lGyhuREVgcqm9YuOVjOVZ5qaNhkoajBtCacApjLHqE3ONrSCYEfxsk3FAGxnsakgXSu+rP
 rr0EadZS1YlYWDd5/vZhSixpSzV1mq8DtEzcBb7YxwmqSlyVFJ8ftmGoNJZ/0QbuaaFR/HfuuwQ
 7F7gyuVGecQGKCWtcbYgDzbHa2vjg
X-Received: by 2002:a05:690c:660a:b0:872:1e2e:b496 with SMTP id
 00721157ae682-8721e2ebdf3mr75090757b3.31.1788770991069; Mon, 07 Sep 2026
 01:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
 <20260906194438.93046-2-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260906194438.93046-2-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2026 09:49:38 +0100
X-Gm-Features: AcwNN1X__Gm-NYND6TgbCBNpyxoWi1198oqq5VpBKzlteElhAVqXnlTLFf3GIB8
Message-ID: <CAFEAcA8PROO7xjG8DmqHxPXrPRjx_bHddPARyuFGejE9miOqqA@mail.gmail.com>
Subject: Re: [PATCH v3 01/36] target/arm: enforce Armv6-M NVIC limits
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sun, 6 Sept 2026 at 20:44, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> Armv6-M supports no more than 32 external interrupts. Its ICTR and Active
> Bit Register locations are reserved, and Cortex-M0 implements two priority
> bits.
>
> Reject Armv6-M NVIC configurations with more than 32 external interrupts.
> Add a check-tcg test that verifies the reserved register behavior and
> priority masking on the microbit machine.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  hw/intc/armv7m_nvic.c                   |  7 +++
>  tests/tcg/arm/system/meson.build        |  6 +++
>  tests/tcg/arm/system/test-armv6m-nvic.S | 70 +++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 tests/tcg/arm/system/test-armv6m-nvic.S
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index a7651f831e..c1ceb7450f 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2728,6 +2728,13 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7) &&
> +        !arm_feature(&s->cpu->env, ARM_FEATURE_V8) &&

You don't need to check ARM_FEATURE_V8 here, because setting
ARM_FEATURE_V7 always implies V8.

> +        s->num_irq > 32) {
> +        error_setg(errp, "Armv6-M NVIC cannot exceed 32 external IRQs");
> +        return;
> +    }

-- PMM

