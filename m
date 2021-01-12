Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3649959lfq;
        Tue, 12 Jan 2021 07:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhO3sWEL9J3yinaUWlfRVwyLQEjNRztwvhtbGpH6w7SCzy69/yfvXpUeP4CGuE5DH/flQV
X-Received: by 2002:a25:26c7:: with SMTP id m190mr7214889ybm.464.1610465768602;
        Tue, 12 Jan 2021 07:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610465768; cv=none;
        d=google.com; s=arc-20160816;
        b=YEub9jnxsHzjjEPJche40YRYVOcFs5D/jzlKcss2YF6EwGMKFqjXT3eG70/aRKzY7A
         WurgrSjxhsySaYTBwGjcObWYUAy3fUGVUL6sWC26ZuMMK2OQBvJA/+TKQGgndUi/3ATB
         YtOlOqBpvCerqrpdiniq+OV5RNejxHhNQMYnwH2khVqpii25FCMd9ivM63b5V5oxwSDY
         WBeIWdUYh19PjZYGz4kkA2zX452wGyOTnGKmCPZVp+JaYm1w/QqJ0FQeveVsu8CEo8YP
         ZObRM3IT004b0KfxnMP7b79LrTtXGvAYTH1CECkFOzpQ0gDB7FK8gsc97hTDzeyDeH+X
         T7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=shRKZOsGBDKnF5+mPp6qoYOYQbusDRRVbTBRQ6QZmeA=;
        b=c+CCJ7eGSB8YTgJd2Jpq3vh2bXh8QgvL7HDqQhjDYD0a2asguCFEqAIYVwqAYTLy4M
         Wo58CKeAL0xIbcRwpizftzTO30NdgNoyOcjn0ON6mOI3SDqQ6uXlb42zSvHgHgoe8NII
         0EKGtQG01PexFlKn+Ln9hTy+Lba00JlJaV2PBb8XifZncXsPslDQ5bgJt8lESAat3IuH
         Blxz6VQP0l1dx08EWocKg2/GM3xsqN98cAxMWs24t2y8A6PW2XvDTBriObPezL95kGbm
         G7HkEr7za04s5IW+fYY9Tg/rQS1u72oYW0eyggv1VB4cIs6frxQV9fvfeyPQgv3Ccbf+
         9nXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CIo+02JG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b206si2950017yba.224.2021.01.12.07.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 07:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CIo+02JG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzLiJ-0002Qh-Ug
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 10:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzLi7-0002Ox-HN
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 10:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzLi3-0001pI-Ui
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 10:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610465750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=shRKZOsGBDKnF5+mPp6qoYOYQbusDRRVbTBRQ6QZmeA=;
 b=CIo+02JG7XXHk4cxxIGtf8o5x2kxb/OJHemITt8Jadg6ggxnDiIQeGraqriHpSzjFCFEGS
 IBv7zc6bEiPr9aTX3OusXAZYpgxKLRl9IAnAbvPq/z1tnTBXRWu1VNesjyYF+EXXeXx4v8
 a0jc4K11lcm25Z5DP0ULjaHTZPrjUM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-d3jkmsInPWaTYCenk9e2qQ-1; Tue, 12 Jan 2021 10:35:47 -0500
X-MC-Unique: d3jkmsInPWaTYCenk9e2qQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461EC1012EA9;
 Tue, 12 Jan 2021 15:35:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-115-10.rdu2.redhat.com
 [10.10.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D81275C257;
 Tue, 12 Jan 2021 15:35:44 +0000 (UTC)
Date: Tue, 12 Jan 2021 10:35:42 -0500
From: Andrew Jones <drjones@redhat.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210112143058.12159-3-maxim.uvarov@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, Jose.Marinho@arm.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, tf-a@lists.trustedfirmware.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JpjS37QX+YCA

On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  3 +++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0a242e4c5d..13cc42dcc8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM_VIRT
>      select PL011 # UART
>      select PL031 # RTC
>      select PL061 # GPIO
> +    select GPIO_PWR
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 96985917d3..19605390c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -147,6 +147,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> +    [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },

Does secure world require 4K pages?

>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
>      [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
> @@ -864,6 +865,32 @@ static void create_gpio(const VirtMachineState *vms)
>      g_free(nodename);
>  }
>  
> +#define ATF_GPIO_POWEROFF 3
> +#define ATF_GPIO_REBOOT   4
> +
> +static void create_gpio_secure(const VirtMachineState *vms, MemoryRegion *mem)
> +{
> +    DeviceState *gpio_pwr_dev;
> +    SysBusDevice *s;
> +    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
> +    DeviceState *pl061_dev;
> +
> +    /* Secure pl061 */
> +    pl061_dev = qdev_new("pl061");
> +    s = SYS_BUS_DEVICE(pl061_dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
> +
> +    /* gpio-pwr */
> +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> +
> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));

I don't know anything about secure world, but it seems odd that we don't
need to add anything to the DTB.

> +}
> +
>  static void create_virtio_devices(const VirtMachineState *vms)
>  {
>      int i;
> @@ -1993,6 +2020,10 @@ static void machvirt_init(MachineState *machine)
>          create_gpio(vms);
>      }
>  
> +    if (vms->secure && vms->secure_gpio) {
> +        create_gpio_secure(vms, secure_sysmem);
> +    }
> +
>       /* connect powerdown request */
>       vms->powerdown_notifier.notify = virt_powerdown_req;
>       qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> @@ -2567,6 +2598,12 @@ static void virt_instance_init(Object *obj)
>          vms->its = true;
>      }
>  
> +    if (vmc->no_secure_gpio) {
> +        vms->secure_gpio = false;
> +    }  else {
> +        vms->secure_gpio = true;
> +    }

nit: vms->secure_gpio = !vmc->no_secure_gpio

But do we even need vms->secure_gpio? Why not just do

 if (vms->secure && !vmc->no_secure_gpio) {
     create_gpio_secure(vms, secure_sysmem);
 }

in machvirt_init() ?

> +
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> @@ -2608,8 +2645,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
>  
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_6_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    vmc->no_secure_gpio = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 2)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index abf54fab49..a140e75444 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -81,6 +81,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_SECURE_GPIO,
>      VIRT_PCDIMM_ACPI,
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
> @@ -127,6 +128,7 @@ struct VirtMachineClass {
>      bool kvm_no_adjvtime;
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
> +    bool no_secure_gpio;
>  };
>  
>  struct VirtMachineState {
> @@ -136,6 +138,7 @@ struct VirtMachineState {
>      FWCfgState *fw_cfg;
>      PFlashCFI01 *flash[2];
>      bool secure;
> +    bool secure_gpio;
>      bool highmem;
>      bool highmem_ecam;
>      bool its;
> -- 
> 2.17.1
> 
>

Thanks,
drew 

