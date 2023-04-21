Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1322784ejm;
        Fri, 21 Apr 2023 10:57:14 -0700 (PDT)
X-Received: by 2002:a05:600c:21a:b0:3f1:75b6:8c7 with SMTP id 26-20020a05600c021a00b003f175b608c7mr2501452wmi.37.1682099834393;
        Fri, 21 Apr 2023 10:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682099834; cv=none;
        d=google.com; s=arc-20160816;
        b=b2bo9I8FbeyjPmP6TkQkjNGH5ViVd7kWlYH2ATtUuKbvHqF52GNcdtztKTxt8wNfVo
         O08N9b/Sc+tO3SOMcQvZVcfpraOxbKUOmuGCdHJLbKF40Kokz7rsR32AOO4Vt6fmZxGP
         os5rseaTJErs9hOO3vt4WNuH4NIwmoN566jEduHvKNT6eagXpZIOu9ZBMDWzOrWO0+cp
         xWo4gCDp+vg1kw/84Z+W7c3QcMbZaV+bVEO9kBbY25ONiYQihzHCO5TPei3/5qjqTWjS
         cPF+jinVlmJy9su7/4pyXrUowL2nTt91NR2cMpqt9fDmx2yrH1IycWAPiSG8fJn1DV3W
         /xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IGNgEV/AmNTyW5IcndaJKv1I/lWmvmwoTOo4eJbfmz0=;
        b=Qc2XkMK2p1QgrOVoBfdVKWvIMdbDBOzR7/z9kzYY5NSvbCi6iQEWvBF5os4wKujxIQ
         zuo0mXFRuu08iPiq1EVxqibV04i4uj6J1e8Z8zPfNdMNgNP/v4mecTdy73QRT/BG8n8D
         3nCfMrJYXHPnyEAKHN4ZZcwSH+9zVxdakHEuKFXHvadg1xUBj39sbkkBPXOtTYaGk8aF
         RbcNmCrL8luS9VKjHxLsxlq2yGyU5QDoL4519VAigx0Ktl09IbHKV/1THsrHLmuVjsFk
         yywuEYHxFkHUpKN5QVg9dsCObpM7qGM3oyXirSpHuGPPSvYSMxmbNJqIV6fLM1rugNDx
         pEAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWvjdpUN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x17-20020a05600c21d100b003f175be8116sor2463971wmj.31.2023.04.21.10.57.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 10:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWvjdpUN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682099834; x=1684691834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGNgEV/AmNTyW5IcndaJKv1I/lWmvmwoTOo4eJbfmz0=;
        b=MWvjdpUN5d0d419WGQMIt4A72uqoHf9SUbholO7hKyEFcNROcUPCnPvJGs4lsy41EN
         ZDCDQatNMfdEcYttt1c/lAsDOmii8uY6rRauOpUxY3APd1PZKYsGcmsee3KB2RvrWTlk
         2WyJ1C2H7VkhEuRCQbOIKMka47RVuufGnXyxocvB6S+aycllZfhK8raQORIlauqOf7Jt
         6eNRyAFuFmHLiRYunSguH/p8ymkeoMLqBVc91dVlTbUmKMEwrpQRWRkPEW/vH2/ja7fX
         a06hGRbFyuhAP5K70v/qx9ySaQk1ukKAB+9OBs2Pmb2ggcNleAeF+d046JpujWo5vhKT
         9M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099834; x=1684691834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGNgEV/AmNTyW5IcndaJKv1I/lWmvmwoTOo4eJbfmz0=;
        b=gvSRJa437VP0L+GWDIRpC74lf/p67Q+LM1SEljLUbc4POfhonc08td3ocEJlKpxzsr
         wgzXxnoyDEZ6lkzrVUNSYaJ9V/zxweQ3f/HpvoRDYTRuiQw3FSUdNnQapUvJoOpvC1+/
         TTyoVPznUKR/CvmZSLEOWB5EPLz1a1wbXQJg1aKShw3UeOATJrlJKAUwacl/Hs8KazqJ
         /FJ5N7PsAYNc9HYl3qr5RBcOPLP/RZf0nwAKv/03ETzqwt8yRdPo36D+ot1hZvi0+1Lt
         VUjblgwqSqkv35lcuZ5WOA5yN2kuZbQ5Q4EESuaDpNxvPVxhbpzc1XHCB4CLfAevgOtt
         Xppw==
X-Gm-Message-State: AAQBX9dKZTbigmN5XxxKhp16E0aqq6fuQxH0abID3hybeGSQ1JSiAiTM
	J7qreF7yBhvjKMwjKuSh0WrUWyPs9WiyPTI7lUnNMXUE
X-Google-Smtp-Source: AKy350b2yluOf1AGPpzuhLsdnbofEtWZlUFQC8amdCJUe/NziRKdULvizM6U5Dfzchsv6wGBWw3jVg==
X-Received: by 2002:a7b:c845:0:b0:3f1:9526:22be with SMTP id c5-20020a7bc845000000b003f1952622bemr1690664wml.23.1682099833996;
        Fri, 21 Apr 2023 10:57:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f17300c7dcsm5340305wml.48.2023.04.21.10.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:57:13 -0700 (PDT)
Message-ID: <ae65d59f-5e16-24bb-aece-ccdd504fe75e@linaro.org>
Date: Fri, 21 Apr 2023 19:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 04/11] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: c+je5v9s3AQU

On 12/4/23 14:18, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
