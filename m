Received: by 10.223.161.27 with SMTP id o27csp771941wro;
        Tue, 24 Oct 2017 09:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SGno2r1zHvCRQbHEGpYWxca8kPjZfB11G0c7r+VUs1Owk09OhONyFnx3UmcS4cHPQznSr4
X-Received: by 10.129.226.7 with SMTP id p7mr11389754ywl.27.1508862653849;
        Tue, 24 Oct 2017 09:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508862653; cv=none;
        d=google.com; s=arc-20160816;
        b=bwW0oJD/027j5jHRdi8HTNQjf/rYLjiXvCiZ8Qc3Gi6Pm3a+iz0wwJ98aum75rs6gU
         Ts8urGDpO5PjbkV09or1nHXr1ofSk2wjVPLJCvq4HQkHp1TgFGMgzjTbbG7Uvb1P+ljz
         aCULV9RYka2GxUoK447HXpahwq04CMm52onqN9Z1WhU3u9TB8Zl9uNJutHhusLQFpE2S
         PQ3BIDinI15bXns3ZQprgU8J2sOEDWweMjtGlXEodmkvTIqdmJPRRzxSyS28MI4bmrg+
         pXc9i7hUW9R+BXG2aySaOvch/+8cl6bjfi8F9b9sGdjfrTpm7MwX4wM8+W2omcyYxcxo
         IyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wQ6RPqhsvjjDyR2zN2/VVAosqLCt2AL8MO11Mq77vJY=;
        b=1DLaQZuKfNIVDgjRqBkxPCOjZ0DraVk9u8z8WIR1fVTSmDe2GCieCshwjG6YzKoU6t
         74A+tR2mcuAjlHQDdcQ1hs+joxsOwZ3s3fkFFAApjGipbnbxvaRwmynlXB1sNpzf17eG
         m5jMjZlQAGRkXxRB406w2sHjodiQnU+4wsE8hy1JYbpEu56K7M78vR6NP2stwPqnTXyh
         yMl49/zhDTyIcrBmGRl05tEZiQ+U1iejdFqHWWrTDehwpG8bD0ox1tYMTvF60cTscQk9
         yWUAg7z2RzIt8DzaqdN/fCpsgdQKaifOEqXKy/u2dCDLDBnsrmtvgMUpv1G7c8oV8EbY
         pD6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iZSmNuaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k124si101506ywg.232.2017.10.24.09.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 09:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iZSmNuaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e726P-0005XE-9F
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 12:30:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e726G-0005X7-TS
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e726E-0002e0-PV
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 12:30:44 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:53104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1e726E-0002dI-Eh; Tue, 24 Oct 2017 12:30:42 -0400
Received: by mail-pf0-x243.google.com with SMTP id e64so20052052pfk.9;
	Tue, 24 Oct 2017 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wQ6RPqhsvjjDyR2zN2/VVAosqLCt2AL8MO11Mq77vJY=;
	b=iZSmNuaHSvoV6ndWIy6ZaH8ZIZ8Mp0ShDyTko2SEkfHCaKfVgcGl5HMz7JI3N2bwy9
	RvRXyTPOn10n5MgeF7YP2rHUHAK7kC4FKa2ktyyBl70vMc7OTFkZTH/XmyY5iA5AP1IC
	K9Y6LrU/KdvOvd2d0BVCJBrb254D4G+TI6DEbmluQXRqRFsbjqbukEFFN8ymJgZyd/W/
	RlrrgH/PAkId2BiEH2Xg2tkAVJ1CyGmhKMpan4R1x3fLEocqo2IzWc9bB5ehkLb7Wr6p
	11bYl7Hsg0QIKCJrAQZIb9VQKP6MeAIByBBHpBOTACn/owyQHoRvbhMF6+fs6Tf5EGf0
	dDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wQ6RPqhsvjjDyR2zN2/VVAosqLCt2AL8MO11Mq77vJY=;
	b=IfbtxpJkezArBS4GZZecnPqMVXsrlU7z73eHlP+lIBTrhgU8fJ/yentAow5iNXf1aH
	qe7aHLz4B9d3tfmyJwO4IoZIsw9BsnlRrlGCYQyYKht9XYaDg1gN2/+fkkjMzVjPqIpj
	u1LktTM94pE3w5KOGn5K4E8PPTlzIHSD80JvAoEXZTqQ5Bj5tHhiDF1dCkJstx2amsdr
	JBTA+QAif8QZ2oXAUht68iWjI307JhBmxUfSJuGGWw33QzqDSg2ZA5fbSg9NyutCstqg
	f4ywp8h2fM67Jl0mp/owV4Z9sFc3LHs/LRsBQPCey1ig66+aegFuXpeELFVL/NED1ND8
	CeGw==
