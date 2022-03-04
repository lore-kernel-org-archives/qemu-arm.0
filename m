Received: by 2002:a05:6214:21e7:0:0:0:0 with SMTP id p7csp1616108qvj;
        Fri, 4 Mar 2022 11:52:58 -0800 (PST)
X-Received: by 2002:a17:902:d50e:b0:151:b8a4:2a84 with SMTP id b14-20020a170902d50e00b00151b8a42a84mr5811426plg.17.1646423577821;
        Fri, 04 Mar 2022 11:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646423577; cv=none;
        d=google.com; s=arc-20160816;
        b=qXumGBBLI8XhI3YVoPBTp0gTh7c83GLlMc7Wk4K1ReagjAUtid+5+gOLh3bn6xXXQI
         O6BuB9JcXmwiGXiJvM1nD7QyvSKli4sVPciJFI2iDYSWd9z/KbEnRhdbphX3+/5++KIN
         K+o5baGS+WXt7yXGVRoZIj1T2aZ5e9eF608+3Ts0n11eJlMOVxFeJS/tzAKdpd4NGw/B
         a8UcW/6w+7FvFccPZYPupzvdaWvjLgpu4hkfN7QMVneeBm3gISaXbVjTSgBlB8SOMtF+
         +XGaVkw8RJV/I0cT4SWBSGknLjVxC0s6F+4it8eCwJeS15X5viZEsusy5Qnoo40C11Ut
         cUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=isLEgj/rIE9pf2fYCkbJfnTSK+RAGub5ms/ITRC6pyE=;
        b=XiP3BTKt15H7IgOs7BFYRQ4vbkpmsG9M5/e16Dt3x/GsxVZQzoN5zw7YyuLH09yq2q
         i/pimSNrJe8jFNT97hEdKbjALoJfq2aAMxLJpk2MCSq7Qs2DROqKVJVzAKA9j7E8/aR2
         /e3pidjM/Kxw+qwouDfN2X23rceKcmAEylSovxNoSqCjcufADm4bGqszAdxVybLATgH9
         P1Pueb6QCzZ2GZanpRI9TyUPRA2oehqQ9g9eZqf2BeLvKf9FH9GL7gCnhheX8x18sK8o
         DrHUvWOZZLGMosk+2eJ33xJ+zlDOZQAeJKk+wbO54dEkNOqR9Cpj5/IHvn4K047Q68nu
         tcSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuaRef82;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t14-20020a170902b20e00b0014fea7324d1sor1431771plr.69.2022.03.04.11.52.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Mar 2022 11:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tuaRef82;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=isLEgj/rIE9pf2fYCkbJfnTSK+RAGub5ms/ITRC6pyE=;
        b=tuaRef82qCZYrxgm+5GUvFVSoKfMkPhF/lp5DU0pkblok3bH8CvNcZwdZVUEQ2m4Q2
         ZgFkkyysbQ6uL6K+JIcpZEuQeCwlNkM6cGI4BDFvNHWV+5tdE6+dhITzrWH45e3y/3Zi
         L56gbLgzKnM2dJfJ15kODLDrliKaU/yttKy0NrFyxZngDRwE16dELkAd/0E7hBajzDCB
         GQ85EkRmjVxQsMiCgw4I57v+8wpvT7HWzY9rDf6q4fKKDJMJzj6XqPB7YbjzSXEOHCwc
         HMZPUL/KfSAfLNi2/4DaeLCdtvsV/9/9Wm3o+8mcWBRh8n6e+N82NO5wNZ2QtVb6zfp0
         68SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=isLEgj/rIE9pf2fYCkbJfnTSK+RAGub5ms/ITRC6pyE=;
        b=CRYA14/Ek1dEKUwqnMNygWECnv9YIreSBAxHHcjunKWHwtIwdomDAuDzqP1tLtWe6g
         VoJMTC68S4QxbIEZEbsxN8XG2MqLkrPROBrK2w/0Rs5qvZvtPJl9yaj2N7t8k/mD+TPv
         rqCQ4XULz7VNmpNeczxoTfIOH0O5bGgp6sDI/1vAn6FiuXwT9eZbtcXWQvkG+GeNzoif
         ChIHZ9ljdamMf1BPXy4Egy6QkZ3erXiVjwgkaWvi8RKw84q2LiQNcpJlyfM0oytshdfu
         w4ubk1OTKRsvbpIx4Uer9pd4QBQ6GveBnIlQKfTj/VNNZLS3rf81w7gWl5mILTff8nUZ
         o0AA==
X-Gm-Message-State: AOAM531sNLRgIczcgW1Ta6B8dTz5Ts6t0copbK68oAxi5qt8GCr6rvMK
	BBsg3ik0dQnZNyVuDKXFevxWooQ/
X-Google-Smtp-Source: ABdhPJyJNwvTvAtJGxDlgaXT/IqWeQJETz1IRasvOPaxPbq87mejsUMgIU8nt8o/F667DQS3rO9hnQ==
X-Received: by 2002:a17:902:cf08:b0:151:9d28:f46f with SMTP id i8-20020a170902cf0800b001519d28f46fmr208080plg.53.1646423577416;
        Fri, 04 Mar 2022 11:52:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304? (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com. [2603:800c:1201:c600:f24b:57b2:da7c:e304])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090a648800b001bf2b437609sm2234897pjj.24.2022.03.04.11.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 11:52:56 -0800 (PST)
Message-ID: <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
Date: Fri, 4 Mar 2022 09:52:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
 <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DK2sZA5TeWfe

On 3/4/22 01:52, Peter Maydell wrote:
> Is it not possible to implement this in the usual "change
> property for older versioned machines" way of adding to
> the hw_compat arrays?
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4d..dac82a709ba 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
> 
> -GlobalProperty hw_compat_6_2[] = {};
> +GlobalProperty hw_compat_6_2[] = {
> +    { "arm-cpu-max", "lpa2", "false" },
> +};
>   const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);

Hmm, I didn't try that, just mirrored the other examples within hw/arm/virt.c.
I guess the real type name would be TYPE_ARM_MAX_CPU, or "max-arm-cpu".

...

Yes, that works.  I'll send an update.


r~
