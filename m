Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1859798wrg;
        Thu, 23 May 2019 08:18:52 -0700 (PDT)
X-Received: by 2002:ab0:2407:: with SMTP id f7mr2528020uan.18.1558624732610;
        Thu, 23 May 2019 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558624732; cv=none;
        d=google.com; s=arc-20160816;
        b=vGZGTQpGA8z5x+WP7mZu99V/blmlvt38dtf0AC1zDWJBEuD74yzf/vPBizbgybUxUa
         S/N+4MEi3fIopFqO8CvaTcNAkob6H74qYpuoczPpZekVUWD9q/+mooCCdzgHP78eOPPV
         S0a0OhLCg5mv08kgxbKDRX6u9zjsU86fK8bI88aPKg295VfGpWH5lpZd7oPT15ib6K+3
         UAv7OFBQfP8xYG2aydbInVyJBco861gDppFO0AcDIHzzypxIhzm0KoLrz4yeCITzYvxS
         xp3njRlQz/YRvlJM04qaSgA2a27k2gH0StWuEIVV491GaUq4GouvpA6VrlAWGbFCE0VJ
         tfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=f5vBD+FZ7NuANb7Oj2G0VgFK4oUSAX1dsfmXQ+9pWww=;
        b=Ydagw/HAf1lycBNI7Kqe5Hbwhy5VoymjAyj9uVifqJS746rpzV/sg2uF01GHjYUh8u
         WRHPiNh2VDQWlfQgowkQL95YZyf7Xj/ntBcYi1311SB93qkmz5SSuH87kle26SwyNEoL
         S2OiBxCx1slPBcg+m94rSShqy9Yg3E6AgwCrKsQ6IU5OBaNRcISn3YDbD9PpcrptGyZ9
         /AKG6ffdfxv0veyjUF3eh4bT+zP3r1Gw3krLwcACS+H9sbRLneqfBz0aazpyacpeu9aR
         E4/uEX0cGiEifkAO9FT81037LqLfufxkMst0pGZkvKjhSVEGOZc1HTSLSkV2D8qo2FYS
         M2MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8D98lrr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b8sor5306339uas.19.2019.05.23.08.18.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8D98lrr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f5vBD+FZ7NuANb7Oj2G0VgFK4oUSAX1dsfmXQ+9pWww=;
        b=j8D98lrr7plfFBABsOmxS5xX7trs1QqQSdlOqzwWPN9mWm5ghh9m2y6m21F9s7RhoY
         XIaaFuUN3DY5pZnL3Bm88z82oDXBCEFTquwIWFiRnMmSKGX/8Mp4x8+2ujbqCz4i5Dk3
         0Vp8vCjT8jx2xNmT42zIxd7Hi0e0zEoyx28FXRm01jxQvu10GdjTz26BvC1M/rG0L73b
         +yot6Z6DHLnP2lr0XmaOU3tGYznyq7B9vckoK0A5GZ8zB+BmTEYn0I1i47Zicd/ml+bz
         NJ7+zPgHR77G5RmBlLD9jG6gv+gVBgEdaTaDKOQ8yoUQbDQhtIQRUyGvODuMFjAhEOq8
         Alnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f5vBD+FZ7NuANb7Oj2G0VgFK4oUSAX1dsfmXQ+9pWww=;
        b=Dkw0stIWIMdezwn5QLiFCfhyKntudPdGrrgiZy2fdNMu1jGpRVC/zsR3uce3eFOrF6
         lO7rkQe8ROFMQHgZCfUtRMYs4oYQIw1znJJtqs45LlQ77MKbyQ+8dyXYO5QJP15x3lrZ
         uLvG/YoDca1xM0k/G5dEDj1Hkg4UkGUwPN5W4wODE5CyUfs2lE3TAn0Xnd9eXi4SxyOs
         Gctsm5VO2NrT5o6XiZYbHuoz0AtwQBcTd3l2/P2JN6VTKYNrEofxY1bkb9JYrWqm7RqI
         ULmB9QTk3V2R7KYId+/wcvd+DZpcet4KzoP7ptXNbeHPRfR/3Cu5KWmaToIHojAXDejA
         XDIQ==
X-Gm-Message-State: APjAAAXN4+rYiT/NNv46qW7WhXQkHMHB0BSprAF3bJzuOMHjHxD5TBm6
	e0pahhnOxFMMuYChOHAJrhxQjnu4lCkV9w==
X-Google-Smtp-Source: APXvYqxwhUUD66VWpXBmmCn+G/Vt4f4iVXZb/jSee01l1dm/Ls0BMUf8X7lNSmkMlD7vq+p7Kb23Sw==
X-Received: by 2002:ab0:3406:: with SMTP id z6mr7825767uap.102.1558624732090;
        Thu, 23 May 2019 08:18:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net. [173.130.215.183])
        by smtp.gmail.com with ESMTPSA id x10sm5989669vke.49.2019.05.23.08.18.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:18:51 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 07/28] target/arm: add LOG_UNIMP messages
 to arm-semi
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac9074a9-0560-e83a-4118-faaf4a228a04@linaro.org>
Date: Thu, 23 May 2019 11:18:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: PEWmH67bByqC

On 5/23/19 6:25 AM, Alex Bennée wrote:
> Clean-up our unimplemented bits with a proper message.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/arm-semi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
