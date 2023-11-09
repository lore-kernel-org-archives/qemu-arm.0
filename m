Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp518788ejq;
        Thu, 9 Nov 2023 06:37:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJTCVo7iYdUxDkp1ZQhB4ggqwnkoD3fEmrrG9F9HiXKJYJaRKCqnNZaDsNPOovxF+CZO5+
X-Received: by 2002:a2e:bea3:0:b0:2c5:1553:9129 with SMTP id a35-20020a2ebea3000000b002c515539129mr5474096ljr.35.1699540656280;
        Thu, 09 Nov 2023 06:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699540656; cv=none;
        d=google.com; s=arc-20160816;
        b=pbGXSADiG8i6ZvDnBiAr5EGWEPm/ecd11dIb9uyvZcfLgYsFd7hcrZ6AgxtMSU4EeL
         UrZH6uVP4Kdr4z5g58fDUjInCUXiG76kzsAkXQ5CTf3agVlE27SxV5aiN5ddjR9+IJZL
         XFXvYKepMdkfpBdViesDNlfhYIXD2Q03llicj5vrPs4YpMC1JFQjzp2WXIQDsJy2H3BG
         zrBluJKqPvzZASt0xYIGmKJBzg3O8K3MqfEKEAhnpvG961tzFIye2dFHVYsOASfT2Y+5
         ZtxPqsi9wiwzFvEO9DVehWLWYTHo7mW26qyEpkaUBRP7l52yDdqTZaBBpf+TEU9ZXu8K
         m4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=aZ8FMW+qPhbbZdbn9wQI6gnMS5ZXuIho+i7OL4BCnRI=;
        fh=Sgv7iufLVExKh5gaoWNBVFRNFJR2ty+BjnevJZ5c0Kw=;
        b=Hvu6o/+u/AW2PRHS1oUfOVliI2/D+rYMM0TDuNT5B+CC/ZqqcjPGO7NJDGxERU88rj
         I7XR64PLUwFoaYqBhTyGMxcmvSvQZlP1mN1s8KoP1I9v5MPsL048MsSUDK2LOqwQTxHf
         pWOAnRAEUt2qX8jDutVAM++zP5XLpFAQrDVO0xK9FmM57laTaNwu4bgXJZ9S937g/0rk
         iZdVflNuD+oXWlOIknTUl4sCnDz2ZpYBxUmaR1f+gYqO7/wm61+SsQjQSXBPVNw1J5am
         04ae5Bil01aZzhQm+QSI5hQ9JuatPmtCWK8zIjVKE1Dsrr4dzW8f0dt6s5Kdlnp3U1pl
         l+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id q3-20020a2e8743000000b002c00b5d0821si5416080ljj.339.2023.11.09.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 06:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6640B31CAC;
	Thu,  9 Nov 2023 17:37:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id 54CE734571;
	Thu,  9 Nov 2023 17:37:35 +0300 (MSK)
Message-ID: <fdd986e0-54cb-41ac-93e1-7770bb7f1649@tls.msk.ru>
Date: Thu, 9 Nov 2023 17:37:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20231031143215.29764-1-richard.henderson@linaro.org>
 <874jhv86a4.fsf@draig.linaro.org>
 <f7f5288a-c2dd-4831-8bac-31286f53f394@tls.msk.ru>
 <87y1f76oa6.fsf@draig.linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <87y1f76oa6.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DGvgAg0gxE2B

09.11.2023 16:37, Alex Bennée wrote:
> Awesome, I shall try to remember to check that branch first ;-)

I tend to avoid pushing stuff to main qemu repo,
to avoid spending CI minutes.  But from time to time I do push there.

> Have a Tested-by: Alex Bennée <alex.bennee@linaro.org>
> 
> for the branch fix.

Woops. You ruined my branch, so I had to force-push it with your new tag :)

/mjt
