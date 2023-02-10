Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2049300ejb;
        Fri, 10 Feb 2023 09:04:31 -0800 (PST)
X-Received: by 2002:a05:600c:992:b0:3df:ed95:d757 with SMTP id w18-20020a05600c099200b003dfed95d757mr13535770wmp.34.1676048671327;
        Fri, 10 Feb 2023 09:04:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676048671; cv=none;
        d=google.com; s=arc-20160816;
        b=i9DBCaUgbbHkEryfCbVmLtG7+exUD3vlqdV0bI+lUkGzwvk9gHy+Lrd+LuZEowTp2d
         JzA2WMi734NV09eiR9nY+a3yWxqRoMthSAMdo5SWrXHp/LtUJyT+ScFhW1l2v6BHeKmz
         S5FXwu183Thv8sCT/1mBwDSVGGOpxGbTTdGwdj2JLIWnKHofSOyOsOpu3IZt3keK5Jeh
         UKk8TVYFuAtOB6+XSPzr4qQuTvafSf08p6l1OmeiV0LQHwivrfLubU6iuz4v1/DJl2XB
         zvR1mIba502lklfEA/jfeFIDLXM4c5SxvOtVE6wwK7nTePNSYbv07nsQmQWPY8sybgxM
         tMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ptA/vLYU7bWhA6ewsDK4bcDTBQczDvbgRAwm4IkN5Mc=;
        b=z1ysQCLzScuOiGWNHcwqB2zG7AvARTkBBH1q8R2+OWi2xNLRqq7uzXgGgwBBpOexug
         lCsaGJV0tmkTgmRgSbp76eoW/Wfg38o8t1jF/WruKnJjAUFnpuJku05HiEFYTWxH2Jhy
         AIa4w0Rfc+86JxXIhchDFQKx5TJ9csFNRsGDFIlfurhQ2IU+xUV7TQbBdewnJQiNK7LL
         kFmwEHnEQef/0afRnjrbNd/NutSp10dQMMuMQowiiEXBgSaGPhm7ty39LdsB1uPi2SQ5
         cZi3LVp3E5mJC7eS80Yk7G96hdbp8VeLWexfLYSbeIcDX8ZiIKSHewzEtXdSJJyGDRvW
         ssVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+1z210x;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f22-20020a1c6a16000000b003dc4480ad7bsor3117052wmc.16.2023.02.10.09.04.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Feb 2023 09:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+1z210x;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptA/vLYU7bWhA6ewsDK4bcDTBQczDvbgRAwm4IkN5Mc=;
        b=m+1z210xHroIjXghN/1rJgN0JFTTS/r9kdCLEYL/in2RVLuJQIFGXH4YrYArPDzDel
         YRTqAT2Q52iqRAtME34VpSpd1YqHw5Tkkz/qNx140Ud5cXZHaA+SJupRegwBeWFELdO/
         +1jxDjpigdja2zGEA6zShqBFghYyxUzjEOX9sTpvk+NkHeATe6qN4PJY5z6fetAp3uFl
         RvcyE6UdQUpqgXM5dwVhCntwuwUHJhZb8/+6gb2msZhIJMYTLHoJ6IVtSH6GpES4io36
         2t5VdNQozpIqCHJzYFnZvEGJqevOB+rAmvGvx9UzJw6vUNm5eyn0OW2TiyXLHhIgPmKe
         /khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptA/vLYU7bWhA6ewsDK4bcDTBQczDvbgRAwm4IkN5Mc=;
        b=Ji3KhunJcSPgVk0tHtdZFuz3wBEdjBAM0WljfJ/ZjbeH8v1iXY7IVvXyKqXVM+aAQ7
         ekknlZoms5YEC4xsPuyXBO8nCxlnTc4KI5fLVCPu2BpOIks4MKIzFMphm3WUJI2ayzm0
         yefNTaQkkA7o7FHVySjBGEHVW/rDdJ44/PjQFL1lUAhju7LVhML+bdcRNanVUNPUzYHK
         ZFg8+WvJ2HQrV12tMBCbvlZn/tAi6BExrex1Y0W1HPmSdYa5JN4g4ZV/HuRibEwEh1D4
         C7vjppUcgAMZYMiPSAY6E4a+Gr6OxtogozDjLHHzeLeU3dcbwGtTClD6Eh1d2HSwGai1
         WLvA==
X-Gm-Message-State: AO0yUKUwfpKV8Z6lFpTfBwkciHpgmLxAuV/52EiL7Ff2/Ndzi0LqWUoU
	0XX6t96YNHjh5KuqzTMi/xDjxlWIM03jaUdOroA=
X-Google-Smtp-Source: AK7set+71adLq6wAVml/K6PV1lbcAAcFwSJ0YtIXRfVnMUIUB+WUz2uCRRH5vNJ93Stmt+p88QOQ6g==
X-Received: by 2002:a05:600c:3197:b0:3dc:5240:53b6 with SMTP id s23-20020a05600c319700b003dc524053b6mr13545499wmp.6.1676048671075;
        Fri, 10 Feb 2023 09:04:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c379300b003b47b80cec3sm8537117wmr.42.2023.02.10.09.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 09:04:30 -0800 (PST)
Message-ID: <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
Date: Fri, 10 Feb 2023 18:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 0/3] Add gdbstub support to HVF
Content-Language: en-US
To: francesco.cagnin@gmail.com, qemu-devel@nongnu.org, alex.bennee@linaro.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1uFxMa5ihO7i

Hi Francesco,

On 14/1/23 17:12, francesco.cagnin@gmail.com wrote:
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> This patch series aims to add gdbstub support to HVF (the 'QEMU
> accelerator on macOS that employs Hypervisor.framework') on Apple
> Silicon hosts.

> The patch has been most recently tested working on macOS Ventura 13.1
> hosts and Linux kernel 5.19 guests with the test script
> 'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
> with Linux kernels compiled on macOS).

Could you share the test-gdbstub.py changes?

Thanks,

Phil.
