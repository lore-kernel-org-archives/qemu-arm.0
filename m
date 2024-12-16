Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2434967njb;
        Mon, 16 Dec 2024 11:26:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVL5JU6dJkyDVQsLt8Ba4FCyCM+4VI6UG0woTBaQUsuBFwtO31MIgiWBbib636HWGizLPwX/RNX7UxTUA==@linaro.org
X-Received: by 2002:a05:6a00:181b:b0:729:597:4fa9 with SMTP id d2e1a72fcca58-7290c27c79amr19904846b3a.22.1734377209259;
        Mon, 16 Dec 2024 11:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734377209; cv=none;
        d=google.com; s=arc-20240605;
        b=fsRMif8EFYofTKQ7L7kXGDhrjPe3E/41MlInoD5RCoh0mhnhbU5pEY0qS9/UQwDW8C
         BBElYGVEv4M6sUcIYZeQYMWtwMQiSUCQh+DLoYk/hp6cqe68mKNFXDD4zw76Rpb7vvoG
         yHqErM89MnDgY7z2QbsmviOEagW2NRJ64ycjBL1X6oe+l5y7E47wpUwD7h/T/oGV0qoL
         pEMc7omLlEQHmof4HstZUdlaPsrtRXumWo7D0E3ItyBubaP7EAAVUc0z98Jo0IpahawI
         9skzB3HspyKgHJw2MBw9SHAW8NqAHsE/Q90+5X3ZFiQa8UXa1UtRi3KMeuCTRJ5IqNsV
         Ud0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qTRDbo5NpLlD5vf8powKzsACaBP/3Ac3gGuvhpr+4Us=;
        fh=aamIRm/KdBuR+Udm/8FfC4BUkoTAjNoxsTNBlxROMzo=;
        b=VyJeg6to+qXXGdBYXJr4VkSlWteJmR3Puji9GgXZmjhSs4CmkP99g3z3g6iH17uczI
         6MBgQVonZ+NFBQnygmpfmtpWlxJva8aDcwo/AP+2iHMi2ET8izIPRgu+ss1+Pm1CpfbJ
         zJMuRf79aYYk/49XTtzOnv3GGC672DC87TNrT5Ul1hVTr7n5Wcp8KWVxB1fGvhZhvJv3
         nEUot2Jx1ZNGf+MoILzW6A5fwanOqmXO3ThJ8NkraQY1mxRsLPTq58C6SNJwHqC9Rqpa
         DmsxhWVX9cZK9cYIsfyAjwfxl/0kLv+PmA343xeWRh6cg4Uwis+xwd9/b4Pne5W+evJg
         D7DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RyNviLfe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-801d5bf9d6dsor2816473a12.5.2024.12.16.11.26.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 11:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RyNviLfe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734377209; x=1734982009; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTRDbo5NpLlD5vf8powKzsACaBP/3Ac3gGuvhpr+4Us=;
        b=RyNviLfeUagX9dYltNFAGoKlP2PFft3R9xtp6F56Fr1av9uzqYSxwPWzxy2m+BRFKY
         E6YqNuysC56Pz8BTM4dqitGCYOyA8znLn60y6h1cANglM/AnWWvS4Sl8TWeY7r3D0qyt
         uUlcWf/3+cQXP3ORjp+lN/fPoME+cabOuo9bb5IY07qnQzqpDM/a1Qsng0wUIIjq+LEm
         3AgDOUOSjGYGjqxOvv2N4gaLIF5ZY2GakzZcHQ4705Qcff5aFuqunY5p6NG41vnYWmhw
         AggaHtuIs3B1WzDl3mgbp3lMgdy1Vc/ncZk+1KYzSQR6eSEHzMEOhD9EuNUsT7xxDaYp
         gCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377209; x=1734982009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTRDbo5NpLlD5vf8powKzsACaBP/3Ac3gGuvhpr+4Us=;
        b=SPPrU5+nQVN4uXhbUkaJKFx1J0QNmCJuF7GcuRUqyp2nIMJpbTAHf2xyq43vHV71Zi
         ZMNnOe2cFBfX+lLbuuN5Qi/DPXiV/52pVfaAW3YHJ+7P0EBJcGEL7VhoJv/AUc8cygfG
         b3PkLSh0QQTC7owfFjX4fs2jKsml9IzQkXo4+aXrb0xQYxF01MfOo7TImuw4r8l+LTIJ
         QqmtFV7NdaqG1BDbVMxyQTwLp88u0Q03JNgV3qLaDyIcHX9YzCa68ggG1MbjrBYT+X8G
         eoF20QLl4AB0BDfbHKfSFBie5RyAWj/Wj+VZ9TpHGed0wZq1RAYNDhriy6aL+eVSEtwt
         WFAg==
