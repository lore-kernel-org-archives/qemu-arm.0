Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp842812wrp;
        Wed, 11 Sep 2019 06:10:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwR/1zId7nGt8orS2n/YQ9SfA/cQ8bg+p62EGJ8K/q8ReQrNFiUdQwQlc3ZC2Q6zLN632zU
X-Received: by 2002:a17:906:e2c4:: with SMTP id gr4mr29011250ejb.25.1568207416796;
        Wed, 11 Sep 2019 06:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568207416; cv=none;
        d=google.com; s=arc-20160816;
        b=AXqe2h0lvfCBVaxQboFVEhQ/JtUte4XZkXkn7amafJNlfpPjVZJwMILFeRt4XZlcwj
         g9+05be4Va+Exs2S5N7XKwrUUEEc1icm50KhIlqIkBuAg+UO5GecVl8yRO+E7Qbt/m9x
         SK0eTfDO6Z/w+h7xO7inE3M3NUYuNUQBgQU3aJIXRDmhi9TGQHLa/eSAEv5J/5/T45md
         RV8TfgxyRRZAW4aVAwpDXqmesfwzuC5YMih8YYOsA3C0njyOyxhe5uqLoIDZ6LKjJ+oL
         owUE74oYQYGCrcoWb/bxgBdbWsIJpx4xqc/IHaSB7sSCMS4HhK3USyamHUU+OVBHjO3A
         lYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=l+tcdlRC1bq3jDzQlIEBdxRMcPzY3kKSbpSjp/pZa6s=;
        b=DGQF8uvCalMHNzka229zVjCriT+0pMaFoGQJDQKdEgm+LGO+CWMzXeTL1Yz01qBitK
         ribLVvqT3ZXZOd6O6X9AmujEWJwFo7TE3qWPSlblQgFkrw6NmuKtexYUW+8k02k1swG2
         REINWftsYbvyD5MwZdKnqoOsxL7y1F5MPjxnk1fHirlED1GRDBc7+hY/iBLDxstFLcOk
         UZCTjYSoGPAdziBuCJtTI3F53Wu9OPC1uiNwoCzEhlK2aGIrqjqc3DpZY0wWJKOQE1Fu
         zwN27qftdVUBjexl5n3Nt4rgndCBdIrWpHv7QSv4AqhiIE4HvO4CZtzY2DYUHUxl4phg
         iXWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si5427194edf.283.2019.09.11.06.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82Nz-0005jo-SB
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i82Ml-0004JO-9P
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i82Mk-0000kX-5o
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:08:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i82Mk-0000kO-0Z; Wed, 11 Sep 2019 09:08:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 187502A09B0;
 Wed, 11 Sep 2019 13:08:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D58860852;
 Wed, 11 Sep 2019 13:08:52 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:08:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190911150851.7635b9de@redhat.com>
In-Reply-To: <20190904085629.13872-8-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-8-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 11 Sep 2019 13:08:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 07/11] hw/arm: Factor out
 powerdown notifier from GPIO
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
X-TUID: ll/9A2XwIcAz

On Wed, 4 Sep 2019 09:56:25 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This is in preparation of using GED device for
> system_powerdown event. Make the powerdown notifier
> registration independent of create_gpio() fn.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c         | 12 ++++--------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 95accc28f1..89ee37d7de 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -791,10 +791,6 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>  }
>  
> -static Notifier virt_system_powerdown_notifier = {
> -    .notify = virt_powerdown_req
> -};
> -
>  static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>  {
>      char *nodename;
> @@ -835,10 +831,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>                            KEY_POWER);
>      qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
>                             "gpios", phandle, 3, 0);
> -
> -    /* connect powerdown request */
> -    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
> -
>      g_free(nodename);
>  }
>  
> @@ -1730,6 +1722,10 @@ static void machvirt_init(MachineState *machine)
>          vms->acpi_dev = create_acpi_ged(vms, pic);
>      }
>  
> +     /* connect powerdown request */
> +     vms->powerdown_notifier.notify = virt_powerdown_req;
> +     qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> +
>      /* Create mmio transports, so the user can create virtio backends
>       * (which will be automatically plugged in to the transports). If
>       * no backend is created the transport will just sit harmlessly idle.
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 577ee49b4b..0b41083e9d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -137,6 +137,7 @@ typedef struct {
>      int psci_conduit;
>      hwaddr highest_gpa;
>      DeviceState *acpi_dev;
> +    Notifier powerdown_notifier;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

