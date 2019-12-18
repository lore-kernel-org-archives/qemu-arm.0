Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1236430lff;
        Wed, 18 Dec 2019 11:36:41 -0800 (PST)
X-Received: by 2002:a63:5818:: with SMTP id m24mr4898571pgb.358.1576697801644;
        Wed, 18 Dec 2019 11:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697801; cv=none;
        d=google.com; s=arc-20160816;
        b=v/o71c6ApTHYcQWZE0ZzbeqruOEZZ0vaIj33lHYPMXO0eRXUlUM5YfDUL9dA9Cq+qh
         WDnyRWJDy9NigGilVava3op6f2VhWDlM0J//MhlmDbDxbNCM2oVNINhNlq22Qa6IwTod
         AceCMaqeCyRIa/3gsM0KeiuFd2gyORqQbhIqGHkKkzDZCxucrHi03/UxWUnvGFDeWgSH
         CT+uW86d5EXHmCjv3pcI6RRg/Fo4a6Cvhv+534pgPcpqwlDf12Bpd1XFTAe06/Wbbiqe
         jRoMx/0scbtNcupFVGCbhBFqmvza98enzVQAaFNYapI0uWTs2YA1qb0iw3CcMUm2OSqb
         kNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sRHieOSR3HlzGdhhed9nfbAikdwFTYjQYoiiClYl444=;
        b=XUxuyzuTf7hyOmhJVOuoNS/du2Ta5xm+Yi4Sh2ne6qHNePySkzo7R1A+RMsJ0Z4cvE
         b9rNHW4R3ypp/erSKiiC1B6nM6XR9XjwLM2kO9mAZ/2yZMz8ENQmnLjKUynktvsK1OMX
         6rj07SHlUscuxON+4Z7ZCRzFZp3cgL+XLJiRaXGWxVuSRr1ajAPML2xj+aqh89amWfdV
         5V1fmeOYDZnb7+LmahS8RLn6zRtEma/9FBli7Gy3BIDbkXGnF+NWaQ5wEh7zpSVEbfd0
         PZBg9CmrqxlOVDmt4z5ScMjLkmEY9r+Oj9dH5ciYuiaH8A5zIvwl8erJ6JcXid5gszUy
         2gTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDfj6yAD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u7sor3194451pjj.4.2019.12.18.11.36.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2019 11:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDfj6yAD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sRHieOSR3HlzGdhhed9nfbAikdwFTYjQYoiiClYl444=;
        b=fDfj6yADO6rO4uIFXtkFxOJicFei2WTlMVoKjaKb8ww0P3a6TlL+CJ6sm20376Xq10
         fQ8gw34VUyvGt+VaURNiCVLYXSHTl5l4BTJjg+CeJ3eLHtOcNj7Tp5HfVBmnnz076n+A
         y6kxxPM16U4WB/jpkwodANmRGp9sHfM50xJExKBT8vAo5TiRFxR6hz/8nrTNZbGt68UL
         Cf2ckMGtO8LKztfcrSPuFUsX68iGSx3UQjJdMNyb4FqbGmqEtJTik7jepvjGRfJqUV8u
         po2UfvNQqXcNMoHuIRKHdcTCXzDkGUZ4pR1Q1KBQC563/AlLvNiCkWBPHNTB3eVnjyHj
         JiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sRHieOSR3HlzGdhhed9nfbAikdwFTYjQYoiiClYl444=;
        b=g4tnp1DCDiZBItp9EzejAcH2C2cbM57ZZIuZO9d8+fF4ptd2Qrl+S9yf2Gse98dzfD
         8aC6aYrnyj2K3lqcWNdRGUDNKabSeMEno4jz+xQXydb7YuzhYe7Uil5CNsV+obGIXVpZ
         hAqn8qvbznVf/2hnzaPFizx7mgcoVWA9pZm8Xv5Dd3pUOnLBiEhLpGP4uOR3nwi/2dQZ
         Tl7GS2qT67UK9CczJ5XsNWOvT+OpRH5h2xnYW2eVjkn0VZNc7YHJss2essV3WoXh64kY
         bN7Z4zKfxQoN1z3rPzUOxrdX8DCzDMGSk6Rs1KuTU8V46CWDtov39/hJJXjRv/uxjEC0
         X0ZA==
X-Gm-Message-State: APjAAAUFybaN4DiXLIQH1LgABA1zXkEZ0k1NaB4OY36BMz70Qh5IeiXp
	/BZVdyImjNNaTbaA1JD6QIZ4iN2Y
X-Google-Smtp-Source: APXvYqy1kY/i4HckQ+nlqH1wN3lmBescX8cVsHa9qasVQCLi4mXY1TiYGHV79z7dMNCauQ694T7frA==
X-Received: by 2002:a17:90a:e98a:: with SMTP id v10mr4818303pjy.67.1576697800988;
        Wed, 18 Dec 2019 11:36:40 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445? ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
        by smtp.gmail.com with ESMTPSA id z13sm3893825pjz.15.2019.12.18.11.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:36:40 -0800 (PST)
Subject: Re: [PATCH v1 1/4] target/arm: remove unused EXCP_SEMIHOST leg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, keithp@keithp.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23ab51e5-12fc-fa62-b8ca-942089bd7bec@linaro.org>
Date: Wed, 18 Dec 2019 09:36:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218180029.6744-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bhgt6Cyh+BMi

On 12/18/19 8:00 AM, Alex Bennée wrote:
> All semihosting exceptions are dealt with earlier in the common code
> so we should never get here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
