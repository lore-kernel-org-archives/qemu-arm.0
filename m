Received: by 10.223.134.117 with SMTP id 50csp11501652wrw;
        Tue, 2 Jan 2018 19:48:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBose5uv/ZpvAuDAz8PJ+krug9BGIMKJETmPYglQbibNMwez+a37Jft26w9WCCe0ZN1DJFQR1
X-Received: by 10.84.136.131 with SMTP id 3mr196989pll.430.1514951326976;
        Tue, 02 Jan 2018 19:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514951326; cv=none;
        d=google.com; s=arc-20160816;
        b=k/pKo/hOsP3UxvbpW6dwZfy5s/OawxuEWHTqH2oMZw+WZ/RBsLvKSRB3jN3EazzN2D
         7CqFgPB/0kL2o8cJEdPlyjkZl7Hu3+bYkO4jXxIoPhQbjy+VTTaJDW6NZRwa3CDuSL8U
         6+zt3PQiwAV3FOsV/09NaG8W47cthYDv7UTchOL49NKs2edP8eULAnVJw1gNIk15uGWp
         OIq9lP7uTH9sfhaucNbf7z+TuxGN/gzd93wNxY8fXasarwVFSV9lFP47gMmspl/t3rZh
         s0EgUx/CMNYliZPpxoVlgG24UjX2h0265nNhemb9H+T16zgbi5yJhcPShMKMnRE/v8cQ
         kCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=Ps25XDS+DzejWnoEnx+9RmcO0c2Totf8lYBI+lNOZew=;
        b=KzqCa1y9LEkUflw1P0Xdmuyaa7L/1azIcOIAInwGlV+p+p99MNFF3e5+SavW0dQhJ+
         ljEn2ZrOsLtKruSQUbxDqXSn552naMFhDLrN/Fow1UGZWa8JWn87xt5iach5vxPw4seP
         JuLX9IHOx7LDhApdC2lR1nGGHZ4U2wJJj17GUqgRyzwZOG1JFx5ofkGaoxKPMG3K+kO/
         O/fcsmaF9pmP1NETVtFioNn8Xm/SU2ro2YnHP+ILAKltXCP3VcAJRacMJeTBJdIXDlb/
         NWp0xCusvTZe3NCfW8wW3Zyn038ytzT+n+WiJAguxlyR3zK9TMZXOlWLhbVjVEIyQ6OZ
         cg/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u5si102034pgp.237.2018.01.02.19.48.46;
        Tue, 02 Jan 2018 19:48:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751403AbeACDso (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 2 Jan 2018 22:48:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:34881 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751001AbeACDsn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 Jan 2018 22:48:43 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2700852FFE873;
        Wed,  3 Jan 2018 11:48:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.361.1; Wed, 3 Jan 2018
 11:48:33 +0800
Subject: Re: [PATCH v14 7/9] ARM: ACPI: Add GPIO notification type for
 hardware RAS error
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-8-git-send-email-gengdongjiu@huawei.com>
 <20171228155310.312e95bb@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <fc9e6c01-3334-f79c-5416-499177234044@huawei.com>
Date:   Wed, 3 Jan 2018 11:48:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228155310.312e95bb@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: uhtvZ6CKie2q

On 2017/12/28 22:53, Igor Mammedov wrote:
> On Thu, 28 Dec 2017 13:54:16 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
>> In ARM platform we implements a notification of error events
>> via a GPIO pin. For this GPIO-signaled events, we choose GPIO
>> pin 4 for hardware error device (PNP0C33), So _E04 should be
>> added to ACPI DSDT table. When GPIO-pin 4 signaled a events,
>> the guest ACPI driver will receive this notification and
>> handing the error.
>>
>> In order to better trigger the GPIO IRQ, we defined a notifier
>> hardware_error_notifiers. If Qemu wants to deliver a GPIO-Signal
>> notification, will call it.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> 1. Address discussion result about guest APEI notification type for SIGBUS_MCEERR_AO SIGBUS in [1],
>>    the discussion conclusion is using GPIO-Signal
>>
>> [1]:
>> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03397.html
>> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03467.html
>> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03601.html
>> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03775.html
>>
>> 2. The ASL dump for the GPIO and hardware error device
>>
>> ................
>> Device (GPO0)
>> {
>>     Name (_AEI, ResourceTemplate ()  // _AEI: ACPI Event Interrupts
>>     {
>>         .............
>>         GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
>>             "GPO0", 0x00, ResourceConsumer, ,
>>             )
>>             {   // Pin list
>>                 0x0004
>>             }
>>     })
>>     Method (_E04, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
>>     {
>>         Notify (ERRD, 0x80) // Status Change
>>     }
>> }
>> Device (ERRD)
>> {
>>     Name (_HID, EisaId ("PNP0C33") /* Error Device */)  // _HID: Hardware ID
>>     Name (_UID, Zero)  // _UID: Unique ID
>>     Method (_STA, 0, NotSerialized)  // _STA: Status
>>     {
>>         Return (0x0F)
>>     }
>> }
>>
>> 3. Below is the guest log when Qemu notifies guest using GPIO-signal after record a CPER
>> [  504.164899] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 7
>> [  504.166970] {1}[Hardware Error]: event severity: recoverable
>> [  504.251650] {1}[Hardware Error]:  Error 0, type: recoverable
>> [  504.252974] {1}[Hardware Error]:   section_type: memory error
>> [  504.254380] {1}[Hardware Error]:   physical_address: 0x00000000000003ec
>> [  504.255879] {1}[Hardware Error]:   error_type: 3, multi-bit ECC
>> ---
>>  hw/arm/virt-acpi-build.c | 31 ++++++++++++++++++++++++++++++-
>>  hw/arm/virt.c            | 18 ++++++++++++++++++
>>  include/sysemu/sysemu.h  |  3 +++
>>  vl.c                     | 12 ++++++++++++
>>  4 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index b7d45cd..06c14b3 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -49,6 +49,7 @@
>>  
>>  #define ARM_SPI_BASE 32
>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>> +#define ACPI_HARDWARE_ERROR_DEVICE "ERRD"
>>  
>>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>>  {
>> @@ -340,7 +341,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>>  
>>      Aml *aei = aml_resource_template();
>>      /* Pin 3 for power button */
>> -    const uint32_t pin_list[1] = {3};
>> +    uint32_t pin_list[1] = {3};
>> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
>> +                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
>> +                                 "GPO0", NULL, 0));
>> +
>> +    /* Pin 4 for hardware error device */
>> +    pin_list[0] = 4;
>>      aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
>>                                   AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
>>                                   "GPO0", NULL, 0));
>> @@ -351,6 +358,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>>      aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>>                                    aml_int(0x80)));
>>      aml_append(dev, method);
>> +
>> +    /* _E04 is handle for hardware error */
>> +    method = aml_method("_E04", 0, AML_NOTSERIALIZED);
>> +    aml_append(method, aml_notify(aml_name(ACPI_HARDWARE_ERROR_DEVICE),
>> +                                  aml_int(0x80)));
> aml_int(0x80) /* ACPI ... : Notification For Generic Error Sources */
sure. thanks

