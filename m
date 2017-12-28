Received: by 10.223.134.117 with SMTP id 50csp5615600wrw;
        Thu, 28 Dec 2017 06:53:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCb8oCQOHQRPhb7jmNLfYQTL3Ft/otk+LHZsSqestXxpSXCYRxiK4fgnC9Uy/Q/qULKXFV
X-Received: by 10.99.131.72 with SMTP id h69mr28204960pge.22.1514472806699;
        Thu, 28 Dec 2017 06:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514472806; cv=none;
        d=google.com; s=arc-20160816;
        b=ta6Z08b9aUGEkc3UlaKp5yKHom6I3g+e4onweOVUUWKZlQafaLNRxht6ygIlSuf16n
         cC+sOx2IcGrhbSBFMM8khL7MVzFcQOHhpkWfxIeKei1nNOPPOwm2BLAsOUHGc+hZm261
         Xd3Gab9ufjtco0E9oAArcYMeIxsx2Qq75Edzx6pgx/+M4AsrXe0KT6ZptKSiwFsAFdqH
         88HWWrX8CNxTnyXJVTk7YdBZpNIa8yQ5yZLphXJyCRIW6o21tRPZxDzPiEUfDfsaQGwX
         QH15xH4ZZMQ9OWFKI+PSmo0qfpVdbWR/2d+7UJr80pQpa5UKDku9Rf0MvOQwKDu1mNnw
         eFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=p1XsQkTsAQUphNimfdUyFMfXKqyLiXREItU8S5F63JU=;
        b=njmg/qFv4/0Lk/vPa6g4yThDv97Lnytkw6RshhLb0VHRJI4HWqpwr5N0ZD3pVcA/UW
         jqXXGGKw4/Rtb2q8fK5jpPou73dX5l78Fvyee6WB5oRIO7cAcfgYRP0DX0Zz7g6ZxaaC
         LAQ8l7OWRDnl0AosuR4LUvz6GFUQILMV145XaFrGFOOmgt0IRUnWDoizsCIYlVNlVNZm
         JqccNdTmiuH7Bk0x0RKWE+mZfmF4ZJXOX0AtTCSz24h5wkKBZW9G9QUZu3y5xNqw9J3I
         +IZz7juhwSKedGa6M4eVjradmDlaohkRFQhHpxwsDZk0tYZTfUR9rQLImh+Xhhf9i2Ga
         vkVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b3si26558194plb.293.2017.12.28.06.53.26;
        Thu, 28 Dec 2017 06:53:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753354AbdL1OxY (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 09:53:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55314 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753131AbdL1OxX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 09:53:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 150455AFD9;
        Thu, 28 Dec 2017 14:53:23 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2B2AA5D6A5;
        Thu, 28 Dec 2017 14:53:14 +0000 (UTC)
Date:   Thu, 28 Dec 2017 15:53:10 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 7/9] ARM: ACPI: Add GPIO notification type for
 hardware RAS error
Message-ID: <20171228155310.312e95bb@igors-macbook-pro.local>
In-Reply-To: <1514440458-10515-8-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
        <1514440458-10515-8-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 28 Dec 2017 14:53:23 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cmxqjSCaEk/X

On Thu, 28 Dec 2017 13:54:16 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> In ARM platform we implements a notification of error events
> via a GPIO pin. For this GPIO-signaled events, we choose GPIO
> pin 4 for hardware error device (PNP0C33), So _E04 should be
> added to ACPI DSDT table. When GPIO-pin 4 signaled a events,
> the guest ACPI driver will receive this notification and
> handing the error.
> 
> In order to better trigger the GPIO IRQ, we defined a notifier
> hardware_error_notifiers. If Qemu wants to deliver a GPIO-Signal
> notification, will call it.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> 1. Address discussion result about guest APEI notification type for SIGBUS_MCEERR_AO SIGBUS in [1],
>    the discussion conclusion is using GPIO-Signal
> 
> [1]:
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03397.html
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03467.html
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03601.html
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03775.html
> 
> 2. The ASL dump for the GPIO and hardware error device
> 
> ................
> Device (GPO0)
> {
>     Name (_AEI, ResourceTemplate ()  // _AEI: ACPI Event Interrupts
>     {
>         .............
>         GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
>             "GPO0", 0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x0004
>             }
>     })
>     Method (_E04, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
>     {
>         Notify (ERRD, 0x80) // Status Change
>     }
> }
> Device (ERRD)
> {
>     Name (_HID, EisaId ("PNP0C33") /* Error Device */)  // _HID: Hardware ID
>     Name (_UID, Zero)  // _UID: Unique ID
>     Method (_STA, 0, NotSerialized)  // _STA: Status
>     {
>         Return (0x0F)
>     }
> }
> 
> 3. Below is the guest log when Qemu notifies guest using GPIO-signal after record a CPER
> [  504.164899] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 7
> [  504.166970] {1}[Hardware Error]: event severity: recoverable
> [  504.251650] {1}[Hardware Error]:  Error 0, type: recoverable
> [  504.252974] {1}[Hardware Error]:   section_type: memory error
> [  504.254380] {1}[Hardware Error]:   physical_address: 0x00000000000003ec
> [  504.255879] {1}[Hardware Error]:   error_type: 3, multi-bit ECC
> ---
>  hw/arm/virt-acpi-build.c | 31 ++++++++++++++++++++++++++++++-
>  hw/arm/virt.c            | 18 ++++++++++++++++++
>  include/sysemu/sysemu.h  |  3 +++
>  vl.c                     | 12 ++++++++++++
>  4 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b7d45cd..06c14b3 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -49,6 +49,7 @@
>  
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> +#define ACPI_HARDWARE_ERROR_DEVICE "ERRD"
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
> @@ -340,7 +341,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>  
>      Aml *aei = aml_resource_template();
>      /* Pin 3 for power button */
> -    const uint32_t pin_list[1] = {3};
> +    uint32_t pin_list[1] = {3};
> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
> +                                 "GPO0", NULL, 0));
> +
> +    /* Pin 4 for hardware error device */
> +    pin_list[0] = 4;
>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
>                                   AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
>                                   "GPO0", NULL, 0));
> @@ -351,6 +358,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>                                    aml_int(0x80)));
>      aml_append(dev, method);
> +
> +    /* _E04 is handle for hardware error */
> +    method = aml_method("_E04", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_notify(aml_name(ACPI_HARDWARE_ERROR_DEVICE),
> +                                  aml_int(0x80)));
aml_int(0x80) /* ACPI ... : Notification For Generic Error Sources */

