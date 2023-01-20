Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1367141ejc;
        Fri, 20 Jan 2023 12:54:59 -0800 (PST)
X-Received: by 2002:a17:902:9349:b0:194:d272:5567 with SMTP id g9-20020a170902934900b00194d2725567mr5870129plp.69.1674248098839;
        Fri, 20 Jan 2023 12:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674248098; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6EhMR+n1CNxJ7BIdhp7h/evKAuMQX/VS+tFjX/XGdz1vKM0Tc5q5qUwX4ksP9z8W/
         FADzSFWv7GjuuScbrZbydyEM9Orlo/MhUmChgOsn+6Uk0HbAMndgf4mwnuV0p1AbAVp7
         Q1xsjCGo74fVI6tQh6VesoxT+gOAnSF53KuxtfVFxUg+sjms7EejAPFzz60qDOHzdpgA
         a6e2nTdQTfvobMQbfq6DFZNrUPD0lWFgKVEO2xp+eM9TrVoxJzSfCk0GpwFnwe2Ovhoj
         3sNpeKYwWkxyBogzzb4/6UGJb5Rh8XgNTwxbQfDYELUm/rhBSPEcRsFY0UH73/TET1z5
         ii8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+zuvM2l4DFBFxSg2GhwkGde3dfqe7an6vGmKWqfZd5A=;
        b=zoQABvdBqPeQI9sPy1yQYcbrHiG48UCewcsDthQotFGSPBEYHQMzAJl/tZL4LWflZm
         9RxFNqgeF++CchMn71k+XyoRpZOEVjBExPfxMSbiNbYNak1rs61OqE9vXv83asiiq81P
         B2ZPVGtH89ZFSIcHx7/BloCqyit78ndblHA0LGuafNNfpGPUwSgb0iFLQMXYLuZYftTi
         b66lsnUNjqu7UFNbQMybxcblTw7hIrzGmix0OQJxSrtZYgiBC8DNUPaJEydOTHfjr0oK
         9fsIqm6rJDmLWMDy48uNYcAk+ASX8lE4jRZein4V2gKMRXH3hh7jNXJdR5p6rMgbH2sa
         3sFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahTeXmuG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jb14-20020a170903258e00b0019473f36c0csor9461321plb.176.2023.01.20.12.54.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jan 2023 12:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahTeXmuG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zuvM2l4DFBFxSg2GhwkGde3dfqe7an6vGmKWqfZd5A=;
        b=ahTeXmuGBwODLBpVWFBx3fjoArxAg8jg5xqVWCIczgPqocKiNwg+mSjx4/1K1M9bCy
         7vPI6z2PDsgqzUDGSxPIwRx5w9lgvb1MWKNKvQxDWU3Nj2ZEREaSTShjMbM/kV+9TJdg
         EMZVkr5T2T6MiONM6MPVYUUHCQF9/nz5PREia46Z4wKqX1q+H4Kwq+fZq1soQSSaPgVB
         DTdPkknARqL1pnA3KCPplX4GQLKqdemxWIaYdUpuHwLU+eEpQmOTsZCuNmgiOOp8g76L
         aktsm3yiVP/8dnkbuNBCFrRvfOwKUyRSK5oBO4uI4eZqoTfucds562w0b1yv9owBr0DN
         cxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zuvM2l4DFBFxSg2GhwkGde3dfqe7an6vGmKWqfZd5A=;
        b=2mJkBf72kaAwWK7rCsbu1/BLKTe3/8ZgdIbey6M+4TLXcFoCiZATckmmYf3l1qAaQ3
         eXG3GstYu4BXsHMhs7rod2ptGD0ouNkK1mbXS54BJ5ROwJFLNtM2iPGOqce0aCY8LNRb
         IF4ZkYNCyWXikyASaxjdKTTm96QqHKKEMF05oVlZ8SOOCyp8tZ2aK7casXKh4KrXgOhy
         tlleA/in0UzF7Qoa+vMtHQ9nvF45TBzNMI9q0LGMSoLXZhUybJ1yYW4B/xjk1/NlohnD
         NliPFhwkttpMYORPMhfO42mtsYjJTlxugCFbdPjjAN2fYJT9iFI0yUl4rGfIgY/7AmN1
         QC9g==
X-Gm-Message-State: AFqh2kqkneM0qthLbfPBn+pM9k+CMNuv5d/8WMDUkdx+YRn6nEZNBaCs
	lXLRCBjmH40XDjeVkUAJj4CDc8mA
X-Google-Smtp-Source: AMrXdXuTSjGYG5AsKEGq7G49k/CIH3H3Mrt82ocTXIjiwNFTlpvISbuHCOttryzv7sFbija3Gpr8RQ==
X-Received: by 2002:a17:903:2442:b0:195:f06f:84ff with SMTP id l2-20020a170903244200b00195f06f84ffmr2345511pls.50.1674248098309;
        Fri, 20 Jan 2023 12:54:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902784200b0017d97d13b18sm27283244pln.65.2023.01.20.12.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 12:54:57 -0800 (PST)
Message-ID: <c6a6a2b2-930e-0e9b-400f-cc0e5027cd4e@linaro.org>
Date: Fri, 20 Jan 2023 10:54:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v5 3/9] target/arm: Use "max" as default cpu for the
 virt machine with KVM
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230120184825.31626-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ln81R95XZvKA

On 1/20/23 08:48, Fabiano Rosas wrote:
> Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
> KVM-only build the 'max' cpu.
> 
> Note that we cannot use 'host' here because the qtests can run without
> any other accelerator (than qtest) and 'host' depends on KVM being
> enabled.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Cc: Daniel P. Berrangé<berrange@redhat.com>
> Cc: Thomas Huth<thuth@redhat.com>
> ---
>   hw/arm/virt.c | 4 ++++
>   1 file changed, 4 insertions(+)

It does seem like that path of least resistance.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
