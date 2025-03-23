Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1465630njc;
        Sun, 23 Mar 2025 08:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4XprYdXHWEhFR6pQdCX2vyEEBW3SgmOeZbB9S10P6wTyh56VbJ4nwP+yMZAM1v46kzWjzrX635rRmvQ==@linaro.org
X-Received: by 2002:a05:600c:1909:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d50a213f6mr95903485e9.22.1742744493812;
        Sun, 23 Mar 2025 08:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742744493; cv=none;
        d=google.com; s=arc-20240605;
        b=fOnf+eUAMyNhVUbxOFzNB9RrR1/RWIJLOJJjll5p5btCrIrJI/uN+TfVoDNK4jO/y4
         XGVuaPeItwdCSpEhYIML5UQdWY/nxAMBvxZbVa6rQWQArNKgLYNq9FOXgKjUxUQAS6Q2
         ZqgwgxEOPXqan80lrl+7LtsRw4ybZRtx0w4AtBP2KKYMURiE3q94yIrAFItNYVIZJRVi
         olTK1wOlOB9K037BPXLa2t1nvIp7T6FWRRyObbElKNznSEltw/+XCYVgmlCvdHs7Kz6M
         jSmkUeTGkyYrr4NE+aXNI5hmoTcmbCU5wUFNE/KPUeyP9ulDxz1CxQZWcmRrg/azQDpi
         WleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=j//WT3tUMHrDI7HP9P/g3xp/xK5prE+gy76j+wGNdVM=;
        fh=xvc5foPn2ijIOc8CRT//n3Wms+jM+p8hFTXGdfqXft8=;
        b=Qhrh1foCLsQdaOuFYYOGuvuLpJQDeNJmYsV4sZQMP1oetxEuAneWpXlwkXJYtuDwV+
         AJh38OVGsA48gNKmC42TpulDlth97hrsIfTjZxbDjyLCzBG2PTGHptqwsJgKsL666gh2
         gGEkQOa7ZSfcAaEgucjkjy/qCvls5Zw+V4+UskKub/Xo628AJy4Q7t+SCCw9BAC2tUPa
         y9MkLC/taDzv/W6N2NJPpDGp7S4C1AKbLGIJ8lSSAJnDHDkTlT5iWWizDOzJS0DNc3UI
         iuLbxIC5iGIpiqURUeuOzW6O8HwJGf2LW245/tyr08zucYmopbRB85gKSRHtF915rY1O
         x9DQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCdlS6A3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4fd35f84sor19643315e9.4.2025.03.23.08.41.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 08:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PCdlS6A3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742744493; x=1743349293; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j//WT3tUMHrDI7HP9P/g3xp/xK5prE+gy76j+wGNdVM=;
        b=PCdlS6A3FNBnUwR5JueDmYPlLXmeoZKN+h1nftMDXrIhhj49lU0qKAwVM72VHHaZa+
         lp151Txc8GDkKWaARTzM6UQXUZW+Noq22Lgght6LI48LPBdpagh9Q7ENRgKz2XsTpNFy
         ZOKUNggYhToVbRH7cqxP3IaC8y/YWlG3JTPkBM2bTgx4MYHcA9Uq01EmjLsnKkNynHsR
         atWcUmOoihNoKPvBwhmOLTkv0IwxFPrMDyDHrZ+NMKkafGctgkBDfE7iiICCOSXdbQT7
         IkIed5qwYypH+aGL/PGm0g5n5qH42OoNASUTYHN2ABOnXssxkARSMzLrzz6T1je/MzGK
         Ozhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742744493; x=1743349293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j//WT3tUMHrDI7HP9P/g3xp/xK5prE+gy76j+wGNdVM=;
        b=lm6Cmu2W+rTF6DVndzv4WrtnEEzc3+VeLlXAdhgdMNu6MxmbOwnCVrV3gO8L8O2yB7
         w3UDirXxDU/04Qi9z1cwPqQcTtThHe+oCao+nfAtsyUMWjmQDdfRahetqEjdLK8WBX/f
         BQNsgkryV0Sdlq3R6uNwv0wTYUuhBirVN7QlFF5ld/bOTHE7bEJVSVGqDbsYUskJLj9A
         ts8Nyskok9QbFsEwIApbjrO+6Ab+U82/tZhwCDvLGtsF6kKOa308xjE1eBhlIM1sJSu9
         WcRPC9FOM1rs2yDQc9VQNoCQ/GJBWHRzOHykbAB8C/xKRrUh3DlqsaNsOCD+LJ6NcU8+
         pB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3bmpSa9v5zN1B8ETCJdyNN0SOHX5y56uRr5BCGeEvuTuQBSPeSNXADUmqZ0e72AYU7OYEfLfrKhvzuw==@linaro.org
