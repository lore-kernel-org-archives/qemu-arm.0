Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp107728lff;
        Fri, 30 Jul 2021 03:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3bTETuWBhYXjQ2f8JuHsxyJ2ZGfM7GAEsjN+Z9URHTB3hBN+Z5RzDBA313x5iCY698NJc
X-Received: by 2002:a5b:4c8:: with SMTP id u8mr2295528ybp.255.1627641381135;
        Fri, 30 Jul 2021 03:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627641381; cv=none;
        d=google.com; s=arc-20160816;
        b=bTW3g30FznynHSlscUnwRhEnG319xBG76PET2wj9ktY0pNmh0aEALuAlR98Pl2niIy
         uf9dVfiYLfF2NzmDCbGHA5lLhZwP6CV+PUmnkcOesi3lpivl58P1N2ztLof3oP4HlQI5
         BzgvTPps7IHScMj/fSM37aUo8tK8K4QrFuqpEn/aO5Ommo/FwqYMf6/GXJfv89Lijhoa
         df+S/Cxg2UgYl+lDYHd15wzS1yWxOhfnu7nW8gl25D3x/bk4AP0/b9WEgyCAakFYI0P6
         pGtlytReTsxCFC9vzTSiAbdpoPKkH3sV+dSMrFCa8pGkC1UnYOnlplzb85tbl+1/5rCQ
         Sgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yJV6LjXdWTQtR8O9YEarHEObUdrmcwDFsnQ6AOBWXFY=;
        b=PNztRfHMLFW1rk7wK5WGRwfEghcaGbVxu6J+/d/mEncTBl844w2qAMgSTLA8NN/WTT
         uumC2LpAuZm/JiTuOfaawamIcn4vLNt0n8+1dT+2JoNooJGCVKk5LzTx3Zs1W7+z9fRy
         chHIY0S2ZNQj0T4M/5w1u4GQRJ7672bZdmEe1dB9MaJADnCaJkqbtrdIhZcEY4TIwFxb
         T5VIcz3ehR3AfC6iOI6VD0lTq3GJYdqSdUK5hSg2J0tVNt6BqWVD3ido+vkJmhLf/ECO
         aM1jh7XmWC1m65qBm0k/jBxjbBUCzldNNswaPtko2ZXq0xO3cgeMF9HSSYAcUKmblV/o
         Ay3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORDyW9GH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b34si1750070ybi.336.2021.07.30.03.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 03:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORDyW9GH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9PsK-0004rz-Gu
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 06:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PrQ-00045W-VQ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:35:24 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PrP-0002WI-D9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:35:24 -0400
Received: by mail-ej1-x632.google.com with SMTP id e19so15963719ejs.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJV6LjXdWTQtR8O9YEarHEObUdrmcwDFsnQ6AOBWXFY=;
 b=ORDyW9GHR11MfupvNRdkI0X4n/B+Muaz6qEpR2keqnRFKg7HANN2UQDmmPZ4IDAm/r
 UP3Xa3J5Xwe4zYbBpTx5KruBhM6cTeAhNA0Q+WFhQRIIRkmcaYl2xLG4ZM+RVaYzi+Y3
 5Qe4njgtPl4HRQDY1ptRuf5Xq0BhezUL2y5n2lJ65afiPjDKGOtTpctMMIuQRa93ADvP
 luEZIexO0Z2yZzPoYc/P+0sK20kUD2c1ediausM2IIAMGI5hlDE71Ib7Sm2RuU69a7RO
 19Udcd5PmIihHwJppKi2oi3zHbisgDgwulP19L8mLfSAA65BQajYnv/a0plx+kuw412n
 +rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJV6LjXdWTQtR8O9YEarHEObUdrmcwDFsnQ6AOBWXFY=;
 b=Sp6QW/jhfajEmt0IKtsUR6vLhu7+5++p9V6HK7+WIIYatmvAF9FjOrqqyf6NXezN3s
 EwaWR84F2LTehadai0Cnl6FosaxyjVPfjMsL+K7LVPvvS5T7KtNJnNN6OK2qFKiBAxlw
 lVPcSpJ0Nw8qxuN6BOS1gExXUAO9IujZ+1Akq+CZ4Vcf2241jUMIwLsLLnRVtmfctTJ/
 eGuWf7ezoyvOJfvxYbnMCcPRrh6tGXWISpULL6zTA3yLBoePul8vsuIBtBZXuab/JQlp
 3eeVTkXqBrP6b035JSBfi1Q4sUQp45ugVvniiAK6zqfBf7WJVdfEmfqHAbX6q2n2QM3N
 Dctg==
X-Gm-Message-State: AOAM531O/lgCvbNIJ0XNxagAqjQtgd6CqeNlkbcdEYsYCFKpcwrz/kLd
 I25qPYxjxrA5Ia1nb6Fz9AVnHwEqkTThrwXiad04Ow==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr1856837ejy.407.1627641321354; 
 Fri, 30 Jul 2021 03:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 11:34:38 +0100
Message-ID: <CAFEAcA9YFk29a2o3_kiJ00OSh1VGzx8nXrFXBpts_c-3FNSOEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +yui/tXyqobD

On Fri, 30 Jul 2021 at 04:08, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> The ARM_FEATURE_A64FX property was added,
> but there is no function that uses this property yet,
> so it will be removed until a function that uses it is added.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.h   | 1 -
>  target/arm/cpu64.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1b0c7b91ec..9f0a5f84d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2145,7 +2145,6 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> -    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions support */
>  };

This feature doesn't exist in upstream QEMU, so this won't apply.

For a v2 of a patch, the patches should be based on upstream, not
on top of the v1 series.

thanks
-- PMM
