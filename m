Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1991210njj;
        Sun, 4 May 2025 09:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyjT1XcMuHApSfnK8H28tUvg2cPt+BlC1QQI2D7nsKelBtJG7R9ZRqiuCPl0nxtLy8vh/+JYUhyWJqXg==@linaro.org
X-Received: by 2002:a05:6a20:87aa:b0:20f:953c:fb57 with SMTP id adf61e73a8af0-20f953cfbf2mr1766405637.42.1746375512369;
        Sun, 04 May 2025 09:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375512; cv=none;
        d=google.com; s=arc-20240605;
        b=bMunMsR1iCFdZgyOs0x2L4oR/jTyLqayTTESUhlnuxqCgU/pvqcQcWpktFF+rSWgEH
         9H7IlIAhIYK2VHUhxMPO6R5eoiUeybL5wcuWm4qWTxwy7M7yqhZJIErs1HoNvPwtiTqv
         CrNkpF+HCAchuYb451DUrCO7wQjaWK/iPKRTzwkLGPnLKegZphhtapLTIOLRkE/kIZUv
         Eok/rjj1s702ZqqIHqE2+cr8D/MW7jK2anI/VaPyLz3m9jQUe9S/KnXCg8kwGUevLo2G
         tIow7sVfe6kGiPtW+y/b73YrK2tKLn23zWHu1SU9ay79VmuCHjuWh7GigZ/TmyNbNwXj
         P7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GVgHVjCZAzrnk6Yz+gPuLZDT9JxPN58KFxsJBrzHsuY=;
        fh=sycLTdbpUUW2gmH5+6s+JXJCQjQFGkLs2j5lq7LMXvo=;
        b=XofCOYyUmxzHeTVqdKRoEkQRTEDc/Tq+xzxWfGZKI7GCGDBV/61k88QsrU61H4bxjS
         PFGmNPeCfWnf/gVrunZxmVep8OgGxaV5lASjSFKhAZC3rNQvy+huJlnS7SgPIrxnftIu
         dmm/+/eMmxcd5oeUTrX8GQ1Uj3k0TDC2xExRwUlYU5L7dSn1Kq1N2DXxvTBAP2ABFmFE
         nVIGwSrqnwi1CQGW23ShkuK1vJ5cIDei2ovCo+6O2hNr5kgUVGtwdcDXUWdlyyeoguVW
         QDBjsV2XOpEfTVqgfO88AOSbYk+h6HrR4W3FBngQZ8B+1GP5ATd8K7ZQQ3qq6Dq7nxwE
         ViWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtB93VAT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d63f4b2sor4580324a12.7.2025.05.04.09.18.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtB93VAT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375512; x=1746980312; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVgHVjCZAzrnk6Yz+gPuLZDT9JxPN58KFxsJBrzHsuY=;
        b=WtB93VATvQyc8PU8lT1g8YHWxma3C7VgLdYK9owFeBpLIGKVRhumP71rUJB51mbq7e
         LKO/YyjjyygMYNxUmmjzrBOYUuB1mZn15Q1qqwAbKYZQcm3U3o6mhWWc/nJC0VrKGo7M
         8+9st8IqLkTy/CLa7KPR2W678ZVotJw7t8FIv6kD828thL6Xgb7rQapUzq7G6isJ+Xl4
         WXMEtlE0qUvIIGzuHgQIft9Ot9fsKfiyEjBN+T3wQXaWwvIO5DwTXt7RMG4vddF9dmoy
         hYTduLJMftafRJoFx2mUAZS4YiVbXeExiU8pkO/VzkmPevpqPZTsCFo+khxpxGZ4/717
         ySdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375512; x=1746980312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVgHVjCZAzrnk6Yz+gPuLZDT9JxPN58KFxsJBrzHsuY=;
        b=XqMCpm4OOu6ADqUXo+h326+vS096v6yEXD36ce+HBAS10ubE4NTHBFSeHRT520f1dI
         kcTmwgXFoxwe9RFsm7n8cN57R/iHG/rKa+wk0ls7to2RmdbCYeobU5A4p/BlbZP8ZiPC
         DhsUID4dYOqN5xzUyjthcwCnGzAVrcBcb36kp2/H+9lOmXHkK97xinZJ/jgjfjm3XVLm
         COLHJ2PmD0O9C6mG/H7lV3OYLkBoD1qSlXEjdNxjmWqlbdfTRv4cVO0yTiGTyN0JBoyv
         UYS+yK8gXeZHJlucgHsVTjDY1bo9u+62ssz5vBD2x/iMW0UbfR832bjBAUTD+5YRKAxN
         s82g==
X-Forwarded-Encrypted: i=1; AJvYcCUy2gNnfCKiz9zo8f58MhGE4cwrNBnMTAFkLih2RBBwXx3bpk2pRORVI1eJgoTIVy5tmtbOOLj+A2h2hg==@linaro.org
X-Gm-Message-State: AOJu0YxxgO10ieEmgTLhMzjUAadgkhqWwhUxaBABCF5WBeXct0oEtw0d
	jv0iAFB4NXunJjE0xrHKvQnJ0wWfKRIs1lGdDAPJQMbo2k/hhpmw88CSY9vZMdJYSw==
X-Gm-Gg: ASbGncvSL62BN1y+FRWxgoe0Hu3zhP7fbBeF4Y1vVgShck6ii4FMc46CvlyVZzu4Pt0
	pbwGAmrF1btYTH7XRTTcjSf+qoXiDk5YaPDt2Jrry3SjVB2TteLfkHmWdbucnyu8auE6LSl0nW6
	uI/0SMAUWrTjCXBBGNLmV9bv/oy8k2tJpOx1rSbzXULnQ6XazFWaQxjIyRNZdPIrPjdQjwxD8Bc
	TsaV9bbh5l4GtY/vU1P4pricrSq8n0fXW88skyG1ztS/uHr+XEqHr3054sc3gMh0EN+5SgTF8LE
	iTSTUzRX28LuUjzgulyTGYSz31EQXoj0kJtz4i4LNcPvk5S4dIuWKLst+0SlZ9w4yplFKHUQSE2
	fSy5vXNQ=
X-Google-Smtp-Source: AGHT+IFDVehLEijp7OUzeIAXqkg+5iC8+kDb1Uvyac3I7ayEa8psrutgXlbFuIS85v5QsmgH3zDmYw==
X-Received: by 2002:a17:90b:3d45:b0:305:5f33:980f with SMTP id 98e67ed59e1d1-30a5aeb69f2mr9376272a91.27.1746375511926;
        Sun, 04 May 2025 09:18:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a263f4324sm7897339a91.1.2025.05.04.09.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:18:31 -0700 (PDT)
Message-ID: <a50b2d4e-011d-447a-ad15-6165598a865f@linaro.org>
Date: Sun, 4 May 2025 09:18:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 32/40] target/arm/ptw: replace TARGET_AARCH64 by
 CONFIG_ATOMIC64 from arm_casq_ptw
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-33-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-33-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: gwy+BHj8C9F/

On 5/3/25 22:29, Pierrick Bouvier wrote:
> This function needs 64 bit compare exchange, so we hide implementation
> for hosts not supporting it (some 32 bit target, which don't run 64 bit
> guests anyway).
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 424d1b54275..f3e5226bac5 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>                                uint64_t new_val, S1Translate *ptw,
>                                ARMMMUFaultInfo *fi)
>   {
> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
> +#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
>       uint64_t cur_val;
>       void *host = ptw->out_host;
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
