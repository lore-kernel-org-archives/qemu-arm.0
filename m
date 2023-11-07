Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp207453ejv;
        Tue, 7 Nov 2023 02:10:04 -0800 (PST)
X-Received: by 2002:a50:9f24:0:b0:543:e42e:128e with SMTP id b33-20020a509f24000000b00543e42e128emr13173693edf.37.1699351804005;
        Tue, 07 Nov 2023 02:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351803; cv=none;
        d=google.com; s=arc-20160816;
        b=sSWDYO5R5D9tJwlX99yFhewGlxn0vkuAgt28ztCfOTRKH6t6D61IojKRYYYQcbPeYj
         Q4afIx4w/Z4mFnK/g1VqlnL344YC3R+p0k1jPJnU8lCmwEpi6tUU7C10ztSL1axxOwoT
         bITz5sWzehGRj3fSXODkX+64uXp6EIf/b5VwdfUYIKTyvBcgcpHrSHP7RzRK7UTv9Npe
         WuC/pbknJgAgivrp8xegNfJaCloOc16ykI0R1gW/roW2GyU/o3R4Xb96aGeeoUq+nCWB
         ZrtiqBloWf47Cmm8o5gyeXgIXG5wLDNQiEst6jguKsS/QpbL3fcYYFYY09SWxkE2rfBL
         7OBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Dc3a0ysY6P4SIvvDatF+i7AJx3PzPsT9pYZUa0VjZjs=;
        fh=KGmh4890KH1+11AD+oNRzRSvRXDCBxYbCMx1eS5pbik=;
        b=K3DPDOiYcuxsmnOxIwTCwTYxzkxByc5m6msFJ5F8YC/ksrDtygnE4VM4EfSaKO6w4c
         wJVOtzcosMO1ta1Z7sJUXmcSLbogTH7iQCHmuL9rNOKzuZNTJXLIJE0AOLk6CJm7UFZu
         TV5OPq8MdJGDn5yrAhJvIQqfQ5Zn/G5juqqcwG2TTeSEAPSMcpFLHsUWrC4ZgEi4c066
         SvQ1u1RMLqnYmxGXiT1WLJ7V7HuC+WGsrttOWoaNGH98CBgc5/N2xcrT9nzM8VfB1XbX
         7hE+BxpN2/yfn+SV4jyQJ2qVe1Lw4UnY+z79nnL+XyfZ13a9OvROxLq/IxPPNckdYVHS
         t/QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnCByU10;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e18-20020a50a692000000b0053e3fe03330sor2784510edc.9.2023.11.07.02.10.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tnCByU10;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351803; x=1699956603; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dc3a0ysY6P4SIvvDatF+i7AJx3PzPsT9pYZUa0VjZjs=;
        b=tnCByU10SC/xv9DktdaMvJFg1K3Qj3e9lVet0tW1Zs35WDl3rolLpK1EHPqu8oHP8s
         jGPNNwNQrqSEfpCPLLl2OLcrNA5pZZSB8NPE8IibB4+fnk7RecfVDAD1YzJ8WWWFK4Ah
         xifVGj4TMnEsy4GjYhx9umhEuubM5E34C53nBpqaEhbF7tJyTBSt3TzPbefqO/WRfy8Q
         d8yZFc3mW1pNfUGSzvOC8HBgDJBQsEwDnQ8t/kJFIVBMSNp7zMDDbTPcGc786op/57mV
         zoqGOGLTG63tF6JqIVTUn2dz6Ehas2a/JMgU7uG7Mm96hF11dLPoQWN587zHlFqfQ+bw
         7fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351803; x=1699956603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc3a0ysY6P4SIvvDatF+i7AJx3PzPsT9pYZUa0VjZjs=;
        b=os2csWiQJtkr6mWwHS4VhczqMsJLG5BXTPeHGlkZz/yfHsGYWhMNP9hKbtGLdCURET
         GBViEQV3cBL9hgVxexM9e2c90cHZxV0F4FR5ksCcr6kUu0WQMKofzxmPYbyKYc/LtWog
         kxd4yDlZ9h2O+guVPDq3ESng+9IdkR7BA6uD8kE4AO82L5ZX4Nj3R7FnOejWaGjHK/5z
         uhzprR2u0M3N+DzRHg0GNps9nLwnxbDsLm7kaFV7+0Smh/skOxjTeU+wuBxwPU+LEAT8
         KBXLkoX5A3l0dgOGpQeX6g45yq3Q2zieMk2zOsJLtPwUTILkMqv8fVtjh0LK/KiJMAEl
         VWTg==
X-Gm-Message-State: AOJu0YxIWzA8EKkELcp818Q/cZw6kOQUqvBDqBLdTjMnyDjZ6i0brvQQ
	AFWiiXWw5lS+cmq0hB/ziA38x4zA7RxJCC1X8Qwm+w==
X-Google-Smtp-Source: AGHT+IHWFwPm5zci4Vt3ElSD/515CKKEAgv9mjIbubVUA3BzLQskyeS+wc/MoBSl9/6CJVOXhIIWdg==
X-Received: by 2002:a05:6402:cb6:b0:53f:d261:7945 with SMTP id cn22-20020a0564020cb600b0053fd2617945mr24000139edb.21.1699351803329;
        Tue, 07 Nov 2023 02:10:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id k28-20020a508adc000000b0053de19620b9sm5450734edk.2.2023.11.07.02.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:10:02 -0800 (PST)
Message-ID: <959a8a53-29be-4d88-9ce8-8e512c1ccf4c@linaro.org>
Date: Tue, 7 Nov 2023 11:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] plugins: disable lockstep plugin on windows
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
 <20231106185112.2755262-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: G9qlO/dD8DfO

On 6/11/23 19:51, Alex Bennée wrote:
> From: Greg Manning <gmanning@rapitasystems.com>
> 
> The lockstep plugin uses unix sockets and would require a different
> communication mechanism to work on Windows.
> 
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-4-gmanning@rapitasystems.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-29-alex.bennee@linaro.org>
> ---
>   contrib/plugins/Makefile | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
