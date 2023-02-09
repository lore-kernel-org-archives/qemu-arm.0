Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp492006ejb;
        Thu, 9 Feb 2023 00:00:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+v6pfDzLLqRZ0rZJjMqMQUP19jr/jA1MbQ0fmXJRjizNH29vNnsJ8OFOxdXMIH48I6fG9z
X-Received: by 2002:a05:6214:1bc9:b0:537:7484:8d1c with SMTP id m9-20020a0562141bc900b0053774848d1cmr18806972qvc.30.1675929627392;
        Thu, 09 Feb 2023 00:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675929627; cv=none;
        d=google.com; s=arc-20160816;
        b=u+6SAs+Qo0F2/qKOw9hz/D+A5hfK9RZX9MJxI1lt7YL5ynLILLLYvC6/h1HqQJ16gp
         olWG5jX99NeE44r1zavVpzFvkb9iNXZ2kZ4Hrd+3qYC0A/iytenpHubzcH3K2D3HXhqA
         /FhR32flIjR5Uj412M4ufSLrhAc0ar23CdwKJgKtRgEqqRRBf+VCozQqPSUw/oCmSfP1
         gQAkI0Od+DUC5lyLH/+ZtgYGBAibI0R86ud83z+Qzes3xH8Y3fmWRrlLkNzXF/Z5NyAL
         RwZqpOrRJxyvS/If2yuDn9tMU/vhy+onkEXn2hRHE4hOkcvZEW1JooaUsmoRgGVo89rK
         f9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lxrPYIlp1MU6tgnEenBlW/qQepoXWpw1NFTaSp8m2YU=;
        b=uwsXOBqpYGg12iQY8iAW26ycAG9+y6Ps4p5cYxNaA++TsJjv8jTPulKf3bSCB2+Ll8
         JDwK/N3tK/ojNRZEBpz6RZY6OrLbs8qFZrJSFAnYALWLBNfomyKaBI/2CITwktpU9pC5
         ja2rjYyGz2iXwQRwq00Wa3zzFHDsGcgOSvK6YlsSw9dN+yrUIeXSsEK7mOaqKPKUA5S+
         bxIxvHiLQHikizkEVIdV13sd4prlDsN444AvK9Gewe1RrbUqC9AQPopYoUX9nDkCk2Xt
         Jat7ICFQiAwMpqRWxfwCS5G4eye+svYTMNBk763vIlwKs+GzqFgxID+IoBbfwyPeiCEg
         FMxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TPZdyVaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a0ca911000000b0056d4e09a305si580150qva.318.2023.02.09.00.00.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Feb 2023 00:00:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TPZdyVaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQ1qy-0007i8-FB; Thu, 09 Feb 2023 03:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1qu-0007fB-Mk
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 03:00:21 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1qs-0007BH-Er
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 03:00:20 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so861453wms.1
 for <qemu-arm@nongnu.org>; Thu, 09 Feb 2023 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lxrPYIlp1MU6tgnEenBlW/qQepoXWpw1NFTaSp8m2YU=;
 b=TPZdyVaw/XRGOElZAHQAyMvx+KOp9cP15FpRF72nniRvBwankz8yvVKUWzDiqqdB9e
 NiersMB102mhwFNgj5/5AYwXMNWwJr4nh6YQGYWUeRRwwtrcUn6a1Cdqs2tqtpTcQIM3
 iPQa7xiz66MeG75B/dQo+f3e19NkH5m6EDCUDHlC4Lt2UIVza8BzKAuUT9Zsyhj4+Qr7
 nOw1wM7GP2/Wl5/kC1HyC68rSQQhDw1mZgtLdbFNZqDkaKCVXOPvkx2s4n8XgRmk7uN1
 0FhsegWdTWXF3XKkYQGt/ncvq2jE/z2n1TcwGA4eQ2BOS1PZTugJjsIWgjG816isR4l6
 nxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxrPYIlp1MU6tgnEenBlW/qQepoXWpw1NFTaSp8m2YU=;
 b=RBFrJa890mwXyDy0iTwrxYTUW/9r34yQcc9WDtWG6QnAha8mS88SvEx7z2t21isB8i
 1ho3DhdZznAUqzgI5sd0y5Gnv7puBGXA7EoyyqAMopzzOX688jR/JTE1r8gckWlHLXWQ
 OLAic4LCteWZ5UWLQrrQVOFwqiapJX0pvV26n3dWzFzzCuSIkcZ0kC83UmnEh3s2Gc2f
 yGvA2ApqG6fpkcAKnO5+uXwJ6W1xDPI/QQtSsCzFZyqY44dj3NFc729/nwe0pN+6RQmV
 h39t54J1AS4C0kSbds6rowBbp4k5VQCOCMnRdFgfp03DSburlfgAOIDY2bRfFzRtBiuH
 wYaA==
X-Gm-Message-State: AO0yUKU1qI6deY7DvEVvvyOJZb3RmdCwsOUuPnvbIUaPjsfz22ByJCsx
 Q19BkBxZpclWlku//Mkn60vnxA==
X-Received: by 2002:a05:600c:331a:b0:3df:eeaa:816d with SMTP id
 q26-20020a05600c331a00b003dfeeaa816dmr3503378wmp.28.1675929615505; 
 Thu, 09 Feb 2023 00:00:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b003dc49e0132asm4249911wmq.1.2023.02.09.00.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:00:14 -0800 (PST)
Message-ID: <f1d5840f-5ead-a2b1-29f4-33360c00610f@linaro.org>
Date: Thu, 9 Feb 2023 09:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 3/4] hw/gpio: add PCA9536 i2c gpio expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au,
 Hao Wu <wuhaotsh@google.com>
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-TUID: oeAQTbhKLdZI

On 8/2/23 23:43, Titus Rwantare wrote:
> This device has the same register layout as the pca9538, but 4 fewer
> gpio pins. This commit lowers the number of pins initialised, and reuses
> the pca9538 logic.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/gpio/pca_i2c_gpio.c         | 18 ++++++++++++++++++
>   include/hw/gpio/pca_i2c_gpio.h |  2 ++
>   2 files changed, 20 insertions(+)


> +static void pca9536_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
> +
> +    dc->desc = "PCA9536 4-bit I/O expander";
> +    pc->num_pins = PCA9536_NUM_PINS;
> +
> +    k->recv = pca9538_recv;
> +    k->send = pca9538_send;

Can we rename as pca953x_recv() / pca953x_send() in previous patch?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
