Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541FDC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfaXu-0005Sk-LX; Fri, 03 Jul 2026 05:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaXs-0005Ry-SY
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:50:52 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaXr-0003T2-D2
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:50:52 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-664c7dc6830so303529d50.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783072250; cv=none;
 d=google.com; s=arc-20260327;
 b=Lbjtm7V3++MXwql+W295BaNTcMZ3iKuHsFoM9o8184xOt2ldwPfnvBGiNrCvMuHxwJ
 UM7kp4IeSodSWdA60Vpy20voWKsblBn+Ynz3sKRRs3bOKZSdS8Vo7wpLgkIA20vLHuDh
 zFXdD3CU5CKjmjKlgjFNkStK8JUFtHwryZytRqjlABa3Qeiz+B6m2SihbIIOKq3C+3ga
 6vAGJmeKfQDsfifgz2wAYzy1QRUaaQY4NMH/7TD21FS303v7rX9wCa/O8g7gnIQ6sfId
 5Hw2GvFesbkmeAMKKqbS5EcrmxM348sEGyLRRQC4LzaRXJAcwselQ56pz8ojrOYS0yzl
 0YoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tiKaSqubvoYPwqNkTtrnfUm6z3Z4YovKUb+vtD0Pzyo=;
 fh=RueaQLvPKZGpF5w/Y6g+7tiPoUXXII/o9g5JZXE9B5s=;
 b=UbVYYIParjByfkfRwzOhvvqu08C8OduQMjufTzsN1jcAdUMtGkAD64r/QklapVQJjy
 pzQf/RQF6/m1G+Kel9k3kgHGhZH82o8pMfdFIcacdSKjoTXkXuKvVWSLvw3c0aKTyI0Z
 qCZV4/xsYWzJ6u/QhEPONcq0JUy6o7AXaiNOvCVXTC69zCfNveEarBoVLtu4OBZj3U1A
 SDMb9gyqGpj3aB90Q02Ac4VPGRWsxj36ky2jlI1ewstbEoK+egsAiv59nS9ctOlXav2w
 sUbL4WoEWwVJcYGr+T+S4kpN0iU0sPkS1lYHicgsXKwqHbbsbT4IJ4gdg/yO0eRd5QSL
 NQSg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783072250; x=1783677050; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tiKaSqubvoYPwqNkTtrnfUm6z3Z4YovKUb+vtD0Pzyo=;
 b=UeB/LgkWJTkrrfL50hRCqaLG8hcSqZncB9NtPvnGBCe86JoW02IUYhJ28goHKZZMnZ
 nISplVpFt/aV1sSPabnsywmDYncAnc2dqj/JlgTBN0IEL3Is1NldLwizaHs2Pu/5+WoX
 yM6s21LaD2xJ0HI42xxKF78GRKi/wlt+ZnVlxip1sd+jABwRMTwAYfuIK+Z7NR0wr5kj
 vaU93SQFrwSQ/dbIX4bSN4f2C5loPfbMvV4ePvGlAaIz7bZOTpJvxHYs1NYakF2mQo5M
 k2E/zrK2CmcC4fAVPOjwxRKj5lyZiKN4dgXy9b+fSohe1cNh3jyCPz0q67Yfb2Hkack3
 kyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783072250; x=1783677050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tiKaSqubvoYPwqNkTtrnfUm6z3Z4YovKUb+vtD0Pzyo=;
 b=nxi9O6LdVmdCN/rzHU1n91fy9u9Kqoxc74W8Nv2FwPi1q6pOPZdR05HqncCTxGzRPZ
 Lv+leNzBroTCoI3rrGsOAOizSoWUYVWWSB9yf2RB4va42OXEqCwG6CDzoiHDjYkaHVxC
 C2xM0NT8DEAJ48Tt+0bYZR+/q3KvY7LLb2MZbk4cD70oKKAaQ6xpVAoWmFr2DQAklwFM
 HkSDjoCN523WJOLBECpr2UGJWT3ryqio47KP5ik7AO8VmFBMQF0q5+jE24Q9eOGpIpG9
 hN1BcLTKEbO7wyh+9zpyKUnKDwbcteiRvNbczpozhtS8xLP9ZagWRQjTVISbN82sQPd5
 WSTw==
