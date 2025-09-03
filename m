Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA07CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmdt-000875-6D; Wed, 03 Sep 2025 08:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmdR-0007jH-Jw
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:30:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmdN-00027g-Au
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:30:43 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b042cc39551so478091866b.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756902635; x=1757507435; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2mo8VOF4ouaA+/wqy9v95o2lrqnfyb8NhcCck/feyk=;
 b=tJhMhrcmePl81DiuxjYjD7NJnYZbXcaWGsxIXP26SoTMI1C+kpTFR9aygp6PtSOaAi
 FIo5AWa7WML+xSPq92X8GMiy7J3oFtX4LKefxHjUjpDbZJiz8a2rDwgiG5k3uBSFmfvv
 hBNDzk/0Yt9awmLcUTv3rar4dm6SoZ+by6jaeb1q1TtD5+Uz+xEYi29qRwNKqBSeoc3F
 /u1FsLH1RAOz1+hET2IZNs/ahPmMOrRCTyZ5ih0pE/0lhWtLRQBB899D7YgyxFSTrVr/
 aZ3XUi5bN3b4AYfhQj+YCaTbaDNSZSLtQdeUwb4zBW1f4B021B6AovaiVi5VePFCGvUh
 LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902635; x=1757507435;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2mo8VOF4ouaA+/wqy9v95o2lrqnfyb8NhcCck/feyk=;
 b=xNddDCJaDrxloESh8mWHjaTO4NmTi9mkinawTCMzp3/QgZ32H1ibH/5j/54VTj4yQB
 pem86LrynFRwR13XDtF/Pq97M3UQZDnEQjHMGE9NUkNsZVm/Tr9+lTRkD3YhSvC311vu
 nLeFVk159lmdTA+/+bLyLxen8PueAXby6ysGp6bQ067HNBid673ctX8yQZkoU9YTtJLa
 +UkaDd1msJmdrA9RYb+stFXVDibHP0/496sgEvS5lIMo5E5h1PAxASThhV2HkpUB0jz+
 Y3BoNKVmbMhb7XE18EEvhAhEc722Cimo4yrsAHMnuc6OXeCV05QslOrAjJgYdQq2gqG7
 M0Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJE8pbRigE/XyMa887qTEdZPt8ruwSDyR4aLcpLiGGqPIVWDo9v05d8cZ0tDHqTPfLneUsDv1g3w==@nongnu.org
X-Gm-Message-State: AOJu0YzPRzjXOROyYNqjfeSygijbl5wnvk9KF0kRG9Q8WFmzAARLuctr
 fxV9w+k5UKY2rsUEDJp78QzjkHMooSNdxkwfZf8e1THIjmH3Kbs56x9Ttmfrf+jZvNM=
X-Gm-Gg: ASbGncspmeYnbqi0x/L0bRK9FaRGEj6Rai/fJKGfjEEn3/Ai6qlNHy1KYLsucA7h2xf
 +FixKtKdDHrQI+pFhpW5Bm2h6a6M1oFMOapa1dFv140y445/YhwT3u0rjXffoQKifUKI9wbYL/G
 e3wNPUfEyGluawXa4yfnQEteV7cM1z0dcSbVLN0stnqyBgrGP3WPTlCMNMqj3mvycm4XUuNiwU8
 fs9Wo69ez/s94oCLYjixxQvhKADny+w1J4wW4Wpkb7ZtWYYJAo5b6Yq+YfxSjif2fbB4g9tvt0u
 58wMdNw/z1Tb509Zhik/sxJUfciMpqpi9RhBGQ8p+3uYmNjKYA/CYLtg3QKd7xB8/oPWEQKLe1s
 Y5Bt5MPVo+KdcTJvk6oTsueVBcHScMJ8KI6VGwKo9BvESDFaTOd6A38dO2bnd7YYt9/QdPwCu8c
 hFg2ijBw==
X-Google-Smtp-Source: AGHT+IEtQL9cQQzPZZadlegPWyVe21Br3vzGGtsi5gkwO83hd0lzx8JcNJw3zMXBWKJa0o6z5nCCXQ==
X-Received: by 2002:a17:907:1b22:b0:aff:16eb:8b09 with SMTP id
 a640c23a62f3a-b01d8a2639dmr1318213566b.5.1756902634943; 
 Wed, 03 Sep 2025 05:30:34 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040d44c9adsm993141866b.9.2025.09.03.05.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:30:34 -0700 (PDT)
Message-ID: <98dcc142-6394-4167-b93b-c9476c210696@linaro.org>
Date: Wed, 3 Sep 2025 14:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] target/arm/hvf: Check hv_vcpu_set_vtimer_mask()
 returned value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> hv_vcpu_set_vtimer_mask() returns a hv_return_t enum type
> (defined in <Hypervisor/hv_error.h>). Assert we succeeded,
> as we are not ready to handle any error path.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 65ac0bd71aa..1b59cc0eb04 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1906,7 +1906,8 @@ static void hvf_sync_vtimer(CPUState *cpu)
>   
>       if (!irq_state) {
>           /* Timer no longer asserting, we can unmask it */
> -        hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
> +        r = hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
> +        assert_hvf_ok(r);
>           cpu->accel->vtimer_masked = false;
>       }
>   }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

