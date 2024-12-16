Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2446989njb;
        Mon, 16 Dec 2024 11:50:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwPXhNR0xl+RHw2acUf3BHKTVucPfcP9ATYb39EEOgL02g4NF6GvnpvNmvRsceHWL314DrTf1Kals6Ew==@linaro.org
X-Received: by 2002:a05:6808:14d2:b0:3eb:4681:a895 with SMTP id 5614622812f47-3ebcb274165mr38026b6e.7.1734378634342;
        Mon, 16 Dec 2024 11:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734378634; cv=none;
        d=google.com; s=arc-20240605;
        b=aRfHfezVL7afEWpauCTTAK6yHa4DvUYj0WA9/RxzOzFO8UjMAiTP55VHgUfjzqmhCv
         SBCbqFAHc5++46KKoQQR0Scp1CKc1Mf/rQWU+MepLRw7bYG/0/CO7CNvqNL+yqfDMMRz
         PYN8FD8/ORmG3R4LqH0KCAa+kj34lhqB642w1f+as1NT7lKIEhMT+CInYJhBX/BqZrPi
         T2Xdrh5zLvb5CB14K9I7IExheVgxfL0vxLHo5YvJ1CeCtYoVj/l7T6mNaQiUgdS6TSzL
         NkBSHbcPLFkmxi1Gb6OxbJ0lew/RPx/rtLMnMN4abdEmdY5PNjB1tUbeOn3f9l9EWlx9
         LdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fejvPhzi5X4SqyXtznRZBlck6serC3lB1rcPiv5G7l4=;
        fh=Wr2eHWbGA/GZ2zdIFs/ydrA87OSQQIqK095yp7JJqs4=;
        b=A9lKoOugTT5hE66FqWEn4mC58tXftw4St0UUWvZWo052XAvTOpQbS7PFL1m7hH5h4X
         W3x85h8jSZeVo3qgxI0yQXnK+V+MRu5y3TRRAefYFyq9BEBF/Bf34WrPyJvb70lf3XOv
         P7gmH6ndp68P8MxFtNDOrJFwwLcN+UpqCWkWpHJn+/w+ZN0dRuKipHzfPJQ9l38rreJq
         jP/V84ygRNs2pF8WiTuUjjcfewITJG4Tw7EIyY/KEXOLQXixy1MH45Q6NlgCW4V4curl
         yusoeDW3cPQ89ut8YnQ1PRltcFUrj7UbR6tQf5KAICNx0Ke6Tr/Yy3XviXFVR3QzMIBc
         LLCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdsN7lOB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 006d021491bc7-5f33a6a7b4asor1481393eaf.1.2024.12.16.11.50.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 11:50:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdsN7lOB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734378634; x=1734983434; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fejvPhzi5X4SqyXtznRZBlck6serC3lB1rcPiv5G7l4=;
        b=VdsN7lOBLe/XNskAxWhJ89vcOax43A696i6ZiHC+eYB3tbcZjoQCCGqkc8ywnBtDiC
         7+z5eoACu/00XhDeshiZgy0/GxNpiNXdTacjzpqwTJaL2EZD9GX0xLGUuL+iHaWP3vXj
         EICkBVqrs8y1RVDsYydb3sUDcKAxo5x26rrFxxD3xfhQqYAbsratm/rJzPluE25w6Xfy
         s39Tg1F2VNIePDTGmszvajOizWzMLwNQtQNZlLuX5F5kCUBpZHKgq69EwsFjSzVT3TMf
         ZiD3HsSn6TmSPHQ0dYfDQsRDdNmkHotno9c3d4dAluFN7+umJIoTm+4ptPxd9C4dyyes
         K+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734378634; x=1734983434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fejvPhzi5X4SqyXtznRZBlck6serC3lB1rcPiv5G7l4=;
        b=Z74qr23LbsFmH/lIR9nV5p+8v7CMBmZbz2L4U55JsFqL8EPIuF7nuLFCpOYsfF8Ra+
         0ou2rRxg/PD715wQm+5oO0GSrt5QVR/bGi4nL0jMRkN7hxFxhujThKr1YNjKJ890sNnj
         96N4PJ/ueGyvn1OY7FtWjY6N9ssheU3LwbksLRZPnzr3iBwBWbr+nxYJztTLPG4++aN8
         MBRZNpSmXrlhoPm/ylW8DTeDkwsareieoiEwRAoybhQLgWWIFl83pvpg8hJGJrRxPirb
         y6ffqN+n4wz62jhmGKA4YaF21Ne68z2keKgXXX64EMdmLR48WLLpYSqh6Qma7B1pGvCJ
         tYqA==
