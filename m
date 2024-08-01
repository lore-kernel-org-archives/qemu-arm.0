Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp909149njb;
        Thu, 1 Aug 2024 05:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh1vrQ/AkJfzSydlzZ9Vm7RHa8HO7mCnhD5yBeU4NVAr+xdQvymKpfrly8ez/ClDT7FXQGS00oO6UlIjGqAomnwvUsr9jM
X-Received: by 2002:a05:600c:510e:b0:426:5fa7:b495 with SMTP id 5b1f17b1804b1-428e4775e91mr12686805e9.15.1722517050109;
        Thu, 01 Aug 2024 05:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722517050; cv=none;
        d=google.com; s=arc-20160816;
        b=u6CTqKAnQSa+uJ2fil7+68FxA0u9geFExPHdwI3a+yo4NaRZmiXocdPCJJ36EeezRN
         p4y4VFNofpnhdloOto6Drgu3mJyGZVRkfCQHwa/9V4Dr6gCCGMueUgjvIGEpdTb4P/55
         j75VnQPwkYcw27e1yBsYKnYZLzbZld7NXzpkPd5cflpvmSNP6JS3vWqhy1M95C0YaKuU
         BDK+ss+TMMu/oa0NkTIhDRNp+3E3kZwzYnCkmjsCYs2AyyKo8X1nI48TtZLXp2HLnqH9
         wD+tRdeCnR4K07/cYeykYEwkimkgUuxCajTM+8WSM+6mjf+DDT/SWhwyGx1y8e6iRiWC
         aisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W9BTOh2poU6JigM03HRrC0PUte6Uu+QGv/OjvnAPoog=;
        fh=uZ1FFImqyZpTcBYpwLF6dA0geM9alwcfmppstSG5BDA=;
        b=xx51OWvoTvmdhHLccAo+BCZhJfCPP9aauwx3cM4WucMO9qgn1LUsGKmK64WDaCB2JT
         AT6u6LPS2qgZSsnRZGx4hy9ZEkJGnCqFMyKoQuPIkMz4D9Zz+omAszirirmTvStPRGh8
         ttJIRWdUBfZ5dkqupZbjopqRZ3f/HbfBFPG88Ue7ugs1Z1NFYobKdDznfKiqp+CJTmCO
         4UldPdB1M/nhATWwubYCGFJ183Fw3PzRDjW8/jRiWTgjzQm7SGx+aBrqdXfi3tU39Bty
         jSDVFfvrrkwp7P72dPLCPIx3+bZkwokdnkZbc48Rku3GHrVlNMbXIMoJ3FcqN+aOj2e4
         078w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SelJWOWi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36ba095d4c3sor1046136f8f.2.2024.08.01.05.57.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2024 05:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SelJWOWi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722517049; x=1723121849; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9BTOh2poU6JigM03HRrC0PUte6Uu+QGv/OjvnAPoog=;
        b=SelJWOWixmlq7+vHPZExapvfrKFGmUAAGcAeeEC/8ht4yV0CcwdkOCHOtKS04cz538
         rLo7S5xQFH3DqiCvIt15aLe6Jd9VniQB6MIINzTQds4J0mt20i5I31AK5qDpdYwRvmv4
         23Nkl4KPBj88qHaWx9+2ACqXG5HKAFXB2Pt7oWa3UDbHCUlCP+27hkVLVRsMJLib7tlW
         YdaVhkjPGundxrUoJyYPtVt4inyFD7D/IEoTBtkPfUxH3LdiZaNCjkBCTvy6t+yLpLad
         mCR4E5CPxXi/z1R9mefGyOCyRF5rxA7eGedAGpPCrH5t9vGsfFf8K+9i5QqkIXeasaMn
         SJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517049; x=1723121849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9BTOh2poU6JigM03HRrC0PUte6Uu+QGv/OjvnAPoog=;
        b=NgM8P1vfOGjo08vxggF4SaUi+NMnNRosXz+uHMRuja8c20LB+USkTf+ZnKCSp3Odjh
         0q87n/Rih0LXu/SW1CzqtWDnJXYH4n8M3G6e+5CBoVZFFP/NrykM/e4hd89nQpjjmg3/
         DYDWSdpyR3jojIOuw/vyiunjbbsE8AcSO8+S79PNKd76uTrwB+vwJXuzskm7N+bh3+Y3
         +WzQwTJr65CvrLwFSTcJu/VglaBDy1H82kPn27vdhwPxIRy+BLclYQ8wrhDrtcjDXluw
         6P7GWrkOZcjjT+c/FTmyXVUukpLIXBlAXDclNmdwJinfEzrXbIvM9ZIS9mzeOlJpmRkq
         CIOw==
