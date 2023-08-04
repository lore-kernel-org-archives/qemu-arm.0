Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1654797ejb;
        Fri, 4 Aug 2023 03:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMcG+m5g4jbBoRNTUzVO9sfIkNXonUlKDekwQAfiBdAeniE4ou3FYL+h7WTwYtnmHb9MB3
X-Received: by 2002:a05:620a:4009:b0:76c:a3bc:7fc2 with SMTP id h9-20020a05620a400900b0076ca3bc7fc2mr1606929qko.34.1691146261755;
        Fri, 04 Aug 2023 03:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691146261; cv=none;
        d=google.com; s=arc-20160816;
        b=lHHPHV2VzEJSy6GJvmF2BkT3vPU+vR+UQtClrpM/BHnchoWjdKvgym/bcNGpwIdbRe
         u8v5mLqeAv0Rff10sQb9BSLgBz5XA0BrWXH0tde1zHWuHHCqth7iZZX3R2di1ZsmslYk
         BwgkVWS8o6IVWlMYkSylR7/fq5M5tLZGhK0/YLGohVnga0hU0dcPonOeNpjKsJRhbprW
         6LgqVJMWg8XGsIn1Slzb2mhRoNIkFI31oT9xjwoX2/WDOchZ1GDpbRRhA7JE56KLh0lL
         M4iBCyrQvtS5lKeNFJDHIwqwdhufzzVEfpXr99JXdPhN00fyLhUnwJMH4K3c7/FUpdLZ
         Ruvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CBte90KkZE5akt8HAMxjmTRMK5nngpTSTOeX7Qep2eI=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=lDKDPb5OdHRwzAN6dPF0fydPqO7p+dHhTNJXFbLsxZShMUhPSRR+e5Hjx3kMvY+hUH
         SpKMZ5iak30NozV4oIQfMAp8bCgdzbJ7ig6Y6oqiHOH8BhyMN/mEcBy9GDCjwbyL0UDo
         iauL6K+ms2d43dXm1HVSA9GrmwRiJJAIFcydBO4GMZ+H5194q8bhWvfoozo20ziMEtZC
         g/yANA6o3sTuIgSenI3XtQ32+PdSNJ/U2Ub5wZ3Up0cEoXZ7E3rKU4d174kE4tUTimNN
         2kDtkstUZPev9Pyhi/kUNhtZ0wqogd0Il/6+hODZ1kJU2teZeA+yvezfTGlGWlNzywIg
         EpWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuHp4LVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a0ce1d4000000b0063d538abd25si1053814qvl.89.2023.08.04.03.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 03:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuHp4LVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRsOF-0006e8-WA; Fri, 04 Aug 2023 06:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRsOD-0006de-3J
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 06:50:37 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRsOB-0000lB-K4
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 06:50:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52227884855so2567179a12.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691146234; x=1691751034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CBte90KkZE5akt8HAMxjmTRMK5nngpTSTOeX7Qep2eI=;
 b=uuHp4LVpapRvZ3ntfxgISF01/QFw/eRrLtCduYv7DrGyO7vUajnQ972zcZnV9SWquv
 4JmzCP1DptYAwZ4lhhqbGCs/DJA+WRWUAfSXKvVD0LNfPCzAwT3e8c2n+Hn+Sm434vjX
 aXLRuVEzJbh35MGoaU6B86QbQ3mOzfyvdQpJuFlf3UKij2RtCvPNyj5KVjuXge9bvrUg
 GvHGlED2fs+yT6lC88+ZYBcwwyQLzcx57Rnibkn3BfPW7qRwTbdXiIkxvkx4qgVwFVzy
 b8Dv10Bizbur0v19VzU95yYGS6bl72vkRU7nmqsSHV/C65SOqCi57Gi5veyqY7MP/t8t
 qV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691146234; x=1691751034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CBte90KkZE5akt8HAMxjmTRMK5nngpTSTOeX7Qep2eI=;
 b=jFsBQb01zgigZn3zSz0HonqzmCmFkksAVUnJA+tMDKVofrWwdmotkNVpkTVHVFIOrr
 EUO2OFbFUPeD4/BlDvsSJ85pAxksDiDn/+U0tEUp+4PFoqRY0b7+mOKj3J51DqAFmXBr
 hYH5EH/5e3xeahGPdXWxTknT065aTLuRnsTECkoTPwRH65p7+Mn1VA8EcrKCBk35lmLX
 gfHxdVUVSAhInGtG4JTy/uigT8vDfa45GBqA+AOkDxNKSHXGUROPgrvxzf3jlVLyf+ZJ
 SoSXIBnJFSqXrnqf9QJzV/mfQ00nF58vVAj0s1OS7FUTIF7NiB9JsJRWYhVBzNU887LU
 wTzw==
X-Gm-Message-State: AOJu0YydnYxo3SYNGKEd6sfnHJUqAkQFYsS+JKW/mo59Z9RHcgJNJN+r
 kZVAn3tkcW3/wqbRS6DwWAgqYeBnOTSxaDORVm01/Q==
X-Received: by 2002:aa7:c7cf:0:b0:522:2ba9:6fce with SMTP id
 o15-20020aa7c7cf000000b005222ba96fcemr1407505eds.8.1691146233891; Fri, 04 Aug
 2023 03:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-6-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-6-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 11:50:22 +0100
Message-ID: <CAFEAcA9pw9_EY_muZLvsD5mzp0oK-ootvTxhkumBZWvTxkw6Rw@mail.gmail.com>
Subject: Re: [PATCH 05/44] Add GIC-400 to BCM2838 SoC
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TlX+yPYjf9bM

On Wed, 26 Jul 2023 at 15:37, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c                     | 167 +++++++++++++++++++++++++++
>  hw/arm/trace-events                  |   2 +
>  include/hw/arm/bcm2838.h             |   2 +
>  include/hw/arm/bcm2838_peripherals.h |  39 +++++++
>  4 files changed, 210 insertions(+)
>
> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
> index dd650c8148..c687f38a39 100644
> --- a/hw/arm/bcm2838.c
> +++ b/hw/arm/bcm2838.c
> @@ -22,8 +22,36 @@ struct BCM2838Class {
>      hwaddr gic_base; /* GIC base address inside ARM local peripherals region */
>  };
>
> +#define GIC400_MAINTAINANCE_IRQ      9

"MAINTENANCE"

> diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
> index 8214003baf..0aed6f1bec 100644
> --- a/include/hw/arm/bcm2838_peripherals.h
> +++ b/include/hw/arm/bcm2838_peripherals.h
> @@ -11,6 +11,41 @@
>
>  #include "hw/arm/bcm2835_peripherals.h"
>
> +#define GENET_OFFSET            0x1580000

I'm guessing this #define ought to be in a later patch.

Otherwise:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
