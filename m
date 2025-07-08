Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B933C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGUd-0007uW-QM; Tue, 08 Jul 2025 18:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZG3A-0005r7-3G
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:40:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZG36-0001pG-Fw
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:40:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso41825125e9.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752010822; x=1752615622; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NE1g17E9YC3UHa3heKyQtfZN4XmKjoBnDc9PehZElqo=;
 b=UlcY360GiOeYCZbACxsVDYU3shO2OOHPIOu3fpwQDIRruRDSYgRFLISeW7qR0htjoQ
 dage+2H842zkZh/j8mpfzRg6yGVnSnQSjOd/B5/cO60/kL/RjS91ybUBw97dfMw+EcdV
 sglzIHx2HZbzXP9hAWyFlrzakW/5FN6MIbftONT6gwIAGQKwNZ4AzSg3eey12bo28/rJ
 Axu1c2r3WLZn6h0cSCtfV8CxoZmdY9Ga6YMX7QFlHD+FMRUD1jgK6ojdTEXCoRAwz7/V
 RAkBcWCicE981ZCNOzDMPYh/sKRv7kIqwLtmQ7GLTL2UiMv61ybG/kqL76Id0WRoNIGi
 EnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752010822; x=1752615622;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NE1g17E9YC3UHa3heKyQtfZN4XmKjoBnDc9PehZElqo=;
 b=v3TrtI3iCQ2f5qfYrJd0O0nA6QFLcCGkZ+oxkFJf/+Z2FWKl3y8vJXyuhEzvaXk8e9
 NScJRzkXdjGEtXvmckHLBs2U7EHjdklZPJ2wo/ZgkLvnwy0GP1H3gxyP+dynqIbZXrec
 JiHYBAE9Gu4dSWfniQb2YiFrRo8YzcwuDYzPahrYy4pAcl4o8VeC/pHiQ08RONDTzG5/
 JAHiRSaKPCs5p5faKZdjdj055ri5Fgb12pGgiQHSZ+ZxpkKoUi7ZxFTUCQ8sBTyGeGqq
 SQPmGh3Dz2/y14iZZCbsMr7tU/iI6ibwoMNQsVUWSzbgGMbrJIQ3+BP05XdDXkeP93QF
 uCRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkyDwAQPHgjQZcYsTimtXzuG7yV58abOw+eh2d9h10O2NUwv3aTf1R4cL2VpeBQjtep0GUDdCZng==@nongnu.org
X-Gm-Message-State: AOJu0YwXPk7Rm2UxeqgitaB73kFhwZHh/Aisouas+8PV4yoQ06KuaJQu
 e6FpIAdR+neOI/MKH7gZUTd0/hZ4G+YQzIdg96h3fi2ghfD0Ui+FB9/ryfuP+Xe4Qvs=
X-Gm-Gg: ASbGnct86OBbUPs9J8IyIF8l7XpkAp498AyFORsw+UmB/NbfxUUCUruuWn1KSZdT1cY
 o7g0JRCBT59JuRBNa01obCrz4XU4nLLlfynCIu1TpPEAUMWH5X+wmAFJXwvkpU4NgonCMmQivnp
 Sob9Damv9QOGsO8PUeBLKK2AEqYk75O0sh4VJkJp+iCviAsy/xO0R9eWe8Joi58wa9Q2znAX+Mg
 6WtcEvLjP1U1yfoxXzJcLybELhpe3n2k1wGNkCclJzGuIwc72qUd9ms39FllcG8azKepkXrU8rs
 kT5Rd/r4wOkc/Ox5tQb3W8ZewOyTEAglYiCQjEg03GMVdf/3H1xx2YDHX5750X3BZZEBVR5sdTy
 zOftTjHJHFZD3UPWq7g4avNskPmSzTA==
X-Google-Smtp-Source: AGHT+IF4SnLjcSiq830vUVGwieznhaKb0CrYqzME5AE8hIcCmZPv2K8AGJ/+aVjK5TMzOLkQvU7HTg==
X-Received: by 2002:a05:600c:4686:b0:442:f12f:bd9f with SMTP id
 5b1f17b1804b1-454b4eb82f0mr177855785e9.27.1752010821825; 
 Tue, 08 Jul 2025 14:40:21 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50702bdsm469155e9.25.2025.07.08.14.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 14:40:21 -0700 (PDT)
Message-ID: <03714f7e-d63a-4566-8708-07433e3daf29@linaro.org>
Date: Tue, 8 Jul 2025 23:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-6-philmd@linaro.org>
 <d52695e3-0d52-48ff-8402-c9b9fd892cc7@linaro.org>
 <96c87227-2389-4d51-8f26-b2c4a446bd67@linaro.org>
Content-Language: en-US
In-Reply-To: <96c87227-2389-4d51-8f26-b2c4a446bd67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 8/7/25 22:51, Philippe Mathieu-Daudé wrote:
> On 8/7/25 19:39, Richard Henderson wrote:
>> On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
>>> -/**
>>> - * target_big_endian:
>>> - * Returns true if the (default) endianness of the target is big 
>>> endian,
>>> - * false otherwise. Common code should normally never need to know 
>>> about the
>>> - * endianness of the target, so please do *not* use this function 
>>> unless you
>>> - * know very well what you are doing!
>>> - */
>> ...
>>> +/**
>>> + * target_big_endian:
>>> + *
>>> + * Returns: %true if the (default) endianness of the target is big 
>>> endian,
>>> + *          %false otherwise.
>>> + */
>>> +bool target_big_endian(void);
>>
>> Perhaps retain the warning about not using this unless necessary.
> 
> This is what I did in a previous version, but Thomas (or Pierrick?)
> said something about this method now being safe, so the comment
> obsolete.

Bah I'm mixing various conversations, what Pierrick said
is different:
https://lore.kernel.org/qemu-devel/1227db2b-cfa9-4877-b42c-edd2a9e98d25@linaro.org/

> I told Pierrick this method doesn't make sense to me in a
> heterogeneous context, he said to not make change with the
> current behavior, when run on a vCPU we'll eventually infer
> via TargetInfo on the vCPU TLS area, and otherwise (I/O
> thread) this method shouldn't be called so we should abort.
> Such change LGTM. I can start updating the documentation
> mentioning "the (default) endianness of the current vCPU."
> Currently on I/O thread this is the endianness of the binary.
> 
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>>
>> r~
> 


