Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3174922njc;
        Tue, 5 Nov 2024 15:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUP+r02DKZ69as51Gc3YW4FkuyZCCXzv2SLXGBWQbkt2iH+7EKnpIh0fnCaiiFS4Y76gBHNW/di6dyoHg==@linaro.org
X-Google-Smtp-Source: AGHT+IHU+2s9HamS4odh2S8Aydq6fo5Ol+VRMVvwGg9w6a+r014KzaUfIY6yATIennFnvGVVdgcW
X-Received: by 2002:a05:6214:5991:b0:6cb:ec71:f1a1 with SMTP id 6a1803df08f44-6d185690ad8mr522340596d6.17.1730849405026;
        Tue, 05 Nov 2024 15:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730849405; cv=none;
        d=google.com; s=arc-20240605;
        b=aWgPB2ODptpmAvX3GsOBeuCO4Xgy3oKuGIrUC81rFlZT4PsexYYTLhyQ27FuYszYvD
         o2T2u1RS7LLD+CZARQ0j0SlKmRsSbgF2rPkzSqONGuWztYwjePHwiFh7Hx9sHTiZCpMr
         Ihn63DLhWqrC0dZ0bvzYq67zDzS3D5MU83+fohqMhWi2UEnwataAVRE8QrcKfKG4JcfG
         LYdALh9b4AogDYtcmnqBjHREeI2ICeXczrDHbfsFf8xYGzYqzf4eSSsYILOKYYuNzPYu
         6o9GRUoGrLb7U66viKJlcDucF7+h244ievmkeuvvtp1RMivehtV7xpKS4xInJ4wZLetd
         s/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tjJDJMeZWZ0bLi+K9wzyg8U5rQIR7V2vFJ/qP35A+wg=;
        fh=7qfgaRfDlM+u+vLCEBtAo2wuQCetcs50NBP73xWMPwo=;
        b=V3c2xSAtktzgB5Aew7ue7yJiR3XGOoIlqK5Bf++6pNEY//usTpgoRJUF0MWxOyu3qq
         5+QEGzi772Owv9saK69vVDrQYmKLsfIP87yaC0rddJgQ9h9nJqOTbIRn1036ooyDkCJA
         23oxkWycZsWwW4Q0OWjmjIop6vK/ZHRc2EBlUdKblaXL+YSs7NmS1gF7Vj5d4oauiYdk
         2WVyPTDdUvRqn63nnb++Jb3HPAW+wL5nEP+yUI8UYaecU2eTODAdWBkPVu804SDp2ycK
         YjiGjvc1m9vCFruc3upuAtu7JGvxNA0xgFKv9HoYaGrOe26Vl2qFa7mKymqZoFAFYp6V
         rUlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IJb3tk/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d368fc21c6si93826616d6.352.2024.11.05.15.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 15:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IJb3tk/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Szm-0007Rw-Rf; Tue, 05 Nov 2024 18:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8Szj-0007RR-3b
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 18:29:55 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8Szh-0004pj-G3
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 18:29:54 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cec93719ccso4792046a12.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 15:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730849391; x=1731454191; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tjJDJMeZWZ0bLi+K9wzyg8U5rQIR7V2vFJ/qP35A+wg=;
 b=IJb3tk/vfH25ZZf/2dKe+p8RG6UVCd0bOSD6hd9h8TPb4HgTMV0952WqPdp98Q/dC5
 icbRjqHlIMfYpLbuFluxZeA0j668WhKZUAlML2E287JzksrsAaStzjZpGYvyray+qoHt
 TwQPpWlPtmDeR6eECY/f6CWhwNa0r8iOEZUUCJBQv5jpu6EmtQBRorAV8DBO+nOtsJj6
 GkMKXKC92SlpK0qDSnuFcQkV6lwd3abxY82C0h71g9Uzg3NpTK1IzdSWokgozJIvfb9j
 iIaz8yG72N17rS0U92N1w7+zJflfd3zP3bh3IYzf2LKvA83wRSZkLoSavYbskR4uUC/Z
 QDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730849391; x=1731454191;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjJDJMeZWZ0bLi+K9wzyg8U5rQIR7V2vFJ/qP35A+wg=;
 b=rHkFmdsv2NMQnoDIzMUi+DNWdIS9axI/UIgdgZq97YGXNsNvKGrpfhdU1a0KwFu1lW
 4LsKZAcxlIXcEpmVNTsFxxi0RzJRpX58ZHjpUJhr6rDd8jQmf0n2cDqdcGd4mB6W+Tr0
 ++1Q3A0R/D7uF/yiPKW+VDG1Ur59n8zSnu2+J32eMd0NKk+BmbAfSrADYG8gIWeGSBEy
 rCUUS5NiiwSKuD2FiwD9yIfxPh2V6CLln2l8kL/oc4RIgAGsef9ClUm0yhhFU8g7IgKp
 MJX0D63ho4SjE858Ajgcqp1O2yxmmcPw8yqOiRd+wO4KdGPGApoOc110Mpy1NK57pTyz
 /LzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKT+E9re1kPjz+Y4OQWNxHztFP/4hXEVPRmgxRwzgu6EJOVN0loHqJTm5EpC8M/yQPIdZhTbqNyQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz6MWThXFpC045DKL97f4lGjArdTKZkNDgmv4YCjHWkKmd1EoeJ
 MESMoOcTXQ9JIP+QwBG17u8wsSYrDS2OMuJOTWSUEfiJ2DtwMsTT+nc6F6c2rYE=
