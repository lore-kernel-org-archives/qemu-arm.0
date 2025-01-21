Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp184990njc;
        Tue, 21 Jan 2025 07:55:36 -0800 (PST)
X-Received: by 2002:a17:902:da87:b0:216:501e:e314 with SMTP id d9443c01a7336-21c3540d181mr257923465ad.20.1737474936252;
        Tue, 21 Jan 2025 07:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737474936; cv=none;
        d=google.com; s=arc-20240605;
        b=VPQVpoEtPkiCzye3aEoJXbVliou5Ra26G89+aawSWcMkg5sL5v0wiYGo4SXCsragFK
         yiQpdA/QUeU/sVNdUz1kfWsbNH/xAKZ5/aW1pFZOC4I5rKp5QDU6JihRD/FfZxytPIZb
         VezOs1c9LMZblVp+q2yJzM8ts0B2MQEmALFaJ/iOEa4ZtZW+scEDxQnpuKUG/Yu0UmGB
         jQu4AlXxEBCBxSGYnvPWU+4+/dKQhbQkpbnnO0OXWxqegMj+gJIvgyAT0MhtiTYcnplh
         AXo8QZub9qBS5cNtfff9y82BFInyObvH0Z4PhF3kV+6aE6oa9mkrgLtVwRekTz1kBlv8
         8V0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GOM5JsDuoW0vxvLZgWi76izSmLrosmbeC5Qt0kuKtlA=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=TjHnq67YCe4aRGTU06oyfHk1PedF2Hxkv0wtsMo8+kFI4/X+cjRJPQ5mHquE/d0X6g
         WEviLkk5aL/2PDcOXaRLsnwtfXJY65fuzrwG3XX/MJDKJqM0Gt6a+4oUCA+o3Y6iJcLK
         Ne1HxYilsgrJ4YrvAXGtOUD2tTdZhQNRIfiBMIYjaPTSJ8XUWy1JBKZkErQG4zwK+LBM
         H6mt0UrFBWZXdOVW20MoyDLvtc5pnMqZOJ13e+7upOjiAo/MyivWh3+/KlNdK506EO9/
         L6EUqIzR4xtxnJ9M7n8nOLKUbn5ZDqCs6L0HmXyCRhMELepGTOhg1Fge3GYiXuWSu1mr
         Qtdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXybm3sc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21c2d3c6865sor57972285ad.12.2025.01.21.07.55.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXybm3sc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737474936; x=1738079736; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOM5JsDuoW0vxvLZgWi76izSmLrosmbeC5Qt0kuKtlA=;
        b=gXybm3scmB5O/kNbwTUeJuGHIXjU3hHc2nbDoFIy//44qUON2xLWg3D6+BPxUYbNUo
         phsCIsNDWPetDjo9Kh9JZBL4aBgEHCgdCIt6tpGDhwU/9n/T4B55pHdwbDZYswHfFivt
         fUtWhKoTG3MyAtKNZqzu7DkWNRQ5WG9pb3LitRP8AQXRuU/SHIcoYjCBlzC8FagB6abV
         ao113bC/mXVTsb74EPKLGr1cbVtHd9QwOAu6h/EXAx+3wWV1Jy4yY3Jza5VeVKqvyvKb
         B+3ja28eWH7U4RpocHsAimAAfydHSq5H2o8Jcypj5cVhoUYovIOa8SdCe7rRVgInfsoK
         GNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737474936; x=1738079736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOM5JsDuoW0vxvLZgWi76izSmLrosmbeC5Qt0kuKtlA=;
        b=xQfg5X44UH1llIZhTPVyFx8PjM4CN7bGmbyyqyOECaxBfJknBDAkchQ/fyCGKVRIkf
         yOQ6HnnEjhYNpZ62qCM/0+sDcD8iQjB4EPjUd03NktcTAK6GOny96ZoGfNyLhPNTyHej
         pU1wdLs0Xod8TAsN6MLXJ6w3abOlXLdRNlXmVk+pEh1mR+LJMsFGfeQXk7OTEmKHS3QG
         hp9jn9VAiigMP8ok9xevMcQ2TLWMCv6AfzaavxMaddSHTrSguGg8+KEaDSfDyg6+1gTs
         KviGt8Kiyq8yqXy+RtfEg4UwcnEqyz43QHtjfmwNh9jJ6JypnIQFkG0RSimow//kRuRe
         26Ng==
X-Gm-Message-State: AOJu0Yw7ImUwF9yjpUAJwJSQ7Kk6RYT5NYtUSpcBCSoRFKVUpbkMtGRu
	a+CvkgdbUHwvH1Cpz6zegXCbScC5Ws/C8z62dyKih6QNGx+oEmpff9FMKr4RaMDOEPatqryYW3S
	9BqE=
X-Gm-Gg: ASbGncsTUGpHZursWznSsgi8QiZtbein7aqskTVlobBVfxKp/4Ue4igv7JWMS541fCY
	9Mpg0r8rBx+Vrja5P9D4Nk0SR6kotRrL/j17dnME4Coj/1F4g7U0wC8ibIvpUW3wc4GVZrWU7Fs
	qFsnQmcnbCrDqpu24YNaZGqlh2juliNj3sVWJgPCnR877nVxVsQxAGfwE5RFs4XnXu9fiX4INzW
	K30yOPjQEfezUqXUzf0PI34uddvFrv4y6P3sfMUDc4HqFs8jD1NdxUZYShxXAE4Yok0t4qleQoq
	ejlbxmHwgqnPkeMZA2vTLFLfd0Q8TG4pTRVH
X-Google-Smtp-Source: AGHT+IEBErHYeWkQs/3WVP2J0ss5HRcyGIQWwFjpnWF+DXDFoxvW/XTmXcHVuSbn4oPcs24gzRKnzQ==
X-Received: by 2002:a17:90b:2590:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2f782c93dc9mr28369246a91.14.1737474935723;
        Tue, 21 Jan 2025 07:55:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77614d9b0sm10948450a91.18.2025.01.21.07.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:55:35 -0800 (PST)
Message-ID: <bc75c763-5433-4f18-9f40-318eabcd20a3@linaro.org>
Date: Tue, 21 Jan 2025 07:55:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] cpus: Prefer cached CpuClass over CPU_GET_CLASS()
 macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: O742YsWqpHbc

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 10 +++-----
>   cpu-common.c          | 10 ++++----
>   cpu-target.c          |  6 ++---
>   hw/core/cpu-common.c  | 13 ++++------
>   hw/core/cpu-system.c  | 55 +++++++++++++++----------------------------
>   5 files changed, 32 insertions(+), 62 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
