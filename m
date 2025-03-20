Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp753828njc;
        Thu, 20 Mar 2025 00:17:00 -0700 (PDT)
X-Received: by 2002:a05:6000:2712:b0:391:4889:503e with SMTP id ffacd0b85a97d-399739de5f2mr4227548f8f.33.1742455019765;
        Thu, 20 Mar 2025 00:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742455019; cv=none;
        d=google.com; s=arc-20240605;
        b=EqxampRSF9qCtUoH7LTWq90xvMP8O/+YJVOPhfseWXmPMjsw78ZDBTSxq2X5bWfJft
         abvLRul1DAvv/Swbj77mQGoqvSv8RuYZykwRTHLk5ieDIUqpzNBK+dGUuFCf6dNT+hm7
         mpEQ5QTBNaV3wSSiMpADfAn8sjXY0iRCT3/SITHPLUNVz/X3eLXGls2GWZv4I6K53MXv
         MY8VH4PNQ7xk+TDZ0jK1x5ybx5VrMm9VqTwFCpOpaofugriHiHsr/YT4dwsDypxFydnF
         uHAOe7F1s4oWVUBuhChCYqn1MQPHUKYu3ppkEv4UfBKh9P9gDZW/FImo1Ny1t79K9pb3
         Tvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7oN3IJUQ+cRRip6WoFOMgHlo+DR8URxsDY/k19Goo3M=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=KLbkn26Go8hKuwmq3en+aAA/9pYmLM8cFxIi0jr9wg0Hdx3eDFKdEBfyXkzS0ATHZ7
         E7kQezIZcsMFzmN8WZyVeUeCWcFf8BRoWEFblEqn3LPPcB0CXFECoukISmtfISo522SQ
         7OXvD+UHTUKs3pupYrsTgx+EPAqwxiKbIqkSYtLlQN8EtT5HMEVIIi8968wZBzO8A2WI
         44WDfKfJhDJ5ZPa6cOofaRxTiOTmK/O39Ty0QyH/G+JdQ6nIiSBuWzTRvrJJpn16QeOR
         JPLIZryUqfQOG1OmCHL493Iqgk39ME2o/ZFOwzPFIp2J/o6XoPdE0YobtBRIHtmcEf4A
         fd7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOpPJ2SH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3997a9dbb5fsor312697f8f.1.2025.03.20.00.16.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:16:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOpPJ2SH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742455019; x=1743059819; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7oN3IJUQ+cRRip6WoFOMgHlo+DR8URxsDY/k19Goo3M=;
        b=tOpPJ2SH9jQ5bAIegEor+ANRAN4fU9j0FU1k0xWTs/PW248kime9LUU8W0hDQbWORa
         /J0+DZcfVgBn4HM7rLgM7qsU2gKVoUxAj2xpLXCvErRyKWjqXCEQ8VUbgv8vWGo+HgHL
         803C9oUq7y49UVhZfwXeU/tVUMf52qjYtUCYNlt+NshJXKJB3e4MDKWc1I5qD4y7hen1
         hXLEVbdgvL6v08c6R6pPLyQM+xW0eg3xVyVZCYMbGRHkOL67pcHcoWuyAGaCKrnkCjKS
         mY/SROY2Kn+hIqkJbuxNDlhp5P8onrs4sIF8Zz4vzS1hRnL6/4D8vqVHzPjgcnaLG+r8
         FAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455019; x=1743059819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oN3IJUQ+cRRip6WoFOMgHlo+DR8URxsDY/k19Goo3M=;
        b=Uouiekdc8vh98cjzqnZxZeLDYYFAo0ni3SPsAxkaALbONMbrM0cThK7QvEyvaWR5z/
         FwmF+q/3IVCZMD+7LyNRUYphyky21FS4mIDl/36hpEJsm2GB6QVo34qrUJV303mKMTdc
         orQp8c1aRf9gxW3Ny6CmatKRZA1trH7HO3PslRXg6GWqbozm2bp+ym0/xubxZUb8OIoA
         LKvJyKrNjU1HXW7TzS96qorC4/HVPcj2YTeCEq+PLVlWvr1U/kZv43odk8r0+9sCLHIB
         mPK9/FwiCZQccuQRH5/yJbjP86mSpDvoc6lnJoiPzsDWShLjJPG8IYVODgUm3ovl4aMp
         40eg==
