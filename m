Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp838992wrp;
        Wed, 11 Sep 2019 06:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxo76tUHvNGVuRIJ/P36VJ5qukPnNxrE1f/kMW/zb23G6ILyYB1v6tO9/uLzsNbDrf0w2ow
X-Received: by 2002:aed:3c52:: with SMTP id u18mr34452231qte.194.1568207241345;
        Wed, 11 Sep 2019 06:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568207241; cv=none;
        d=google.com; s=arc-20160816;
        b=QG9BTn1CnlGWUKYvdwXgSYnVDZX7bTo0bIJZal8GH+kYWgGR2z+MD3j3rC0RaBtaEp
         0vgme1Y9ZNqFwZTEyLLtHwh/Cm5JXOJNo0nfljwUpQGi2IdafgG74i2rZjh0CQ5bOSc2
         3Gaiu5cPH7yYQhWXVJVWnYiH+m1O5rC+EfT8q860YH72pEEBpZdFvVK4+WC6IFqSo0Q5
         3lf3rGY5bd9EzoCM5UXsAuzJsbsSyH5fVsCkIBt20HGT25uLE+RPobc9prv/kQk58iyA
         ILjg6goK4/TBPCobOYokisSccSm+aObtfbnvj8M++Qgh8FMo6t3ZKD3E3l6TGnrQLI2M
         kinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=L/aoA2iwFwbnJZn3Jbh5vaVZa1LzjgE9tzxEwK2nxzI=;
        b=O3QV1PYg/eBbdasHdpNSGa8Hji2wnlretGMDbRQ68BWpUPcVr8qFJUJ4yrxHInJdYr
         Y5R4vO6BSC15CI3wi0P3uikAttUhqpOgn1fnIklaRe6VJ4sX7H7gwBu6l1GKd+9yVDJi
         w4fcLqOjkc8HrJYUL9vHDBsGH7BlXnHr3xZqbZFvloQrXUVTSqwJjvYEt1qRWYSUNxz2
         k5DVE7kHjV5n/WNxXln/a+WeBIOlrlcwtumlsMoc12n4zH0elMZ0xbTeupQl7O6RYkMB
         9vvRav2FnB4ZRJUTFpM2nXhOvIRx/Tp/U1plX/AzSjkqKn3S4Qu4FUmA5O+ERdkLOpSm
         wvOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si15064305qti.118.2019.09.11.06.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82LA-0002WO-NO
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i82Kz-0002Vz-Vv
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i82Kx-0008Nr-P1
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:07:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i82Kx-0008NZ-Jc; Wed, 11 Sep 2019 09:07:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9445F3082E03;
 Wed, 11 Sep 2019 13:07:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E74AD10018F8;
 Wed, 11 Sep 2019 13:07:01 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:07:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190911150700.7a917d14@redhat.com>
In-Reply-To: <20190904085629.13872-6-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 11 Sep 2019 13:07:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 05/11] hw/arm/virt: Enable device
 memory cold/hot plug with ACPI boot
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4/PIg2teuD8A

On Wed, 4 Sep 2019 09:56:23 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

[...]
> @@ -730,6 +733,19 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                        vms->highmem, vms->highmem_ecam);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> +    if (vms->acpi_dev) {
> +        build_ged_aml(scope, "\\_SB."GED_DEVICE,
> +                      HOTPLUG_HANDLER(vms->acpi_dev),
> +                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
> +                      memmap[VIRT_ACPI_GED].base);
> +    }
> +
> +    if (vms->acpi_dev && ms->ram_slots) {
> +        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
> +                                 AML_SYSTEM_MEMORY,
> +                                 memmap[VIRT_PCDIMM_ACPI].base);
> +    }
one more thing (though non critical), if ms->ram_slots == 0 ^^^^
makes IASL spew a warning

    External (_SB_.MHPC.MSCN, MethodObj)    // Warning: Unknown method, guessing 0 arguments

In general non-existing references within methods are fine if they aren't ever used.
however we can be a little bit less sloppy.
Below you advertise "event = ACPI_GED_MEM_HOTPLUG_EVT", and then here suddenly
don't generate essential AML part for it here.

For consistency if above is conditioned on ms->ram_slots != 0, probably
it would be better to move that condition where you set 'event' value and
check property value above instead of ms->ram_slots

[...]
> +static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
> +{
> +    DeviceState *dev;
> +    int irq = vms->irqmap[VIRT_ACPI_GED];
> +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> +
> +    dev = qdev_create(NULL, TYPE_ACPI_GED);
> +    qdev_prop_set_uint32(dev, "ged-event", event);
> +    qdev_init_nofail(dev);
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> +
> +    return dev;
> +}
> +
[...]
