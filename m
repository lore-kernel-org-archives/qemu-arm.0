Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp345107ejy;
        Thu, 29 Jun 2023 06:42:35 -0700 (PDT)
X-Received: by 2002:a05:6512:48c9:b0:4f9:5a61:194f with SMTP id er9-20020a05651248c900b004f95a61194fmr36lfb.11.1688046154769;
        Thu, 29 Jun 2023 06:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688046154; cv=none;
        d=google.com; s=arc-20160816;
        b=HwHLWsOJYCmQC6KyQKYm9nhJbw6cgvtjQ9F8AkEt1JF2L43wFRxJts2yvxN3gFSdqj
         byIPXEJZ5wrn2g/m0oL3ekh+0XqmGQKW+WYJtPQW+6zsgJRV5y/RmHDSvPmbqXiQz/Ci
         1Wy3tnOj0k94oDlA8F+ZYxCxOV9vRueR/EoILZz6E5at7tWKnhoEcZvLO0IZo/236FC4
         RnaY/GDelTdOzV1U9r34HFRpNCPwuQcrZUgCIpaQ5Jtg5zYYLSgCsGEi+XabP2/nvls7
         quVd/GaHxFTdRVWYQmr8rCQfU/odGTFIOwIjQpzOZXEEW4YDHFIjPxGQJu2V0a2+6Pea
         MO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kPADWGwZmjUgnQmKWu0+eC9DtoXBCG6ZErOMiLFVLqU=;
        fh=5Jtz8l6Xr/+xfy8XsWdZeSB1MLrEv03xgLILbbohs5Q=;
        b=qPGNOyLTFKz/lqUsQv+Ae/noPgh/slFPA9SqhfLMYFoIQBFwBHWJ3yNIKRKouMW8qZ
         Blca55lEthGnMS+tAHXRaV4OIt0eaEKahOOOVO0Fsy/uFqvmXvApRcRMRgWEvz0eHx1x
         2R1XbteBfTWqNBHICBnV5FjRWeTBOffxOkP23PWQ7HGvnmaNnKkqGyn65LAgpyO6YEyW
         W7hZpFz4nE09OTnh94fuvS9yM4Wk89cFwaN6EFPZNr7qj9f8FaM2MyGl5zI9QKS50k3M
         K0PfKzzeouxZtqEGluSKWSIi1xW0mo1axHfOpmm69NaLutK2kJ9crcS3VH+DM37JtxdU
         AlmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lM8dHHGs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y3-20020a056512044300b004f5a546de41sor2833137lfk.13.2023.06.29.06.42.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 29 Jun 2023 06:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lM8dHHGs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688046154; x=1690638154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPADWGwZmjUgnQmKWu0+eC9DtoXBCG6ZErOMiLFVLqU=;
        b=lM8dHHGsrUfx5Uqs3WzGtt9M5LcmD+1qC8hVgtSKrW067VJ8286HbZ80G4RIHkGrO7
         VpKp/tRzbKf3O2mHixeVVvA5d+MfTPGhT6ePt9WtCR9tmD+k3ipmVQN2B6eA9PtkNlLo
         CjvlAqYbbZTN9JA6RJvTPyNkPA6INKa2ee+DdVej0LuWpFjT3q4CHas4fSDH8CCS8pR+
         PpbUXRsGbWgGcIJDyE8IUgePeuCp1lgbK0cy3V3xLzM3ZG7hf9LFzloX3qFDRX1eQdSz
         NT3+JKApQ9jtNxKfrmVNGKLSzpFj7MOT24ALbTg8dbvTmmGxm9y3jJUDDph6OfuVU53a
         m6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046154; x=1690638154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPADWGwZmjUgnQmKWu0+eC9DtoXBCG6ZErOMiLFVLqU=;
        b=fAuTJua+Vv2sgR4S0vLgAjs0qmKXYynVMmyTnJTiT4SuEudS9W9qHOvoAlaoSRKrBS
         0ykgPpdkguaNNbmOJG955zPCw43x/XVYoSJREgCEZ99X5HODvhmdug9HZDjgsPZYfWKd
         7BeZWg2pHMa51Wp7fiZ3iaGSRpG/AFF3OAMw7MnxeR2AI5olz6UAiCh4qUl70RWTGWe0
         VAWhlycdkz/jQ7Rjv2uZQ9Smv2EvkYGaJlkgjcwBovnEp1U33akfM+1zzFLcvesitPr+
         MMq7njwusMVisnIc4tJ5/1tHwvwQG3d5ktKTd+dg7nNAAhd6X+mDzlM9Xs5bu+bxFpsl
         B/kQ==
X-Gm-Message-State: AC+VfDwOg090lBj+AiO/CHMsnGZ3tza54f4K/dWWD//B8uh9bWTwDRk7
	9ZzXQuFfYYC/z185y+eZODQnf1HXOZbFRGMqNUqLDQ==
X-Google-Smtp-Source: ACHHUZ7v7zJQmkwnzblu7B0J6h5DwWsQOGvbYnRpywTkNbJbRD08qPeXhiO9JiiizLRVosSoLTJ4Mw==
X-Received: by 2002:a05:6512:2117:b0:4fb:8966:5720 with SMTP id q23-20020a056512211700b004fb89665720mr5183778lfr.25.1688046154151;
        Thu, 29 Jun 2023 06:42:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.166.242])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bc8cc000000b003fbbe41fd78sm1146471wml.10.2023.06.29.06.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:42:33 -0700 (PDT)
Message-ID: <6baa05eb-ab60-8bef-a57a-9e74088bac0f@linaro.org>
Date: Thu, 29 Jun 2023 15:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 04/36] docs/devel: remind developers to run CI
 container pipeline when updating images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Ani Sinha <anisinha@redhat.com>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Keo+nUmYVjGB

On 27/6/23 18:09, Alex Bennée wrote:
> From: Ani Sinha <anisinha@redhat.com>
> 
> When new dependencies and packages are added to containers, its important to
> run CI container generation pipelines on gitlab to make sure that there are no
> obvious conflicts between packages that are being added and those that are
> already present. Running CI container pipelines will make sure that there are
> no such breakages before we commit the change updating the containers. Add a
> line in the documentation reminding developers to run the pipeline before
> submitting the change. It will also ease the life of the maintainers.
> 
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20230506072012.10350-1-anisinha@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