X-Gm-Message-State: AOJu0Yyk8yXbeUjmhX1BEFu6XRk2stnC4u6QBnvmjqmx2t7+GdTPE8Gg
	mT49tsUApsVyfpKtjeXS1F+vQ/RiGCxGc3nOIfL/y6kqGWdR2gHOJdMHnQg7XEhUOnyq+TKrHTq
	y060=
X-Gm-Gg: ASbGnctMu/GERrADdXSkZLQbnyHbaN2uHsK/6y8hS17hFt5KyTbny/S5TfmIX8EJ7Hb
	jvi+hHgx6Lq1qqPdqtW+ZgkNmqEQ14X+aQnvtUad3sAmOaJ7ln6tmMhgPwCtr+ZGw1dOGtFPdxg
	egJFhS4MKezOM+MdbkqJwnDWg6+XGQfhQJ1CYhBqWAlPCjL5eDKZHWOwT69M4oWKguUtjwiiL9d
	Ad2Ym5sorcaT5R2O4aKvUh1GwI4/PEscfEziTM2R84z8BXl1StiUlInIG1HrXQ2Qx31lCo2Uwg4
	q4SOF1pPlPYoIe7NKPt9q6r5H6THhKwA42YsN9gqeSdpOfjTFbaRiEhGddZVQQ3cKU0zwin1PTM
	KF6krRjTzIpTd
X-Google-Smtp-Source: AGHT+IG0u0c/IXGQAKxF96XMJoa8uDQbJuXuOj5glAxbLjbyg7hpDQTZsIHMLKZ6uC2B6qjDfJ5jFQ==
X-Received: by 2002:a5d:5f41:0:b0:391:3150:96fb with SMTP id ffacd0b85a97d-399739c8c85mr4283503f8f.23.1742455018793;
        Thu, 20 Mar 2025 00:16:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm22466021f8f.40.2025.03.20.00.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:16:58 -0700 (PDT)
Message-ID: <02460753-0054-4779-8d4a-c481e905ad2b@linaro.org>
Date: Thu, 20 Mar 2025 08:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hNx8VxmF2+Tf

Hi Alex,

On 19/3/25 19:22, Alex Bennée wrote:
> The current helper.h functions rely on hard coded assumptions about
> target endianess to use the tswap macros. We also end up double
> swapping a bunch of values if the target can run in multiple endianess
> modes. Avoid this by getting the target to pass the endianess and size
> via a MemOp and fixing up appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/gdbstub/registers.h | 30 ++++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c           | 22 ++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
>   create mode 100644 include/gdbstub/registers.h


> +/**
> + * gdb_get_register_value() - get register value for gdb
> + * mo: size and endian MemOp

Since we pass the size, ...

> + * buf: GByteArray to store in target order
> + * val: pointer to value in host order

we don't know the type of the value, ...

> + *
> + * This replaces the previous legacy read functions with a single
> + * function to handle all sizes. Passing @mo allows the target mode to
> + * be taken into account and avoids using hard coded tswap() macros.
> + *
> + * Returns the number of bytes written to the array.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val);

so I'd rather use a 'void *' type here (also const),

int gdb_get_register_value(MemOp op, GByteArray *gbuf, const void *ptr);

...

> +/*
> + * Target helper function to read value into GByteArray, target
> + * supplies the size and target endianess via the MemOp.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val)
> +{

using uint8_t type being one implementation choice for this method:

int gdb_get_register_value(MemOp op, GByteArray *gbuf, const void *ptr)
{
        const uint8_t *buf = ptr;

> +    size_t bytes = memop_size(op);
> +
> +    if (op & MO_BSWAP) {
> +        for ( int i = bytes ; i > 0; i--) {
> +            g_byte_array_append(buf, &val[i - 1], 1);
> +        };
> +    } else {
> +        g_byte_array_append(buf, val, bytes);
> +    }
> +
> +    return bytes;
> +}
