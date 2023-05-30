Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2427981ejb;
        Tue, 30 May 2023 13:34:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5m4quKKhfQx8s/vFPd7tuK3zFhIBScLTADWWy0vVZbqS7MV9DBs0d8bJx4p/AEhx/SkvXv
X-Received: by 2002:ac8:5dd3:0:b0:3f6:b285:a37c with SMTP id e19-20020ac85dd3000000b003f6b285a37cmr3941348qtx.49.1685478864525;
        Tue, 30 May 2023 13:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685478864; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeuDiALoLNuBoJncfJPzUVrjjn22TYUU+y0dhGTo91vIJ1U8iOJ9LNGCJvdsN1NOjI
         hR6qZl/TPRqEcQjDuJoCsqjP/tM+daLbK+907ta5qna/gtQaIn4Ldohk6AirriBkDGes
         +NF/Lnq1I20Ylt8q8wKdg5fSwXxTZy/TyPgL8r942hIaIOCjuIBC4xQS4iF78nkUJ1vq
         t0RgfwNhAZH6MclSDFxIeCbc3BSHpYzqdxs4RawcyTki4rhc3mHLr8ig6fDZJVRfEK47
         KWNt0Qvt4aCuDwQFH7Fn2an60XPFxVH3xlfWtJ81TBAUT7tXMUlzOXWR17fkM4HP9oCT
         xRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EPhXbSL5yKgue2MBQWKD4XyO+uxl2kGsAyMFg2PqEPs=;
        b=iVgYErJ4tNs3QRK0CL9Vg5z563gmajAV8bEBra0mkntC5v9oH49jWcpjv5aZ8NfLKU
         rzGL19/RC0vQI00NVenCbevENDOPSYGdLqEAYWpX93E8Qxngcbl7J/9VF0kaJoIHDZgG
         YCvUIKV/GmrkctnSoxsMM1Q5l2h3ejwwvTh+kNUBayHGaXXuhwYMCfYiM2hm7KexyVvt
         Pbr+SM30hUvbL6VECnHxDiKfo1llFkRl39d4OWs3V4LT75LJMYyGixGj2HtMGQ3f9MNT
         8rTdenAVB2ylPFeTbIAP1Av/4tqXbDraxD8y8EaNs3TCPANJM1E7+TMjWgqgRc2NcKlZ
         s4OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NFS2EPNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ac85c55000000b003f691f73ad6si7179139qtj.506.2023.05.30.13.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 13:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NFS2EPNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q462n-0005wD-2L; Tue, 30 May 2023 16:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q462l-0005qB-Lq
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:34:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q462k-0004Dg-3W
 for qemu-arm@nongnu.org; Tue, 30 May 2023 16:34:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f606a80d34so36090595e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685478848; x=1688070848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPhXbSL5yKgue2MBQWKD4XyO+uxl2kGsAyMFg2PqEPs=;
 b=NFS2EPNYjdc62/xvBLLhnfSfC1kRxHOjb0A2kyt+SSlXorBoHN8nts3w6WqP5pyk9H
 fLSr6oDP8nGKyH4zFu6Ny8+XOeq6nhMZ/HVQdx5HJXOHR+KhGvwH8pMujMc1twgKO4zL
 6EkIGObWjUm5KWymMQAGh2JJQQQiBI2TZG6iLb1rD5V4OMl7QT6wBiLxdIuddhcI+h/R
 rYAd4g1hWxx6CifiNkJX3kYPfHspPNEpGw1cjnXdVr8fvT9quoS+3/0zhMqSR9kccE4v
 0RgXW05vZGugLONzHmSua+HE/4ne+iZPGEVYWrQTeM6il3+iM2FhyVMTCarSZoFcAqDS
 FzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685478848; x=1688070848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPhXbSL5yKgue2MBQWKD4XyO+uxl2kGsAyMFg2PqEPs=;
 b=IP6x9Za5Zpt4uemldVn6HS4mmS1nncoFcK3NjK31tZUsutzCNk5w6znnldDkGgmbYG
 k7HhfcG7oBZEc44WHJv9PUMPd1XroCwPzuFmRxW8SHVMSMQd0ixjmJjcjXebaVrJCKSn
 IyOPMaVJ3yZAzJ312HOIDjmwnqdNujTPnd+1U+2bJj648AIFkQ+yWvy7LzrEdK4s81K+
 NkAAxAo6qihikUABr4DGVYlr3IrsW4LkjCsA5slFlkDDIB6M5aVc4jeiZhJSl5NGuttc
 Zp30jKzpsUq2kmDCrODSo6doJXtqVhxbQRo5yqDTSpyQ47Az88Cwi8LeLKCCYFYtOUbX
 zZ2w==
X-Gm-Message-State: AC+VfDxclmHifhmxwBN+fIWmLV4k4keFo8zQ3I13D0VJMTsco55+yJ0D
 9LeMfcfXdi7YsBpbbh+7ylWuqQ==
X-Received: by 2002:adf:edca:0:b0:30a:e6d2:3ce3 with SMTP id
 v10-20020adfedca000000b0030ae6d23ce3mr2188100wro.16.1685478848571; 
 Tue, 30 May 2023 13:34:08 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 bf3-20020a0560001cc300b00307b5376b2csm4261955wrb.90.2023.05.30.13.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 13:34:08 -0700 (PDT)
Message-ID: <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
Date: Tue, 30 May 2023 22:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: o+r700F3sydO

On 8/5/23 09:58, Cédric Le Goater wrote:
> Simple routine to retrieve a DeviceState object on a SPI bus using its
> address/cs. It will be useful for the board to wire the CS lines.
> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/ssi.h |  2 ++
>   hw/ssi/ssi.c         | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index ffd3a34ba4..c7beabdb09 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
>   
>   uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>   
> +DeviceState *ssi_get_cs(SSIBus *bus, int addr);

Previous patch use uint32_t. uint8_t is probably enough,
otherwise 'unsigned'? Otherwise

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