X-Gm-Message-State: AOJu0Yyw8kNGyiY/0X2Wi5rEAtextBOY/HSN576j12k1zJOomT162fIv
	KWBEUCccRgISO9+RB2PkTHTmKw66fwIazIdZU9rOVcOiof+UhZSpoKA09VM9Ap94xVkOCG4sPxc
	G9Qw=
X-Gm-Gg: ASbGnct12PpzMo4e/000GA+psP6RWErmKZAwnGse/+Dht+PxvWVKKjtseoWTJYyDk0d
	AEPwhUVshpAzsVaSL5Mg6zmXaDyx7tj4+A19csAXPae0NvuL7DvPBFhGE+ez9+HkRvBtTECzkYR
	FIlg5+LA6yT39FanSwL/gyVIP3KijlbIULjQfv16N4QX4u7fBwxt3quIzNvmFI7EImrqLu5PQtP
	xSqtiA0h2axORqZHHoVnhY/SLZIvb9FRGium3lGRV+7HFAu/XHP2V6DsDVuauLf0jPQcdlRxUzS
	4+MAOZemHpDo3B+LLqLNUVWSItCQZZQmtPq5LOX2JIdAKyNwgPGFixIaH7ilyROzHasqbnzP+cy
	AxK1k/ZZbhAEu
X-Google-Smtp-Source: AGHT+IF/BqylgXOBvcV+VTVnzR5rNNdoUBGNOXgHZpFmstBC0iMO4fcevnjQX9yPi/sfFxH9eRtYCg==
X-Received: by 2002:a5d:64a5:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3997f8fecf8mr11296713f8f.16.1742744493125;
        Sun, 23 Mar 2025 08:41:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b4ce9sm8179246f8f.53.2025.03.23.08.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 08:41:32 -0700 (PDT)
Message-ID: <8b8bf1e1-ebcb-4779-ab09-c208da910630@linaro.org>
Date: Sun, 23 Mar 2025 16:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
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
 <87a59eli7m.fsf@draig.linaro.org>
 <3e1c7b60-18cf-4ca6-b853-02203954fc3a@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3e1c7b60-18cf-4ca6-b853-02203954fc3a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H8JWcqK/G06z

On 21/3/25 18:31, Pierrick Bouvier wrote:
> On 3/21/25 04:46, Alex Bennée wrote:
>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>
>>> On 3/19/25 11:22, Alex Bennée wrote:
>>>> The aim of this work is to get rid of the endian aware helpers in
>>>> gdbstub/helpers.h which due to their use of tswap() mean target
>>>> gdbstubs need to be built multiple times. While this series doesn't
>>>> actually build each stub once it introduces a new helper -
>>>> gdb_get_register_value() which takes a MemOp which can describe the
>>>> current endian state of the system. This will be a lot easier to
>>>> dynamically feed from a helper function.
>>>> The most complex example is PPC which has a helper called
>>>> ppc_maybe_bswap_register() which was doing this.
>>>> This is still an RFC so I'm interested in feedback:
>>>>     - is the API sane
>>>>     - can we avoid lots of (uint8_t *) casting?
>>>
>>> Even though the series has a good intent, the fact we make everything
>>> "generic" makes that we lose all guarantees we could get by relying on
>>> static typing, and that we had possibility of mistakes when passing
>>> size (which happened in patch 4 if I'm correct). And explicit casting
>>> comes as a *strong* warning about that.
>>>
>>> By patch 7, I was really feeling it's not a win vs explicit functions
>>> per size.
>>>
>>> If the goal of the series is to get rid of endian aware helpers, well,
>>> this can be fixed in the helpers themselves, without needing to
>>> introduce a "generic" size helper. Maybe we are trying to solve two
>>> different problems here?
>>
>> It did seem natural that if you were defining a MemOp you would use all
>> of it rather than only its endian definition. But you are right we could
>> introduce the same helpers with a bool flag for endianess.
>>
> 
> Defining MemOp and passing is ok, but loosing static typing guarantees 
> is wrong in my opinion. C is already on the weak side regarding typing, 
> we don't need to "void*"ize things more instead of replacing the calls 
> with correct variants.
> 
>> Maybe we should have fully formed mops and just assert in the helper:
>>
>>    gdb_get_reg32(MemOp op, GByteArray *buf, uint32_t val) {
>>        g_assert(op & MO_SIZE == MO_32);
>>        gdb_get_register_value(op, buf, &val);
>>    }
>>
>> I was also trying to avoid over boilerplating the code.
>>
> 
> Adding proper functions definition instead of macros, and eliminating 
> ifdefs is not really boilerplate.

In another thread Richard said for these cases we should use _Generic()
more.

> Adding casts to loosen type system is not a win versus that.

Agreed.