X-Gm-Message-State: AMCzsaWUiHxpoRagtDxWL+3wwiAVvCBXc9qHB8kZuuShk88KgOiuxg8h
	lod3SpQyVKrUcRHzo9MgnXA3P9oWigHNdewniIg=
X-Received: by 10.101.87.139 with SMTP id b11mr9612947pgr.314.1508862641101;
	Tue, 24 Oct 2017 09:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.155.102 with HTTP; Tue, 24 Oct 2017 09:30:40 -0700 (PDT)
In-Reply-To: <alpine.BSF.2.21.1710241246330.82180@zero.eik.bme.hu>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<alpine.BSF.2.21.1710241246330.82180@zero.eik.bme.hu>
From: bzt bzt <bztemail@gmail.com>
Date: Tue, 24 Oct 2017 18:30:40 +0200
Message-ID: <CADYoBw1kuPBJPR+f1ZJMWpCSg3ttGNh_bO_kww6u5x7LbiubVA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="089e08236e40bce282055c4d75b2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tC49oiWcUwdV

--089e08236e40bce282055c4d75b2
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 1:05 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:
[...]

> Summa summarum, which one is preferred? Think of the future or keep it at a
>> bare minimum?
>>
>
> I don't feel I have a deciding word in this but to share my opinion I
> think it's better to keep it in one file avoiding too much code duplication
> as long as those features that would make the implementations different
> aren't added now. Then when those features are added the files could be
> split or the best way can be decided at that point based on how those
> features will be implemented so no need to think that far ahead now. This
> would make patches easier to review now and maintaining the common code
> easier until they are different enough so a split needs to be done.
>
> Regrads,
> BALATON Zoltan
>

Okay, in this case here's a minimalistic version without the BCM2837 class
(just a flag added to BCM2836State). Feel free to choose which one to
apply. :-)

Cheers,
Zoli (bzt)

From a4d5c240d3b872a7ff1068de83d2080cd00e4517 Mon Sep 17 00:00:00 2001
From: bzt <bztemail@gmail.com>
Date: Tue, 24 Oct 2017 18:07:28 +0200
Subject: [PATCH] machine raspi3

Signed-off-by: bzt <bztemail@gmail.com>
---
 hw/arm/bcm2836.c         |  2 +-
 hw/arm/raspi.c           | 54
++++++++++++++++++++++++++++++++++++++----------
 include/hw/arm/bcm2836.h |  1 +
 3 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8c43291..768f3c2 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -30,7 +30,7 @@ static void bcm2836_init(Object *obj)

     for (n = 0; n < BCM2836_NCPUS; n++) {
         object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
-                          "cortex-a15-" TYPE_ARM_CPU);
+            s->version == 2 ? "cortex-a15-" TYPE_ARM_CPU : "cortex-a53-"
TYPE_ARM_CPU);
         object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
                                   &error_abort);
     }
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5941c9f..a74d57d 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -5,6 +5,8 @@
  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * Raspberry Pi 3 emulation 2017 by bzt
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */

