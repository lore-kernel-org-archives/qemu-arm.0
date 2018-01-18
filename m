Received: by 10.28.153.193 with SMTP id b184csp46668wme;
        Thu, 18 Jan 2018 13:39:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBovwbyAFCZar9XMWSecqNddyVjFDDjgUCMlXMS7S1SU6jBor6CuencA4F2iKtxEJi+Yijbfo
X-Received: by 10.129.159.140 with SMTP id w134mr7510947ywg.469.1516311597089;
        Thu, 18 Jan 2018 13:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516311597; cv=none;
        d=google.com; s=arc-20160816;
        b=lZd87axB3x4kYXRjpg78+Hq1kZ1pGd/wC7T6zq0r8Y7y23pXsFwJGF7/IJTqJ3CtYm
         Wm7gXGQDJybWWEpCErD4fwPYPHkmHe3rNc7Zi+jEyrU8kDh2xs9YqfzRdn7FoAkTFRQP
         HxhNCJaBc3yVetvqbS9zOofcds31Oe5z2XUSkLWBgmU6naUyZp+7b/5Jn8V7kBfyQ3Af
         P6VSIdpCq3LIQscn/FKVz7R+TahQOFBMAwRzo8t70FvSGcSb6YFxruQB4vPAZEzNTf8I
         SZNSY2BmU70hc9Hq0Qt3bJSN5N49ACcEVhiPR1XS4ipNHUpkeqbOYm+yDdAgPp2+ueyo
         T1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EwrHNNC0vDkJhpG8UzYpa+IdpS5dKp7Zf+p5XynzKag=;
        b=Zjtyi6wUwKx3KFfstYUjIeuCdoMQLBvUVkhfuTHh87v8ye8R51So3qqTXJUmeVHR7/
         K/ACqX4EY+vzj8cPzkVKyeqhN5XG9za0aPl4DlVXgQ6YJbNRHhfP9/7Y9LKg/y/5R4F1
         iTKDPdjjrpR1Pt8Pz4WDYf2ixSoDRHVUtJhUmV186VfWnCuUXT49xmWliHLo97A8Q1uO
         MWYh2qhhXyx9iQCc568a22Vf5wk3Rs2Vh1DY4wMZKpBWqrtPW6uL4xkEZvNA2MubLA43
         qPOnlHpfOYundvSxk0hb1/3yxtq/rFohDJSaMmNI8D9NfZ/m51BtsF2xSRipIOZoY2fk
         bgyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=XhUzsAei;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b30si313916ybi.262.2018.01.18.13.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 13:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=XhUzsAei;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecHue-00045R-HW
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 16:39:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1ecHuC-00042Y-P8
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 16:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1ecHuA-0007xh-F1
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 16:39:28 -0500
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:46431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1ecHuA-0007wh-2K; Thu, 18 Jan 2018 16:39:26 -0500
Received: by mail-pf0-x22f.google.com with SMTP id y5so15708516pff.13;
	Thu, 18 Jan 2018 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FuFYqI1VRfJaQLT18cxLA4iHutJXyDv9cE2zEek7r+Y=;
	b=XhUzsAeizkGsLi/sYQHLswqWsolVasTmKKJGR+un4ZXj4DnqeA9IdrNCpXHikQT1KR
	rSArYHsWKmHG2Yi8q3DIw2G7CMltKPszJxbt+vAfF3jW+QEEJKofjs6rAQNoZIOrUiTA
	+KjNAAelCrJCpCeFUTdQmgzyrWD6HnvRqYwhpnUkIvQgDHYAHreE+5OH+B9+hEPDyXDv
	0RgxUX7nslLtoMHxtEg95/m2howoFOm7KXyQ45s5NnJXnKf+FxV9gFTCwXJvW2k32+44
	I+27j4KEFTgyZYlmkoXGT9rm1ZaIIwjcWk/hv4y3+uMKUJXfn+SVq54Hn2S3qMYYLQsR
	fnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FuFYqI1VRfJaQLT18cxLA4iHutJXyDv9cE2zEek7r+Y=;
	b=lMpqE+7u4sBLd16P592JIdCNtnvTe6ap99h+txdTPiC64kaYsHA0odAkn3PrV+WTa5
	dEjaMnP2z8by95jbxPUJhpWK9rwNEcKQ8qvM/14L6NeIJsvRTTkcmeuVhWxRFJ5NZHSp
	ZS2WjQObBUWeyr8CN9VKUXbpIci5irI2zF4Y5X90AspyDKup0fiyDOZ7aJ6U/Uk4SiLm
	uF9PTLl0rHxBxbcQQBzV6kUCHct7MNv9eMWIOm30SkBViA+feB/kN6lcfI0KY+ECXYM3
	DUb8rsv0ooKaDbz42mFZTstp7iHGtFynSX80LMv2W/me1FXW0O+zXH+L/gsVe5ItSl9V
	44cg==
