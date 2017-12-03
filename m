Received: by 10.223.159.74 with SMTP id f10csp627962wrg;
        Sun, 3 Dec 2017 07:03:50 -0800 (PST)
X-Received: by 10.159.196.141 with SMTP id c13mr12088292plo.186.1512313429984;
        Sun, 03 Dec 2017 07:03:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512313429; cv=none;
        d=google.com; s=arc-20160816;
        b=cyzrUUA1G7M4t/8FYHA3/g/z7YcuTxnbl/9kECYgQCYX5OvC7XFGdMWIZyppdQpRUH
         kfNnQffEp1IFqcV9MY77tazkrzsNeXs7jcwcVCRvZS1XRc4vi1866g1nbec4Bh+uRiUl
         9gYGlfMeEi15ElLvPewud990S0zen7GQWLiWKCv7eseGfL+VsLjeDclUkhoN/79cdKkk
         PyREMgHicecns6TyEjInxBcn/qyP9/KhLbheQ8za6r2zshQ/i6UTpYe7u6pqfh3QFfsh
         r3h5C6D9ZwFR3My6rLCf23/0sgONlxB+5pX6L6clLvw8EPdID1JsrJd8xxM5B/sxfLmE
         UYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=zyU14laGXVLC6QI9x6d53mGUkNrmsyJ1QrzT9nQuTK4=;
        b=svFlMdGNb546GELsr/+3dMGqiw9q2pX1SPGGTlzLdxorn31bJgRubpT/K8ZvmlMx6+
         Ki5hzZK3Q7bNKlAOLRUZnzVhOMn6wpcs+5WjZEbHUVweB0IC8Twy8uN3h3Llr8HFPjTY
         54xhcex0Tlih96UKXx/86Y0zxXmEPAndinqhuUfMNMmgad9DysjHfuv7QYQhNZMu6jP6
         MJD+8l0zoPJEg3AG6BDg+TqmiYd3jw+vwomJEVV1JvujHzovOrzaO1MJhUagtsX1LqeG
         8hIQpRbeYe1Aky1nRQ7oX+zU3Xm43oIi5KKsUHTcA5Mbw9LV5NhJDpa/0umI1Hxj9Otg
         4ueg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1mVNg/4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6sor2978710pfk.126.2017.12.03.07.03.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 07:03:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1mVNg/4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zyU14laGXVLC6QI9x6d53mGUkNrmsyJ1QrzT9nQuTK4=;
        b=G1mVNg/4vKSIuKBkPFz3DvcpKca642pOFbo1uczaKXBHEAejPUcV2O9jQ0E7YZtwIq
         6ynb+etTMVZmCFmjIMGEVv0tkR3dnygwU7evnziv/gDASp0d9GhnO/ru0qLw0SR2xaKo
         E50UE8Htar681n27KN7Gh3c/MhFKs2+O65Xcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyU14laGXVLC6QI9x6d53mGUkNrmsyJ1QrzT9nQuTK4=;
        b=TMA954hn4dtXUtJRjdMn2HTzZ6ruasrbTGyTOQPrrja2tPWlF+QrwlgU+hvXz5mvQb
         9n3pa83K9TZrXySIB1QTNDZZjjVVOXBjFV7E8KYQSrrzydj/VZ8SgqnRJC1eVKrk94pZ
         i/W1O+5SJPZLueYbEs2HfRHHU/ZI33M7qQSkfySwMHw63SAJl7IQNAiDUASMgxFiqGRr
         +0ARQFo3R5GZ3YlLiOLMJ/nJU+I8xCtcbvDx13vdoIJNlt31Q4SCPb1fOEMl7xKWJ0k9
         8aNsOaZRFltPMgxIxJSQ4ymuhTc+bUt5/Ic7VGdsrWfhADVULe+xRRP7ZYd1kXA1IDBb
         xpIg==
X-Gm-Message-State: AJaThX6b7ka/ILRKV0irk5zQ5lb/SaIX/LEJRKkDccpieK5pjU83MYXG
	on2eSMV5z+/zuQocpz4gHA3lH4/rG8Y6MQ==
X-Google-Smtp-Source: AGs4zMZDnhHjzL6Jck8EIHuUHUeyAVFkgv13nT+wzTKeZLRIV6r4lxHZ1jOYfvyILCI5F3HUF8Sahg==
X-Received: by 10.98.253.3 with SMTP id p3mr16655840pfh.20.1512313429196;
        Sun, 03 Dec 2017 07:03:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id t4sm21731373pfj.56.2017.12.03.07.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 07:03:48 -0800 (PST)
Subject: Re: [PATCH 2/7] target/arm: Allow explicit writes to CONTROL.SPSEL in
 Handler mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff7a4f36-1892-4e1b-3ab3-7282fb8cbdf7@linaro.org>
Date: Sun, 3 Dec 2017 07:03:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 0ddO6edvgBIP

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> In ARMv7M the CPU ignores explicit writes to CONTROL.SPSEL
> in Handler mode. In v8M the behaviour is slightly different:
> writes to the bit are permitted but will have no effect.
> 
> We've already done the hard work to handle the value in
> CONTROL.SPSEL being out of sync with what stack pointer is
> actually in use, so all we need to do to fix this last loose
> end is to update the condition we use to guard whether we
> call write_v7m_control_spsel() on the register write.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
