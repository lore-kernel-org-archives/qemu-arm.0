Received: by 10.223.159.82 with SMTP id f18csp507355wrg;
        Tue, 21 Nov 2017 02:32:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYdGfjheJHQLbHN7IKxLwZ9ai/zdqb3G8Ew1Dhapd2H1YcNfJ5QDrLfRWkqdjqN9DjHAABp
X-Received: by 10.159.235.147 with SMTP id f19mr17226096plr.42.1511260337033;
        Tue, 21 Nov 2017 02:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260337; cv=none;
        d=google.com; s=arc-20160816;
        b=WdsolWdwMsat6mml+kR6OYJXLJChRAGwYVBON8s0ayRQV0IMZf3Od+tD/M0YKH1Npc
         +wW0/yy4UhE1duSyOUwhHB4habB17g6EyBty/Ig+JRidNRoWGJaSOyvTkXqjc2RrkX2l
         iBG3u+P1+T23/J/MmOJGoTs7l0WfoIPoxKTssefheZHHF0juPJ7BskLuBeSQlE8i1+C+
         ojRP4bXio2ZVZMwJinPaqiWe8TAej9FSJkui0UPcsCszcMCKwzjnIcpWMRJb4nLAaASD
         nT3vsAu14Ev6VS7dXgltcwvbj5nH5bjXdRH6VuLufyTr/4levb93zO0ijLdBwfX56wq2
         q6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=oS00x/rl/88lZlx8Uo4f8hEs4xv0kDIWgvGjVFxvdI4=;
        b=S1TdzP4VtN7QSzlQt2s98ZiGyJhKrk6Ejdj/CwK3qEa1orwJSX2eEB0qPTvEKsBOvf
         ykDvgu6S9MtDQn+JvN6CkrDnn4X6Uao1JCrNUB6hJSYnv1FOeprZaKGqUkRl46X5tCBy
         eAu6RnBNGRDwMNG8aPl+ainckj5Pt+j5kY1UwHa6mvVoHHjFglPJRGJ1QwxrrNpczCT7
         ihx9pXMoLeDOyoY7udh00QqIawehkKNAEx4oNi0UyWKOJ/TM7dYYn3kX8Xs5uAMIxg0L
         yb3dXI1FTqUDmP1Q50ixAm+k+eXAyEJ/8AwkAtO9j6ZQYayzINYcOqKiJB0DXyrMyjIC
         ks6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.16;
        Tue, 21 Nov 2017 02:32:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752086AbdKUKcO (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:32:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10973 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751669AbdKUKcA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:32:00 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39806;
        Tue, 21 Nov 2017 18:31:50 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:39 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 10/12] ARM: ACPI: Add _E04 for hardware error device
Date:   Wed, 22 Nov 2017 02:37:12 +0800
Message-ID: <1511289434-1551-11-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A140097.0023,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ac236da9364a55989d79e1252340f1f8
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tBrWdHkFFZsb

In ARM platform we implements a notification of error
events via a GPIO pin. In this case of GPIO-signaled
events, an _AEI object lists the appropriate GPIO pin.

GPIO pin 4 is used for hardware error device (PNP0C33),
so add _E04 in ACPI DSDT table. When GPIO-pin 4 signaled
a events, the guest ACPI driver will receive this
notification and handing the error.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
1. Address discussion result about guest APEI notification type for SIGBUS_MCEERR_AO SIGBUS in [1],
   the discussion conclusion is using GPIO-Signal for asynchronous signal

[1]:
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03397.html
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03467.html
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03601.html
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03775.html

2. The ASL dump for the GPIO and hardware error device 

................
Device (GPO0)
{
    Name (_AEI, ResourceTemplate ()  // _AEI: ACPI Event Interrupts
    {
        .............
        GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
            "GPO0", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0004
            }
    })
    Method (_E04, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
    {
        Notify (ERRD, 0x80) // Status Change
    }
}
Device (ERRD)
{
    Name (_HID, EisaId ("PNP0C33") /* Error Device */)  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }
}

