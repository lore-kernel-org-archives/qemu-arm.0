Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp780087ejc;
        Mon, 31 Oct 2022 01:26:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51a455zinPyHZ6NwW7noyEDUPxrGGigl2jgO0Sk7txFbO8euCjTl/zUoP90IAp6k0i6vaR
X-Received: by 2002:ac8:748a:0:b0:3a5:2bfc:f10c with SMTP id v10-20020ac8748a000000b003a52bfcf10cmr578073qtq.234.1667204799045;
        Mon, 31 Oct 2022 01:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667204799; cv=none;
        d=google.com; s=arc-20160816;
        b=elDMCz6lPizHgO1VAXzUW94tAkvSxYchdKExY4rhb3lR8ylaIze2DTNrGK2eSN/KQu
         2zf1vCM/EKRQb16XWalv2o1CQ6GKqD4oheoWywotlHGqqH0tejJiP2wrJElRV31N1vD1
         pxtpz2FW3Rfe7snlrFNiTMnlwa2va5j45xGhAXbhUCiiEZV8iA5ioK3P5JN9aqFMUGgg
         Q22yMov3FB5hnhA77YeGFTABvSflowOslRV/hEKDTNzoaViabVtoFA0kCQ0XZwUlwchl
         dYmT80GF9rZSEBUqLVl/GUZI4iNk+9/gaq6sgu/smoKToOeYm1yHqEU4ZaqtAx7KRIGB
         q4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rQ3+RbPefYy15I24vEHxDKa54ZKc/18d7867RKmQR+c=;
        b=P4BV+86D9vmUtB8CPgO/h8D1veTHkprKE9WnWRHX/a1pqAeh0adcvXZk5+/17dvaOY
         DJAerGiJJIs4NsDAeZyV9/qGpzfjmsuKQXvnucytJ+vxXw51a+6QAjQz1X5sHyOCZ/IJ
         y2O6JZ0oZQHxmqwy8c+sN2HtUu0qqg3iIpihzMeh0WBUT8QIa7Txc+ZWu6tXmrF9PdUq
         GgNUgb9C9jzaDX4ALNpNZZX6aU3x4WhpZC1Z7aqOt+M7ZwfafsnrN7A94qYfIsvIo+96
         KUrdzz1Ij3A8YxWs9lVhLj4+UmGqhHiZLR1YZs1p/x2XFLvt0/Vz1c5dNZJONruoyPVt
         8+Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5Et1INa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do39-20020a05620a2b2700b006eed7f274easi3548243qkb.359.2022.10.31.01.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5Et1INa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opQ7P-0003Uz-QT; Mon, 31 Oct 2022 04:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ7N-0003Rj-6n
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:26:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ7K-00032p-Q3
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:26:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h9so14914155wrt.0
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3+RbPefYy15I24vEHxDKa54ZKc/18d7867RKmQR+c=;
 b=Y5Et1INaMKU6i5poymjnpbQRbMnCK8rF3qwujBkdAOfI96dMZxO7wgH7M2nRIYZAZy
 BSSDNak8Jj8XOxYDGVaRd8h0ZGyaCR8eWRSgWKD+Nqc2ib5+nFq19YoIF8pwI+J3A0Fc
 qHVyDxcFflGZ3l6QWeYqCjKKm/AkZIlS7xqJ+l0lIQ+gEoMn0VK1OTbT18qgucraKJFn
 vOuZjoEsddm21rK1kdAXwZ707nLH/APNYDfoz6Dq+jP9kyI7acTtCFPMPizvL+PNYkV2
 Q58FBQNBX3+M1gS9foUrXzBpKcDmGeULsUk8JpNek89lv+hk1bqb1uAy6B0Y1n+R/wxc
 mN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3+RbPefYy15I24vEHxDKa54ZKc/18d7867RKmQR+c=;
 b=z/xqfvEFeP+WAXtV07T17o3PviMHPGlvmJXCWMer0mIgt1awTknP81TAok4tKtwR7b
 pb+B85j0wV6+gcdAiQMNYkUMpaVvO9GzFdj6nXM3Nzr5wbcmUv7nUseM4DytV31EFqBo
 MOTpAEtkeo+9AXxwZ2Ta2+/XOj43PmJj16WpXzGWbmudmWimGBlrQktppEUkZmdwBUTl
 Ffpj0YVuPuprK6I5PP/9sBdSsFYd7v8Fq9/lT57VHMDOSj+h333QAVYk7f2edbTXkLOz
 GJ3mObC5h4OyXardfMU0gis2HK6rb1l8lmkqTkIbmbsOWZS0wJLSJ/M3/AoVVMN4EmwM
 S5Yg==
X-Gm-Message-State: ACrzQf2vXPU9JIJUlff0n6Zpmip5G7X8arbqiKxq0N4MHa3iFE976VEp
 VlYW1JD2b1rvjCKyBzyGzGugtQ==
X-Received: by 2002:a5d:45d0:0:b0:236:8201:1cb7 with SMTP id
 b16-20020a5d45d0000000b0023682011cb7mr7108772wrs.417.1667204757065; 
 Mon, 31 Oct 2022 01:25:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cf75213bb9sm914725wmo.8.2022.10.31.01.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:25:56 -0700 (PDT)
Message-ID: <3ea4f10d-e807-b48d-0eda-19d70763c960@linaro.org>
Date: Mon, 31 Oct 2022 09:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 11/11] hw/timer/imx_epit: rework CR write handling
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-11@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-11@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tsllux0xg9tu

On 31/10/22 01:28, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> - simplify code, improve comments
> - fix https://gitlab.com/qemu-project/qemu/-/issues/1263

This doesn't match GitLab issues closing pattern:
https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern

> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c | 139 +++++++++++++++++++++-----------------------
>   1 file changed, 65 insertions(+), 74 deletions(-)