> +    aml_append(dev, method);
> +
>      aml_append(scope, dev);
>  }
>  
> @@ -363,6 +377,20 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_error_device(Aml *scope)
> +{
> +    Aml *dev = aml_device(ACPI_HARDWARE_ERROR_DEVICE);
> +    Aml *method;
> +
> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C33")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0x0f)));
no need for dummy _STA method, device is assumed to be present if there is no _STA 

> +    aml_append(dev, method);
> +    aml_append(scope, dev);
> +}
> +
>  /* RSDP */
>  static GArray *
>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> @@ -716,6 +744,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_error_device(scope);
>  
>      aml_append(dsdt, scope);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6b7a0fe..68495c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -701,16 +701,27 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
>  }
>  
>  static DeviceState *gpio_key_dev;
> +static DeviceState *gpio_err_dev;
>  static void virt_powerdown_req(Notifier *n, void *opaque)
>  {
>      /* use gpio Pin 3 for power button event */
>      qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>  }
>  
> +static void virt_error_notify_req(Notifier *n, void *opaque)
> +{
> +    /* use gpio Pin 4 for hardware error event */
> +    qemu_set_irq(qdev_get_gpio_in(gpio_err_dev, 0), 1);
> +}
> +
>  static Notifier virt_system_powerdown_notifier = {
>      .notify = virt_powerdown_req
>  };
>  
> +static Notifier virt_hardware_error_notifier = {
> +    .notify = virt_error_notify_req
> +};
> +
>  static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>  {
>      char *nodename;
> @@ -739,6 +750,10 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>  
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
>                                          qdev_get_gpio_in(pl061_dev, 3));
> +
> +    gpio_err_dev = sysbus_create_simple("gpio-key", -1,
> +                                        qdev_get_gpio_in(pl061_dev, 4));
> +
>      qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
>      qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
> @@ -755,6 +770,9 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>      /* connect powerdown request */
>      qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
>  
> +    /* connect hardware error notify request */
> +    qemu_register_hardware_error_notifier(&virt_hardware_error_notifier);
> +
>      g_free(nodename);
>  }
>  
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index b213696..86931cf 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -75,6 +75,7 @@ void qemu_register_wakeup_notifier(Notifier *notifier);
>  void qemu_system_shutdown_request(ShutdownCause reason);
>  void qemu_system_powerdown_request(void);
>  void qemu_register_powerdown_notifier(Notifier *notifier);
> +void qemu_register_hardware_error_notifier(Notifier *notifier);
>  void qemu_system_debug_request(void);
>  void qemu_system_vmstop_request(RunState reason);
>  void qemu_system_vmstop_request_prepare(void);
> @@ -93,6 +94,8 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify);
>  
>  void qemu_announce_self(void);
>  
> +void qemu_hardware_error_notify(void);
> +
>  extern int autostart;
>  
>  typedef enum {
> diff --git a/vl.c b/vl.c
> index d632693..3552f7d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1614,6 +1614,8 @@ static int suspend_requested;
>  static WakeupReason wakeup_reason;
>  static NotifierList powerdown_notifiers =
>      NOTIFIER_LIST_INITIALIZER(powerdown_notifiers);
> +static NotifierList hardware_error_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(hardware_error_notifiers);
>  static NotifierList suspend_notifiers =
>      NOTIFIER_LIST_INITIALIZER(suspend_notifiers);
>  static NotifierList wakeup_notifiers =
> @@ -1850,12 +1852,22 @@ void qemu_register_powerdown_notifier(Notifier *notifier)
>      notifier_list_add(&powerdown_notifiers, notifier);
>  }
>  
> +void qemu_register_hardware_error_notifier(Notifier *notifier)
> +{
> +    notifier_list_add(&hardware_error_notifiers, notifier);
> +}
> +
>  void qemu_system_debug_request(void)
>  {
>      debug_requested = 1;
>      qemu_notify_event();
>  }
>  
> +void qemu_hardware_error_notify(void)
> +{
> +    notifier_list_notify(&hardware_error_notifiers, NULL);
> +}

I'd prefer if you'd replace all this Notifier code with a machine callback
and call it when needed.

>  static bool main_loop_should_exit(void)
>  {
>      RunState r;
