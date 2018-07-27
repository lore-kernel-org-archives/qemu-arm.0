Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp777933wru;
        Fri, 27 Jul 2018 07:38:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpebaR8gsY+jrfxjzYecx97x4KEfrUIMsI7R24ous7ugzMtuVqebQ10YgjPIlvH5KRp+7rP3
X-Received: by 2002:ac8:1a90:: with SMTP id x16-v6mr6052493qtj.160.1532702307758;
        Fri, 27 Jul 2018 07:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702307; cv=none;
        d=google.com; s=arc-20160816;
        b=mH2m1OUWlWaB8+GIFF8d70jj/YUr/mK2A8R59CuCfJS1IRP8aMDrVNEl7CtBaXWDM4
         hp0wRowvF6HDaTAUAYhUpJN1V9T7Jc3AYYstKrMFU8z/8Rhxwd7svNfoGjO2+4MBVIkF
         m/ka4GkdTKhizw2PG3KCiPbNTQ9tH/KnfKO5hRMpVhgL65h2r7dCV4BjHggDLrLQLUTI
         u6ueFjUfzUhhvqy8VZmUDIpoxG+oZwkW4wSfW8RcZ4UskdFqC/MGo2SnXSlv8gQPui5k
         o3P35WtRkHiJBOr0MFN7MTMuDzIHstc66rqn8DnB+nwctISdvqrmxSDrqC9703B8Q8zC
         jo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=YDXuoPKcEP0hISRT2+kBTGfetMteSvcADGx4q7+GD28=;
        b=pA2WJR8F7h191lOuJ1RqRiPsqUKBInVNBHwY3/iMXRmkdsJd2NY4vTDR8Q1/OUJDjB
         3f7CSVZ49GQeaHsL8wPpS1yNonGOFakrVK2w1uvk+VLu5c8Nwd+69N3EyTAXe4lD/R4c
         HAUJb79eHXpXDP4iuM4LP0qy65s+wuzE/jDn+drDAr8PUKAwka/sV4SR9qw81uiX4uQA
         JH+eFypBGEIXCvvCIM1b5Zy78UWwY5DsZyitrLtP0JV7DAlNkTH8pRoHwZY9PXsdG6mp
         B26FqrECdBMZiMN8gnY7DOwKDzREe/kdIMSGri32VWC/eud7pzOFZaNwyNIr6WnJnmVU
         KFLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4BrV7Lj4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NdNCrU8w;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NdNCrU8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10-v6si2599058qvn.266.2018.07.27.07.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4BrV7Lj4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NdNCrU8w;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NdNCrU8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3sx-0003Ga-5q
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sH-0003F8-GU
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sG-0008IN-EZ
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:45 -0400
Received: from greensocs.com ([193.104.36.180]:50603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sB-0008AZ-GM; Fri, 27 Jul 2018 10:37:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AD592428994;
	Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=LGDNDsuRp4qjQNaH95Al+G0mu5NCl3tzJ7GidKARFAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4BrV7Lj43D6iSISUgq2dEmXbyhQsu5n6qXg+eNx8z26qYAcPuJ6zGocx4b/Vykh5h
	dgRKsy9JAjKvnN+4iKQfElTPL2bKJkAXvlNNhxue5dgnsTG5UDi2P+jiGWO5/KyqYm
	LF4bupL+M90rnwxAC3oevmvW18mITltQNDWKNp+g=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NdNCrU8w;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NdNCrU8w
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNZQXAzkuP4F; Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CDEC64434B9; Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=LGDNDsuRp4qjQNaH95Al+G0mu5NCl3tzJ7GidKARFAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NdNCrU8wCoxsgDEuV+l+RUkKqcepA0YyGmZ6XwPFnMK45+HQGNi32DLwIsAe5h1nP
	oNPkCqylF0hQ+UumaX0Nvx2frtVLLmbK9pASpzqyb8W2ImDMUpitosLtO7mA/jKlhk
	4eCdf5rFJ373Mv7wIQR8mxbfNyqgABpeJvIg0UGY=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 56F1C42899A;
	Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702250;
	bh=LGDNDsuRp4qjQNaH95Al+G0mu5NCl3tzJ7GidKARFAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NdNCrU8wCoxsgDEuV+l+RUkKqcepA0YyGmZ6XwPFnMK45+HQGNi32DLwIsAe5h1nP
	oNPkCqylF0hQ+UumaX0Nvx2frtVLLmbK9pASpzqyb8W2ImDMUpitosLtO7mA/jKlhk
	4eCdf5rFJ373Mv7wIQR8mxbfNyqgABpeJvIg0UGY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:22 +0200
Message-Id: <09041c553fbe1d78bf282513bffdb981e7a1d201.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 3/6] sysbus: Specialize gating_update to
 enable/disable memory regions
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wo8cCRt22tbb

The default methods are overriden to add the activation/deactivation
of the memory regions according to the gating state: Regions are
enabled only when powered and clocked.
As powering-up triggers a reset call, memory regions should
be reset in specialized sysbus devices.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/sysbus.h |  3 +++
 hw/core/sysbus.c    | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 0b59a3b8d6..e17165e78f 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -59,6 +59,9 @@ typedef struct SysBusDeviceClass {
      */
     char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
     void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
+
+    DeviceGatingUpdate parent_power_update;
+    DeviceGatingUpdate parent_clock_update;
 } SysBusDeviceClass;
 
 struct SysBusDevice {
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 3c8e53b188..4a2dfbe907 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -325,6 +325,39 @@ MemoryRegion *sysbus_address_space(SysBusDevice *dev)
     return get_system_memory();
 }
 
+/*
+ * Action take on power or clock update.
+ */
+static void sysbus_device_gating_update(DeviceState *dev)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    int i;
+
+    for (i = 0;; i++) {
+        MemoryRegion *mr = sysbus_mmio_get_region(sbd, i);
+        if (!mr) {
+            break;
+        }
+        memory_region_set_enabled(mr, dev->powered && dev->clocked);
+    }
+}
+
+/*
+ * Action take on power update.
+ *
+ * Call parent method before doing local action.
+ * So that we override any action taken in parent method (eg if reset
+ * is called due to leaving OFF state)
+ */
+static void sysbus_device_power_update(DeviceState *dev)
+{
+    SysBusDeviceClass *sbdk = SYS_BUS_DEVICE_GET_CLASS(dev);
+
+    sbdk->parent_power_update(dev);
+
+    sysbus_device_gating_update(dev);
+}
+
 static void sysbus_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
@@ -341,6 +374,12 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
      * subclass needs to override it and set user_creatable=true.
      */
     k->user_creatable = false;
+
+    SysBusDeviceClass *sbdk = SYS_BUS_DEVICE_CLASS(klass);
+    device_class_set_parent_power_update(k,
+            sysbus_device_power_update, &sbdk->parent_power_update);
+    device_class_set_parent_clock_update(k,
+            sysbus_device_gating_update, &sbdk->parent_clock_update);
 }
 
 static const TypeInfo sysbus_device_type_info = {
-- 
2.18.0

