Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4979334njc;
        Fri, 8 Nov 2024 07:06:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMeNvcYXllBEIIOhDyDko2U+oC7SmL5dNzNfm+GuXJMZsOR9wXipiLTEgfoHBUrhDX8gODv0C79sBhjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJOC5dt8kb1k787aj02NgLgXWWFdjT2ipV+YGLC7ws/X0AUVVgV8l8zrs+uLgMHdVeA12r
X-Received: by 2002:a05:6512:3f02:b0:530:aeea:27e1 with SMTP id 2adb3069b0e04-53d862ebdf0mr2027874e87.50.1731078395636;
        Fri, 08 Nov 2024 07:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731078395; cv=none;
        d=google.com; s=arc-20240605;
        b=lN1gbl4BlV/KexHZ2JiCIQ0sc5NlkGMTKOvf77PDrY6sJWNFW1G1WCg2iKME5Axl1t
         SEWY6xwn2yL2wmK7LwfdpnT7r99jWLtpp6oteZ0kUqDYZc6NN7L+1IXmw0VK1hVU7InP
         j6iyLp+P2cSglYrsYBGe28Juhm+cUw9YEMh6AasfEy/pcKWSt+8PARkpzgnTBrFm6+5O
         wkp6q5UYUdsfzgW5u1ZlKp8ld8vhBsUvBhTaY0lQTr1s+imQHJcE1GD3aBsGOSPwlRem
         ht6I6G3yxofpE0w4bylIUyMxvkc6QsL6QvrLNvVH8VMqNrQyUgm1d37xmC4nKTYu/sDn
         kqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FG9TMhU6vicNJDI9tfofWm0arHe+KcmjOwTjp3PPNxA=;
        fh=1big9k20X5TcD3iMsA3JOV6lmbnFgt6bKAvWQoWbGHY=;
        b=hLBwQOXS6bp3VrFZ4q4wRzDdTttXKpBsNC4OMytzPGveOBXL3ZMf+aidDYKpP0lhEc
         MrV6ki9jUBTiBdE3cLDITbfs6Gbw6RdprMbB/BqFdOFSeO8qYeefV7cjTCaoD5Zuoz3m
         zAic9nuiKVm77jLRxk/nyweyS8N3oyGS4s/6f1KB3BvGhhxYv/KwRAlfak0QkF/nyjWI
         UPIaHtghIego1/GT2e5EtI+K+BygPmK5EkNGSqCuWsPfZPVZrzhY7sDxknTP10Wy0uEW
         TzWWNN9JqHbTneCw+Lk+9AbW7ywwxlqI/TiFCNMj+nap5Et6ah11KTWg4UQkFXJXst8D
         YlXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGOG0YPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-432b0610f04si29051785e9.95.2024.11.08.07.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGOG0YPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QZ9-0000pW-Vs; Fri, 08 Nov 2024 10:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9QZ6-0000mU-Hj
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:06:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9QZ3-0008JN-0k
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:06:23 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso19801705e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731078379; x=1731683179; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FG9TMhU6vicNJDI9tfofWm0arHe+KcmjOwTjp3PPNxA=;
 b=mGOG0YPr+CKW3BpdeQVoSUclVsUwXZZBSryNvQVfkhk035/qBsxZby65rps83MjkC1
 bs+vIbxIrCUT9poDjRUATpkSXmaP+7W23v3hw02V4LAIjEkdhkU0/4DQQFHcqpYBBfoQ
 BBMp3SkhWLOTgTyuqQhAbDe1WXf5OJDeXBuD14+hcLZf6rdZPdHmnxXzx6MvCGYWV3m1
 fRy+r2rBPmJiTGyZdfiTJLpttE4bS30U4u7DOaRda/KNvoZJZOhDHAPtFFoA5XH61B8h
 C1nPJIctQceIwab7TNV2HDeSXxvxspvU0zVwUyO/9X1D3zM9OBoEQ3DhgKTZWEJoyoBc
 j15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731078379; x=1731683179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FG9TMhU6vicNJDI9tfofWm0arHe+KcmjOwTjp3PPNxA=;
 b=erA/Tu7t6dWmP62+oIqQ3V8J9L0/GJJ+gzp+N5lGBKtuUvx2JNdfXUaEkrnJRsF6e6
 gQW4IMYksrdBNvI7jjaZL1+NT/yX4ndXv1fuvfzmBf0hEjkpdGUXFbDMNp9bc/a/XAIW
 Ere/YOPJD1PHqemyyw0EC8vxinZfrVTDsoe2GLdqalGX7Di8Ipp4zGk6Z1iU5D25h2DI
 GBrZKKGrR6kBCY2jy096CyV4SwZ7NRHdWpt2ZLtfMdsKireA8/21MQ8ScWFxZ9i0924h
 Jiw739qRTUZQCPM5LcHO4ZTq8mqXN+YFCudz2bPShAjwMivjrkMTujws0XLJav0PaCiV
 hokQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYaMk0neERvuIP9YGfbCdcnaMm0SZrem3KzfVvAGZ14PBs72ho1AKF/9+Xwnd/nx2YNQ/y8/8fIA==@nongnu.org
