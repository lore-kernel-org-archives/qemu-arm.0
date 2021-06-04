Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1498749lfa;
        Fri, 4 Jun 2021 14:14:28 -0700 (PDT)
X-Received: by 2002:a17:90a:7342:: with SMTP id j2mr18982635pjs.10.1622841268541;
        Fri, 04 Jun 2021 14:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622841268; cv=none;
        d=google.com; s=arc-20160816;
        b=OS/d8CK8mWAsldcMMxpewoucXNaVOpdPJq3YXNJesun4EOp5IJNEsoX3UNzjLo3Fo8
         vxYPrzcvrXeTT6uHLXdGFqfEmH7eqdEwxoFk+9bAMF0zpmw2Cwuf2KbmVaB4xCmsleOa
         Llwnrcm4EzDs3ymZ9Gg5HCPp3epAI7Rq6zzWwpxEaz77MlXWNdDNaJGyzV9cOZcgn2V0
         LqEZgf9px5xbXdakKer0PjoYX7/lpen4QO0XFOsd+pFp15Nujk90GdY4ikgvbIIh3P4F
         /sp3oPQWsk2D10RvPPdyYVPh5+OwHm2v9f65/NLBKbDy6kZyKA+QtcP8I7B8tZ8l8szH
         4mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=BdrAizjIxYH4XH3uw3xvhU4unB1yfjyW0vhYhp+aWTI=;
        b=Pio05w9YT2oedHhhALpF73ow51LZhE44Uf0CqFUiKwlorixJfZqeIuty67Ox0Ebey8
         hI7wBvgiY1JXq1w+ywY27z91H3k4Y6HMx1iLZtdllsa1sXw5aK3rDRFWwgKIR4SV3DXw
         vpHA3sNU5P52O8bplvDCPJa11mEMBVbiIWvwF+dJdrT4/Y4676L1CHCostDSVRWUMiwK
         OIIS6Tk3nJbE6ayCB/iW0oCJ5pgxhGvAqt/YCtx8b7ePrphiuKr2JFVHW+8Q5DxfNsbW
         nmMiIFxaj6/0SbGZ79OIRxSH91lRUxrXgK/d8mJ242MSPsL9zTmwwr7Yoh7E+h4EeQUA
         1xjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbLfvlGb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w24sor4153434plq.72.2021.06.04.14.14.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbLfvlGb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BdrAizjIxYH4XH3uw3xvhU4unB1yfjyW0vhYhp+aWTI=;
        b=RbLfvlGbi7Kln0OuihYjUHU/0gH4UIallB5Y/oPKc7NeAthGi9IlOQzCS7lHPDMVlU
         UpyZnLhEynaHcFPjNZ6lNK+jEKnrdQ4k2ANN52LZEx4VpG3a/L0/ISr2AxdyEpk0/WzC
         bM/RfYz79FEBJKKvn3T9mkX8vECRfeKvjngfvx9fjfOdH2seTm0fUXismG+a6mc0j/mE
         O9PO1lDxYlATWoMz0XDwq1Qff/q3kxh3nLJVCm/euNBidyVWodlLW+1U/w7KF5QXovCK
         TPlyhjT5z73EQrWWBeRhkOphOu96ouYn2iPW6LMB4s7ZMIa++jYLXwnERhQtO7bAtNGZ
         jdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BdrAizjIxYH4XH3uw3xvhU4unB1yfjyW0vhYhp+aWTI=;
        b=A0loviKvShL7EcHIb5RQxvVWMhPNzzNC1VRt/v4zBB2QPvbQsDGBoWmFCb/9tfT+qu
         CYNSbfvyRHDLBY9/HTYE8LGSEIBTbkl8CVM5E+58qdaFGvM3dIMdaqWfDRP1DHV81mVy
         kyoIR+H2jM9NguOynGeRPEJUj3Ywsty08SQ1KAoxYeHtMS9Z2c9DhyFnV4nuYC00yZ1P
         vCZ1yA/XwELgESErlzXHGIS5ZuRsy/pgIZQM4sAMPHyHB2sttWvxi0A27FRdSMdalEBs
         A1XzOxas6u4QQiWhmQWT9YHlOp+i/G7bz3umv7iE4L/4ue9sO9zYdtVT4uBNSx3UXvpj
         ZP9Q==
X-Gm-Message-State: AOAM530tH08Ow+MEKYD02kBYhozptxabr6Ya444Gh4HENfJ5U1MvJQ1S
	o39scSnUqOEMqMU1AZW2fp0gAKoC
X-Google-Smtp-Source: ABdhPJxi59zxKd4iQPmKDZtwEdhuOwxFx2PfQ8ZuCTS+ZXwwyUjVnJfPWGgfZSnl+hD0ZOXUg91F6A==
X-Received: by 2002:a17:902:ce84:b029:10f:a857:1e73 with SMTP id f4-20020a170902ce84b029010fa8571e73mr3570614plg.72.1622841268077;
        Fri, 04 Jun 2021 14:14:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id v11sm2478990pfm.143.2021.06.04.14.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:14:27 -0700 (PDT)
Subject: Re: [PATCH v16 11/99] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5925bd98-60b7-d4e2-5ce4-75bb9034d69c@linaro.org>
Date: Fri, 4 Jun 2021 14:14:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zFNzBPUddu6H

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Reviewed-by: Igor Mammedov<imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-12-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