@@ -22,10 +24,13 @@
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
+static const int raspi_boardid[]  = {[1] = 0xc42, [2] = 0xc43, [3] =
0xc44};
+/* Board revision IDs */
+static const int raspi_boardrev[] = {[1] = 0, [2] = 0xa21041, [3] =
0xa02082};

 typedef struct RasPiState {
     BCM2836State soc;
@@ -73,6 +78,7 @@ static void reset_secondary(ARMCPU *cpu, const struct
arm_boot_info *info)
 static void setup_boot(MachineState *machine, int version, size_t ram_size)
 {
     static struct arm_boot_info binfo;
+    hwaddr entry = 0;
     int r;

     binfo.board_id = raspi_boardid[version];
@@ -83,11 +89,12 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
     binfo.secure_board_setup = true;
     binfo.secure_boot = true;

-    /* Pi2 requires SMP setup */
-    if (version == 2) {
+    /* Pi2 and Pi3 requires SMP setup */
+    if (version == 2 || version == 3) {
         binfo.smp_loader_start = SMPBOOT_ADDR;
         binfo.write_secondary_boot = write_smpboot;
         binfo.secondary_cpu_reset_hook = reset_secondary;
+        entry = version == 2 ? FIRMWARE_ADDR_2 : FIRMWARE_ADDR_3;
     }

     /* If the user specified a "firmware" image (e.g. UEFI), we bypass
@@ -95,14 +102,14 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
      */
     if (machine->firmware) {
         /* load the firmware image (typically kernel.img) */
-        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
-                                ram_size - FIRMWARE_ADDR);
+        r = load_image_targphys(machine->firmware, entry,
+                                ram_size - entry);
         if (r < 0) {
             error_report("Failed to load firmware from %s",
machine->firmware);
             exit(1);
         }

-        binfo.entry = FIRMWARE_ADDR;
+        binfo.entry = entry;
         binfo.firmware_loaded = true;
     } else {
         binfo.kernel_filename = machine->kernel_filename;
@@ -113,7 +120,7 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
 }

-static void raspi2_init(MachineState *machine)
+static void raspi_init(MachineState *machine, int version)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     uint32_t vcram_size;
@@ -122,6 +129,7 @@ static void raspi2_init(MachineState *machine)
     BusState *bus;
     DeviceState *carddev;

+    s->soc.version = version;
     object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
                               &error_abort);
@@ -137,8 +145,8 @@ static void raspi2_init(MachineState *machine)
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
-                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), raspi_boardrev[version],
+                            "board-rev", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
&error_abort);

     /* Create and plug in the SD cards */
@@ -155,7 +163,12 @@ static void raspi2_init(MachineState *machine)

     vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
                                           &error_abort);
-    setup_boot(machine, 2, machine->ram_size - vcram_size);
+    setup_boot(machine, version, machine->ram_size - vcram_size);
+}
+
+static void raspi2_init(MachineState *machine)
+{
+    raspi_init(machine, 2);
 }

 static void raspi2_machine_init(MachineClass *mc)
