Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2526764ejc;
        Tue, 17 Jan 2023 08:36:11 -0800 (PST)
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id c18-20020a05600c171200b003d9a145091amr3572168wmn.28.1673973371174;
        Tue, 17 Jan 2023 08:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673973371; cv=none;
        d=google.com; s=arc-20160816;
        b=as7FQh0sHU6FiEDGXrI5TXBoQL2k2QPdNpONTR36ULNOVbIx8TSoGwhtld/0W8uvjf
         XNeXfAfZUfSNJ8nf7Y+yFQm36nVskZPDiFqt7C/Py+lQpBFZAD3eVMjiPCcl8EHGVjCf
         349RzhwVwRfhU6tBMWly9OzXeQTG/OAqyH8c0iqZaG87zpiSlzeu10V+5tRSztlyOYU1
         zbqv1XZDJTJ06ZHi6SHIgt15IZ6guOEAsPGke7DIXVVP4XUvo4czVtREqCLejWiv9qpw
         H+s8UQaqFS4dAFNsRniAmG4cA828b6sgaOu7Npa32AHwgEyD+u5b/6wIUgrlMTn3DB71
         MABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lYmJt58G9wkjH8jjc/IUabvY7Huv+soQLDGSWPxDJF4=;
        b=bxBS47Qq7JrU/Amv7btbryzOM+6Hi6b/2pYTfOwuQ7iti40Ai/eNI4bahm2z+0vmXl
         qdgPLc473Q9Wglhvnl78HaanCuRMbh6h2lGTOk4OFSUW5hVXA6rIvW+o8ztxYYkXtFFX
         8iRNTfgrBcG0Yxxm1o06xyFPIpM6xWwNsl/Z6TOsIMw8956M3PoBd9A56WhH8H8Jjj+J
         mznwOTHj/7CAFRfuu+2cP+bIArPK8pU4WxG9bV+4CzZQTazsdueLhuKwc6977DtpUxMO
         xMUgeZh9RsIp/wXStMxQE9X26LLqD1xNOtCdrUj1yZChvhRyq3ojZhIRFR6J585Sh4Qg
         COoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9vVzqh4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az19-20020a05600c601300b003d969a59612sor3928277wmb.9.2023.01.17.08.36.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9vVzqh4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYmJt58G9wkjH8jjc/IUabvY7Huv+soQLDGSWPxDJF4=;
        b=p9vVzqh4Xr1yCW0r1vkW5VjVZGbgN6a8Euasz0mRldIrZBHoFJFVjABm6RdzDZU6a6
         P6KxviGFqJ6hA1QbnR81/AFxXPDiux5EVvSPvyj94Ywg+ccDKCt5ox4WSfiy3SXl8pIy
         q795OHavlQZF+b2uKq2oD9cHsLQVdsezwLLgu6anAmQ2UewhJFQiHrj/3rzi8QN38u9A
         YXSM4uLspSjACvSz/9WwbXUONdXomloYGWy+cRDjUdCBRbWSHHwvK7VVu/ZqJypP9hrP
         7+ccdHwlBHeJH7BT2El/c6b2mRkGmtYpVWkfq9RUn7Eph1pBN8qMs+bmKr0UADTMwDgX
         aZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYmJt58G9wkjH8jjc/IUabvY7Huv+soQLDGSWPxDJF4=;
        b=es22jweWaxF/jRYk/N8VWsSw2VzI0CAor1O3iz1fgJ4vpanW0AMthZYYBD7ceJQZjW
         HpoHU0SwWLIK2HbL+brR5+MsMNX6eALJd4a4yh9dvpkprmQ5k5s9gC1qlfGGGCZgTaCu
         eWGnB8PoNFwqC22m+e9Ik3D7WLvDt8ajmVxhrH8A7SwvQOEki2kGDeBQ6PoilbaPdq+I
         QjjE0MrifejoQFeiesq7P/We4GteDlGKhcWamorKervu10h/jc8xgHOgM8a6DVDXXJqm
         6dUCNGI4GMdbZm6pNCR3LGW/zWceY0NTYJ15FaCDq7bHIP0n7SsJodxTN2EpIU44COlm
         +QYA==
X-Gm-Message-State: AFqh2kqzeJorb8aEHuwW+Oak33FFcff/YQoVFfykVpr9QtvPJcXQEMy1
	+gxWqlcbzjm3nZC8ozbqIJ2VyESo
X-Google-Smtp-Source: AMrXdXttpP0DT2IqGsMtGmjvuMVvMjIcP4Hjph0TVQJ4WI8ksADQ/CYN3ToIQv9yJZmBdOqPdth7+w==
X-Received: by 2002:a05:600c:1c96:b0:3d9:e9a2:eea3 with SMTP id k22-20020a05600c1c9600b003d9e9a2eea3mr3561515wms.37.1673973370954;
        Tue, 17 Jan 2023 08:36:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id k5-20020a7bc405000000b003db0dbbea53sm904090wmi.30.2023.01.17.08.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:36:10 -0800 (PST)
Message-ID: <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org>
Date: Tue, 17 Jan 2023 17:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oxKcObZjlseV

On 13/1/23 15:04, Fabiano Rosas wrote:
> The cpu_tcg.c file about to be moved into the tcg directory. Move the
> code that is needed for cpus that also work with KVM into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>   2 files changed, 76 insertions(+), 77 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
[...]

TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.

> +static const TypeInfo idau_interface_type_info = {
> +    .name = TYPE_IDAU_INTERFACE,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(IDAUInterfaceClass),
> +};
> +
>   static void arm_cpu_register_types(void)
>   {
> +    type_register_static(&idau_interface_type_info);
>       type_register_static(&arm_cpu_type_info);
>   }
>   
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c

> -static const TypeInfo idau_interface_type_info = {
> -    .name = TYPE_IDAU_INTERFACE,
> -    .parent = TYPE_INTERFACE,
> -    .class_size = sizeof(IDAUInterfaceClass),
> -};
> -
>   static void arm_tcg_cpu_register_types(void)
>   {
>       size_t i;
>   
> -    type_register_static(&idau_interface_type_info);
>       for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>           arm_cpu_register(&arm_tcg_cpus[i]);
>       }
