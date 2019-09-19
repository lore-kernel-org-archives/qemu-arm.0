Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1565358wrp;
        Thu, 19 Sep 2019 15:09:30 -0700 (PDT)
X-Received: by 2002:a63:7153:: with SMTP id b19mr11158857pgn.10.1568930969983;
        Thu, 19 Sep 2019 15:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568930969; cv=none;
        d=google.com; s=arc-20160816;
        b=yOnSqWuDWGV4KZLmTDP3YiBBQ8wbB5kT+zwJz6r8aHraD1c5VCViRSQHVFhXf6rpnw
         ZnaruzL1OwrrUFugtbWjighN07YYILwsLwsYdgZflECBkbTjg3wo5ElAbjOkIODYc0ef
         934TrY4PLWjt3UckT86iKlftlfryVQ6cKCzyiu3e/bWi+/ttTh0R0dB1RS2Hfq3Zpue1
         sIeK4gsZQ664egVxPRHakP9MlA7pWoMaXXptc9Sa+E5q1cL+vs7NlDA0UmP8k21r+/1r
         UJ5cA2UKyiM0Tv+mVrTZDOEfcB+BDqf3OeErof1vmANcQ68G3MPjTFXGOMDMFlBVIDf8
         NsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=DkZVL945NAnYHjWuiXZVXLZifIDxk/sIZLtif3ChFoE=;
        b=UH+d4AkQ/c9kunBTa37etxapDtpjRFVfiMEOsM5sbRcpTXvt/u4PgXhC8yfmsupr7H
         AsfMZrg3Hes39RWyzalxTUSTC0Yr2EoRl/S2oQXZEM/BwzwSxbv3e88+vMSpApUWjlFJ
         CRHQrF8GUkpuObs52b3xjkNeY2sUyeshsjam4I1E1MpQEWngq1zVVUXQJxOhOen4I5iA
         ZjJl8INB1U6mnDOwjZ5VjM9lJB4w5LOnL3ippidGfEdhMed+DAOGcgBStdXkPWcTDCF4
         4mZUTQIB0h5uG8pNy3MxCrzPVf5/tTrYzpNBhcFCi/SMw5dZVhPSX8YUShzHGakOzpK6
         mqTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ljq7lKhP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t17sor9180843pjw.24.2019.09.19.15.09.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Sep 2019 15:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ljq7lKhP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DkZVL945NAnYHjWuiXZVXLZifIDxk/sIZLtif3ChFoE=;
        b=Ljq7lKhP5vhf0x3PV29onNMfkxqUiSH44ZvtKQz6ZkLngzVNTZC5k0cvtLMK5j8Kab
         k5I5ODe731GeEu1TF8vrDVwhGl+KNTqr7xbGl6Gh0iwroi4BHBrr9IWVoYZ2Myqj7PtG
         SBBQZWbZ8uTGdfiBpJCwYd43E+MRVod15lYLHzhQeU+wJC8rxUg8P5DjX8bpKCPblIGd
         cl9Gv1Isl09P06Q5PM7jSmqjdn0KS1XY6noF7qfTeiQZMkv/GqCiHKz0uQeFzQd/L+x9
         y5kh7flp5bdjnVg3VxDsFnCfWcfy7fAMf1s87KZCBq30JRaLd2RClyCEnrdH5mXJiGT5
         K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DkZVL945NAnYHjWuiXZVXLZifIDxk/sIZLtif3ChFoE=;
        b=MrnCaHp3mk+hftLNlcphPWrNXRpewE1HjP3fiPWMw+y0CLhLfyA2oG+z9SY9kPolrE
         jzS+NkPrMvYDbqHDQK897czwhLemSeMbw2s47e6bf9WglSKv7lUovFtXQEUIHqBVlsX/
         u+JjrnuUk6ipFME70YBCPEmhyKm0YTvnofRjptNGsq5ezkKC7H8wCEFY54m7oFzMUDG1
         iemLWGwi+ztoqtio9h9PZP9VC++J4hBxZ+tf+RX9xyB0oiToJ6ASASLGaj1J+vR00ton
         IeUZoq8vWjX8mLJ9B08w6TE2Tn5yCcFelzYNKnralsAsWygi7E+Gj5F6pE7Ed8VEXZn7
         rl2Q==
X-Gm-Message-State: APjAAAX4C+X8Czp3+J+bSallT46NB+kT1rfwOOCNdSFTdOIPzKtHX/DF
	RlX/zPM23Z9PqgzjYng4qbV2dBwq
X-Google-Smtp-Source: APXvYqwZGF9/EjxGtzE7GXn0x31jpAMryJ8X8zyBtjNDW9E3/1eENt8tj4Gyjm+tUcPtsEKH3z7ZvQ==
X-Received: by 2002:a17:90a:de0f:: with SMTP id m15mr128386pjv.107.1568930969517;
        Thu, 19 Sep 2019 15:09:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v68sm4052pfv.47.2019.09.19.15.09.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 15:09:28 -0700 (PDT)
Subject: Re: [PATCH v2 10/16] tests/tcg: add generic version of float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6cd971c-e84c-c5c9-b313-2e454e02a1da@linaro.org>
Date: Thu, 19 Sep 2019 15:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RWfhPhMzUubx

On 9/19/19 10:10 AM, Alex Bennée wrote:
> This is broadly similar to the existing fcvt test for ARM but using
> the generic float testing framework. We should be able to pare down
> the ARM fcvt test case to purely half-precision with or without the
> Alt HP provision.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
