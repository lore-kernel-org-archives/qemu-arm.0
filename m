Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp592955njc;
        Wed, 19 Mar 2025 16:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6jaQ4t5YTYUHKSCuTZEo2DlxHiS+tDzswx24bLtPgdkSFTRFunJmDnC/5/6ZR08LoIZ/B3eA6sR7W/w==@linaro.org
X-Received: by 2002:a17:902:d2cf:b0:223:5124:a16e with SMTP id d9443c01a7336-2264981aff7mr82458295ad.5.1742426748443;
        Wed, 19 Mar 2025 16:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742426748; cv=none;
        d=google.com; s=arc-20240605;
        b=SiAPULrV9dTuwJ0wU8Dq3EpzJ6hEVSaBOmlhI3PWmvDSkEcWsVqo3SAtrkMaiCpt6u
         XnurNA/69VL2UR8r1twftSOIsUm02zrr/fIdB1Hgz2z/iOb5AigZp3eJ/ewqeGJfs5vi
         jL0jf7QHfGy5zH2rtc9RH0iU7GmI0GP7F6kgBA0vJ4zrrdGBOnI1abJqmdxWh6xSLdZN
         oJiL9u7otyMuKE+igG7s1XiZiZJ6oMlxLuxm6aTKYHro0CgrIWcusTQDIuNiHrTj2Z/J
         s7VGvo4gPa6UIIjKQjPWXEZH+tnQhjewGg0lFBeMAupjNyXyBExnGErR8tHHA4TK/BJu
         2+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vjfR9UwecaSn8yWmmPZcnLHVsPnQ7Q3oWoSlhpoapEQ=;
        fh=2TyYPaeLRNtbTCv8ai55DBVV4TXGYXU09bVLADnRh8s=;
        b=Ue3LmLpd6nr1OhujkYtRu+zjoouB85EHkHP2zE9gkp+ePOjP9bT2aVH/+n7YpvizmR
         nTdjwAqK1qJN2Llg+S52K7YjXVSHpeCR99Ij7IzT17L4WxpAQrrANaMi3g24nHLjdDgj
         ToxutN9lRJBBMgXSn+d0XfZdPV1MtnW6PnZ0ciogb9pB4xKGP+I22KISHWlLW5NkWp1F
         w48gjau2s8YU9Qwpek1qBMTkzUrR8oPz2lHb/upibd4rESAHKHCkqbQm5wZJhFJ0upvL
         qcYptZbFJ7lY/4wVJmoAckeL/9CPgHcJsiMx4yVH1Lx6oVKpm8dZ1THPDgkgknO78+g9
         DWaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXkc2ITy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-226423ef5acsor21046485ad.1.2025.03.19.16.25.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 16:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXkc2ITy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742426748; x=1743031548; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjfR9UwecaSn8yWmmPZcnLHVsPnQ7Q3oWoSlhpoapEQ=;
        b=iXkc2ITyzFMtP83fKTnih6oBQ0CsLE6fkJf8LRSsnTB3M8AWvNvLhlD+93rMXl7dRt
         Hc2uXbWQEieENEwv4bBfyXb28ldEPzhL12FqTHs/m7BmM8WS/pyKc1RbwCv26ZZvqZBF
         NodCcthwIp+umY7tT/WNVf8MzCIWLp3m8a1vbuU0PwwpSLVrlQGweLyF+jAocVbaZ8nN
         3H/5ILdpWMWfWCR5ZrGeyygWmisI5NwHR40VeUoTLDEMBQdJ7fc1HFWCn9k9wawaS+w4
         ulkaryutNZq6c9CZuGy2tFkmKQ81x8Cq8nl2oAHxw+S/9qlR8uaaAh23ilibyeQcUeiE
         H0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742426748; x=1743031548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjfR9UwecaSn8yWmmPZcnLHVsPnQ7Q3oWoSlhpoapEQ=;
        b=HaGbl764v8ABqYwB6fiil1B2HLqQakA26lfvpM1uSL/wknzIOSGSMR1/K8ACqiquGk
         eUpVQH0EtbTbAOnSZosw/ubZ7yNvMyt292ghpcvlB/tWOuwTDNf+sOT1lwjgNNuNKIMt
         zOCNV1ACwjHqB6QXLIeTCd/hnwihWPgpbVWgrDKdJJqHI+1o4nYLY2rpUwVF92avHi5G
         rBg7xR5AQ9P+iup1Az+MWFzIObO8tt7ZjsdgEWtWVuDLIvxhVK6Roo9U5rNq0LiOLXoh
         6W8DIt/obUTgJrCfRmtwWUkOqDbVQJO1duk9/JJNI+Z3pSM0fBHnELLtJWPmSjhcrKs8
         dYBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzv3fchj45jFf8RvsApF5+WMiZ1TtW+8xJAOsTVOlJeNzzGmm6T9STsGLodNGpRJaTMqz02BEAc0C3jQ==@linaro.org