@@ -171,3 +184,22 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
+
+static void raspi3_init(MachineState *machine)
+{
+    raspi_init(machine, 3);
+}
+
+static void raspi3_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 3";
+    mc->init = raspi3_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM2836_NCPUS;
+    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->ignore_memory_transaction_failures = true;
+};
+DEFINE_MACHINE("raspi3", raspi3_machine_init)
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 76de199..3c538f6 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -26,6 +26,7 @@ typedef struct BCM2836State {
     /*< public >*/

     uint32_t enabled_cpus;
+    uint version;

     ARMCPU cpus[BCM2836_NCPUS];
     BCM2836ControlState control;
-- 
2.14.2

--089e08236e40bce282055c4d75b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 24, 2017 at 1:05 PM, BALATON Zoltan <span dir=3D"ltr">&lt;<=
a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</=
a>&gt;</span> wrote:</div><div class=3D"gmail_quote">[...]<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Summa summarum, which one is preferred? =
Think of the future or keep it at a<br>
bare minimum?<br>
</blockquote>
<br></span>
I don&#39;t feel I have a deciding word in this but to share my opinion I t=
hink it&#39;s better to keep it in one file avoiding too much code duplicat=
ion as long as those features that would make the implementations different=
 aren&#39;t added now. Then when those features are added the files could b=
e split or the best way can be decided at that point based on how those fea=
tures will be implemented so no need to think that far ahead now. This woul=
d make patches easier to review now and maintaining the common code easier =
until they are different enough so a split needs to be done.<br>
<br>
Regrads,<br>
BALATON Zoltan<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Okay, in this case =
here&#39;s a minimalistic version without the BCM2837 class (just a flag ad=
ded to BCM2836State). Feel free to choose which one to apply. :-)</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><d=
iv class=3D"gmail_extra">Zoli (bzt)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra">From a4d5c240d3b87=
2a7ff1068de83d2080cd00e4517 Mon Sep 17 00:00:00 2001</div><div class=3D"gma=
il_extra">From: bzt &lt;<a href=3D"mailto:bztemail@gmail.com">bztemail@gmai=
l.com</a>&gt;</div><div class=3D"gmail_extra">Date: Tue, 24 Oct 2017 18:07:=
28 +0200</div><div class=3D"gmail_extra">Subject: [PATCH] machine raspi3</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Signed-o=
ff-by: bzt &lt;<a href=3D"mailto:bztemail@gmail.com">bztemail@gmail.com</a>=
&gt;</div><div class=3D"gmail_extra">---</div><div class=3D"gmail_extra">=
=C2=A0hw/arm/bcm2836.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-</div><=
div class=3D"gmail_extra">=C2=A0hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 54 ++++++++++++++++++++++++++++++++++++++----------</div><di=
v class=3D"gmail_extra">=C2=A0include/hw/arm/bcm2836.h |=C2=A0 1 +</div><di=
v class=3D"gmail_extra">=C2=A03 files changed, 45 insertions(+), 12 deletio=
ns(-)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c</div><div class=3D"gmail_e=
xtra">index 8c43291..768f3c2 100644</div><div class=3D"gmail_extra">--- a/h=
w/arm/bcm2836.c</div><div class=3D"gmail_extra">+++ b/hw/arm/bcm2836.c</div=
><div class=3D"gmail_extra">@@ -30,7 +30,7 @@ static void bcm2836_init(Obje=
ct *obj)</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_ex=
tra">=C2=A0 =C2=A0 =C2=A0for (n =3D 0; n &lt; BCM2836_NCPUS; n++) {</div><d=
iv class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initializ=
e(&amp;s-&gt;cpus[n], sizeof(s-&gt;cpus[n]),</div><div class=3D"gmail_extra=
">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;cortex-a15-&quot; TYPE_ARM_CPU);</div><div class=
=3D"gmail_extra">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;version =
=3D=3D 2 ? &quot;cortex-a15-&quot; TYPE_ARM_CPU : &quot;cortex-a53-&quot; T=
YPE_ARM_CPU);</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0object_property_add_child(obj, &quot;cpu[*]&quot;, OBJECT(&amp;s-&gt;=
cpus[n]),</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;error_abort);</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0}</div><div class=3D"gmail_extra">diff --git a/hw/arm/rasp=
i.c b/hw/arm/raspi.c</div><div class=3D"gmail_extra">index 5941c9f..a74d57d=
 100644</div><div class=3D"gmail_extra">--- a/hw/arm/raspi.c</div><div clas=