X-Forwarded-Encrypted: i=1; AJvYcCX7gSG6HoAIW7ZWxnZeMxSpnNaHVHa6QgpnjwhGrrzMCkT4/tjo3nm7d1kl08GUu3ejGPvf62StsuDx0A==@linaro.org
X-Gm-Message-State: AOJu0YxQFJe4RSW2esE14lQ787TJ1TmYd6rmqxVIVxIl7WfQLomBF2uQ
	g/sQnN6aPiUNmKEP4dQCiQ5JDNufqdvWa5U8BnnEZErM8+/JbvPx6vs6YduXN8czgQ==
X-Gm-Gg: ASbGncuYBqwh6fB7OzH4hm1kcjOADMjKeRdGOsr4ojzBiuLmm1yIJPLvxPNs0iQKKBr
	zdf2YjXgXIPpCTLUjodAcdtyI6UvZe4rdJ8N0RFgPzVKmGIRnM24knKwt92XoMhcApXJjg9H2iH
	xRL8W1tslMMnYrCOEWvdSxpdoZ4Q6WMUWVUGE3XdaQRVwsgFHb0bfKiCY7hYo45CegyOMKvSkfU
	4ZSHhUQinyYuz53JnwxF5jFox9sd++ZdeAvvplNaXnkSL5F2vhdZnUBg6Kyf2DPkpuzpufa9rtH
	xQbv93iyE4sJxJcjvt5MskSXFsbU
X-Google-Smtp-Source: AGHT+IEyPazkjfNyeI2imd6J9UaE+ql/1VPFYx9D6LjH3C0nisZ/veb3eVFM03aNvbbjTCpqe3/DdA==
X-Received: by 2002:a05:6a21:1796:b0:1e0:e000:ca60 with SMTP id adf61e73a8af0-1e1dfdec9b9mr21193943637.28.1734377208849;
        Mon, 16 Dec 2024 11:26:48 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5c07sm5303498b3a.60.2024.12.16.11.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:26:48 -0800 (PST)
Message-ID: <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
Date: Mon, 16 Dec 2024 11:26:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ld9AihuR1Xgn

On 12/16/24 11:10, Richard Henderson wrote:
> On 12/4/24 15:12, Pierrick Bouvier wrote:
>> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
>> spent up to 50% of the emulation time running it (when using TCG).
>>
>> Switching to pauth-impdef=on is often given as a solution to speed up execution.
>> Thus we talked about making it the new default.
>>
>> The first patch introduce a new property (pauth-qarma5) to allow to select
>> current default algorithm.
>> The second one change the default.
>>
>> Pierrick Bouvier (2):
>>     target/arm: add new property to select pauth-qarma5
>>     target/arm: change default pauth algorithm to impdef
>>
>>    docs/system/arm/cpu-features.rst |  7 +++++--
>>    docs/system/introduction.rst     |  2 +-
>>    target/arm/cpu.h                 |  1 +
>>    target/arm/arm-qmp-cmds.c        |  2 +-
>>    target/arm/cpu64.c               | 30 +++++++++++++++++++-----------
>>    tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
>>    6 files changed, 38 insertions(+), 19 deletions(-)
>>
> 
> I understand the motivation, but as-is this will break migration.
> 
> I think this will need to be versioned somehow, but the only thing that really gets
> versioned are the boards, and I'm not sure how to link that to the instantiated cpu.
>

 From what I understood, and I may be wrong, the use case to migrate 
(tcg) vm with cpu max between QEMU versions is *not* supported, as we 
can't guarantee which features are present or not.

And I'm not sure we want to introduce the notion of "versioned" cpu just 
for this. Maybe we could simply restrict migration between major QEMU 
versions in this scenario.

> 
> r~