X-Forwarded-Encrypted: i=1; AJvYcCWkAcaFlwQwEiQQde8UMtB5QoTW8zaqBdXd8JjF1iMqedyJvxpzYoMPXJbHe4U/oSRpxRELfx3ZohtGumyzXFdrYw/ljn8V
X-Gm-Message-State: AOJu0YwQR2YZGChOa7SVYxAEK7lnR4V4tybVL6YdYTbjAG2FFMMF3XJd
	tsE7ZqFOtGDoM61lUbkZCO1LNtWhBGapH++AMVKyIWmOQne9KUEreGvXXfyFYcXvDg==
X-Google-Smtp-Source: AGHT+IFff809S2Cleb/DVo+qwAck9cEgo3thORGHzF3ijxw5uiish8tFPFDDeHTT4mwpcGte0MOZtw==
X-Received: by 2002:a5d:6509:0:b0:362:4679:b5a with SMTP id ffacd0b85a97d-36bb35c1044mr1423393f8f.16.1722517049398;
        Thu, 01 Aug 2024 05:57:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.130.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d95dfsm19358613f8f.35.2024.08.01.05.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 05:57:28 -0700 (PDT)
Message-ID: <a3b0ebf6-47ca-4aad-9489-16458ffd6ff3@linaro.org>
Date: Thu, 1 Aug 2024 14:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] tests/avocado/kvm_xen_guest.py: cope with asset RW
 requirements
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-7-crosa@redhat.com>
 <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org>
 <CA+bd_6K5S9yrD6hsBsTmW4+eJpPsquE8Ud9eHZzptUwDrHcpeQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+bd_6K5S9yrD6hsBsTmW4+eJpPsquE8Ud9eHZzptUwDrHcpeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: myaQFZie080q

On 1/8/24 05:30, Cleber Rosa wrote:
> On Mon, Dec 11, 2023 at 11:32 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 8/12/23 20:09, Cleber Rosa wrote:
>>> Some of these tests actually require the root filesystem image,
>>> obtained through Avocado's asset feature and kept in a common cache
>>> location, to be writable.
>>>
>>> This makes a distinction between the tests that actually have this
>>> requirement and those who don't.  The goal is to be as safe as
>>> possible, avoiding causing cache misses (because the assets get
>>> modified and thus need to be dowloaded again) while avoid copying the
>>> root filesystem backing file whenever possible.
>>
>> Having cache assets modified is a design issue. We should assume
>> the cache directory as read-only.
>>
> 
> I agree those files should not be modified, but I wonder if you
> thought about any solution to this? Given that the same user writes
> (downloads) those files, do you think setting file permissions between
> the download and the use of the files should be done?

We want to share a cachedir on development hosts with multiple
developers. OK to alter a downloaded file before adding it to
the cache; but then once a file is added/hashed it shouldn't be
modified IMO.

So far this directory is group=RW but we like the ability to track
a read-only directory (like owned by a particular user) and adding
missing assets to current user cachedir, to avoid duplication of
files and waste of network transfer.

> That can make the management of the cache (such as pruning it) either
> require undoing the restriction or being done by a super user.
> 
> Anyway, just curious.
> 
> Regards,
> - Cleber.
> 
