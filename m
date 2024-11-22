Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5671938njc;
        Fri, 22 Nov 2024 12:17:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVw1U6YNkzdtBP0NIjuWlCsH1bFGk6kMhwX52lxwRSaP1psmk7um+zS0OyQkPud/z0kilVQ62RaMyGDMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIDcmM1uHfqSCg0p6NyuWSzxjbwjZToPF879Xg87LTEFmGzpXGkSu+ctmXEXK1jyaGDheE
X-Received: by 2002:a05:6359:7901:b0:1b8:5e16:1a07 with SMTP id e5c5f4694b2df-1ca79733ad9mr448967855d.12.1732306620455;
        Fri, 22 Nov 2024 12:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732306620; cv=none;
        d=google.com; s=arc-20240605;
        b=duYnm4jn2ixlsb9qwk5NoCHozKUOIsxfmQ47YSUaGP3PLHoAsrQ4w/mkJLD9tt3onV
         yNxriOUSTtVyNTcwIYxSaqnv4jzLooQHQ193FRef/f+iu8XgSP/9l4WTcY7211D+6rwg
         odePRmVyjxzsJWZklzPQelDqUTxAnEtostkOYAxp3cY1mjEjALAO8T5e5mK5lFgs/EGc
         VOWW32TUNijzzxHkUjdIWyqsdsyjfeWfCjRHLz3+XTOsDoJhHKrR/POCqRZfyB984kky
         WvI/btZNRLyCyT5hwKg738QWwTZmm26uk3asRMLVAVZwY4PlvCyNXNP6qwH2z/ed4/w1
         yWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bYwjthPz7ZSTjWvT6SOtnqt6VUWOzk4V8pDNWIDKjVU=;
        fh=sPD6ATU0vQkP5BjhQfJNa8DcsITfGY76NZ+VfBCi8jY=;
        b=JU+XsafRGof/lW0tNhAshC5v7JbAoDYwPoPxV4/QagHs4mkWoI2snmYfk5ppIoVz9y
         bfqKhu79my/QvJlxqFvM/Xra/JJpQKARxm71zyjCWAqlJChiqVyYIlXkVDnZwSwfkI3Z
         u7cosA8Wrs71nzmVsTXt9DnNPvpZ4NYxu6lui4P/auI7Ivj9v1Rd4MdEqGTMpUJUFU6R
         lPhYKj8rZK40MEGrNDiCm+0DUcXSznoYiLOw6SWHY2BNBPFlxqBdm6tUWHvXEEtv1o/Z
         d4Z/cYosQ2e9YEntE568ho7q3tRjjhgPVXxY6XkP3Op8FMGn/1dikU8g5n+IZ12Nh51V
         i7Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zErxDJw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85b118934c6si1147302241.171.2024.11.22.12.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 12:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zErxDJw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEa54-0004MF-3L; Fri, 22 Nov 2024 15:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tEa50-0004LV-TY
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 15:16:39 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tEa4z-0003c1-CZ
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 15:16:38 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5ee9ddabf6eso1251122eaf.2
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732306596; x=1732911396; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYwjthPz7ZSTjWvT6SOtnqt6VUWOzk4V8pDNWIDKjVU=;
 b=zErxDJw170wWC4q0m+6n6dk4pCps0VGonm2b/m95m6tbnrC1dBpdei3EMtctiRGKWH
 Pna+5SYcEZQ7H68D5GnpSAITovlHV2+1tL2MAbkN0T4DJICSpgHCo2YZvEfmi3ccwp1Z
 R3pHYslNZNpuzIZUe8zeLOJrRwt+jWo2+qHVW4UIRYpWQfLuIauWJFqyfzg/DmawqMi7
 eapO1KWp0jZsgtR+mVtUmK+pcVK+vcQ2+b7yzCT4rp1w843frIQBHjW2rM9W6asHsMkf
 75oN+E3W6EowLy3ZERDtQjCC8dJHwKJgU4qdHMaXipecZGYsU9yUhqGCmh4wdsIjTt2M
 Kp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732306596; x=1732911396;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYwjthPz7ZSTjWvT6SOtnqt6VUWOzk4V8pDNWIDKjVU=;
 b=Q+ZKZ5ksAX5cpUFDK7yTTNZFL2SBrnTpW3HqvyDUm7xyz/DvqEgVrqzYBEho8RGULP
 y/OGTytxry/Nptzf08HeGdl7xxbzrh+RiZFaf0mMLaY+0MI3U5VMcpJAckpYZ00hr4Z3
 8UmG3Mt7ZD16QVEqsaex2Yl2qrbzdZAhNutJoMRW7Rp1ny6oabl23zZgpQ7xyts6td6A
 55qoIa4Fu0p1P1wJkt+nMiExgjyTMZZ2xgCkcEPxSUfhhmQzSPPpt1uvvdLBzvO5tzPy
 YqzQOBAjG45GY6v+ca+VzRJd1YFUdSljVLMVCIbkXJcEprQJKhTdFeC2eKNyEAjjqvK0
 +j/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhb2XO/nhRIWrbFsoEPCMx/UplCIvUI+B8arEpBjZXm8It9FQPGC1RwnD6VRXsO/EiTNkn6npkzA==@nongnu.org
