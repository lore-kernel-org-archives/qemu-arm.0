Received: by 10.28.71.27 with SMTP id u27csp2530322wma;
        Thu, 8 Feb 2018 12:49:53 -0800 (PST)
X-Received: by 2002:a17:902:5e3:: with SMTP id f90-v6mr273872plf.418.1518122993660;
        Thu, 08 Feb 2018 12:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122993; cv=none;
        d=google.com; s=arc-20160816;
        b=gMS3riXS4+lXGA9yvKN3QKBsswCE2bkhQ1hfGCSqK2A+AVS9For7RMMINDeIM2Upze
         GLJxV8OCJCDHlrbhscUGCjDJFihR0puEdRj6N+aBp5yxpqCb+muvwN93o2x0w7t2aC/8
         TY9jAZGJ0//kjXN0S2bKwEat0PMxhNhQNknTCTlShwcipwFi06pGkrwKLyzbKqQ4SMs+
         pk9xl8UJMGtV1ZMVkbHD5xIRA/6lRCXeDsd4usWBu04k5w8zj/01b2IQSySgGnmpx8/g
         /pb2KnJysJb8/JIVqhb7ZaL2d/r4ynb8vLK3sL5kRlhm7723Dx7zGDoLVfZL/Cg4Hlpb
         J0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xTJxaiKFeFxaxQEimAC9dCjcPTAJ2Az1wTy+8ZUcFz8=;
        b=D83hxzmUFWjSpaU8jiOz5nVeaCDwTY06smCGq22ev+NpjT5J2IaI1SyPjy9O76Pl5a
         llPO1kCLVHZ5ZLqexkAKqzYCWsWAaXuE4wcl9M0E+BymhHk4WXjiMBQ0EL9WNBLA3W2H
         DtpmP/ig/noa3hWaJJ82K4GuN2CTIzoycnMczDEtmXocaJ0+PItkXpRrBmtNscF7uekT
         tV2y4ON3+h/QXr92q3K9NkENeddjrdd8WirzUogeIGYlstWgm68hFAwStCDZSkzmOsLn
         PRgikDchzOWKja6JH9x4bHASFl+ECBxtsuoKX/6iYfe8E3qLykolAs9n5/BffLvW31pv
         S25w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEk+JWco;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id be6-v6sor264271plb.12.2018.02.08.12.49.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:49:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEk+JWco;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xTJxaiKFeFxaxQEimAC9dCjcPTAJ2Az1wTy+8ZUcFz8=;
        b=FEk+JWcoZtJc0nAMInzosc62CZTQtlwR+W+zdSS9EZHUePZf1y8Dk0xazmr2ahXpiY
         Jj9AvkRXaWsMJFjOASKMm9qo/iSt+Iw48B/pJoj1v7f8Dd341VBeZ55+VUsIxzjOmELz
         zRHC53IVrp1ED8EEVI1RtFvv2iuwWEgDz1zw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xTJxaiKFeFxaxQEimAC9dCjcPTAJ2Az1wTy+8ZUcFz8=;
        b=nfxPJesiA3jVV9GePoIPisSEeKEhADnUhOu/xl79x6OAGyIrSNymD3K4efMJMDQsac
         GchfZHLD/lL+deZcnkTbcAx3ybnxU4ikNWRhUUsyx9lQU8l5DFBOSXqXnfYy5M5Zu3C0
         ID56yiMFX7LZJ9SRfGFuoiQjKKwIkzSpvpX21NB1SN0tMVtLvx8dPaaa6OsdnvOy0M22
         ByoX1ubkHUdDqZKAqDEgMyJHBdUvQn/Cr2xi5MYIUsZQFhBqAzq2LldjWY+P0rpq9cwc
         m7NGKPjet6JOyfdoK6egL0KS5f4A2qgDsdraADfa5r/xzWcL1XhtAdh2gvw6f2Uo4KOX
         cJGw==
X-Gm-Message-State: APf1xPCUGNhXZ+mjdiCFp2iUx06zI4FbmK12YjL2Q0IxmcNhO+5MV6QK
	Pb/Jk0JtY23h6teeoWgw2ni+E2wH
X-Google-Smtp-Source: AH8x227QFKDAfTrvHAm01ZwRYbCRqmBfdopTFi/cDExMFqDTtUUGInPA/45MD0ARJfOv4hAXHX5UhA==
X-Received: by 2002:a17:902:6881:: with SMTP id i1-v6mr264796plk.323.1518122993142;
        Thu, 08 Feb 2018 12:49:53 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id b81sm2628529pfm.89.2018.02.08.12.49.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:49:52 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 07/32] arm/translate-a64: implement
 half-precision F(MIN|MAX)(V|NMV)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8984ebfe-9e5f-b340-3c9f-b7e0b16cde6e@linaro.org>
Date: Thu, 8 Feb 2018 12:49:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: f8dov2oWYK6K

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> +DEF_HELPER_3(advsimd_maxh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_minnumh, f16, f16, f16, ptr)

DEF_HELPER_FLAGS_3 with TCG_CALL_NO_RWG.


r~
