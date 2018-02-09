Received: by 10.28.71.27 with SMTP id u27csp1219485wma;
        Fri, 9 Feb 2018 09:57:42 -0800 (PST)
X-Received: by 2002:a17:902:3381:: with SMTP id b1-v6mr3356733plc.20.1518199062242;
        Fri, 09 Feb 2018 09:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518199062; cv=none;
        d=google.com; s=arc-20160816;
        b=npivzpmjywVoBovndHXmYuQItY0KhMYqyatN3JKiwS+Myi9FMJXOF9G9CaGUcBSZ1Q
         SsFmClCVv27P0W+GBTP88jfvQ6oTk8693TgOQgK+H35onhYTNu46DdTT97ivWj7PAQQZ
         rQ8x1OVD1lnBc1lkXJHQcdl86sxH9fGVTKEY+Sa4XJd1C9IX4xuT7tLzFBRNZWeZu1zQ
         jOWMDHuDJ5ZrNPBERNJNAy23JXtahZCrOvD5JdG2FSLhoeotSOx6DY2lpgVA4WATmBQc
         SPduy+4mrVcZT1j52o8EXz1etX1HifHed9mUAIsz11JlpU1Fx4ibdj+VXewbrcWbPBSB
         KFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=3AR7TufYwypLD3k4Tm2YWTNWjeJXIpvJR/b2Kdv5nDE=;
        b=rpIRLd5uKAis6/5OjXtS14M+nDYJwLnZE4L9pZWh/JdlYAz8Xso0JX6zXAeDEibKoe
         8TAbM9I3Virer8au9RxYlfLylVWHruYSgRPMNekX1M30L1WSBvYWOSnftSPyyLcutx5b
         mjSlBVumSVRr4DILbTSjG1GigQAKKlwbXh6efvUht2NcXDmZBZJG3F7W+so3TUVlKZab
         3afduFS4qTN26xWD1D7TMae3TPDTF1lV8koI7qji1R9AyQvyrZ9p7vdhuMmbZkwiQW3K
         JjYM1HzWANaGgMYh1AhntXucam/wfBiqVzDLygUG56GET7S50/8KKHnlmkVgZfL7d0sh
         3RPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+VaY9lj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s12sor63995pgf.286.2018.02.09.09.57.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 09:57:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+VaY9lj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3AR7TufYwypLD3k4Tm2YWTNWjeJXIpvJR/b2Kdv5nDE=;
        b=J+VaY9ljtWSQ/wPvbjW+a7sQk9/73B1KE68IzVWXYh4Y99gwQ5goZGAmnGKqLvA9CY
         NdYzyBk9xsPKD/7n1/9yNKyZmCSXR+yrTTCHcETM3yhIZcz99AyQKG9w3UEpckdr7Rky
         73AxVhUukt58ib4goxoKdGNxIAJvxK4w4cXh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3AR7TufYwypLD3k4Tm2YWTNWjeJXIpvJR/b2Kdv5nDE=;
        b=cTvwvyctK9oIw4A6SK5JlAcwtp1w9J5rOO01z6dtNr29zaYoPKctPQ9TnBho0cPb63
         sbst8lgc/LyvQZ/viV4WEthKyJUup78dF8txYZxACN2mdMHul4rACQS1xwd1wHyHpnA3
         61tsIGmDBRnyTCo28T/Yo5tSF7gqjeotTE8r/hUqLThDO6f5wGvJ+PK/bvLE86hhiiro
         Aus9S1S3vc2Yq6wgELDd1WvYh9hDJmYYbrFfJCK5/JBSTV+WYaSi4JWQS2rjrfXYSJs1
         Edqtpk2csn+fkNNmPqRMvZcv7qjVlKhWZkR8p6uaSVvlHkLLZa+pVCh7tOhaNgrzwebM
         LpQg==
X-Gm-Message-State: APf1xPBtNxP8yy+PDrkbHiQFck4qrHbOugizzToVxdRB6yM8RP8gime0
	o44gOJ1RKvguPPTsWhLpHtvmwK8Hwj9YbQ==
X-Google-Smtp-Source: AH8x227g0tTzJRyW0zwYJ7jQ5eIxlkLGjOAQklz5LLqSZb0deUDbA1l8aJuv9dbWxX/s9tdSa4aVZw==
X-Received: by 10.98.27.208 with SMTP id b199mr3672916pfb.166.1518199061849;
        Fri, 09 Feb 2018 09:57:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id t29sm12994375pfj.21.2018.02.09.09.57.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 09:57:41 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 24/32] arm/translate-a64: add FP16 FRECPE
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-25-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec32c5d4-b671-76e5-2e61-a21fcffdb284@linaro.org>
Date: Fri, 9 Feb 2018 09:57:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: E+GVd3ccaGpd

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Now we have added f16 during the re-factoring we can simply call the
> helper.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
