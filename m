Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp82878ejc;
        Thu, 25 Jan 2024 00:23:30 -0800 (PST)
X-Received: by 2002:a9d:68c5:0:b0:6e0:cfa9:8e34 with SMTP id i5-20020a9d68c5000000b006e0cfa98e34mr566831oto.74.1706171010085;
        Thu, 25 Jan 2024 00:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706171010; cv=none;
        d=google.com; s=arc-20160816;
        b=TuqBhr4LzrPE/J8egLOw2p4MZCr76kEd0OaqW2m882knMmnAZnArv2WtCeLLTNx7S7
         1QMig//QUIhYv3hCTkjzrN+ENVfld/dkN8ojl+5ttopkG7gCwLtTNmsWQPkPftM04IDn
         huTcjAm0FLn07Cu9dtYGNoZzaTFuQvZkDxrbBDWYnS6A/5zmUoh5B2+Vcw1LvfxTHOFA
         gCYsP7Iy+Wqyw4V7nZvcmxAWL4wCy24dbwRqBOtieODI7M/3PAOAzxz/VV1MhFCoQMyx
         5khei3FpN5s4++mKf+xDCjDJtKxoLiRYQGPpAF2JKesDAbWGpAVuF9EdbXQLWrbxQll8
         5BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J9lYDlnAE0lJVngPq79SfowaDrB/STSBHiz7p/zSWjI=;
        fh=/NMbWunOO/ju3Rw6PgEsoQjFlTF5tZB+F7q8urK+xPI=;
        b=dzegSqiR0mAQNRUkCsB8heKrVpMiG/J5wwR3YO/jnNwuT9fJWKhGp4FEjyVfr9zDt1
         IopoL5UojPaoplKE8MuzppZEdwzAVsKsWOtejBovT++7O07PeY6ohMX+72AsHHpEvarv
         2ftBQLaLc4bwyqMqe9vxgjN1rWOY+0iNy3u1pmVi3LnycOMnzyqqtKQ5Z9WlTRaXPNG/
         xy0xB2eoEvsggw8gHeL5gK/OPvu/qGN43hS626lvTKTbblxLERKRGlDXQLo5pQ7UvrDI
         2tAdYBw35llOVo01aUFq9g1zDFHvLEPI+Fd13FbyD5SgaVdeIwEyUHT1TUq3SHDezeOw
         Yuig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=xhs0z1Yu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9-20020a05683016c900b006d9cd6fc5e7sor7625718otr.7.2024.01.25.00.23.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Jan 2024 00:23:30 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=xhs0z1Yu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1706171009; x=1706775809; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9lYDlnAE0lJVngPq79SfowaDrB/STSBHiz7p/zSWjI=;
        b=xhs0z1YukF2st9CPFslIaIAz2HeEd6TBTgQGy5b7cb7/LOET0mEx+h9/1jVDWVne+p
         2bnARiL+uBzckjJvo9gNB41rfGuRiNzM2V63FLgOcCJCCld1iz92wlL835pdqjUuy9iX
         /+uaN0BEsVNeefkQcERu88YUVFEgz0rm/ZJsOH1ISrmVsjElE+Qo5kdTZE6S4zjUL9Fz
         VEtb+5c8kUfwgeD7tcvuaBe9fpltEqnxa9XxgvchC2h4YbCFe5w/thy36u9hmzk+KqmM
         cVgT1ddUW8MliHa2YlSoh0GrJGPUeAAYoGjF7pFakfFvqEX9bb0LqjIkumVvxysmzOTm
         500g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171009; x=1706775809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9lYDlnAE0lJVngPq79SfowaDrB/STSBHiz7p/zSWjI=;
        b=wq4PET//mzkxrz6i/7b2FYhn9OPFrxpOBBOJ7nGVlvl3GuIKvDB1yZd7u26eGo0x8g
         3nCtBfmsYX5KQNYbrrOgj8x3ykAyMqj81lqOUy4D96OXt8yuoAAEprsIjULWGixqMW/k
         0igkpQxkKt+FZujQJlCibWpssiuMXNxgJFONR4nyMVESVZurtKmXGRyV/RXj9EBIF0Aq
         xg50otBTXtkvh2UG9XI3/5ewiag0SXlSLRhd4N+0RP8RvibLm0XyzV0t/1k/k9k6L0yM
         SkKUCQHYSSL3u309KiaoOXWa2IQDXfLY1fjAPcshA5SCbpiHl0eu1W7QSdS7qvApP4ex
         XXLw==
X-Gm-Message-State: AOJu0YxKxMNQgfmrowxaJGr3zSydSM6cFulGo43f44fHFrNrGc1UMIvA
	1+4s6esEJSimd2jwAvC8n0HNAfBBD1lzBg/85bDOiCi6/jC9uvrkHKePoRM/p9c=
