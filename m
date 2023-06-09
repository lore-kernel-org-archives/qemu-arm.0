Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp635734ejb;
        Fri, 9 Jun 2023 13:49:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:e616:b0:118:5d5a:f26d with SMTP id my22-20020a056a20e61600b001185d5af26dmr2421348pzb.59.1686343787637;
        Fri, 09 Jun 2023 13:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686343787; cv=none;
        d=google.com; s=arc-20160816;
        b=cNhXEO/aWajd6iQpakwedbdM4ekApr7C54iM5POHGQ29v9zPo52M1BHgQQMtToe9uR
         Urc8u++Wm3B1GDy7O2Bw8yF0gX4Exy/NwEkdakGppCuFGNZ2abjWIplx0H+qv/YKjVfo
         NPh9MpMQbAGQglzX1aZwz3K8V4R8y5srBVVYYMQ76aBzR3u5Nd8N/ysh5QNSHgX1fbaz
         4wOoJrocqrFw5XIuhhPcO0neUxFUGbEVkZaFDZtm8WaPjvdCs6UekI0mj2enTDI+5PaE
         GCWnHmUuyT4SNc3PWCecPL7aZh2nuLoLPH/KAe7fkAUUGmkrh1XqRj2qfeO51O1xKd1j
         XHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5hV+JsGhirEW8FdVQGSUv1SQIoavraJHJWFX9dxpTag=;
        b=X4pqseXDKRl8bfhAI0mDw+s83uNKrJ9iLZPJS6ujmRaL5HToph980QSiAjZASKGX7q
         ieGAxdlSqgb6EEnrz7Yi4IzK9YS8rqL7+oQmBtupKi2Uku6kywd9I8uvklstptzjkBkO
         SNs6bFRzkMvvuUd/EiB42rvWwaDLbEorer4C5z7mHzV5uWOqELeg3c0IWPECjeb8o2bs
         2uGg4TCAXxn2pn0QfG8N5McRoNqCbbh/6EekquMIfkw4Xe+zvdIDel1NYkes9zTVrBXd
         6Ex/vVKYvwB5Gb8R988RtfxYSXANiNTEwfIlA/oCrJLjwPMo0XiRUd74nkRX9D6kn87S
         BYSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7qnNMyK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c124-20020a624e82000000b0064359ec15bdsor1792317pfb.0.2023.06.09.13.49.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Jun 2023 13:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7qnNMyK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686343787; x=1688935787;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5hV+JsGhirEW8FdVQGSUv1SQIoavraJHJWFX9dxpTag=;
        b=B7qnNMyKmGWljqjDOw8XctGJoOzKxkebk1+qEfW+D+oVNwaYlxCM7Fd/3SfLy1U2Q+
         l8Op8JEcfOajkzRgHaAWcGNBTg3pKpP0SqK1j8oIc340C0yZ6XaIj/7ul1B8YZRI6vZP
         KiU1F8cgf33xSNhw29Q7Cpj0OcfbWtu2sehQPm9OEuc5ji9q71sna1+okzPWRDanyYxI
         QQF1Aef9FJr0vvlwTdvdVj4uzIfvmS9h23zmVkW7TToaNANzvl4EqIEfhueuyaw3S6yM
         ob/W77YdNCNeNJ5xM9NScKAAo86nls3228kOiCxndVTrKa+MsTAmdbRUNWJljTWkw2SU
         gp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343787; x=1688935787;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hV+JsGhirEW8FdVQGSUv1SQIoavraJHJWFX9dxpTag=;
        b=QY356SXlkowzooHTdne0JeNfiHDyxaiBM6AkTFQ1in59x0p/4Uvr2xh22l3w/y73ar
         oeBSo4qsVE07Bk5ky0EsaB9KivhneBqnoJ9EVwNcYLIR1Mil5G0x/kzr/WSJXq90noB4
         pg2kLFNnJG85KnaFESXeC61BXOnF/RV1XdP7LWeT/9hf+Gdv/cLAhT/AdQFunLtqVNJt
         2uxPcGgp6EUeapS3xh9fT0S2MjQtfZ3BXNA787z7MrCSWkLrIXXgUf+OVFNmTQ/Gj1MZ
         cvyuCLpcEwt/cxsM+wUuxClqE+c7waWx0dZ1umNU8t878l6NijHzOyinj9Abj0kDmeye
         h3Ow==
X-Gm-Message-State: AC+VfDxa6xqJDDkyYU8zlb5jOEKlGqMs5fFyV9Q3fHBiyJV86ad/QX1F
	JdqC2l6d65rzmGnAKCajaClaB4G9G2q07B3uCkTIJg==
X-Google-Smtp-Source: ACHHUZ7X9zRqf7jIQ/gWhbbR4zvEJ4Zh4DYdqWddwCAcsy9TOUbXGpAVV6+HGPrqzWyPVG2PuN4UMw==
X-Received: by 2002:a05:6a00:138f:b0:663:716e:e752 with SMTP id t15-20020a056a00138f00b00663716ee752mr2824969pfg.26.1686343787161;
        Fri, 09 Jun 2023 13:49:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca? ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b005d22639b577sm3009775pfh.165.2023.06.09.13.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 13:49:46 -0700 (PDT)
Message-ID: <a8db353d-b258-c856-d5ce-1236b0893a53@linaro.org>
Date: Fri, 9 Jun 2023 13:49:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
 <20230609172324.982888-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609172324.982888-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9J8GOWkjmf3y

On 6/9/23 10:23, Aaron Lindsay wrote:
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>           { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>           { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },

Sadly not defined for MacOSX13.1.sdk, and it's an enum so you can't #ifdef it either.

You'll need a meson probe for it.

Otherwise, looks good.


r~
