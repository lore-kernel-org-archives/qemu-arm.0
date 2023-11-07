Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp206227ejv;
        Tue, 7 Nov 2023 02:07:15 -0800 (PST)
X-Received: by 2002:a50:8a9c:0:b0:530:7ceb:33c with SMTP id j28-20020a508a9c000000b005307ceb033cmr30199226edj.4.1699351635497;
        Tue, 07 Nov 2023 02:07:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351635; cv=none;
        d=google.com; s=arc-20160816;
        b=M8Wd8Hg2Qab68wjgzVEy+y8f5ZgM5BF49IX0XtRzY/06DApv+ZfBr2+/199bhbaa3a
         bKFwmHttEDQMSnjJ26FDw2IRjFzR8PchpYWj+t+fCZsFXRWSbYyjj30SgtJ86gV2mzMd
         QLZUwzLW2dUxc13IB+svwCqzuEobvmQ+TZVnt1AY/vhUGCvsy3Ik9MFZWiNdB9wBnROB
         EPf+uat1iGUrX3RrevvH6JWTigeUKZYvQBaZObfOSU3HKe75xNvaPany/LCBlBNKIE3Q
         KwzWOK8zhOlWM1fdhlsviPdVCCNQnbYjZPJ4PsmVnipeNLXYLGPmr2lal9Dze6Amqou9
         ya6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4J4kkJz6O3hzXVOuXR6sD805VbvglzIAWsKyxbWp16U=;
        fh=gMY8UlsoIBmwo0UFMYAAq23+2J11l0vZs73wzi1paoE=;
        b=z+MAZ+uqHyONktH58RqARVDs7+NzOOmzE8iwot61zJpEGLxWxaGd62mb1NsRhaLGmf
         CTs8EgKADesWU+DSc3cG1Sf7s8sj3nl92U2vf+vEI2vW7hX+vvxfTE78ZzopQSC4GHi+
         kZy7+iiCwH6e3cC4BVZ/uCEznOosfcv2YoJ4FnTGXZbcX9iGb4VLCyxuMzGRueGLBNCl
         oFrZq3EGuhJ2CGfiF2WvDaQ0GKrvW7xJ8cRhMvDsxvMtCWfl9BlLi830CeJ10HuSzPBs
         aAOFRKxQwdZYDDXEs3q5hmTgbaoVKYGsNrc8eM/8kcEqywtUvlaPvdRQ7DlSxL4Rn0GY
         22/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMNzeSfc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e18-20020a50a692000000b0053387c93811sor2796491edc.9.2023.11.07.02.07.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMNzeSfc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351635; x=1699956435; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J4kkJz6O3hzXVOuXR6sD805VbvglzIAWsKyxbWp16U=;
        b=hMNzeSfc0w4oiR1gcx2cWcKBAyilRK4qYaLkOUIJAGRvqTMitxkzvKWjJgssDW2J+i
         R1QI7Vcc7hrLcMbh9A9k8+YcqCoSl5ncAxvWcVtAwLR4VjxNbS08HzxRanpTU4lhq/N5
         dyWM0znrASke0KWNn+2PGHNk2dmw/xxzmIm8VPbIjn1vHPZFp9kMHcwTQurkC8+P918D
         GhsE8l2hlZzeLFihfYv62pvSuzbbgQqhUys9imlylBwkO8VR1e+J5r+60QYAUsR5+8A5
         0YjLM434hfG4RRY7ihP7TmGq72pNebCHdSbB0hvIQzQV+l2WCCo2s3aWGVUCUfC4J46R
         DgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351635; x=1699956435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4J4kkJz6O3hzXVOuXR6sD805VbvglzIAWsKyxbWp16U=;
        b=h993Z+fNFjoUdC+1m7GZ8kZOYVKPMmcZmxCxrpLfXa47K+G3lc54siADu/cpCCDNJa
         SmY1kiSBwsT+b2yxTkurawSJ9Lx2Be2LJhDRbvlfd8MF2xDQzJQ9mlB8ArWv5f9EGSF2
         YJRFfskGC3hrFm/7NzgRQkzeKQw/Z/kQPoKntfvoObPPxp2Clnyfhwv2ZTB2QtU5uhbN
         8obybaA/RQG8ms9WQRDXWDZUIRBnZ3i0sUhWchXvW/T/KIak8nhpPCMgZJ3mWyUxzPe2
         y1cakcUfxVKv+ZcuHFUFmxAV2DZ2/g2bVDEUPXLaYVT99i2v2TWyGMtY/43TS17rCu1a
         do0g==
X-Gm-Message-State: AOJu0YxU/wd5+6i3dPHKRU8gMgK8kh6UqL4LsQ5swcw9Akj9CfMnUrum
	2aBH9PC9q9mr8y5sfJQzwWpRa4ShvOE59Su5QuhPxA==
X-Google-Smtp-Source: AGHT+IEa4iBapsSkTdbmpTkrVbt8JCJlS4kDAwEO7LPYSa8MoSJiIUNPUtBSoLBr4ZNjpNbMx66nng==
X-Received: by 2002:a50:d7dd:0:b0:543:72cd:e14c with SMTP id m29-20020a50d7dd000000b0054372cde14cmr18722361edj.36.1699351634899;
        Tue, 07 Nov 2023 02:07:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id k28-20020a508adc000000b0053de19620b9sm5450734edk.2.2023.11.07.02.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:07:14 -0800 (PST)
Message-ID: <3bf96059-44a8-4af3-9b0b-c9f070cd498b@linaro.org>
Date: Tue, 7 Nov 2023 11:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] gdbstub: Add num_regs member to GDBFeature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Richard Henderson
 <richard.henderson@linaro.org>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0NFnnQK9xRix

Hi Alex,

On 6/11/23 19:50, Alex Bennée wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Currently the number of registers exposed to GDB is written as magic
> numbers in code. Derive the number of registers GDB actually see from
> XML files to replace the magic numbers in code later.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231025093128.33116-2-akihiko.odaki@daynix.com>

Something in your workflow is odd, you should keep this Message-Id,

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-9-alex.bennee@linaro.org>

and not propagate this one, IMO.

> ---
>   include/exec/gdbstub.h  |  1 +
>   scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 45 insertions(+), 2 deletions(-)

