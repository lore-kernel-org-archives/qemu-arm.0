Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4359345ejb;
        Tue, 13 Dec 2022 08:14:05 -0800 (PST)
X-Received: by 2002:a05:6871:4049:b0:145:4fb:8b5f with SMTP id ky9-20020a056871404900b0014504fb8b5fmr9355875oab.14.1670948045277;
        Tue, 13 Dec 2022 08:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670948045; cv=none;
        d=google.com; s=arc-20160816;
        b=Sw3t5Qi3gxR8Sx1KyKqrMbr+oTt1U9BqMVVAKBYeBf1pX2HQ/zQeFxe9Q5NfSy/rY9
         0bzEDMM47W9I29prfMlQ8kjeBs0q67ql2UZuIoSo20ZHB91CvSbBhFy0j21XzBTpbOM8
         kcEh94SGEGaww43+FBJ2dlHqQ278zFAZ3K9CqbrJYnSeCoeWJAIenBWXDH0EDB2d9sg1
         vyS8vwqCZCVBmSL77PW91y6hpq86SpHz8lUi/cR4Fuu8/QsNY1v4kv2UtnJuOT7Cfjoi
         u7i6Ai8sIz9syDRjosNbd557SombpRNo0YzoURJN3YralAWiWK/uARpDuiq3KrolbYE0
         dvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bx3gvvxquDG0WETn4rNxwFl2aDUBFfAaazwHUoEDsJY=;
        b=DrRKgBJQyW7mBH3jeJbaqaPZYEArCK7B1FMDexkJTc+arrw8vYtQXIEVl97C29YJZQ
         FDDCahyfNU4t9bZubUwifvf47/QGzIQ0r9IT1VC8UPqpsfVpNo4k4lf4QpUO5GTI3xD3
         ugd4gr3a9a1mbrWj7srby4sEGirv8RLG4rb04SWiaqcep9ttafN8q+siq/+MGA6gjPMu
         OJ4xNZhj3ZSEpi1XwuaUssE/Yy6mhm7aVsA1D1YD3uzu96AFaf3xUf3I8vhIelBFPQQR
         2IOw7dQKBPqTMU1IhOiJUCpcsYuLZhQy+pgF8c8DvUaEq7HBNuUuyVmd989+jGWJbGiE
         bJww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0UqSb76;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13-20020a056870958d00b0013bb1ae4b15sor1252982oao.4.2022.12.13.08.14.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 08:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0UqSb76;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bx3gvvxquDG0WETn4rNxwFl2aDUBFfAaazwHUoEDsJY=;
        b=G0UqSb76a7VwjTy/kL1NJj45higodz0AgUD3qFzPa3gy4dr5k+ox60yQqziqZs1Id3
         Qh7HbvDZ7SLiHysWKHFISIp9/eL7QqjpXwH/vCpxaX2lw8C98h+j2X0bRJj9m4NpH6yd
         qKQdX2FiT39f9tB81Lgn88gJyhC0JVAxSu5KdzQbmwjJH1VyEnyGMXNAFtzqRUyA8fn6
         7jzpOaef+jquMYTPQ3pNaGoJWUHKDT5vBBsgsAqyp1xoWXu3P16bUtmJip+MxDCCpVcu
         nmHWQl9GtGl4kGOZFxgdXVs66P7UXnPOEQkHBiDXviasXPHu7EbWK8mWN2E+XLx4GvlQ
         OCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bx3gvvxquDG0WETn4rNxwFl2aDUBFfAaazwHUoEDsJY=;
        b=z+rM7c/781cOo7iHnrvKUH+NaMxHr2cIPE1rCVGJ680YLoLNi9r7IX4h977izUj5sC
         19zi1nWd3ElujygvaCcExH2PDEof7pBZ73xT4t6HZOaF9M1C4JpttYw2QwIwzicbg7dR
         WMpKWk+NFMPeP0KU1ezjZ58S4+8wLww3Zv9DPyI+ed+mCqa111aR5hzCi4BhG6EMrFwW
         JitaGTYKFH33dAa1bKUEft0u5YCuWYio1JEX+5+7dMzpPM+W5AM4+c77IPnJLHWabvgL
         D765kpD/W2IT06CmM/N3ZggWbETjlIQ6cG6NbhAx887X71wS5JvKjQH9pEcDGCqVQZVr
         TSog==
X-Gm-Message-State: ANoB5plc86kqBEj3ouPW2zfYtH1Y08rlw/CukTuiUkh3RsOhiHTuQ9OB
	w6VIwvVFaQtGWTe/ZeTCm/8VtYm+
X-Google-Smtp-Source: AA0mqf4NmvumqoYQuJygyaXz4rofq7vh2BUE6JLG8DTzr0P09Tg3awssyVkCH0l1MSliw8j/cT/3TQ==
X-Received: by 2002:a05:6870:f604:b0:148:6592:a6d with SMTP id ek4-20020a056870f60400b0014865920a6dmr3279919oab.4.1670948044782;
        Tue, 13 Dec 2022 08:14:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0? ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
        by smtp.gmail.com with ESMTPSA id eq37-20020a056870a92500b0010d7242b623sm1599784oab.21.2022.12.13.08.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:14:04 -0800 (PST)
Message-ID: <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
Date: Tue, 13 Dec 2022 10:14:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nZtrLay6id6N

On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
> On 13/12/22 17:00, Richard Henderson wrote:
>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>> aCube Sam460ex board") were testing on a little-endian setup,
>>> they meant to use const_le32() instead of tswap32() here,
>>> since tswap32() depends on the host endianness.
>>
>> tswap depends on target endianness.
> 
> Yes, it depends on both host/target endianness. What I meant
> is we shouldn't have system code depending on host endianness.

It compares host vs target endianness, to determine if a swap is needed.  But the real 
dependency is target endianness.


r~
