Received: by 10.28.71.27 with SMTP id u27csp1216886wma;
        Fri, 23 Feb 2018 16:29:03 -0800 (PST)
X-Received: by 2002:a17:902:8b85:: with SMTP id ay5-v6mr3374452plb.329.1519432142833;
        Fri, 23 Feb 2018 16:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519432142; cv=none;
        d=google.com; s=arc-20160816;
        b=pTIvFgPiJ0KVU0ozAF38QwZ5hNafvAXdS+SnCCvUWim5ykUmHaUCZEFbUfTZHrz0+T
         xF6cT0NEtR9OJ5Lnn53elB1au+4PH1MD73SFJcElZOGSXmyob8plGtqd90W/TQZDZvzt
         maDzfJ2W2ULZ79JLPBFKGCOMGh+3R4jT/SN/oKiNiwEfltgK7DwtwynW7Z8YnaEKrqYJ
         uyZulAvdTfLX2xQ0yxWLTS/u08ekp6D1QmHXhj3IycCBRhkR3LgD4a3+jMTb5rN7z9mE
         IdAmisg00+wJQKpLfjrb4P/03D4Cb3upfuDq6q9bWZN8pcCN2xLeZlTVyd2SN/WeBvFV
         cL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=vLbhAncyPhMQJMuEd4JnOTs8wAdOjT8cMafD8CC5iQE=;
        b=SIm8+mHyaqPJ5iXXxm/3q0G1VlEUWfa6bbymRI8gIHEbTMgN5VUQDpmH3NUbWQM5XU
         nAlSY5904e0T9CNpW5JSaDZGVv7vzNAM8jp21Acmw6f/ohNvJT10K9v5FOgNsR7c0Ovl
         Fj4l+4iZPbDkd3PLE+huZWEI799LM26GvEiryiG/7Sxhe4ir5uUiieXe7wuQ1+DLeI1U
         blOiJ5Hd1yPowdkK0NEsDi5kVI207VJ9Oga6hbKdfFkb6LIdlot+xEXch29kJTWSNZij
         5VI81lytR/XVQLTMN5jwJh/DvkTtkMRFMoWMdwBiASL8zWRwcPXnxeVEtxRvgbxhP73c
         Pohw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBa7IxMp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3sor801274pgq.381.2018.02.23.16.29.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:29:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GBa7IxMp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vLbhAncyPhMQJMuEd4JnOTs8wAdOjT8cMafD8CC5iQE=;
        b=GBa7IxMpNx4H/FOO5a5zLxXsCfIS9BMcqMtDfaKSw/vEQNGmKCaqnh4WL8H1cqAOof
         sCKE+tRQB/SIedvdIDmJAq0SbEkZcVbMiwWXpJap3kJ39F+NS8Zvj51sm5ZPVsBSwHGK
         L44aWoD0cpLcTKcGUYTGxZ7+FhmYh4hD9Cya4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vLbhAncyPhMQJMuEd4JnOTs8wAdOjT8cMafD8CC5iQE=;
        b=ozoQo2pWkHC3NrRoMw3Q9ygrHUYSrLqsQW9lgey70pMblvhdqiVth48yXR1DsP0NAG
         dzIepbIg7J1V/82IG5/keKNqGobRMORIlnNTtOFfGPHv48KidCEMazUbWQooIR+BSp8u
         M6GtlLHofE1LBijfPIiGkex7VywmE862H/ODH9XQ1gYKmF1gY37PfYb4kQ3ouvcmEpDW
         DWsLbnhRMEK4gJwZY9dD0JfmlBOM028EzAx6Ce+OecCXF39NcnkUHBVgA1KLAzZ6LICL
         Ydt26qR1/PEg/ag1kT35hbvIA9F2+7udKIW3/3Jubj0mXOL/ezOxrN3Cc0Z5CUYpha5R
         abnQ==
X-Gm-Message-State: APf1xPAEyfYTU/yYiAUdlRT7EspRyVyEz+Jh6uwo+VGCMl8kO5qT8WQe
	iGBi5bsaSAnjDedV76KHAHTkaw7V
X-Google-Smtp-Source: AH8x2248LqxsHWcblhKewXpAi4XTaRkhdkcGamLv9q+y0y4a9/kjbe/5o497G38yu4CZzsM9NpHoxA==
X-Received: by 10.101.86.198 with SMTP id w6mr2717930pgs.434.1519432142289;
        Fri, 23 Feb 2018 16:29:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id x26sm6176883pfi.141.2018.02.23.16.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:29:01 -0800 (PST)
Subject: Re: [PATCH v3 21/31] arm/translate-a64: add FP16 FNEG/FABS to
 simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1bebcc59-0987-b204-41af-0b87172e0751@linaro.org>
Date: Fri, 23 Feb 2018 16:28:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FoOimpfYOFTy

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> Neither of these operations alter the floating point status registers
> so we can do a pure bitwise operation, either squashing any sign
> bit (ABS) or inverting it (NEG).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - fixup re-base conflicts
>   - make both operations pure bitwise TCG
> ---
>  target/arm/translate-a64.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