X-Forwarded-Encrypted: i=1; AJvYcCXv6ZPyM39Yk8lNlj28Gc3hL730pyvaCLi5IjDE4nbX/0SI+OhoqsiXJV+fx78YdSKPBk5eVB89gd8U/Q==@linaro.org
X-Gm-Message-State: AOJu0YyT2q6ewcfIMCJ8C3JGO+edA7yzsC55rmV0OpugQKbslE4+AM2f
	/WgwT3AEZmdJ9c+ZmbmNUX7QwSg2zM9JVq1Bj1/JAAaVGu48WQzMFjW8tU+0wH/BRQ==
X-Gm-Gg: ASbGncspgu/DdMXTvnd80BG4mo9+Qh3uT+kHS6rwWF7RIarLzYVzS47Xg6qCXNVfERo
	WH7K2VKsD2COpwERlff+HFRo/nqukfvfSS9iSRM+OAj+FKoR9OZx71fwSxFuoDq5xf55N8RoE+G
	V6Kk8TMl8jlcpHbsJF59chYt0UgY9G/leezOOeu99E+KH+9k24f4VOBmqJcphoiPlceIE+5dT4X
	QYU3sCNUBtWdurUOSsUTdoSH5JfaaMpzopNgMtTjG9eUsIArEKZseoFBvIrz4Za+2g4QtQXdRbX
	tHQJRK7DgmztGVz6telFFYjgzxNZ7mN5Feo=
X-Google-Smtp-Source: AGHT+IHVCEq+SvfI5ngEqj5HwAyKrTumqaUWoDFddPCgD2SY4JpDd0ZlOrNn+3r6erBYyXRfe16WEg==
X-Received: by 2002:a05:6820:1895:b0:5eb:b282:5916 with SMTP id 006d021491bc7-5f32950f02cmr8517471eaf.7.1734378633915;
        Mon, 16 Dec 2024 11:50:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71e484cfed1sm1584063a34.61.2024.12.16.11.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:50:33 -0800 (PST)
Message-ID: <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
Date: Mon, 16 Dec 2024 13:50:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
 <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UdYNrC3rv/u0

On 12/16/24 13:26, Pierrick Bouvier wrote:
> On 12/16/24 11:10, Richard Henderson wrote:
>> On 12/4/24 15:12, Pierrick Bouvier wrote:
>>> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
>>> spent up to 50% of the emulation time running it (when using TCG).
>>>
>>> Switching to pauth-impdef=on is often given as a solution to speed up execution.
>>> Thus we talked about making it the new default.
>>>
>>> The first patch introduce a new property (pauth-qarma5) to allow to select
>>> current default algorithm.
>>> The second one change the default.
>>>
>>> Pierrick Bouvier (2):
>>>     target/arm: add new property to select pauth-qarma5
>>>     target/arm: change default pauth algorithm to impdef
>>>
>>>    docs/system/arm/cpu-features.rst |  7 +++++--
>>>    docs/system/introduction.rst     |  2 +-
>>>    target/arm/cpu.h                 |  1 +
>>>    target/arm/arm-qmp-cmds.c        |  2 +-
>>>    target/arm/cpu64.c               | 30 +++++++++++++++++++-----------
>>>    tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
>>>    6 files changed, 38 insertions(+), 19 deletions(-)
>>>
>>
>> I understand the motivation, but as-is this will break migration.
>>
>> I think this will need to be versioned somehow, but the only thing that really gets
>> versioned are the boards, and I'm not sure how to link that to the instantiated cpu.
>>
> 
>  From what I understood, and I may be wrong, the use case to migrate (tcg) vm with cpu max 
> between QEMU versions is *not* supported, as we can't guarantee which features are present 
> or not.
This doesn't affect only -cpu max, but anything using aarch64_add_pauth_properties(): 
neoverse-n1, neoverse-n2, cortex-a710.


r~
