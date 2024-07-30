Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2231016njb;
        Tue, 30 Jul 2024 01:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnecrtKiFalebAtElc034UGD4AzLkIRN2FynxeecM3v1hdkyi7UmIDSWKrr7Dq4B/sVEzRADOGpgS35VDxfhMI4I55J05u
X-Google-Smtp-Source: AGHT+IFo/MrGjKTYz025YdYEd/Lh6nI6zZ7UhoptceL0jqFAFtKRcnAaDMTqurf0lZaO2kHqrGwG
X-Received: by 2002:a05:6102:c8d:b0:493:bf96:99b5 with SMTP id ada2fe7eead31-493faceefbcmr9282454137.20.1722328601631;
        Tue, 30 Jul 2024 01:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722328601; cv=none;
        d=google.com; s=arc-20160816;
        b=TzWtGeUwf8yMZr+zZaKcg/UuDXGJihvc82Z/dKMd9lEpuu4lpJJZmYmtUNRwjod8Ma
         riJc339dB7FxqXRbfKmKwaYpuai6t9tHOJEZl1sHg8J6d9Daqy5wlv03Zj6C36SAExUm
         APna0N63XnQkcnXshqD6J6ZGFuo9/LXfEnQioPRyPXxNMfbEOVq3YebjEuJ00P+WbaAq
         x3V0W4DpocjKuBh8yqo5lz4AqHJGNphmAKNWNWw7somFVWlmXoY6LnL+9waC2yrTKPRR
         jV1nsPOzbB31yZWqbuBHCBE3Zrh729z0UDgfvfNWpNil+N685Fy/jj9d1Li2pKEmMKl2
         1hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=jZvxrDQmClMXIYrFtS427ByaFNgahNTrWr4i/x1An7w=;
        fh=Z9CMYFJ3Mmxkkop1PHOcxErYPee3QLQ5fNEff4CGNME=;
        b=XdZYUI+fdKRuGmXkjqN9ii+digXpNd0Ji7v1TXKKsU+819bE7TbxjrWClbONENSXJ0
         p3vC+2mC7TtpT5SkFC4k53ZruePSsrKiU5jOefwbNiiAcr7xA7MySOpeFwafpZNnIkbJ
         6YGdMkiygdAlYE8AKgErPpCNsVv9Ugheh+tECfCnz8FXXbIsS8l4GIMtC+ckLpABRddA
         kP3KP2DMBilZULQdYLjjKofhIRN+pw8WGTWjtdS4pJZ86XS/f5jur6CuX+ZBKcGvlXB5
         FX7cw3f0dH5APOIIO7OHx6ZzfmADZQBcCHK/Y4NF/uVFtAY+fdWIvvKWkTrbU7UzKVPQ
         Wpyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCwvXYI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7470bd1si1244867985a.612.2024.07.30.01.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCwvXYI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYiLM-0007cH-6j; Tue, 30 Jul 2024 04:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYiLL-0007Zp-MJ
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYiLJ-0005ai-6K
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722328583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZvxrDQmClMXIYrFtS427ByaFNgahNTrWr4i/x1An7w=;
 b=FCwvXYI738oaROtq4AxIQcjcBGpGdJtMpjWXWm1vubV6WHkCTgASyMRiFJbrnkqpDd3+ms
 e5p7Pj4GV8P3d+oRtdy7QJu+kdmQsX9BoWbts8iPkFE59GKkkMUv5F8fbI0cq85bqvWxAL
 kUxKoF0oGvHoTTY6tzzmGYGe7Dchs7g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-CAIdd2yONqym4qV3tqMlRA-1; Tue, 30 Jul 2024 04:36:19 -0400
X-MC-Unique: CAIdd2yONqym4qV3tqMlRA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3687eca5980so1910737f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 01:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328578; x=1722933378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZvxrDQmClMXIYrFtS427ByaFNgahNTrWr4i/x1An7w=;
 b=P8dNmO7Kx8ldlC6HaVx329v8PtJqH93iqxpQRxW+7IAtU7AXrNTJdbH+8ohVLPWecE
 Qq+mut51LD4jF1j9nU8mkRx1syMwSMoFB1QotwiPFJHPN0L5ywBaG1pm0+JVtmDRfz87
 aH9PakZgMU4CqpWPDIal+KQi6ki4dirs3fL1M8YVFTVcL12IJh5QbcGM7qaUgAPAnHTu
 n133NEagljHDQ6cReiBH88OhuY9myPRNyEoPBehYMZV/2c9iCrv9KDkNscWHywlTlZnY
 NtKtsFCW4ww5LuKCeoLhtXzUtjGImu35w03jJoSnzRsuYaLO6YoE9RAHddQLZjP77/DQ
 fC+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHLSeU1JYTdI8H5oAUPJVrFHgvmxAvUpr6w7EF0IQHN7Zt3rWFHnXU0yolZJX2ngE266jkCh6/yfd40QlMUQIScxpE
X-Gm-Message-State: AOJu0YyUOqv3he+88EVMHDTTABqkBR/PAr9hy3uMhVrgahaw5W/D6gZ2
 mW3ZrzLbNZv6QL2BAm19Tn6WyIJaUOvRHWbQxX78WpaFMflWgkcYN64HmDw3mv+EGbcubjBUD42
 e+8ieelk2HIZ4UHqR6hzqNiyFwDi6igC2Fcr7z4z6HxTjwbX4WQ==
