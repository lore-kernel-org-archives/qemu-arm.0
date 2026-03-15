Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF2F30262
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 13:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1llV-0005wn-Uv; Sun, 15 Mar 2026 09:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w1llT-0005vw-VA
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 09:44:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w1llS-0000Au-Ef
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 09:44:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso34334595e9.0
 for <qemu-arm@nongnu.org>; Sun, 15 Mar 2026 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773582255; x=1774187055; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uw6TSFyoxLDSmiJlSd/IKQxj5BBuaxKSp706RK0L3hY=;
 b=Phl9hvMr3QSooYJY/cHtv2ew5webcJ9wZyfMFGpP3h6JWtupFutL1IxtmQqhUoAxUI
 6NmS6SarFiA4en+RvQW3vJVhuiX2u/2M5hwfVMnK3IKn0ImXWt6Z1K6dBxRus6g5MqK0
 X1rmHnHJy4LVL6WdfKESckl6YAX3lmZGzt2H+vVggLLViWiHC6D1g5zLGG1QBagf0E0X
 tAGWWU4/xyFoWJl8nmfJZQ3eKsi3PLzgJcL1tldGXa76twfESxZifQIt5zhY3rdKeZLc
 GgOnTq82oduL5HfddmjyX2zob1MnDxCsP4HqdVQC0bBVhnBeXFX2HdQqIawcg71dsX8h
 ioWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773582255; x=1774187055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uw6TSFyoxLDSmiJlSd/IKQxj5BBuaxKSp706RK0L3hY=;
 b=Ij7Y+TMTtSVLdh1SIVD3b3aLYxsmWN235EH90dfhOAhYaf1nlvu7NVMPROroJVkOFP
 3KNbioAYcHFMDhazPTs6mGYMLyWpDV/FpufwT8wF5gZzvNDDEoURMK7t622Rrmf3C4pw
 KlhadV4HAdaZEuFGQLUhCSsncGiNeeg8PFi/h0rSV3/9+9tgoiBv+PMHVgHHoRVqdapb
 sNlBkPTaIWKdjv+9GHh/rr0dWHrpnjWZCJDpFlRvGaMl9nhLh5TxZ541t1xRl55Sh845
 H1+PEDwI/D5Vcn9WnAOR7Dw/q1+hlwIfnjGBcFBTCOiJoh26SUn+CMIwn1xwpQ3oOXCS
 YJdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX23XF5c0Q6cyEyNr1SNpznVoEX8tKxjx0NuvI/AwpdSIMPUmtqfACVcIkGe1XHyYAysiUpMKys3w==@nongnu.org
X-Gm-Message-State: AOJu0YyB+81IPcX1YKtPbM74lTERkGdvuX9LEDeDsZ+Dv08nLNxFZH9H
 i+iVopou++aB3ACOuWyAHeK2rToFiUfvr6FtNFBrjAXMqzhCZC8lTJIt9pkMPs87vnM=
X-Gm-Gg: ATEYQzwIoJRCW5Aj7dLr1vCzgpqLrlzveM/BkZOt0nm8CfgHxxV/9M0navwf6pI2nrb
 v5ONEIm2S/nOzGE/IMSxsGmX+5gAH5xnv/8h6CbxZ8G559HlxMUFjZwPZcoFNmwONeZqfe7BYY+
 pkK8Nse+gq9OpvL3ZwquS3hwdaGdfqEgDVfuWri19d+3P5+aiM/0gOgbAtbfK3MvK5P9zKb8zQ0
 9wDLkn7v7aJTI/icLqU6nJZ7tNbOIpaEWeWSWzGNBuL5hc+9gytEwzgYSqhQEePOWu6vQVeIY7i
 2H0htr0V+57egdMOHaUZSWth7Aa4PMIRQg7RTCdjeu6R7CxigEeAegFbj0B6qaPLWPdKG8vX8tV
 fHiJiFjHcvcoTZCmRfXddjRjdWE0JCiSLSj9iDIipj8O7oUTK9mdCPmt9OhuvYqTXcBxCuH/bDl
 QiuAts2h3vFQLyXkPoQdRr/wuE8jjEcZn0j9Mx9JPV6rKzcuZmHSPJKtNzf7jgdwafIQ==
X-Received: by 2002:a05:600c:3b07:b0:485:3989:b3e4 with SMTP id
 5b1f17b1804b1-48555ac5e34mr156143115e9.6.1773582254549; 
 Sun, 15 Mar 2026 06:44:14 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3b0e9b99sm11313344f8f.18.2026.03.15.06.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2026 06:44:14 -0700 (PDT)
Message-ID: <4b6823e3-4af6-4434-9982-4c47ef62ab32@linaro.org>
Date: Sun, 15 Mar 2026 14:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] whpx: arm: fix ID_AA64MMFR3_EL1 host feature
 register index
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Osama Abdelkader <osama.abdelkader@gmail.com>
References: <20260314221529.47841-1-mohamed@unpredictable.fr>
 <20260314221529.47841-7-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260314221529.47841-7-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 14/3/26 23:15, Mohamed Mediouni wrote:
> From: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> IdAa64Mmfr3El1 was stored in idregs[ID_AA64MMFR2_EL1_IDX], overwriting
> MMFR2 and leaving MMFR3 never set. Use ID_AA64MMFR3_EL1_IDX so the host
> MMFR3 value is stored in the correct slot.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/whpx/whpx-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
> index 8aa24f2adc..bbf0f6be96 100644
> --- a/target/arm/whpx/whpx-all.c
> +++ b/target/arm/whpx/whpx-all.c
> @@ -684,7 +684,7 @@ static bool whpx_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           { WHvArm64RegisterIdAa64Mmfr0El1, &ahcf->isar.idregs[ID_AA64MMFR0_EL1_IDX] },
>           { WHvArm64RegisterIdAa64Mmfr1El1, &ahcf->isar.idregs[ID_AA64MMFR1_EL1_IDX] },
>           { WHvArm64RegisterIdAa64Mmfr2El1, &ahcf->isar.idregs[ID_AA64MMFR2_EL1_IDX] },
> -        { WHvArm64RegisterIdAa64Mmfr3El1, &ahcf->isar.idregs[ID_AA64MMFR2_EL1_IDX] }
> +        { WHvArm64RegisterIdAa64Mmfr3El1, &ahcf->isar.idregs[ID_AA64MMFR3_EL1_IDX] }
>       };
>   
>       int i;


