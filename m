Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp428425ejv;
        Tue, 7 Nov 2023 08:25:03 -0800 (PST)
X-Received: by 2002:a05:6a00:330a:b0:6c3:3bf9:217e with SMTP id cq10-20020a056a00330a00b006c33bf9217emr13876128pfb.19.1699374303001;
        Tue, 07 Nov 2023 08:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699374302; cv=none;
        d=google.com; s=arc-20160816;
        b=h8ZZy3DUN0cD7DFmngdbZZINqdU6XmYG0gBALu9rtt0DJtBlJesev9ZNHva5gPrUnG
         7WbhIawRLuu+0qGtXn9lifJYPecPxb9XIrBoMb4/QHDzadFFRc/B2nuvRcQNhvKJLi/t
         I2Sk0Qja0gdgPMTfZg2LG8j27WloR8TC/d9oS1iRZRsdP/orucFyc+3wr5iyHB6R39yj
         ZhTchgSc/G7JxXoivjn9HkKpWqhjakEBSgVGU0ohQDLn4zHmSIAUdytyHiJnaHOJ1Svl
         3IQNh43ch/aPnpRGMU8XcZ6iUyg7sa0BSE9MNsLxfo7WCLFsvQX07xYY9kbCndFxfpsv
         S2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jiBMQtFaRAbRZNi1909ketm4O8sZfl8p9AS9bIPRbeo=;
        fh=QtC87gM+cU4kPin+pkw7vfp12sdG2rmNqdttRauGgu0=;
        b=N8Cz9DXs4OMQWXam32O3/+FUkUiQ4yWgyVCgyiceBvDKHnnFPJpsryIJM6GezRtnVw
         9s5TZgquFJOiTRTqkhh/h2kHLZ3TM/60chaUFJP4QhqwoOSbU/J/1cpds97SwLuK2jbk
         tY0ZPPM/wDIYkn8HSDAFKGdiZbrlYt7O4v4nydHGl0ZvMmwG/QoisIpvy2fddPjbcOCZ
         coaoYK5HN6+2js2ir465Ovk50LT5nQtyhTrsKPCg3tpaO94O89pSkBnAYZhIrkQ0ayXF
         dd/brf9dTLS8oa0LvKfWwgJ+cHm+EiND/Xq1jkqLvksAhy65nK5vMz236L4E4DwvLTOR
         YlGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOhlp0U4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11-20020a62f90b000000b006adc96fd535sor4124961pfh.12.2023.11.07.08.25.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 08:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOhlp0U4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699374302; x=1699979102; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jiBMQtFaRAbRZNi1909ketm4O8sZfl8p9AS9bIPRbeo=;
        b=dOhlp0U41U1V9QgJGAFOQ7jweRbejxnYfY7MwXeuZW08z6038jssskOhJMN8p4aezk
         l0SPZ/u9wztaYCJbtIb5kZERkWYSzCDpEnilolyUKyZY4QPC8hGUuJgtEkzdYHIZsZi0
         LoEgaji9OqyCyB5xuE4PQ1zSy8sqN0bQDAKFiLNP4N37kBY7vFKTFi4rk66/iOGiAjGF
         KQkPL9AzCo3vwLZxfr7RUto/ZmAv8VNUvVT4iL/FeHNLEgbP/cMSF1Mp78N4gi75F+0G
         xKR/E2H7g+XBJXO+115qvVZi/LV36fFwaWdN/nMGfaVybk17fNlFZ/RFYonDBpmVg2U9
         +zoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699374302; x=1699979102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiBMQtFaRAbRZNi1909ketm4O8sZfl8p9AS9bIPRbeo=;
        b=DFqhJdprI4LURX3Mm+oMNyP9hKtKXZCz+zEloV4F0DsKeve2tXzCfKyv4LMmP7aCpl
         TgrKmUVoivgNZ6I6AUm0cphZbPXeBIpcnWfGDuiyAOd16OutcP+TDeSWYrzPUtkMWGjY
         XDl0pgyrFgOkQ1d7ll+igxgO7z0kkjSdzBPBbGyuThNCaKEe7Vcx6OArzFNhiMO3pUdY
         eF9Wfj36meV4TVoA/mT5d+N/klVmrjvj6yizAfHwMy1ve4F+o0TivHh51M1HCD43IVCq
         b0NYSMOcNeF/+r1eynGnUTbLg2GBbYvPcGcc7tUycXNwpiUT/BmylMxHaVmc5y9infTW
         M5tQ==
X-Gm-Message-State: AOJu0Yypya+3ncgBvJfgD8LF3HLgcwrofasS+YavLTLzRktvSqEzIvOR
	q7TTggMgxQeBxj9NUvonWJuMG0oJqF39F5uQs5CiYw==
X-Google-Smtp-Source: AGHT+IGDl7sfUxjHevheZn4B5/jgVFkKXNZK2p9+niM+0FuLUZ2qhMMYTN1xirjIJVTAyduusmKhXw==
X-Received: by 2002:a05:6a00:1311:b0:690:c306:151a with SMTP id j17-20020a056a00131100b00690c306151amr27827758pfu.0.1699374302393;
        Tue, 07 Nov 2023 08:25:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id o21-20020a056a001b5500b0068bbe3073b6sm7417176pfv.181.2023.11.07.08.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 08:25:02 -0800 (PST)
Message-ID: <a9d3a43a-6e9b-4463-8f31-ce7083eca818@linaro.org>
Date: Tue, 7 Nov 2023 08:24:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: mark the 32bit alias of PAR when LPAE enabled
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20231107105145.2916124-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231107105145.2916124-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: He7ujR0K7vLk

On 11/7/23 02:51, Alex Bennée wrote:
> We also mark it ARM_CP_NO_GDB so we avoid duplicate PAR's in the
> system register XML we send to gdb.
> 
> Suggested-by: <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - only set ARM_CP_NO_GDB when no LPAE enabled
>    - also mark as AP_CP_ALIAS
> ---
>   target/arm/helper.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
> 

With Peter's comment improvement,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
