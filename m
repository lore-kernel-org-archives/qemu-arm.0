Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3893422ejc;
        Tue, 17 Oct 2023 05:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxhgofEvrcaFvHh+LMHG8bypBhi5Kv5W5Q8NXr6YNCRapJ8E5IOF5EVXXDA40efipDPA0b
X-Received: by 2002:a25:694a:0:b0:d32:cd49:2469 with SMTP id e71-20020a25694a000000b00d32cd492469mr2199082ybc.24.1697546921776;
        Tue, 17 Oct 2023 05:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697546921; cv=none;
        d=google.com; s=arc-20160816;
        b=tA0RDmz/wC5R/c0QGnAdOaPtHQCQd9Ka7Mtx6MAGca+EZpzyyyUirne0ybfOZ34NRp
         8tPvdL7YmxfBS6xZu83vQS1HiwB1z+vXhcokvCtUGzWX4snzNI+JyuidWvWJDXh7hCa3
         ztjv/88APv1Mr/9Cn1H+ghmELHYbFaGvOmQc/xCEBex7tknKuB3r6yYTwUjAgp56DOeO
         vxLMTTYn5fXqxi7uKp2k9x9VWpcisSqiYZx1PmsaPIIGnCETZOvKM/m6ynBYYbEPptad
         qV/DjAiBS6lgP2V77R2Rcftmn6JmR6F8dldr2wlQt7Z3p6F7X+pxTpI38BIwfczlqzGf
         rXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YlHuA2uoNWxtLjQaJ6jG5mttnQNTAHKXn44yFnClLpg=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=m7bcUZ3S+JOKkjEjLBHI1aBmiLgbZpfakiRJwYaekkFZ6DEyHdZvnAp4mxkhz6dRr8
         hQHt2Ksklzr4TnYStvUxt4NIiyj5VvFN3dQGjPiKvq69SDjw0jUBgTar58vbQcG2sC5t
         tW3wSvZDsVqrcqjNORXo1HIE+fL/QZSkfONpJrLkVpJlIOAw3QKqze7QBdTmXTIHJhZG
         H/+Jq1GxJ1Y9DQNTkJndu/ljLwuAf+i4+QClUcUKwEI5xVQy2/KLAwKG6zJiW6m4Dpyy
         NdcT3YHZNuyN3AVc5OVQSHR1SwIL8/Ax9OskEASPs/zpfoMCMvLqJJZiGtqqD9P/tT6a
         tjVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b660ZHcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a12f600b0077432af294fsi971139qkl.434.2023.10.17.05.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b660ZHcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjUo-0002BY-PX; Tue, 17 Oct 2023 08:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjUl-0002AM-Hg
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:48:23 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjUk-0001Bv-1V
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:48:23 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so387428266b.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697546899; x=1698151699; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YlHuA2uoNWxtLjQaJ6jG5mttnQNTAHKXn44yFnClLpg=;
 b=b660ZHcR+CT7ule9nDJF9Hs1XGCTzHlWwG1Iwc3kBOvOus5N2zpcJKlmGxNoMGI87v
 Ib+hE1Ua64y0M/DlcGpN32Wz/QyFZtQXJuOkgA6pSVqRBLGVa/qDZw73lovEkJfEvY40
 /9awMGl5bs4UquuS7Ffs444PCk50ghuf12zqTeVBumMjIekqaQEBUxDJFSny2H8GW2yX
 4gR/ipJq2pjKNXgyxIeIbYzXjskz8my6gH6aVoVIaVUJyNvjxHWj8Y9SGDpFva7C4CRY
 ToXWEvoxnWOzXTH0z9VPXHoNT0friKvBVI7O5kmwqqJ0NzYsm40KLEWiQYwS3xwh/DEQ
 3gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697546899; x=1698151699;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YlHuA2uoNWxtLjQaJ6jG5mttnQNTAHKXn44yFnClLpg=;
 b=PBZTtiKTbUDInj8YHY198qSci++YC/hSGJ0ceWYoMb9gEAy0cz66eEfR15OhUdLUsZ
 xIqA5skHoE7JDdtE16aK2IGSaw952IUiAxSEqfj7krb/VoFOqlU6zBYaSqNFAQF3cbNo
 lUoOrCQ2T3dspRAia96D/OJnjyFqsf6GeJRFyky++SvusCyJfrJ92rX7HKMly92AJgUp
 SS297b1jqj3YSmfn6esOxuErxMsp/AnFXmSXDGjfZE8ciZ2SSPHBTuBQ+h9zK8buKabH
 fqEp95L91Ds4+PRpVVpT2DuYg3jE1hPDnk6yRUA8sdt0yaCjBh71ZsSatF5jkLVpnNtk
 riCA==
X-Gm-Message-State: AOJu0YwIU+LWOuzjNNEH0piNHH0nvA0IomRFaJlBpt1djyJOeltUkNEh
 Ky12ob/MzApttL9L8dM7mlZPFhcDr3bbO7V0Xsmhgw==
X-Received: by 2002:a17:907:2ce6:b0:9ae:3d17:d5d0 with SMTP id
 hz6-20020a1709072ce600b009ae3d17d5d0mr1560919ejc.31.1697546899394; 
 Tue, 17 Oct 2023 05:48:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 cw5-20020a170906c78500b009ad8d444be4sm1184475ejb.43.2023.10.17.05.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:48:18 -0700 (PDT)
Message-ID: <f85817c0-df0f-6e71-c5d4-61e6f2082a75@linaro.org>
Date: Tue, 17 Oct 2023 14:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] hw/input/stellaris_input: Convert to qdev
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WugmDMlP55D0

On 17/10/23 14:23, Peter Maydell wrote:
> Convert the hw/input/stellaris_input device to qdev.
> 
> The interface uses an array property for the board to specify the
> keycodes to use, so the s->keycodes memory is now allocated by the
> array-property machinery.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/input/stellaris_gamepad.h | 25 +++++++++-
>   hw/arm/stellaris.c                   | 26 +++++++---
>   hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++---------
>   3 files changed, 92 insertions(+), 32 deletions(-)


> +#define TYPE_STELLARIS_GAMEPAD "stellaris-gamepad"
> +OBJECT_DECLARE_SIMPLE_TYPE(StellarisGamepad, STELLARIS_GAMEPAD)
> +
> +struct StellarisGamepad {
> +    /*< private >*/

Since commit 067109a11c ("docs/devel: mention the spacing requirement
for QOM") we don't use these private/public comments anymore.

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    uint32_t num_buttons;
> +    qemu_irq *irqs;
> +    uint32_t *keycodes;
> +    uint8_t *pressed;
> +    int extension;
> +};

