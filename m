Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp500695lfe;
        Mon, 16 Mar 2020 13:06:28 -0700 (PDT)
X-Received: by 2002:aa7:9a01:: with SMTP id w1mr1350605pfj.256.1584389188101;
        Mon, 16 Mar 2020 13:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389188; cv=none;
        d=google.com; s=arc-20160816;
        b=hIojUgyQcDlq5dt+XqdV5HuQgK20+0qF8cGP9MEa8osouLmrV6r0VE5u9uF4Xyoxx6
         tVame4cwGdlYTMPR6acx9tyvIOlGXrC749Rnu/AAT6bkCQuJ1WEfLff32Y3tBKUL9sg0
         vC1OtocDC4rEUP3+YkW++CYGfGE7K00GbI6siWVnaR+5p3b+8wjxiEVCvr9LAj4goWHt
         lUwoBzS3TOMs1PUVOFbvtsdX50aNjaBx8i+28ANXXf783NxM9+7e5lhh0Mcv2yhC27MP
         vmhKz9RM3+EFM8gUFJCjcKL9NbEKQ5w4pQWg8nhHdKiLwXs8FNWdOEhhi9zRMkHPNzCU
         iV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=oMoLpNdfwPj3BjJ9X6DM9wITDjEHBSTuqrQmlwfNSjU=;
        b=utVyhf+CVvQa6QPPcer4vu/aAsqIJ1ti1a0crROavYe20fVTpRVNJ4b5Qyq+KftU7z
         PqWR6a3QGU/QHM1PV9piu2o/UTQAHzjeYeLxykb1YR0D7QsJjJ68iSFhh4GPE8uIooua
         ltjXBbwwl2jhmdqsVak4klWxGSnMvHavef7RuBJXmcBBEbrq9TjAWa/Hens8nYc4Ztx0
         laY8qxMhf03YGIK+aKWHBY+Lk0JIjYFJr3pI/V1ZuCnpYH/hThs5Amo9Duo0MsbS5kul
         Y7V3Tmn9STSAp+Sfmf/lKF7oEufhnpx5Nqar3k3CGATD/ZdkrtUbok658ocHZG07O7AG
         /TYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfW4NgO9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c10sor910494pgk.16.2020.03.16.13.06.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfW4NgO9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oMoLpNdfwPj3BjJ9X6DM9wITDjEHBSTuqrQmlwfNSjU=;
        b=mfW4NgO9PmedbXOTkBJ2p4fnyqH+PaQYFFXkpEl0+hkas2oi5vm/Ucr8lrSCnzFctx
         6wBrvoaeMeZBG2bQRqO6mw68s4MtCafwnw1Acq3IC/kOQ/oZvCX1QOkyT1nv8l5yR9f7
         nL8bzh5vOlxijwjQmhJX60n3loAmx6odX8iqdxxUKlOyqsvAUvJZGVcUty0Jq2YYVuHW
         ciMsmsWm/7We+5mY6F/srwuqqKqIvZJ3LWnx4LWa6xvmfGDrBi1V+BdAJm3E8Mi8khy7
         N49rccakpTBvzDNoqeIEZhtiDJQhZr1MR+mYhDE+Yea4FztXp6MFREA8EZUCaWd+HufS
         NvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMoLpNdfwPj3BjJ9X6DM9wITDjEHBSTuqrQmlwfNSjU=;
        b=f2vybxtQtWfWECx3zIHbwlKODDgSKujIKXMkN/LArxrn12tvn7JMaraXz9aL+wtVhH
         nxBzLGOS3V2FVSlKk6Urvini32Hkvs6hPOpmSE2Pyu3+kDlomk9Y1TA3CnOQbCtd+v6J
         GgsL+kmEsQ2Bt4QMMHNWLmCNXZJUL8mQPREZUbST4uhl7fqg5s+A8uafhmxdM9g+r3fB
         Ifb3fCMGDQV5gmcCIKfEb4SwU8TUI0JhhgQzoU7STxgM5RzCMzGaJQtM58T6GaCUnJsy
         +iXAStEc3hHaMZrrKh3TIVeqceG1OIMwquicey8dNfItl+QvukfN2AE17evvUK0kVdwU
         hfkA==
X-Gm-Message-State: ANhLgQ1bVY2CuRV7gB5AYEzr/CDZnBw4Tsnbc9zz+2tY/QLPRIiBq01/
	IZbez5XxRT00L3qi5DGI6GpbcC+n
X-Google-Smtp-Source: ADFU+vvSFbuSg/ZfRlESkgsCOFoCSgmG5iPCyQlDq0W9IFjOrCmIyWHQSdbKHKIkdWBjoEo1wl9mPA==
X-Received: by 2002:a63:790e:: with SMTP id u14mr1340697pgc.361.1584389187593;
        Mon, 16 Mar 2020 13:06:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id a71sm687824pfa.162.2020.03.16.13.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:06:26 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0842e82-8640-5903-e59b-99963584b89a@linaro.org>
Date: Mon, 16 Mar 2020 13:06:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-18-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xyCN5J44+MHb

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> When building a KVM-only QEMU, the 'virt' machine is a good
> default :)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index d0903d8544..8e801cd15f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,5 +1,6 @@
>  config ARM_VIRT
>      bool
> +    default y if KVM
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VFIO_AMD_XGBE
> 

Likewise SBSA_REF?  Otherwise, what is this for?
Did you remove ARM_VIRT from default-config/*?


r~
