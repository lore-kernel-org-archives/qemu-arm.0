Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB74BCD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 14:53:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSc6T-0002fM-CW; Thu, 28 May 2026 10:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSc6R-0002eu-Np
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:52:55 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSc6Q-0005HM-10
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:52:55 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7dca5a81be2so7724227b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 07:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779979972; cv=none;
 d=google.com; s=arc-20240605;
 b=YpF8YygySObCHyA2xzZvBmwxvRC88ILzE7EvuSmq/9u7mPP/gdZzVf9BBtYuoREgzp
 Rzd7OnafagQJOHnXeq1KSG9IhTj2lmZWH7w/hNZuF73bE7lQAGBenntFLfi+g/OFL+Cp
 ivNYFSNbqthJZMNuD0antrXNqg5ARkMFfLZECbTRHkADJlNijee5ycgihr/IrNsbObnn
 ZT45a0xIhtH0S79+WpYi6ntoQAjp2wxalKeuZIPIUwZnbAbhcpzb32yU4mW/CwuvaPaU
 HyEf2v1vtjeRMKSPXmPCs4uoYfU1oTObxK6Y9p+q1KIo4RWashVVSkOHUl8ftc1NIqz+
 R5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YAJ0dGPzwhje96Ryswv7lkftrV15fiyRJ6i2zYsnlCA=;
 fh=20T+8HY4bNVx8qxNwcM00Ai13qyv3jygg7iqkrFbE+Y=;
 b=KzpEpvxJ6CotpOAcCb9vMiwkkZZqT5lP58MEz3uHrEFv+aG052nsYXmomzgtxFLVlm
 Sk2keWFuywmk2yvVRXqgV8yZaZIiZ9F+H0jILbwOPlnPj0mNpPtqZRgbG6/EKhm0tlsY
 hiPbso7aGZQmYdDREdDtfz0J0tpk8nGkFst2WGOm1rqtwgJGEpZqgNP+SOkL+DEWEM3t
 EpmYZ8bFXFwuOjpFvbJQFo9pRsPQ5r9TZGFl0WMsdU4L2XKkM8+bBBOmCaQUm/Bo3q2t
 W8a/4xw6dw8Yp4r/pzazqeLGkqw/mvImDZMCjKHn+Q6Viirkbzf7ZDw2mXCzLX+XTErj
 VaUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779979972; x=1780584772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YAJ0dGPzwhje96Ryswv7lkftrV15fiyRJ6i2zYsnlCA=;
 b=xRmHg5JOE/vxZZZeoZD7YQJltN3lBCodI42VeEwqnURUOHKwlR5G/eqkfuB3Tkgcx/
 JPBqmJnpLN1oTUx0wBrx1V5+fZzFd0U048pq/2Dy9gmFY9cOxuHmvRuujhWihTI5dYMR
 GsQDkZdAcP9TamDbVwh2rHVK0Lyaya8QjHHBGq1rkeAtX2KC/kJ4yFTL1uSrCZyPLIGM
 mKTAmfBtUco4PH9wwoU4PKr8HBgd93UExL0q3+9XItC+9aA4PR6BIOBAJ2c8p0tG8IOa
 kKwO+XNxiTh3+RxV/CDGysgjlTttHZ+M+AqwmSh81pIuBkiDLLHeipb7ODtlszzlViHC
 tv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779979972; x=1780584772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAJ0dGPzwhje96Ryswv7lkftrV15fiyRJ6i2zYsnlCA=;
 b=NW3BNq6kdP4T0hdAV73DIjEfMgUoJ+vPnggFH6OrnWQrUG6VJkwOWPfHuG2B688nuQ
 38Q5nsf0sKabla03uUuuzTIea1stC3sie40/HKsuE6C9UoFxZV+R5kUmI92jxHWSCFr5
 a2THL8MVM9TI+JioGoEVIZhjNH44tr/OsxkLqIEIbKyV4AiGXCNSy1Dwu7QOqL+u/kPu
 V2AEMqOQFaVOx+OA4eERvrdEAIcuL39ayZbzJauuNGJA0pyRPVpAMD/8kV2L7EnrfwLw
 cpYfiDZl9MY7CExZN8LtN9n5oqZEq33SUfjCSp41RbMZ5+/AmePCy3vXx3oiNN4gYhVo
 hcjw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/QgaM//1g3O2H566bEcj2ikypmxlqYfVPU9LHugriVO/9h3e+TCafYXZf1409IHTmeDHfFLcYixA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+d0WFUfDooteKoRPNFIte7/TyhMvuGF4EZXtUC9V4n6uupQv8
 F2M1M8uVLsX2h7H84gKXR7CSg+dY4miifpbOSTuXIivVQu1wAifwVNxK8G6Sd7ph/fx1A/oBBS4
 WTIJQFFqmmo2tSsSjkRMB1pcJBtcjNIFfTsIkxPI0mw==
X-Gm-Gg: Acq92OEsQ56so+BupiEvkuOT61ul8pEDQMAJjnnq7y981KulpQU8Z7BXsirjoKPAPp2
 hYlk5Q9DeMhsf4W2NZtrfYIUzq3Q6FPBQbh0zofnGlVV5MQxgrGb/j9byxk2uK2cetyREXv/cym
 Ho9tjTmn4QJYGmDsWgDqC0JSk8+YD/QwrWihprQBIOCkB68RkBuXlwdmXDIn82KYPCO69DDemEx
 tfQVR2UJ/bL8NYTrw/SIOHYDoqKvvzyxDNhAVWcjGUAdB9RYAZoeYYvDncFNHCqHpUuget3oxXj
 GYp20u+SNlO3+Cb1a5upZcAaSaqlmwnvTutqOiVxdk4pxGKFrETzSvFBs7FpQeUzckoXUuLDLZf
 ePa15bAYx20s1
X-Received: by 2002:a05:690c:6a12:b0:7dc:1d92:17f9 with SMTP id
 00721157ae682-7dc1d921c36mr44219887b3.27.1779979971780; Thu, 28 May 2026
 07:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
 <20260511-feat-mte4-v6-3-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-3-8557cc1313b9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 15:52:40 +0100
X-Gm-Features: AVHnY4LhXf20mD6Gfud7JWBwpztXsU0lgtjVeaZi0M5L1ySHEb28Qa0YpvAv1lo
Message-ID: <CAFEAcA_DxvTNq6qV0JXP5T+1r2035zuYM-G-n51H0ZkETPVzGQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] target/arm: mte_check unemitted on STORE_ONLY
 load
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 11 May 2026 at 15:01, Gabriel Brookman
<brookmangabriel@gmail.com> wrote:
>
> This feature disables generation of the mte check helper on loads when
> STORE_ONLY tag checking mode is enabled.
>
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h               |  2 ++
>  target/arm/tcg/hflags.c        | 12 ++++++++++++
>  target/arm/tcg/translate-a64.c |  8 ++++++--
>  target/arm/tcg/translate.h     |  2 ++
>  4 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 0894a050b1..fce0bde168 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2531,6 +2531,8 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
>  FIELD(TBFLAG_A64, GCS_EN, 41, 1)
>  FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
>  FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
> +FIELD(TBFLAG_A64, MTE_STORE_ONLY, 45, 1)
> +FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 46, 1)

You'll find when you next rebase this that you'll need to bump
up the bit numbers here, as the FPMR_EL field that just
landed is using bits 45 and 46 now.

thanks
-- PMM

