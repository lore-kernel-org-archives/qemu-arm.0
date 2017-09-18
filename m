Received: by 10.223.172.38 with SMTP id v35csp4253988wrc;
        Mon, 18 Sep 2017 15:12:37 -0700 (PDT)
X-Received: by 10.200.8.225 with SMTP id y30mr51400987qth.233.1505772757620;
        Mon, 18 Sep 2017 15:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505772757; cv=none;
        d=google.com; s=arc-20160816;
        b=N8N4rCXa1Zzj3UtvCrmkf0lvOPZRPKiTVkv/TAGgFIu5o4DtmCbh7MPP3LdVWPikeo
         DerdIPRq7cCfaa+TDCwHVF9T5/VdU4iJucoIxahVxXiCP0nXnlYGLm7iUahIFyWCjJo9
         wtIUcDLYrtVrA5LkvrGQsf0x66Pc+7Xfhu+cH2UUMKvm75TgR8btHma5+XxhZldnKZta
         S9KHajJ7tHKptQEhnUtQnCGfR/lvgqYjZCPU6EA0jexiqLq8G//foEjajFAC2o7zgl7O
         DOIvsm1Lft+45vdX+m7bwONwRFiWayXDxK8ZCC2j96DA3/6Y1fzFanmNyrjjUAOcXecY
         ZvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=j3SemFttz/fP/BSEkWT3MeAAWs3qR7tZGNKqEagS+/s=;
        b=OTWav3TJWsrK/UP7UQAHz4kXGDfIYJPZ4HHb3SIlwHuBbXYZX7rzY7fTr15DZ0EU7R
         4ObAsuppn5wNuPnp/ur09aDNxfr+O/0NQbn+iRWgNskEkhZFG6hQM8xuF2F0nlDsIoyw
         g4FTp0Qlz8cAl1cA0wCu96iGneLq93x0g9N/Vk3QzzuL4g+9mt5rV2jblM+elIJYrAjC
         AnphxYUOpWkeULH1ZUhAS9P2jA4zsS9beJB12YLRJXZYw/ne3ZwA305r5qc2k+A7cS8j
         9JQcKtzVkOwZ35KXMtyXo/JsZDw8qcHwRYP1FcxdwG2DxiyQwePDdITS3Rj71rbz8NTd
         2NRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mPp1CORk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f192si7839876qke.177.2017.09.18.15.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 15:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mPp1CORk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du4HL-0007Ta-Co
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 18:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4GU-000711-8x
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 18:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4GQ-0006Wm-Pc
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 18:11:42 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4GQ-0006We-Jt; Mon, 18 Sep 2017 18:11:38 -0400
Received: by mail-qt0-x243.google.com with SMTP id q8so1254271qtb.1;
	Mon, 18 Sep 2017 15:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j3SemFttz/fP/BSEkWT3MeAAWs3qR7tZGNKqEagS+/s=;
	b=mPp1CORk3fwOR8RFWuNjcvwGYjWDuNhZZFHbVR7aiBoiZ28pQOo/XDOvk3TropE4OE
	WZykck/WCZjxmgjdBMFO50ns2HI8m+n4tw3Ed6z2Psnf/HDfsnz/6X4cKGFIKjwHRrN6
	zNv6IsWIAZ5HWU5WuPogMF/2Q4Rm7zR9pFS95H1nH/ca0b5GskRCU8Pg897DlJ3UDwm1
	gMA3ah1RhFYTuEAbZe7kfwxqRsivWmNyg2JtXR7jhfCsgZBuZImeRqMB+zldsloOzX23
	Mq3gUWYhyYUAeorkZ5PxHRMI+Fw2DCdtdC1w/J186KYCOTyMep+1mcKr5RB+tg/1rqUi
	+0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=j3SemFttz/fP/BSEkWT3MeAAWs3qR7tZGNKqEagS+/s=;
	b=HCIoiXAZh/fd0xF5D8az+KeueiulUf7SwnxrC6EDyYFxgNTSDUFOnoOmuRB0MFnmVQ
	0j9b+Yr7qxOi1fsQ3d90mzEC/VmVOEiLqzryCuTewXUOebZV4gnI3Qf7GN79vu41ojpK
	OS52sMMxdC+5qeTw1Xp4oqo6IjgzIo3Ew+vX7CDAnJkEXYlUt/ohADoWqwh/knGkj8+R
	G6AMYUTFGNbeY/pn6DiU02nUDdrnihTJH/D6qpsvy53cPxm3OJm977ChLtD/pUhEutVV
	U2vG1qDRKc4grqKwMnaqBBENDtxvUdDxdWNb82DKTpTYO17/447Xii6dfmTlM99UOLO0
	jGqw==
