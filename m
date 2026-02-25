Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0E7FD45EC
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 20:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvLcE-0005q2-Du; Wed, 25 Feb 2026 15:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLcA-0005kc-Mg
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:36:11 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLc8-0002s3-K4
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:36:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso1251160a91.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772051766; x=1772656566; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QPRFpkE4nb/taQRx4VWIxpVrTUtbjrOmiftYo9/QS4I=;
 b=kNYoKuLUVOter69D0Q0CJb3zK4SczBTB59KAsDYf+PVD573ROZFazvbxLw6dVKIqam
 feL+FkzdoULNFZ1NqWiGwmaNdhUSKky+6siTmQ7uhbRqI9Xs4Cbj2IgHwzBPe7D94U0S
 9OQ2yJuw0jMAwK0TTiTjyuui8s+UxVP7k3eph239hGAUYTn3wagiwxh9BqBUgcIgBVEv
 2oQvfXH0cyK31mr4JSlcAX9SS4HAAhZ1JYoVUZU090K1kkCr4gS1fpNQ+hxCxxWpBdkr
 VsJpxZrR8tTvtwQPJL0sTrP4pV5juVnTiUJN63qcowzns9h4y8KrPYXlwVb9xxwyh2U+
 ty4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772051766; x=1772656566;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPRFpkE4nb/taQRx4VWIxpVrTUtbjrOmiftYo9/QS4I=;
 b=AJSG1GiWLSJb9VOjgyyyqCGeSh/tmklRiMvguBEJVvEyUmv/xnI4zqgERNR4jEHqAJ
 /sGsPXjrbcNw4zhyQcv9o9R3KAfFdUwz9ujPc9OeDIlhM/J06QfRSgp0514rHZUKsCoJ
 EltxrTDsdxDAfefhNfi9GZ2zkG4roS8Kgc6Rc9pYKlfQYgFxe70SQMhNUJLshP2kVEFz
 P/PfpztUzjqzoc60g8ARBO7IaTz4Ho/Lotk6kcwkwlr/felbAVnTuvLXiilqRsyPMxXX
 f6FtyER0XpUitt96NJxWg0y1G/kyZZh39usL5zsjSpTOPXIBwFSihw22MF8RCtGGQEEu
 r25Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+jV391ocyYGSdjvgRmhx8Q5XFckWx6mwckdkmUNKKjMx0mb2R6NT/bD3wJSBRoQWyiG7iC9udFg==@nongnu.org
X-Gm-Message-State: AOJu0Yx/IXxg6vVfvBvn1SkxZfjiGzV8XoJffeI3X7W2HNDDzT8KfY5E
 SozwOwQr31KKRFNw6WERtZnCobSDD1drkIRdmcgppvNhPlXocrtvhjb9L9LvhLWAtJc=
X-Gm-Gg: ATEYQzzFHk7uSTf2P4WdPku95cglnNGeU03IWuKA5b+zGDq4MK7YmCIgjid/qymgkBW
 Z4uUjIH6pv8s+MxDQ8q5pg5OiiutcjOzrFZt7hSG2+T91bGxrjljbq89YCDblCPB5uwEVhqUF9F
 VPs+1azZdjmHfJy1M0p/oWFCsyt0ueybEC0n7lXHXoL3Mtqdfg0fB99VLWdGVj45WcN+NLYp79O
 +Iw0yjjidIPJyMnkwgJAGw7bL0S60pHHXxE3I9Qxef5NDneOLwjCD/KIrwPLmcoG1BmNdc22FrG
 tQA8Na482e3kYD0TzKCvdDdsSElcfipNSlL1pUYc1Tebv+RrA0wyHOeh2+4vPxf6DOZLdN7Ueuv
 NcuaYGR/8775LOqDyo/JJ54AmXukv4WVM+pYrjqUaJ6mSvp3fhDv5J6nqxsS8AvRGzezzT72RZ/
 KB5uClX3wj4NSWoq9hpW+jFC2TjzCiBWuf9xOjuzgCF9f6r4h7eCTax+PzWZzg6BEvzq2a
X-Received: by 2002:a17:90b:3a8e:b0:352:f72f:25f0 with SMTP id
 98e67ed59e1d1-358ae801efbmr12669584a91.13.1772051765943; 
 Wed, 25 Feb 2026 12:36:05 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3591342f19fsm1294025a91.10.2026.02.25.12.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 12:36:05 -0800 (PST)
Message-ID: <8d9eac8b-27ac-4c6f-adc9-b76ab72a82bd@linaro.org>
Date: Wed, 25 Feb 2026 12:36:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 07/31] hw/arm/smmu-common: Add security-aware address
 space selector
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
 <20260221100250.2976287-8-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221100250.2976287-8-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102f.google.com
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

On 2/21/26 2:02 AM, Tao Tang wrote:
> Introduce SMMU_SEC_SID_S to represent SEC_SID == 1, meaning Secure. And
> then provide smmu_get_address_space, a SMMU instance-based address space
> selector. The helper now returns the per-device memory/secure-memory
> AddressSpace and reports missing spaces.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmu-common.c         | 17 +++++++++++++++++
>   include/hw/arm/smmu-common.h |  3 +++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 58c4452b1f5..3baba2a4c8e 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,23 @@
>   #include "hw/arm/smmu-common.h"
>   #include "smmu-internal.h"
>   
> +AddressSpace *smmu_get_address_space(SMMUState *s, SMMUSecSID sec_sid)
> +{
> +    switch (sec_sid) {
> +    case SMMU_SEC_SID_NS:
> +        return &s->memory_as;
> +    case SMMU_SEC_SID_S:
> +        if (!s->secure_memory || s->secure_memory_as.root == NULL) {
> +            warn_report("Secure address space requested but not available");
> +            return NULL;
> +        }

Thinking about this one, I don't see any case where we would like to 
silently return here.

Instead, could we check that directly in smmuv3_realize?
If arm-smmuv3.secure-impl is enabled, then we should have
s->secure_memory set accordingly.

As well, we can decide to enable secure-impl by default if secure-memory 
is available. This way, it should do the right thing out of the box, and 
assert with a good message if the machine configuration lacks something.
And user is still free to deactivate it with -global 
arm-smmuv3.secure-impl=off if there is any reason to do so.

Do you see any reason to not enable secure-impl by default if 
secure-memory is available?

Regards,
Pierrick

