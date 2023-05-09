Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2769551ejq;
        Tue, 9 May 2023 07:40:30 -0700 (PDT)
X-Received: by 2002:a5d:6401:0:b0:304:7237:729a with SMTP id z1-20020a5d6401000000b003047237729amr8133956wru.67.1683643230671;
        Tue, 09 May 2023 07:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683643230; cv=none;
        d=google.com; s=arc-20160816;
        b=0XCkEltVyQyz65EcF/eMqYQ1viEZcymfJ7HUxvdCbVS7EFy8fmgUsL8dLnOC2mSpuH
         8NTurRC65eM8FuvPbSE8Io9rEx1/fcoBxoKiMlqKWYHKFWLuKDC+jUyXGE6hjLE2FPak
         DQAX1XPmlLIgu5sR96KS+PkeySO9JHyvkh0DLW4t/Sm8R2LcFWexvhVoa4JlJk3fe+HR
         8kXtKoD7v3A/UEm/LvhnEfg2wBzKfHHRG20XdJnps/R8VfdFeKEoZnU6sSn1otinIEqC
         DYL6fnwua+u9QRWmmPtRYW3BSckcUVJX3a9LP8dKD6Fo44q+/rtbLIdF9e4VyoJ+PUEF
         jlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sNPlmCEXFQpje3H4hu0/8e2jihhR+IgU30AifxYCDVM=;
        b=pfer39pz0Nwrp2//YelMC8z2SxBPiOOAS/y65Y2GMqHdbkawTgtfhBXPycwwvrl+Ov
         QrZLfdw5JLPPZgpJqqBwDMFu+SwU5RCdZIDFxBNtM33Y9miACr8VPLtk2eKEhmyOYJNo
         6tbfSi2WsN1KtHs5LPy3VHBn6PO5VPVg3IPfSHFPVMsxm3AJ92GbWIWfSGS61p3XBsjN
         vrxQouVUap59Qu7iO6/CWsJPVM0sUwRHQFvJ/kOjj375TEA8LpCd9MuiYL7TbS4KGxaW
         QNflKBelmBoojOhkZMUC6/3rlcvmLLAXzC/Pwej+jWzgYCLEvMQD48yVwnRHSVIvOxFs
         CCkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qYqTexIn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j11-20020adfd20b000000b00306264cd631sor4354077wrh.6.2023.05.09.07.40.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qYqTexIn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683643230; x=1686235230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNPlmCEXFQpje3H4hu0/8e2jihhR+IgU30AifxYCDVM=;
        b=qYqTexInUFPbwi2OQnroKXlJY/UTHXNa/TmHGcGnHe8LhLA2/hxYJOS5zXNFgx2RkB
         lrobwW7mLHRNJdOHXkBXbWZd9j+zg7Y5dFeSgoN6ab27wGuG37ztXQFpk35V2qGLT4XH
         NELC1HYKBAHCn8OTdFJFu8h0QGk8JO4Z7kvb8RjeHRTGXWmRQ4EYcUTxWYJbz27bvJ30
         epwSHe5EEHhnNO5JWIhf3od+sa04+4wCDQrrsjR+qDck9AJG0HOdxXGTola2wQsq5kVg
         7eWtzb+HPtl4UEBgygLQa3b+QYWsKX8zehj7N/Nuf7LZHxkpdAHeeeAM+iryk/fq/ZuL
         rNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683643230; x=1686235230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNPlmCEXFQpje3H4hu0/8e2jihhR+IgU30AifxYCDVM=;
        b=DvskQXuyvjmXKf2DsM5ZNgzGBL41MyP7ievm65wiqu/yfTvXxgjpz2b2njWfi/CoIp
         wS4c/Tj1FDqAOZqq9gOzpSIdTNKq2X4hKx0oQ4k+mGuG46hbS228xCtHgJHGXegRWizk
         9OK7sEWmTIrEXIooctyfq3awm8khH0GNsebsnPU2ava1ycfXwn6Ub5mgR0WJH5Sej9ef
         sS+wIWn8lbRZMqS4QgZRskyEmRMnOaJgN+L55VDcnyEfHsJisfPTpma7jCMZekEuYw5E
         1JJyuKmeCPwp5VrBmQ5sxvqpJb23tpbM95ZgAeGawy+4sWjsT+XfpQyxOyr3+cZSMPdY
         AoPw==
X-Gm-Message-State: AC+VfDwDW3KWEMnXy7V6OZ5jrtsK4FtL8k/p1blA36km8jevfrw2qne/
	FpsKvJFCUTqQ4DREwvJ3WMRGYxU8em0y1KG5MfR+/Vhw
X-Google-Smtp-Source: ACHHUZ5rcmDCY5zZwxhUxUEHiXBJdVKeYWsJ4ZQxafbGn13u1DkSz67M045/P6tRcnUg9yr+HP/l8A==
X-Received: by 2002:adf:ff85:0:b0:307:92e8:ec60 with SMTP id j5-20020adfff85000000b0030792e8ec60mr5403503wrr.39.1683643230231;
        Tue, 09 May 2023 07:40:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.11.23] ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d4581000000b0030639a86f9dsm14489880wrq.51.2023.05.09.07.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:40:29 -0700 (PDT)
Message-ID: <38880262-7702-7653-ec79-791019b7fd88@linaro.org>
Date: Tue, 9 May 2023 15:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/3] target/arm: Select SEMIHOSTING when using TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-2-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508181611.2621-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Gla/fDecBypJ

On 5/8/23 19:16, Fabiano Rosas wrote:
> Semihosting has been made a 'default y' entry in Kconfig, which does
> not work because when building --without-default-devices, the
> semihosting code would not be available.
> 
> Make semihosting unconditional when TCG is present.
> 
> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/Kconfig | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
