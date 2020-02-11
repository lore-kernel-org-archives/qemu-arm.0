Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4825372lfp;
        Tue, 11 Feb 2020 00:25:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxE2FHExTB8A2mvlSbnUVM+PoPomce4wIf6LiufbypD/Su1uhKPJ7mKvIL60vt+ZUXvV/7c
X-Received: by 2002:a05:6214:28b:: with SMTP id l11mr1901549qvv.15.1581409522544;
        Tue, 11 Feb 2020 00:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581409522; cv=none;
        d=google.com; s=arc-20160816;
        b=Jkx5C5vTaDXNNRNV3aDcQESAImcFhM+kInrjxY/WRD8UzYft9xkitFlDFB0HDGwoq4
         oDJ8Q9DwplrhVuzxzzzMUd0w1Ggu70MeUvDrL27eVlYTOIPgFRxKr8yL3DQPPo/yco4i
         I103mD7Oj7nYFLF6rdRsgdbe+2GKZgr1Bi79MwbrV6CaXvPEF2/tFyaXdcML9MNW8+T6
         5ecDXQ6je4ymNRhWRg/10m2xkuii2aVg3hGRNihlTG6HKeidm3iYFGSdrhM4HH699xpR
         oUxcy5QHr8A1OOHu7doG3c8tQrCqf5u/6XFtxm0j/ueN/ezqPrtzt2F8mEM9ZX6TQDly
         GiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ytI3yd4D1otRPJZTQqqVtGkMqVXwOgxULV2gcfdJ1R4=;
        b=b4odXClEBM8OtzcZnqfNKZMA1rRSNvWN6Vk5WswlWrTleiLp6F4UsGNyx6wVT3xtHN
         ++NnGGq5EjmmLeCWMDbs3hB1N5uhnKB2b4BjMouPYOE4TvSWJ20gTYTS34LFRNrKZOqB
         UblcUhoaS72NFxLNxVePx6ENEWO9EtO2QT+M6WHKZoyLRI5Mz4A5Yg3xNVI2WgkPkrEY
         xlm/DRAc9AtguT0R4WxLP+XhdB3KTtKzMgi+vT6L+DwchnKHP/uHmdVal2wiQ6cK1hSN
         Y6guIERCCBwDKdQjT1gIRb+iK5L0q8sVHOLbt893/zPAgBI/jOrRCsoZToivDg+2/LUY
         xBLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YcXhRm5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r190si1619177qkc.6.2020.02.11.00.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 00:25:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YcXhRm5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1QrC-00056e-0J
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 03:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1Qqy-00054K-B7
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:25:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1Qqw-0002ua-E9
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:25:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55062
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1Qqw-0002sd-9c
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581409505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytI3yd4D1otRPJZTQqqVtGkMqVXwOgxULV2gcfdJ1R4=;
 b=YcXhRm5d4zxK22P4b1vOMrYSGYIi3DnoRJSDNo85+2Yzj/BGRs+jdKxJK+Bcez8i0zAU6V
 LT2c9N0HTXOTd8TV0jc7Xrlzj4TyNyY650g/4+EcbzWEQEbBb3Wq1yov4tAsoC7rSvcc0G
 urZAvCK1T3AbRQHTv0L8KeRvYrZKDIY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-L9wD3xM4N3WtE4j8e0B3NA-1; Tue, 11 Feb 2020 03:25:04 -0500
Received: by mail-wm1-f71.google.com with SMTP id z7so748451wmi.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 00:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ytI3yd4D1otRPJZTQqqVtGkMqVXwOgxULV2gcfdJ1R4=;
 b=IJrrrouN9Sut5xafK7+0DmCdSDL5n4weIXaAcojg2twQ4xnZMHjcB33kw25qXI9gV1
 4ewrp2ucrVa+EJkr41yh+UxQ2Jjq+ihzIsnzbJAltC0gBYSveiMS70bZCTFYCN7opFgz
 4nZ0n+2EwS9XsCRxe7Cr1tmXvLluS/iMJGiqGA3tfDeA/hUuFvHGYmEr9vX5y3NPnrUf
 cfzCaPTEIwHqueGuhd8pLCNeDRJP6ubzfeae4L7sL55fZTQmguB508E2GLITpv9HKI3C
 I91Odlof1Jbg1c6dQaMEOAVb10Mem6Bqmyq5yzt3zUzNjLiBU6BhEPu2fESXnXfoDsnM
 m/Kg==
X-Gm-Message-State: APjAAAV0YBVZf81sW4EwHGyFOl4c30/dkIC9IfBGvPdO0w8LOb6zmMRp
 /8fpTxr6xXsS/SJk3z/vUJBvAXWzjuB6j1gbO168hdZ02akTJm0GVF/YyjJGspa9/+HZ56+VcH2
 SQsv5kLKoJSRa
