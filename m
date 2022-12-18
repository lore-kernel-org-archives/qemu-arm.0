Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3030030ejb;
        Sun, 18 Dec 2022 14:02:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Ge613MuXywOW0E08QnSoCPIQtTQESEsq/gUAbf7NsDuD+njhWBQR1iK8PVOHwtgrSPRRN
X-Received: by 2002:a05:6214:2b52:b0:4c7:d93:f918 with SMTP id jy18-20020a0562142b5200b004c70d93f918mr50462818qvb.18.1671400970368;
        Sun, 18 Dec 2022 14:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671400970; cv=none;
        d=google.com; s=arc-20160816;
        b=zh+nOjopi11T3noQ+h36q6swofkvIuEuMN88am9qvvyQ4t0X7B7QQ9tMyIRY58dHzJ
         StaSY5fK2eJPUMBuEbQ5vpaRU95kvVRHt1trjGMGeisIFt5AhmRP4mZuqLEgCow9BfeP
         K81CEyjPTtec7pZIQKAjCFsQNOFGdFq9T7ocoJ8PT3z5Npy08PhnjoIZE30yhHuu7jSs
         ha1mtJHuXXTPAzhm8DzLm52BLDzjC3G6rt7Txm9AIslF8GcKTMAzNtPOBPrc1xkKpQkU
         I1e8+1Nn78oPEW7RQydAYtBdcQ8u2V4sMGWox5NcsvBk2uG9zpW4ElV3MdO7Lw1R3dMd
         3B5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AwuUJphPfzGirMpg0vkXKtFl/wer5bqA4pE6cNb30/s=;
        b=StiNVKyoTmQUDWRTIgjmrK0Po4i7WobN/+7PvcwuoTkAzRHROkO8Fn3YNLtIIg/jTg
         nwr5nYjtx0TXsn+xRHuTzSS9VYk8CNcCPNGQGDIAX+EoMemhdBQhmWNldtCcF6B0iDTp
         5K0p8VDUlXO8P+7Atu5Mu3W9aTwcpX5OA05j8ZgnFiSMnfJsE7nYRt+2WY5HzpC79vq8
         F8CnhM9NWJJ/sl0gT2ehqzC62KBgrpg5BPLxUABp0J8XVcR4zUX20f7bB45Gt4vZWXX7
         pc+ybgGqDnpnFKhGDpRAwDP4CMEeNaZl4XtYp1YIvGIs5KGHCCuOMv6WKv991oO+6RTs
         XaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fEfFm7c0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05620a28cc00b006ffd03c1a4asi3553270qkp.659.2022.12.18.14.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 14:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fEfFm7c0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p71jf-0002G9-Vq; Sun, 18 Dec 2022 17:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71jX-0002Da-D0
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:02:16 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71jV-0002Ie-8o
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:02:10 -0500
Received: by mail-ej1-x630.google.com with SMTP id tz12so17543358ejc.9
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 14:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwuUJphPfzGirMpg0vkXKtFl/wer5bqA4pE6cNb30/s=;
 b=fEfFm7c0kMU6OgUCGWFdQSRmdeHzHVKZObIvEUYVm03YNrdVBnSiueXlhKi2anSj8u
 rRKEgB2kkZwXkXPbvddLejcpzlmbC1rfrEYzD/OVivKzrCIoH1kCFekm4Ei+9YbCeVCe
 HPJEvhivXOt1vecdvmbE5Y5qZD70/m2x57relyI43F65H9Jk7xTtkVgGnYJIR+aZgIfp
 wb2Jd6s4joRoB2p0IEVUEzS7NuFXzXQW3VQ8ZU3pL9Pbm/HBknyg7EWtGjsdn6aQwbDr
 Dynjqja4L/ApgxKE/S0qvu7L4jBnuGkP6CallY74nWA7teY1M1ElqM/nirRKMsRDF8YF
 bUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwuUJphPfzGirMpg0vkXKtFl/wer5bqA4pE6cNb30/s=;
 b=h6eSAIlWssnrCztPoqI3nfeOnzrK5Zo41NcDvr9YecPa8L/lo0CD2m/X60o0SuLvoi
 XIVLwnvM1UzBie+Q67RvQtbTRIYy8imqix9LInM/MflqJIFIuuFIbAq+AAtfxsQXcSm2
 x10QPrtW9P3VkgHkYiC7gMwB8zIV6I9BDQxtoL4pdwi63Vl9KHzgj4qjoSrSTvN0nr5L
 2Qy7xu+HpdOZ53/6FqWv/LOdAhcSoy9mywa5KxlszfoT1NSYzLkh9bqr8v0Df8OR6WnR
 7mIMmk3BjOymhdjcmxhLhLmrZpLn60Sdm0dV739Jc3NO06JqsxFBBsC4SdLX9Qx5wJ2N
 watQ==
X-Gm-Message-State: ANoB5pnenp34rSb93asqtVQCzmSNfNNS///6+W2HSBVyK1mjnRs/H8jy
 61hv4QnRNk0aNUOcPa9qzd5oAQ==
X-Received: by 2002:a17:906:4e9a:b0:7c0:b292:e56b with SMTP id
 v26-20020a1709064e9a00b007c0b292e56bmr31782308eju.68.1671400926313; 
 Sun, 18 Dec 2022 14:02:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709063d3200b007ec2c8d2f40sm3038785ejf.161.2022.12.18.14.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:02:06 -0800 (PST)
Message-ID: <d5616b84-f9b4-3f53-1011-4df670c3ed7c@linaro.org>
Date: Sun, 18 Dec 2022 23:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] docs/system/arm: Update Allwinner with TWI (I2C)
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: hN7yPlJ68TUG

On 18/12/22 22:19, Strahinja Jankovic wrote:
> TWI (I2C) is supported so docs are updated for Cubieboard and
> Orangepi-PC board.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   docs/system/arm/cubieboard.rst | 1 +
>   docs/system/arm/orangepi.rst   | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> index 344ff8cef9..8d485f5435 100644
> --- a/docs/system/arm/cubieboard.rst
> +++ b/docs/system/arm/cubieboard.rst
> @@ -14,3 +14,4 @@ Emulated devices:
>   - SDHCI
>   - USB controller
>   - SATA controller
> +- TWI (I2C) controller
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index 83c7445197..e5973600a1 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devices:
>    * Clock Control Unit
>    * System Control module
>    * Security Identifier device
> + * TWI (I2C)
>   
>   Limitations
>   """""""""""

Squash to patch #3 "hw/i2c: Allwinner TWI/I2C Emulation"?