> 
>> +    aml_append(dev, method);
>> +
>>      aml_append(scope, dev);
>>  }
>>  
>> @@ -363,6 +377,20 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>>      aml_append(scope, dev);
>>  }
>>  
>> +static void acpi_dsdt_add_error_device(Aml *scope)
>> +{
>> +    Aml *dev = aml_device(ACPI_HARDWARE_ERROR_DEVICE);
>> +    Aml *method;
>> +
>> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C33")));
>> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>> +
>> +    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
>> +    aml_append(method, aml_return(aml_int(0x0f)));
> no need for dummy _STA method, device is assumed to be present if there is no _STA 
Igor,
  do you mean remove above two line code as shown in [1]?
I dump the DSDT table in my host Ubuntu PC for the error device (PNP0C33), it has the _STA, as shown in [2].
do we not want to add the _STA for guest?

[1]
+    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0x0f)));

[2]:
        Device (WERR)
        {
            Name (_HID, EisaId ("PNP0C33"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LGreaterEqual (OSYS, 0x07D9))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
> 
>> +    aml_append(dev, method);
>> +    aml_append(scope, dev);
>> +}
>> +
>>  /* RSDP */
>>  static GArray *
>>  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>> @@ -716,6 +744,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>>      acpi_dsdt_add_power_button(scope);
>> +    acpi_dsdt_add_error_device(scope);
>>  
>>      aml_append(dsdt, scope);
>>  
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 6b7a0fe..68495c2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -701,16 +701,27 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
>>  }
>>  
>>  static DeviceState *gpio_key_dev;
>> +static DeviceState *gpio_err_dev;
>>  static void virt_powerdown_req(Notifier *n, void *opaque)
>>  {
>>      /* use gpio Pin 3 for power button event */
>>      qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>>  }
>>  
>> +static void virt_error_notify_req(Notifier *n, void *opaque)
>> +{
>> +    /* use gpio Pin 4 for hardware error event */
>> +    qemu_set_irq(qdev_get_gpio_in(gpio_err_dev, 0), 1);
>> +}
>> +
>>  static Notifier virt_system_powerdown_notifier = {
>>      .notify = virt_powerdown_req
>>  };
>>  
>> +static Notifier virt_hardware_error_notifier = {
>> +    .notify = virt_error_notify_req
>> +};
>> +
>>  static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>>  {
>>      char *nodename;
>> @@ -739,6 +750,10 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>>  
>>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
>>                                          qdev_get_gpio_in(pl061_dev, 3));
>> +
>> +    gpio_err_dev = sysbus_create_simple("gpio-key", -1,
>> +                                        qdev_get_gpio_in(pl061_dev, 4));
>> +
>>      qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
>>      qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
>>      qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
>> @@ -755,6 +770,9 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>>      /* connect powerdown request */
>>      qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
>>  
>> +    /* connect hardware error notify request */
>> +    qemu_register_hardware_error_notifier(&virt_hardware_error_notifier);
>> +
>>      g_free(nodename);
>>  }
>>  
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index b213696..86931cf 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -75,6 +75,7 @@ void qemu_register_wakeup_notifier(Notifier *notifier);
>>  void qemu_system_shutdown_request(ShutdownCause reason);
>>  void qemu_system_powerdown_request(void);
>>  void qemu_register_powerdown_notifier(Notifier *notifier);
>> +void qemu_register_hardware_error_notifier(Notifier *notifier);
>>  void qemu_system_debug_request(void);
>>  void qemu_system_vmstop_request(RunState reason);
>>  void qemu_system_vmstop_request_prepare(void);
>> @@ -93,6 +94,8 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify);
>>  
>>  void qemu_announce_self(void);
>>  
>> +void qemu_hardware_error_notify(void);
>> +
>>  extern int autostart;
>>  
>>  typedef enum {
>> diff --git a/vl.c b/vl.c
>> index d632693..3552f7d 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1614,6 +1614,8 @@ static int suspend_requested;
>>  static WakeupReason wakeup_reason;
>>  static NotifierList powerdown_notifiers =
>>      NOTIFIER_LIST_INITIALIZER(powerdown_notifiers);
>> +static NotifierList hardware_error_notifiers =
>> +    NOTIFIER_LIST_INITIALIZER(hardware_error_notifiers);
>>  static NotifierList suspend_notifiers =
>>      NOTIFIER_LIST_INITIALIZER(suspend_notifiers);
>>  static NotifierList wakeup_notifiers =
>> @@ -1850,12 +1852,22 @@ void qemu_register_powerdown_notifier(Notifier *notifier)
>>      notifier_list_add(&powerdown_notifiers, notifier);
>>  }
>>  
>> +void qemu_register_hardware_error_notifier(Notifier *notifier)
>> +{
>> +    notifier_list_add(&hardware_error_notifiers, notifier);
>> +}
>> +
>>  void qemu_system_debug_request(void)
>>  {
>>      debug_requested = 1;
>>      qemu_notify_event();
>>  }
>>  
>> +void qemu_hardware_error_notify(void)
>> +{
>> +    notifier_list_notify(&hardware_error_notifiers, NULL);
>> +}
> 
> I'd prefer if you'd replace all this Notifier code with a machine callback
> and call it when needed.
Ok, thanks for this suggestion. I will check the code and see how to add a machine callback.


> 
>>  static bool main_loop_should_exit(void)
>>  {
>>      RunState r;
> 
> 
> .
> 
