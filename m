Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1935179ejb;
        Thu, 7 Dec 2023 14:17:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7XHxK5JlSVxTwyv3vxuHQ07kCKNQgt6c3e5dun7Mvq/8srjbWZwnCseknOkZOAxWyecyK
X-Received: by 2002:a05:6830:1e26:b0:6d8:74e2:a3cc with SMTP id t6-20020a0568301e2600b006d874e2a3ccmr3387894otr.40.1701987473223;
        Thu, 07 Dec 2023 14:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701987473; cv=none;
        d=google.com; s=arc-20160816;
        b=b8k5SlpznKJlhpC9EhH5bqXoTLoRpmfDzqd296zJKL5sgi/zIt+Vy1aFszrYa7RfUK
         DjPg/S+8KGSq81TuMc0eOkbbCdqx7rTuwLvr1z70zKg/tjpCXCTJVbXzYJfflbcD3kj6
         PCgXeU8+KSl+/T/f1aJ/NMwl2O82o2ceQ4CEMU91x2xzBzAJuTkmSa1gFVwJYbNcQo+j
         wKM1cSE7AUEXsCwFHyaWwlJsuJJD5DVnmZOFdZQmc8eCYfeeG9BZNq1nUA85TpsrhS3k
         NOOTzUJ/69AgzeWFx2ioEsq08NwQRBtnQnRHhFrJXYycToYmdQNdL7klvBhwdtr1c01V
         h9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BuyGrVe+f9SH+ggAU2z1X+VGSWkd/t+C8TZntd0RzJ0=;
        fh=84KY1J7FJJGslRkG7yjQRx+I8Qn8QbTjdaXSfOowZRU=;
        b=S+8ENucPgvR8QN7IZ8owMu6PLDwFGz3/4yowWOupwqaY6LqMReqVdGiH3g4zNUo5V6
         Q2DWZLn/4tZuxO3Yt5AIyh/UCoFgbh1GlhlwcPiWzaQzJ6rdkA/dl9U68hxhWc1DHQLn
         wmse5HXtwECFzqhm6XTw4UPcZfrynjJDCq2Qa49SsKwJ8vqfRkHSaK6TwAmxK+nOqSN/
         kEi76dufvuEo0eN+ywhn/czV53z4iTilgUGIfn4WQcP6u1ErLgMKKsL+4wwG1y9DHjeB
         4dDQXsCSsLTbbfOrqOxHaBmDjUFracWZ9FPrLYkdRCoWDhUzFv5+naDfK0i0BO9JmBH9
         vBHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oa54mjSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb5-20020a05622a598500b004257ba56131si821588qtb.662.2023.12.07.14.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 14:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oa54mjSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBMgK-00020Y-A7; Thu, 07 Dec 2023 17:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMgD-0001za-NR
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 17:17:18 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBMgA-0007ZZ-Li
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 17:17:13 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d069b1d127so11277905ad.0
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 14:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701987429; x=1702592229; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BuyGrVe+f9SH+ggAU2z1X+VGSWkd/t+C8TZntd0RzJ0=;
 b=oa54mjSfTZJujD0uOpWPWelPxuIaE8Cehz9p9Nh3Z6gf153QlwlZID6tu8IIZbSJ1T
 lPocHibKdcU2ubaT+r7P14TeKefl+uKoaLC7FvMDaJLKWBZF15ClwYE/a4zs4Egii9c3
 J58Maq025QuWMwyaL+gN8hWOy63fLxduzTr+CMRkeCpeFquib/W0vYbFefIDzd1Aqwg/
 WiYhCLhUq/6y3AsdR6ogsNbulsyNSYg2Z1IaCSLqaMXYzD40uQWZHdsjmFik/UxoNPOk
 HHAoKUsxgPMpPcH+ahes9pHus+nySiJ+ecR9sYWTQS7Eye6x41iIooerlhPQEEzLyZ2n
 glQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701987429; x=1702592229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BuyGrVe+f9SH+ggAU2z1X+VGSWkd/t+C8TZntd0RzJ0=;
 b=Ibm/+cWIXS/KMFG/HeFfRUyndBQD8g3la0/s+rJLPXljWPwBL0ORtJCr2qhWfdlrl/
 iTdgJfj4BkpPaGGEKOVXVw9o0SFEFi+8t3gBz+mtW9JMVh8pZTG3jUG+SY9wtKJrNamQ
 yZHe6OQMhdxUzIys6nKA1v6pvEs/rjUdD4VfZfbFjbKhYhpkmTtkdOMXLYPHuDnjfcNd
 E+U/WkG0UPf34b7h8nvXo5x+0X1XsyCAV3HV6uusWzJpl3Tt9/d5xQMDWe6Bw8T65FkK
 Yga+8/B3+HRqTkDO+v68nwysDgsRh2RUdULJv3/cTs0jXCldLmYnfcvyDNICtnFW6+z7
 /u8w==
X-Gm-Message-State: AOJu0YzH2zqDCRIhatp1rDzCkcxVqF0B80xVbJ8hgKPTqyjO2eT9GUwI
 wEr4NaMzOmYWGXlxQMe4e8QR9w==
X-Received: by 2002:a17:903:11ce:b0:1d0:ab30:5582 with SMTP id
 q14-20020a17090311ce00b001d0ab305582mr2841802plh.129.1701987428791; 
 Thu, 07 Dec 2023 14:17:08 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902ee4c00b001d0c134dc2dsm310721plo.77.2023.12.07.14.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 14:17:08 -0800 (PST)
Message-ID: <4a648903-ad7e-4713-be5f-e58f5174d1a0@linaro.org>
Date: Thu, 7 Dec 2023 14:17:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] util/async: Only call icount_notify_exit() if
 icount is enabled
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231207154550.65087-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: o4aIEA6zEw2G

On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   stubs/icount.c |  2 +-
>   util/async.c   | 16 +++++++++-------
>   2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/stubs/icount.c b/stubs/icount.c
> index f8e6a014b8..a5202e2dd9 100644
> --- a/stubs/icount.c
> +++ b/stubs/icount.c
> @@ -43,7 +43,7 @@ void icount_account_warp_timer(void)
>   {
>       abort();
>   }
> -
>   void icount_notify_exit(void)
>   {
> +    abort();
>   }
> diff --git a/util/async.c b/util/async.c
> index 8f90ddc304..9007642c27 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -94,13 +94,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
>       }
>   
>       aio_notify(ctx);
> -    /*
> -     * Workaround for record/replay.
> -     * vCPU execution should be suspended when new BH is set.
> -     * This is needed to avoid guest timeouts caused
> -     * by the long cycles of the execution.
> -     */
> -    icount_notify_exit();
> +    if (unlikely(icount_enabled())) {
> +        /*
> +         * Workaround for record/replay.
> +         * vCPU execution should be suspended when new BH is set.
> +         * This is needed to avoid guest timeouts caused
> +         * by the long cycles of the execution.
> +         */
> +        icount_notify_exit();
> +    }

If you're going to do this, remove the test in the non-stub icount_notify_exit.


r~
