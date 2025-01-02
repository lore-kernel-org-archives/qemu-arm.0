Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9509435njk;
        Thu, 2 Jan 2025 04:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvLdgz7JAPJK+BhMSACcqg8tgN8BYJZoReBcfH5llXQ8gGgz7lXr4k/Qy8rAwonYWNglxneMz8LkqNOA==@linaro.org
X-Google-Smtp-Source: AGHT+IEE7NU2rQu/AZEdrCQ3WjbEld3YaMHimM9dFptebVqx7paSicOVbnJaniovPvFu5xSye1bI
X-Received: by 2002:a05:622a:144c:b0:461:5571:5cc6 with SMTP id d75a77b69052e-46a4a9a3ab6mr730091921cf.46.1735820508552;
        Thu, 02 Jan 2025 04:21:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735820508; cv=none;
        d=google.com; s=arc-20240605;
        b=G6gTsMctmnrFdyzTNA2T6bqdIcB1TUEs5zjkBi6J3cOsW+EMRkYQXzWXa/J2SC7xIG
         Ew1q1XQ6D2bqHwk5T6cDF6QT9bdNpgDilwAOvXfJwIf9DulKWtYKvfA+fJ1Etp1Picgq
         6ZWwEl5lze24+wy8H8yYNpalmfyRwslSuC0/AtdWhEKh/3wR5APts84zVZWbPeP8wzBj
         1BOB6vVUJdyn+hUIIYVoRcNwoueb7gbslGeZ0jL5rIHZpYO4x9zMHSTS66Z51Zg+r7vH
         k5uWoz2XCjH83WxhOdLufqkiyGDUW0jKvr2gL+SguZ9nImXaLpLv/947LK+E5OhaluDC
         fFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=79rPrhcFENBsKK1V6FHTi1G9zXNhcMy+fdCeU+citzw=;
        fh=AbKBg5GeMrB0vSiTefkIvVodQo5E5HfwOnCfBGhsihI=;
        b=JXai8zX2qQPPDxQQMBoCmCUSFxcEKS/l129pkXwXXsOz1cCHTxriv0QMpxhix16HTS
         ViwK1ThxXozcSnde+JnY9paTakyEZzIAK51Dnz0IfFTf7G5v1IsyhUIRvTcVvnsmHAGB
         vp0uQXGZ0F0nL0OrrOXnt4V/Q5Q1AFz9n6YwEOIFJkndhkac5HOiOj5KNZAxCiABujQe
         s/7ycEMcRAFOCv3yjNd1LEZC2j7AhTK0bVKJVIhBas89tES4uVB/mrxZjjkTuxdEg8r3
         BVhZ9s7V/wdG8Oz6477Faussr7HoGfW+zt77l1XzVK8CJQesHifUt25nCW5GrWd1GmRD
         QMpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVgYjTgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb988efsi326886371cf.307.2025.01.02.04.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 04:21:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVgYjTgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTKCI-0001w5-He; Thu, 02 Jan 2025 07:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTKCG-0001uv-Pg
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 07:21:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTKCE-0003wH-Qc
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 07:21:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso72076575e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jan 2025 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735820461; x=1736425261; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=79rPrhcFENBsKK1V6FHTi1G9zXNhcMy+fdCeU+citzw=;
 b=oVgYjTgABl9bx/Di0m5w3Y0PwKjgn7W71OIEMVmbK8us0QjZR/7TxlH3S/a4XZpZRp
 yt0S/yWHm0uhn/jXLhHrTJGjJ2zgEu4ldrV12NR5eOgiX1eP9dWTMFXy5RgPm/UF6NHY
 m4CEFc3qD9UBvoqRZEUL/UnOp145LFDTDs7APFcWbcQT7N7AK1dPz3pfPDPmuKTZj7i+
 rR5UT7yAL3zZ6zlldf7q16+U/evQoprACxSgmjMaPWpZUtp2tOD6OCLiRJezlFqenl/X
 mVpXbJeT5Wo1rBIHqru0GZQV1HkS2yMkw7AHRTHKj8qOlb3duJ7u9kf1thYNMTYgKEts
 yPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735820461; x=1736425261;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=79rPrhcFENBsKK1V6FHTi1G9zXNhcMy+fdCeU+citzw=;
 b=hd1n5oMzixiLJ9XU2DyR3By6cP3Gs5XsUhs/bRX8Bq2eySMTLCnpxf3Mel7M5jynKi
 WQW7ULHqFZZEFLgS/wRAJ5VhRAHsH+4oVMvycatxi3ZImCt0VlX/HA1nHCVwc9SteecW
 EQFyjFN/obfzyYnEU6Kohe8Q0S1G5NLSoR+I0Ae6F0rBnqbNa/SqshdRuAhe9TWdPGqu
 0HaQ0GFVxiDciiY9JR0DVNyYF6tWZWEqfIafqUgH1HoGDUnNsSNJ7zcbpTmJ9/f6GV2Q
 ZDRjoiJC0mekcFtcFrlUVQOM3o0dFzl27dB73uuNVyY8ganZGllHtcpab/YmfJCKmFAK
 +MPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzu1B6j5gTPHqC2ZKjLA2DDCvb9q5t4xPA06bB4oB4NQLUr/ea8tyB0nHAi+dDHwMkhrl1HWtNLA==@nongnu.org