X-Received: by 2002:a05:6402:3482:b0:5ce:d378:b098 with SMTP id
 4fb4d7f45d1cf-5ced378b241mr10252507a12.5.1730849391289; 
 Tue, 05 Nov 2024 15:29:51 -0800 (PST)
Received: from [172.20.143.32] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a36dsm1924554a12.9.2024.11.05.15.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 15:29:50 -0800 (PST)
Message-ID: <5434961f-93ec-4cda-a0be-3e35aaab5d7d@linaro.org>
Date: Tue, 5 Nov 2024 23:29:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] hw/net/xilinx_ethlite: Only expect big-endian
 accesses
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-13-philmd@linaro.org>
 <eae65cf8-af71-4b6d-8bfb-b22224f8496b@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <eae65cf8-af71-4b6d-8bfb-b22224f8496b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: jiHbzC+jV/Il

On 5/11/24 14:18, Paolo Bonzini wrote:
> On 11/5/24 14:04, Philippe Mathieu-Daudé wrote:
>> The Xilinx 'ethlite' device was added in commit b43848a100
>> ("xilinx: Add ethlite emulation"), being only built back
>> then for a big-endian MicroBlaze target (see commit 72b675caac
>> "microblaze: Hook into the build-system").
>>
>> I/O endianness access was then clarified in commit d48751ed4f
>> ("xilinx-ethlite: Simplify byteswapping to/from brams"). Here
>> the 'fix' was to use tswap32(). Since the machine was built as
>> big-endian target, tswap32() use means the fix was for a little
>> endian host. While the datasheet (reference added in file header)
>> is not precise about it, we interpret such change as the device
>> expects accesses in big-endian order. Besides, this is what other
>> Xilinx/MicroBlaze devices use (see the 3 previous commits).
>>
>> Correct the MemoryRegionOps endianness. Add a 'access-little-endian'
>> property, so if the bus access expect little-endian order we swap
>> the values. Replace the tswap32() calls accordingly.
>>
>> Set the property on the single machine using this device.
> 
> I don't understand.  This machine type is little-endian only and 
> expecting inverted accesses, isn't it?  Therefore, all that you need is
> 
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_BIG_ENDIAN,
> 
> And removing the tswap altogether.  The big-endian petalogix board will 
> start getting "correct" values (not swapped anymore).  That's a feature, 
> not a bug.

The feature is memory.c swapping MemoryRegionOps depending on the
*qemu-system binary* target endianness.

We assumed most guest vCPUs run with the same endianness of the binary.

Now we want to swap wrt the vCPU, not the binary. So indeed this patch
effectively undo the memory.c swapping (feature).

I suppose the better way is to modify memory.c, possibly passing MemOp
all over. For HW accel where vCPU endianness is forced to host one,
this would become a no-op. Lot of rework in perspective.
