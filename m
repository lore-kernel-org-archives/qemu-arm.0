Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp278420ejm;
        Thu, 27 Apr 2023 02:46:14 -0700 (PDT)
X-Received: by 2002:a17:907:26ca:b0:94e:116:8581 with SMTP id bp10-20020a17090726ca00b0094e01168581mr904444ejc.5.1682588774129;
        Thu, 27 Apr 2023 02:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682588774; cv=none;
        d=google.com; s=arc-20160816;
        b=BFofbS9DIbCVypL7b4qgMJ9adoA+m36ejp/Z4MzYQIQbGEkleLJTAV6f039+P2Z4c/
         0KnglBKwIl7FKh+wyZbkwqLB3OQlZci4UnYstGLZDpYVPIXid85bVFNTWSE16SLEZ3iS
         3mSfFATSpbqBmLHVSR1dgDEUdwYQo8ATp8ELcgD0B7MsB9ihjmGgsS+0CZug9jhEO6iR
         nOZljU91BX2tvyx8QumRGzjZqRsRiCkJbAsXalIj7oN/3BuG5cr7ZLTNjBGI6nVt9uNy
         2emes5fMIkXjVQw1wyigfFvanTZClaJyrW53MF1umOaMfPQ3IBa2/cXraiKEZNnkdo1+
         VP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4cNKaioV6sPY3+Y/S6Tv89VR5Ryndy/ckEzzk+PhmEs=;
        b=UCLXa8/6pqdJctezDL/iqV8mzqgJSfVFtVBKODLbukcpn0nA97oE0nPNG5rDMn50Ee
         HMVoGb/zOhrpDNUBnpDzwK1egBnzDA6/gAtYR6jQ7gslLXl4evXc3AVTw+QIqv7rNTYe
         DMyVUHlPNWqohh5sNodf6AsmT/x/77hEnw+LBxDFmwgl/mu8TTR92abqV4C52gHdtm6h
         BLkvpLPoEFBhWL7hbYEwSyTVJePrRvBz2D59oNtw4Q5e8CdtX1QKCuC2LSeQiYaCYhCb
         Rx5+prQd17jVUmj8CiKAgZudHB+nc0zgqAZJBAc/J8pAELItHxS9p+eYqsWHW8bKEr9E
         NVrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmxSyksu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja13-20020a170907988d00b0094efab8e25bsor9569203ejc.83.2023.04.27.02.46.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Apr 2023 02:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmxSyksu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682588774; x=1685180774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cNKaioV6sPY3+Y/S6Tv89VR5Ryndy/ckEzzk+PhmEs=;
        b=cmxSyksuRNTtLMWpx9Me/ins9oOCyhWRBhWoBPmnNr3mH79yyqFZZQZcRJ3WCGSn41
         hkZfdxKlF0NYnvwDA++DPqgZopl8h9XsO6l7JM/kHZXWHXNK+27HSIceG0ZqHQxE1UmF
         kr6dCXTPQKXRKlWXSauT6G+ptqcGwIFK8O2ByhJFcyItbCxpWkaAfRvT9ELUVgvbjHC4
         wv1biTAMgv665WUo/Ff3MlPjn1WlpH+gzZlWyyirPRNLZm5JggnFcmsub2+TxZEruc5s
         Aer8lb7kL0/Vx/McpOD48SH8DkBybJW+oDpBA5+6p/XOXm6hHd1TG/7ct7pzXXMD8Zlc
         qy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588774; x=1685180774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cNKaioV6sPY3+Y/S6Tv89VR5Ryndy/ckEzzk+PhmEs=;
        b=JixQQ6CdGS0AG+EvYUT5bwgsS7gpL9BIua2BnrxQZ1m5jQgPa3xTp6YLzYk7eVRhoq
         Zwmw5w2g/CZ1Pldx09ky4f6tPWAhMYowfeYQINvZL80qJe5Jerm1C9LaScWQItV/sECB
         jDOr56yHEELH+fnpjPd+/kPv58HpGaqRPvS+zanqZte4wDfmqrQUqCyXdTA6QwcKyl/P
         +VjWiZf1fXzzimYSaqcY8qAkCt3OTT0pZ7tsfTfw3bZyjw0tG2600N4EKuAP4sCg3Uou
         GmWvyHhemC/DJpz/NrI3nI8xe2yaEFHqzUuamcFTCfrgxss30UrsJdKichHeuRasU3lX
         6LeA==
X-Gm-Message-State: AC+VfDzOy9oNYUcT50I21GpjlotyhAQycUTZpPVUQb1faaWBwITVmnn4
	VgATID7efrUSNlA6ERbzk6pLM1Iz
X-Google-Smtp-Source: ACHHUZ6gj/wBE3+F5NhgsDLAlpKZQ6Fh7/2Hcy28iSJ+Fth0uMEdfNnHi3I0Cnq77IEK2+fcuBaCbQ==
X-Received: by 2002:a17:907:3f9e:b0:94e:c142:df98 with SMTP id hr30-20020a1709073f9e00b0094ec142df98mr960070ejc.60.1682588773801;
        Thu, 27 Apr 2023 02:46:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id h26-20020a1709070b1a00b00960681949cbsm143252ejl.134.2023.04.27.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:46:13 -0700 (PDT)
Message-ID: <2ff8a8b8-c36a-3dc3-9602-1b947da95c5e@linaro.org>
Date: Thu, 27 Apr 2023 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 13/13] gitlab-ci: Check building KVM-only aarch64
 target
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-14-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Wvbci2LD50H1

On 4/26/23 19:00, Fabiano Rosas wrote:
> From: Philippe Mathieu-Daudé<philmd@linaro.org>
> 
> Add a manual new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Re-enable running the similar job on the project Aarch64
> custom runner.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
>   2 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
