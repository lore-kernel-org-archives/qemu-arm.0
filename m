Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1690110ejo;
        Wed, 13 Dec 2023 07:13:06 -0800 (PST)
X-Received: by 2002:a05:600c:470e:b0:40c:5f0b:d638 with SMTP id v14-20020a05600c470e00b0040c5f0bd638mr264955wmo.182.1702480386782;
        Wed, 13 Dec 2023 07:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702480386; cv=none;
        d=google.com; s=arc-20160816;
        b=VYFE5fOufIuVxTalBoxr+2ta7yb+Ibz8uKKCZdv6NKiNgVfxkHcPKJ4IvXRWTrWo0e
         dXwThC7CuxYzDE3lXWDrqeqXiNSzuH2FDh4+TpyeE30sydJbAzsfIA6aIS8QC7L74Jk+
         Pzi5m6aYLGUDxRl4CvboxF2IFr6KSTJVon2Tj6rlF4y2Ase7ob3aYUBuEFuDbvUc+6Lt
         w84sHPz0AakQKVFI63s+R6DmTXHcgXUDXZsIY7ynbnqmaRCmVkTfFRVg/NIGaUZVNP90
         VFNgPv324QrCZeUXHjlobJ4s+M+MKoPUBGV45zzc4sl4HKO2LNRZZ/99clxUusSc9Pgi
         +84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NacKrLcFKE+swjj3apwDGz+I51NWfy8uBYCUPz0MLbo=;
        fh=uJF8kJ0Z1HiskjHeV89yeQtWLx0+ZWfGZ/jXa6zF59Q=;
        b=g+fz7R91eP9aiSsoZN3za4aPQYR7kQDhv/oMEYYtPB1jzBuhHmQ1BxIzeWsogxdqZ/
         jIoGHlNrxBCGq3PixUeh6r8QbCj9jIdstFcCwuZeOXic/Sv6qSoDbjhnL6sVWu8EdBaE
         qo8Q9X4ADcC2PBTRjFLippYlX+7Okd12UTZ588s8Iw0m7IpXRgHDm7oqfHT6DEpwsbZW
         AGuenoZ5MVIjeV4G6ZqA0QgF6k7m2Mp2XIcim9LPJJfv8s36ohADT71jD9zKy9FSXGTG
         n6J1qWAN3mcpsJXyGNAMeoZcAFTNxUkB5khOkdauulzPDkZ/Za+FVkiAtYKvo6nvLG/M
         T5vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HINePLhJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u36-20020a05600c4d2400b0040b42c42d11sor1703754wmp.4.2023.12.13.07.13.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Dec 2023 07:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HINePLhJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702480386; x=1703085186; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NacKrLcFKE+swjj3apwDGz+I51NWfy8uBYCUPz0MLbo=;
        b=HINePLhJL06ur8mmvOiJ8dcbeNUUeR6dofTfk6K2neOmS+RWbVREvvPnLT+V7m3OjU
         dWwPdqXw3VjPkybo9Ki1i4jMJ9cl3PIZyJrMBYxEDxnfbYd71PBYWndfYs7aFiFBI2ac
         GDiKcL3R12+Rd4bq1z+Ywth6A0B4HaI+mtj/r1EKyLHNM4O/HDOvwGILlaRRts6ID3Pv
         F4seaBGa2Kvq2SdcAeYwfVERgkc31KYZs1c/fui7tU9bNICHnbZxanqgKlLbZDJm0tBe
         8P9CTaaY24zWEPaqbQlfTlTVO3Aa+xwvXLPhrdSBnSj/wDhh9EQiBykrZASBqacKOQOn
         gzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480386; x=1703085186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NacKrLcFKE+swjj3apwDGz+I51NWfy8uBYCUPz0MLbo=;
        b=cfzsTzWAZqOD2zVEme+4IsqjxJCQIpACJ295n+Nqm6/dn7Cf4CBiVnj8xdrPhPJdGX
         Rr+ac/EA4HKwAcOMnuDimhy+uov5ZOaz5uv+Xf+S0H5T1jgrMvmBt11eIh8ncExXMr5h
         NI92tcIFGoi0DI+MqSWCYwmqunBOf8Nr5r3RtdbW+bibObHwaxGyh1GpOVNOCM4znAfs
         A4rcML9h7SfL2nEeze24tslZgJRThijNEWnQwyRVh/CVwAuA3G9Q4At/dIzuYahwb/b4
         tCWnRARGfPG20k7jWcZl0dtXlyKlCInZU5rMMenG5RpaJJlR5IF2YqYaRttthGAGJ6Oc
         5DNw==
