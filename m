Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp301207ejm;
        Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
X-Received: by 2002:adf:f4d0:0:b0:2f7:e3aa:677a with SMTP id h16-20020adff4d0000000b002f7e3aa677amr826751wrp.46.1681983240684;
        Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681983240; cv=none;
        d=google.com; s=arc-20160816;
        b=o4/ZOyRxTaZQLCBBj0iiTkXcDn9J1sa/uv8+LxaUwMUxvFt7tY+yfUddWZL/Ve/NVn
         qM8MrCgfzewToTPZZ2uyRGTC7IFUfy4LKuD+X7scxYDzpqCwRgvDKmHhS5Dhl352OpgK
         Biq8z+b72Ytr8fiA9fRVQ0i0t7f3zKsm/bVa2m41dUQ4dAyHpclMwhybgAveqpNFLftF
         DaDH5M3XmNfyEkTqpV/xAT2+kEWK++sm83WuOq9Tvg7TR3PWqoa013yMJNWNjLY+DGTc
         4saoFhyH5wQWOUEIbAXagN6JzSOFrwK2uZyiGkv5Moc6rkrqFi9k2QPARIop4GZB7IVn
         bAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dsFbdoeoUjaqGngsW7Gz+bwcV48TuDbxM49TKqXoUKI=;
        b=O108RidTFpA/1PBmjG6hADYlWuhexLdJGjncbDMio2fEFwaiTV7SEGe6FJDXUH/QGa
         osd7CxEtx/iD6+DyvHv6xceewOa9rbgF+EJraoBu/ALJz3gTWMIF+peDTjE++QRSW0sc
         7HCVxT3AKDFvkY9die2PReaDc8WRaqS5A9TvWYtm3Wc4zYwvM/3WtxKHDjA8ZEaOAtEB
         KmV4Zrgxs+rQhGfybH11x5SkPdVbJNAkZbne6m114cCoueTVFsE7OphulT5GyeZ3Aash
         WUPi85OjQw/MDqBYXz1XtgRRfhEPaqYw9W+UMXPdEad4Qoau2Pr/T0+UoT5AZ3d7WWpM
         aeIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTfU4rBm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v18-20020a1cf712000000b003ee1f2edeafsor1342878wmh.6.2023.04.20.02.34.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTfU4rBm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681983240; x=1684575240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsFbdoeoUjaqGngsW7Gz+bwcV48TuDbxM49TKqXoUKI=;
        b=kTfU4rBmq68Ou9EgPSYVKU2uD4iD+r4hFZVwxgKq9Avk8ee4V04ibk2tR1xgaxSiM5
         cRL6ARlt/yJMhmPBc6M4QgbGt5tAEdK4l1CtElLFctLdr3v+qxxKpvDQYsVlsdi8D51K
         wqmWJMjqVlHE6JqmI2ZUuDsVRGrFUbBEq8fhdaJvTemaQR+2UTpm6R7Lou6SPCQHWXCX
         5xYGCOt2EmaBGfCAep6yp/BcH7M6HutejbqXTpAZWYvquxom04qp0NddoiyIKF13ks/a
         i/BEPDywTaM8GiAgIw+U6h5yULCVTY6SV9RHEpWLSeTnWVSyMeuz4i3qosveMJCWQ5hR
         ZPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983240; x=1684575240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsFbdoeoUjaqGngsW7Gz+bwcV48TuDbxM49TKqXoUKI=;
        b=UGXiLiM+3B9NkbDskZDX4wbMohety55p+qjwgDSN+pnE/xqiHyVFsr/+BzKJ0270gP
         sX0Wc6T4z/3Md7KwzmU6lflYKea+0Q4Jc9nMBDqpMGVirXWAbOB1p/Llk4zXCTLsgSM4
         npudC6L9cJ0uhNa+pqyyrK52x608CDlfeFGclEa8W64zDHo/bP0AfKVJfAnU7UEvjsus
         depsggcXhtYZ0ZcECgnKUCiASjJCMnH+OGkCaFw7/z3QW5nianaXb2BZBtgUkJj261oZ
         F7cauPvSYnHjqIP4Lx0OP2h5tAenin5wTaxDIRMdgBFpny3/+DG0Iwvq+t6lcsLl9vtB
         piMQ==
X-Gm-Message-State: AAQBX9fYrYDeShLDd3gbzS4SnZhrE4l+5JypYStsTB8rZzLO3t7anZpZ
	1Nv4gnTF8Juwf4//2RaBSEEQPDs9
X-Google-Smtp-Source: AKy350YEkOt25EJFuLCBLvzdDAQi0dS9JFZjHnCMQbm00u/kgityEkOkAf7Bdhxd+BKQTu/eyGF1QQ==
X-Received: by 2002:a1c:4b1a:0:b0:3f1:8167:dc30 with SMTP id y26-20020a1c4b1a000000b003f18167dc30mr876837wma.2.1681983240377;
        Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b003f17b96793dsm4760001wmk.37.2023.04.20.02.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 02:34:00 -0700 (PDT)
Message-ID: <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
Date: Thu, 20 Apr 2023 11:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon
 hosts
Content-Language: en-US
To: francesco.cagnin@gmail.com, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
 <20230403191600.43487-3-fcagnin@quarkslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403191600.43487-3-fcagnin@quarkslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bjmItzhS+9Nt

Hi Francesco,

On 3/4/23 21:16, francesco.cagnin@gmail.com wrote:
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
> 
> Guests can be debugged through the gdbstub.
> 
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
> 
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>   accel/hvf/hvf-accel-ops.c | 115 +++++++
>   accel/hvf/hvf-all.c       |  23 ++
>   include/sysemu/hvf.h      |  34 ++
>   include/sysemu/hvf_int.h  |   1 +
>   target/arm/hvf/hvf.c      | 709 +++++++++++++++++++++++++++++++++++++-
>   target/i386/hvf/hvf.c     |  33 ++
>   6 files changed, 913 insertions(+), 2 deletions(-)

Huge patch (hard to digest).

>   static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
>   {
>       AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
> @@ -473,6 +582,12 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
>       ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
>       ops->synchronize_state = hvf_cpu_synchronize_state;
>       ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;

Consider splitting in 3;

1: add registers,

> +    ops->insert_breakpoint = hvf_insert_breakpoint;
> +    ops->remove_breakpoint = hvf_remove_breakpoint;
> +    ops->remove_all_breakpoints = hvf_remove_all_breakpoints;

2: breakpoint handlers (and stubs)

> +    ops->update_guest_debug = hvf_update_guest_debug;
> +    ops->supports_guest_debug = hvf_arch_supports_guest_debug;

3: guest_debug handlers (and stubs).

>   };
>   static const TypeInfo hvf_accel_ops_type = {
>       .name = ACCEL_OPS_NAME("hvf"),

Regards,

Phil.
