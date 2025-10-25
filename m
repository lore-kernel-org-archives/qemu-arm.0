Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9B3CCF9E9
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 18:30:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCj1V-0008VY-C3; Sat, 25 Oct 2025 14:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCj1T-0008VI-EN
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 14:29:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCj1R-000333-P4
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 14:29:51 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b4aed12cea3so276805466b.1
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761416987; x=1762021787; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8OBbSNq3SKGchaEDkpfJegXyjMzuNGP4MZN82Vq68r8=;
 b=hmwRPsk6tKCLclWLmES96j21vk74kafMkuXLhOwNwQx9grwqcevtJljwJsSF3TBxS+
 fZ8YsYMuR+hVHtn7bX8FB73M+ibXEKAfMa+ErYyhs3vrL72tDYg2fS+e1kQiKrOFwvG/
 1z5cSlxEtj2al4XpZCEb2kBFjbOz8CqHYILhsa+xKZKmahkEs2lrLeQCiUAhKUM1itmZ
 +9dsmniwp0MVlxUHhFqgQaN02EAunOS8eC5nqn8W6UKT0QmcruAG/dE5MaIJ8R+uu+m/
 3S5ELBUWqfo3HGGcTQSieKopNQcLCPXVPzoGaayEEzqsaf2PlNYWYPRz/HJyqg0kqmCl
 P+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761416987; x=1762021787;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8OBbSNq3SKGchaEDkpfJegXyjMzuNGP4MZN82Vq68r8=;
 b=bSUQIS+y307QJrUwXN9cjNaIn2svPiUn5tdtfq34yskqeovAeNUCgugNNtfjOXt0Ho
 YiMC6ufwyhg4OaEHsu/pijLNg+1FkKNTdly9qnwGNc0JUYgt1OUqG7uWtVwKDpMhqz6+
 MBgChclayk9eFlH/3Mckw/3tosDEEEZLdvLOvPNK5MH55lfSpVPZe3AobtaTcYb0nql8
 wV6SB80x8ZmVqzp0ib9Rer2iX2CuXDnPdIo9SY2Sd4ilHdKMJrBnbB/gMJmCWfacPGgY
 8bAv6zprLCT4lJQO8etphEO/uJC7ew7FTVuWQGKMqjkAPPBjWrCH6G69v76P0mPymXG4
 4M5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAgqXWeU7HacGHk5Mx3nvJm9KAOShipHwO7y9C82f9B6GBnaAGZ3I9gZGAePoI2kPfxxXp+0VILA==@nongnu.org
X-Gm-Message-State: AOJu0Yyr1Lcpgjiby4eUbqexAe4fG5r0raG7QtzpAxuny19HCiCWgdD9
 hc+CrMh/VTPtGQlfuWFq04u3XhPVH1lQu7SybWEIgodX/KHUZn8AH1lXySvhNGVAX7A=
X-Gm-Gg: ASbGnctnDc5F2MuZARmBy1aT1g8VMV9fk0q6Ylsy/ceyP8u8prbOnfN7SAQpuHJ5Xqr
 1EsTp57kzESDbEkw2Bo6qtXz7IGBPL1FB8zWgjDLcKWhNCCqeeUmAMLDLGi011AauxdTQ0XBD3l
 yTf5Wg+LZw273p5zwHXvo6JbY2ssvfXLbCLoNa8NciI3laZHmddQz5HdoiqpwdLJr2kxwhLnJ3O
 hdvayhsDLeg70Eu//OjHwR8R1aChTsRYPmeCFwu+7XwuFQTw28FR+hhUtjDCW+JIFAigw97Peki
 8acCGik0Rt+LoHU0899TSlsXt1xAhK707xgImCNzFYSb72NX0XMsyU0It86XO6APvbTOXuWTHRG
 azu8wZs2lAxVofgqoAXwOZgXJALqMdCnsk0LFSMY451Ftj5JYVS0U5aHgmP8rVXv0+2P3jt8fnR
 b+dZBjR+WqZRIs1F6E+vIDfg8sEa5ejlWo/HgqGdzvvpNhXy6xtKM8fC+4s5udK3k=
X-Google-Smtp-Source: AGHT+IFpR8cF2Z5aljTNvU2LjgNbXZCT5+wmhIW5WNKM07PQnBU0lWQV3aXn2OXrvk+hcf1WknRLEg==
X-Received: by 2002:a17:907:3f12:b0:b6d:5718:d42d with SMTP id
 a640c23a62f3a-b6d5718d6c6mr987400366b.50.1761416986692; 
 Sat, 25 Oct 2025 11:29:46 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85308cb0sm265477366b.9.2025.10.25.11.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 11:29:46 -0700 (PDT)
Message-ID: <c8a521bb-8130-4dde-914c-7d96b056994d@linaro.org>
Date: Sat, 25 Oct 2025 20:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 44/58] accel/hvf: Have WFI returns if !cpu_has_work
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023130625.9157-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023130625.9157-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
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

On 10/23/25 15:06, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index cf4746c344a..8c2eac6738f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1749,6 +1749,13 @@ static void hvf_wfi(CPUState *cpu)
>       uint64_t nanos;
>       uint32_t cntfrq;
>   
> +    if (cpu_has_work(cpu)) {
> +        /* Don't bother to go into our "low power state" if
> +         * we would just wake up immediately.
> +         */
> +        return;
> +    }
> +
>       if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
>           /* Interrupt pending, no need to wait */
>           return;

cpu_has_work is a superset of the interrupt test.
The interrupt test should be removed.

r~

