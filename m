Received: by 10.28.71.27 with SMTP id u27csp1199025wma;
        Fri, 23 Feb 2018 16:03:45 -0800 (PST)
X-Received: by 10.99.99.66 with SMTP id x63mr2731814pgb.421.1519430625224;
        Fri, 23 Feb 2018 16:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519430625; cv=none;
        d=google.com; s=arc-20160816;
        b=lBDY0w64u3BWeKr1jngkgOQISoDlfCjiK3xk5LAhQRisKRsAqCesdTgMZjhQ8Qg/hl
         SSdjgOFv/n1MSz67OMOKCRUTZacZmb9KYZQ4QR9aW+giuSDU3EHPtAVkRSSUKB419nYP
         pqUo1qgQ2ybqmMKAFFjKCsQzFmVFcsNWyX9Uz8HU06yslo/SoxdFEeyRsjKCCxaEjmNP
         duxW0hbJ3LLegTMRKbpsnb46A7oJFlRmwI9jdoTivASUnNFFdD2CfTr+XRrwJwNsQO6f
         MX5d24DmySrdgF7ge5Mu64YLHSEqQKrbHfudYJuj4a95p6qOHaLfdKtCP5nUFdm1Lc/A
         01cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=wtp0wBWtSIiNAbH6C5RUOmCkyN6PvHeUKZEWHcX/G6Y=;
        b=khBLUunhJ0GG4HpQDIvQgEMB+Dwz2G+8oO4INmNKB4gKfYk8T8jsGlD221MSVjy27B
         QTWakU3wukqhgss/GoRFuGBH6zasLZnsGmiKZhEb222phs27Yed7KySbIE1ZS75pDz5p
         RWhGa85Ps1a9Dt3U1OmxffSfHLyFFjJ6tbg1VUg+jfBs+ixcaF4NaZIdf/S7loDHJEcQ
         p4s1Uc5J8G9WdSmV/MvPJy6fTrLY5jXL0E/PnVooYCgojhOaDB7PlUSYl9r0ag+eZ29X
         MyFzZ8e97mSemur6ej2tpYFCbU+vIsDYUiDaGinBHBbETXHvp5GtmqZdb6Ck6thCCLjt
         xR/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OcWgDFgb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g6-v6sor1214289pll.120.2018.02.23.16.03.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OcWgDFgb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wtp0wBWtSIiNAbH6C5RUOmCkyN6PvHeUKZEWHcX/G6Y=;
        b=OcWgDFgbDz1SeMe3CemvkE9gORzaTwLqBMZJQPmej3ja5irYYzS0D4iRaYSYFKw47z
         WTujejmf9nm/0Yckdsq/gjx0oKjUCeDe5GK0S9Ng4rSjadHwlB60AHaGlTMoSRXAjFML
         lIgTJDOiKse4XwQ24Mc4PcsgK8Kepv0nBNEnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wtp0wBWtSIiNAbH6C5RUOmCkyN6PvHeUKZEWHcX/G6Y=;
        b=Ipq7zAh7utorNQs/M361X75K5K/uRiOJUPAJaDtXxr1K1h4XJ7iPM7C4cD5WgJp844
         TipWhxS2RW8zawB9+ZvzP6v4aH0ZmtcjfjPYw7s1Zbo4kdFA2NN3aawMSUrhogDT/WQj
         PHbO/t4haGiSpIBFIYbePS+7iTaCXs7FEvo7LEVm2hlbejqNsnbRX7qLQH9zNlY6ADLf
         0eSzS4F64XFPuXfR7BtP8lPvzK1jwUtmanmxlrUbGamD1vM5tpiP3JbcMJmLaIYK7hkB
         Eox8ft4ZDCzZgnXMrgzDqAaNWc36e3ddsbybQLk1AXB0mi3MFJ0XzoIgUYWQpsiYVNzL
         7//Q==
X-Gm-Message-State: APf1xPDlI5o6QgWVhLefYRIxSfDJSbKvhU9dbcbCYqmwUcsYEHBkQ78p
	nAkbciAzy7tgK/2oIc5TaIOU8A29
X-Google-Smtp-Source: AH8x224K54qCaxLVLFrzNndbLMZKCsA0ycFh8XODQ1flVyHX5vBQL+H+x403PhzTXwvX06wjbzmTYg==
X-Received: by 2002:a17:902:bcc6:: with SMTP id o6-v6mr3297066pls.16.1519430624824;
        Fri, 23 Feb 2018 16:03:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id b8sm6831894pff.31.2018.02.23.16.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:03:44 -0800 (PST)
Subject: Re: [PATCH v3 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to
 simd_indexed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0882ecdd-b31d-aa04-f80d-2404ead313be@linaro.org>
Date: Fri, 23 Feb 2018 16:03:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2AlviNfC0vbL

On 02/23/2018 07:36 AM, Alex Bennée wrote:
>      case 0x9: /* FMUL, FMULX */
> -        if (!extract32(size, 1, 1)) {
> +        if (size == 1 ||
> +            (size < 2 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
>              unallocated_encoding(s);

You get to drop the check here...

> +        case 0: /* half precision */
> +            size = MO_16;
> +            index = h << 2 | l << 1 | m;
> +            is_fp16 = true;
> +            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
> +                break;
> +            }

... because you added it here instead.


r~
