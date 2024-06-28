Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp514151njb;
        Thu, 27 Jun 2024 23:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNa+uLQeYAJSwZkKVg6phq2SzR0zVfxkGvHYMc0qTosT+grrS/Xk+QQzEK9fwrgr5kDwUYHxl2fVhODIxVFCchTuA2BrXg
X-Received: by 2002:a2e:9e18:0:b0:2ec:5488:cc9e with SMTP id 38308e7fff4ca-2ec5b2e5a63mr118005941fa.26.1719555557419;
        Thu, 27 Jun 2024 23:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719555557; cv=none;
        d=google.com; s=arc-20160816;
        b=PQ3SzxXTf6i6XqDug3hZmRFt362fqMnqevXAZHl/s3VldtS7tBr+irid7L+W/OdybZ
         L4x15l0WHgDGz2tbS8OYUNpJRp1BnYPixtafHCriOPXEsiPFxMSCc6i3KNECGexQzHkQ
         8BLTlNQ75dur0HP+b6Uw6C4rVt1b5ARem2tZGgbLkTe2NPyU2P0TbsnLLVJ78Ftulmzf
         OX1RfrSsy5PmZJTu7tuM42Db8UGrWppEliFyfpkha1ki9gdi+f8eOneHdA4uYtuLCMkL
         68lVWMFVNDqG0gd5/qcwSMwigSPbb7F09sSWlkTBj2e1Myx0V815G6IZXYwjvk0/iR5q
         yO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nac15weJy2n70ADaWLadboiJpUDMd0DFCULHo4IUwtY=;
        fh=ltJVVyOicsSVuIFIsWtVlZBmFcccoQwO0fgRKDwZym0=;
        b=USRLTMJ6pUDmDzyQ4LXY+u0kKsYeODxIjBuJ4thvy6c7obDi2+StpjdvtFFe/Olku7
         ztvvXfoZylngTFURaWubYo3a7kOOg5Ry9joklaJhtq+EenixgBRxKZQpM9S63+7OqktS
         PoaUhwCRToy3ZmH9juYMXvRW+V5onu3AIxQfioO53ZERDNL1MPWb9a7IeF1//9RB3gbL
         cMe96E74/qGN4/4Dsv9yviCLlbyn3AO/0heuxUxXyTHg5zFi86JVuDMzNOWPwVwt1zq8
         2lB0r4gmNOWRKGldGBnJvw4S2vOlGoFCoQPjeM12poAvPR+KzpkYFeuni2GErYmQ6sVT
         qw+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBlTDKyU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee511fad44sor2701371fa.1.2024.06.27.23.19.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 23:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBlTDKyU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719555557; x=1720160357; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nac15weJy2n70ADaWLadboiJpUDMd0DFCULHo4IUwtY=;
        b=XBlTDKyUji6DdExgSyCQaGDqAF6m1b8dhc/au90zc8ZMN0YvWZduFbU7Iz7rocwdzB
         U4iuYoAA4MbGVnUevK+4H/mt9iskfkd6w2+nBcV1QxYvzxBpwGWMh17pLXDQvVoSvdH0
         TRYshtdew21gkiiJIBnELGUCFc93ymBRgRDuv9f9yswH3ezmKZxFnMjFy0DFWn5fbvM/
         n+wNm61dP130r4h9gS02PLLLwUczERMOhwYrL6yeZJD7GGJSnhy8AkBBhpOAMc69KnvQ
         WealhQ9v9lTUs0+DFsSVo1eV7NFyyR6s3BMILuJlXV5fFMHEF5rE3xfshXuNrta+kV9y
         haqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719555557; x=1720160357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nac15weJy2n70ADaWLadboiJpUDMd0DFCULHo4IUwtY=;
        b=BAmVLMCMgWSOPw2AF3UY81ubBVouRrBwuEoTC+mA2iknxfzhHtgJGsMYUeDLk0ovMv
         9HLUwa8viDUfu7AhWgWLRbmYh9yTivJmtB2w2rlyJuLYfEGGLda3N5Upyat85CB6wZgg
         xNOEvofnwtGE4Phv7FNOnK51BQ6P32wTPHAUZYKd6HcqqAxLPiG9swQxQN2QGHGidh+3
         gwX/2h011LGv1I2fR+j3wqBe9g4cyAxpNEWaELAk6N0ljeK3BBn5Er/MoQFIzROyDEfj
         sejvPR8rRnXarNOS74RoOKksz9brQjaIw+kofpjGGmLDxdxXdWA0D2nhfxQsDt7ezxPH
         o41g==
X-Forwarded-Encrypted: i=1; AJvYcCUpc0P0NsZYDRPILOoT0UlQsIaN4/wq/5mxSowACziTedYQik7tAU/IiEsA50H45iZ+7qe/vRm4Q5Q2zDMCJzHkPATAxDJu
X-Gm-Message-State: AOJu0YzL6VlS4TFN/KL2R8VZvnMqOmIxMd+vDadtgSZmjdXkOwa+xIrh
	WSh1icF2XuRkQAS9L1ZWhSec8OFRo2Wuqd2FRIyZuRa7zGSrrbqaYmWaWyIDFCfwQA==
X-Google-Smtp-Source: AGHT+IHxI7vYp/W95VNs2Nsrxirhsuqtph4rJzieiWISuhOGqN5Qzcxn5gitUdQB9TCRn9FNj1FmKA==
X-Received: by 2002:a2e:8242:0:b0:2ec:597f:664 with SMTP id 38308e7fff4ca-2ec5b2c4fa1mr111251491fa.2.1719555556846;
        Thu, 27 Jun 2024 23:19:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cho94-h02-176-184-4-239.dsl.sta.abo.bbox.fr. [176.184.4.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbd4sm1228880f8f.84.2024.06.27.23.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 23:19:16 -0700 (PDT)
Message-ID: <ce55f409-a343-4cdd-8a34-ba8a87b95c9b@linaro.org>
Date: Fri, 28 Jun 2024 08:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20240619124903.56898-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240619124903.56898-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VlARKIqcyZ+e

ping?

On 19/6/24 14:49, Philippe Mathieu-Daudé wrote:
> Merge gdbstub64.c in gdbstub.c and remove uses of
> target specific TARGET_AARCH64 definition.
> Small step toward single ARM/Aarch64 binary.
> 
> Philippe Mathieu-Daudé (2):
>    target/arm: Merge gdbstub64.c within gdbstub.c
>    target/arm: Always build Aarch64 gdbstub helpers
> 
>   target/arm/cpu.h       |   8 +-
>   target/arm/internals.h |   2 -
>   target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
>   target/arm/gdbstub64.c | 383 -----------------------------------------
>   target/arm/meson.build |   1 -
>   5 files changed, 364 insertions(+), 393 deletions(-)
>   delete mode 100644 target/arm/gdbstub64.c
> 