X-Gm-Message-State: AHPjjUhddP/BZsZm+3C4s8r8JQEwikva7na/xi3AKJIfG/3sP+Xc0rcf
	3YsX5urAsY9285K9pTiWXA==
X-Google-Smtp-Source: AOwi7QAvV/hiqGe5FHMtPhrTclILL1bwR4UafOi98UvJ9CJFMfjb1zSF2Xov2hQaOH2u4/2dxurdfg==
X-Received: by 10.200.6.141 with SMTP id f13mr15629440qth.328.1505772698129;
	Mon, 18 Sep 2017 15:11:38 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	c185sm5707466qke.60.2017.09.18.15.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 15:11:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 19:11:24 -0300
Message-Id: <20170918221124.17159-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH] msf2: drop cpu_model to directly use cpu type
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
Cc: qemu-arm@nongnu.org, Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 78OkNPYXwdAX

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
after Igor comment:
http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg04709.html

Fam: I'm trying your patchew "apply over series" feature on these 2 series,
     hoping they get both applied before my patch:

Based-on: 1505318697-77161-6-git-send-email-imammedo@redhat.com
Based-on: 1505762601-27143-6-git-send-email-sundeep.lkml@gmail.com

 include/hw/arm/msf2-soc.h |  1 +
 hw/arm/msf2-soc.c         |  3 ++-
 hw/arm/msf2-som.c         | 11 +++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index afea23db38..3cfe5c76ee 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -50,6 +50,7 @@ typedef struct MSF2State {
 
     ARMv7MState armv7m;
 
+    char *cpu_type;
     char *part_name;
     uint64_t envm_size;
     uint64_t esram_size;
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index abba3d888b..6f97fa9fe3 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -111,7 +111,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
-    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
+    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
@@ -201,6 +201,7 @@ static Property m2sxxx_soc_properties[] = {
      * part name specifies the type of SmartFusion2 device variant(this
      * property is for information purpose only.
      */
+    DEFINE_PROP_STRING("cpu-type", MSF2State, cpu_type),
     DEFINE_PROP_STRING("part-name", MSF2State, part_name),
     DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_MAX_SIZE),
     DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index d3956965ab..0795a3a3a1 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -24,11 +24,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
 #include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
+#include "cpu.h"
 
 #define DDR_BASE_ADDRESS      0xA0000000
 #define DDR_SIZE              (64 * M_BYTE)
@@ -41,18 +43,26 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     DeviceState *dev;
     DeviceState *spi_flash;
     MSF2State *soc;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     DriveInfo *dinfo = drive_get_next(IF_MTD);
     qemu_irq cs_line;
     SSIBus *spi_bus;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ddr = g_new(MemoryRegion, 1);
 
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
+        error_report("This board can only be used with CPU %s",
+                     mc->default_cpu_type);
+    }
+
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
                            &error_fatal);
     memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
 
     dev = qdev_create(NULL, TYPE_MSF2_SOC);
     qdev_prop_set_string(dev, "part-name", "M2S010");
+    qdev_prop_set_string(dev, "cpu-type", mc->default_cpu_type);
+
     qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
     qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
 
@@ -89,6 +99,7 @@ static void emcraft_sf2_machine_init(MachineClass *mc)
 {
     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
     mc->init = emcraft_sf2_s2s010_init;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
 }
 
 DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.14.1

