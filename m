Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA63D2502E
	for <qemu-arm@archiver.kernel.org>; Sun, 11 Jan 2026 07:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veqII-0003YG-W6; Sun, 11 Jan 2026 02:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1veqIE-0003UZ-8u
 for qemu-arm@nongnu.org; Sun, 11 Jan 2026 02:55:22 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1veqIC-00049P-Ol
 for qemu-arm@nongnu.org; Sun, 11 Jan 2026 02:55:21 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-81f4dfa82edso143135b3a.0
 for <qemu-arm@nongnu.org>; Sat, 10 Jan 2026 23:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768118119; x=1768722919; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xekyq0V/RxuIv0JdZwJ/jdXRO4YRJVI6B0V3IRqiQpU=;
 b=Ex2tfmVMUyWGRMpjg8+mIAAbNJcKurJfF16ErDsJW9GkVibnIHSR8jtTnuMgxWkoAi
 5ZaSGhpHSiYXEW6yVdc2l+8kiDTn6ExmwS30W73xg9YRl6R6JtWl6VPdozWMOodB5s7R
 irPUQPrNHlnTMrYGIPmrPrPwhlOexYQcI5f4kM0XjlnLixsoVjkARMI6efJpJs8eVeRq
 ZfXUXaqGPOp7CmN1+74W2M2wCik9I8KOJQW4BMAIOahap8Azfc6+pRmAGcv+zwEu0Y3/
 9MdqdRx19/Fdo7IhxGeqNSiWQymn3oHRpkfh/JlPb/bQ/0LPhXOIJ00CTf4ObpG9CsU4
 xZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768118119; x=1768722919;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xekyq0V/RxuIv0JdZwJ/jdXRO4YRJVI6B0V3IRqiQpU=;
 b=SZ/F4YNK+44r0vu3vtW/gxKQMLWcQ/mdv6m4tK0aTX/ugX6gOVuKVhDvBnCtuC96WT
 99KlQrAUol+WWEq1FbS0ikVyebxaaO9buM8hEy0QLjrMeI6W8e5N5zMxe8/SYnR7ToJv
 5/AB0OelOTRT0Drq49sAD94Tit4KI3/qeZ3EvAhyIEJQFOTmzY6h/N8E+LIdjSlBC6Ql
 F/OxGo7o/mL5k/DW0fo3mroWkkK+pN1dE2UxFOqqiw2yRNBsQNmPutRucrOeIFO2U6Ao
 FZ25PsKv0rsn06rJfJOiKRdZWGFMwMrbVCAqmkkmA+wNvF1qYiysECBYpjsn1Ah8p2Tx
 KJXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8GplhVF2zvEa2CnQOuR6y0qYb8N6gRQY4wnKbqJ8PP0ReJgXWMrZgItYMO5K0Hafv0lzRRVKSmQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyo7ocA04jZZFOdN0px8QHc25svKa2ahFlcg/8TBU5KqDKNc5JS
 5WsnHJJfmH8WWDhc+ueYbd6307OGRUThwNX/mAlX4uCbszWd8+A0APQZ1ULG4IMbWj8=
X-Gm-Gg: AY/fxX7WkcqtwkQbPmA8PdUOf9M20F9NEyzjycbbxd6XHZAzk7NxLmI3CeRLEXzFJaN
 wUNESnfSQQypooQQARcFaRDOasx8FmMjkHAKK0NXIloQ7vbLJWmwdsFwN6dj7xYuq8sGdPu+g6Q
 vQFiu6TeTnwxMLYpZ8cOaNQGYhtq42lOPXUw5LWwpj+AcEEecAbphtY9s6MSdJV5+6r0KjAmBTn
 j3ScrF86VEfXp4K75fCl72nocccACcP+y3oRS5dsIuDOaaDzgZdOweYwaJ8LnNe2nYh7AjfVSjA
 xNiykOmLnL0g3lIVEFG5fpRnUbDof6xWrNC5M6tlXnxUdOG0aepLzzpiRmFmuj3tc5ssqGlncOh
 fzNZAJ5XNmFBb+la20i52A68Qy9le0KzHOeU4L+RWgynWhvzi0VgcZLbsxYAJbjrXE4CfSzO13l
 ZAV96C6pTljKKri1LVzImrFYtvonvVXDaJ0B7G
X-Google-Smtp-Source: AGHT+IEPBTPwQvuA8KlWnwa6m/062v7f+ete2XGydmKIKw7WpOZA95KX1XhnVlOHGB7j9HBsSKsNiQ==
X-Received: by 2002:a05:6a00:4143:b0:81f:4dff:336 with SMTP id
 d2e1a72fcca58-81f4dff08acmr1200552b3a.52.1768118119258; 
 Sat, 10 Jan 2026 23:55:19 -0800 (PST)
Received: from [172.23.81.179] ([202.86.209.61])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81efe4a95c7sm4290857b3a.37.2026.01.10.23.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 23:55:18 -0800 (PST)
Message-ID: <27914378-6d4d-41c9-98be-3a860f4964a5@linaro.org>
Date: Sun, 11 Jan 2026 18:55:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] target/m68k: drop cpu_reset on realizefn
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108143423.1378674-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/9/26 01:34, Alex Bennée wrote:
> Now all the m68k machines have cpu reset handlers we can drop this
> extra case here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/m68k/cpu.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index f1b673119d6..a540a754969 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -392,7 +392,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>       m68k_cpu_init_gdb(cpu);
>   
> -    cpu_reset(cs);
>       qemu_init_vcpu(cs);
>   
>       mcc->parent_realize(dev, errp);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