X-Gm-Message-State: AKGB3mLSglks2rS7DgBf+UWalmWsFzogJGmyONMrnh3Sxak8CBByEKFL
	L4Qi1eL2O2fQ282asDhohXwmsKnVnZlkl88XuQY=
X-Received: by 10.98.26.151 with SMTP id a145mr44204693pfa.206.1516311563300; 
	Thu, 18 Jan 2018 13:39:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.204 with HTTP; Thu, 18 Jan 2018 13:39:22 -0800 (PST)
In-Reply-To: <CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
From: bzt bzt <bztemail@gmail.com>
Date: Thu, 18 Jan 2018 22:39:22 +0100
Message-ID: <CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XR/DSNJN1P+

Dear All,

Since you still haven't merged Alistair's patch, I decided to include it in
my own.
I've shrinked the number of modified files to two, that's the bare minimum
to support "-M raspi3" switch. Bcm2836.c modified minimally, the rest is in
raspi.c. I've renamed raspi2_init() to raspi_init() 'cos now it initializes
raspi3 as well, no additional function.

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8c43291112..5119e00051 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "hw/boards.h"
 #include "exec/address-spaces.h"

 /* Peripheral base address seen by the CPU */
@@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)

     for (n = 0; n < BCM2836_NCPUS; n++) {
         object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
-                          "cortex-a15-" TYPE_ARM_CPU);
+                          current_machine->cpu_type);
         object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
                                   &error_abort);
     }
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index cd5fa8c3dc..24a9243440 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -5,6 +5,8 @@
  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * Raspberry Pi 3 emulation Copyright (c) 2018 by bzt
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */

@@ -22,10 +24,11 @@
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS
*/
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
-#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
+#define FIRMWARE_ADDR_2    0x8000 /* Pi 2 loads kernel.img here by default
*/
+#define FIRMWARE_ADDR_3   0x80000 /* Pi 3 loads kernel8.img here by
default */

 /* Table of Linux board IDs for different Pi versions */
-static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
+static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};

 typedef struct RasPiState {
     BCM2836State soc;
@@ -83,8 +86,8 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
     binfo.secure_board_setup = true;
     binfo.secure_boot = true;

-    /* Pi2 requires SMP setup */
-    if (version == 2) {
+    /* Pi2 and Pi3 requires SMP setup */
+    if (version >= 2) {
         binfo.smp_loader_start = SMPBOOT_ADDR;
         binfo.write_secondary_boot = write_smpboot;
         binfo.secondary_cpu_reset_hook = reset_secondary;
@@ -94,15 +97,15 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
      * the normal Linux boot process
      */
     if (machine->firmware) {
+        binfo.entry = version==3? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
         /* load the firmware image (typically kernel.img) */
-        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
-                                ram_size - FIRMWARE_ADDR);
+        r = load_image_targphys(machine->firmware, binfo.entry,
+                                ram_size - binfo.entry);
         if (r < 0) {
             error_report("Failed to load firmware from %s",
machine->firmware);
             exit(1);
         }

-        binfo.entry = FIRMWARE_ADDR;
         binfo.firmware_loaded = true;
     } else {
         binfo.kernel_filename = machine->kernel_filename;
@@ -113,7 +116,7 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
 }

-static void raspi2_init(MachineState *machine)
+static void raspi_init(MachineState *machine)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     uint32_t vcram_size;
@@ -121,6 +124,7 @@ static void raspi2_init(MachineState *machine)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    int version = machine->cpu_type==ARM_CPU_TYPE_NAME("cortex-a15")? 2 :
3;

     object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
@@ -137,8 +141,8 @@ static void raspi2_init(MachineState *machine)
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
-                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), version==3 ? 0xa02082 :
0xa21041,
+                            "board-rev", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
&error_abort);

     /* Create and plug in the SD cards */