X-Gm-Message-State: AOJu0YyA4yoMbH2XuegqnIYspDy2STOKwz3BO8PgqfIKba9C3ucOaniZ
	Q0CKh2I0zl3WjWAJ/B40ncZlszBV
X-Google-Smtp-Source: AGHT+IHWPgPq1Qz3fNek7La9w78eboVD77R6REFM2CaruuSR28jnQGFN7L2wKoY5L1a8EKgUGxoC+w==
X-Received: by 2002:a05:600c:308a:b0:40c:370d:71e9 with SMTP id g10-20020a05600c308a00b0040c370d71e9mr4859136wmn.77.1702480386382;
        Wed, 13 Dec 2023 07:13:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.71.175] (76.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.76])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040c411da99csm15326015wmq.48.2023.12.13.07.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 07:13:06 -0800 (PST)
Message-ID: <90e11c50-2640-46e2-978e-ca989768f861@linaro.org>
Date: Wed, 13 Dec 2023 16:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] exec: Declare target_words_bigendian() in
 'exec/tswap.h'
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-16-philmd@linaro.org>
 <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ENLYqoj5XdeP

On 13/12/23 12:20, Anton Johansson wrote:
> On 12/12/23, Philippe Mathieu-Daudé wrote:
>> We usually check target endianess before swapping values,
>> so target_words_bigendian() declaration makes sense in
>> "exec/tswap.h" with the target swapping helpers.
>>
>> Remove "hw/core/cpu.h" when it was only included to get
>> the target_words_bigendian() declaration.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/tswap.h     | 12 +++++++++++-
>>   include/hw/core/cpu.h    | 11 -----------
>>   cpu-target.c             |  1 +
>>   disas/disas.c            |  1 +
>>   hw/audio/virtio-snd.c    |  2 +-
>>   hw/core/cpu-sysemu.c     |  2 +-
>>   hw/core/generic-loader.c |  2 +-
>>   hw/display/vga.c         |  2 +-
>>   hw/virtio/virtio.c       |  1 +
>>   9 files changed, 18 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/exec/tswap.h b/include/exec/tswap.h
>> index 68944a880b..77954bbc2b 100644
>> --- a/include/exec/tswap.h
>> +++ b/include/exec/tswap.h
>> @@ -8,9 +8,19 @@
>>   #ifndef TSWAP_H
>>   #define TSWAP_H
>>   
>> -#include "hw/core/cpu.h"
>>   #include "qemu/bswap.h"
> 
> This breaks system/qtest.c which gets first_cpu from hw/core/cpu.h
> through the inclusion of tswap.h...
> 
> ../system/qtest.c:548:33: error: ‘first_cpu’ undeclared (first use in this function);
>    548 |             address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
>        |                                 ^~~~~~~~~

Doh sorry, in this series I dropped some already reviewed patches,
and extracted some not-that-related series. I was lazy to add the
many 'Based-on:' tags on the cover.

What you mentioned here is fixed here:
https://lore.kernel.org/qemu-devel/20231212113016.29808-1-philmd@linaro.org/

> Adding hw/core/cpu.h to system/qtest.c seems sufficient.
> 
> Otherwise,
> Reviewed-by: Anton Johansson <anjo@rev.ng>

Thanks!
