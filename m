Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp119101nji;
        Thu, 11 Jul 2024 04:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe/UG3t9jANxcmKlSBfC2OPD3NQfZL3CR0nZaGyWwMtmgFKWTNlm2zSuVb5343GseIRI9fxxkhnn4EIgNIQs6YbXlKQ5Zr
X-Google-Smtp-Source: AGHT+IEFVxMN6Mlou9Y6I5Wmc3Ornt+57rTajvduxfgmwhhKc+VH6k95tOo1IwtxEDg6W1A0tfjo
X-Received: by 2002:a05:6214:21eb:b0:6b5:e0a3:eb62 with SMTP id 6a1803df08f44-6b61c1f9a30mr78903736d6.60.1720698910877;
        Thu, 11 Jul 2024 04:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720698910; cv=none;
        d=google.com; s=arc-20160816;
        b=P+ERIUk2ftcvo1ND9NlTBxLgIB5st49UVFBzH5d/D1Va6GeLvhf1wKCAJRXGW/FE93
         nIp6pMGB5YNgJ5CBdg5MLcg6Hsdrr9kXcd+afg2W+sZXS+AbUaUCE5TT0Qa7vLx1bHL7
         P4hEL4obYv+zrGrFbsng0rr2G3zSxj4LuYRgdfmBVmX5gFxwbZJvyQHSs4hxnYyt3nQp
         Q5UrIPjueELRh2F7ScWZSmNgRlwS8eCtOGYtXg63Hbg0cvplfMnpyMKD/KeDJo93n3Dj
         Vphwi5Y/NoPc1m6g5VJzqabdvJKdWOM7jtRkZ6yviT0PYJdYrt0yVmhWLsC9PTet91XE
         Nyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=GLUrFLCqikNAsPcbf03qUnXoJ46gCuQE0XBBtbkOSEc=;
        fh=iDuZN5mp0DYB/+JdbtTW7IX771qYo4j0DbtORtUoPQU=;
        b=wQig4dj4+dRARA81zpqXPEFtC2zrg5zk4y+3KrAMo3q3ceSAlrcP8pWvUGO5/BmutZ
         Y6bqYJ470dMDSUTGYIOlGqsnYmDqiHyCcVwoLFi+qb2gkWd6Lh0Aeon9gG1kuw1aP8VM
         kv8OqHs9lpZS+iJ0fuVlmI9WXMTZuzsVUXUwgb0HnjIk/pSuyhkkiVIru7IS3zqkO9H2
         BnWtlTDo3T5xNOld9eBLGhuuhothDvyquyKEg1jT7kRsIghB7FqJGhmDBtvc0VNPsmmS
         E8PIyjliS7qDu4L7pSM20p3Mv2S3jX8x2WP6nbNx3PQEg01SMgvoNACzm+AifkmFitKu
         CojA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JDrBWO0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bb0095fsi71539696d6.580.2024.07.11.04.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 04:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JDrBWO0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRsO8-0006AY-2r; Thu, 11 Jul 2024 07:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sRsO6-00065m-QD
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 07:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sRsO3-0003k3-Sj
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 07:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720698898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GLUrFLCqikNAsPcbf03qUnXoJ46gCuQE0XBBtbkOSEc=;
 b=JDrBWO0QFFhiJpC6lC0td8McrkpL1dz6KoNk5XDyBLdcLN615hcD+3q/nFtrGv6t5pHrG2
 CM8RSNgNiiOm67wbK2FQs0VesDF2H8facNZajSEpfBUvauFl0XIQjG0PmrB+veNuMlaCdB
 ztZuGFe1SeKusPkmO/aFkzma5glYNUw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-jSa8-IUIM5qLRIrIr3cMxQ-1; Thu, 11 Jul 2024 07:54:55 -0400
X-MC-Unique: jSa8-IUIM5qLRIrIr3cMxQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ee9308bc8cso6964191fa.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 04:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720698893; x=1721303693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLUrFLCqikNAsPcbf03qUnXoJ46gCuQE0XBBtbkOSEc=;
 b=htELGii7jRztjJyarYRdWf8Aes3TPleSKxBoOJ6s7hbTgt4KgAO+gEzr8J1RaBr9r8
 1NVV2odiJvz+hR6d9kDKSw/T+pnLCOxkGdyW/O0gkuusImU/Sudd7BG36d3kYwVUiKHk
 HUhLM8xTAH3o00yD5GhTCsyk4gqsY5gz7JwVBGSVLuonOP5Cvuipj9u4GKy808NOjoFG
 9hJBsygdKmHoJDVoH4CcN+BXjyVy0Vg8YcTrft4zkQ2BxQMINZXPBjkLiDK65JPrLwdI
 YGCEKAfqgD1qjB/4RbbFy8GwVfHbe4YEiI3JhlGVMnzAMxgxj5l//HlTB+BsogHvKto+
 juSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+1bf387uxa2AsRWcVrnS5u6Ne9ABnuWlAq5KARaHSn3ps5kBKP9T5TL2u0OAMCKBkW8O8zOzYjbBeUywv41h7AcwG
