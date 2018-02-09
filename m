Received: by 10.28.71.27 with SMTP id u27csp1239875wma;
        Fri, 9 Feb 2018 10:16:14 -0800 (PST)
X-Received: by 10.36.3.17 with SMTP id e17mr4793895ite.41.1518200174400;
        Fri, 09 Feb 2018 10:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518200174; cv=none;
        d=google.com; s=arc-20160816;
        b=PtiLZd2TGtfcoNIIwtK7UuLbTGqiNIMMQ9b046fqg+DeMNYw+Tgt+h7c5SRKy9fhdq
         Ys7Md6Sp9iV5c6+ROfKh95A03vcPRG1kwy/ts9dHCsCp74hnjU+n6sB3Zmey1G5ZyZ41
         8xPMZCzyxd0UVaQpsTAQ/O/ksa53Ojlb7VINEbRpXJjRHE94G7IZ6OD7Wc4mybLoEPMx
         RDbPQbpJn+lS97v6xsq36kbGOPxJjUYnydAXlaO66kEy9mpAhkUJ6qM42QjkLvOEFLxv
         1bn2SM5uvFNS5Ckd3jPxPfgbChw/HrDzGFHiukA6W55oHO+ThQ0re73qSEdf4g8F9pkQ
         grUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=YNWdf5wsSEPSVoVvvWzKeaIAQjxlcU9y6JcxVBCTeJY=;
        b=k/oWL2nhQqqa46FQpcdn02ed69KoBn9sPSaIc2aaqsoMShKwZryD5JqYL45Jm4SU9X
         wiTLpLYk7EGfaXqHGJX+EK0HegAHkXvwRMkrvh3oWGtDMieO8SrgG6LFqITDGKkBi4R1
         AYr27pkvhg+v2Jrsq9DYI+4juJf+sqYYayoRiTfupw/8xyvSprCWsj574a4F8jLD25eb
         LQx5bSsY/7V21zCizPV27JjyeG5n9f6wxCIoCn9F1VyZCvio9RqrNeFw8uvOI1IhfIO7
         HcYxwwBFkEdi0/x/mI2jgq7HfHA3G8QIE/NG91qijmFUteW2u1iRmj9woNWVRf2mvGug
         6G/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0VjOiZv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v67sor1889819itg.3.2018.02.09.10.16.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:16:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0VjOiZv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YNWdf5wsSEPSVoVvvWzKeaIAQjxlcU9y6JcxVBCTeJY=;
        b=R0VjOiZvFUj5jo/3wn0spasKC3lZovIsM4XmZoNqtq2cFi4ad7MtLRgt7yIlSwxJMo
         JSLAIgR0QFbpfURnn62uxdnAG7mgZIH6xAPL7jmkQ+DMcz+hud22t93QxpkIVQNmcfxa
         Nep2OU2KSkgwOMwpwsaGNbl7W3OcSOdSJnhWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YNWdf5wsSEPSVoVvvWzKeaIAQjxlcU9y6JcxVBCTeJY=;
        b=EWjPLZ8VwgShhE/rDSY0L3gE0XjMFcq1fq3P4i6GA8FVXNTe0Vdc9bZHH54sjFnu3J
         D77dPV4w/xGpCQHSIqYRspzQwbjfwJgsx9ETwpYfs3ULbNMkiLwkhSwetpiCkVVmcvva
         Ah1yzIuS4NWLYvchejx2BBl2NNIjh0sSzUJZloiXMGCl8f8ujKY1pxUzmBsbc9sg/y7x
         en72kIk7Q+oRMmOxu6YpTgZJ8dOTP54czFGpOZSPrWdpqp+c4Xwcc4jJsKKs/aBrqpE/
         7Iz25PeuC1Dw31QF/qAAinEgkqoR7am+MV14c6yW5Zjw8HqCUTJXW5jsVGbqXnNkePGW
         EmWQ==
X-Gm-Message-State: APf1xPAxXt6LUUkGPr95xK1O0NVX9vxSkm2zVSip2uQS6FwMrInp1UVM
	PKaEZsDOaDDZcaCfumCEFR81f4py
X-Google-Smtp-Source: AH8x226T++zgrKGHrBduLmb14ZqT/QkM9lRwIEFlYOQJoChovQl3k5YWUW1wV1Ysxu0jALI7GtuUqw==
X-Received: by 10.36.48.135 with SMTP id q129mr2239876itq.23.1518200173967;
        Fri, 09 Feb 2018 10:16:13 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id k66sm2255520itd.8.2018.02.09.10.16.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:16:12 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 28/32] arm/translate-a64: add FP16 FRSQRTE
 to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a46969e2-a22e-b65d-56e4-882f0d04169e@linaro.org>
Date: Fri, 9 Feb 2018 10:15:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: n3YxHfCO6d0t

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
