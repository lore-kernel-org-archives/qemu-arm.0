Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp524579njc;
        Thu, 5 Jun 2025 13:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoRpYPCyZPzUzTFQ65uOYKJhLx7LIhLJXSoLk/ZYUEBWG9G3fussC0lIhPK7wvXNYfe91CUDFqE+LWmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdf4IG+dOJwC7aMKrw3FlCiM2sJ4Fkd/NtMZQuCtpZUMuegDNkHnmlnQaGgcCtuZc2o9Pl
X-Received: by 2002:a05:620a:4151:b0:7d2:18ba:8700 with SMTP id af79cd13be357-7d2df678c0fmr6070285a.7.1749156834251;
        Thu, 05 Jun 2025 13:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749156834; cv=none;
        d=google.com; s=arc-20240605;
        b=glFk9XSK4sqiRs8hXTsDFreDrPVhSUvPwSwR2lmidZ7DnNUyp9EtRhzsFDZTyif7m+
         SVPlWwTYSvHWsjtDZ0ZjbJEgsXWyACV2KTtVSKYtmOyT9nqvPDcJTeJLBA+kahPnvYZ5
         aIzcLBYW62dE+IJ/3jydyToXYcP4cj0ceTVr3w0PfTcXcVzr+Upw6KTurwSx4eLKI57+
         KF+FKqkfWBtZkWZ2tvPr9NXKVEEu6I2XD6+qpM95oGSD5FYfLsvpMlBCURhHYCLWEduI
         nyQ8rDSmEN3j1IPcR3CydJGjzOfE1C4M87L3cbh13tuIbvpvWnS9nCaDM6hfUpV4bego
         tJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d6QSxoH8YMxAkEY7u40LwJLutDJ6kfkoNyWKMUjKwFo=;
        fh=fKrBQtv8Ss35iCBJ8OxRdy5uOj7EtBS5p8/H0mDnfyM=;
        b=WLTntpfUvAd0ITyanD2XiQAUWsOKL23Tx+sj6ZS6EhuLD6oLquEzJwJbpjxyLMCPOb
         BfYzI1AgtdFqtTd5keRonhcX9ascXNwN9RgQ3++7udB0mU+Vzo9yOpV0kawkefnRbWZR
         0JRkUEiOrlQ2JA0WeIUDdYuhtBC762kt3V7gDtZpjmd8hkUe0SHpQiOjII1GmYlQPDrU
         /panAFDLoo49C9FjvRH0uDdirtNI6F3Kn5m29T6Ahgko77rPfuVExG7vqiEE7KoeAa3X
         kGRzmatwKER8ms+4MtO8bvG4tYUJcRDY5JFibzwFkH4nzOHp81YnpYuajIPSIdBOZn7E
         9gKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBUwsVSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a5ef983si27285585a.228.2025.06.05.13.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 13:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBUwsVSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNHar-0006rK-Q5; Thu, 05 Jun 2025 16:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNHap-0006qb-4D
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:53:43 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNHal-0000sz-SV
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 16:53:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-309fac646adso2575783a91.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749156818; x=1749761618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d6QSxoH8YMxAkEY7u40LwJLutDJ6kfkoNyWKMUjKwFo=;
 b=pBUwsVShQI9i3xz/0AKGFnJ7Bt3J3S0k7Vd9iSP/C/uuVpqte94zw3C5uxta5gsoxm
 WL/FNyLMoWJE5H5+NC+Le8+8tE1YmYxskj7DxJaX0ClAefSFTEMSN0bbR3egW40vRDeT
 vtpR6ePZx42Qvr+mrtU96yT0aMB5LI1S6jg0aQLhNmlY3p+ox7cBhxXhzzBJucvVYYTi
 fB7WQq3RIdxRqc51OZwKBDPIREBxpcPNZtRd0arQDd1hkwtRzgqLCVCGvEyRSl9sDUY/
 puuWbbbpA+Wy0uQkZ8pCrI5PirqYsgGpGHVV5UlIYQZV/jSglw0kXBIN3xDIOjtcVpdr
 k68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749156818; x=1749761618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d6QSxoH8YMxAkEY7u40LwJLutDJ6kfkoNyWKMUjKwFo=;
 b=cJmtzn8ErPCYCs6I9MYsEbaW9+WSIJTU2l16NA43Bm6X+uMdo1ZpMkSDTjyZ76mmb0
 Nk/cpTKk1IHBLbKdrKmgaShNtOxukLW85TNFphXAvhPtOw61B9+7sc4CbCQNIFr5JhYu
 eiAMpQPcqlH4qz2NyOr3lM5ZyalRC5YH4jXedq4Y8Zn79adJuMHShiRegaJ7cjnaoKlA
 JdL83NStdHjb3hAb1twrRJz4zMG/iHLLkoNd2cBQp4lAILo1+BBNUFZMiGxKBrfLxUgS
 J/CjDw70HFTBRLJ7WDMmUA0kZIWoFnKaTV0o+FkeiFCJPe02HVFNesljtGVUXzq5j/LL
 VCZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZAwo6T5OBV9rqId7gNE1cwn6mNA5jiKSeqF6Ee+16YZrYyPUJdZrJT9WbUYddf0lhEDSwppNeGw==@nongnu.org