X-Gm-Message-State: AOJu0YypFQeHItL7UUvyJU/U4cCOfKvcvnkovcOtiqY6VqoNoleo6z5r
 H9ukglQhHcYOYrZFwneXKWHja3yaKsTU/ZORyXDmyhwvgyDrVelMLmMxbF4RecESqPHhGzX/DR3
 QjFdWmdyLpO5md6jMKhVvn8xJSU4Ia+MIRvE0PagjgItMpMH7aQ==
X-Received: by 2002:a2e:90cc:0:b0:2ee:7a7e:8ebb with SMTP id
 38308e7fff4ca-2eeb3198b20mr51410551fa.52.1720698893669; 
 Thu, 11 Jul 2024 04:54:53 -0700 (PDT)
X-Received: by 2002:a2e:90cc:0:b0:2ee:7a7e:8ebb with SMTP id
 38308e7fff4ca-2eeb3198b20mr51410401fa.52.1720698892904; 
 Thu, 11 Jul 2024 04:54:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279accecf4sm17799785e9.39.2024.07.11.04.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:54:52 -0700 (PDT)
Date: Thu, 11 Jul 2024 07:54:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, linux-edac@kernel.org,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/6] arm/virt: Wire up GPIO error source for ACPI / GHES
Message-ID: <20240711075332-mutt-send-email-mst@kernel.org>
References: <cover.1720690278.git.mchehab+huawei@kernel.org>
 <b9cd4a65d3389102def662a8bc09ffaa622265f7.1720690278.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b9cd4a65d3389102def662a8bc09ffaa622265f7.1720690278.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: b4ZIzo9SNUgk

On Thu, Jul 11, 2024 at 11:52:03AM +0200, Mauro Carvalho Chehab wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Creates a GED - Generic Event Device and set a GPIO to
> be used or error injection.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
>  hw/arm/virt.c            | 12 +++++++++++-
>  include/hw/boards.h      |  1 +
>  3 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e10cad86dd73..b6f2e55014a2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -63,6 +63,7 @@
>  
>  #define ARM_SPI_BASE 32
>  
> +#define ACPI_GENERIC_EVENT_DEVICE "GEDD"
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
> @@ -155,9 +156,14 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>  
>      Aml *aei = aml_resource_template();
>      /* Pin 3 for power button */
> -    const uint32_t pin_list[1] = {3};
> +    uint32_t pin = 3;
>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
> +                                 "GPO0", NULL, 0));
> +    pin = 6;
> +    /* Pin 8 for generic error */

For real? Code says 6, comment says 8.

Comments must come before the code they comment, not after it,
then this kind of thing won't happen.


> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
>                                   "GPO0", NULL, 0));
>      aml_append(dev, aml_name_decl("_AEI", aei));
>  
> @@ -166,6 +172,11 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>                                    aml_int(0x80)));
>      aml_append(dev, method);
> +    method = aml_method("_E06", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_notify(aml_name(ACPI_GENERIC_EVENT_DEVICE),
> +                                  aml_int(0x80)));
> +    aml_append(dev, method);
> +
>      aml_append(scope, dev);
>  }
>  
> @@ -800,6 +811,15 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>      build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
>  }
>  
> +static void acpi_dsdt_add_generic_event_device(Aml *scope)
> +{
> +    Aml *dev = aml_device(ACPI_GENERIC_EVENT_DEVICE);
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> +    aml_append(scope, dev);
> +}
> +
>  /* DSDT */
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -842,9 +862,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                        irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
>                        memmap[VIRT_ACPI_GED].base);
>      } else {
> -        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> -                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      }
> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>  
>      if (vms->acpi_dev) {
>          uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
> @@ -858,6 +878,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_generic_event_device(scope);
>  #ifdef CONFIG_TPM
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0c68d66a345..874a8612ef2d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -997,6 +997,13 @@ static void create_rtc(const VirtMachineState *vms)
>  }
>  
>  static DeviceState *gpio_key_dev;
> +
> +static DeviceState *gpio_error_dev;
> +static void virt_set_error(void)
> +{
> +    qemu_set_irq(qdev_get_gpio_in(gpio_error_dev, 0), 1);
> +}
> +
>  static void virt_powerdown_req(Notifier *n, void *opaque)
>  {
>      VirtMachineState *s = container_of(n, VirtMachineState, powerdown_notifier);
> @@ -1014,6 +1021,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>  {
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
>                                          qdev_get_gpio_in(pl061_dev, 3));
> +    gpio_error_dev = sysbus_create_simple("gpio-key", -1,
> +                                          qdev_get_gpio_in(pl061_dev, 6));
>  
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
> @@ -2385,8 +2394,8 @@ static void machvirt_init(MachineState *machine)
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
>      } else {
> -        create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
> +    create_gpio_devices(vms, VIRT_GPIO, sysmem);
>  
>      if (vms->secure && !vmc->no_secure_gpio) {
>          create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
> @@ -3100,6 +3109,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_id = "mach-virt.ram";
>      mc->default_nic = "virtio-net-pci";
>  
> +    mc->set_error = virt_set_error;
>      object_class_property_add(oc, "acpi", "OnOffAuto",
>          virt_get_acpi, virt_set_acpi,
>          NULL, NULL);
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index ef6f18f2c1a7..6cf01f3934ae 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -304,6 +304,7 @@ struct MachineClass {
>      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
>      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
>      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
> +    void (*set_error)(void);
>  };
>  
>  /**
> -- 
> 2.45.2

