Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80636C87FDB
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulQ0I-0000yM-Rc; Mon, 11 Aug 2025 06:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulQ0F-0000xg-Vm
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:43:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulQ09-00052F-Se
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:43:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so2235695e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754909015; x=1755513815; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jfrrc7H7hZ2+obci5h5j3ABYnou1j9TfJEJZPevGjx4=;
 b=GSm2y4z260I87IEw1QtmcGHFd6t9dQKYAHQ2L/1c8ElKPa/0qUe/siDc+9flKNTdFG
 lGvJpNp5OvtJTfkeoEJezjJeU3BZuje+mD/2TZE3nui5mYfCHbWgtO/LlD2yJf7c8XS6
 bWgA7d7/sPm2aV1gcoNht2lagrAgW4xs4GP9xp4XKr12WC6Uhp3k/Y9q80HIMNAwe4mn
 vZFAd4zzkOnD+5pKmxCMM/OHAHkTo0V5g147nkxED4ryDhtv+g62z/YLNxkqp5+FfLzz
 e8P5kaYEFNrbexrLxE/x9P89bHFwdZsudN10vozRvn2mZljo5UZeEIr7BVjxzuVHJK+G
 5ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909015; x=1755513815;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfrrc7H7hZ2+obci5h5j3ABYnou1j9TfJEJZPevGjx4=;
 b=D6B7ZXuM2OPrRMyItPVv8O/agV9HcQzU/wMK2wAYacADpwNpjtjq6HQrh0UX+LWNpZ
 JQlqKH+7ptLBqyRhzXoL6eG2rA9WGpAFv41pXRn0ogQ2lDvLHwFO2uWXyDlBUP25Hb9Y
 stUUW2AIotTu7YbVDH2emkqxutdvluC6V1dk7Cj0IMC3DqHq+FpDtCkYWo+pZ9tUzyvA
 hF3bsyxAoqhF2x5M0N5koSzBuArbUS0QKsyXvUMRLlgnqRAqoEzVcf9pO32fblEZNAoY
 xLrsJF7gysEmUHoQGZ7yFHPS3h/tETBLdQMOjsEKhyC1eR2Vb2ik2AatO7efq3rEbvWv
 TNNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8/L3lVmKlt6d+A8NVhF3xc/o7coHbOqQd2K7HdFfV6oKlJ1tuCFAhIxGSzqGc91na56e5POF0jw==@nongnu.org
X-Gm-Message-State: AOJu0YzG+UAXRB1VBPhMV7gOxG5EJsGtcvLr+6PSGfAwr3+3oLq1ksTP
 2lAYoir9L6iZUqXDC5ti6l4SV8KK32umM9D44v8OczXzZEiIzWVAJ9Lo8za9ZvhhuaM=
X-Gm-Gg: ASbGncvMWcXqKnw4DOjRuezPe1xLws5H1vG8y2ZZC7XwwwEtw3Fc5uXgmT6xAa99A9P
 BcVMWjwWWvVikcbNwP57vvNV6xc6m9ZJovBOdmQ25EN7+HnC7Hf+cSoAtCKDRNrh+k6Mu1Qd/Xs
 uKJHjUnsOYCVRZ3V0P5nZOaUUZr6OG55QXemuNahEsLdcOvgPaj/qZLMiSMYmWt5Bl5yt6loN3u
 nm6jvtEJQJqDKZdqOWxS8XjX6pDjaR/+08pLXRRzBhLnRl86ghOiSgEuuw0Th4CoQU3UJ0sRRPm
 elWIjaJZHSAA4p22XxhmgS7casMMM5mGtsaT1SDstuadGLezfVPF5iV2opbAWr2BkYrVPWZs7zG
 h2XWU+TuMtmDAqn+4sXQ8mhZ/QPpgsmSr1q0QthDmGxuIMK4DTepoDGDnv/ssfcpkYg==
X-Google-Smtp-Source: AGHT+IH+Vp4QK0Mzumzj5M1Rq3qZbOzWZ1NlBJtPKIZWmtscc8S3zsmngHT9y8ZpcbRCYwWTLAVntA==
X-Received: by 2002:a05:600c:3b8a:b0:456:8eb:a36a with SMTP id
 5b1f17b1804b1-459f4eb5717mr106659475e9.13.1754909014639; 
 Mon, 11 Aug 2025 03:43:34 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458be70c5f7sm374843235e9.26.2025.08.11.03.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:43:33 -0700 (PDT)
Message-ID: <64fd72ef-8405-4406-8a12-607f060033af@linaro.org>
Date: Mon, 11 Aug 2025 12:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/11] hw/arm/smmuv3: Introduce secure registers and commands
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <20250806151134.365755-2-tangtao1634@phytium.com.cn>
 <5a955f10-88bc-4590-9887-ec0f95af3e17@linaro.org>
Content-Language: en-US
In-Reply-To: <5a955f10-88bc-4590-9887-ec0f95af3e17@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 11/8/25 12:22, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 6/8/25 17:11, Tao Tang wrote:
>> The Arm SMMUv3 architecture defines a set of registers and commands for
>> managing secure transactions and context.
>>
>> This patch introduces the definitions for these secure registers and
>> commands within the SMMUv3 device model internal header.
>>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> ---
>>   hw/arm/smmuv3-internal.h | 57 ++++++++++++++++++++++++++++++++++++++++
>>   include/hw/arm/smmuv3.h  | 23 ++++++++++++++++
>>   2 files changed, 80 insertions(+)
> 
> 
>> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
>> index d183a62766..72ad042514 100644
>> --- a/include/hw/arm/smmuv3.h
>> +++ b/include/hw/arm/smmuv3.h
>> @@ -63,6 +63,29 @@ struct SMMUv3State {
>>       qemu_irq     irq[4];
>>       QemuMutex mutex;
>>       char *stage;
>> +
>> +    /* Secure state */
>> +    uint32_t secure_idr[5];
>> +    uint32_t secure_cr[3];
>> +    uint32_t secure_cr0ack;
>> +    uint32_t secure_init;
>> +    uint32_t secure_gbpa;
>> +    uint32_t secure_irq_ctrl;
>> +    uint32_t secure_gerror;
>> +    uint32_t secure_gerrorn;
>> +    uint64_t secure_gerror_irq_cfg0;
>> +    uint32_t secure_gerror_irq_cfg1;
>> +    uint32_t secure_gerror_irq_cfg2;
>> +    uint64_t secure_strtab_base;
>> +    uint32_t secure_strtab_base_cfg;
>> +    uint8_t  secure_sid_split;
>> +    uint32_t secure_features;
>> +
>> +    uint64_t secure_eventq_irq_cfg0;
>> +    uint32_t secure_eventq_irq_cfg1;
>> +    uint32_t secure_eventq_irq_cfg2;
>> +
>> +    SMMUQueue secure_eventq, secure_cmdq;
> 
> Note, we could also add these fields as
> 
>        struct {
>            uint32_t idr[5];
>            ...
> 
>        } secure;
> 
> With some IDEs it allows to only expand which set you are
> interested in when debugging.
> 
> I then since it is mostly the same banked set, I wonder why we
> don't extract the state and bank it:
> 
>        struct {
>            uint32_t idr[5];
>            ...
> 
>        } state[REG_NUM_BANKS];
> 
> I haven't looked at the rest, but this might simplify the
> implementation.
> 
> Then maybe we can use the ARMASIdx enum as index.

After looking at the rest of the series, ARMASIdx seems appropriate.

I'd use:

         struct {
             uint32_t idr[6];
             ...

         } bank[2]; /* ARMASIdx_NS and ARMASIdx_S */

