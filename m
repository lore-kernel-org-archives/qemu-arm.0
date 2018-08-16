Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1758018wru;
        Thu, 16 Aug 2018 04:56:50 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz3HhnuWFVo/GNH8T3LohPOkUS7WUIud9zui1T8BnJ0l5JN1Ut3aGbaTjhIxhRtup6wau1z
X-Received: by 2002:ac8:6757:: with SMTP id n23-v6mr28714179qtp.309.1534420610520;
        Thu, 16 Aug 2018 04:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534420610; cv=none;
        d=google.com; s=arc-20160816;
        b=iAHw3DC7HpfydqbF4L/uzWFzchUPtMENJIyiGjNHY0h2Y0kd4f3qAEXtALImW8aUlH
         oB9K2WzrSKm4aA5jstEtyLeHqxe7nyROXOaazCt4LpQJfran22np8G6hvrTSFHeMcpEu
         wGxk0alau/cy3I2OrnRaElrXToyu8VeNfORKohI6wG9qnF7qO0wuN7K6WoZwIbAVfUTO
         Nu20hvnQh5LHe7Wyz0+KICp7yPf/Pn4uVRP/Cw1/l3OvXFRe9fPaLwBbkGa/TIigINvL
         edIAYWx4kgNdm6Kq1v6PDXJuTXnJB9Asz+Zv2/0Dhh+oueDrtFn8UywvwdAFSgpz6qxV
         Li8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=WOgLH3LtMsoc7k/i9bslcd2+476OcotxUKWn2sviM4U=;
        b=D6ztiFgafDmXjHxUiyqjP0XT4vM8EIqKMXDtZFwaWF2X/1YL2AwSpAany/cjwWff9q
         E9BnG1b6NmGEPnAt9J0MTf15BboqGiPX5G5pJRrM/o6Ma4uWWHRcHA/VEFGMeDaoexTr
         JMvD4gRHPbpM+/WRLVXhzh3rLUATF6ypOM1KzihQMgaawexgw1CsT/4UlTyDw//OXz1x
         hy/3tAFJgAli9USL5YoZxcDGkWjdLFHBt7aYEcnfJ9OPXopFTtzZthoDVaJdWCuQ2n2Y
         DxXZVgmLUDSdaOylq7hvcyj+G6ZF2TCVIjZlCPC3DhsFZzMCMyvn4BlvG3Rs5o0gWLq3
         tJEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e23-v6si19374481qta.54.2018.08.16.04.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 04:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqGtW-0002jj-2T
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 07:56:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fqGtB-0002jC-Li
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 07:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fqGsy-0007tQ-Sc
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 07:56:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35068 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fqGsy-0007tE-GJ; Thu, 16 Aug 2018 07:56:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C97C7A7EE;
	Thu, 16 Aug 2018 11:56:16 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03A802166BA0;
	Thu, 16 Aug 2018 11:56:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 16 Aug 2018 13:56:06 +0200
Message-Id: <1534420566-15799-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 16 Aug 2018 11:56:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 16 Aug 2018 11:56:16 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm/mps2-tz: Replace init_sysbus_child() with
 sysbus_init_child_obj()
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KjbwWY0eRyaF

Now that we've got the common sysbus_init_child_obj() function, we do
not need the local init_sysbus_child() anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/mps2-tz.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 22180c5..dc0f34a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -107,16 +107,6 @@ static void make_ram_alias(MemoryRegion *mr, const char *name,
     memory_region_add_subregion(get_system_memory(), base, mr);
 }
 
-static void init_sysbus_child(Object *parent, const char *childname,
-                              void *child, size_t childsize,
-                              const char *childtype)
-{
-    object_initialize(child, childsize, childtype);
-    object_property_add_child(parent, childname, OBJECT(child), &error_abort);
-    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
-
-}
-
 /* Most of the devices in the AN505 FPGA image sit behind
  * Peripheral Protection Controllers. These data structures
  * define the layout of which devices sit behind which PPCs.
@@ -149,9 +139,9 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
      */
     UnimplementedDeviceState *uds = opaque;
 
-    init_sysbus_child(OBJECT(mms), name, uds,
-                      sizeof(UnimplementedDeviceState),
-                      TYPE_UNIMPLEMENTED_DEVICE);
+    sysbus_init_child_obj(OBJECT(mms), name, uds,
+                          sizeof(UnimplementedDeviceState),
+                          TYPE_UNIMPLEMENTED_DEVICE);
     qdev_prop_set_string(DEVICE(uds), "name", name);
     qdev_prop_set_uint64(DEVICE(uds), "size", size);
     object_property_set_bool(OBJECT(uds), true, "realized", &error_fatal);
@@ -170,8 +160,8 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     DeviceState *iotkitdev = DEVICE(&mms->iotkit);
     DeviceState *orgate_dev = DEVICE(&mms->uart_irq_orgate);
 
-    init_sysbus_child(OBJECT(mms), name, uart,
-                      sizeof(mms->uart[0]), TYPE_CMSDK_APB_UART);
+    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(mms->uart[0]),
+                          TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", SYSCLK_FRQ);
     object_property_set_bool(OBJECT(uart), true, "realized", &error_fatal);
@@ -248,8 +238,8 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
 
     memory_region_init_ram(ssram, NULL, name, ramsize[i], &error_fatal);
 
-    init_sysbus_child(OBJECT(mms), mpcname, mpc,
-                      sizeof(mms->ssram_mpc[0]), TYPE_TZ_MPC);
+    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(mms->ssram_mpc[0]),
+                          TYPE_TZ_MPC);
     object_property_set_link(OBJECT(mpc), OBJECT(ssram),
                              "downstream", &error_fatal);
     object_property_set_bool(OBJECT(mpc), true, "realized", &error_fatal);
@@ -288,8 +278,8 @@ static void mps2tz_common_init(MachineState *machine)
         exit(1);
     }
 
-    init_sysbus_child(OBJECT(machine), "iotkit", &mms->iotkit,
-                      sizeof(mms->iotkit), TYPE_IOTKIT);
+    sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
+                          sizeof(mms->iotkit), TYPE_IOTKIT);
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), OBJECT(system_memory),
                              "memory", &error_abort);
@@ -421,8 +411,8 @@ static void mps2tz_common_init(MachineState *machine)
         int port;
         char *gpioname;
 
-        init_sysbus_child(OBJECT(machine), ppcinfo->name, ppc,
-                          sizeof(TZPPC), TYPE_TZ_PPC);
+        sysbus_init_child_obj(OBJECT(machine), ppcinfo->name, ppc,
+                              sizeof(TZPPC), TYPE_TZ_PPC);
         ppcdev = DEVICE(ppc);
 
         for (port = 0; port < TZ_NUM_PORTS; port++) {
-- 
1.8.3.1