X-Google-Smtp-Source: AGHT+IECMqWYYJsB6MNOawObFchB6dGaMRCOAPEafdArYh7Hsf1OSjlc6V3+DkvMY59NBK0L25NVnw==
X-Received: by 2002:a05:6830:2053:b0:6dc:3c65:2a7f with SMTP id f19-20020a056830205300b006dc3c652a7fmr559935otp.63.1706171009670;
        Thu, 25 Jan 2024 00:23:29 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id w18-20020a639352000000b005d508535001sm2310835pgm.43.2024.01.25.00.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 00:23:29 -0800 (PST)
Message-ID: <246ea370-934e-4666-ba73-b49c3ff6e531@daynix.com>
Date: Thu, 25 Jan 2024 17:23:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier
 <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss
 <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
 <20240123-b8d1c55688885bfc9125c42b@orel>
 <15d2f958-a51e-4b87-9a70-28edf3b55491@daynix.com>
 <20240124-3d9bec68bff7ab0057b902b6@orel>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240124-3d9bec68bff7ab0057b902b6@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YztfYuhL6QYH

On 2024/01/24 17:16, Andrew Jones wrote:
> On Wed, Jan 24, 2024 at 12:08:33PM +0900, Akihiko Odaki wrote:
>> On 2024/01/23 17:20, Andrew Jones wrote:
>>> On Mon, Jan 22, 2024 at 02:55:50PM +0000, Alex Bennée wrote:
>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>
>>>> The effective MXL value matters when booting.
>>>
>>> I'd prefer this commit message get some elaboration. riscv_is_32bit()
>>> is used in a variety of contexts, some where it should be reporting
>>> the max misa.mxl. However, when used for booting an S-mode kernel it
>>> should indeed report the effective mxl. I think we're fine with the
>>> change, though, because at init and on reset the effective mxl is set
>>> to the max mxl, so, in those contexts, where riscv_is_32bit() should
>>> be reporting the max, it does.
>>>
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
>>>> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    hw/riscv/boot.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>>> index 0ffca05189f..bc67c0bd189 100644
>>>> --- a/hw/riscv/boot.c
>>>> +++ b/hw/riscv/boot.c
>>>> @@ -36,7 +36,7 @@
>>>>    bool riscv_is_32bit(RISCVHartArrayState *harts)
>>>>    {
>>>> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
>>>> +    return harts->harts[0].env.misa_mxl == MXL_RV32;
>>>>    }
>>>
>>> Assuming everyone agrees with what I've written above, then maybe we
>>> should write something similar in a comment above this function.
>>>
>>> Thanks,
>>> drew
>>
>> The corresponding commit in my series has a more elaborated message:
>> https://patchew.org/QEMU/20240115-riscv-v9-0-ff171e1aedc8@daynix.com/20240115-riscv-v9-1-ff171e1aedc8@daynix.com/
> 
> I've pulled the message from that link and quoted it below
> 
>> A later commit requires one extra step to retrieve misa_mxl_max. As
>> misa_mxl is semantically more correct and does not need such a extra
>> step, refer to misa_mxl instead. Below is the explanation why misa_mxl
>> is more semantically correct to refer to than misa_mxl_max in this case.
>>
>> Currently misa_mxl always equals to misa_mxl_max so it does not matter
> 
> That's true, but I think that's due to a bug in write_misa(), which
> shouldn't be masking val with the extension mask until mxl has been
> extracted.

misa.MXL writes are not supported since the MISA write code was 
introduced with commit f18637cd611c ("RISC-V: Add misa runtime write 
support"). It doesn't matter if we allow the guest to write MXL; the 
firmware code is emulated by QEMU when QEMU loads a kernel.

> 
>> which of misa_mxl or misa_mxl_max to refer to. However, it is possible
>> to have different values for misa_mxl and misa_mxl_max if QEMU gains a
>> new feature to load a RV32 kernel on a RV64 system, for example. For
>> such a behavior, the real system will need the firmware to switch MXL to
>> RV32, and if QEMU implements the same behavior, mxl will represent the
>> MXL that corresponds to the kernel being loaded. Therefore, it is more
>> appropriate to refer to mxl instead of misa_mxl_max when
>> misa_mxl != misa_mxl_max.
> 
> Right, but that doesn't say anything more than the original one line,
> "The effective MXL value matters when booting."

What do you think is missing?

> 
> What I'm looking for is a code comment explaining how riscv_is_32bit()
> is always safe to use. Something like
> 
>   /*
>    * Checking the effective mxl is always correct, because the effective
>    * mxl will be equal to the max mxl at initialization and also on reset,
>    * which are the times when it should check the maximum mxl. Later, if
>    * firmware writes misa with a smaller mxl, then that mxl should be
>    * used in checks.

It is misleading to say the maximum MXL should be checked only at 
initialization and on reset. We can refer to the maximum MXL anytime; we 
just don't need it to load a kernel.

Regards,
Akihiko Odaki
