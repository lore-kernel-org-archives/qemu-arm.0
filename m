Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1071153lfg;
        Wed, 10 Mar 2021 18:33:21 -0800 (PST)
X-Received: by 2002:aca:1e01:: with SMTP id m1mr4707841oic.101.1615430000993;
        Wed, 10 Mar 2021 18:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615430000; cv=none;
        d=google.com; s=arc-20160816;
        b=MwaIlnljVb7QuN7mLBw1Ra2GePbvVorzasQeHWbhMPby2T0g7OQtcb5j038jyc0aF4
         Dlx5gXRV1y9IIrgbHsIIhjW/D+AT71egb0UZxlfiZgGA1IMKCCvVMcEk/jMzWVWYj1Pn
         dSzTimmWPSX8xKR5M0d4k/CqTQjTnmDZMQm7khIAAt3qzq2ZrV+Q4Dr5xzdMm5TQFkfC
         PlTG4HzflfforzTvAMpb8emcj+NTwtM3DHS+3SJZwPx+wvC6AyXhzcdHyWOWGc5onEfF
         YE62FQEwPFxZ3K1mAOfVuxVWgkDg9jJK8bJDBeWcq9VLUqBGyuwaXJKlVMOxJa/XcoD/
         Ka6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=5/uFv6KQCLRfPohLdWpHFlpjk2d6fczZnlkiCEmx6R8=;
        b=fAnJGpGYMXVfjE28/VOd5KATW6FiiTIc2o7KPdYwDCpNg2XoexvmxOPu4I9/BomG1K
         YmgJvDBQ1E030MzXYyNL5JOq4TnBVRIkOL8gyR8mjwW2ocjveeKshjbd7eP5tcftjGfh
         x+1vt5LRaQKT76OJk5y7HPlAplJn6JYrtmi98dYgrGYe/0P1aMbSsacKq+Esk6zN3tIq
         jw9/gWpB1yQ2qdCLhLDqEU9r6sWt4j7Pyf53I7po1o9kjSjMjAiBjcqhlVMhi3NlwtDt
         fr/lJb9iI12ZNGZGjKc9J9CLtPr78Lf8tEYXCLW8WrF86KghjBcxHQawe1WN4GBM1RLy
         /92A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEqao0hD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w82sor392191oif.111.2021.03.10.18.33.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Mar 2021 18:33:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEqao0hD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5/uFv6KQCLRfPohLdWpHFlpjk2d6fczZnlkiCEmx6R8=;
        b=vEqao0hDXXU1Yif6uEemPvrJIPyaMUmKKSRri5GK9Mw2uLwF9So5qlWF1tv7m5NxXb
         OPlRn7moHNEFOy0RVK0UrdJ64s/E8hr1x0uDJLFZJ7kfUHhPaiWz1ZN7KKY6ZycGyFU3
         8M+FoPuA8G/qtxcF/JoFM6AXj4zhX9EMkPNs8Nhaq9AVv9wMk3DJ6nIzWL3QFZLendcn
         mA6c2dpLCY/xSIemSPRusfJrAy19lig8gNH5lrF3GdbGZ66uzEC+yQoZSjq8hkz2CajT
         tlK4Viig9AowkiXm8APffoIKuMcMUOfCWBR9c4ufis2UzAO0xI3e8iix8ZYZV28WwHzY
         odkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5/uFv6KQCLRfPohLdWpHFlpjk2d6fczZnlkiCEmx6R8=;
        b=uBMBfm6etngVOk+36cHlhuobesm2Xbjn7jnrTfIUf9oT+nFoOd4OE8iHs8+q2L2mSR
         YBY7elIb4Y4BKJKmn9+W69AgrZ/bv9wU3eTjE2ffYOzgoEPsf2xukgJJatc+UdItqDqh
         STG4XncnorqFM2WSomnNMsnS32/KSjen9T7RSwbDJt2sJ2iPbSzDU+ZikBgWimhyhstl
         2f7j3ZdOaZVQqNh47zqxcpMDRrxSpLWqxPavFewRLzuO7Q7GFIbOVr1P5lcQ4LrWIKs+
         IGZT7imimOUzwmrllrcffkZY0H7wZXDCGAFY4GDT9RXNYBUEGkHqMTWxKb8ZnG3jeR6L
         O9HA==
X-Gm-Message-State: AOAM532AQsmXC98gWwqBdmihlGHJcSL9j/pDX0VJycNyzrcqxzNMTfao
	f/FCybrcxVgV3cHV15UWuYgt73D+NvCSbAysI6A=
X-Google-Smtp-Source: ABdhPJxwUASfSoI4TeUAn7wQMRqDZY129G8ylRmsbLBWVU81FgJuCmq3jw5OQ7v4WRTHrpZuqNlTpA==
X-Received: by 2002:aca:39d5:: with SMTP id g204mr4789092oia.63.1615430000545;
        Wed, 10 Mar 2021 18:33:20 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id z32sm344931ota.81.2021.03.10.18.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 18:33:20 -0800 (PST)
Subject: Re: [PATCH v4 00/78] target/arm: Implement SVE2
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
 <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fddc702d-1624-5a81-0f4a-011c477d0a96@linaro.org>
Date: Wed, 10 Mar 2021 20:33:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: meRfEwol8QrL

On 3/10/21 2:17 PM, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 16:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> After a 6-month hiatus, sve2 is back.  This time, with RISU
>> testing vs FVP 11.13.36.
>>
>> Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
>> ("target/arm: sve1 fixes")
> 
> Are you hoping to squeeze this into 6.0, or can I delay
> review of it in favour of for-6.0 stuff ?

I didn't expect to get it into 6.0.  Too much too late.


r~
