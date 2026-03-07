Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7702EF55102
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 17:45:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyvi0-0003tm-GB; Sat, 07 Mar 2026 12:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyvhz-0003tQ-5E
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 12:44:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyvhx-00016c-Gb
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 12:44:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so2912412f8f.0
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 09:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772905495; x=1773510295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFsxOl6zIWrNsamLDFr3F2cFhvCsYX3I0jV0QKwgKQ0=;
 b=XbGU6ayBQQR3+u1da61eh+/Oq1vkHmJ1Me+kiZol9nD5tgDEIXKWxuB08+uby2bZAb
 zroieJXPN6txo2xc+7tsOBacJ4x0xpSJdjXSEXqDvraNxIYqR9ZV0w31LYMvvTqFi9oR
 fJoCaqnZOMcRVv/3B9fI7oBvO2CD92zExI5fhmEpT3HzAWiEDoZ0vF5LbYnkMh2Qz/Id
 6tj20IbBvtWfMU0hlCbXcI9siZYVMwMaD6H96I365WqpSFsFFW7uMiJ0W+IfOZClKQGc
 gnpwRVmy1NPPNayWAF7Wr1h2NX5O86itUdsRciZFxgwHkxGzrF5tStW4KHuVQIwk7q0S
 OLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772905495; x=1773510295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFsxOl6zIWrNsamLDFr3F2cFhvCsYX3I0jV0QKwgKQ0=;
 b=mFV0lPLagftKOVhaaVNsDKk97KLcoTEcaKsIUrihi+H6McAimdQWMCC1BNSaNcSEAR
 uTVxIM/6szmtyax6DghCOrBXwWlS9p7nRVHRXRPsBHD1wTQNh96WKnkJekRiNreS8tC8
 EvCS020IU3a18NBMHfr3fc+hLBUziKEThBYfr4jAw3t8qp/1+1WZKjwUPo+qDH5HSssa
 DjJ4UuI9UYY5RKfd7bgVlRtALOGOgjhvSxoaNJ4NMPInzwOfE0uwsX/nxwAujuvw2o6d
 DNfP5Cm+PZIN46TEeFbWiwjMcpr7eyka0THJzKXdAkwYKzKeNJxypKTg3fvIq/+vo7+B
 zmgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIdPXbiuAJdiJEGmgBuB+lM98+U53sMEp92//nB8kcmOi5+Epb6AwPqXPk2l1kYalSeKpEAvuL8A==@nongnu.org
X-Gm-Message-State: AOJu0Yx9ndI7g+KynAHGj3eG8Hxk7kR77Qh5lNq3F/FVt7ZOxL11qlR1
 zATx44lDw9O74ZAXsU4809YlE9qnd2B439xqjCEqCYr9SI6lHpu/sri9MhkARjEEhQM=
X-Gm-Gg: ATEYQzyY5Pg89iC0mtxX2kdz4o2XKqaOSpT9DGGb+Y+Qr+iwBIJJRIGeVoSGwWlYBs+
 xJ6RfFCPzLO9U9KEwiFcIY/Nv34VWel0BmNPHsH70rL0rHZywsTjfAGIbTelPBPHhUYu4E8pq7O
 M6/2PX2gGdA4j2ldjfkY2zI4/PH8Vp4Ya1XmHZfPW0yNMqDMwqZso1OJ1MgoZyvsFb1+F+xZl1q
 1GuACuYfDlwWwKB7MSIozwGIL4SZbjB4IqINJqdKYv6zgGraydaEJS5FEFeGBjKFSo+/teWAU48
 LcwgiSOUjCWC31D4l0JunB7N0j7oqX7KIqnq/Qh2Ms58WMcABR1aTzyKzZhjEG3L1xibXyJyOLN
 izU9wEgU8E1VDx/mpufcKCdBRkJXRiDJAFpgpHZMbBzGvG0ZeHe8Uwykcy19F9oGniUAdudc4D7
 p+cApMvmLs0aXujqNf0NcM+VP8T8OodvY53nrGNakjHi4pgJt/G86tq3R2IAv52nvA/T9mCFLJd
 yy6
X-Received: by 2002:a05:600c:870e:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-48526951415mr107613225e9.19.1772905495062; 
 Sat, 07 Mar 2026 09:44:55 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853044d849sm75773485e9.11.2026.03.07.09.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 09:44:54 -0800 (PST)
