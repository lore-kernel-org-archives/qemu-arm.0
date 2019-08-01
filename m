Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7057519wrv;
        Thu, 1 Aug 2019 07:53:33 -0700 (PDT)
X-Received: by 2002:a17:902:112a:: with SMTP id d39mr128052056pla.254.1564671213449;
        Thu, 01 Aug 2019 07:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564671213; cv=none;
        d=google.com; s=arc-20160816;
        b=AyRMHXSyZzzmn1npMtF4CVI/DuHqyyRmFG9Okv9IWpksRM6AV9+yJH7g+nl6pkt4wj
         pN+kR5tpPQLOf39J6RvK9s5vR9gBU6IBdNQrtT00vLTCADAEcY4qRug3iKlPDO9xk/+4
         NZMbXTPZRLXyo72ZIpKqAfVKYKrH3GCYLALJWZzdSrsjzlB+4zUkBex+nuoxtvVEs+hI
         zO1ZzMisXV7Ag3pLM60lAShKKzAzwfgXK9lL2SqjwKD+U1Fz6Syx2/5KC1R4DCV/qW2b
         JtSabz66qtoPA4WD/DyuLmFeJXRI5WQ+FGU3wRR1j8mibVp4MKPMkBB3GRWjRPWtW2Iq
         vrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=MWsR468tIvrM3cAel2+h/IK2I8O0glNd0lF4xCbxLn4=;
        b=S+wCaFnls5PoVr5xZmVwR7t5Z61eOMYPTe7uDwaoX1gNPbe6GoiMoKdEXqfoPAbsbG
         dBYyNqQ7Dc6g2ClYxRHv0qBGzFnLr92ihUpppbiaEZWo19jQ9mBDUiZAMml66a7lSapj
         qwhy7Vpgoyod08NXvIyLObKacTE4SI/PCk0vwFQE3c4GS+mOGwxVNWlXIhscoVitZjg2
         kJjHGlZV8iJW2+xDJXkKzBQQkyZuB9rhs7R2NidD3qSOhoUNdwxN4gpxqteYIiIy+cwp
         aH357guH3mx5sA+Se/xkaJpcu5UW+ZQK7i1O0F96JxMOLIs7EnXq5jKMuvbl9YfumneF
         UDJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4qRHnjH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e79sor52782551pfh.26.2019.08.01.07.53.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2019 07:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4qRHnjH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MWsR468tIvrM3cAel2+h/IK2I8O0glNd0lF4xCbxLn4=;
        b=j4qRHnjH0VbNLvTj4+kFZJswQvJsnB0SanrrT5OadMfuDjldxC4Znt7Y4jmKiTVDdR
         6aZKDysyJRzsHRe1fT3LSGWvV4/Y3kvLICzCCcF7DAODvoravyQbOgeEUf4tWaaybXZs
         8hzSUPzMse4Yw0VSpX4HbvKfmoQLwaczwV+a7bqvgIzPS7Yk75H+yg3qF/T/nys5ehnM
         9CXvv1HkR25rGtW7NKYO4CheA9rgGXpseOZb0PwJYlT6sMlEDNUIXtiD4GFu3Dqy+fT9
         l9qxw7c89DVC3djdAmaVV3RigSLuLvZWRbYvnYGcZthUWfoKPFFKvcPCi20dM23uprL6
         65Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MWsR468tIvrM3cAel2+h/IK2I8O0glNd0lF4xCbxLn4=;
        b=e+5GBy2Z5EO0XQnyMXc0u5ZQjd5xZHhklYMiwCVjbnMsFhGZHy/KHkOGIsHT01LuAH
         7umDBp67fDsMcSvjPXuqTq4nnYudU/ynrP51dLEMA4Zjd9aZDKw5PH75F+JkmBYpG12j
         /iNXQUe9QYRYIFz7Wox7zFU/dTdnfrqiwcHJdMeJ94iEp2JRce6MytupBSIAt5oMiB96
         dL+ohq08YzutemgNMfU/nqidZmY+5QdYwU0Xiil9z8k3S+P2gsg/saSyqF95YrcnX8ad
         qS4M7rLDa4bN7re1Xnji1MrBVe6yDG4czlunhJ2Wme3yI/d1453wFi9T8RqCEXtRPT9P
         QiVw==
X-Gm-Message-State: APjAAAXFTaGFe5Xvg9O3Bp/EqRTSzO3RK+rV7lCvjB4U+kdeCrK1fD9/
	npMluMW+M35S8Chv1UKFKtGR89wi
X-Google-Smtp-Source: APXvYqwa2AUTiqBWCnShkEMIDIZfcbcI8PrTItWzNTqe8ieIw/nzfDbKCqg5kdeHksuDDXuPe3/JeA==
X-Received: by 2002:a62:2582:: with SMTP id l124mr53554217pfl.43.1564671212952;
        Thu, 01 Aug 2019 07:53:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id y23sm74089182pfo.106.2019.08.01.07.53.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 07:53:32 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v4 04/54] target/arm: remove run time
 semihosting checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, aaron@os.amperecomputing.com,
 cota@braap.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 bobby.prani@gmail.com
References: <20190731160719.11396-1-alex.bennee@linaro.org>
 <20190731160719.11396-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d7e3ade9-b0f6-b767-e0a1-dfe56f04c842@linaro.org>
Date: Thu, 1 Aug 2019 07:53:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731160719.11396-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FDtna4HFSVKV

On 7/31/19 9:06 AM, Alex Bennée wrote:
> -static inline bool check_for_semihosting(CPUState *cs)
> +/*
> + * Do semihosting call and set the appropriate return value. All the
> + * permission and validity checks have been done at translate time.
> + *
> + * We only see semihosting exceptions in TCG only as they are not
> + * trapped to the hypervisor in KVM.
> + */
> +static void handle_semihosting(CPUState *cs)
>  {
>  #ifdef CONFIG_TCG

Let's move the ifdef outside the function...

> -    if (check_for_semihosting(cs)) {
> +    if (cs->exception_index == EXCP_SEMIHOST) {
> +        handle_semihosting(cs);
>          return;
>      }

... and put another one here.

Peter described how we can't get EXCP_SEMIHOST here from kvm, and suggested an
assert.  Well, the assert is already present just below:

    assert(!excp_is_internal(cs->exception_index));

All we need to do is not return early beforehand.


r~
