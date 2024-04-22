Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4229788ejd;
        Mon, 22 Apr 2024 05:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTfQV8tV0zsGDgKh1nrLSEXmmGVCzojdexlXUULVbUFhHbIbxEJcaPK6tagxk0fLjzqH+FraWE9BQ/Lm5py/luyuBka0Ad
X-Received: by 2002:adf:f00b:0:b0:347:e6d1:2fb8 with SMTP id j11-20020adff00b000000b00347e6d12fb8mr9391737wro.34.1713789966950;
        Mon, 22 Apr 2024 05:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713789966; cv=none;
        d=google.com; s=arc-20160816;
        b=fcqmOhP6FuvQs6XhlKxNa7GtVSH0sNf1zKGXXQSpebhHqODCaxBLvU8yOCyuYFXOla
         6yp0abxY+5aHciKEEot4ABgGvsjeNgIEiVz5TOl9mqwdPY+2maIzuNgnyMFjAHZ5PahT
         mBMAU0v8tnYnq43Vq6hwqA/49XBJViGUmy0pZ7T5e/6w3iiUWojJ8ldDNi1T+SnCRMp4
         Hdh1hwRRQiX5kxvevCV1jkurZDl6SrCxWe9Bf2yZ1oVSz6yMingYhJxRurxpgCSnvIjE
         ep/ehfP4g2ckU9p1LVcf/gsAjQtoWjrzGPL3g4Khuj8ZRPoxdwtGfEqosBzHRXPF/EZA
         em8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=39Acx84dTQ3hN2yMfKWcH9znaBkPeHgCHhH+12hyjQ8=;
        fh=c+ZyRT4sRKYStVDZC/1cOAxHEwWt0104+8VKNvwymXk=;
        b=hF0A5zH0fZdrbn9UkLHxBKootg0oSvZGBrokjYeNJDMyoh+1MGfvN6mUvf9HfYkZJ9
         HJgOPyc/XJAf3SFJfWtjlqK4mQ7mKqSyvlLaCGsvzNgTpsamzS27dpRDLdDwUbtX53XF
         O9crCWuBOvOLqLTK/8D+n49OOlMHef5AgiPjgvIVSr8c6HQKBb18UvidJvu7GwnqGbv8
         T+vD2x6XI6OyjGpwLIk2jo9oJjbgmXrnzAABgDQx/BGk4qXGqK6uNANdESMEQcj/yVNs
         Mru3kiYPy0ddFbNi28+e/O3myWbDyTLevHdEQ1Dql66lvcH9bWi00mK+Fv87TIQeU/uN
         cxvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlsyOJn0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v1-20020a05600c214100b004147e72fe40sor2144019wml.1.2024.04.22.05.46.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Apr 2024 05:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlsyOJn0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713789966; x=1714394766; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39Acx84dTQ3hN2yMfKWcH9znaBkPeHgCHhH+12hyjQ8=;
        b=hlsyOJn0kU6A+MGQJXnXQu38ppsU/snmAGw/AkIruE4Ws3ad5GYmRWjVRrWYWADjRg
         +hFyCtsAK0z3tQbiu96Lr2u19/LoVmOzj4V74WJq6fINBmw4hYfcjzOEpWZU4lEhtMmB
         pTU19i2QfuWrpON2HqPy1Q1luoam6tHEZpQcxC16tKSpR0nUg4/oNlU2PEfA7770XaLF
         sY8bPaXJzM9AnkTbxK5+zpPzbAi6/4qH8AUkq+dabQDTcpvZUDASEjLrQhiG6IEvuZWX
         hOGDPK+6eoXr4u6f8fdPyJfzhE8f6LjL6IWQEi7Q7xf/MwN+kTxPHg0s5npN5r04pvLL
         ZXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789966; x=1714394766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39Acx84dTQ3hN2yMfKWcH9znaBkPeHgCHhH+12hyjQ8=;
        b=W0w+XXrcy6q8GKP+Rh7U1EQDnsNP1rwVTyCzAcYlavVb+1i6aD3JQ+j3mo6r1JBdyF
         JkjV6qt0Q1a5Syp1PDMEmrEERHAmlMkxCu3Su8JXWf9x8Ql1kdh8UScNuZAOWNbBtEh1
         oG9Rp6OqAC7qsIRKSzdtzfCiccPlR7ubhLcjKKQkpe7omaH72Pv1sgcssGWdJByhuKsk
         ot9NSf+ul7OT8qyfC7QzHH95InHqQIAh8VRl0Yp5d5/mDpnaMzkIQFMCfmJgTmzbjrml
         AKvDb3cFSfNYjIrQ5rZOYIiOmRRF5uWBZa7q+2PFReUxHvK+DWEOkv4sIEmcDHyxO0Fg
         3HvA==
X-Forwarded-Encrypted: i=1; AJvYcCUUyDToUld/mxdQ7BhXOApOAf9Jkki3/uNfINg5pbEXsxarQ7Kkljd35/MhotfAJSUIsD6P4/tJUg+BpQEnVu3vmpjEVXfb
X-Gm-Message-State: AOJu0YwjS0eUgH9F82Ok/ciQSlROA6IpU7nJtRLNwGKrYcSfdMeQUAdx
	gGr7jGcnZRD+2uoN6D7Zkf3rGjIbmu3WZTT/P14EbgNeb8USLHxeyLVkDFqBS1JR3w==
X-Google-Smtp-Source: AGHT+IF6ekSDYQxE6y/nkKThKaQm3zn/4i7UQcySSVjovWfJ/Lif57cfa79EBDVO51EtY1b9jhV+aw==
X-Received: by 2002:a05:600c:1e15:b0:41a:7c1d:3326 with SMTP id ay21-20020a05600c1e1500b0041a7c1d3326mr1187471wmb.8.1713789966552;
        Mon, 22 Apr 2024 05:46:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr. [83.193.250.196])
        by smtp.gmail.com with ESMTPSA id bd25-20020a05600c1f1900b00419f7d6879dsm8198662wmb.8.2024.04.22.05.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 05:46:05 -0700 (PDT)
Message-ID: <7492ef2d-1ea1-472d-baf3-ad8236fcf62a@linaro.org>
Date: Mon, 22 Apr 2024 14:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mfnCLqPL0uIi

On 13/12/22 14:53, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> This partly revert commit d48751ed4f ("xilinx-ethlite:
>> Simplify byteswapping to/from brams") which states the
>> packet data is stored in big-endian.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
>>               D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
>>               break;
>>
>> -        default:
>> -            r = tswap32(s->regs[addr]);
>> +        default: /* Packet data */
>> +            r = be32_to_cpu(s->regs[addr]);
>>               break;
>>       }
>>       return r;
>> @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
>>               s->regs[addr] = value;
>>               break;
>>
>> -        default:
>> -            s->regs[addr] = tswap32(value);
>> +        default: /* Packet data */
>> +            s->regs[addr] = cpu_to_be32(value);
>>               break;
>>       }
>>   }
> 
> This is a change of behaviour for this device in the
> qemu-system-microblazeel petalogix-s3adsp1800 board, because
> previously on that system the bytes of the rx buffer would
> appear in the registers in little-endian order and now they
> will appear in big-endian order.

Maybe to simplify we could choose to only model the Big
Endian variant of this device?

-- >8 --
@@ -169,7 +169,7 @@ eth_write(void *opaque, hwaddr addr,
  static const MemoryRegionOps eth_ops = {
      .read = eth_read,
      .write = eth_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
      .valid = {
          .min_access_size = 4,
          .max_access_size = 4
---
