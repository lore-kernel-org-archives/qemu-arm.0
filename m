Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2080694njk;
        Sun, 26 Jan 2025 12:40:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+dei4sbwGZsLtBNIBRHjp4xsLVYj/X79f7Olif103oDkbIXOw8TgDpxtr1RFNHa7xC/b483BHWZ9G1g==@linaro.org
X-Received: by 2002:a05:6a21:99aa:b0:1e1:b60c:5bdb with SMTP id adf61e73a8af0-1eb2158bda1mr57795464637.26.1737924037204;
        Sun, 26 Jan 2025 12:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737924037; cv=none;
        d=google.com; s=arc-20240605;
        b=XeAkOlUOE2ycIcyBNp3Ulc9uqAuU2b7qbNnL+MR1iQFwfC6FX9uBWP4GBYsNNmPpu4
         Kf5stQvMzctcqPSGQLY3FtTzvWw8ZbJw2yGckPsWHz/7c8+Vpej4p/2jC6bIL6l326jQ
         wh3MWev+gJekV1SHE5ElJGJoqeK3zFeIDS9i9YoMNJUy/4R1O/iOmfEyXRtt/VaCn/pI
         z53vk5V+EyGVWOo2IEhBvYDZMhzJ0/xgMNAcqMz7vRnUJQiEQkYhXWvh3qsB5ujGYgGC
         2sQKNFNPxB1GzvzUY5XR7v4URrfU9BtHXhU2FCE8XUqnQWeO+r/RkALtASpweTCS21YQ
         MKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8IakMPE25WQo15H6bcZ/5DvSR8Tj+5m00/ec4213Klk=;
        fh=1NFzk7C+n77hu7AAaoOucKumltPYaBCFYI/vS3QXnGk=;
        b=F5zYK6FB8E4dB0HjKSDVq9YgTNGGkRZQXqmUiwQ/i28IdpEkByo43a/iDYk+KuKGqt
         3YuJRUYoJUkuIaQ7JfYm+Nf4o9qZ6YTHItcVNiqrrAeb44vwjeai51fjlN4MSiQTEgmt
         cAGTvDDe10AOAc4fMAnaUNeeYUoFyJNLRyZgJfgPQw0o/4lIUFKViqX/7jqzCQd++EEr
         dH/8xxrkQTBgYwwJszjR7PmfhT48SMXm5nIoYW1W9u9uJf7hZ8IUoUpPx1q2ujF4GrnI
         bbGBbcoxK4qxzWZ3BVsnFbQtCstIazfQtrKFm4LNdxtuW+Nr6Mi+Fg5xDaQi+fTs0ICW
         9Tdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wRbeUUF/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-ac494df89d7sor3331218a12.5.2025.01.26.12.40.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wRbeUUF/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737924037; x=1738528837; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8IakMPE25WQo15H6bcZ/5DvSR8Tj+5m00/ec4213Klk=;
        b=wRbeUUF/axbJr0xdrWOINiBeZTYky3kd9/az5XQLHwphPuwTp/Y/eyTdvPbm/Vh6sY
         UZTxq7Ru4h7CG1gEq2mn/lKQbiLO9KXA2WY5OzPrqbc2IXjVVlLvfWV8/B0AchXjeeKl
         GEc1gDfxDYcKokYsgmLOuebut+/+ETV6Oege16wUocCo6IYmqx2raCq7dETadH/L2PO5
         euR+WEc0c7a2ururYlAbS1yJ+LK2TLbYDgNZbf0O9jKZ3reSqLdut9b6OhhYE1cd74Ib
         vCFOklrplGy2DUHocAcOioYySvLlZUGcvMUV/ADOFdmKQXUksT1/IKsy4FjnrEeI0x28
         7KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737924037; x=1738528837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IakMPE25WQo15H6bcZ/5DvSR8Tj+5m00/ec4213Klk=;
        b=WWcfOJSdRJxm1TqdD5+G7tgbVCAhDdSLduzcmpjuOfVk23n5IlM5Nakn5FH8mKjkZk
         J+hFPoes8CMnV+8KuZjWtWt2WWjB8Uac2ImL0sYUtxBCMaGKZpw9qi/qoD3VaLxsWrSm
         7c0FAiompUbaQgKqtaJnUM+9qvzRdkkKX0mzjQ1KtLN6dlJxmg1HgsRJ9yknh04cKghD
         BbDCaYtr+PKrcqE5ZC+ddyNG7gieu06SVWXWQ6PvlPfOuc3V2CxzAv+wil+UDC4ywMnV
         KlcyzfPmuie8pf+PswRvdZiWJ4mEDPsmBGJOwffjyb5WGlTiOKalzkpmL4R45hlT7aPE
         durg==
