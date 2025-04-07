Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6313063njd;
        Mon, 7 Apr 2025 04:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOmALUb+GDNK5WZHplAx85je4QqnRQ83il5eL8QD1wtOyOOULP2EVuccCvJUQ4PXVtj6sQqV4h1KITBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFEZ/+7pD93t8hXQDXlT76SD2FscK91pa5+2FS8l4qhbrj74PnVJco3m1EXMuK4LX3Lf4Yj
X-Received: by 2002:a05:620a:1721:b0:7c3:c814:5943 with SMTP id af79cd13be357-7c774d277f3mr1838889085a.9.1744027074050;
        Mon, 07 Apr 2025 04:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744027074; cv=none;
        d=google.com; s=arc-20240605;
        b=abZTSiyx6oA+cqy8Rak4N9xFFcwt2yH4COFoIMs2f3JH/uRwJQy5BMcpypjZzTyB64
         bDf1ILbqbZyvOZFZGD5Gs3bUKv0lvoGTxERZg6Rk8STK3osKHFyjeWzven5xlkYqTmgK
         qV+Xrx2MNee5f20dnktHpkWTau4D1I50n4+zd6DxMRzRCt6lXvZRCCFkJ3pVs1E1XuhK
         sUURfLmokL2mRjOJoW1+7RgQAOCrREcLTnCdrNVocBbObSzI01oKw0iSHDHo1OxhwJVt
         woDBLVEjDFTS6dEvazph1ORLP3JS9McPUTPKhtH6ocFdGwEXfBhdN5z1nC5FALwmSN6+
         +0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=QLTqoNvl23SPEqwiQTNp78t1+GL63UOXJlzTp5U/2II=;
        fh=6NHjVXhzGo9v24hwFi52PMt0TKozioC93BZPCxl07Eo=;
        b=K6RojLgzp943lR2L8THSHewqybw52Tkj2x0sB814oZUDO1/FzYezWz62rWvL8d0Xfn
         oBw5BQOzejRtZQZ7d8A/J06rqrDGUYkCi+ntGnJN5IJratAI0MLpE+FEJkw74tCmypzj
         A/QV8P87fT8ynepa033jEW2OSMcC1kfUyJGZbZiZOUW3HQ8THRIOnv8XwdsoRQxeUJK+
         Pkx1YvAeVQit0LIBn+SHQnpp0hW/K3TxQCcwHrmNQuii0Xt0I+ADf3QMhWjq0nlfguo7
         JHX/QhnjKYdBw/SUJaUeq9nXBqi8eJcIyZPwJeG86PxXaKcdPsiS5IfhOVj9rSQUsaN/
         bURg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NSDYP/Os";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c76eac2c0csi860090585a.578.2025.04.07.04.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NSDYP/Os";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027073;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QLTqoNvl23SPEqwiQTNp78t1+GL63UOXJlzTp5U/2II=;
	b=NSDYP/OsL7kF20DB0ElZxCuQ9gcg5jxpBGDpmxJCFAVwPoCJ2InELZjRcyXtCyiO7a0mr3
	cQ3QqU/5w4NOBKqmPio9u1qI8tzW5Swq+iUNeKzXUJzT9pzlMNGpaQsfmwmIJXXZKZno5U
	X+NPHkVlvA2hMiogXl/+X9Z0TJFQL3o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-YCGxdNuoNN68ELi8r350OQ-1; Mon, 07 Apr 2025 07:57:52 -0400
X-MC-Unique: YCGxdNuoNN68ELi8r350OQ-1
X-Mimecast-MFC-AGG-ID: YCGxdNuoNN68ELi8r350OQ_1744027071
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso54031875e9.2
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 04:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027071; x=1744631871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLTqoNvl23SPEqwiQTNp78t1+GL63UOXJlzTp5U/2II=;
        b=rETfJq15C/aoIGPxeIncUxf/8UN1gibWld3xi2WjJSfUBnnJM00W86ZvQk1hUcACLA
         VRHPy/0xuIBDx+BGy/k1fj/+f8Z6KscWTO4RQScuvMockUo5nfFF7O4JwUNO6aukIfss
         yKsP8jE8QR8CqIvoUukUoG7mHl3wAvYe1Or0UzQ+IOoqA36NfX/5TegtD6df+uZiYZv8
         6dAHedKIlzHVWK3L95qPw4Mo/zVADRALG32vyAA71AFdX7Gib3nEKaC9hXTn+w8Di9NJ
         6L9y7++jLBJ+DTyx7hEYHFjcw2xid2BwoAzuiyufNIrDOxEQqliGr/rAVJt1mtwRBKu6
         k6RA==