X-Received: by 2002:adf:e707:0:b0:367:9088:fecc with SMTP id
 ffacd0b85a97d-36b5d0b04a6mr7637666f8f.7.1722328578270; 
 Tue, 30 Jul 2024 01:36:18 -0700 (PDT)
X-Received: by 2002:adf:e707:0:b0:367:9088:fecc with SMTP id
 ffacd0b85a97d-36b5d0b04a6mr7637636f8f.7.1722328577802; 
 Tue, 30 Jul 2024 01:36:17 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36861b11sm14072497f8f.96.2024.07.30.01.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:36:17 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:36:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v3 2/7] arm/virt: Wire up GPIO error source for ACPI / GHES
Message-ID: <20240730103615.5bb7613a@imammedo.users.ipa.redhat.com>
In-Reply-To: <034a7e86761e09996001394c98ffb8201ac52cd2.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
 <034a7e86761e09996001394c98ffb8201ac52cd2.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: bBFSt55Y7Klt

On Mon, 22 Jul 2024 08:45:54 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Creates a GED - Generic Event Device and set a GPIO to
> be used or error injection.

QEMU already has GED device, so question is why it wasn't
used for event delivery?
I nutshell, I'd really prefer this series being rewritten
to reuse exiting GED instead of adding ad hoc GPIO and ACPI
plumbing.

PS:
as side effect of that, error injection could be used no only for
ARM but other machines that use GED (providing they implement GHES) 

Also CCing Shameer wrt touched power button code

> [mchehab: use a define for the generic event pin number and do some cleanups]
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 30 ++++++++++++++++++++++++++----
>  hw/arm/virt.c            | 14 ++++++++++++--
>  include/hw/arm/virt.h    |  1 +
>  include/hw/boards.h      |  1 +
>  4 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f76fb117adff..c502ccf40909 100644
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
> @@ -142,6 +143,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>  static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>                                             uint32_t gpio_irq)

this function supposed to be called when acpi_dev is not present (exiting GED device)
and run on old machines only, so it should not be called for recent machine types.
I'd avoid adding anything to it.

see more comment about it below

>  {
> +    uint32_t pin;
> +
>      Aml *dev = aml_device("GPO0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> @@ -155,7 +158,12 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>  
>      Aml *aei = aml_resource_template();
>  
> -    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
> +    pin = GPIO_PIN_POWER_BUTTON;
> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
> +                                 "GPO0", NULL, 0));
> +    /* Pin for generic error */
> +    pin = GPIO_PIN_GENERIC_ERROR;
>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
>                                   AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
>                                   "GPO0", NULL, 0));
> @@ -166,6 +174,11 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
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
> @@ -800,6 +813,15 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>      build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
>  }
>  
> +static void acpi_dsdt_add_generic_event_device(Aml *scope)
> +{
> +    Aml *dev = aml_device(ACPI_GENERIC_EVENT_DEVICE);
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
this is not _event_ device, it's referred as _error_ device in spec.

PS:
please properly document new ACPI primitives/devices,
see comment above aml_notify() for example.
Use earliest APIC spec where the device was defined for the 1st time.

> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> +    aml_append(scope, dev);
> +}
> +
>  /* DSDT */
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -841,10 +863,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                        HOTPLUG_HANDLER(vms->acpi_dev),
>                        irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
>                        memmap[VIRT_ACPI_GED].base);
> -    } else {
> -        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> -                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      }
> +    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
> +                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));

wouldn't that create double/conflicting power button handlers
(GPIO and GED one), on recent machine types GED should be used
and power button in acpi_dsdt_add_gpio() is used only if
machine doesn't have GED.

>  
>      if (vms->acpi_dev) {
>          uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
> @@ -858,6 +879,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_generic_event_device(scope);
>  #ifdef CONFIG_TPM
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c99c8b1713c6..f81cf3a69961 100644
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
> @@ -1015,6 +1022,9 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
>                                          qdev_get_gpio_in(pl061_dev,
>                                                           GPIO_PIN_POWER_BUTTON));
> +    gpio_error_dev = sysbus_create_simple("gpio-key", -1,
> +                                          qdev_get_gpio_in(pl061_dev,
> +                                                           GPIO_PIN_GENERIC_ERROR));
>  
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
> @@ -2385,9 +2395,8 @@ static void machvirt_init(MachineState *machine)
>  
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> -    } else {
> -        create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
> +    create_gpio_devices(vms, VIRT_GPIO, sysmem);

again, this create duplicate/conflicting power button source

>  
>      if (vms->secure && !vmc->no_secure_gpio) {
>          create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
> @@ -3101,6 +3110,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_id = "mach-virt.ram";
>      mc->default_nic = "virtio-net-pci";
>  
> +    mc->set_error = virt_set_error;
>      object_class_property_add(oc, "acpi", "OnOffAuto",
>          virt_get_acpi, virt_set_acpi,
>          NULL, NULL);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index a4d937ed45ac..c9769d7d4d7f 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -49,6 +49,7 @@
>  
>  /* GPIO pins */
>  #define GPIO_PIN_POWER_BUTTON  3
> +#define GPIO_PIN_GENERIC_ERROR 6
>  
>  enum {
>      VIRT_FLASH,
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

