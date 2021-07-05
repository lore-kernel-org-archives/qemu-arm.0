Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1289420lfk;
        Mon, 5 Jul 2021 07:42:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLE91HkPkH2GLdbMeGebckuJny1/EZZA3PP+nNoU3wkalUzsSsU326fCynyQVSaTBsP6QD
X-Received: by 2002:a92:cd41:: with SMTP id v1mr11447441ilq.180.1625496174530;
        Mon, 05 Jul 2021 07:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625496174; cv=none;
        d=google.com; s=arc-20160816;
        b=03cHio0Jq7txZGobcUrs1ToRo9APS7L620yeEB+YQjdLlFc3z1hWYL1kIi6Q7oFjI4
         8QfPONgi9jsnJEwb5b3MCbWqlwYuU1n9HH8mywpfbPNKtpRXjDx/06eBe3c6TnTRSYgV
         2e0tb7x6ypWZQO3M7FzkeDXsJ7eRtLBf0Vqhx1B0qw/opqdnPrcYgKOGcWE/yZ+yzUfR
         ouBNliqFpA2OctvgX6ZCr1C0M/+qbhjNikreUYfv8G/cKSLqaIlG6UVv4TJCaP276/Ab
         XVY4Tq428FL81FceoYzfz+qLZDfNQH6sI2/9JfE99EeZ6IDZ8fFGlwPpE5l+CrSHXUrG
         1OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wdVKLPFFbLjRiGq8m+OSIIxsKhNlbbpX4goWm9q1FZA=;
        b=bCwuG45Rw+8nyf8VleJop3zJt1FXvEWvw8BEQwHIBrDQJ6Mw0esZYUVR6gjorBoLfa
         Ie4Aw4eqecaEHN217iiLglWt144zphE3C+uPAdKuQAFSMWdnrjxgEvMuUfkrGPZ9yApD
         SINW9diyG1U4VBYyPm64RBfPuhXVikWFODBrRx90MT14T9CAxykjRHkfYwtfgdQH/JIB
         XqkWXk6l9L4XIsU5Uf3cQQm4Ig14MWM3NU1dj6V4hANEHMxlWF8tIjW28aKis5kwAIPB
         jUKivdazlb0LmK4YjPt9ndMshTYNTnVFI166xt1FhNzlv54lfRUucQ5H9ab5EaWjUm3m
         QEBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PYgjH2oz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si8600877jan.83.2021.07.05.07.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 07:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PYgjH2oz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0PoD-0008Nr-SC
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 10:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0PnM-0007hr-T3; Mon, 05 Jul 2021 10:42:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0PnL-0004LI-AM; Mon, 05 Jul 2021 10:42:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id i8so22439311wrc.0;
 Mon, 05 Jul 2021 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wdVKLPFFbLjRiGq8m+OSIIxsKhNlbbpX4goWm9q1FZA=;
 b=PYgjH2oz0ZIE6P15c+e3rfzN+WNREwPXu1vd+EwkFcSsZAS5S+LmEimxe8oK+rcql/
 B7l9qTjJCbLyjNdaG+wS32PKcs7ZWgO4oaPj44E3HVN0QUWscjkanNrcCmEFaiGQ3WqI
 QEkLlyTYOeEJyZqss0H9vB8Vur2h73gFZTKV03CBz9OjbQhCn8vtVV7zQ+nC45/WfWvq
 8rHn19zNSubx/j0Mn9bJpt9Z9gosgM51gxTdD2pmXpa5sx1NB6k7DPYSSIWvNJGS3I2+
 KMRzT2/vGX5ohb38EVz3x/FdbQxwESMVYZEDINcTINxlLG0jMWZcrNjsqL/opE+kePYw
 +6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wdVKLPFFbLjRiGq8m+OSIIxsKhNlbbpX4goWm9q1FZA=;
 b=MwTksSk3TPpHJ5Je9sKDKIzbd3jewL8YLXvpvkmRUpyn1yVYfh2+wlZR9OPT5aqiXR
 +A9WONUsNISv3GZiq+DC5t5PxlOdMXGYX7vFe8N54HSMufievvJDG4lyGvBYuHFoJ2O6
 OdJYnddsRSdjzrByZRROYU3wrdrX6lUVvtdPqI4//ZxedG9GO5b3fBd/IOLxpBQiDAo/
 U6V6J95xF1CdmfI+d5Nf5H6iWfEN1thbVx1geM/i9TSfWTMjY7sE4H9jnFNKiod8es45
 +B6O+2P6Ox7PcMc7De0P3NrzD/bVF0zZfr7TUjNALxMqbYhj1PklCikNMCAh4CW9ehzX
 ETbg==
X-Gm-Message-State: AOAM5310yeERNgC6U7e44r/Q6SbA1GVLL9hdGGIup7qAkAXrNgLAwAPh
 0M+XvLuSxt9DnwPn2x0Xpgw=
X-Received: by 2002:adf:edc4:: with SMTP id v4mr16194240wro.54.1625496117285; 
 Mon, 05 Jul 2021 07:41:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v2sm12960729wru.16.2021.07.05.07.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:41:56 -0700 (PDT)
Subject: Re: [PATCH 1/3] docs: Add skeletal documentation of cubieboard
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210705122011.753-1-peter.maydell@linaro.org>
 <20210705122011.753-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c9374bf-b1a6-4e56-83ee-bbd36c467110@amsat.org>
Date: Mon, 5 Jul 2021 16:41:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705122011.753-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L1XZK9mHcmHz

On 7/5/21 2:20 PM, Peter Maydell wrote:
> Add skeletal documentation of the cubieboard machine.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/cubieboard.rst | 6 ++++++
>  docs/system/target-arm.rst     | 1 +
>  MAINTAINERS                    | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 docs/system/arm/cubieboard.rst
> 
> diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> new file mode 100644
> index 00000000000..2be8a278633
> --- /dev/null
> +++ b/docs/system/arm/cubieboard.rst
> @@ -0,0 +1,6 @@
> +Cubietech Cubieboard (``cubieboard``)
> +=====================================
> +
> +The ``cubieboard`` model emulates the Cubietech Cubieboard,
> +which is a Cortex-A8 based single-board computer using
> +the AllWinner A10 SoC.

Modelled: Timer, UART, RTC, EMAC, SDHCI, USB & SATA controllers.

> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 13b3eeaf076..0a3ef309472 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -85,6 +85,7 @@ undocumented; you can get a complete list by running
>     arm/aspeed
>     arm/sabrelite
>     arm/digic
> +   arm/cubieboard
>     arm/musicpal
>     arm/gumstix
>     arm/nrf
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb8f3ea2c2e..76a2c608d1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -559,6 +559,7 @@ S: Odd Fixes
>  F: hw/*/allwinner*
>  F: include/hw/*/allwinner*
>  F: hw/arm/cubieboard.c
> +F: docs/system/arm/cubieboard.rst
>  
>  Allwinner-h3
>  M: Niek Linnenbank <nieklinnenbank@gmail.com>
> 