X-Forwarded-Encrypted: i=1; AJvYcCUSbPUz7p53ljdYhTr6S2FRMcLqH/nqCHk1lNu5Ekg19xHRSqNovNktIlflrIsqhY49pyCDCBJ/p399qw==@linaro.org
X-Gm-Message-State: AOJu0Yx3aXT/0WZnbh7HoFktJYm67S+xiGzyTHEr/W4xnDBWOv3nWFgW
	ganNDJXwTIZ4kUpdMuPZMFh88f+WjxYxEtOfDcudxO4vgI0cQFcb5De8AhnvOq/v8w==
X-Gm-Gg: ASbGncs1Cvahu1/KNpl7GKkx00YxhQu0JBGqSTsyX/I3EWM/agAIANxY0onaAmwZ8OC
	kMsxePBvw/Poa+HThYMd2HDv34QPdMoyPB2b//eDYIHPo8r9y2bv67hM8ov2M9TFLgVRgSzO2z0
	ePb2mUdmQrTAWQ3WeCr8Nkw4MU3Yi0cwflfWBiuX52yjfhyyXTG45NaotAGNVFBzAtwXg6hxyWZ
	rNZbtqnm4+ES1+QDNRThBvEX7FXvQ5F0GCSy1Fqv8uIFYoAazLowBNh7WTDfu/UrmenbIn4wLUD
	1+LXBdxGgp2K4dtvIqCzNNjcVF9endjciUU+bbzgE9FqRAY=
X-Google-Smtp-Source: AGHT+IHFyv2iybW4GBn6ydLEZa4E4dxLUY4YPXTswHBeV0LQk9iq0lO2cyUKBRO3s8sCKps06u6bpg==
X-Received: by 2002:a17:90b:2c85:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f782d30ecamr56371023a91.24.1737924036671;
        Sun, 26 Jan 2025 12:40:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cc3sm5572845a91.10.2025.01.26.12.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:40:36 -0800 (PST)
Message-ID: <41f18203-efc6-43d5-90fa-ea20416ec01c@linaro.org>
Date: Sun, 26 Jan 2025 12:40:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/20] accel/accel-cpu-target.h: Include missing 'cpu.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eDPDO8hglvPI

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> CPU_RESOLVING_TYPE is declared per target in "cpu.h". Include
> it (along with "qom/object.h") to avoid when moving code around:
> 
>    include/accel/accel-cpu-target.h:26:50: error: expected ')'
>       26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>          |                                                  ^
>    include/accel/accel-cpu-target.h:23:33: note: expanded from macro 'TYPE_ACCEL_CPU'
>       23 | #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>          |                                 ^
>    include/accel/accel-cpu-target.h:26:1: note: to match this '('
>       26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>          | ^
>    include/qom/object.h:196:14: note: expanded from macro 'DECLARE_CLASS_CHECKERS'
>      196 |     { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
>          |              ^
>    include/qom/object.h:558:5: note: expanded from macro 'OBJECT_GET_CLASS'
>      558 |     OBJECT_CLASS_CHECK(class, object_get_class(OBJECT(obj)), name)
>          |     ^
>    include/qom/object.h:544:74: note: expanded from macro 'OBJECT_CLASS_CHECK'
>      544 |     ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
>          |                                                                          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/accel/accel-cpu-target.h | 3 +++
>   1 file changed, 3 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
