Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp798704lfy;
        Wed, 5 Aug 2020 10:00:53 -0700 (PDT)
X-Received: by 2002:a17:90a:f8b:: with SMTP id 11mr4255114pjz.29.1596646853452;
        Wed, 05 Aug 2020 10:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596646853; cv=none;
        d=google.com; s=arc-20160816;
        b=02/Xxfsf/3Sc8bDb4Px6pXDMHlWQvJcTFOjW4SzYH2jxKNWEHmSqxakf4sEgLPLqxs
         96YnmQrbaBpcJ+pC2issMTCE1m4BdxR7eFbgzrW8v5sQ0TikX6IzfpZgVIanV8SyqeM6
         9b14qhTBiep0GWmb3PTrwCLHbWeYWQ3/PKu/5THkxK/JA9c0snTBmg7GVjyA0GnR5RQC
         0pA2VHpkr08tSqlreRfUjhtbR3zGxZ8XwtQIyI3YCxCtRpsgjdi2O2lvpPapT0Tkkxxs
         6wLKfs88ijneNuwqqqK9iNgcNa9fm7kKnSgpuZXySnixLqKYPr1HC/jk3IdbZ/0+dVvR
         NXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=osJ2w+V9cZlk83KQovNCzTBOfhPvNCOTBe1WQBXex7o=;
        b=aixgAsvRINz1fPefAbYmkvXt3DsYlov22+n3W1SC9bnWYk5IRK0QY9MfBRdt+Co8c2
         ZjEOXmVvoR0piow8CyU+XxTvZnIHti3fHdx1lKK/NVaoDDZdEJ3zi9gmAhKFSLyaQ76L
         YoieqP/ubkNMDcMGJDq4OwgjTX8nHV02E+K6LQ3MOQM2mx31WaBvT8AJcDxr0QFz0yGr
         wXT9Qnz2ucf36tC/Y/IFSVkDzbdyblcy2Qgt6Jt25l4JuWeVgdjEXi+gC8sNsEBTutKS
         Jdtcm9o4HPNfNrG75O30manlKra7/KeXIFMUQL0ko+Bi5UZArjG3/tOJhaDNf63vZre7
         TWSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJWu+y9m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u187sor3272815pfu.82.2020.08.05.10.00.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 10:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJWu+y9m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=osJ2w+V9cZlk83KQovNCzTBOfhPvNCOTBe1WQBXex7o=;
        b=QJWu+y9m3V7SE1wNRsLdIEHCSbwHUOmovMOGk1xgsWBXwXlPgNp01Ck0/Pp3BF/1rT
         Rz1Aifm3/6rwqZn2vnRm2nbceCH/lSZqgTJmm6q8sOiRvYFIBiKyqUliTgV9hb6M4atE
         oAfZQ+1nMnZgGX1fC01D+kM4GaPWR1fxvwhqcX/otcGYmda6FriZLedzij5P8UY3CzjA
         zceJHJedwakQbyz6+iA7c5gcngg5swvVpRRRakOXKXtiZEijoFUrJVjYIS6WJMxxEtJM
         fDzgcpFFHPA87G8BHm3GdQ8mIwXs4ZRO7DPTFE3IdVBCzi5c5DBo/DQF8g9ieWNMHdoJ
         sRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=osJ2w+V9cZlk83KQovNCzTBOfhPvNCOTBe1WQBXex7o=;
        b=BeHEORTNhr9D5qliUOPfEythxbu85AipMNlRLfvjPSN1pdOJz0JzLgo3PFA6Bv6NrM
         nKCDJ4v5JMPVz0SicBb6Iimk3zsZjQ7QcDSVRwiDfmIgwzKONpf5Nmr6SxQ1okZhUJ4u
         7XMkLU0dB5CURzc5M7Kk5FD345PE7ERMAdXgw5EG4fxO6IM6uxf7DptXWl5XcukK3Svr
         tUx3Uw5N3hcyLlC3ZcE5YYOULL/lQXjb3ldaPgqEm5gYm9DzpyzQqGjysn+oQThvR141
         DU66rL9KQDLA57+VioWM0YRnV+WhJyJ+G5WtyvW3cGeJgULlqviUEJ0BYiU51JBjh+s/
         SD5Q==
X-Gm-Message-State: AOAM533qrT4vugxAQ9ValVKuycxieBneOisXlA9/BJn65QStYEt9haxI
	+aZ7RHnNnl+Bf6c/62/l1Nv1wc43
X-Google-Smtp-Source: ABdhPJzQJ/EEfJRsmkRFPU+9t4B/n7GFyI6EDFDgoU+ZATPvv8T+BiowXtEPbDo9LUMhJ2p2XFDcgg==
X-Received: by 2002:a62:1c0f:: with SMTP id c15mr4114148pfc.235.1596646852800;
        Wed, 05 Aug 2020 10:00:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id 193sm4022388pfu.169.2020.08.05.10.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 10:00:52 -0700 (PDT)
Subject: Re: v8.1M cpu emulation and target-arm feature-identification
 strategy
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org> <87tuxhkpo2.fsf@linaro.org>
 <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
Date: Wed, 5 Aug 2020 10:00:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 48P39TQdiOND

On 8/5/20 9:52 AM, Peter Maydell wrote:
> On Wed, 5 Aug 2020 at 17:45, Alex Bennée <alex.bennee@linaro.org> wrote:
>> I wouldn't test other feature bits but what stopping us adding:
>>
>>     struct ARMISARegisters {
>>         uint32_t id_isar0;
>>         ...
>>         uint64_t id_aa64dfr1;
>>         /*
>>          * The following are synthetic flags for features not exposed to
>>          * the directly exposed to the guest but needed by QEMU's
>>          * feature detection.
>>          */
>>         bool v81m_lob;
>>     } isar;
> 
> Nothing, except we already have a set of synthetic flags, that's
> what the ARM_FEATURE_* are...
> 
>> That said we still seem to have a number of ARM_FEATURE flags, are we
>> hoping they all go away eventually?
> 
> I think that they're a mixed bag. Some represent cleanups we
> haven't got round to doing yet (eg ARM_FEATURE_NEON, which would
> be a fair chunk of work, or ARM_FEATURE_PXN which would be pretty
> trivial to change to looking at ID_MMFR0.VMSA >=4). Some are
> features that pre-date the ID feature bit scheme and so might
> be awkward to convert (eg ARM_FEATURE_XSCALE). One or two
> we've already converted and just forgot to take out of the
> enum (eg ARM_FEATURE_CRC)...

I've always assumed we'd never get rid of all of them.

Older ones like XSCALE are obvious, but I don't think there's a clear indicator
for V{5,6,7,8} either.


r~
