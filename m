Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2072968njb;
        Mon, 14 Oct 2024 13:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2VNBdjiAP6b3mO/uc8x1hpYNPIF8N/yopx7m+mFUBNvxziC4WjZkyT76cFYupPF3cb+LLY0gcV/CEDA==@linaro.org
X-Google-Smtp-Source: AGHT+IEp3mcewGVFtczNszaqyQWOGx71fLf/LXgqbijGSeEdq0jZWB9T8XCMWig5343aSb80mJdM
X-Received: by 2002:a05:6512:3402:b0:536:a68e:86f0 with SMTP id 2adb3069b0e04-539e55142c8mr3941803e87.27.1728937043837;
        Mon, 14 Oct 2024 13:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728937043; cv=none;
        d=google.com; s=arc-20240605;
        b=GSKANl9RetntOXrv2tSZy1oViyXZOc+2MFr5+4cGTz2rg3Xu6/RopEelQdfrl1bqwK
         jCV9HVwrVlpgVt9kw1E7PMFjfaui9NjPETDwR3OxxQhQwGcEKM4Zsx2vz3eTwS11AzCM
         CIj6tXmLjnxVrU7sTTobxOQBfIna+PbJsW3Fs3mycA2Bo3m+kRaVYG08QZsN7poQ3gQO
         jq0xlGal7bIcJjpjwJZ5Y820DExcrnFJze20YxsRo0lLoEs1PDnF+YP+4/UcNkYgLiLd
         uaWtB3MyqwB3Nc7xwZeHSUEogmk0XeX+inBOs/FTGfQBhZn0pM8VeUV6p7U923japaTa
         /aiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id;
        bh=oUzFcGh0f+QKb1egZWkQzx1DpQiCXJSKbeZ7H1JdU6g=;
        fh=gim6zDMe/FwhtTRVfysVnth7IcLkifUMZqkon8U1t3s=;
        b=Jk+/MzGdBNWkoaBGaJdCZEDfBsnj8ThZO/rkr4QVXmKjiIA4whj6Q9THdxAfT6Ll1Q
         ai1NwmuiK0t/ZiDqKy/XvEoGziO+9pEphr62MB0k/FunUoVGGrQfeMPS5aWD//gs7sZo
         brlqV6obuwhYiSsX4E+9Moiz7Ucu6kax5s10HAh/TsTSq68ugvUGZA9Z38gli/qBJVIE
         kbh0qEvjGOcsjb4Ibm/aWODO2Jiet25gVMSabkdQd0UHI+PPyuTst8yXxwNjX0rfpTRq
         3ju1YnDkTShqSm4V5wiWXWjGWYof6t8Xa8rKZF2xtz3rtUEqTHbdgNbOPZO3yQfkvQse
         9bHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id 2adb3069b0e04-539ebedff28si1653121e87.535.2024.10.14.13.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C6F7398411;
	Mon, 14 Oct 2024 23:17:05 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
	by tsrv.corpit.ru (Postfix) with ESMTP id 9009E154700;
	Mon, 14 Oct 2024 23:17:22 +0300 (MSK)
Message-ID: <335966a1-0b80-4a29-9196-d0d1879f358d@tls.msk.ru>
Date: Mon, 14 Oct 2024 23:17:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] target/hppa: Fix priority of T, D, and B page
 faults
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-10-richard.henderson@linaro.org>
 <4810ac6d-cbdc-4f04-a2fa-895e78cf2fcb@tls.msk.ru>
 <b8e76800-e5ea-4060-9e3c-35e8a9f8812b@linaro.org>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <b8e76800-e5ea-4060-9e3c-35e8a9f8812b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pQ2sTb+UeO/R

On 14.10.2024 22:31, Richard Henderson wrote:
> On 10/14/24 11:02, Michael Tokarev wrote:
>> On 09.10.2024 03:04, Richard Henderson wrote:
>>> Drop the 'else' so that ret is overridden with the
>>> highest priority fault.
>>>
>>> Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
>>> Reviewed-by: Helge Deller <deller@gmx.de>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Is this a qemu-stable material?  For now I assume yes, please
>> let me know if it is not.
> 
> The kernel fault thing is pretty nasty.
> Fixing that probably requires all of patches 2-11.
> 
> I don't think the arm fix is serious enough to backport.

Count me confused.

So, am I right you suggest picking up changes 2-11 for 9.1?
It looks maybe a bit too much, no?

Thanks,

/mjt