Message-ID: <eb4166f0-41c2-4493-9a8b-24e1889dbf05@linaro.org>
Date: Sat, 7 Mar 2026 18:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 05/13] hw/arm, target/arm: nested virtualisation on HVF
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
References: <20260307153143.76893-1-mohamed@unpredictable.fr>
 <20260307153143.76893-6-mohamed@unpredictable.fr>
 <d2bd5f90-a0f7-490e-b735-43442f41c679@linaro.org>
 <E8185464-F6BB-4A50-BE57-EFB2A7F777F1@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <E8185464-F6BB-4A50-BE57-EFB2A7F777F1@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 7/3/26 17:21, Mohamed Mediouni wrote:
> 
> 
>> On 7. Mar 2026, at 16:48, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 7/3/26 16:31, Mohamed Mediouni wrote:
>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>> ---
>>>   accel/hvf/hvf-all.c    |  1 +
>>>   accel/stubs/hvf-stub.c |  1 +
>>>   hw/arm/virt.c          |  5 +++++
>>>   include/system/hvf.h   |  5 +++++
>>>   target/arm/hvf/hvf.c   | 42 ++++++++++++++++++++++++++++++++++++++++--
>>>   5 files changed, 52 insertions(+), 2 deletions(-)
>>
>>
>>> diff --git a/include/system/hvf.h b/include/system/hvf.h
>>> index dc8da85979..0f0632f7ae 100644
>>> --- a/include/system/hvf.h
>>> +++ b/include/system/hvf.h
>>> @@ -28,9 +28,14 @@ extern bool hvf_allowed;
>>>   #define hvf_enabled() (hvf_allowed)
>>>   extern bool hvf_kernel_irqchip;
>>>   #define hvf_irqchip_in_kernel()  (hvf_kernel_irqchip)
>>> +extern bool hvf_nested_virt;
>>> +#define hvf_nested_virt_enabled()  (hvf_nested_virt)
>>> +#define hvf_nested_virt_enable(enable) hvf_nested_virt = enable
>>
>> Unsafe macro. Better expose the method and add a stub.
>>
> Does this look saner? If so can send a rev with it…

LGTM!

> 
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index 1c1437b467..66c3b48608 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -26,6 +26,10 @@ bool hvf_allowed;
>   bool hvf_kernel_irqchip;
>   bool hvf_nested_virt;
>   
> +void hvf_nested_virt_enable(bool nested_virt) {
> +    hvf_nested_virt = nested_virt;
> +}
> +
>   const char *hvf_return_string(hv_return_t ret)
>   {
>       switch (ret) {
> diff --git a/accel/stubs/hvf-stub.c b/accel/stubs/hvf-stub.c
> index cec1cbb056..dc365c5307 100644
> --- a/accel/stubs/hvf-stub.c
> +++ b/accel/stubs/hvf-stub.c
> @@ -12,3 +12,12 @@
>   bool hvf_allowed;
>   bool hvf_kernel_irqchip;
>   bool hvf_nested_virt;
> +
> +void hvf_nested_virt_enable(bool nested_virt) {
> +    /*
> +     * This is called unconditionally from hw/arm/virt.c
> +     * because we don't know if HVF is going to be used
> +     * as that step of initialisation happens later.
> +     * As such, do nothing here instead of marking as unreachable.
> +     */
> +}
> diff --git a/include/system/hvf.h b/include/system/hvf.h
> index 0f0632f7ae..a961df8b95 100644
> --- a/include/system/hvf.h
> +++ b/include/system/hvf.h
> @@ -30,14 +30,14 @@ extern bool hvf_kernel_irqchip;
>   #define hvf_irqchip_in_kernel()  (hvf_kernel_irqchip)
>   extern bool hvf_nested_virt;
>   #define hvf_nested_virt_enabled()  (hvf_nested_virt)
> -#define hvf_nested_virt_enable(enable) hvf_nested_virt = enable
>   #else /* !CONFIG_HVF_IS_POSSIBLE */
>   #define hvf_enabled() 0
>   #define hvf_irqchip_in_kernel() 0
>   #define hvf_nested_virt_enabled() 0
> -#define hvf_nested_virt_enable(enable) 0
>   #endif /* !CONFIG_HVF_IS_POSSIBLE */
>   
> +void hvf_nested_virt_enable(bool nested_virt);
> +
>   #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
>   
>   typedef struct HVFState HVFState;
> 
>>>   #else /* !CONFIG_HVF_IS_POSSIBLE */
>>>   #define hvf_enabled() 0
>>>   #define hvf_irqchip_in_kernel() 0
>>> +#define hvf_nested_virt_enabled() 0
>>> +#define hvf_nested_virt_enable(enable) 0
>>>   #endif /* !CONFIG_HVF_IS_POSSIBLE */
>>
>>
> 