@@ -155,21 +159,39 @@ static void raspi2_init(MachineState *machine)

     vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
                                           &error_abort);
-    setup_boot(machine, 2, machine->ram_size - vcram_size);
+    setup_boot(machine, version, machine->ram_size - vcram_size);
 }

 static void raspi2_machine_init(MachineClass *mc)
 {
     mc->desc = "Raspberry Pi 2";
-    mc->init = raspi2_init;
+    mc->init = raspi_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->max_cpus = BCM2836_NCPUS;
     mc->min_cpus = BCM2836_NCPUS;
     mc->default_cpus = BCM2836_NCPUS;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->default_ram_size = 1024 * 1024 * 1024;
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
+
+static void raspi3_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 3";
+    mc->init = raspi_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM2836_NCPUS;
+    mc->min_cpus = BCM2836_NCPUS;
+    mc->default_cpus = BCM2836_NCPUS;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->ignore_memory_transaction_failures = true;
+};
+DEFINE_MACHINE("raspi3", raspi3_machine_init)

Hope it's simple enough to be reviewed easily, and it uses CPU type strings
as requested.

Cheers,
bzt


On Wed, Nov 29, 2017 at 8:52 AM, bzt bzt <bztemail@gmail.com> wrote:

>
>
> On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann <
> Andrew.Baumann@microsoft.com> wrote:
>
>> > From: bzt bzt [mailto:bztemail@gmail.com]
>> > Sent: Tuesday, 28 November 2017 03:27
>>
>> > Yes, I agree. I've provided a parameterised version on Oct 24, which
>> does not
>> > have a separate bcm2837 implementation. Is that patch ok?
>>
>> That patch was moving in the right direction, but I think there were two
>> problems with it. First, the right way to pass a parameter is via a
>> property field (as Peter explained). Second, IMO the parameter should be
>> the CPU model string to instantiate and not the Pi version number.
>>
>
> Thanks!
>
>
>>
>> > Or should I wait
>> > for Alistair's patch (https://lists.gnu.org/archive
>> /html/qemu-devel/2017-
>> > 10/msg04153.html)?
>>
>> Alistair's patch doesn't actually help you as far as I can see, since it
>> doesn't change what CPU bcm2836 instantiates. I think it just means that if
>> the user specifies a different CPU type they get an error rather than being
>> silently ignored.
>>
>
> It does add the CPU model string, which can and should be used in bcm2836
> to decide which CPU to instatiate (regardless the method of passing that
> parameter). If I add yet another CPU model string, the two patch will be in
> conflict containing redundant information. Also I'm sure would raspi3 use
> different cpus, we should always instantiate the one the user specified.
> Although here is only one possible CPU model, still that seems to be the
> correct behavior. Don't get me wrong, I don't criticize, I just want to
> find the best solution. Setting the CPU model only once for each version
> seems right. I was thinking: if there's going to be a user specified CPU
> model string anyway, why not use that one?
>
> bzt
>
>
>>
>> Andrew
>>
>
>
