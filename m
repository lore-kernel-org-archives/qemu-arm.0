Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp161613ejb;
        Wed, 31 May 2023 21:08:38 -0700 (PDT)
X-Received: by 2002:a05:6808:f03:b0:38d:e3b7:7f14 with SMTP id m3-20020a0568080f0300b0038de3b77f14mr5681941oiw.44.1685592518369;
        Wed, 31 May 2023 21:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685592518; cv=none;
        d=google.com; s=arc-20160816;
        b=YbItz+rQMmK9nwMw6Nh7jFeuhz3Ua9dDhwq5BgrhtrbdqVKkhiewbbVyDbpgMH/DUc
         r7itEqSSjpg4W5bQz+hwAuEis/vsYddDI3C3dA0M+oaqjAUrTi/gA3azcFH+RwlTCFCk
         WZrQrtLVquIT5AXzeGBot2bCeMEfZBPBlWKLoqwk7fTPUp1vvRNfjpKY145xYa45JseB
         O4H6Ibg/pi5H47+4vqnNiwzoqu0D2QP2coJ8KYIKuV3y+11FdRqntCqRaWC+TA/NzqH8
         +tJZMDdJnyrZHKaG4bg8lQAPSpvOpxeAzosEhz5jmv2CpImbLX4yQnjgZoRl0xAczz7t
         gASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EpvVmzqeddbaeLR//NYYOjtq5SDhaE/nOLFYxPd2yGU=;
        b=gjXLtLlaaj+MkpdYJZbVLT1/RmHskWrvVqp/95CvaHbu6O8Fv95DmsDxGmi4TWr547
         pAnFjZSLvIbg4rFlq8YXUL6cFljQZUxGCIk3nNF5T5RKIHCDtCgjFQRniiwXNo8leQ+2
         NRq//WnPbE/wDIkAr7jBfQlXfp/O7IoDCshWOKBPq4Bsjoti2M46iDhRN5aPOj6dCesM
         q+E71a/hK/tcXGRxbbZyIPnMywIq5daXSqsB6xxUPFO4ohSfE66WIHpg4eOh8axHa2Iw
         ZqLpPZiVYaNx09LGGNy6S0h1jzJOLYlnsTUTIFzgy4qhKgA3IXguWPamF5K56FyAryBv
         LjxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGCJY4Gb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w185-20020acadfc2000000b0039a016e6a8esor824012oig.9.2023.05.31.21.08.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 May 2023 21:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGCJY4Gb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685592518; x=1688184518;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpvVmzqeddbaeLR//NYYOjtq5SDhaE/nOLFYxPd2yGU=;
        b=YGCJY4GbUxg32QdmKliOmZZ0YC06osFJagLhQP1AeNdwd+bo5oBUl+iVvWP3VFkDWn
         khbLvJ0vnGY4SLu+Czm56sYX/BgJ0wJFVwaLX2ul4KlJ+jUlQp/n9Z3yoH28xZAwZcyf
         vw7hhKLQj4ZrsF7EyhYpEDxTqRN7OncZWTwnhCCfVfENqJBF5YaqI9kDd+MmhIKmtrc8
         RybumJ72f3xlF2iq9wZV2TS7nIwwQRbn2hzRUAoMZpf3FYjeFbHPljkCiQ/xGtrWf5vS
         WVmPVKqBr0tbJX8U8dEQEV5O+DREg/REZKQ6zI1x4Epdu6XPiplRRLDnHeZhqmHb0gAR
         e2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685592518; x=1688184518;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpvVmzqeddbaeLR//NYYOjtq5SDhaE/nOLFYxPd2yGU=;
        b=ZSV/OfK1XanZHAQhUIDAdeRKw5KKKt1yGfSHnnI4sLdi2veBVF9i0sBZcWaoXAS2/0
         kTRXy6wkHsjYyBmRAz/qiR6nAwCTfCvUR+lA04SwPYrNfp4FDpSTdNJnDdQquA4rfp8j
         uGtQNV9shVUe/qQAlL9to0ob5wrBTBequoZVKHji4nTk4A6iJf1UPnUgouSiqsvOqymk
         sfkdJI+PNSGo7THw0CIvPpm8y5cGKEAc9e5vwmK1XWfTqXomD0U4Wm++0g+jOln8Gvz7
         9ALmfGiEeVhkpbbawGVvKG/gXt7rPT1rtxJNbkKZflRhMHgUE5KmvxldruBNlurtcMph
         t5ag==
X-Gm-Message-State: AC+VfDwzQbPFi3ewj5yAwJcPcxPjMZzSwTMxiCLSO2sEBP+EKinIA+x1
	WTm62R+/8gzrtpZIfmAvhsr43o1i
X-Google-Smtp-Source: ACHHUZ5iBVBa9RpIglrbqX8s1RAgs0aVo33WtuxlfRA63wz28nf3fWN0XmSfmV8OREgDfDHv3D4Uvg==
X-Received: by 2002:aca:641:0:b0:398:2eeb:a9c2 with SMTP id 62-20020aca0641000000b003982eeba9c2mr4863346oig.32.1685592516491;
        Wed, 31 May 2023 21:08:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7? ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902b28b00b001b1920d000bsm819323plr.234.2023.05.31.21.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 21:08:35 -0700 (PDT)
Message-ID: <bd19daca-6b9c-0302-04e6-427a0cfe8072@linaro.org>
Date: Wed, 31 May 2023 21:08:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] Implement AES on ARM using x86 instructions and vv
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
 <722d7683-80b4-bb23-3ca2-77f8de23b801@linaro.org>
 <CAMj1kXEH4zFcOZGz0HvTbpcMUup+cyZEr0JQxH1uXpGcbAc6ow@mail.gmail.com>
 <c8499cae-befb-7130-3114-350ee97bf49d@linaro.org>
In-Reply-To: <c8499cae-befb-7130-3114-350ee97bf49d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +p94nEY3Y40W

On 5/31/23 10:08, Richard Henderson wrote:
> On 5/31/23 09:47, Ard Biesheuvel wrote:
>> On Wed, 31 May 2023 at 18:33, Richard Henderson
>>> Thanks.  I spent some time yesterday looking at this, with an encrypted disk test case and
>>> could only measure 0.6% and 0.5% for total overhead of decrypt and encrypt respectively.
>>>
>>
>> I don't understand what 'overhead' means in this context. Are you
>> saying you saw barely any improvement?
> 
> I saw, without changes, just over 1% of total system emulation time was devoted to aes, 
> which gives an upper limit to the runtime improvement possible there.  But I'll have a 
> look at tcrypt.

Using

# insmod /lib/modules/5.10.0-21-arm64/kernel/crypto/tcrypt.ko mode=600 sec=10

I see

   25.50%  qemu-system-aar  qemu-system-aarch64      [.] helper_crypto_aese
   25.36%  qemu-system-aar  qemu-system-aarch64      [.] helper_crypto_aesmc
    6.66%  qemu-system-aar  qemu-system-aarch64      [.] rebuild_hflags_a64
    3.25%  qemu-system-aar  qemu-system-aarch64      [.] tb_lookup
    2.52%  qemu-system-aar  qemu-system-aarch64      [.] fp_exception_el
    2.35%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_tb_ptr

Obviously a crypto-heavy test, but 51% of runtime is certainly worth more work.


r~
