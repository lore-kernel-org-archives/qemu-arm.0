Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp384195ejf;
        Thu, 22 Feb 2024 22:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBeHCD/JBkB49qPmPlaUAx1ainK7xuDz3B8/vVLA1SA7Fe4kOCC6gaBJYWqlkcugBM6L5TFOYCQk1CcU1TNE5+yKhZXoYl
X-Google-Smtp-Source: AGHT+IHR8vDfsQSm9Pwu6X1UhGxVxHXIOcZ3m8Nx+ujB8PCZZb5a3TLSmyqnwTrl1dikA1VP2UU1
X-Received: by 2002:a05:690c:7:b0:608:b880:c453 with SMTP id bc7-20020a05690c000700b00608b880c453mr843923ywb.51.1708668739152;
        Thu, 22 Feb 2024 22:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708668739; cv=none;
        d=google.com; s=arc-20160816;
        b=rbQX79U5Zpu4xziWC9QCyWy7c4Ech74QBDcJsDdrtje1CQFBoQdBagLUt4wAyIZIXV
         XfbNYpGH0j52HdsZI/osnw0apb/q+WYIoQPBk4xonXHIZVDiYgETlGFly2HNBtcKRT96
         6IzvPsLnZbVa5x42TdxPcBx7R9vJXf+7QSFc4FEUVrSBT6aEyct2PkcLRrZl/kpxRo6D
         gltmPhGkEScE9oDU/+Ig98cXduP/L8PzR2j4Rb4j0oDnH398GsmLrBqMz4+NorHMhjoi
         G2wz5cqFtTeqzlhymXJ7KiaNFNc2DevtX89yX3UNch0zIpYSEo109IccSrJ9R18a2rnf
         3wHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4Mu1jUbQ1hJ2IvsALS3VRQ0EeN+B0lzuoroT4sstyiQ=;
        fh=qOwpmuWZJ6qSwoCiQGZri1JpzNiln8q7IVK99f2NUo8=;
        b=kR51AaAkE0xKqB+sYYJMgHixOaD9lveVPte7GvnzJE0TvoR5JeB0IPA7VcFAu3/jrJ
         Hl7/mlNvNKoLLYDY29LPZ3/eJxpQZjoY9t8pUDFAKzCJU8wHqHFR+F2YG4VazIeq1FrR
         WtqKQGyM/VuEsqoFyKVoRh5PdUhE2Rez/hzkrPmnvmvJDkmgpb+D09kBFl8gYH0bxP0N
         1D27Dg54WGsuyGd9EQnK0bTdFofmmefROeapbA4agb19i2DkdQJ/aPWnExWDfEF2Hbe0
         qasJ3BUFxd3PKRwpWWJnsnVu3DqT+Ydy3ciy9Otx44FUvZix1heL82Gl6RzpYV99Ew8D
         NmFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOX96J0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020ac873ce000000b0042e4e74affcsi2526962qtp.744.2024.02.22.22.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 22:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOX96J0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdOn6-0004vJ-2j; Fri, 23 Feb 2024 01:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOn5-0004sW-33
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:12:11 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOn1-0006p8-TF
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:12:10 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso52824766b.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708668725; x=1709273525; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Mu1jUbQ1hJ2IvsALS3VRQ0EeN+B0lzuoroT4sstyiQ=;
 b=ZOX96J0ptCoaDxBGH5/esOrM3MRo+P9zgvk7WYOnuGu3DPxRgyeKk9wB3YB6qY46dP
 5M9WUfnuGXr9KRBhZwFAm9slal0LWlMDiDkKquUyh1rZ8+7IGzHDysHLXzxWpDKtmMkr
 9HgMDqBsqCo3FVndjovFsIlQFr157aqLys3K9tnaqMznDuvCc73rb+9HZF/Oie+knwU8
 9WKzTU1YVBYixQ5hvJKmnWUoiufxlfHWvAle2dWCwi1aM9HraExLmyEValABzg4Ry0Bj
 MWuJU5jAIIYu4YbqxWxQc03S1CoQ+wZR5qNHf8Br85dLejX/scwJJFdtWfcaISpjIrzD
 hxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708668725; x=1709273525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Mu1jUbQ1hJ2IvsALS3VRQ0EeN+B0lzuoroT4sstyiQ=;
 b=wRcscMcodoAXxjTFsySdQtaoEaGISPB+OeDoP+XzGTlAymLkS22TTQNI3fD8vifqEe
 aJkiHJUHZzDIcwXlFDQiLb+CIfYkErxgL6yPePR+y1SODAIAMv0bgwnc1w6gTt0Vsmd9
 Brzm7V4IwWvyX7g54+k773a6X+ma+zXVQ0qI+QcygFlZIFxeMDlFvmCrSohXPstm2CRa
 L9MSW8hP2iq8UkNO/at13ho9LV/G/53Hk5SYlGxkeEmr0Fk6WHRlV1DVLKJ1b5wcP33X
 C/ILobAUYCKm8n7nX/KlJFC3o6PRDAm0v33bdlacPR/9TlHp3XxJbJ1TvblojnJyZJeC
 y8NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkqX684/+JzqeiFPmdddvbm8cA/gmxcu9qzOMdSVC+2Hlfj77fp7RnvojKSTK0rIajNr6Ga7ZhDrBzWdoq/h2izzf+