X-Gm-Message-State: AOJu0YxAiRqKEql2HbR5jFQNIoWhi+Wd3WTZI9jkEWafJQY5azG+YdJk
 5BdShTIoPV6qJNcj46t4xAeM/dW33FcFp/QVm+stl1B2g9I1WmdlZnKl3v4gg+JorFM=
X-Gm-Gg: ASbGncv4EOcHxket0CfFPYTja3sMvuTLPz4Bdsiz8E1YCYhBRsN/KotA/nOi2EcdYD0
 rLiRIDomLqh2pXYMcQJ3+g3mksnDO0frreGybz/dLbAH/L+AMm/R4jyUB8gZbvKEJa3VH4ehOed
 QBilft7livFttLWok2SQ4FSewgAzRMkuwxQdCn6+2GMC+GByV2C9dXiaNfagnEhmc1q9M8lAbNd
 qqS7dioZ03M+ymva4QENICbo8KgHB9gXj0/B+BBL0IP0eBDx04djBr7cKxzB15j1VBrvDpK+YvC
 YKWMMd8MheF5FPbgVSPwfkX5b3nGcOM0ajC6XgjpHJqtcg2pXA+GV+37GATH0yNbbj4DPauKuFH
 WqHValy0UUw==
X-Received: by 2002:a17:90a:2ce6:b0:30e:e9f1:8447 with SMTP id
 98e67ed59e1d1-3134ce5bb54mr33645a91.4.1749156818423; 
 Thu, 05 Jun 2025 13:53:38 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b043d5bsm96118a91.6.2025.06.05.13.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 13:53:38 -0700 (PDT)
Message-ID: <fcbf5124-8b33-41d3-952f-ea35225abd10@linaro.org>
Date: Thu, 5 Jun 2025 13:53:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] system: Forbid alloca()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HVNlJCPW8kGj

On 6/5/25 12:35 PM, Philippe Mathieu-Daudé wrote:
> Eradicate alloca() uses on system code, then enable
> -Walloca to prevent new ones to creep back in.
> 
> Philippe Mathieu-Daudé (4):
>    hw/gpio/pca9552: Avoid using g_newa()
>    backends/tpmL Avoid using g_alloca()
>    tests/unit/test-char: Avoid using g_alloca()
>    buildsys: Prohibit alloca() use on system code
> 
>   meson.build                 | 4 ++++
>   backends/tpm/tpm_emulator.c | 4 ++--
>   hw/gpio/pca9552.c           | 2 +-
>   tests/unit/test-char.c      | 3 +--
>   4 files changed, 8 insertions(+), 5 deletions(-)
> 

Good idea!

For the series:
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

