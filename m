Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp545805ejc;
        Wed, 11 Oct 2023 21:30:27 -0700 (PDT)
X-Received: by 2002:a50:ee84:0:b0:531:9c1:8276 with SMTP id f4-20020a50ee84000000b0053109c18276mr21338125edr.4.1697085027656;
        Wed, 11 Oct 2023 21:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697085027; cv=none;
        d=google.com; s=arc-20160816;
        b=JOVj9LKl0ULya/xKUHZTnE/EJK7ANwOaV/9mEvqn7e0EFlPJrWuDTsy7iNHPjOeWPe
         q+rMQeYe638M5pgmk6zdsA9CLmEWjqhoPmvImoNspG8DnMJQfJYJ0t3eUUi8WxwIeWPa
         erJ85VdEO3gp2zXyzsLJ8vDcsfn38M/+kL50h2jVCIZUUD/ownKg79Fba0e8J8eLYM0g
         +U9g/sOwgQ1twl7zLCw/tOFbW0lc5fkovY4XgXsnOSYpGqJfUwSBRYooc7gRbaD/GwYH
         jLMs1Gby6yEul2Lcw1ORc0nSJ8NDmzaT/k9I6GO5Yd+uauF2meaEKORPp9JTm1MHNin+
         wGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VG8Xk44hp9JxvabFTtXK+e131SlWFy24PsH13mlhw64=;
        fh=Ds42nQIwuey356pb8Qg3yPeqGWbcGr0nrHAjhi+naMk=;
        b=N4hkssGAfToEKHw6OF3bEF+0e07TsJdab7+vvvXl3MHL+pZI0DWIVurfIe2/jJs7Cb
         jD51hRdc6/g0hTlguT1fm/m9jsD/70ncUWXRUldcOH+A/3KfW3pp8xicBB9iHgU9/Mgo
         8PhixPPPb3uPiQN3c9oQgH+NYWA811B2amABzl4O2aJj2NJDZObW0QQ0qxu0VjgUVaTp
         +kjZnlTrhe4YP0n8moEDeuL2koYezsETLdG2gNwVMssEx2VaaOSSnp8iSI8vR5zO3fl5
         LHM4V8iW1YrTp18S1nhKacWvOk87zuK06xe4pJfayk3SF6dMn9QDftFAXY/g0iN42IS/
         nBlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k40wqReg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cz28-20020a0564021cbc00b0053dad48dd9csor1426564edb.7.2023.10.11.21.30.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k40wqReg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697085027; x=1697689827; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VG8Xk44hp9JxvabFTtXK+e131SlWFy24PsH13mlhw64=;
        b=k40wqRegGljYNDvtJEutoSiifPokS001mMMNG4yT5lI3WyeFKceKh1Y47Z7kNQYfpj
         yO8aYnK8C793cBfSsa6ioaYc9KQq6L+Iyt2jIG6oB7/rKVKluUwQRva4juCOps7yMRee
         OonHNYPuIXUWI6ST3YVFS8fBqnIaNJkgnThGHsoaDI44hwUAltFaBQ0w+iBRqA2hzdMr
         6FukWhl0XJZRpT/FH+1zXj1Wuq4LwGinl8THSKIAx+ppYqaDV6mc8EXJXpAWUd9kFsAt
         5wbpop5RG5jNQetJx/6OQ0/6KM8K0Q1brBemflWwES0YUl6FfGLzOg+HgrTncSc+FRe6
         rvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697085027; x=1697689827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VG8Xk44hp9JxvabFTtXK+e131SlWFy24PsH13mlhw64=;
        b=ehuas62pNknOXG+7/2fNvuwL6yPZYElu8UiHhG7qE9Rk+n1rMCkWGS6Vr1hHWxJQ35
         9dOtkJYu6dJsbA0prakNYLjOfTl01EZ27SJvyRGthsj/jcsllagyP2vw1NbS13OIJ/pP
         JfmmIwC1M9IljGu6RZ3oyyvgJJDaNE68hTx2/rO0UsWpkpd3RR+lHFEx9MRrAd21/FO6
         VqDiryNm32FR4TYVJCqaVGy5wo1ZLEj96Oihq4H0779TopWeIIqjDiYNqnE1t23I7MI4
         O5WCyzfxsvYJoQr3FC6Ug2wPpm9nhn5mYtTz+o2KqGGpVF3itY/ygRNZosJMpgmE7Hky
         HwOw==
X-Gm-Message-State: AOJu0YwCgDYbSD3y1i53KjQCxz5K87oNWNyQVguYeL58u4JzFZMBBpWG
	Mf+zNw05bN/urnqmJw4V8pQe0EkQLcL6SZm6jgntCg==
X-Google-Smtp-Source: AGHT+IEfJXe20Op1Ag9DUrwgRxuSEFf9THgZww2zOYsHf8NXAM8agqumnRlIS9T4pnqRH6jVHngxwQ==
X-Received: by 2002:a05:6402:22b0:b0:53d:bb21:4d90 with SMTP id cx16-20020a05640222b000b0053dbb214d90mr3232027edb.40.1697085027160;
        Wed, 11 Oct 2023 21:30:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id eo15-20020a056402530f00b0053d9cb67248sm2704584edb.18.2023.10.11.21.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:30:26 -0700 (PDT)
Message-ID: <b98e4566-56b4-d0e4-adb2-c163c7c26cfb@linaro.org>
Date: Thu, 12 Oct 2023 06:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 01/12] hw/arm/virt: Avoid NULL pointer de-reference
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-2-quic_svaddagi@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-2-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0DVqv4xv8B+R

Hi Srivatsa,

(+Markus/Peter for QOM fu)

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Avoid dereferencing a NULL pointer that its_class_name() could return.

While your patch is correct, there is some code smell
around its_class_name(). IMHO a foo_class_name() handler
should never return NULL.

I'm trying to rework apic_get_class() similarly, see:
https://lore.kernel.org/qemu-devel/20231003082728.83496-1-philmd@linaro.org/

> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a13c658bbf..b55d5c7282 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -661,7 +661,7 @@ static void create_its(VirtMachineState *vms)
>       const char *itsclass = its_class_name();
>       DeviceState *dev;
>   
> -    if (!strcmp(itsclass, "arm-gicv3-its")) {
> +    if (itsclass && !strcmp(itsclass, "arm-gicv3-its")) {
>           if (!vms->tcg_its) {
>               itsclass = NULL;
>           }