X-Gm-Message-State: AOJu0Yw3AiCdYIgqH+2J8JbyyU9wuaZCQDpNBMZja99UtFXuIUZNzkz/
 Gn0aryKHYGaTwwADPTETIVd9y5Aw8CpwCxi4C+/8RZyuErmte0HCI8lfrkQfsWM=
X-Gm-Gg: ASbGncsibdBzzQmAuHqj93T9/DhJU5UtjehQ5ciSydRHT6bR5S/4POooy7pJrqvbyvz
 OD1pNe/xVkjRX/ck6bWKQ0vOLnfqh3SIhKCbArQ11O5Il7B92hDh7rntF++ZaD5hBwxVSMXBQbO
 mYElJRHu+Ple8v9n3oRZ90lJPBzJpl4yiSIWYGX80MnyMbqDAvvHhE+nIN3yp1dykhJ+JwN+8za
 Aj8fbjBhug8Td80M6f3honH0VjU7/a7NL6MsoNspyEdyC7kLwBwjHABYOMqXv/9ArJGKDE=
X-Received: by 2002:a05:6820:8c6:b0:5eb:6c26:1ca0 with SMTP id
 006d021491bc7-5f06a911c41mr3723009eaf.1.1732306595926; 
 Fri, 22 Nov 2024 12:16:35 -0800 (PST)
Received: from [192.168.170.227] ([187.210.107.181])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f071fa5201sm280632eaf.25.2024.11.22.12.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 12:16:35 -0800 (PST)
Message-ID: <ab1c101c-67e2-4bfb-a050-94567fca0699@linaro.org>
Date: Fri, 22 Nov 2024 14:16:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/tcg/cpu32.c: swap ATCM and BTCM register names
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20241121171602.3273252-1-mjt@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241121171602.3273252-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
X-TUID: 15n39481++pD

On 11/21/24 11:16, Michael Tokarev wrote:
> According to Cortex-R5 r1p2 manual, register with opcode2=0 is
> BTCM and with opcode2=1 is ATCM, - exactly the opposite from how
> qemu labels them.  Just swap the labels to avoid confusion, -
> both registers are implemented as always-zero.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   target/arm/tcg/cpu32.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 20c2737f17..2a77701f8d 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -574,9 +574,9 @@ static void cortex_a15_initfn(Object *obj)
>   
>   static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
>       /* Dummy the TCM region regs for the moment */
> -    { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
> +    { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
>         .access = PL1_RW, .type = ARM_CP_CONST },
> -    { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
> +    { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
>         .access = PL1_RW, .type = ARM_CP_CONST },
>       { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
>         .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