X-Forwarded-Encrypted: i=1; AJvYcCUvJPjnTeBRkoNrhC2e0nNX+uTiz9u6tALyQfo/KAdPwB8cw/VRcJ70P+1SKSwCBOeLokdTrrRATGOeQQ==@linaro.org
X-Gm-Message-State: AOJu0YxkACPtOodQDo5dojxnCopSRaLKAXqrVJSLoneMsD7HpNLQ1eDv
	Q6jRen+O9maZ66EGZ6UxKQ7lK/GvTUvVcbwhrJjf67oHYmiGrwPwhOZvMkr9UrHLn0gnD/0iBEi
	EFRM+kRtDCPeZVNWhY8a+NIjUXmu4fJhA1yslCS0TslCG6+EKWMPOcA==
X-Gm-Gg: ASbGncubDFTGN4e//m24ONJHChcpw3z9dO6c02tjvn2hZNJutMRuX3DF2xEIPN5d2h4
	I3aGskVAQ5GL8QeMIMhVBJx3xBwQ9I2xydTTY9NrjzsldbmtY5tBHeUWfV3XW4xXIryJ9y0fmeP
	22DW6K2VbDDVVyPBGt1Mq6xFH6hGt141OzaPoPJ/cMAe74MyzU9ubRdJ8z6345/soInNhGDdkjE
	X5t8FGATOD74rQcdwNuzmXLDNiwG2jmAXK2UPNI2NpeZ7sz5HWTmJq1iuHflVjaHaDvfp/Pnjr8
	Mmad6fPdVrYxMcCCmMoZXzoBNP/caYeN+wbqlClCqKdXQhXQQdLzQx5NZYRcAw0=
X-Received: by 2002:a5d:5f81:0:b0:391:456b:6ab7 with SMTP id ffacd0b85a97d-39d0de2d38emr8443508f8f.34.1744027071337;
        Mon, 07 Apr 2025 04:57:51 -0700 (PDT)
X-Received: by 2002:a5d:5f81:0:b0:391:456b:6ab7 with SMTP id ffacd0b85a97d-39d0de2d38emr8443476f8f.34.1744027070887;
        Mon, 07 Apr 2025 04:57:50 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm128003355e9.35.2025.04.07.04.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:57:50 -0700 (PDT)
Message-ID: <b3b8fe3b-1974-4098-8f44-ea197e85b36b@redhat.com>
Date: Mon, 7 Apr 2025 13:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 1/9] hw/arm/virt: Remove pointless
 VirtMachineState::tcg_its field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-2-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250403204029.47958-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6RpuDzYVJzXDsBP8Drl48rFeRK4sl8xwI7wAGOYyQT8_1744027071
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hzNIgkL2pNYt

Hi Philippe,

On 4/3/25 10:40 PM, Philippe Mathieu-Daudé wrote:
> VirtMachineState::tcg_its has the negated logic value of
> VirtMachineClass::no_tcg_its. Directly use the latter,
> removing the former.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/arm/virt.h |  1 -
>  hw/arm/virt.c         | 13 +++++--------
>  2 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c8e94e6aedc..17c160429ea 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -150,7 +150,6 @@ struct VirtMachineState {
>      bool highmem_mmio;
>      bool highmem_redists;
>      bool its;
> -    bool tcg_its;
>      bool virt;
>      bool ras;
>      bool mte;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a96452f17a4..177e9e0eadb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -710,11 +710,12 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>  
>  static void create_its(VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      const char *itsclass = its_class_name();
>      DeviceState *dev;
>  
>      if (!strcmp(itsclass, "arm-gicv3-its")) {
> -        if (!vms->tcg_its) {
> +        if (vmc->no_tcg_its) {
>              itsclass = NULL;
>          }
>      }
> @@ -831,7 +832,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>                              redist_region_count);
>  
>          if (!kvm_irqchip_in_kernel()) {
> -            if (vms->tcg_its) {
> +            VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +
> +            if (!vmc->no_tcg_its) {
>                  object_property_set_link(OBJECT(vms->gic), "sysmem",
>                                           OBJECT(mem), &error_fatal);
>                  qdev_prop_set_bit(vms->gic, "has-lpi", true);
> @@ -3357,12 +3360,6 @@ static void virt_instance_init(Object *obj)
>      } else {
>          /* Default allows ITS instantiation */
>          vms->its = true;
> -
> -        if (vmc->no_tcg_its) {
> -            vms->tcg_its = false;
> -        } else {
> -            vms->tcg_its = true;
> -        }
>      }
>  
>      /* Default disallows iommu instantiation */