X-Forwarded-Encrypted: i=1;
 AHgh+RocoE7Ffy6zUM74YeCorkWgg9UfotyXx3B8YD0SCNIeMd/SnxAymIEqHbVZNJHcJSXFKJGavC28Sg==@nongnu.org
X-Gm-Message-State: AOJu0YyYcDWaMpH4WBSFw/Byeml69RpNTjNQWSEjNqLXeak2bbb7uTU2
 zWuN29hYjMceosPOIT5JVtADQZBKE5zortMGYVwhh006huIjD6t9zBFuM0CWH3+FgC8pwB1iIbh
 kMnvTYa5rc2WnKc4uU4lbWat2SMachb6923AE71T3gQ==
X-Gm-Gg: AfdE7ck0NlUQsGAZOYW+5waehesGHMIzHTsR80/ATztgmoVAQRiWmiccRXGF+GzYp56
 deWdgAmuBtv3vXwBLe/eL58QH4qV6mEoh2OdzCqwI0BtHDj3K8Pp2nU+H5osGQsleLG4uZ0FAIR
 N1RG5hzzEvBYTbTX4qTQBe/P0raRXRaOotCNWo8qU0YphMMvBZl4mhTEnNOOaMe5yJP2lTP7b8Y
 Ml2tibgpkJuq2tTlE/gDbpTj1NH7dd2Y5YmRiVwX/AhBRob+HyNQz80i+PwyaZO0nNCDyHD5qW1
 JYNF5xWlreONCou7wpQc5FJw9pbOIDjc6XUy9HFYmyJ9v79UXNBSgV2+HsUmcTQMLxM=
X-Received: by 2002:a05:690e:408c:b0:664:a7f7:eec with SMTP id
 956f58d0204a3-665219555a9mr8833933d50.16.1783072250059; Fri, 03 Jul 2026
 02:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260625161855.5132-1-163wangjack@gmail.com>
 <20260625161855.5132-3-163wangjack@gmail.com>
In-Reply-To: <20260625161855.5132-3-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:50:37 +0100
X-Gm-Features: AVVi8CcH523shzouXeTW7C3-MHTgnU6MDoDimAJxKjjzlYQS-cBLLZUfca_BUv4
Message-ID: <CAFEAcA8cyj87FWcJkT9=yUCdX2=Zh=2ZV5bu8jco4=PUwG5iXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/misc/imx25_ccm: Replace DPRINTF with trace
 events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "open list:i.MX25 PDK" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 17:19, jack wang <163wangjack@gmail.com> wrote:
>
> Signed-off-by: jack wang <163wangjack@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/imx25_ccm.c  | 34 ++++++++++------------------------
>  hw/misc/trace-events |  9 +++++++++
>  2 files changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
> index a6665d5535..d051e8a2d1 100644
> --- a/hw/misc/imx25_ccm.c
> +++ b/hw/misc/imx25_ccm.c
> @@ -16,18 +16,8 @@
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "hw/misc/trace.h"

For trace headers, we recommend just "trace.h".
>
> -#ifndef DEBUG_IMX25_CCM
> -#define DEBUG_IMX25_CCM 0
> -#endif
> -
> -#define DPRINTF(fmt, args...) \
> -    do { \
> -        if (DEBUG_IMX25_CCM) { \
> -            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX25_CCM, \
> -                                             __func__, ##args); \
> -        } \
> -    } while (0)
>
>  static const char *imx25_ccm_reg_name(uint32_t reg)
>  {
> @@ -118,12 +108,12 @@ static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
>          freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);
>      }
>
> -    DPRINTF("freq = %u\n", freq);
> +    trace_imx25_ccm_get_mpll_clk(freq);
>
>      return freq;
>  }
>
> -static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
> +static uint32_t imx25_ccm_get_mcu_clk(IMX25CCMState *dev)

This is an unrelated change, and it causes the file to not compile.

Patches should change one thing at a time, and you should always
test them before sending, please.

thanks
-- PMM

