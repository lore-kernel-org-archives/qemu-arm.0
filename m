Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp736356njc;
        Wed, 19 Mar 2025 23:29:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:849:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-7376d70c894mr9364710b3a.21.1742452180066;
        Wed, 19 Mar 2025 23:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742452180; cv=none;
        d=google.com; s=arc-20240605;
        b=LgvgzcMx2t05zcKstGz48xeigVHv2WpLp8JE5oArn6wMzd/2mNXWJcbKXZcZs1Omb5
         1s9GVs/rsOmpd9h9Z3KGMtMtmB0p4NzAEimoG2gBqUJRBhXrSoLlNVRnXMMKn93c/kU5
         bYkhrhOC4at+qQ4UqBKbO7d/lwkIfKzWRyG5khFLB+fFHSJG43joR7D07Lz/Olz1i1wG
         OuClvAS9Je0j6g3zH/eeGK3s3Zcxdsd6bmxJ+jCTckTK/3yjC6dilI/qJusNFEW/vhz4
         e7F0fGGS1VLs1r8pnxGszN5Ia/lyeyYBLfzoWDlnC4be+xJQ4ArwFJXYHAynzuduVGIr
         I4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OsKouGqaCLWkulgpWhE+23G53JRGkHyXy93jpLs9qlM=;
        fh=M6Iz/SVroPxZ3cqjLRmj9Fc4JeT/io62ekobBpEQi2s=;
        b=UvcpkYWIpv4ePEQMWe/cIgz5T1mgbaVmbaXapw3GhlgbQWqBBwlTF/UwIitcG9/zhR
         9tkT9djQvoTrURngUoyxTIb/EXXoc0jzfWDyldkZHs57ojQYYYSsbRHyHb+OtmvyWQDu
         Uof9s/Z3upgIb2W+5Q7AkIOHuDI2imEZZcIyLuhXYXVEdODXoBRNWRiaqfiSKEczsGGm
         t7LkvBlwM1XEXWPGBIf65wOGPStQS5Vo5/sjbOJ0zG20k0pexIydDrEPVKTT56NBnYAr
         9zx+0vYk4Q4lbNZgdspZYZf/lLz0jNBiddFU/62znYZicL20x1lzjFWBeoBe1gEDLBvY
         wRfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=X9bL7zcP;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7381d641046sor329349b3a.0.2025.03.19.23.29.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 23:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=X9bL7zcP;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742452179; x=1743056979; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsKouGqaCLWkulgpWhE+23G53JRGkHyXy93jpLs9qlM=;
        b=X9bL7zcParH8QbnLSRTz81alqYyBZSovUCI6Iv5XLi9ceandNoM1L4VoeM7C9FofU4
         qGectp+E4KkstIhyAavwn6o51GosH3qi6jJMqDwW9nymT6wMZNfvPXtzKHvyvvVfxtzl
         m78NSUtEf1QMvAMyA+wvjKHgPUNwX8Ra6HRsQT9T5QnCcHGG6EvbmBDGpvSq1cyI8nn7
         sLR7ceAJBs4OLdPQ4PzThrkAem8vWYVF0N6rVVrNG83a7W06JfeFUW7VQGyEegAO6/YR
         2CCBK0VJsxaHY5ya8GAnKdF8tXDacBLpHQ/yQq4njeWJNEmM8yTWfo16bbkg8GyN8BD4
         9QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742452179; x=1743056979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsKouGqaCLWkulgpWhE+23G53JRGkHyXy93jpLs9qlM=;
        b=ZU5ld3xOBzq/bpHUbNJ0cNwGRa4D4tqzLgJ+XxqVafQDxe9ahVe9nACPMxGu5FlSm0
         zerZ/M4KfvAvlLpPkxqlignK4bNolF5hViLJxtunFrBAEeT4eTmU0aBxQSTQpAnd9br4
         4I8LNHBvS7H7bHn69CkuXIXuktkTXBKxN6hNwQ5RlRAU6lXztm0kZbz/neMITbPyvbQR
         GOd9M7kFsSmjeWFPJnfLrXZwDT9zv+EVoSTJwAt6DYnfwx62/ZR9q/PmqV3LCTZMZtb4
         QksAKyhWozoP1I7qZh/t7/v/zmVU1JX46t2Hr0mTeVh9uEwymP3zU66CcWJouM9AQvfO
         1TjA==
X-Gm-Message-State: AOJu0YwsMqKiOn6OZOy58nnMm1apvPBoF+b0WpWYzVvEZ1D4cmw4Zy81
	3bUL6X0AFuCJMw7AbrYOu9ZYvoYgDGarct3xbc6ZdO9HkviN5puZQRvum3ZNFwFNl8jMvPIiuUF
	NwFw=
X-Gm-Gg: ASbGncs2w3p9cEqBsf3dHack5/9AXZjmqrsxnxuTpJ278CWSg1UXSc28zIwFfvipryc
	AeH4Zxyd4fzOG/iPqtTR/YWw+PborrSil+UnjuReCs5iyjsBIbIKxmy3ymj/b7PqBgcoKmLsmcJ
	EwQTwlGM9cH6Dpxkg5Qx7syatRoWr5RlVJG7vxGyE3YJeQGbAeNN0CmnTsCs6j5+bmy4kbCcWyf
	TlREiziBsSRzZYi0PcY3a0IkbKZ3o9+8kZ8eBSReLSn6LAR+sAHrv4lXCrYXH52kWzqtPO/eHCV
	ayRPBtHHkd+/qbSe+LUUA7Olzsq8kzTnv5lQU5Vr6gMkh0DPEAizFqlmiWQNNI6eSTuB
X-Google-Smtp-Source: AGHT+IGHOX9vNF7XnZZyvY2KJZ20ta6SLhASwDBqJOKzBDqm+LbMa9sJM/BWYcz/0yidLVWwtpI7aw==
X-Received: by 2002:a05:6a00:2382:b0:730:d5ca:aee with SMTP id d2e1a72fcca58-7376d70d09fmr7028809b3a.23.1742452179085;
        Wed, 19 Mar 2025 23:29:39 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167e02esm13274993b3a.95.2025.03.19.23.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:29:38 -0700 (PDT)
Message-ID: <d3688ce0-e2f3-4bee-863f-dac7a394c789@daynix.com>
Date: Thu, 20 Mar 2025 15:29:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] include/exec: fix assert in size_memop
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@trasno.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-10-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250319182255.3096731-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PqrMvK1diuzy

Updating the email address of Juan Quintela according to .mailmap.

On 2025/03/20 3:22, Alex Bennée wrote:
> We can handle larger sized memops now, expand the range of the assert.
> 
> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/memop.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 407a47d82c..faed3ff902 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
>   static inline MemOp size_memop(unsigned size)
>   {
>   #ifdef CONFIG_DEBUG_TCG
> -    /* Power of 2 up to 8.  */
> -    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
> +    /* Power of 2 up to 128.  */
> +    assert((size & (size - 1)) == 0 && size >= 1 && size <= 128);

This is the minimal change to fix, but perhaps it may be also nice to 
change it to use MO_SIZE.

Regards,
Akihiko Odaki

>   #endif
>       return (MemOp)ctz32(size);
>   }
