Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCDCAC5B5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 21:14:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1tI8-0001qd-Om; Thu, 25 Sep 2025 17:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v1tI1-0001px-2s
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 17:14:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v1tHs-00057k-Cn
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 17:14:08 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b54a74f9150so1303883a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758834834; x=1759439634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M36z01tvDiO4eiSV5/XCyURuP7Abakr3KCAND8fEuqc=;
 b=c6d0zegqBR8E80C3rX8GcrBzphy77pc73/kP697IKAL1+MBd9lJfCx38dCpzjIEfsM
 VXXMb8mtJTxhmon6UdBJKr2N0bXLqSR5QMvV07Th6Bkngc3Q9nN4cE41IkP3VA7D5OFh
 7Sw/sF7NhRr9o11yOXeBRCI+udN1ZR3WUw7tqHjr/gQa3zqJxdAt+WshU5GyzKo+ir53
 ezCJsWbNRVkLUZcry5p7C632gt+v6PVvHBe1BVxSvK3+eiaYaD2VuSK3GSmdMVQgVfx7
 pqVvxwzUkrqSpeLRaC2sVgknZokCwpR4/bE2TyHpRXPcC9r69uVyzOTX7S5Rjv74r0Vs
 ih6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758834834; x=1759439634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M36z01tvDiO4eiSV5/XCyURuP7Abakr3KCAND8fEuqc=;
 b=ha9ost4xTi89zcqmtJx00ZVu1G1t3/OJrS9ssS1oz+VvPduc611RhUhFY15NyzH1NY
 +bqI/P2xBj6l6TXB7Pca25508u0sbrUgmw7OTUa5TOKCvGaxbManEanhpN91omb1xocG
 1XdebKSnlez6mIt1y6RLfkkH7aZqdtlLT7LzJq+S7tNAyk5C0aV9h7kGRTsGMxQYkdKg
 Jd0/TtgkaWCayBmVKP6ZWrMjM3Py1e490G6Hg99sd79E/MQ6d73mMjFdK2+Er2n6Wh0x
 bcim7Ik4WRkluaF491FufVHyuS2AmNrGNtrrMw1rqbRYkp8YiLwSwO1P+DjP+9v5ihi0
 a6sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXINHP07LGqBXNd894o+VvjMmp1YWAwT6xEAZl/hEt3KU5G7HFdeNvlsyXb+HElcpqML521H2yp/w==@nongnu.org
X-Gm-Message-State: AOJu0YzwfZEhXVRp/LkU0Ua0trmlLpQ/30qJGmtExm+nYrL8fz0LH5IG
 EggU+RhHSuBSsB7czUHv0tw1CVSToKoEn++6quuccop5exUYDO0f0E6a3SWYkPA6CLc=
X-Gm-Gg: ASbGncv52HuwYxS/r++06iO7z6UwfBsWWocLi8xf9B1b+dfFdM60Y7G2+73+e8Z/NaT
 3dtDTCVl6iCvRAcPlyVjnb743ucEM4ZKR7+bzbJAC5gubJBN4VoDxO23gBsZbfDQ7qyEf9LadX4
 BaWzV/rvWUMka8ZOtOv2AQ3buKgnQ1hDS9A+sjruxaswmg4q6SEIxvF7kQPa8mnNCVbEsCBfYto
 eo6byum7uKL+XJS2IbbDbxA83QcUongnPc16Q9ItCXoP0/yLRCCUQrkap/wtQJ5VKltbk2Cqmp8
 Y2QzVkHgkGHiJHovNyTEdCBZ7XaZ9rWLBhkcoBN8BDYEkPmuLciwXyG7ubNIB/7eQzB5p6RnMSv
 Qz93uJ4yWg2N85ZM4Lc/YDdThDQyhJtkiHCzUhxUcMnT4uw==
X-Google-Smtp-Source: AGHT+IFdocDfmpuv4fKGNgjO538vG9UCiJrrTAHsBuZfc0IMQ4mVCbhdpzA0ZBBVLALxIbN4Kx5AAg==
X-Received: by 2002:a17:902:cccf:b0:27e:ef96:c153 with SMTP id
 d9443c01a7336-27eef96c3acmr1362405ad.19.1758834834040; 
 Thu, 25 Sep 2025 14:13:54 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d6523sm34133135ad.11.2025.09.25.14.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 14:13:53 -0700 (PDT)
Message-ID: <8e73d8af-6f4f-405c-bed8-a475f051dcf5@linaro.org>
Date: Thu, 25 Sep 2025 14:13:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] semihosting/arm-compat-semi: replace target_ulong
 with vaddr
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
 <20250922093711.2768983-13-alex.bennee@linaro.org>
 <935cfb4b-1990-4ca8-91a2-b9b96b503c42@linaro.org>
 <87ldm6odxw.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87ldm6odxw.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
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

On 9/22/25 5:43 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 22/9/25 11:36, Alex Bennée wrote:
>>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Message-ID: <20250822150058.18692-10-pierrick.bouvier@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    semihosting/arm-compat-semi.c | 22 +++++++++++-----------
>>>    1 file changed, 11 insertions(+), 11 deletions(-)
>>> diff --git a/semihosting/arm-compat-semi.c
>>> b/semihosting/arm-compat-semi.c
>>> index 6725dcf4ba7..29cdab66f73 100644
>>> --- a/semihosting/arm-compat-semi.c
>>> +++ b/semihosting/arm-compat-semi.c
>>> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>>>     */
>>>      typedef struct LayoutInfo {
>>> -    target_ulong rambase;
>>> +    vaddr rambase;
>>
>> This is what the subject describes. Most of the other changes aren't.
> 
> I was going to say vaddr is functionally a uint64_t but we actually made
> it a uintptr_t in February. Shall I update to:
> 
>    semihosting/arm-compat-semi: replace target_ulong
> 
>    Replace with vaddr or uint64_t where appropriate
> 
> ?

Looks good to me, thanks.
Pierrick

