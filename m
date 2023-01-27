Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1443421ejc;
        Fri, 27 Jan 2023 13:07:49 -0800 (PST)
X-Received: by 2002:a17:902:d647:b0:194:d28b:a498 with SMTP id y7-20020a170902d64700b00194d28ba498mr28148732plh.47.1674853669583;
        Fri, 27 Jan 2023 13:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674853669; cv=none;
        d=google.com; s=arc-20160816;
        b=IbVorSZYG88K9au5ACM6JlMIcg04adQawLFxlETfGqerYYg+9TOYdCFD+DeA7ZIklb
         dTCyCkuwIpQU/hhbkDsJ690O19qcVB5yTGnZmN6cr8qomDgLO6JKTmjtGxqyEArGsTnk
         hZ26LD0ff3Gl6OvJoqBsfnPdcr2iX5s1UU2yTF1sbGvePSl3OL1FVbyNJG7wUXAGyX/g
         xeWKQmsluU+T6aR61OCLjYClou7WVgBRXieRmuBO7Q6Q1/Vgbe1wnFwrhrrFmfCkzGbm
         HKbaa+ezgkZt13ehQmU+mI1IzfqZlR8DpWeUcyvvf4ooGrXRpgNJBenCU6Ed4FZw846R
         qSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/mhixy3+vpZ+fgS0Tib5mpjEOxFlJkWjwxOcjMH0AIo=;
        b=B0WJAKmHMG6XuvimZujukyiPvr7QRJxF7skz6jG0qGDxlWWaV0e3AufKLofk02/zzp
         XRjK2cHFefgjv5LSC8h/jzj2/KZjbHdkAAEPJsVVP3s+YUfiD5wAP+ZoWTfMtjTr1lI/
         lRq4/TjYglDYafM1UjtkrUS3Zx6l2Dx7n1r/bmIAVjpIvnsb07Q6HhAlxuQLTNb7ZC6Q
         RzWeUlCkkLl5fJbAxCbPF24UX+MAJeJJuYunFuQpH1kCZY8L+tyyecDy3MAEMdatZpaH
         24OZ+dcb8ba/YdmX0LBE0qQ23RaBenOtYo7xbroWqMpy8ge6PlhYuqFL9iDP+2RXUxMk
         KQOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b8ODi/uJ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b2-20020a1709027e0200b0018660274396sor2414264plm.15.2023.01.27.13.07.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 13:07:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b8ODi/uJ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mhixy3+vpZ+fgS0Tib5mpjEOxFlJkWjwxOcjMH0AIo=;
        b=b8ODi/uJ662uDND6lvpjOO5GMMZ5jN9NmisFFgDOYF64nWgqcnhGVNDzSw6ciaxl/+
         YTNV9dvyZRaQT1sWuihh4ZmwzYVgvzxmStZdcvTR/tg8cZOz7LDmnPOqB/GHVM5nI/jh
         KBloOgY8/9UOJ4jyySoRNSkiu07XBl+LXXGGOX9VELCvI76FLGAmRX2x6zItSVY/gA2c
         RvvJPF7azwonbZmCUyWbokl2Vlxk+sD/ygqJhV9GuM6iJPyTwjZz8GPcbAj7gyFbmZuH
         QuVFh+XCY6jlRbOKfUG5+Bz0fVbZZOmEs1HvoeAYw7w43oGqCjsDiK8hZEGKRWtZGaVI
         HVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mhixy3+vpZ+fgS0Tib5mpjEOxFlJkWjwxOcjMH0AIo=;
        b=eIS+MO5UBf8zOONTbQNG4/LYsbBAfsh6n8NPi1q8nEW/y2UeH0uEpSE/+kRtzh7DBi
         bGQVuQfv3lqfeaChbgkfA5AhN9jgk53EDPjA2/K6Vl1ONn9B0Bsm2u3BhrVJ7FaRjs2D
         0JPz35CWkGY58qtTglSoiF02IDWDqPqh9IXFi7MlHyS9B1jnBhLJeP18Z4RlptGPDaSM
         z/0vDSdiHUGf+NK8jScx898AstbbzftqtYuugFtRxLngHVMzbqCnEJ6rghPdMO2ZQ05A
         Ff4KOsuOpWOldAI/rfzlWvIIMNHNE9FQPLlM3rplNgKG0/LcykjYDIycDgZK0Vce+sjd
         yFTA==
X-Gm-Message-State: AO0yUKVEq43UFji7eqh9wbtKoYCU3DMd0jm9go4p+kru/wulGqmZqXOI
	nYGx7/yW9s/xYIkEnOQ5f+dfv+Xi
X-Google-Smtp-Source: AK7set8hEE+pQKZ3VH68CDV+G7epZEwF8z9fOQNF21uTQEgeag1wErnNT/Qc5kKalgoNtiry4P52fQ==
X-Received: by 2002:a17:903:210a:b0:196:3e78:70be with SMTP id o10-20020a170903210a00b001963e7870bemr5667580ple.40.1674853669095;
        Fri, 27 Jan 2023 13:07:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902ebd200b00196053474a8sm3289864plg.53.2023.01.27.13.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:07:45 -0800 (PST)
Message-ID: <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
Date: Fri, 27 Jan 2023 11:07:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-5-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-5-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: G7avS1Cx4/bJ

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> When confidential-guest-support is enabled for the virt machine, call
> the RME init function, and add the RME flag to the VM type.
> 
> * The Realm differentiates non-secure from realm memory using the upper
>    GPA bit. Reserve that bit when creating the memory map, to make sure
>    that device MMIO located in high memory can still fit.
> 
> * pvtime is disabled for the moment. Since the hypervisor has to write
>    into the shared pvtime page before scheduling a vcpu, it seems
>    incompatible with confidential guests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This should be 3 patches:

(1) Including the rme type into the kvm type.
(2) Adjusting the pa size,
(3) Checking the steal-time and randomness flags.


> +    /*
> +     * Since the devicetree is included in the initial measurement, it must
> +     * not contain random data.
> +     */
> +    if (virt_machine_is_confidential(vms)) {
> +        vms->dtb_randomness = false;
> +    }

This property is default off, and the only way it can be on is user argument.  This should 
be an error, not a silent disable.

> +    if (virt_machine_is_confidential(vms)) {
> +        /*
> +         * The host cannot write into a confidential guest's memory until the
> +         * guest shares it. Since the host writes the pvtime region before the
> +         * guest gets a chance to set it up, disable pvtime.
> +         */
> +        steal_time = false;
> +    }

This property is default on since 5.2, so falls into a different category.  Since 5.2 it 
is auto-on for 64-bit guests.  Since it's auto-off for 32-bit guests, I don't see a 
problem with it being auto-off for RME guests.

I do wonder if we should change it to an OnOffAuto property, just to catch silly usage.


r~