s=3D"gmail_extra">+++ b/hw/arm/raspi.c</div><div class=3D"gmail_extra">@@ -=
5,6 +5,8 @@</div><div class=3D"gmail_extra">=C2=A0 * Rasperry Pi 2 emulatio=
n Copyright (c) 2015, Microsoft</div><div class=3D"gmail_extra">=C2=A0 * Wr=
itten by Andrew Baumann</div><div class=3D"gmail_extra">=C2=A0 *</div><div =
class=3D"gmail_extra">+ * Raspberry Pi 3 emulation 2017 by bzt</div><div cl=
ass=3D"gmail_extra">+ *</div><div class=3D"gmail_extra">=C2=A0 * This code =
is licensed under the GNU GPLv2 and later.</div><div class=3D"gmail_extra">=
=C2=A0 */</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_e=
xtra">@@ -22,10 +24,13 @@</div><div class=3D"gmail_extra">=C2=A0#define SMP=
BOOT_ADDR=C2=A0 =C2=A0 0x300 /* this should leave enough space for ATAGS */=
</div><div class=3D"gmail_extra">=C2=A0#define MVBAR_ADDR=C2=A0 =C2=A0 =C2=
=A0 0x400 /* secure vectors */</div><div class=3D"gmail_extra">=C2=A0#defin=
e BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */</div><div clas=
s=3D"gmail_extra">-#define FIRMWARE_ADDR=C2=A0 =C2=A00x8000 /* Pi loads ker=
nel.img here by default */</div><div class=3D"gmail_extra">+#define FIRMWAR=
E_ADDR_2=C2=A0 =C2=A0 0x8000 /* Pi 2 loads kernel.img here by default */</d=
iv><div class=3D"gmail_extra">+#define FIRMWARE_ADDR_3=C2=A0 =C2=A00x80000 =
/* Pi 3 loads kernel8.img here by default */</div><div class=3D"gmail_extra=
">=C2=A0</div><div class=3D"gmail_extra">=C2=A0/* Table of Linux board IDs =
for different Pi versions */</div><div class=3D"gmail_extra">-static const =
int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43};</div><div class=3D"=
gmail_extra">+static const int raspi_boardid[]=C2=A0 =3D {[1] =3D 0xc42, [2=
] =3D 0xc43, [3] =3D 0xc44};</div><div class=3D"gmail_extra">+/* Board revi=
sion IDs */</div><div class=3D"gmail_extra">+static const int raspi_boardre=
v[] =3D {[1] =3D 0, [2] =3D 0xa21041, [3] =3D 0xa02082};</div><div class=3D=
"gmail_extra">=C2=A0</div><div class=3D"gmail_extra">=C2=A0typedef struct R=
asPiState {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0BCM2836Stat=
e soc;</div><div class=3D"gmail_extra">@@ -73,6 +78,7 @@ static void reset_=
secondary(ARMCPU *cpu, const struct arm_boot_info *info)</div><div class=3D=
"gmail_extra">=C2=A0static void setup_boot(MachineState *machine, int versi=
on, size_t ram_size)</div><div class=3D"gmail_extra">=C2=A0{</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0static struct arm_boot_info binfo;</d=
iv><div class=3D"gmail_extra">+=C2=A0 =C2=A0 hwaddr entry =3D 0;</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0int r;</div><div class=3D"gmail_e=
xtra">=C2=A0</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0binfo.boar=
d_id =3D raspi_boardid[version];</div><div class=3D"gmail_extra">@@ -83,11 =
+89,12 @@ static void setup_boot(MachineState *machine, int version, size_t=
 ram_size)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0binfo.secure=
_board_setup =3D true;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0=
binfo.secure_boot =3D true;</div><div class=3D"gmail_extra">=C2=A0</div><di=
v class=3D"gmail_extra">-=C2=A0 =C2=A0 /* Pi2 requires SMP setup */</div><d=
iv class=3D"gmail_extra">-=C2=A0 =C2=A0 if (version =3D=3D 2) {</div><div c=
lass=3D"gmail_extra">+=C2=A0 =C2=A0 /* Pi2 and Pi3 requires SMP setup */</d=
iv><div class=3D"gmail_extra">+=C2=A0 =C2=A0 if (version =3D=3D 2 || versio=
n =3D=3D 3) {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0binfo.smp_loader_start =3D SMPBOOT_ADDR;</div><div class=3D"gmail_ext=
ra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binfo.write_secondary_boot =3D write_=
smpboot;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
binfo.secondary_cpu_reset_hook =3D reset_secondary;</div><div class=3D"gmai=
l_extra">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D version =3D=3D 2 ? FIRMWARE=
_ADDR_2 : FIRMWARE_ADDR_3;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0}</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_ext=
ra">=C2=A0 =C2=A0 =C2=A0/* If the user specified a &quot;firmware&quot; ima=
ge (e.g. UEFI), we bypass</div><div class=3D"gmail_extra">@@ -95,14 +102,14=
 @@ static void setup_boot(MachineState *machine, int version, size_t ram_s=
ize)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 */</div><div clas=
s=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0if (machine-&gt;firmware) {</div><div=
 class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* load the firmwa=
re image (typically kernel.img) */</div><div class=3D"gmail_extra">-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 r =3D load_image_targphys(machine-&gt;firmware, FIRMWA=
RE_ADDR,</div><div class=3D"gmail_extra">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ram_size - FIRMWARE_ADDR);</div><div class=3D"gmail_extra">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 r =3D load_image_targphys(machine-&gt;firmware, entry,=
</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
size - entry);</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (r &lt; 0) {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Failed to load firmware from =
%s&quot;, machine-&gt;firmware);</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);</div><div class=3D"gmail_ext=
ra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div class=3D"gmail_extra">=C2=
=A0</div><div class=3D"gmail_extra">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.entr=
y =3D FIRMWARE_ADDR;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 binfo.entry =3D entry;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0binfo.firmware_loaded =3D true;</div><div class=3D"gma=
il_extra">=C2=A0 =C2=A0 =C2=A0} else {</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binfo.kernel_filename =3D machine-&gt;kernel=
_filename;</div><div class=3D"gmail_extra">@@ -113,7 +120,7 @@ static void =
setup_boot(MachineState *machine, int version, size_t ram_size)</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0arm_load_kernel(ARM_CPU(first_cpu)=
, &amp;binfo);</div><div class=3D"gmail_extra">=C2=A0}</div><div class=3D"g=
mail_extra">=C2=A0</div><div class=3D"gmail_extra">-static void raspi2_init=
(MachineState *machine)</div><div class=3D"gmail_extra">+static void raspi_=
init(MachineState *machine, int version)</div><div class=3D"gmail_extra">=
=C2=A0{</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0RasPiState *s =
=3D g_new0(RasPiState, 1);</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0uint32_t vcram_size;</div><div class=3D"gmail_extra">@@ -122,6 +129,7=
 @@ static void raspi2_init(MachineState *machine)</div><div class=3D"gmail=
_extra">=C2=A0 =C2=A0 =C2=A0BusState *bus;</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 =C2=A0DeviceState *carddev;</div><div class=3D"gmail_extra">=
=C2=A0</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 s-&gt;soc.version =3D=
 version;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0object_initia=
lize(&amp;s-&gt;soc, sizeof(s-&gt;soc), TYPE_BCM2836);</div><div class=3D"g=
mail_extra">=C2=A0 =C2=A0 =C2=A0object_property_add_child(OBJECT(machine), =
&quot;soc&quot;, OBJECT(&amp;s-&gt;soc),</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);</div><div class=3D=
"gmail_extra">@@ -137,8 +145,8 @@ static void raspi2_init(MachineState *mac=
hine)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;error_abort);</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;soc), smp_cpus, &qu=
ot;enabled-cpus&quot;,</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;error_abort);</div><div class=3D"gmail_extra">-=C2=A0 =C2=A0=
 object_property_set_int(OBJECT(&amp;s-&gt;soc), 0xa21041, &quot;board-rev&=
quot;,</div><div class=3D"gmail_extra">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_a=
bort);</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 object_property_set_i=
nt(OBJECT(&amp;s-&gt;soc), raspi_boardrev[version],</div><div class=3D"gmai=
l_extra">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;board-rev&quot;, &amp;error_abort)=
;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0object_property_set_b=
ool(OBJECT(&amp;s-&gt;soc), true, &quot;realized&quot;, &amp;error_abort);<=
/div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0/* Create and plug in the SD cards */</div><div class=3D"g=
mail_extra">@@ -155,7 +163,12 @@ static void raspi2_init(MachineState *mach=
ine)</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_extra"=
>=C2=A0 =C2=A0 =C2=A0vcram_size =3D object_property_get_uint(OBJECT(&amp;s-=
&gt;soc), &quot;vcram-size&quot;,</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;error_abort);</div><div class=3D"gmail_extra">-=C2=A0 =C2=A0 setup_boot(=
machine, 2, machine-&gt;ram_size - vcram_size);</div><div class=3D"gmail_ex=
tra">+=C2=A0 =C2=A0 setup_boot(machine, version, machine-&gt;ram_size - vcr=
am_size);</div><div class=3D"gmail_extra">+}</div><div class=3D"gmail_extra=
">+</div><div class=3D"gmail_extra">+static void raspi2_init(MachineState *=
machine)</div><div class=3D"gmail_extra">+{</div><div class=3D"gmail_extra"=
>+=C2=A0 =C2=A0 raspi_init(machine, 2);</div><div class=3D"gmail_extra">=C2=
=A0}</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"gmail_extra"=
>=C2=A0static void raspi2_machine_init(MachineClass *mc)</div><div class=3D=
"gmail_extra">@@ -171,3 +184,22 @@ static void raspi2_machine_init(MachineC=
lass *mc)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0mc-&gt;ignore=
_memory_transaction_failures =3D true;</div><div class=3D"gmail_extra">=C2=
=A0};</div><div class=3D"gmail_extra">=C2=A0DEFINE_MACHINE(&quot;raspi2&quo=
t;, raspi2_machine_init)</div><div class=3D"gmail_extra">+</div><div class=
=3D"gmail_extra">+static void raspi3_init(MachineState *machine)</div><div =
class=3D"gmail_extra">+{</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 ras=
pi_init(machine, 3);</div><div class=3D"gmail_extra">+}</div><div class=3D"=
gmail_extra">+</div><div class=3D"gmail_extra">+static void raspi3_machine_=
init(MachineClass *mc)</div><div class=3D"gmail_extra">+{</div><div class=
=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Raspberry Pi 3&quot;;=
</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;init =3D raspi3_init=
;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;block_default_type =
=3D IF_SD;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;no_paralle=
l =3D 1;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;no_floppy =
=3D 1;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;no_cdrom =3D 1=
;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;max_cpus =3D BCM283=
6_NCPUS;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0 mc-&gt;default_ram_=
size =3D 1024 * 1024 * 1024;</div><div class=3D"gmail_extra">+=C2=A0 =C2=A0=
 mc-&gt;ignore_memory_transaction_failures =3D true;</div><div class=3D"gma=
il_extra">+};</div><div class=3D"gmail_extra">+DEFINE_MACHINE(&quot;raspi3&=
quot;, raspi3_machine_init)</div><div class=3D"gmail_extra">diff --git a/in=
clude/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h</div><div class=3D"gmail_=
extra">index 76de199..3c538f6 100644</div><div class=3D"gmail_extra">--- a/=
include/hw/arm/bcm2836.h</div><div class=3D"gmail_extra">+++ b/include/hw/a=
rm/bcm2836.h</div><div class=3D"gmail_extra">@@ -26,6 +26,7 @@ typedef stru=
ct BCM2836State {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0/*&lt=
; public &gt;*/</div><div class=3D"gmail_extra">=C2=A0</div><div class=3D"g=
mail_extra">=C2=A0 =C2=A0 =C2=A0uint32_t enabled_cpus;</div><div class=3D"g=
mail_extra">+=C2=A0 =C2=A0 uint version;</div><div class=3D"gmail_extra">=
=C2=A0</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0ARMCPU cpus[BCM2=
836_NCPUS];</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0BCM2836Cont=
rolState control;</div><div class=3D"gmail_extra">--=C2=A0</div><div class=
=3D"gmail_extra">2.14.2</div><div class=3D"gmail_extra"><br></div></div><di=
v class=3D"gmail_extra"><br></div></div>

--089e08236e40bce282055c4d75b2--
