Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34074C87FC9
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 11:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugLln-00028t-L7; Mon, 28 Jul 2025 07:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugL9S-00050w-4S
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:32:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugL9Q-0004iK-9i
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:32:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so1891728f8f.3
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 03:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753698730; x=1754303530; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zNfBnoi62kaYyO5hPE3uI46lOaJgi9i5zVlwBR0mtsY=;
 b=KzKDtUsnCgY5x9Cnv3REnSjj10VYSUCNdwGQs48KiGQBTtrxpxwnvAuTNtuj5bOQpe
 +dnhzF84n8hpRRCaVC6/8WL8y34n8NRM71uZnr8M1fQrmpiRQMZE7ZJDzWrf2vDdnSgq
 ipqfHnRxoSGrtMLJRd+jtKpPNHmWofC0bPBItHMAKvHwtoiRhjdATmB78BBzJk0LGcoK
 Z5PPV/JzNLDD9Cp6DD9647/i3QYvrNYOuWHLeYiiEsI1k/tTbMLdynxPg4kQOmjtPkFc
 KT2VZ19oFqpGzCJtG3MMP+sy1iJj+If8z/pjt/J58TlJtxfmbvJkuk199zpcApT6/wSt
 ioPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753698730; x=1754303530;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zNfBnoi62kaYyO5hPE3uI46lOaJgi9i5zVlwBR0mtsY=;
 b=iKxJn53DFWTcDL9vb5ZgOaB7zzXzlaKDbIUSF45UDpQ3uPjJ7GSrRcPyMtqMQkrMTK
 nFbZmLtfw8rKdXPeE6UJ6ou5xpasav4pgwroODs0hB+ThnZa0ugsNkCzvJckS8KITHKi
 tHyytaV6mI4TJ3T15PWr+7QoAJ2mSAeCy6b5L+hGwtPFvJdIn9SLUEI4Av7WsihO//7Z
 VhWQ0cO7PkeWDk0xIT8RUABfpojKNHiXXGaFPwKJLhxzGD566qwUKAHntUf+M82Qgem5
 J69UtDOT6HmaCZXtXAPHZACxgANLr+sbGH1eZxFqGLtcKy54sKwoS15grBvsw7HQCUjE
 77mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbGMyW8g8DR+Q+gGl+O2E34ZLYojjeJOdeHMpOtbaTDSJSOfiOm/n4H0S7xpEfOEmrDzs12xt5Mw==@nongnu.org
X-Gm-Message-State: AOJu0YyF9L/a8dyD1SBXNOmr2C7wcdISRWASAzKF63ZOD4XxDU+3Yzbi
 aiEluKDVkaoeS8yNvIODW3PrvrfEmUnwYtsXe8KWWuRjvs3hmaXpVR3TIrJXDNhCBJY=
X-Gm-Gg: ASbGnct6kUfMFNU0HdH/pRP8AtSrGtNUhiUrWewLDfUxgfuAHXvmf1j891jLqU05d0n
 EXXEOd9l/oxAq3QcNvYis41CQ/j4NzzhEQaAhfzpUMzGvn84ycbtRW+sT7BvHUchPwFCXhEO8A/
 OD90tQMLYY8Gz/XqboqXnK0VSsuORGoaRQfuS+BVw9FaC2cjVDUZr5yRBCyU8VsYnGTiPP2jgJE
 7rTGqO1I6XYmaFN7x6RbuXYvmdjkViNEMorUO0c+wzSSG8pBxdkgIKmY8s1gwZNGiAHcA89ooYv
 lGot6Me0m0Ja7d+5nO2eMlKTE7MwJXZcF6c5RFZD7C5KMcp7D9T1ButmxnUzzymJq1P2a/K5vRk
 tw2QyfefuhPSZCiFWAtn5pLC8cpd2p2hLMv3bjNTQ5DY/idyeV9yDKTO1/pRSYe0BpW1mMpGd8G
 S8
X-Google-Smtp-Source: AGHT+IH1zPme82881Nslgj9AGNL80+yMWrgklG1aoT2ZEo/BjaYio8/WLKNg2HZLI0vi7JFFWnpeiQ==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f661:c3e0 with SMTP id
 ffacd0b85a97d-3b776775cbfmr8451849f8f.45.1753698729966; 
 Mon, 28 Jul 2025 03:32:09 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587abeaa74sm96117225e9.12.2025.07.28.03.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:32:09 -0700 (PDT)
Message-ID: <11b7158d-7387-44eb-8400-ae1786a5440b@linaro.org>
Date: Mon, 28 Jul 2025 12:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] hw/arm, target/arm: nested virtualisation on HVF
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250725223035.52284-1-mohamed@unpredictable.fr>
 <20250725223035.52284-6-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250725223035.52284-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 26/7/25 00:30, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c         |  9 ++++++---
>   target/arm/hvf-stub.c | 15 +++++++++++++++
>   target/arm/hvf/hvf.c  | 35 +++++++++++++++++++++++++++++++++++
>   target/arm/hvf_arm.h  |  3 +++
>   4 files changed, 59 insertions(+), 3 deletions(-)


> @@ -1146,6 +1177,10 @@ static bool hvf_handle_psci_call(CPUState *cpu)
>       int target_el = 1;
>       int32_t ret = 0;
>   
> +    if (hvf_arm_el2_enabled()) {
> +        target_el = 2;

Maybe better to pass target_el as argument to hvf_handle_psci_call?

> +    }
> +
>       trace_hvf_psci_call(param[0], param[1], param[2], param[3],
>                           arm_cpu_mp_affinity(arm_cpu));

