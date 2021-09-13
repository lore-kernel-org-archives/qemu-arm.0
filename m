Received: by 2002:a05:6214:32a:0:0:0:0 with SMTP id j10csp5764017qvu;
        Mon, 13 Sep 2021 07:41:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH2htec93m50VtjbM9m0Wfsjde9QvCeCzhHt5eh0uAcIO3ylWjG5bYH+6Lm49G2MsCx+B0
X-Received: by 2002:a1f:a9ce:: with SMTP id s197mr4577762vke.13.1631544115111;
        Mon, 13 Sep 2021 07:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631544115; cv=none;
        d=google.com; s=arc-20160816;
        b=syMnSWCpf1nKYoI2frkqfhb65+OMYyxYONmGXetyRYoka71jOWxqvHyQuVA6SgSpXd
         Bye0d/8okC4tOIBLpw2nJZJxEfp8XEgZ9+bVmccBB20xjKrAimL2ZnuLAJYhqThetnVt
         wD89jsmCSP8aARy0/yqfVH1i9IN/Rzkmp2BgB3T2h3GOVlzj7eC3KCuOlYTJ0LR64j4r
         sK91HcNTDqKpoYEMMUDzR5Q/mKn0UM+gjitppwcA57mTM9ND76gsRZPSiGCxrDBcIi1N
         6OZPA3pDbITk57okbZdguJQxMj/mqI5bjXnYuar4wnTQor9KrYgKayBiBdmrRTb24C/e
         4FXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0C9PruM91VOTSET6OeIFLazCxKShfm+0QO6UKbSRiCo=;
        b=Xr7XwDDdJ9pe+bUCwM7nbgButmGH5+2DEPiHUWgwIiTRSgojW73/MN+a9GLC2v9++V
         0eHTtAL9O+P5Y0A3DAxxme+4XJa6X8obeeZP7egNLEGJIMaW9d+fq36ZvCdgBUNT8AA6
         utIaoHyQ8fInZ/mAtCjC7bz3JeNDTE74UfoCJ1c9X1LN8pVoWfk+j84pvdPZu4y5eovC
         tSbvDTkuLJRJdcawpA0x/ihKquoBZyB+KEfE2CXV65U6o3RipS59ypsD+DPMxTrBAdhy
         k/NlD+wZAwfJSEXHcearVHqZSCLAyVO98oMz6KgBPHIkTxSixFeJ26G8FQUAijtyn0MD
         UBvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n5h3O+Fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si1820681vsk.397.2021.09.13.07.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n5h3O+Fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPn9e-0007Ww-IY
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPn9I-0007VH-3q
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:41:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPn9D-00029C-PD
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 10:41:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i23so15110324wrb.2
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0C9PruM91VOTSET6OeIFLazCxKShfm+0QO6UKbSRiCo=;
 b=n5h3O+FoeaR6Tte1Pkl7qeuypdvZvEdZWSwGM3UZjWzatfR3L4lJA8c7LI9lfxzr7U
 YdVeIqnPOc2wJ/2vVGg/kW5xmDXzdBNyNXL6AkwNIQZObE4M6fR5Qsj7RQxRXOgtT+Eo
 Bkunt9LGhxbNJwDG3LvqGrkhg8skexgJGlXUZiDMYONXp4PJiAtad1g6uc8Oz6RvXjH3
 GINo8AdmpByHa1fJQQMpDjtLXLLBzncVQNs1bf8rv2ZC253y8xW7lhY+pJudmrGWB3GN
 tjsx2Fcny8zomfY8y9/DeQsUB7ohtIJ6ahFyAR8MQmkV3WATtTTMLJRIBEgcK6IAByUO
 m+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0C9PruM91VOTSET6OeIFLazCxKShfm+0QO6UKbSRiCo=;
 b=bsTDyFmmNN8vPVJ/d2ur84A6BsD1k02+Wjfs3Bdw9KlwsSpyk0VSZiNMxSm2RjY+u+
 ksPMP9L6KQ0ChWjPPOh+SlgxI2zhRT8FprVIY05VM0OBqXSpnrrWgJBNp47DLTGaFZ9W
 m93q4ATGqFB9jJkUI4QI2CEn4nhxJjObawCVftw2fmw6zTcoPGVL0padoIh0RTbQLAx2
 emBtKe0HPrX9yaKdN7Ccz09Zh8irsgyKCalQz4eA8LoZCwAAocqw3RBPMp0bi2oU2vAV
 NrAIyC9HYv95BuZPJ5ewjoQl1Z9QwQ60Q22qv8ra09hZMfdgeVSNnstfi/rlrDPQOXJS
 nf+Q==
X-Gm-Message-State: AOAM530QOqZXSmB/hxfodO48lJC4bX//NxNGltEnym/GPdlaFGgap3kQ
 lgj6kGRj6hAeRh38fIHHSkOB+F+OoQBK+CPIEAABcA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr12673217wrr.376.1631544085814; 
 Mon, 13 Sep 2021 07:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
 <20210907232555.3268967-4-wuhaotsh@google.com>
In-Reply-To: <20210907232555.3268967-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:40:35 +0100
Message-ID: <CAFEAcA9N4pD2mZAzwQKe55Q9io5kvO5577GJaQ74eiTajZVzbQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Attach MMC to quanta-gbs-bmc
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Qemu-block <qemu-block@nongnu.org>, Patrick Venture <venture@google.com>,
 Shengtan Mao <stmao@google.com>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G9NJTNhkGQTh

On Wed, 8 Sept 2021 at 00:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/arm/npcm7xx_boards.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index e5a3243995..7205483280 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -27,6 +27,10 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
> +#include "sysemu/blockdev.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/block-backend.h"
> +
>

Stray extra blank line. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