X-Gm-Message-State: AOJu0Yy8z5pN7yoXqZYXY3UjMAuwI08Aa2dBYsMh5w3IYnBuI2uKaEeB
 TFMcsEKQ3l/abWMLWCQIHLUX0WibXTGIdr/2IHJ/XfP/NTYOatK5TUv8Dy2DF1w=
X-Received: by 2002:a17:906:3911:b0:a3e:5a14:a2f7 with SMTP id
 f17-20020a170906391100b00a3e5a14a2f7mr522968eje.64.1708668725024; 
 Thu, 22 Feb 2024 22:12:05 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 ae2-20020a17090725c200b00a3e643e61e1sm5296597ejc.214.2024.02.22.22.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 22:12:04 -0800 (PST)
Message-ID: <a8c904b1-ec5a-419e-99bf-159ae1413948@linaro.org>
Date: Fri, 23 Feb 2024 07:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hw/i2c: Implement Broadcom Serial Controller (BSC)
Content-Language: en-US
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
 <20240220134120.2961059-2-rayhan.faizel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220134120.2961059-2-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: PbJos6fRGj6L

Hi Rayhan,

On 20/2/24 14:41, Rayhan Faizel wrote:
> A few deficiencies in the current device model need to be noted.
> 
> 1. FIFOs are not used. All sends and receives are done directly.
> 2. Repeated starts are not emulated. Repeated starts can be triggered in real
> hardware by sending a new read transfer request in the window time between
> transfer active set of write transfer request and done bit set of the same.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   docs/system/arm/raspi.rst    |   1 +
>   hw/i2c/Kconfig               |   4 +
>   hw/i2c/bcm2835_i2c.c         | 278 +++++++++++++++++++++++++++++++++++
>   hw/i2c/meson.build           |   1 +
>   include/hw/i2c/bcm2835_i2c.h |  80 ++++++++++
>   5 files changed, 364 insertions(+)
>   create mode 100644 hw/i2c/bcm2835_i2c.c
>   create mode 100644 include/hw/i2c/bcm2835_i2c.h


> new file mode 100644
> index 0000000000..d6b9bf887a
> --- /dev/null
> +++ b/hw/i2c/bcm2835_i2c.c
> @@ -0,0 +1,278 @@
> +/*
> + * Broadcom Serial Controller (BSC)
> + *
> + * Copyright (c) 2024 Rayhan Faizel <rayhan.faizel@gmail.com>
> + *
> + * SPDX-License-Identifier: MIT
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/i2c/bcm2835_i2c.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +
> +static void bcm2835_i2c_update_interrupt(BCM2835I2CState *s)
> +{
> +    int do_interrupt = 0;
> +    /* Interrupt on RXR (Needs reading) */
> +    if (s->c & BCM2835_I2C_C_INTR && s->s & BCM2835_I2C_S_RXR) {
> +        do_interrupt = 1;
> +    }
> +
> +    /* Interrupt on TXW (Needs writing) */
> +    if (s->c & BCM2835_I2C_C_INTT && s->s & BCM2835_I2C_S_TXW) {
> +        do_interrupt = 1;
> +    }
> +
> +    /* Interrupt on DONE (Transfer complete) */
> +    if (s->c & BCM2835_I2C_C_INTD && s->s & BCM2835_I2C_S_DONE) {
> +        do_interrupt = 1;
> +    }
> +    qemu_set_irq(s->irq, do_interrupt);
> +}
> +
> +static void bcm2835_i2c_begin_transfer(BCM2835I2CState *s)
> +{
> +    int direction = s->c & BCM2835_I2C_C_READ;
> +    if (i2c_start_transfer(s->bus, s->a, direction)) {
> +        s->s |= BCM2835_I2C_S_ERR;
> +    }
> +    s->s |= BCM2835_I2C_S_TA;
> +
> +    if (direction) {
> +        s->s |= BCM2835_I2C_S_RXR | BCM2835_I2C_S_RXD;
> +    } else {
> +        s->s |= BCM2835_I2C_S_TXW;
> +    }
> +}
> +
> +static void bcm2835_i2c_finish_transfer(BCM2835I2CState *s)
> +{
> +    /*
> +     * STOP is sent when DLEN counts down to zero.
> +     *
> +     * https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-bcm2835.c#L223-L261

Sorry for not reviewing your patches earlier.

Since this documentation will stay for long and the Linux master branch
will change, better use a tag:
https://github.com/torvalds/linux/blob//v6.7/drivers/i2c/busses/i2c-bcm2835.c#L223-L261

Do you mind posting a patch to correct this?

Thanks,

Phil.
