Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85297C5AD4E
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 18:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtVby-0007Zz-Tg; Fri, 20 Feb 2026 13:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vtVbx-0007Za-5m
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 13:52:21 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vtVbv-0001ga-I9
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 13:52:20 -0500
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-5665171836cso2553711e0c.2
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771613538; x=1772218338; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MfZaD0WBrjXyuFc0ZY6u+e6s5SbK+Mu7vMgh0LLtUDY=;
 b=ye7AC4HKsWrrwYCh8cL8K/bo4HYoGHZ9EGoAMcIv/QUtcqNBPLNaYv2ankX+wIMkK2
 5KNOzThOM0KcwFuGmhEnpUVWjU+T3s3UdROUiNxT7SPqZvIv9yVE45yDu9nWfWFi7KlT
 ZHjzMvK+tukqSbvbmaPm/xx90vyER164AedjgqahaOYQhQTNkEu2L2oB3P2CTQ6fQQ4A
 1mC15UrQ7r8+RlZijimi/y66HWepnGry701ekyc7xy6TdtDIn2ZmqD4q2Z9ZYlak/dVC
 VgI6Vu3hpI8ur8sM4/aEwc10X0IYA//CQuce5c0sT22jiWSkhj2cvkqG7KmV/qyIJ0zV
 Z3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771613538; x=1772218338;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfZaD0WBrjXyuFc0ZY6u+e6s5SbK+Mu7vMgh0LLtUDY=;
 b=iwvuAIA7vfcVWmvQwXC3SPthdYnJN228QilNgrH75Hll30kf4DtXh3BvHzmARhj27R
 SnO99XRcFyiYnYsMhl4L0DBTBslde8rY8ZYLT6EZOiFrfpuQZ8SJiau+n+T+aDqjUpKy
 sl7GP9+mqRWxKqX702BkVDlpTt14FuIDpleUH8BB8RGrWzDttudN7YfxNQ3jf8RR+AYe
 PwMVnwk7/p0TH6t07rAN0H48k8vCGXpq9NeW7qq/DQ7ZUSLDTgNuOlSlmfzyxUSA5diF
 Zf+g1eumiDNXmZlmigArQdp3WsDYZv3/O5/8TlHy1UavykVHc7oNohgGfVtOBhUQfKMb
 xIsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdALQ5Q1eN3TcZhmGohV5XUE9QnWYHkBfc7QB+CQm2yTCpK5c69mf6cVS1+QC/rjLsrmpDmtGHXA==@nongnu.org
X-Gm-Message-State: AOJu0Yy054APxn38sVHQA5mP/R89d7dHWzAPKVxCO0q4GE6NLu+wkgEz
 saYhGkaCDDyV7smaI6tzLWSm+tiG7x8GsUlYo4lEngX0gqzjMI+H1dTdPR0fWM2wcdI=
X-Gm-Gg: AZuq6aLUOqr7BmU9x27KQJzneu44AiJnpfXpcMevJo847yGAGsd5vnybIcXdkQxfr1X
 yMWzXwkt4sIgk7Xb2/zq1sm8V6992/McKzzEzjF3+ZI9OwySa86yOBGV+B16+T9IxxtTbfBZFlD
 b3Jh7MMqBuZOvYUpIZxDs9stc28xRWitKmG5gAN6kRZEbbbn9KENTgNIvDTTEzSWML8GXjWl/Ck
 ADXHcr+/vEJ0EKbnrsprsMXenxGhoTcIwjVq3LelCrlxoIzjNcqKFe0nOIqnKVRFwdqTAWR2RVB
 NWYxWFpycjLtRy8yA6TFRMJr/f9iIaKUv1K9mDiFzV4VBZ/ahKt/+NqJnL5wsHZiXF83C73jAVj
 tMLg1RlGu5MZe++WIz/KIvHOZbExfDyPxjsaatDEWgtSNCFgUbAT6Z5Rm63xAhr2blouza2Mo77
 MMvWDDWeYdlxfboxzHVoGirx4uVFI8/DhAZ09NJDdJ0rQ/D1O0q8rcSbTAjGn4gCyxdp1iF8ybQ
 jo=
X-Received: by 2002:a05:6122:929:b0:566:2fc9:6c89 with SMTP id
 71dfb90a1353d-568e4881907mr432987e0c.10.1771613537809; 
 Fri, 20 Feb 2026 10:52:17 -0800 (PST)
Received: from [192.168.0.103] (200-100-75-206.dial-up.telesp.net.br.
 [200.100.75.206]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-568e57d42fbsm160239e0c.6.2026.02.20.10.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 10:52:17 -0800 (PST)
Message-ID: <d5839ed8-dc2c-4c90-95a5-d5442099911a@linaro.org>
Date: Fri, 20 Feb 2026 15:52:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: set the correct TI bits for WFIT traps
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20260220171945.1065102-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220171945.1065102-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa34.google.com
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

Hi Alex,

On 2/20/26 14:19, Alex Bennée wrote:
> The WFIT trap should be reported as 0b10.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 4d708635068..aa14f15eb62 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -448,7 +448,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>   
>       if (target_el) {
>           env->pc -= 4;
> -        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el);
> +        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el);

As per the AArch64.WFxTrap() Arm Arm pseudo code:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

>       }
>   
>       if (uadd64_overflow(timeout, offset, &nexttick)) {


