Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp293005njc;
        Fri, 21 Mar 2025 06:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+2kLqvKEz4Qr6P+u2UvTAcr8w5vqEgUbsYMuUuxFsyxSPqvPcA2gS8WCERaQWWMhc615v49Eoc8UNvA==@linaro.org
X-Received: by 2002:a05:600c:4f55:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43d568cdf1bmr7485335e9.3.1742562147092;
        Fri, 21 Mar 2025 06:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742562147; cv=none;
        d=google.com; s=arc-20240605;
        b=c1iUsSHADyxwBmqJ0yUTiWZnyWb+bv/LofejkcFSWMZMSbyua/afhTR2nH+qZpRMWn
         yTYPmESJSSbaXBktDB75uxvz2V9Sbi7FDRT9m2THLhEq3ryC9L+x3JYeXVG2kCcMcd4T
         nhLoUEgGOX9gkTWnKpCHmdO0mFJWP97NIgb3oFmvMJlWdQ+J3R1seIu9CcRMaT670XcJ
         +jkEXiWa0O0/ZiTmNQqPTbRrtpIQ14gt+LivEw3+pQDZhb5HuX32m0iHpCiUkiN9jV2S
         zdUnRo3ribenLu7A0hYKovIZYtX9gvMR7tzAQ8E3hU6V/ZyEHqc0lf9Y9b9EIHNjEmJ/
         kEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rOQY0mwllj5i8RTosE04J3iSbsdpuVSa1ndX5Jja/7U=;
        fh=46GEf6/ina5AVY+UuhiMv3dIQaLVslMePYAsOcxtZl4=;
        b=IYVcQqLeA6cv8shXUMNQx5J3w0F+X3vaipttNfKDsKLDfN4VcA2Gj9xg2GlZQ8rASF
         EQoWxXwrdHvemrZHwDXb78GMhCpjG2KlHKujO3Fx0IxWHkykBn7VGeztq4thVHstDzOZ
         CtOhGAOJ3+vibWjkHe1ycPeufhFL8QLhPgevFWJthQvON9z0xSG7V0sjeCyKFN5PNYTl
         m+0Bbj2lfj86YB1iThsfMXz53cSB24vodxxCh+PLM8GNO0x2xsqK1K6uiiLGbxXEdaef
         Fs5wS1kjAsFAzfUEz0c11frW+HWKORJjDucw3nEZJTN7WzDEfWf8m/lN8mwiJd+QPsxU
         6DlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyxCVk4Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4fca8d3bsor9544185e9.3.2025.03.21.06.02.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 06:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyxCVk4Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742562146; x=1743166946; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOQY0mwllj5i8RTosE04J3iSbsdpuVSa1ndX5Jja/7U=;
        b=fyxCVk4ZvnND/lKENt5Yx5nh43WuyDOQY+VlCLOWBtNEt+DKX3K7No0/EShV9S+aeU
         087rW0kl+VEoaHjeZhthU3+P0X32wD9S22eB3qCp33rrkmiiGSkFp37lHlG+bWaLkRyz
         v9IphAwujIDKbfeWABwghEVAbQLtf93yQPTugtEJ3WspQ9Ouna/mPKrRDhfgb+ZpO5Td
         jNdyNqCie0S38ji4eQT8iYSEfriqEQjgA3MH6Cd97ynfSXIQrCyEWwrRQu9bHz7kZRNb
         W6ej7TdvJglsDnlu3aIJj+sI5MCTNxTIN0AKt15y6yVGw+BkZoAghBpQltHbYp7yomUU
         9gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562146; x=1743166946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOQY0mwllj5i8RTosE04J3iSbsdpuVSa1ndX5Jja/7U=;
        b=qzm6vMHbceMCWv/63WDSccIgvzo3DuiWrZUmZCt3W60Rjr4cfzJ1HBGXvCM/4XSXqf
         fXrzq0gccPUeMuY4pxRANCCjaf0ZDGyzAbLlGdt8m5TNno4sprqdTdScHQqjAZXw5NLC
         gY4vBTetc3FyPj2hOXmJ+pSgiF2LhV25tIpoXcsro0YYlCxq6OiOAjnOPm1UQdy7P2mm
         F+UColo4IjoUbx/WL38STHZHVPauWzJ7RdZFP9CdS5sZrbHIH1l3iiNadKSLVbm2WNx2
         30rjLRPbnVq7dC7ynbdnrSZ+MwbolYaXcmrLv0XJoK7DffZr6kJl03rBNKJi4Jk23CUG
         6fOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKWNQT0WbwLHK/ky3zF4zABKieeSGSm4Zyk4E0VkFcuGwfJHif6ngHBhNngOfs0LBws9ySXHi9+2LlaQ==@linaro.org
