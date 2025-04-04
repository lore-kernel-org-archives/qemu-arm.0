Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4522751njd;
        Thu, 3 Apr 2025 19:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWC+Jysv6k/oFgNud+X0bO/dRM10T42NWkG1B7KQ9Jk7PcycW3bu0gBC9YLvOAqHP0lssEwwxM5k8FViA==@linaro.org
X-Received: by 2002:a17:903:1b25:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22a8a0545f9mr20383015ad.13.1743735564833;
        Thu, 03 Apr 2025 19:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743735564; cv=none;
        d=google.com; s=arc-20240605;
        b=L3j+nIf02mCfXYgky1J46ceVgdHunqwz7AwFgaXzbeKZRooYM0sZV7Zxoy4RWOaK9c
         4i1N0Hu9WAD7e3cXYup98NEn944w4Irp8dj31WwTb0GVEbfWB8K7kpOiQ44aC7gfOveD
         qMV9t4b92Qhzd0vckwY2UX0oxCBmr20YW8jgCelp+8L0SadzmtBD6whh3j0Er9Hlk4AO
         lGdOv6MnoQMtzhxIhi6tddX61Jc4WQjsxaxcGAUpoDAuZncr5gjafu5lhJiPHuBbeMQ9
         4Vfj5bmyAXBkNZ5ssFk9GtzHR09Ba+PhgMRyM4bTGf5vkLqL5aPWLL3Jd/mPMYKvsOJr
         PO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bLHvGf1XUIrZw3XRDc6LzIxH5fIrITA+KPazkM5+IDk=;
        fh=Vyc0tg+5OxCoNrQKfEs1lMPHZsdIajqLLBhxJs1G/GY=;
        b=H1Bb0JHC0RPEx+dYCtnF0PEP/o2SNeM5DVsEqGp6RNyKaLIUIbbrRSJfBMcVrc114h
         lSlpGrxwQUq6xi4tM4VRyGAbuC/pEv9gchWlUz+P+A19N4mXxkExggipzxqtFDR08jKa
         rmMYmFiOn+TrrDkwKmtKm4+CVKzlvosoCGrN/3ZWrAkIy5GV/8hUSVk0Z0NqJ7cB8FeC
         WiWX2iEdv4Tg3JjAJ4oxgo2w2Dl0QisdWO5N82zqHLS4pygEl20MJ1yvjkivv4IbWWXA
         woweyXboHhnlGTGyvFNKV+KC8wogEQbZo7ghThdtSeLugN7bAoXl2YnS9dXanK5SeNaT
         Vukw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NTME5/58";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739da0c107esor2356028b3a.9.2025.04.03.19.59.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 19:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NTME5/58";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743735564; x=1744340364; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLHvGf1XUIrZw3XRDc6LzIxH5fIrITA+KPazkM5+IDk=;
        b=NTME5/588MboWhVgAN/7AfgG/PJMtC3ruiQMppjqHbhFdMfamPOmc1xPuuwn+aWu4S
         D+tWFWOBgQ9oovyYQ/1EVlp6sEKF2ggUDMA2GsoUmQjgqg4znu7vGOS9QhLhEnW8GjKo
         KDSyU8Z/3TJ74lK0OE8NGvHD+I7m8KTvaYRxbAHvPs96JYbpbGrF0WgZEVVHIsH6QU+M
         NFrZ9As3dqOnwnid1//uynUUS3TO2YPolFw9MYjIIVXBMZ04SO9kFL7s1EGOfGiUtZKp
         CJv0fAxT3xyj4dmI/MRQM3qZIv8xOHjFUfbjYrB8l79Y2EahXNdGImz4hWEbfEsFVyRJ
         NZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735564; x=1744340364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLHvGf1XUIrZw3XRDc6LzIxH5fIrITA+KPazkM5+IDk=;
        b=xL/Bpb0eFoeazVV/s7mMBeAgeNQTbtctwmL6FY0KW3BNuVYucyN10PuxqFkd3De/UD
         2AgtPOop8UKI4HTqc8a3hQRNzMw+4xaNAA7sYFupq5/ygEieOxlZAeg3Ob6I8uFlWZR2
         PcaBNU6mpWCZ0n9DX8N0r81XfOppjuVT+v5oEmu5mJDrTztcaVv8464xEvaRNOVOWn0J
         s0UaBKmM4R0IVNU4E1tRrPJxLuPZrVD8K2lRQELUuvg7zP7ESCKlqY6E8nMQn5r0TVa6
         KPF3RfAupQW0FlzBjozfokhRzFx7O0J5PNQdNJqhZ35hpEFWqaZSWT3IavzlD6cnqu3s
         CifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEUaoMAxJjtRCC5iuYEZV08v2WnuHC1BvrYJllyZVwzTG5Fo5canlLYDbjFkSTAZ0XOBlFRT0yplXZZw==@linaro.org