X-Gm-Message-State: AOJu0YxT1rEZrd05rlzUW23bbjpsnNc0IE453g9nxpcjv1wU2CvUxRg/
 0PSROZU7BxEO0l8DslVoyqCc8NViOYX2G/lt9vkFJJqx/OSmUguW/MZy9ihyXBE=
X-Gm-Gg: ASbGnctobBD4acxhQJ83cRccV7UtfV5fOQW63YFjb/rvb0abggk+1ESB3jUc5N1XZZm
 hMsM5Qcrfj0ckl3HaKTqwDGPgqghqnYCQH5GLf3wAKqXuz0OEoZsxgU3Tww99sI2fIqBGSIPRLW
 lK4L1WuJgOuynUA7cRoJcQPy9Zc2pbzsuzRh+MVXLIqZpHVAqm2WcXu8mT76lBhXwHPbqzwtje9
 DW9nXbKxbnQEYXy1cI432odE1fUvdMyq6ZHnIbg8YFFk3IHV/k0/vHkulNkU5LJg08zNgrldjWQ
 y4/E9N3xqfEqkmxtrQ==
X-Received: by 2002:a05:600c:198a:b0:434:fe3c:c662 with SMTP id
 5b1f17b1804b1-43669a22e68mr382123295e9.12.1735820460425; 
 Thu, 02 Jan 2025 04:21:00 -0800 (PST)
Received: from [10.85.240.213] (187.171.88.92.rev.sfr.net. [92.88.171.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219578sm455641215e9.20.2025.01.02.04.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 04:20:59 -0800 (PST)
Message-ID: <7b06d49b-33f1-42f1-8572-7c300e4ef3d9@linaro.org>
Date: Thu, 2 Jan 2025 13:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] hw/microblaze: Restrict MemoryRegionOps are
 implemented as 32-bit
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-8-philmd@linaro.org>
 <21b166ef-258c-4497-abf2-135022eb4f0e@linaro.org>
 <b15d094f-8d69-4d2f-a79d-11502e8baebf@linaro.org>
Content-Language: en-US
In-Reply-To: <b15d094f-8d69-4d2f-a79d-11502e8baebf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pu7rxN7Kf+QY

On 5/11/24 23:27, Philippe Mathieu-Daudé wrote:
> On 5/11/24 23:24, Philippe Mathieu-Daudé wrote:
>> On 5/11/24 14:04, Philippe Mathieu-Daudé wrote:
>>> All these MemoryRegionOps read() and write() handlers are
>>> implemented expecting 32-bit accesses. Clarify that setting
>>> .impl.min/max_access_size fields.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/char/xilinx_uartlite.c | 4 ++++
>>>   hw/intc/xilinx_intc.c     | 4 ++++
>>>   hw/net/xilinx_ethlite.c   | 4 ++++
>>>   hw/timer/xilinx_timer.c   | 4 ++++
>>>   4 files changed, 16 insertions(+)
>>>
>>> diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
>>> index a69ad769cc4..892efe81fee 100644
>>> --- a/hw/char/xilinx_uartlite.c
>>> +++ b/hw/char/xilinx_uartlite.c
>>> @@ -170,6 +170,10 @@ static const MemoryRegionOps uart_ops = {
>>>       .read = uart_read,
>>>       .write = uart_write,
>>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>> +    .impl = {
>>> +        .min_access_size = 4,
> 
> Odd. The change makes the qtests pass, but here I'm modifying .impl,
> not .valid... Since .valid.min_access_size = 1, SBI is a valid
> opcode, no need to use SWI.

Which proves this device is only mapped in little-endian.

> 
>>> +        .max_access_size = 4,
>>> +    },
>>>       .valid = {
>>>           .min_access_size = 1,
>>>           .max_access_size = 4,
>>
>> To have qtests working I need to squash:
>>
>> -- >8 --
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial- 
>> test.c
>> index 3b92fa5d506..6d9291c8ae2 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -57,7 +57,7 @@ static const uint8_t kernel_pls3adsp1800[] = {
>>       0xb0, 0x00, 0x84, 0x00,                 /* imm   0x8400 */
>>       0x30, 0x60, 0x00, 0x04,                 /* addik r3,r0,4 */
>>       0x30, 0x80, 0x00, 0x54,                 /* addik r4,r0,'T' */
>> -    0xf0, 0x83, 0x00, 0x00,                 /* sbi   r4,r3,0 */
>> +    0xf8, 0x83, 0x00, 0x00,                 /* swi   r4,r3,0 */
>>       0xb8, 0x00, 0xff, 0xfc                  /* bri   -4  loop */
>>   };
>>
>> @@ -65,7 +65,7 @@ static const uint8_t kernel_plml605[] = {
>>       0xe0, 0x83, 0x00, 0xb0,                 /* imm   0x83e0 */
>>       0x00, 0x10, 0x60, 0x30,                 /* addik r3,r0,0x1000 */
>>       0x54, 0x00, 0x80, 0x30,                 /* addik r4,r0,'T' */
>> -    0x00, 0x00, 0x83, 0xf0,                 /* sbi   r4,r3,0 */
>> +    0x00, 0x00, 0x83, 0xf8,                 /* swi   r4,r3,0 */
>>       0xfc, 0xff, 0x00, 0xb8                  /* bri   -4  loop */
>>   };
>> ---
>>
>> to access the uart by 32-bit instead of 8-bit.

