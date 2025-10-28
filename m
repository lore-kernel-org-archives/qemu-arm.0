Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB4CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 12:09:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiVj-0002Ub-Ct; Tue, 28 Oct 2025 08:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiVY-0002Rd-WD
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:09:03 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiVS-0001Nx-Kh
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:09:00 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b6d6984a5baso943291066b.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761653326; x=1762258126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tJrPMCtLgqt23uoDB7YNHYN7lCrT98SpD4zNvenvblQ=;
 b=tj4TuAioOVxZPZJoXdcZUTY2fp/U2Y8PYn+PiHQ7j7lDdwm1tBVSXDju2o3nMWk72z
 c6Uko4uHp2rw11HybnP7fdoYScf+zIWwrOWud/olrhyLFxufG+kRXATp7YsEHU055bUN
 Vm46eytISFywXfQT4C5f8ejpDexxU/kCmaz3wkn33PobhRBZ3KZWWQbEP9Dcz0KSBTee
 WL8sdzluPElihDdn5AnD0YGcCHKu6NafxOEYzHpq0IUAT7eOKSRGY7lX7NqlD7m2WDKX
 kgCrBmRjbYW1NDqYx4Kw5ZgOys6B2xNLWomsIKB6PapGeTky2ncFdoBVcZucMnZyL+qO
 2uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761653326; x=1762258126;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tJrPMCtLgqt23uoDB7YNHYN7lCrT98SpD4zNvenvblQ=;
 b=f0XfWrcb5lUa/o7p7X6x3tSZIFtMYhSgZFh4A4bjzDWu8AwzbLVIwKIl1NI3SYSY8q
 0XeGfo9D5r5SwxhVrR7bXGKYSkMR3iSTHDSnDLqRYR2yblgmensWTPBFdXhnWnt+sUvE
 8F9CfJ3VGqM7JFt+7HGksnytNhc6npdzHkIeThEGYNje8j62Gk86YZ/AcJ9MmSwqBBUY
 AAxtSgRcG1tVzd9dvn7iNHd4EzT35ht2A8IALigpQhhJou3abO7zh71rFEJiVDbDKNZg
 z2e9uLZBt36SQAgVdbMjsgofscSQxRv3IhYbBPh/AqWHyNpxp++OPuRPf/6hBE5i2DHq
 E7Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbu/WxnwhquTNH5zz0lOeVFx2EcT/HUETS5EfgZfOeL8BA6n/TS1HkfgQNMWVtyzGp+VmsyjxBBA==@nongnu.org
X-Gm-Message-State: AOJu0YxUw+eVjaea6e91v5UqWXjHtAWVpOB8WwVB+F7bnTLvtREa40Nt
 zJf8HTuUOGMQmhbdkyTOKIesus1JgvTWrAwFQinirKulixKF954P4syj1qjYmrr7WRk=
X-Gm-Gg: ASbGncuRJMPIdIpAi7WjaxibRkDCj3HzP3s79/m9Py7MS4PGylDHKHWy9RHuzYOT7i2
 M+3EYwc8f2pLpGSdYJRN2xWUy+vhAgOin3azK/8f4bgnVKfxoj6JlLoBdL/9boPQ7cyd7XkOYWf
 QBp0quZ/YgEs8e+YPJXCaIpl5VbEpHh043IM0kOtg2ie32nURp/r2iTv1AQ9yd0uSRg8Hy1t5NK
 K7dP2CPRWB4Zbey8CjtkLlRizGtLOI3iM4kiSuM5ertX7diKs70KJ/K7FH1JcyiEf2XQP+vwImu
 AjdRK1ZBF/96crVtLKtSeS5aBvlFqcCeB5hHEiZX/D6xMHgp3EtE0bFHQC5GcRl7ikYSGr0BKQx
 9vZ4udeMAULGBBuYRBUOnK0+q32AS85n0Woa5Uc3OXROxuAnvGBpI6HJiWnF70s/RKv+p2k3dUj
 goG57rZ4u1MmV/T7uOLAVFMzJdXLc=
X-Google-Smtp-Source: AGHT+IEEiOLfY4HEB1DtBx4AhKQ+2sUC6aCb90qXuiftDtvMSOBTQ/nCd8LN3fjKoD+zHoU4Ul7Edw==
X-Received: by 2002:a17:907:3c88:b0:b2d:830a:8c01 with SMTP id
 a640c23a62f3a-b6dba5bda25mr333917966b.61.1761653326362; 
 Tue, 28 Oct 2025 05:08:46 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef82f2esm8832457a12.14.2025.10.28.05.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 05:08:45 -0700 (PDT)
Message-ID: <2ecf7124-978a-4d3f-85d9-3d8ad7584eeb@linaro.org>
Date: Tue, 28 Oct 2025 13:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 52/59] accel/hvf: Introduce
 hvf_arch_cpu_synchronize_[pre/post]exec() hooks
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-53-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-53-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
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

On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h  | 4 ++++
>   accel/hvf/hvf-accel-ops.c | 3 +++
>   target/arm/hvf/hvf.c      | 8 ++++++++
>   target/i386/hvf/hvf.c     | 8 ++++++++
>   4 files changed, 23 insertions(+)
> 
> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
> index 96790b49386..3120a4593a4 100644
> --- a/include/system/hvf_int.h
> +++ b/include/system/hvf_int.h
> @@ -71,6 +71,10 @@ int hvf_arch_put_registers(CPUState *);
>   int hvf_arch_get_registers(CPUState *);
>   /* Must be called by the owning thread */
>   void hvf_arch_update_guest_debug(CPUState *cpu);
> +/* Must be called by the owning thread */
> +void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu);
> +/* Must be called by the owning thread */
> +void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu);
>   
>   void hvf_protect_clean_range(hwaddr addr, size_t size);
>   void hvf_unprotect_dirty_range(hwaddr addr, size_t size);
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 28d50e23017..6fb1fda424c 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -181,10 +181,13 @@ static void *hvf_cpu_thread_fn(void *arg)
>       do {
>           qemu_process_cpu_events(cpu);
>           if (cpu_can_run(cpu)) {
> +
> +            hvf_arch_cpu_synchronize_pre_exec(cpu);

Funny extra line.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

