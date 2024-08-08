Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp536767njc;
        Thu, 8 Aug 2024 07:44:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcYiRu0CDSKJoIaDdWM6yg6U7m1VaVkicn/9DIcvwx6fn3D3PcGmIlXQJkDI8lqQQMWT/D8m8Gy1lwGQgs9D4oocsEpxwL
X-Google-Smtp-Source: AGHT+IFSw5E4Mrzo2tVIlNCMf3sGt/+f9ZeK36tYDOaV8MU+juUD+rUbiXiF9w9lzKl6x9WHpKuz
X-Received: by 2002:a05:6830:2aac:b0:703:6003:11f4 with SMTP id 46e09a7af769-70b4fc4432dmr2113141a34.14.1723128297463;
        Thu, 08 Aug 2024 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723128297; cv=none;
        d=google.com; s=arc-20160816;
        b=ts60ypg8C14q28J3KbGrEURDtCs2GtxXmjcnlou2OGXhlh+7l5WDCSSGR26VGgtsLo
         FFCj/7w3o3D1R+NQ6WRK/cUdWCAh4XEOZQ0F3ADfNf3PN6jhaFKzXJOkddTuILQRnlky
         W45+u80iF/EAOd6/MmJ8BeSUlpmRm2wtHLrJGsoJndhbdrZOKw8hw8zhrKGe10lUA6V9
         t/KqgLNvB79ocQTgvN5tI4VXCgtKhyXF+eGM4+8OBLwsKiryHhhS2D2welQpbl/HgL2r
         CXpGBoUqKKmsgDRwKFazMqKihg2uxtgw8I2ipMgIj4pyxEXcPum4ASTsDIMW3L77n7o/
         n5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2yHWhOGhXoiaID94xq0Obn8IF6l9bmHYEIpGRlWg4Yk=;
        fh=0JuY6I8kTmbS6TJH4zuYrgDSarVwqEu+6tWZVnpRiD0=;
        b=QDuR8PD6mdInzX+/uZZPugeVJoJP5y4Vb1cWxX5twb7wF4oD49gSEVlsQH5izL14Uo
         +0MJ6VxD8F1qyjhmadrE6W3uOUPIFml6Jt+0JNj9LfsM2premeiITtip8JMMyPfkJvP4
         MDhxaOr/Rz4lshTp10OxEd15Od5oFR0JWBXeQsQ/vIwa7c5tPqfIyybLhmR9c8ldPM2B
         Hh6VSav7NwZrPKsu/S+tRHgziCx3OdkZ7YkfYWlVVrSMqsthsyIfgDL7AOlaviROBWSF
         tDE9Ipl4J9ODKrpjwl5gh7Tuwk0njJilSRtnqzTZpplsp45+LyYqTrPJ/KeiVxYIGsE3
         qD3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjllRycL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb5f7d5asi47008016d6.112.2024.08.08.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZjllRycL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc4NS-0002Pz-MK; Thu, 08 Aug 2024 10:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sc4NM-0002Kp-4j
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 10:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sc4NK-0007nz-Fx
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 10:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723128261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2yHWhOGhXoiaID94xq0Obn8IF6l9bmHYEIpGRlWg4Yk=;
 b=ZjllRycLy/clzm5sIkB3BuG7Ccj4KlFMyNtcRj32QPOlNX1lXyfjYlZr12+Q1MF9dy1i8D
 roMt6BRsnOQaQAfT5oYkLUgiuWM0pMLuYA99mtos7tPsDpskkpIDxZgrCQvFaCMsKGPqwC
 moy/Csu1TlpGXd6SE+ndSqRddq736f0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-XO-2E5kKOaSeAKJEInY09g-1; Thu, 08 Aug 2024 10:44:19 -0400
