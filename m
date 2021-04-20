Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2078316lfb;
        Tue, 20 Apr 2021 05:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDMNyEqQwrL/xupB84kXypq12Vp7jDtcRXWtg3vjgpwmWG9C5ssmZnWpMeI9rrCue4zi1E
X-Received: by 2002:ab0:5f95:: with SMTP id b21mr6015967uaj.69.1618922400410;
        Tue, 20 Apr 2021 05:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618922400; cv=none;
        d=google.com; s=arc-20160816;
        b=kWY+wPeQXOceqsu6XrTl9RadUtOM2+Hm2lZES83RCyROCcp93Zbm8DuYovf4DXMssz
         dcn7s9vHrR65TrJPic2Q1Tfa7cdBySVXoz2XbiVAayb7oZlZqv3YUxRIRz4qzALrFOTz
         6reIhUiKt/JuOHDDcCjYzLZQDsFsTO/5nJvDEq8SVLUoCHU/2BbdLV5JJAemX9NICgoE
         lUOcEk5H6kpQFHGgKKlZUEuRr1QL5XhQR41f+ZrTL2RJXLtobiwl3dDHHq9GBzGV5Wff
         Xy86mUCAV+rY/0u2LyiMnFlmCWgKB1mfdCk2DYn5m2A7GyDb7xfiCGtBL1r1x2buxGlc
         WkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QDfUWm6ArMkkLd9FeexkNhzK7FO1CREc449yv08LUmE=;
        b=ykdfxlIEKkB5SQUk0/f7KMjwZkH17ovVpJzpMrNhVZU+zdttHxS1SuzODk1YPMXecI
         F1WEoZ7YquG8imc2s4IQ65qbgWkDSCjiQTwlQ8y6CwXhsi66Bw5gYKKs14aYV9Hwjk3g
         x5B6AKeOHs2thaKG3NogqBfEZf08uhR17vu2lMTf0ggX0/QDX74XHA4+GQ47PNro2csk
         o392Clmxwwzf3ab/E7+jMgaSpZVeloJL19Botav619sws/FPvsHUb4NMfhf5VQRtyHn3
         f+NbZJdPN3l5+1X9v7IiwJuuA3Gvgv/sWEfTYChvSMWcbYeHfC7pUvB4j3nNCf1tWBuY
         0mNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Vg/qkQ8S";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f145si6875688vkf.28.2021.04.20.05.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Vg/qkQ8S";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpfb-0007bz-O2
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpeQ-0006KD-BQ; Tue, 20 Apr 2021 08:38:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpeO-0007bx-1D; Tue, 20 Apr 2021 08:38:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id c15so28506371wro.13;
 Tue, 20 Apr 2021 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDfUWm6ArMkkLd9FeexkNhzK7FO1CREc449yv08LUmE=;
 b=Vg/qkQ8SfdaPbyRTl43RKYhsjRFSIsyuK+AcEg11UputRHCAJqfV3CX6kDRh0MFmqQ
 LtTtKyUYWm8bimnF15BwX2KJkZRxpUe+olQou6I7fYy1vvyInhOVafpcQ72tPXPedCtq
 +jTqO+EguotZSnALku0bzVXlqYoQroSKyaXGrEOrCF27sY6g+wUE6RJar+bsut4Lp1d8
 fNTiewgCLSjtH8luggOgzHqIGTOxh/hjFtQOX1aQww7286Z4DjirWE9Yo0VuPdR+QIjX
 murMFPCUoUlnchoRfndH7uVufNhUuDKLdBiVRzwSqt2FPBWgPOzPOmp0NZDWtx1uaxRM
 eP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDfUWm6ArMkkLd9FeexkNhzK7FO1CREc449yv08LUmE=;
 b=KZSThd/UZ5ji7G1yZ6MVRtWGIY0m1b7FRXhneaGhU/I89jMWJwWjwiShgWMvkYJTEI
 0Wab++yzTxXTqBUj+ZNwpPnlRo5vW3ydIANOuvbTMRaRls27qEjfwKZGVFf66kHe3NER
 /YrnoviHM3HMB5JZMdiwHwXO/fbXK0tbQ8kz57lfABV06gKNINY0mQa8TWq9ZeGe004P
 E9A9gOinQAVcBo1cbAUymqU2ebqOx0QHepLRs/fn4Gp8YTgT4cm5IwYHdzNZHyuS8I7W
 QoicGCrK3lJzYclklxfzp0vr226oAPZ2LC02Eroy3eiri42o/gMtGhtYr4K6CxfRjrXA
 7TNg==
X-Gm-Message-State: AOAM533SrAfxpTn8dcxuReJw75pnR4Dc2FNdoSf3bcOh9QLckLOo25n7
 4+37T+segIPOpp86W0UMqSPf6xOweRxLEA==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr19744938wrr.319.1618922321925; 
 Tue, 20 Apr 2021 05:38:41 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm16847104wrt.57.2021.04.20.05.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:38:41 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>
References: <20210420123106.10861-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04691b00-6d28-d9f6-e98b-b8ca3f963030@amsat.org>
Date: Tue, 20 Apr 2021 14:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d2yEpBV6nHxB

+Rémi

On 4/20/21 2:31 PM, Peter Maydell wrote:
> In tlbi_aa64_vae2is_write() the calculation
>   bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                             pageaddr)
> 
> has the two arms of the ?: expression reversed. Fix the bug.
> 
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d9220be7c5a..957f4247010 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>      bool secure = arm_is_secure_below_el3(env);
>      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> -    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
> +    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
>                                    pageaddr);
>  
>      tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