X-Gm-Message-State: AOJu0YyuPhNWRVz/FB1ekT0Oa5N2iLqLY4Ro23T9FgVAG10KaKkXzqDI
	mnujEJxC0k07S6mZ61GBEwt/DUxENIuBiVnEA6POEJwxAnT7/aMoSr+cb78esuJD/w==
X-Gm-Gg: ASbGncv/Rl7mZw1TKJnga2TzlXN4KthUKgb+39nsA7Xt+G7vgDNP8wNYkDelRQYt8zZ
	pCR32naL2uvcUOr+Y70K4JRb1w3BjNCt9MjG9BpIoerRo0HyEh5iYeKPy8cdMQxYaZLGprFq+mN
	sKvi66WVaw+MO2c9F3A5G4W47jVxXpvYBYZ/cf3b4WopKpIL6GTRgWyPPuW9ZhSukwhbxBjjrlt
	apHDdgrDzidWf7C/Udygt6Lrd/7IXVRwCLH33kJhp+F9fWlKL+7o4thVPxsretDjbYq2864poIL
	1Yrvw8gLzRBwsuxpBI7X/R2XlCqKIXdzZ89zxjhFE9M6lkblz9zuJq+S
X-Google-Smtp-Source: AGHT+IFSPUB87dTHHip0stD/lox9B3tKLa1omxTgmSPKHMffkSU0ztRCJhCVq4LkCLyH72opL8imIg==
X-Received: by 2002:a05:6a00:2186:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-739e48cefd7mr2621989b3a.3.1743735564197;
        Thu, 03 Apr 2025 19:59:24 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.49.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f36b0sm2350996b3a.68.2025.04.03.19.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 19:59:23 -0700 (PDT)
Message-ID: <ca2a87c6-10a3-49fc-9a57-a108f28168ba@linaro.org>
Date: Thu, 3 Apr 2025 23:59:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 3/9] hw/arm/virt: Simplify create_its()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-4-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250403204029.47958-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: z61NxTqNX52G

Hi Phil,

On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
> No need to strstr() check the class name when we can
> use kvm_irqchip_in_kernel().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/virt.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 177e9e0eadb..326986deb16 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -711,21 +711,15 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>   static void create_its(VirtMachineState *vms)
>   {
>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> -    const char *itsclass = its_class_name();
>       DeviceState *dev;
>   
> -    if (!strcmp(itsclass, "arm-gicv3-its")) {
> -        if (vmc->no_tcg_its) {
> -            itsclass = NULL;
> -        }
> -    }
> -
> -    if (!itsclass) {
> +    assert(!vmc->no_its);
> +    if (!kvm_irqchip_in_kernel() && vmc->no_tcg_its) {
>           /* Do nothing if not supported */
>           return;
>       }
>   
> -    dev = qdev_new(itsclass);
> +    dev = qdev_new(its_class_name());
>   
>       object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
>                                &error_abort);

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
