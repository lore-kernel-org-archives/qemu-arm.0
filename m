Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610C4FD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMyj-00031R-FQ; Wed, 25 Feb 2026 17:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMyi-000316-8l
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:03:32 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMyg-0007tT-6O
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:03:32 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8249aca0affso113319b3a.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772057009; x=1772661809; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xqkd6Lc+kdkZi2VcQ25y784LC5TK6rSEaXnEvbW+C4M=;
 b=NAi9Xi+0qthgrmn/8HU1AQouydm4IRlOruNka1LV7s4zrXGCDdK72xkf7QG6Oe7WZf
 UDkmA3oT1dQc7/eo/VcUNkND5KIMdZCWdIttSfGjCMM3Sep32tdz33Rmbas4Z0mouqqP
 jofQjQ2tHY5ARfCJXdy7yNDdMCGTNFnKuAXikS24RAAvVsX1GeacQGyqRgmo/2L+08Oc
 jZpPKbzuKAVXL2GqWBcsxckzNVJfwKIU5o/3NEskwk2wmawGqiLCdLwAEPBVo1aljJu/
 lqZZmUah4mi5P/sbRdnesp6QFi43AYxKXvp6IWlDtLbF6ddpm61kXRb6l3XCaqeUUB3Z
 6oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772057009; x=1772661809;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xqkd6Lc+kdkZi2VcQ25y784LC5TK6rSEaXnEvbW+C4M=;
 b=dXDUYfg5+VHqDJBCvJUHYejB5aEW3ePNoTfiZwolDiGHxRhDGSI2is42LuEclEN9kt
 QOHwFduDpGdxrqanr8HRQdI+dGaqVAfR9LmK5qs9UFLtxjHrw7QU23xUI2AOFaPCGzTc
 dMEN+ciSL2jVL2VBZxs27QQ4TTgQnlHUTH+1dOxpZrlm6Dro5X2KPVOUUIpcF0RwMlFT
 5u7xGNQ2EP9NnYlbiew2MjQXemJIJKY1gpYC4O8+V8uD8IMQzgtLP3p7N39dL+APh8D8
 hwvox0+5j4oX/ChIT0xuWbBfdxixMBSNfUUbl0vidj7/CtzBRPIf/ajvKnd0erfNnbKD
 BNBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNlxWL9ccPxlN4/b6JUVYrXoZAB0nRN7nSEBJRqzBy38n1uaSkRLJmwf0ynQgzg/mwOJahS6EcAg==@nongnu.org
X-Gm-Message-State: AOJu0YxP8MO71xMXF3cKI3X9l64qFHce861kH2/OnvcVT+NaZ4isXxNB
 ySTdAnJM+cP0bCIvX9XpWR4iwDEVqs9nkmd23cxtsVkt94otTwBloi6CEfjXCmC1NRk=
X-Gm-Gg: ATEYQzy1c6Wer4DK+rlM6V3Tu8CV+oj8FO1PMbtfwyud3cx1PkdhGr09aoYO+FXUYiU
 W/qIHFlVDmwtedkeHyHwjLL9Igw8CKWEwTkYStcZryc3z8adCuYN9DTJ0OTQqOGwuslhwOMc8s9
 1JXQM6FLn7GkjDcRKBjX1R+D3Rrl83T6RPjSCbra/8oF8pOX6g9nw0hKi4/XqnizJ5NObrkTTHw
 yNDpFFe8uT8diOm92aghQz0oDscONlH9/NlP1CWqs3MpdNlPMfENwven5w3yBpc7YzMkJ3LkK10
 h2PW+unJDn8sii5DqY7VtHXhumSP/GsGzQoeS+LzUzAY82N0DYFqpM2TX7S9UcxGqsrXNFKHlM5
 wooHMoaYObOZBnXGr2h/Wjr54GD98c9XYvu2vDDLJYnAw8MeCpt6y6N9qZnxi7pZfZ/UwZTg880
 BxTrXVDPQ7YuFoTuryGPH/lnpMQRQp3Ed/QHqnsXVOR91C+/keQ9+RG6Sezj83Iv6th4Jl
X-Received: by 2002:a05:6a00:cd6:b0:81f:3c7c:8591 with SMTP id
 d2e1a72fcca58-827338bb132mr1259181b3a.50.1772057008571; 
 Wed, 25 Feb 2026 14:03:28 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739db3e4asm244747b3a.28.2026.02.25.14.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:03:28 -0800 (PST)
Message-ID: <24f82c5a-6e30-41d5-8e8c-de3219b06d42@linaro.org>
Date: Wed, 25 Feb 2026 14:03:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 26/31] hw/arm/smmuv3: Harden security checks in MMIO
 handlers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101842.2996840-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101842.2996840-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 2/21/26 2:18 AM, Tao Tang wrote:
> This patch hardens the security validation within the main MMIO
> dispatcher functions (smmu_read_mmio and smmu_write_mmio).
> 
> First, accesses to the secure register space are now correctly gated by
> whether the SECURE_IMPL feature is enabled in the model. This prevents
> guest software from accessing the secure programming interface when it is
> disabled, though some registers are exempt from this check as per the
> architecture.
> 
> Second, the check for the input stream's security is made more robust.
> It now validates not only the legacy MemTxAttrs.secure bit, but also
> the .space field. This improves compatibility with Arm security space
> handling.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 80 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

