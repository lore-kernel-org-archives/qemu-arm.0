Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C413CCA474
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yTV-00059S-BF; Wed, 01 Oct 2025 11:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yTC-00051t-Kk
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:10:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRM-000103-1y
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:10:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so3703845e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331297; x=1759936097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIzO+so5KPpKzYj7ZNyXWUr3LlH8ilSE/g0AxNVpzLk=;
 b=frX/pU08FU3nH0HNXJNevCrdIKND5TwEvt4g/ZLwm6F/axJCF8831FIDag2g6BqnTw
 XWc4EbXNoHROVeaCcnFxBsQBGZMU6oomNTHesmXBPY+rAilcJ5JMR1TO+KWkJMHcLkt2
 vV90WZIywuyW1Rpg1EydMjJi2L5w89DJu911O/5bwBU/mT6jRlabNDDdjZ6GMtyKBzlG
 gB9aCNWbVf4TGyL2aaZYir2S1gYgarv1lS7eZs2bd/Plcwr6O8BnPiU+qTcjsK11heC0
 CFpeIlpazO+NCLMjqPKHMjTE7oSG2MWr33/N6HIJIQc9ubKdtU1lnrMGRmru/V2A+gac
 GzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331297; x=1759936097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIzO+so5KPpKzYj7ZNyXWUr3LlH8ilSE/g0AxNVpzLk=;
 b=RIRZTaFG+g0o2r/1A9FRgzN7HzW+bcot/LuX+lBMwJ7pLk3DMd0s6Z9i01WsfSCDXR
 9iSgP2wJ//lCSCbzmpHfWBh/RgjjQevfXUTGEveUXY17FqYYzOEn93nCj6b0XPbL1Tz1
 +rgUvZ/M39Zk884AquGj9RLbWbTMoJgqHyZ4zYqhd+roAlB5+dHJwyrBAkzYGBt0Q8zk
 Csm8C+yEC3oHFp2UHWD54OflUUNkJDYtGt3b0BAgExPjxM+NAsBStORINPMRkAK+5AFI
 Hz3C31Cz45PJFu83beuZm1EGD0HA1g/oAhvR3ZD8Jp5ImMdKK9XnGUA9Fy5EphdttyPp
 8HJg==
X-Gm-Message-State: AOJu0YzMf7vunSXku3V0kZpFdMZA16RbUuAVMH/0oSPCIDWNc4dqn9VR
 xatUUJiYJDSzotXjqbE1heU1K8bgqBOyqV/TpcP1HAZbQUoN0yGigvpjHQ0xug97+GNZjzolQM9
 ZRw/r17bWOQ==
X-Gm-Gg: ASbGnctqLJA6GRL+JMtEwg5oBvBgycZZWrmOn8GdPRnNrdNpwpqJx7kblg/mOkljJrf
 4xOD3Ze4CJJw66kNEDyCG5oHXvwDZgdO2nploZaJGTLt/P2ta25g/WEI8JuCeq6hK6RFi1oX5e1
 /wyatYszxE6YsH+S13IdaLp1p7NZyrZEGBNte4W+gxex8lKd/4Gpp4nNcQFnTXF7xwfasrpKCiI
 cq2zxrxcJH0Q2Akg+lrBuy0LvDHg2qW0kNekMECQt3/nUVShgSeL9ikHXw8f5+39lKf9otMlAwk
 d3TEWCRFWy8EYPfKlXwuvIYtZx181Ls+xCpF7IWXNZXqQ6RmIaaBrbFfq3/TBvdHB+8oQf1gESp
 PMyUaVol8jGtmUK5g6GL+R541+xei1IUdhAfkQ7LkDf8OTCiB8ff2naSfF2pPzmGsZB+rIlsXyc
 TmE+DwdScGs0YeLQ==
X-Google-Smtp-Source: AGHT+IF8lK0vCB6Jq0ASp5XON3vV1O5ddVDMpb/bh1bTP5csPrsFSBh6gHEnoWssD9AA1CELhwJX3Q==
X-Received: by 2002:a05:600c:8414:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-46e612c8a6fmr34590585e9.13.1759331297205; 
 Wed, 01 Oct 2025 08:08:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9768bdesm27674817f8f.23.2025.10.01.08.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 08:08:16 -0700 (PDT)
Message-ID: <755adcfb-95eb-46f4-8c73-34c43e6b85ab@linaro.org>
Date: Wed, 1 Oct 2025 17:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] hw/core/loader: Get cpu first addr space with
 cpu_get_address_space()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Alistair Francis <alistair@alistair23.me>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001150529.14122-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 1/10/25 17:05, Philippe Mathieu-Daudé wrote:
> In order to remove the convenient CPUState::as field, access
> the vcpu first address space using the cpu_get_address_space()
> helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)


> @@ -130,7 +131,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>       }
>   
>       if (s->file) {
> -        AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
> +        AddressSpace *as = cpu_get_address_space(s->cpu, 0);

Oops, I missed the NULL check.

>   
>           if (!s->force_raw) {
>               size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,