X-Received: by 2002:adf:f504:: with SMTP id q4mr6897635wro.28.1581409502785;
 Tue, 11 Feb 2020 00:25:02 -0800 (PST)
X-Received: by 2002:adf:f504:: with SMTP id q4mr6897610wro.28.1581409502502;
 Tue, 11 Feb 2020 00:25:02 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g15sm4341097wro.65.2020.02.11.00.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 00:25:01 -0800 (PST)
Subject: Re: [RFC 1/2] tpm: Let the TPM TIS device be usable on ARM
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20200210131523.27540-1-eric.auger@redhat.com>
 <20200210131523.27540-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5cbd1960-6138-f4d0-948f-1983cb0f93b0@redhat.com>
Date: Tue, 11 Feb 2020 09:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210131523.27540-2-eric.auger@redhat.com>
Content-Language: en-US
X-MC-Unique: L9wD3xM4N3WtE4j8e0B3NA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hJuzXWKZ8o6k

On 2/10/20 2:15 PM, Eric Auger wrote:
> Implement support for TPM on aarch64 by using the
> TPM TIS MMIO frontend. Instead of being an ISA device,
> the TPM TIS device becomes a sysbus device on ARM. It is
> bound to be dynamically instantiated.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> I am aware such kind of #ifde'fy is frown upon but this is just
> for starting the discussion

I doubt this can be accepted upstream, because a target has to choose 
between using sysbus OR isa devices, not both.

> ---
>   hw/tpm/Kconfig   |  2 +-
>   hw/tpm/tpm_tis.c | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> index 9e67d990e8..326c89e6df 100644
> --- a/hw/tpm/Kconfig
> +++ b/hw/tpm/Kconfig
> @@ -4,7 +4,7 @@ config TPMDEV
>   
>   config TPM_TIS
>       bool
> -    depends on TPM && ISA_BUS
> +    depends on TPM
>       select TPMDEV
>   
>   config TPM_CRB
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index 31facb896d..cfc840942f 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -30,6 +30,7 @@
>   
>   #include "hw/acpi/tpm.h"
>   #include "hw/pci/pci_ids.h"
> +#include "hw/sysbus.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "sysemu/tpm_backend.h"
> @@ -65,7 +66,11 @@ typedef struct TPMLocality {
>   } TPMLocality;
>   
>   typedef struct TPMState {
> +#ifdef CONFIG_ISA_BUS
>       ISADevice busdev;
> +#else
> +    SysBusDevice busdev;
> +#endif
>       MemoryRegion mmio;
>   
>       unsigned char buffer[TPM_TIS_BUFFER_MAX];
> @@ -967,6 +972,7 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>           error_setg(errp, "'tpmdev' property is required");
>           return;
>       }
> +#ifdef CONFIG_ISA_BUS
>       if (s->irq_num > 15) {
>           error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
>                      s->irq_num);
> @@ -982,6 +988,7 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>           tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
>                        TPM_PPI_ADDR_BASE, OBJECT(s));
>       }
> +#endif
>   }
>   
>   static void tpm_tis_initfn(Object *obj)
> @@ -991,6 +998,10 @@ static void tpm_tis_initfn(Object *obj)
>       memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
>                             s, "tpm-tis-mmio",
>                             TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
> +#ifndef CONFIG_ISA_BUS
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +#endif
>   }
>   
>   static void tpm_tis_class_init(ObjectClass *klass, void *data)
> @@ -1002,6 +1013,7 @@ static void tpm_tis_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, tpm_tis_properties);
>       dc->reset = tpm_tis_reset;
>       dc->vmsd  = &vmstate_tpm_tis;

With your #ifde'fy in mind, you probably need to restrict this to sysbus:

   #ifndef CONFIG_ISA_BUS

> +    dc->user_creatable = true;

   #endif

>       tc->model = TPM_MODEL_TPM_TIS;
>       tc->get_version = tpm_tis_get_tpm_version;
>       tc->request_completed = tpm_tis_request_completed;
> @@ -1009,7 +1021,11 @@ static void tpm_tis_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo tpm_tis_info = {
>       .name = TYPE_TPM_TIS,
> +#ifdef CONFIG_ISA_BUS
>       .parent = TYPE_ISA_DEVICE,
> +#else
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +#endif
>       .instance_size = sizeof(TPMState),
>       .instance_init = tpm_tis_initfn,
>       .class_init  = tpm_tis_class_init,
> 

 From the sysbus device PoV the patch looks OK.

You don't need much to remove the RFC tag:

- rename TYPE_TPM_TIS as TYPE_TPM_TIS_ISA
- rename TPMState as TPMCommonState, add an abstract TYPE_TPM_TIS 
parent, let TYPE_TPM_TIS_ISA be a child
- add TYPE_TPM_TIS_SYSBUS also child.