X-Gm-Message-State: AOJu0YyGk7MIPw0tWVhqii6fhPUgm/Phq51vnPnqajvQoRRkxH6jKig0
 QVPdFpXDzTETO6/eY17z1l+8ZwUOr101ubwQ8e12w77OWVHciLPxth98rK7Y/pk=
X-Received: by 2002:a05:600c:46c8:b0:432:7c08:d11e with SMTP id
 5b1f17b1804b1-432b74fedc8mr26804375e9.1.1731078378934; 
 Fri, 08 Nov 2024 07:06:18 -0800 (PST)
Received: from [172.16.22.241] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381edc1104asm5204268f8f.88.2024.11.08.07.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 07:06:18 -0800 (PST)
Message-ID: <7aca01f1-ba87-49be-82bf-54979d22db60@linaro.org>
Date: Fri, 8 Nov 2024 15:06:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] hw/char/xilinx_uartlite: Make device endianness
 configurable
To: Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
 <20241107012223.94337-8-philmd@linaro.org>
 <fe69adc2-0ebb-4be0-93a2-9a45d87c36d3@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <fe69adc2-0ebb-4be0-93a2-9a45d87c36d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qLJVxvWRONpZ

On 7/11/24 10:27, Richard Henderson wrote:
> On 11/7/24 01:22, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness on the single machine using the
>> device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/char/xilinx_uartlite.c                | 44 ++++++++++++++++--------
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>>   2 files changed, 31 insertions(+), 14 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +static const MemoryRegionOps uart_ops[2] = {
>> +    {
>> +        .read = uart_read,
>> +        .write = uart_write,
>> +        .endianness = DEVICE_BIG_ENDIAN,
>> +        .impl = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>> +        .valid = {
>> +            .min_access_size = 1,
>> +            .max_access_size = 4,
>> +        },
>> +    }, {
>> +        .read = uart_read,
>> +        .write = uart_write,
>> +        .endianness = DEVICE_LITTLE_ENDIAN,
>> +        .impl = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>> +        .valid = {
>> +            .min_access_size = 1,
>> +            .max_access_size = 4,
>> +        },
>>       }
>>   };
> 
> Having looked at several of these now, it occurs to me that you can 
> avoid repetition:
> 
> static const MemoryRegionOps uart_ops[2] = {
>      [0 ... 1] = {
>          .read = uart_read,
>          etc,
>      },
>      [0].endianness = DEVICE_BIG_ENDIAN,
>      [1].endianness = DEVICE_LITTLE_ENDIAN,
> };

Thank you :) I had the idea it was possible then forgot about it.

