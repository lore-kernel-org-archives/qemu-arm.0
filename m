Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2306576lfa;
        Sat, 5 Jun 2021 15:41:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr419829pju.181.1622932881109;
        Sat, 05 Jun 2021 15:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622932881; cv=none;
        d=google.com; s=arc-20160816;
        b=X5YMClZvq5+NFDzHFjdl4Elbfo1CU0KQU6It50a6FsmknzGv2+xju/ECr4l6ySvrrQ
         UPESVTgSUQ0cWi0Om2VHUj0mwY03EEN9QIa1oMgwf3ZMivd4Q/XwyhWy7zT7M+H8ANyO
         MFNRQSTBHfqKySaAm+/p+sFDoP35QJYkqAL9XeEwqeukGTWsWQJb+ImAvoZhe4xnChyy
         8CCgspWGUjSJNjPiKbA//i9WuHkKqzBFjFbcOuJGScclCl/sC40i9Ol785VGdyP84D5G
         qyvEE2KWENViYZymeKhwfeWOk9PQrCHo+YmDEz+OBfm08YnYwdCPAMcOpiijZP3Hu7el
         MP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gaLWJfHje98Gjm2MMF1fHfleodIABZfvjbmBqYOUzMw=;
        b=QzmaioB3BJYE3Ytl85AFCvJgJD9TWz3FMM0gPpqsEjAF060rB5xWjDaHXmvH0pwDCu
         3gBgKpFgcSFwjmi8qG2XMSyJOJxNeCNQLnpdVZpSxkFZ2i2xJLNKnnMXISOnfZpTwidq
         xYeTlvFWPOdEYzLd6uEhU2ex445r+fV/ECCTxhp8g9ShCawkbGwVQGfucVlJm2RGStei
         p6R+pCn0jt+GwnWmGcLCfoZyj6FWQkm8vR+q5ZLqyJbUHNvgyoB5co0ZGrVeopPmdJTA
         jlTpJWKvtvCS41syI6/CGRruVjVXxKTC6K58qQ5j/uygdsjHvyFrZ6cWnAtEIWKWkbqo
         OoPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuY2KFD5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k23sor5697860pls.73.2021.06.05.15.41.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuY2KFD5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gaLWJfHje98Gjm2MMF1fHfleodIABZfvjbmBqYOUzMw=;
        b=LuY2KFD5SXmOLauhC0t96AT/CjnG3Vg8f4VdzdypbvcMpmRmO06gY281v3iH4r8b9z
         omWdJHjDSwnv9EQDCSf1QIJxdQ0v8WOpNlNfdwvXlSBlfrx6Snxdg5miUaF58AHu4kDx
         Oupzv4gs+OYaW4xVUgEgu2nfwvKLJugbw0Pe/kUKWhECphU7Pkw1SGkLfRImmMd0iXbC
         TbrMHEroUHlbAzWl/jgwIH3R7at+vsdlIIQnSEkmgfnPWwRNSs311eYk3DWqIhg0wO6K
         xXOhY/+9ou9sc8/i7KtXP/HO3dz7IFbVUGZ5GnJv6mGS0vKHCYODNbu23NwvkIM6ocCx
         4iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gaLWJfHje98Gjm2MMF1fHfleodIABZfvjbmBqYOUzMw=;
        b=DoK6/lS0K+7yercWTnEcnfIDrdzeEZRBfdhVbuQC8EcMqvcT3BIW8GfNEoVGOBFZ7u
         C2uNj9E8rUw52oHJ70wvjlNi1XAhb0wt0J0gGQPVvoGY/yJYKkn/DwOYKHiBhSoLienO
         PPjMXwHpLZr/bSVijQhSDVrFUESr4pDf1jtkpYdff9FiMYJext8kF9wOgwthWQIB3cfi
         BZTG78Zf+Ev+w77i6GsrBShKZB4hImd0RujJbc8Se0jwg9eczQ18HlNDgoHSjNmve3MN
         s5TfDaY38Wy2HVAYm65pu9nsOWO0f3olfKJ7zxpg4cvCBZlr9ISIuleQ4DjMTxRwbdxJ
         Upbw==
X-Gm-Message-State: AOAM531BQNxitgdVlfV2BGGVl2Ns8j+f7d7xgmBbtAE5sP2EvE7g22Yh
	N8TazgG5TtJubTt9dQV0Y1DCrUMl
X-Google-Smtp-Source: ABdhPJwQf1Q8e+JfLyJxMa1w5iscotQcdsasPeRYHfNL0EEzk1Y6BbxqI3UApopQrLAVhWtr4z8f8Q==
X-Received: by 2002:a17:902:b609:b029:ec:e80d:7ebd with SMTP id b9-20020a170902b609b02900ece80d7ebdmr10952521pls.75.1622932880549;
        Sat, 05 Jun 2021 15:41:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id o139sm4827009pfd.96.2021.06.05.15.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:41:20 -0700 (PDT)
Subject: Re: [PATCH v16 94/99] target/arm: move CONFIG_V7M out of
 default-devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-95-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <393ec928-55e9-1608-358f-2b5d4dbee96e@linaro.org>
Date: Sat, 5 Jun 2021 15:41:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-95-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QnV+ZhKGY9j/

On 6/4/21 8:53 AM, Alex Bennée wrote:
>   config ARM_V7M
>       bool
> +    # currently v7M must be included in a TCG build due to translate.c
> +    default y if TCG && (ARM || AARCH64)
>       select PTIMER
> +    select ARM_COMPATIBLE_SEMIHOSTING

I don't really understand "default", because if one were to set ARM_V7M=n in 
the config, things wouldn't work.  But I guess the comment sort-of covers that.

I'll give you an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

anyway, because it does seem an improvement for the --disable-tcg case.


r~
