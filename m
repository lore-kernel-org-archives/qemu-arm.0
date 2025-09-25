Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B8ECAC5AA
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 08:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1hRw-0005ug-CO; Thu, 25 Sep 2025 04:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1hRu-0005u3-Cd
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 04:35:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1hRS-0000Na-4W
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 04:35:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so3070235e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758789296; x=1759394096; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kyx8PAMulr6JtWbbO/iZ3MRPGcwo9sej+tWYqV5u/pQ=;
 b=YXdKFHnPZpOUmbNW/iwmNsFa/kn9vEzbzR+aaCRj+fSAOs+HR1UJKH0pT048q1LG71
 pdavfmRn9V/s/Z0Fayf5CmIOai0ufbwh81fO87jCejw/UCNP+ckssixQiLc5u1SAkmYe
 PZy5djeLwKFY9zM32OP3yuj6LMupBQMjX0drVa2zkSjUNNgr0zea42QxaApdXp0FbEXx
 ffxJ2KXH+WEosEUxaf+DO8M3D53VSa/FK1Pc28082gtIfYAvhccx13YcaHNdkK8+XxML
 J2wLqChefGbXyxhu8knmDWrSXJRNEnh/LhkbtYJ4H6L+6KHY3tj2CNdlbdbAKtqINWvD
 pLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758789296; x=1759394096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kyx8PAMulr6JtWbbO/iZ3MRPGcwo9sej+tWYqV5u/pQ=;
 b=DTi0CI/Ic33/H/95joPSFcUcKTz3sr1/5h1V9NimbyjE/UBM4ii8mLAXtsXrqngg30
 RWXJiNgK5r/E1toIVSgLnqe+FpYvQFLmhEhlpfPiMzvNZRP6XaClBINK2IOnSvVW7vE+
 JECGtrUREZbkWk+k+WWCfqCZ2ESjUaBUNzJl69kaYxwYP6qXwUW7uoawBbhd44YpMyWo
 ER8RW2HnF+/SPmDRjjrKCPzLXbb/8XbIgpP1t9UIVM2oa9GLJXIeh27puzsjoNblnEzy
 juAq4hfssCttoVG0uAvVAAZBga7YXMjUiFLpGnTkHF5WiZPRQJD6LvvYaIVORjLlObOD
 4dGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIAjNDkInAnDQvAzpO8TE/0i6ZA3FM8Sx1RxruidaBJ8kx2p1SDV8HnaztkejF/jGGHFQN9IvT9A==@nongnu.org
X-Gm-Message-State: AOJu0YzQAdvqKpjQEgLjfL8s2PC708e9FD0spKFtfLn+JkrLeMKn08jZ
 iB4KScGYmEnET9+C5oQqDNffrg0un3CIb/0pUK/6AA11p6j798PTslr76UpdUHsqgYA=
X-Gm-Gg: ASbGncvoXSy1BNNFjJUKE+A1D3guGFiJG0CRSABLG1IROq+bqKnaeFql5pBItu+9IZU
 Q7x1UOJDKr4EUmuKhSQrmM4/cJZnitBX5tlart1JW6aUPlBNjR3EJq9LvOfxWe9nydKbfekG0+T
 YhUCIRSEZjm6pDyAVu3qSRDM4jJYNSpU+/zqX9eoTE22f2VcGf2lvvRciSQdaNhMsRKcbWwHzgX
 9UG+UecKTxd8rqkLxnvXXNF1/NecZkdse2RXrl/ocrvKtptLHUS91EEtg8oVWWDOqu1oO8/3np5
 TRJTT9wy5AUeKBRB5Fx1DTTe5AvZMV9Vl8jbRYkvVi0qWVe8WBloO0DDat7e0HhfEauUBLz2QPD
 rjzuagRaKx9sY0PwG3sY6DxBFYVCXc/DZtmGPQuda1DXvDH3WkFUl3bsQD23lu5l7wA==
X-Google-Smtp-Source: AGHT+IFlgO74C2YcG6q5IKTj9eWkg4P1wEhNIYti5paAxgJPjsvqLpBpxGkvuauS+hGqPoIlU6LSBQ==
X-Received: by 2002:a05:600c:4ecc:b0:46e:33ed:bca4 with SMTP id
 5b1f17b1804b1-46e33edbe6fmr15561145e9.15.1758789295506; 
 Thu, 25 Sep 2025 01:34:55 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9e8aesm23277225e9.4.2025.09.25.01.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 01:34:54 -0700 (PDT)
Message-ID: <4e49f12c-f345-4e8f-95ea-5b5f6fcfede8@linaro.org>
Date: Thu, 25 Sep 2025 10:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] cpus: Only resume halted CPUs
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Mads Ynddal
 <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250925025520.71805-1-philmd@linaro.org>
 <20250925025520.71805-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250925025520.71805-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 25/9/25 04:55, Philippe Mathieu-Daudé wrote:
> Avoid kicking running CPUs, trying to resume them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/cpus.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/system/cpus.c b/system/cpus.c
> index aa7bfcf56e5..6062226d4ac 100644
> --- a/system/cpus.c
> +++ b/system/cpus.c
> @@ -666,7 +666,9 @@ void resume_all_vcpus(void)
>   
>       qemu_clock_enable(QEMU_CLOCK_VIRTUAL, true);
>       CPU_FOREACH(cpu) {
> -        cpu_resume(cpu);
> +        if (cpu->halted) {
> +            cpu_resume(cpu);
> +        }
>       }
>   }
>   

Please disregard this patch for now, as other changes (non
included in this series) are required before this change is
correct.