X-Gm-Message-State: AOJu0Yw2Enb3pQ7j9u26kKFkg58o6PZcv4FC1mzDSpJr16W9n4CHp5dC
	SlVwc4QMKU8h3c9mp7m+V7VD1BTlkaZN+s6TQGIdaOWRWuGlsuPJoT7CP70BwAAtzQ==
X-Gm-Gg: ASbGncuF81HIOFSMERM3legwaQYtdsva4eYGYLHSqA3c64C2ackOWescVEcECPUjyjE
	Tfh4y2znXCDUMrhWjPeTWcniNZSYlUtSZJqfqzLxAKoncwg35yclzI1Ekxg+WyUPWCXFXoz+LC7
	dgBhicNuFRWIUpUpiLnZOEjLSZ+Mxwht0pWcsl4avmmFncoOVlFUykz5VrnW7tGqGba5ENPrBdt
	EU8wgkP12dYhSSuHDl1qhrwcOjSiGgIquI1c0r8Se9zXhkRmamL8Dn4iTx4wpEFisj2HsuDKK/R
	1bixk8yikaQRwa5ZABXAv5UKvrVZGSOGDsRwF2PkYWGrgyInpyV4Zp8rpw==
X-Google-Smtp-Source: AGHT+IFJSivWE9HxeLEiVE+QiZGXG8QzUS2VqFdO5auKLYIsHhq4jw3PL5s5J4DC4SaIBehnDY63Fw==
X-Received: by 2002:a17:903:2f8c:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22649cb45b7mr67889955ad.53.1742426747979;
        Wed, 19 Mar 2025 16:25:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a80e3sm121661665ad.83.2025.03.19.16.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:25:47 -0700 (PDT)
Message-ID: <a4830467-1096-4d62-a57c-33f6bc05423f@linaro.org>
Date: Wed, 19 Mar 2025 16:25:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] target/arm/cpu: define same set of registers for
 aarch32 and aarch64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-11-pierrick.bouvier@linaro.org>
 <2b438e13-b377-4b4e-a4ff-0b219d7f3964@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2b438e13-b377-4b4e-a4ff-0b219d7f3964@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5LiswseSXjWj

On 3/18/25 15:45, Richard Henderson wrote:
> On 3/17/25 21:51, Pierrick Bouvier wrote:
>> To eliminate TARGET_AARCH64, we need to make various definitions common
>> between 32 and 64 bit Arm targets.
>> Added registers are used only by aarch64 code, and the only impact is on
>> the size of CPUARMState, and added zarray
>> (ARMVectorReg zarray[ARM_MAX_VQ * 16]) member (+64KB)
>>
>> It could be eventually possible to allocate this array only for aarch64
>> emulation, but I'm not sure it's worth the hassle to save a few KB per
>> vcpu. Running qemu-system takes already several hundreds of MB of
>> (resident) memory, and qemu-user takes dozens of MB of (resident) memory
>> anyway.
>>
>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/cpu.h | 6 ------
>>    1 file changed, 6 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I think this could easily squash with ARM_MAX_VQ, since the
> rationale is better spelled out here.
> 

Yes, makes sense. I'll squash it.

> 
> r~