3. Below is the guest log when Qemu notifies guest using GPIO-signal after record a CPER
[  504.164899] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 7
[  504.166970] {1}[Hardware Error]: event severity: recoverable
[  504.251650] {1}[Hardware Error]:  Error 0, type: recoverable
[  504.252974] {1}[Hardware Error]:   section_type: memory error
[  504.254380] {1}[Hardware Error]:   physical_address: 0x00000000000003ec
[  504.255879] {1}[Hardware Error]:   error_type: 3, multi-bit ECC
---
 hw/arm/virt-acpi-build.c | 31 ++++++++++++++++++++++++++++++-
 hw/arm/virt.c            | 18 ++++++++++++++++++
 include/sysemu/sysemu.h  |  3 +++
 vl.c                     | 12 ++++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7b397c3..92c8c38 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,6 +49,7 @@
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
+#define ACPI_HARDWARE_ERROR_DEVICE "ERRD"
 
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
@@ -340,7 +341,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
 
     Aml *aei = aml_resource_template();
     /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
+    uint32_t pin_list[1] = {3};
+    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
+                                 "GPO0", NULL, 0));
+
+    /* Pin 4 for hardware error device */
+    pin_list[0] = 4;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
                                  AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
                                  "GPO0", NULL, 0));
@@ -351,6 +358,13 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                   aml_int(0x80)));
     aml_append(dev, method);
+
+    /* _E04 is handle for hardware error */
+    method = aml_method("_E04", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_notify(aml_name(ACPI_HARDWARE_ERROR_DEVICE),
+                                  aml_int(0x80)));
+    aml_append(dev, method);
+
     aml_append(scope, dev);
 }
 
@@ -363,6 +377,20 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_error_device(Aml *scope)
+{
+    Aml *dev = aml_device(ACPI_HARDWARE_ERROR_DEVICE);
+    Aml *method;
+
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C33")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0x0f)));
+    aml_append(dev, method);
+    aml_append(scope, dev);
+}
+
 /* RSDP */
 static GArray *
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
@@ -716,6 +744,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_error_device(scope);
 
     aml_append(dsdt, scope);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6b7a0fe..68495c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -701,16 +701,27 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
 }
 
 static DeviceState *gpio_key_dev;
+static DeviceState *gpio_err_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
     /* use gpio Pin 3 for power button event */
     qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
 }
 
+static void virt_error_notify_req(Notifier *n, void *opaque)
+{
+    /* use gpio Pin 4 for hardware error event */
+    qemu_set_irq(qdev_get_gpio_in(gpio_err_dev, 0), 1);
+}
+
 static Notifier virt_system_powerdown_notifier = {
     .notify = virt_powerdown_req
 };
 
+static Notifier virt_hardware_error_notifier = {
+    .notify = virt_error_notify_req
+};
+
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 {
     char *nodename;
@@ -739,6 +750,10 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
+
+    gpio_err_dev = sysbus_create_simple("gpio-key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 4));
+
     qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
     qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
     qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
@@ -755,6 +770,9 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
     /* connect powerdown request */
     qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
 
+    /* connect hardware error notify request */
+    qemu_register_hardware_error_notifier(&virt_hardware_error_notifier);
+
     g_free(nodename);
 }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b213696..86931cf 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -75,6 +75,7 @@ void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_system_shutdown_request(ShutdownCause reason);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
+void qemu_register_hardware_error_notifier(Notifier *notifier);
 void qemu_system_debug_request(void);
 void qemu_system_vmstop_request(RunState reason);
 void qemu_system_vmstop_request_prepare(void);
@@ -93,6 +94,8 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
 void qemu_announce_self(void);
 
+void qemu_hardware_error_notify(void);
+
 extern int autostart;
 
 typedef enum {
diff --git a/vl.c b/vl.c
index d632693..3552f7d 100644
--- a/vl.c
+++ b/vl.c
@@ -1614,6 +1614,8 @@ static int suspend_requested;
 static WakeupReason wakeup_reason;
 static NotifierList powerdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(powerdown_notifiers);
+static NotifierList hardware_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(hardware_error_notifiers);
 static NotifierList suspend_notifiers =
     NOTIFIER_LIST_INITIALIZER(suspend_notifiers);
 static NotifierList wakeup_notifiers =
@@ -1850,12 +1852,22 @@ void qemu_register_powerdown_notifier(Notifier *notifier)
     notifier_list_add(&powerdown_notifiers, notifier);
 }
 
+void qemu_register_hardware_error_notifier(Notifier *notifier)
+{
+    notifier_list_add(&hardware_error_notifiers, notifier);
+}
+
 void qemu_system_debug_request(void)
 {
     debug_requested = 1;
     qemu_notify_event();
 }
 
+void qemu_hardware_error_notify(void)
+{
+    notifier_list_notify(&hardware_error_notifiers, NULL);
+}
+
 static bool main_loop_should_exit(void)
 {
     RunState r;
-- 
1.8.3.1
