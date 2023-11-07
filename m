Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp206904ejv;
        Tue, 7 Nov 2023 02:08:50 -0800 (PST)
X-Received: by 2002:a50:cd92:0:b0:543:3df8:cc95 with SMTP id p18-20020a50cd92000000b005433df8cc95mr3272809edi.9.1699351730107;
        Tue, 07 Nov 2023 02:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351730; cv=none;
        d=google.com; s=arc-20160816;
        b=RQVO/7obyAwsmH/IQ9L5n8QBDGHjUXT4FCRTY44X9Yi36T1oHehhtZmoY5q2xHv6KN
         FEJRYAUJTVeOWSZXyLzJdsLfSz/CJlDId2+AkPiRdC30MLKjuuhKnr/G9lfeskD8rpEY
         ZFfYgvNH5PhUE3zQ8W3blvyF7zpqLaIhTBnsJ2kLkAXm2BkWV7NxJVJpZe3yZkxRZonK
         HAvLNBveGe9oSBnK+SJ+hbo2qsj+vBMCTHoan31DQkDZeQSbicN4Ly0/y2Tv68XrPHZH
         +bADEIXP7o5cBfnTgiPpAunLpvAHe6lADK5HQQasfobOcW7Gzh9WW4CmBt9pA/h5JDnB
         JHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PQ4+o/piKsP4ORGXI6NCo9rYNgG06wEm+IZM8VnuqEQ=;
        fh=KGmh4890KH1+11AD+oNRzRSvRXDCBxYbCMx1eS5pbik=;
        b=0buOQW0bu7tmAVnTazqg7sFvU8vdFDQNuNlyyXlKrYRtvTiSC0s5ir4gKHA78h5wk0
         DaWF+jxN65U7VayrGmN2JNK52kEKYQcnBP+ZRoYGdEzoxNYpvIjBaqaCu+I6F6EAS34I
         HqUAyLqbOUeOUjkQ5hkF+e20HvxhP4g6uITkWQ42I6zuGDhEAtaZIDmAnuRkRmK31svL
         ZzitsLT65ZCkefGrRMNB3RtY5DU6NWcx7i1eRNMmEW+MUPu1S+PmhuDCTZJsTVOjzNOf
         UBOi4085HeKYK4BxzPTIjmuCYpAE404ut/eXa2rV1xhv5YsSzHfuY4P7/UVlyL/lSGib
         LNfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qW+XrhiU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j9-20020a508a89000000b0054049560fe4sor2785187edj.1.2023.11.07.02.08.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qW+XrhiU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351729; x=1699956529; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQ4+o/piKsP4ORGXI6NCo9rYNgG06wEm+IZM8VnuqEQ=;
        b=qW+XrhiUUWKDdKxPCwZynO28LZZ8CRwrljouxSJxNZZtmwn65F/Qyv/buWVbZPXZF6
         mQJZ1uS8JHqPz8XUP5pjcvUdy/U2iyDP9yEVYJOD6DHrHgy832DPKrZvFe8G6O5Ou7d9
         jSnKXFOXH5/47+mrDIa71IsNR5cUz682yl8/bE/GQGKPyjhGQ4Q2fvhje/EnTkgmvwdB
         BVLXlDiTyiZ05CQR69Fn/DBrmkKhmMulb+feai/Q1Jv8R7KaV2lT/MjZfnzz2hwaMaW4
         NnPYymMHlONp7CCIP5jdZDGtO7iEhYYDpNVn1sjHj7y+0eBT7S1sIj0kH3GsxRguXekZ
         woXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351729; x=1699956529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ4+o/piKsP4ORGXI6NCo9rYNgG06wEm+IZM8VnuqEQ=;
        b=CNvYo6NckWsPz/BDneJOBs1iP5vPbKvX4jV45Ud4ovgCLVCTUJNSPcI9InyrrBjp6y
         j4SgFjkeihitFzk+M1BZCks6L4HCAVpPCDo+S16XhsNe/LllZETrhCQEcMc0IdCekKXe
         fv944439cPEfuI8SX9E5Tsqh/H/runrYuKf7zWnZnRgJ3QyiHrELjU3Jgbhv0+liX07V
         wzunAHW9B30n/UfPR2Fac29ra/llnTie4VcCgnmI1MVd7Gqn2kqI4uoJBIJnlbN91V6I
         5itqGAXSb7GYS/4UfEDTLP29pKIcMNf0n6OgJSNHquy9aufwFxn34iXzMCPiBcqkhAq9
         bq2g==
X-Gm-Message-State: AOJu0YxU6MXIR4ZgYRjbvgdJJt0qqGzcvsZTPSCBCM6Wx2Ch/3pMEU5u
	hho+tPcK2Okt+YNh7A+g9jYtVaNLUo2o9s04ftq8Fw==
X-Google-Smtp-Source: AGHT+IH4ZgHA4uTvskcqGv9JQ7OLDKf/rC6bwDf9MANmBxj2QVs0GS+vS5x17qm+RHLVw4Yjh2gSYA==
X-Received: by 2002:aa7:d5c3:0:b0:532:e71b:5ead with SMTP id d3-20020aa7d5c3000000b00532e71b5eadmr23307697eds.32.1699351729518;
        Tue, 07 Nov 2023 02:08:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id k28-20020a508adc000000b0053de19620b9sm5450734edk.2.2023.11.07.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:08:49 -0800 (PST)
Message-ID: <3fc9185e-1780-4eff-a61a-1e334518e07b@linaro.org>
Date: Tue, 7 Nov 2023 11:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] plugins: add dllexport and dllimport to api funcs
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
 <richard.henderson@linaro.org>, Greg Manning <gmanning@rapitasystems.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Mv9GCimc75X3

On 6/11/23 19:51, Alex Bennée wrote:
> From: Greg Manning <gmanning@rapitasystems.com>
> 
> In qemu-plugin.h, mark all API functions as __declspec(dllexport) when
> compiling the executables, and as __declspec(dllimport) when being used
> to compile plugins against.
> 
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-2-gmanning@rapitasystems.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-27-alex.bennee@linaro.org>
> ---
>   include/qemu/qemu-plugin.h | 50 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