X-MC-Unique: XO-2E5kKOaSeAKJEInY09g-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-530c299a480so1044237e87.0
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723128258; x=1723733058;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2yHWhOGhXoiaID94xq0Obn8IF6l9bmHYEIpGRlWg4Yk=;
 b=UVhJSML67d/ztvpC0ZzSx1Xtmdung7GL99UdsERF2gJXZp9Sq0zBQzHTrapfVZLC+h
 DIOxOV6dCZ99bwBtfbzWQG75K9lHydukUOK3RS64iWdYZEsJmMaDmk1B59Pg3l2z9ksx
 0yGyxG3Puwu3RUlo490Ytx3Bkl1eL4ab1OdC4H8Inpq3HKjkqjVfeMQ/0Rr2D+dqp8Mb
 qioynbPXGSHxHgY43GX4XgO+iUr8QeX6ZiNgFZGlrvd+IG+PXTV1Gh0+7beWLbhUreXS
 YcKx33NuhEo4yOs3umhtOmCokQ11lalbdyqj2SlndT1M+8RbQ6NwOFxJUvBXMh4xX64u
 M1uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV64jDy2aqPbAVR19x4pTxfrYmVGowaqX5TUXmKVEuRNgxmJ/w/ONSgb6PgCf6fEqgtOrijZ2yC9tLsBsDlZyBjatLm
X-Gm-Message-State: AOJu0YxUho2lfrbi/9wpYdXd92QX3ez6OjOg3ugiYy/jagSNKDbNEcuH
 mNzabhN+ayT+8vr74/MWkTZvxyBT3bnpN2ltvglzcJcRCKB75CVJE9T1oYyqN7u5gWPDeGln7eN
 hrztxqBoKhD4aoOT2KEGHMwVRYZYGK7/J97KFuhLp94T/uUUTB9AkRNnwfw==
X-Received: by 2002:a05:6512:3f2a:b0:52c:deba:7e6e with SMTP id
 2adb3069b0e04-530e583dbd1mr1838865e87.29.1723128257876; 
 Thu, 08 Aug 2024 07:44:17 -0700 (PDT)
X-Received: by 2002:a05:6512:3f2a:b0:52c:deba:7e6e with SMTP id
 2adb3069b0e04-530e583dbd1mr1838822e87.29.1723128256896; 
 Thu, 08 Aug 2024 07:44:16 -0700 (PDT)
Received: from redhat.com ([2.55.34.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e8676fsm742332666b.164.2024.08.08.07.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:44:16 -0700 (PDT)
Date: Thu, 8 Aug 2024 10:43:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] arm/virt: place power button pin number on a define
Message-ID: <20240808104308-mutt-send-email-mst@kernel.org>
References: <ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sMwL1ryup6uP

On Thu, Aug 08, 2024 at 02:54:52PM +0200, Mauro Carvalho Chehab wrote:
> Having magic numbers inside the code is not a good idea, as it
> is error-prone. So, instead, create a macro with the number
> definition.
> 
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA-PYnZ-32MRX+PgvzhnoAV80zBKMYg61j2f=oHaGfwSsg@mail.gmail.com/
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

ack, but note we do things like that only if something
is repeated.

> ---
>  hw/arm/virt-acpi-build.c | 6 +++---
>  hw/arm/virt.c            | 7 ++++---
>  include/hw/arm/virt.h    | 3 +++
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e10cad86dd73..f76fb117adff 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -154,10 +154,10 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(dev, aml_name_decl("_CRS", crs));
>  
>      Aml *aei = aml_resource_template();
> -    /* Pin 3 for power button */
> -    const uint32_t pin_list[1] = {3};
> +
> +    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
>                                   "GPO0", NULL, 0));
>      aml_append(dev, aml_name_decl("_AEI", aei));
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 719e83e6a1e7..687fe0bb8bc9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1004,7 +1004,7 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      if (s->acpi_dev) {
>          acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
>      } else {
> -        /* use gpio Pin 3 for power button event */
> +        /* use gpio Pin for power button event */
>          qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>      }
>  }
> @@ -1013,7 +1013,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                               uint32_t phandle)
>  {
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> -                                        qdev_get_gpio_in(pl061_dev, 3));
> +                                        qdev_get_gpio_in(pl061_dev,
> +                                                         GPIO_PIN_POWER_BUTTON));
>  
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
> @@ -1024,7 +1025,7 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>      qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
>                            KEY_POWER);
>      qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
> -                           "gpios", phandle, 3, 0);
> +                           "gpios", phandle, GPIO_PIN_POWER_BUTTON, 0);
>  }
>  
>  #define SECURE_GPIO_POWEROFF 0
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ab961bb6a9b8..a4d937ed45ac 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -47,6 +47,9 @@
>  /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
>  #define PVTIME_SIZE_PER_CPU 64
>  
> +/* GPIO pins */
> +#define GPIO_PIN_POWER_BUTTON  3
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> -- 
> 2.45.2

