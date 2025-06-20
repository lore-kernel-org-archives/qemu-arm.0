Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp780914njc;
        Fri, 20 Jun 2025 03:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMcFx5aVqwL+gvSGZrEZiMfCo058zcv2s5z77+oN5pqxgzJdNKfWYMqU4D7FcpYmOP96nkg9uhnohSjw==@linaro.org
X-Google-Smtp-Source: AGHT+IG4uvfiqg3uvPRDOJXPEICi8ev/5WxXxspH/0lgZhVJnnTSmlbMIwiuxLhAQJozRwqC8MIH
X-Received: by 2002:a05:6000:2dc1:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3a6d12ecf48mr1730502f8f.57.1750414394506;
        Fri, 20 Jun 2025 03:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750414394; cv=none;
        d=google.com; s=arc-20240605;
        b=Ut0i8eH/0/TCsU+o7Y5o6Qxbh4UCaYGGBdb7b4T4Ermf0fOMK6G1s3dkXtTdVQ3gMN
         mwyHEBPEK3zzekE2aebPEb4c6XqQuOv3yBehQy4b0X5frNCX4/w0MhtDmyT99kgPmWu+
         Yx6TJCjujFwYuiaL5N37FSz8JO+SvXEaGR3z1sJpncwIPd1k8pUm/X2hmY9LkpcFxZbq
         zzkxrP2m4VtijZfOraAhjaGo9+dOxBwYOepAZJZGWsadPqYhGjvUQWoqLpP7uXFUhGSa
         wHeTBV15iA5XvtxQUyDr/6kUo5FtVfUMlJ7XbSqdu3UA2ZEnAvucZfUsdneFjq/6QeHG
         D0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=tGo6CNm2cp2vf6/LpUXzeycO+BBfEabT/PlpmiBozNI=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=ZW1TfQKFipTXI/kHH3jbE1R7wAJpP4vJ9jcvzPHKpHrooXt3fP2sclJ4SoSIGI26tY
         HCy5x9MwLr72+AwffjzieTau4IHdT6e1rNXRKJyuuRn61cPBw501odG4VpI8GuLM64Bl
         GIcuhSm1UGwaVYiicdNmYEGEdOEhKHiRIc7o27xLNtR/mklcKZuNZDLNYmrCTp5NxsMD
         ym+K191vpKYi5qAiMv+Ed3lfnNSZ3EgD42xffmc9UgJ6ByWGiwSZQ+CfWQimebLdVEBX
         PrcwnXjaPoR3uDdFOfj/Yj1TBGI6PxKMEI2wPuuJ5j1bcmqWidt9QAKtLlqRupJrAqOF
         QqxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d128d18asi1070352f8f.614.2025.06.20.03.13.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtZW59Jlz6M5Wt;
	Fri, 20 Jun 2025 18:12:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AB2661400D7;
	Fri, 20 Jun 2025 18:13:13 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:13:13 +0200
Date: Fri, 20 Jun 2025 11:13:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 23/29] hw/core/sysbus: Introduce
 sysbus_mmio_map_name() helper
Message-ID: <20250620111311.00005da2@huawei.com>
In-Reply-To: <20250616094903.885753-24-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-24-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: y2jYlPNSxuf2

On Mon, 16 Jun 2025 11:46:52 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Some sysbus devices have conditionnal mmio regions. This

Spell check. conditional

> happens for instance with the hw/acpi/ged device. In that case
> it becomes difficult to predict which index a specific MMIO
> region corresponds to when one needs to mmio map the region.
> Introduce a new helper that takes the name of the region instead
> of its index. If the region is not found this returns -1.
> Otherwise it maps the corresponding index and returns this latter.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Nice helper.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  include/hw/sysbus.h |  1 +
>  hw/core/sysbus.c    | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 7dc88aaa27..18fde8a7b4 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -82,6 +82,7 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
>  bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
>  qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
>  void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
> +int sysbus_mmio_map_name(SysBusDevice *dev, const char*name, hwaddr addr);
>  void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                               int priority);
>  
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index e71367adfb..ec69e877a2 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -151,6 +151,17 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
>      sysbus_mmio_map_common(dev, n, addr, false, 0);
>  }
>  
> +int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
> +{
> +    for (int i = 0; i < dev->num_mmio; i++) {
> +        if (!strcmp(dev->mmio[i].memory->name, name)) {
> +            sysbus_mmio_map(dev, i, addr);
> +            return i;
> +        }
> +    }
> +    return -1;
> +}
> +
>  void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                               int priority)
>  {
