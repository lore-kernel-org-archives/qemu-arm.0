Received: by 10.28.71.27 with SMTP id u27csp2529967wma;
        Thu, 8 Feb 2018 12:49:32 -0800 (PST)
X-Received: by 10.107.11.161 with SMTP id 33mr446271iol.25.1518122972221;
        Thu, 08 Feb 2018 12:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122972; cv=none;
        d=google.com; s=arc-20160816;
        b=D5mtWoRVk9t/QonLuG2kgxV8zDViXsLTCXHWt47lm4Ow1c1lILJdRrKP3wcI2+IpwK
         jqufAxLOXKzUTDPEVCF9KazP4UzDKoC2MW0xGTf96u/so6krl3hmnipQfct1ZwKS4Dkt
         DdqVz7UYXz3zotMbLyNUw0PTrcz4E2upZMyudcktR98cPLyxzYVSTXtjrlY7dbO0LECA
         Ki+lnc6EDEwnuKkgyLCgy94BPTqr3CDe2yC2qQxrCu7VnI2FbPKgvW3kKtZ01trxFELY
         K0OQPWZp9kw14kRDCWXDnheiTY4uHl34OwF1IMHlGBeoigdZ2spNst2h4CvvyL5lXiWi
         wPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=QiiMwBciKjspVcAwU8fepuij6+wU9+4TfvG7meSbbXI=;
        b=mAB7pOUFUSkBRr0x4yaE58q8JIXYM2zTZVtD944mBRtWsUoZfVNtNC4gaXuHi1yaSB
         HEsdCJftQxUicr/p7k9z0SghBWMlf2lHDX20ay9OS7eXlFXv6YRI0+Y/WXQejIteucFy
         Z23c+7x7p+Rp4OiVm4iCYZJ97QK4vW847qQP8/MNCJRWABJtb4o+pKQUKHQk068gOJOF
         Gwcvs3q432RPsdCONDqrLi+2rh5ka1N46L9QKNr8hyj18CkgCeCiPM5i5408fKi4B4y0
         NYeJClFyybNHudMPkyDc2lnHTiwGXOzzpiveIMUa0miK4pS76iujS8rfDFuNvIZaFGUZ
         bOkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFwuUcUi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e4sor409054itf.141.2018.02.08.12.49.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KFwuUcUi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QiiMwBciKjspVcAwU8fepuij6+wU9+4TfvG7meSbbXI=;
        b=KFwuUcUilphMeC1Y+zJgP67n9Rswe3TJwRuHxmEfv0Lw3e/VjbkpIy+4mvNpa/tvTO
         UZNPYAEWxpVoIXa7PJOhBzVkWbxMFrjudB0ByUGXYgnrHy/WKVhAFa2oLzd+zEwy2As/
         Pe2lo//czCn9N+DqjJicnTOZbcCVlSZgTJHLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QiiMwBciKjspVcAwU8fepuij6+wU9+4TfvG7meSbbXI=;
        b=WpgApNTVhMFeLjg0cKEvg+Q7RVSgySVFRr2Kt6BejbjY+VCXiUgkTYu3O+vhRskT8t
         SEE30ulcZo/uYVKyEmzMOrM2SxeGNZYZ7Kvl+ippBiZ7TK17LtAmYaDVyUAktYWLVLR/
         JubEJAG44bVXdSrhTTVFLAmXqJb1+Gaqa71Dt7ie7UtCJuuPqcTtZbCO6b7N2rI1mH8/
         3cfe9wnr1aWrf+CvBwgL45ycSeknJ63v+Tk6rdduHk4imVTKy4/7f67rdJBS7o/AXp9g
         wXcZRal3x3pfDP7yH/Cfm0SlF5ZFjSzUAmvatnPClJhZ3NrCUkqd+L5P9j9cgrJeLwDp
         9lKQ==
X-Gm-Message-State: APf1xPDzlMG5OjPCfUX2G3/9JJS6wdXuYVkS6bAKXo3kWC0XfMAO8yJX
	7QwPIdrspzPOcpguHj8Pke/4n6DQ
X-Google-Smtp-Source: AH8x226MO5LQdj/m+niJXJRdyMJCWp9yqw1gGkknUy+EXH3kj1b168qvYLXFmPbtzb/w+JtnxweSjQ==
X-Received: by 10.36.61.137 with SMTP id n131mr637551itn.35.1518122971853;
        Thu, 08 Feb 2018 12:49:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id 191sm610749itx.16.2018.02.08.12.49.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:49:31 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 10/32] arm/translate-a64: add FP16
 FADD/FABD/FSUB/FMUL/FDIV to simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6490bc6d-b35d-f9a9-1016-fbc85585b328@linaro.org>
Date: Thu, 8 Feb 2018 12:49:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xZZFzxUw6OJ7

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> The fprintf is only there for debugging as the skeleton is added to,
> it will be removed once the skeleton is complete.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>  - add absh helper
>  - fix checkpatch violation
> ---
>  target/arm/helper-a64.c    |  9 +++++++++
>  target/arm/helper-a64.h    |  5 +++++
>  target/arm/translate-a64.c | 28 ++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
