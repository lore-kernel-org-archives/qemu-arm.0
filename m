Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp275015ejm;
        Thu, 27 Apr 2023 02:37:23 -0700 (PDT)
X-Received: by 2002:a17:907:318b:b0:94f:61b2:c990 with SMTP id xe11-20020a170907318b00b0094f61b2c990mr1128091ejb.25.1682588243596;
        Thu, 27 Apr 2023 02:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682588243; cv=none;
        d=google.com; s=arc-20160816;
        b=KO6zqG6BfZB7hiT6dPQswc1Mb7NCC9WfN6mti99aa8q3g2INhqB7NZivEV96zTvXqb
         u40FwIl7XO6CF3R3vA6u/kn7HLfN1UsD9QiTYT9p1vw4XwCq8ieM2T+fFbqJebcMrmn6
         cR6VpFf7dM5V2UbgYIWerPlSIs0gtO0Mvne24NhE7oxNmXdCMkmEP5MSqQ4qhn3Z+tfn
         iV05/IVrMlBQFFUnJn+ObbIXqZOFPAZSBsHGLQqM5Kx8s4YAP5z3GT9KXwcrQXupmN1x
         cFnnc0kaRZ8l8h89SZuzc7aOJGpC5VEFtdY1yLtkdQt4qv4usD3SQvoS6WwqwoOl6PHq
         6P3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qm8K0+YG4jDGmH9ZVQnOryv5ahEcOVMPw0WM30T3QbA=;
        b=UNQ5x3ejx7NPVshyQL3U93+a1FrSddvRptSJkPdojI1ERDA6KRfStCnNrDyxVUqx6a
         baTGfdkLEcnSv8y5ygDPner1Uy9qe/j++h5WGec6jn5fRkwac9/+fVcfqceU+jv2q4oZ
         +NEGugAeYfT4LTnKW69CRNI5WnT4f1E63TPVvDSNYFALUyJwdawd1/3ZxnHMcMFhcVSq
         7QpoyyrhnhARJHyzEXjka6WRlJl7sT9KYyPtxBuvBjEE+jfXms5rD7ORbE6Kkk1yf3/X
         VIRN/cyWL7yXdH1I7aTHa55yQCIjw/ELwIrU6rz9onMdb3zZmAYx05JDt1KHV+/c40sh
         ESQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3bheFKK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ww5-20020a170907084500b0095e95726a61sor3443995ejb.34.2023.04.27.02.37.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Apr 2023 02:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3bheFKK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682588243; x=1685180243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm8K0+YG4jDGmH9ZVQnOryv5ahEcOVMPw0WM30T3QbA=;
        b=i3bheFKK76kITEwkNwTWBXpnBO7YRVcqF9d5erGhCn17nc+OxzacDuxFRETr32fkDJ
         x68mM9GM8nGgxIYXC8vSiKww1Or9/nsTYRtKAwrxYCUNYMqVvtRGxWp0/j7JL0LDAIkl
         dZemIkX5pJlA3DDUVPGB+zKr8JVoL5aoR7BcVR0wxL1okRkuQ8rktFl8gkoNsb8jyH/6
         IxjhIES2XfoTroajb2SK+P3lWvFqkYAPiYWpoYTlQ+2dJbYP2aLCL2hcOlLu1dWSV2+C
         81oVJGKYxHLHp0vBJl6L4MZvbW6GUMYi9wM1Vv+ZXTlJG81h5XJ+DTdc9a8gbpFxQpKu
         xRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588243; x=1685180243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qm8K0+YG4jDGmH9ZVQnOryv5ahEcOVMPw0WM30T3QbA=;
        b=JiM19Y9uppBQFo2223j73v5SiLSTYnFoP7BHVDZRogoJCewsV/5+1P+y7axqPkPvoC
         ZL6UZ6rK4PQpuPJgMCdGErtdoQKLuQVaBMjCPkZt+61WvuOXGwaYdvZl+xUVeIBRbN+B
         lzI3+Mpg+8Mu7+7+AZF1JnQ4i1abArUmejtf6STRztzgzJaeGm+B+7lXlVLjqZTNlUrc
         5Kk00QuP9Dizz/w8ZTLSg16GkZCuVcqzxGG1P8/lcuuiJo8WWXSSoUALQAELT+I77aj6
         WbmNSjXAileFumPOuAYZWQw4fawEjtF7lNwjNtGMuvpA7MY5F7HvtC/DMaTEkINXAg+q
         Oujg==
X-Gm-Message-State: AC+VfDxQFUpbySwyn++ktzrefmpMtu3cmyHEGQr0jZLjWInfT9NK7ZxC
	f/3ZV5bPdbE2URWFYCi5xhwA5INq
X-Google-Smtp-Source: ACHHUZ6v9f7VynQCJkd/E4HV6GqS2TjppvjhYqO0FKpqPP82fDwOPYfVE3ni34OZ3a3Q6hC582jp8w==
X-Received: by 2002:a17:907:16a9:b0:94f:5242:a03a with SMTP id hc41-20020a17090716a900b0094f5242a03amr1222869ejc.63.1682588243263;
        Thu, 27 Apr 2023 02:37:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id pv4-20020a170907208400b0094f49f58019sm9313859ejb.27.2023.04.27.02.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:37:22 -0700 (PDT)
Message-ID: <9b03b69a-bfea-83fc-cbf9-c3c61bf73608@linaro.org>
Date: Thu, 27 Apr 2023 10:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: m8VD9kvGlo2O

On 4/26/23 19:00, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