X-Gm-Message-State: AOJu0YxWDD2KFYop9dfE6qtCDYQOXVn/H5MXMs1H90oapDmck/I9lhkH
	4djmTAGHXy+qs7dBNl50/2t5Nua57xM498aCeKV0Xy6qBGoQoLN7WznYmb2+51u3wQ==
X-Gm-Gg: ASbGnctSIgEa1IIJ5YIvA9wCcqjtK9e3C5yyoGcUPOfbEjUzyxJxTSh/08df4cmfGRZ
	A8kxcGoJOP7s93EbEMglyQE5XOODOaJ28uOvmC7kAcPEuTqKSyrw7kv1Ck2UWGfiPbDnAPL/NAN
	acmB9MfxiHLY5Op/VNZM349/sJY3oLasCgGxQuQ4Pe751GYUX1cH6PTtIPZdKZ7ktL9caCNIn+T
	t8vySoFVVQR4ShpSDpgme+Rkh3UJzqxdW+Y1gg759IvuF/0h8wTga72BzTZ3F0j/iWMxNzDHeJu
	vWd7N53YWIkBdOkDPH3CM23i8l9wFhFq3/rFppFuJFE60sd3XRX3nTPHM+FmtddpGVV5p4GIm/8
	NinTqAgpxbEYont4H+37vu+g=
X-Google-Smtp-Source: AGHT+IHnk77zwPbsxTNTKPiSccs0oz5sqwsmlcTJCpwZ02ySfHzpG4jf+yPpGjlvs6SYd/LBarHIDw==
X-Received: by 2002:a05:600c:6006:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43d555b4613mr9689385e9.9.1742562146390;
        Fri, 21 Mar 2025 06:02:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm79351205e9.40.2025.03.21.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 06:02:25 -0700 (PDT)
Message-ID: <fd9ecec4-cfa9-4605-aa14-264284f6afb6@linaro.org>
Date: Fri, 21 Mar 2025 14:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
 <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
 <7444c007-d8f1-4c55-ab4a-15becdf1c932@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7444c007-d8f1-4c55-ab4a-15becdf1c932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wGzp3By5qWGX

On 20/3/25 21:16, Pierrick Bouvier wrote:
> On 3/20/25 12:52, Pierrick Bouvier wrote:
>> On 3/19/25 11:22, Alex Bennée wrote:
>>> The aim of this work is to get rid of the endian aware helpers in
>>> gdbstub/helpers.h which due to their use of tswap() mean target
>>> gdbstubs need to be built multiple times. While this series doesn't
>>> actually build each stub once it introduces a new helper -
>>> gdb_get_register_value() which takes a MemOp which can describe the
>>> current endian state of the system. This will be a lot easier to
>>> dynamically feed from a helper function.
>>>
>>> The most complex example is PPC which has a helper called
>>> ppc_maybe_bswap_register() which was doing this.
>>>
>>> This is still an RFC so I'm interested in feedback:
>>>
>>>     - is the API sane
>>>     - can we avoid lots of (uint8_t *) casting?
>>
>> Even though the series has a good intent, the fact we make everything
>> "generic" makes that we lose all guarantees we could get by relying on
>> static typing, and that we had possibility of mistakes when passing size
>> (which happened in patch 4 if I'm correct). And explicit casting comes
>> as a *strong* warning about that.
>>
>> By patch 7, I was really feeling it's not a win vs explicit functions
>> per size.
>>
>> If the goal of the series is to get rid of endian aware helpers, well,
>> this can be fixed in the helpers themselves, without needing to
>> introduce a "generic" size helper. Maybe we are trying to solve two
>> different problems here?
>>
>>>     - should we have a reverse helper for setting registers
>>>
>>> If this seems like the right approach I can have a go at more of the
>>> frontends later.
>>>
> 
> Looking at include/gdbstub/helpers.h, gdb_get_reg128 can be solved by 
> using target_words_bigendian() instead of TARGET_BIG_ENDIAN, which is 
> already what tswap primitives are doing.

We'll need to eventually remove target_words_bigendian(), so that'd just
be postponing that.
