Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E63AD14880
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 00:56:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdeJv-0002S5-Js; Wed, 07 Jan 2026 19:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeJa-0002Gp-23
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:55:50 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeJW-0002Fo-Jf
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:55:49 -0500
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-7fc0c1d45a4so1650757b3a.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 16:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767833743; x=1768438543; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q5mWpV+nMrFaSU7KOv04C5BaT8Y0Row3HFqjRukRKxk=;
 b=BBb4x4/2d8kcorDKsLn9VaZzFc7ZWsvJjCo9t1nKk5lzOjP/8U8KR55BHAYYQVTomr
 ms9C3M1SJjfRH91MQax7n8Kb3whiFXZy0gU0wtwkPsna3ygdcPs/xkBYWS1ANaUL15cG
 lBvVm7KZPX0z0c/QFonoX6vi+mhNu56v28m8YZi7hJb5JE8wBUzfXppZ78aOlNUfMOh2
 vBkL0pbwSyPmqv4shbSptIO7tC238T8b17mnQLOy+riMn3W5E7iQDBqXBq4AAp5QyqQa
 czlYdXT+ePmRBYiI1V+u2A2reByJWb/DHQymBFTONo+Ogil9ATQtZIJXg9z7hfM9K8QM
 UCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767833743; x=1768438543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5mWpV+nMrFaSU7KOv04C5BaT8Y0Row3HFqjRukRKxk=;
 b=r6+edBtr18F82GYheio2a3npJejKE26SLEscRp7a6FbvEyqPJtcEBqwZjADFv5ROPl
 vqVoy6ij/ifGY/ZVR/TVfonsFjHT/AYGqaYLlljRGhF+wnqWfl56VHtsRvcI90yfeJW+
 iet270CuYy5Bp9PSyY/eJwCbU0AaCpi9ACu/bhUWVAc6yjoxSZGxKywVgCje4uLFeu7i
 ++TiJJqLG7V1+rZu3kCuEJVEBnz/q8BNYY1yKwGXa94xs9f5ZR3WAeCkkuwcx/uFLRaV
 kpBH+zZpIE9iqmkm7gqn2rRDPgnd8XHQrCPs31mUiZpBwmdfZ7CFAgRNjzMAhhKOJF9Z
 N25w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfNcJY61aveyoCFoiMrlmziolzQ/GdTa3czeFj1dz8lGupw7oxe1utWp3mr6F/blJ7x2MaRZbhmw==@nongnu.org
X-Gm-Message-State: AOJu0YwesK9hOzh3nbiUsKEqH683Y7dBCIfGOsS64JYeNVuSNBGjzN7f
 EunCQRQyJg8BEbEaOgeMH7ARFrDAvXsOGk2dSaMVzCjz5eqU81VilpO8TQSPPKY+XHM=
X-Gm-Gg: AY/fxX6KrI4OWfyi7FLx43QQomsdU4NVhsLwOgBKogK84xjDlfkL6R3YkgFLEnQjVBl
 kfSbAjamRpJtpu0nbB996qQ3qncr0tm3SAXTqM2CVtcjCRhuYp1hSdCcI2k9KboCfFyZsF8JLmt
 vQOgrW83ikdSpCtEliO+EsbWvqnJL7CraROGvFCoeYIIXLLMaEf8wsBnw0jYzpJfoYh0bMYr3se
 9GcOwsSH6gADVMC23Je5+sct/P5AfKqIMbUO0D2cydLTkfFdvwBER3cgU9lkSYT1oDMMQijoBUf
 aguq78H5u5p4I124y5s82TC+0qiLpT0okLU9IpYDxui/SFU7Lgac6IiLjvYL4xlqbOBysIYcHJe
 kBq+uh5SlwleXG3ob5L3YbDPYBTaCrY68SAgd0swo4MKK91FUucyQcuXQR7KRao4vOvAYHMqM/m
 1jVW2J42fkTSqp0SevS6hxYjFs/M691gEiVZUPOIjhBbm9ooYycBzhiNXEmmSIEMT8RU4=
X-Google-Smtp-Source: AGHT+IEAiZLTcykHkEiL3899LlkRRNtRX4UmgV9mwPEoc1JqkiRFieSn7ZeNnaFjKKbQSKLYoFD+Ow==
X-Received: by 2002:a05:6a20:19a9:b0:389:93e3:ca96 with SMTP id
 adf61e73a8af0-38993e3cae9mr2294803637.21.1767833742759; 
 Wed, 07 Jan 2026 16:55:42 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cbf28f678sm6236384a12.3.2026.01.07.16.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 16:55:42 -0800 (PST)
Message-ID: <d3038eeb-0d28-4f07-8034-4ffe944decc2@linaro.org>
Date: Wed, 7 Jan 2026 16:55:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/ppc: Restrict WatchPoint API to TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>
References: <20260106231908.16756-1-philmd@linaro.org>
 <20260106231908.16756-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260106231908.16756-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x444.google.com
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

On 1/6/26 3:19 PM, Philippe Mathieu-Daudé wrote:
> Watchpoints are specific to the TCG accelerator. Since the
> Data Address Watchpoint helpers are only called from
> translated code, move them to a new 'watchpoint.c' file,
> specific to TCG. Thus restricting the WatchPoint API to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/cpu.c        | 81 +----------------------------------
>   target/ppc/watchpoint.c | 93 +++++++++++++++++++++++++++++++++++++++++
>   target/ppc/meson.build  |  1 +
>   3 files changed, 96 insertions(+), 79 deletions(-)
>   create mode 100644 target/ppc/watchpoint.c
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

