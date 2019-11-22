Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp18333lfc;
        Fri, 22 Nov 2019 00:29:21 -0800 (PST)
X-Received: by 2002:a1c:4946:: with SMTP id w67mr15582454wma.16.1574411361859;
        Fri, 22 Nov 2019 00:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574411361; cv=none;
        d=google.com; s=arc-20160816;
        b=hRxS/nECm/9eDATgMHXNe22uAnAwaTIpMyh5FXrKvx6S3JzTmIhsFjzt4VfuNrhbfD
         yYT4R3LB3rsyn7G07qtheZVAAJyr/mAezU2xH+iwci99F/M/hduzQhd1cdT0bk/jl1Jd
         TG3toR507UspEHHJGavdhnCUEXSXbPBszmq7HO0cR2fSnLs+ouaYrYogn72VXTzexev7
         GSjTndT4r4xVdNZI47icnb/xuj745qIrIfkWjzs7TohmWKmkOwNgYjQ/l/Zlebbge5Rt
         h46iijF9g+FUx61/ah6q1Qrl4xSzTyFvmmMT/Y5uFIErLrGkdIzNX0gfM3FQyqgRoTGY
         UD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=wha1hglNGt4UstaAQQvLQMbo/kd1j8mCEModtILhLKk=;
        b=e/PxAGx+NAHTP03gurhBRLBmTzTVA3uvEOY5qbLlzrgtr43RPBe9aKcQwz37IW5HlY
         EHRvZxTFCRT8P0REVypKDFKJUJrEqXv0UqGCOYrYo5FIgfKT+HEntPNYjWzm/rzuLIDY
         8sSX7uCoY50tm6mvqAlYkSOUiQ03BmIdW8uw/kfpHgHLXn19WMbkOgz5L61Jn6LKMEBN
         NEPAtAGSnObGmP06JeOv20QVOhBVZdQa3zDLvryFBBgwkaEj4z/q7oUUAGxeVMMSz/Od
         O7rDvGcRSygDzgI2a7YvUbpi3+UOa7jkvustGmXLSw5gmj2bGx5lUDN+3Cw+nekaA5V3
         U2gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccN2HvfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n6sor1317632wmc.3.2019.11.22.00.29.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2019 00:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccN2HvfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wha1hglNGt4UstaAQQvLQMbo/kd1j8mCEModtILhLKk=;
        b=ccN2HvfIuPBCfRYS/bPPAbsOK6lIz7D8lMTzencQTbLXiT4prEC+XQ4sQTVrQYMQuT
         BJF5fyDFYjExZm3W5fnxiPwksxZKL96uqll9qsUeeBl0PKUmNP9tRB/eWi3zF51gdgTr
         YjV4S+qH5MXv12NCNsRIdxlgP6Xkr6bCXb7MISQsIxiBEm8B9gGIsY+0v6oQxuyajhiE
         kbZUW/Q5mhzk0pPH6AF7T7rLY3Qwhv+SbfBrq3qmhLyyXQh9AqfRtwe09u6A9NNTJl23
         AsBEGIo2NoRXI2530o0CYLOCMg3Uk6V9uBdZProlq0ytC7bMqNTByqoDcjOuh6weDhzH
         mpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wha1hglNGt4UstaAQQvLQMbo/kd1j8mCEModtILhLKk=;
        b=b8CDizkI+kQ33gYvIMTTgoraMQUHik2ei5HmgkoxexpxHSI/LloU1HpzfsF/1lbqId
         yP+ro9zkRIwUH9HJgpfdoVUw/CB7rMoIIN9yfYPwlDZSaSKEiX9LGl0fGgu8RqtLv1/V
         z2293NrB2HJr3L+TF+tOx3gvyrHayG7nrzcxZgd7Fm4+dceWfhIt08uga4xrHKmTJevY
         j9Fkcwnr018OovrNnzSFA0Mi4nwx/1kxKFaQA2XaJ5lBn2p+uZX6B9Dr3voe0I9wyr/T
         Fu2gnhuabZ+rXetOutCrcPIH5gKOFa5sNmYcvOPaUCOD+v3bjaYs7k0NgYS/zznMWhAz
         Yl7A==
X-Gm-Message-State: APjAAAUdPgb0IOQoJJe5+s9wBOnntnSuOkWE2Zksu9amFXvv9XayeCvo
	bliq6u6w0TTceKvP+yVjeVEKs3Or
X-Google-Smtp-Source: APXvYqxnFIiF6Tr8PV3ns6yAC/dnuCqahHAbsIyvYK5YipNGtq9KllcfWaAY6VIrBJdtvvHg6gPeDw==
X-Received: by 2002:a1c:20c6:: with SMTP id g189mr1203573wmg.6.1574411361531;
        Fri, 22 Nov 2019 00:29:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.143] (host217-43-132-120.range217-43.btcentralplus.com. [217.43.132.120])
        by smtp.gmail.com with ESMTPSA id o21sm2583113wmc.17.2019.11.22.00.29.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 00:29:20 -0800 (PST)
Subject: Re: [PATCH v3 2/4] Memory: Enable writeback for given memory region
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 eric.auger@redhat.com, shameerali.kolothum.thodi@huawei.com
References: <20191121000843.24844-1-beata.michalska@linaro.org>
 <20191121000843.24844-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eb14d17d-3120-2697-add5-d98d82cc51e7@linaro.org>
Date: Fri, 22 Nov 2019 08:22:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121000843.24844-3-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: yj2Go6ZBmwWz

On 11/21/19 1:08 AM, Beata Michalska wrote:
> Add an option to trigger memory writeback to sync given memory region
> with the corresponding backing store, case one is available.
> This extends the support for persistent memory, allowing syncing on-demand.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  exec.c                  | 36 ++++++++++++++++++++++++++++++++++++
>  include/exec/memory.h   |  6 ++++++
>  include/exec/ram_addr.h |  8 ++++++++
>  include/qemu/cutils.h   |  1 +
>  memory.c                | 12 ++++++++++++
>  util/cutils.c           | 38 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 101 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
