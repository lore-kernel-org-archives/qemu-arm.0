Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2904875lfk;
        Wed, 7 Jul 2021 01:19:35 -0700 (PDT)
X-Received: by 2002:adf:fdc8:: with SMTP id i8mr26412595wrs.190.1625645975283;
        Wed, 07 Jul 2021 01:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625645975; cv=none;
        d=google.com; s=arc-20160816;
        b=M7LRKx5CBx2quXzrtgfCETUZiEqhBFWnZ+532qQt1Yg1tz3G4Xu5uu53+hbZMXbPNP
         wZOW5s8CRGgoWcVzQm3bqjKzsa0dLPFviVxRPKdCsmVPHTXKyBe9Bfkx34DWWdyfAY2V
         onM/rA+qN/GTDR/sV+IKNamDaDOpUeIISNHO2jiHiMdnMSIqBGF/DfPhXnkYKmj6zYUd
         1VvWn41v2cFVYcupzkWRuO+wJVaRCaBNkUruM0HGGxRdDqAleEwECwOK/UKo+8ptm2Qs
         RxbyS98cZnWn098IroXMLKBf+csASNoEEmclfZnD2765YnAKc+bc9St3qD3OyPyiffMV
         XZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=0VvLrPkUw1CijMSUnXNhF63BtgLwLzjXm9/+kAQ4kWc=;
        b=mdNmlVGeIIHcyH1CMvM8TGYObaP6svczi5iP2197cDCGFot6obla946Eo4iD5pngTK
         FA7zTPoZibmGJfdYGx9Faf9QnS05JxOjGl28TUiIM3LjMcNIid6jGKlbhwx1osXfy6Sy
         8OozCls2jyc0TTPrHWGmiZZYDxrLk73DiU6xtDuJZw4NuLeqW9IIby71arFlebwRUtiY
         KBWyIuyCrNnf+pb4dL+IH+SKkoHOxKmoIv4EVA0ZitDRCqg5vnuIMihq6cgYJdicAK45
         Mx9m4Wp5ARaN1MMzcV1zzwPmZA/G5+UDUGM8GW8VMcEYN7NTh2WALfbaNvrlUDk4Eygi
         3EvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KqsmbVqc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f63sor2973678wma.0.2021.07.07.01.19.35
        (Google Transport Security);
        Wed, 07 Jul 2021 01:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KqsmbVqc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0VvLrPkUw1CijMSUnXNhF63BtgLwLzjXm9/+kAQ4kWc=;
        b=KqsmbVqceuEl5hi2YdvhaJ+65CD2XGRYpRKgPFH1tjT6oRM+cLq/0UjziobywPp2+I
         +WFw9h5p6eabVJRO6K1on8Nts7L0HxmTYZdvLz0EBWxFOhWzvApTMeSuUZPSNA696QGh
         ePKHUJNWylSMKuNrwIXfUUnqzuUAOpRiUqRFSNr3TkowIhWzxWt3FlnpFIEEGizjJoBF
         9UZUmL8dYzsPpJJ1FhzXR7P2YBTqoQtnLXfiAE+qvri/CYsIrA1xy58RwmHvGKkmLoeL
         9+fixQNXiLkabX6IRUh2ScE4EKLUjp0fYehijGvzCmMb5kmA2vN2S629hk8B0/6TfVE2
         AKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0VvLrPkUw1CijMSUnXNhF63BtgLwLzjXm9/+kAQ4kWc=;
        b=W71S4URbby4eb0oUJPNvspnxhykIrMnAmpA08ZBF4jgD8NnGcqSy3ZuVjOsbYYglcn
         GHIYdGT9f40gkxYn9ZUrQMYKt4AECZYhsZdGtYVzjBseHica7ERw/vh30ZpnqNWofAC7
         KDrPnZaFJe9eKQAkjPKg3tobdLD0ed6dRTXLjVfSt6S/VgYZQkmjWr2GfJdq5beUAtrb
         LlnRpEVGFUw2R7qhNu+7g/1FNUkaXnnFbSvVpQJAXeTuM/GJbavmcHTd5rUWVjsq9Bp/
         y4fYs1R2xO3TXTlD+jFM0W8bX/XT5o9vr9YNzVgiDWh1I+TWs5n6vd6OKu67ZcDNEMso
         cdkQ==
X-Gm-Message-State: AOAM532uFXXWaRIupyVaH3Ad8JmhjPRyiv+rWYuEiRMEY6PBS1H8AIk9
	vU+WZiFV2apGtkMny8UUJTdYQODpgVg=
X-Google-Smtp-Source: ABdhPJztxgOt9Uc4XTtuuOBHrOj1Ghbr7UWD/+oqmu8upmbBTL7dcr8VYgX7m2v61C1gEaz7gqd9qA==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr24735717wmq.140.1625645974993;
        Wed, 07 Jul 2021 01:19:34 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id e8sm19598774wrq.10.2021.07.07.01.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 01:19:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 13/36] linux-user/arm: Drop v1 signal frames
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, laurent@vivier.eu
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <be2cbb7e-1375-ce67-a62b-ad8a60fee721@amsat.org>
Date: Wed, 7 Jul 2021 10:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: i8l6P4fYxMMT

On 7/7/21 1:49 AM, Richard Henderson wrote:
> Version 2 signal frames are used from 2.6.12.
> Since cbc14e6f286, we have set UNAME_MINIMUM_RELEASE to 2.6.32,
> which means that version 1 signal frames are never used.
> 
> Cc: qemu-arm@nongnu.org
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 220 +---------------------------------------
>  1 file changed, 4 insertions(+), 216 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
