Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp554819ejc;
        Wed, 11 Oct 2023 21:52:07 -0700 (PDT)
X-Received: by 2002:a17:906:ce:b0:9b2:a078:4461 with SMTP id 14-20020a17090600ce00b009b2a0784461mr19106033eji.44.1697086327620;
        Wed, 11 Oct 2023 21:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697086327; cv=none;
        d=google.com; s=arc-20160816;
        b=cJqb5Ze7PdEltKg8R+q+II5qmB1t4tLS1bxd4JfAe85pwrC/ICZ+oaFgCNwas806y1
         G5GP9Qv6hNDpcEeGuaLDnZI3DbZXHKA/KAp9A18xuJWhsSWmdx0b0+xQEK1m79YLdiIT
         A3dQd9GLevIj5KqYg2Ocpsb42Fg5zQBFeAY51R+uFyjJQ1EZmQu+8WdobXYabmLqlfdR
         bH21dWgpr/9GyzCfhCSjFMamerk0+XBbTmHBKly7HUmC5bJxcVxTBeSdJh4vlAx9HImA
         lv/6MM8jSwZ3vfpOGFq5yGFEyffzi/XvwdVH+MSn9uPuH+84ZDf6SMBIHWldEZcbpiGb
         52bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rDelcTJFe8mOTTTdareous3udwOQBNDSUsx28o0UKnQ=;
        fh=bnlHsjaKacMB3fDegpjr7nbD1bI6Dl8nlxls0R7wzq0=;
        b=yJaCPMwJvJ3lXu98FhVDIHvRfZCXwrip2suRAniwS+p9iXsQ1Z/Ie2UoN0/wqd8EOR
         jdlUQEkyj672xIbvTa2f5dQx8C+xt5wlRa5TtTsor6ILx8IDVFS2LDlqhwchOU5NE+Ub
         bgNppczoF5ve8cyJ5tk8qs+Cq/2xcDy05aIWYZgqVthcGe/jFlTGAtR/xPsazstCVwGa
         ddmmleOh2swVOcNx1tRmRVOZNaJooNtulljQjAv+XMfyeun7bmKL4f760quT5mNM3MS1
         4Ce112UiNM/hkkv5/SQ9EXOwZd/TqDbJsK+N6bfK8jRbTr8nM2l50ehsQ7OsEAKlmCGD
         e68g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4ItcPA0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jg37-20020a170907972500b009b9f90579d9sor4962419ejc.20.2023.10.11.21.52.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4ItcPA0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697086327; x=1697691127; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDelcTJFe8mOTTTdareous3udwOQBNDSUsx28o0UKnQ=;
        b=U4ItcPA0WH7R1xXd1aa3TbmCJshTtG9pvsr4U72eQVk+fxLeqfCITzH83LPkrnE7O7
         f+fXJ57K6p6F/1DyXfEYGgE1SH/8ja8yVaJp0xPliN9HROziPZbpkMsKl4VFB8imH7Q+
         6k6DbkCUrutuzs4HDXES9cc9/dMDPed35zJ1JTNEo+Yashz0kFi90ZXEym+pnMC3gsDJ
         lfd0QqOtpppwAImbrXt/Tua9P5c4h12j/W4upKVqgk2xNaClq8CGtBaPwJBN5nwDwO3o
         LDefKo2aHXvu06gqU6IboPIJIqNEIg5oUJS4IM0JF8cF9feApkLb1WeHscbScSoBXBSn
         EazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697086327; x=1697691127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDelcTJFe8mOTTTdareous3udwOQBNDSUsx28o0UKnQ=;
        b=U4/mowoNe1e9LxGAlzDEFk7IYWRTukul+asHenyN75WhsSJA6m1viiNGRJx40io3yw
         Gontjk33ws9RfPMGm+6EAjnR86EuWtQkvhvf7fEbGB7BVM0ZT+MG9RKKkYV5uoid/s3c
         W2Ykij3sSaDxf3OLIb72N10jOA1vY5MTT9dh8jERttpwBv7UD5LkEnF21BqOwDJc3He2
         Glhhvf9TCh4j9roBqHwqU+i0xZLQxgq5dQHPg2nc1CYzHUaU9BqdpqfnYgnPebghRz0l
         EcArxfvwTZeH14OO8fWob+8YtMTatHmu9tFohm7kD4FHpkH8/nJ4bqDj3LqCCuIYxSp0
         4Z0Q==
X-Gm-Message-State: AOJu0YyBpdpj8WSppcJmJ0TRC+hWSj24thiTCQAJWfsQLeLbFzVWhPTv
	OVpNdHSpZBDRzXoz3hz00imkHUou
X-Google-Smtp-Source: AGHT+IFlk9BX7KDI5xqssFr3XSB52uw5GPgrEtmbR+atJftTAlFMST+SYTZU6w9w/G9vnywxzqecvw==
X-Received: by 2002:a17:906:4e:b0:9b2:9741:e1e9 with SMTP id 14-20020a170906004e00b009b29741e1e9mr20749857ejg.7.1697086327171;
        Wed, 11 Oct 2023 21:52:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906045b00b009b655c43710sm10582687eja.24.2023.10.11.21.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:52:06 -0700 (PDT)
Message-ID: <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
Date: Thu, 12 Oct 2023 06:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 12/12] gunyah: Documentation
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com, Brian Cain <bcain@quicinc.com>,
 Mark Burton <mburton@qti.qualcomm.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: UD4ymJtKYRQT

Hi Srivatsa,

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Add gunyah.rst that provide some informaiton on how to build and test
> 'gunyah' accelerator with open-source Gunyah hypervisor.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   MAINTAINERS                |   1 +
>   docs/system/arm/gunyah.rst | 214 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 215 insertions(+)
>   create mode 100644 docs/system/arm/gunyah.rst


> +Limitations
> +-----------
> +
> +Below features are not yet supported.
> +
> +* SMP (PSCI support needs to be added)
> +* virtio-pci (support for which in Qemu seems to rely heavily on KVM, which
> +  needs to be made multi-hypervisor friendly).

Is QUIC interested in working on that? My work introducing
AccelCPUState to make CPUState accel-agnostic was done in that
direction, but I didn't notice much interest in the community
so I unprioritized it.

Regards,

Phil.
