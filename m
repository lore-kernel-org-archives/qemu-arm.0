Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6646724wrt;
        Mon, 3 Dec 2018 03:04:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W4Z47PTjTP18jmrSCBl6Xef1SfrM8zWvt4OPHpxXxArysuSwVRkVLHy0NriMgu2P2u8xHq
X-Received: by 2002:a25:b814:: with SMTP id v20-v6mr14481531ybj.228.1543835085785;
        Mon, 03 Dec 2018 03:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835085; cv=none;
        d=google.com; s=arc-20160816;
        b=Nu87Gy+PiKjYG2mfwAiwBr9bbjsosPmOaW96v8Z/CqmOQuPSHktF8/HKKWygUTVY2c
         OJ1bsA74AvYo+cJsMcLXvJH/HlP+Tik6gBZ6Utws4Xdo5xMOgxPdwjx6+wfWMT4hdqxW
         AQqKbcd2foC1ft/vxAe3rqK2Bz6lloQBq7MyEXDEkO7g+IDY7JsQfOmvWt09Kxgc2NAk
         FB88a7zInApCK4kDYR5N54lkUXgWoUQf+sOxQiF90pDvcJPcrpAVZU9ECy6gkKQnOtIE
         EsVn+jnD7uGie6PGWKI78S7wymRrzAE5vChprmebov9BDtzkzm7YpTHjvyYZzzT2e8tJ
         IsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=lTvlSwtxuY5iA4MRjb3OkAknA1gMgukB8zNzJfQ0TMA=;
        b=EwOCaGZN9wwWIQNJ/8bf2iL+IwPXXMltYuVHiQuot7o9/MhfWFCvsEsIJm2jmzEbWj
         w7Ld0gPvjAHUozBzuIOfwypA6Fa4j409sppM2zzQjq1HvE6ASXXbgd9SRpUeJ6KGIqaZ
         ohdsbXYLnyW9iwsiV8Tw22C5Pdo10h4acBeLciWGaUwJilLTrV+Ef9mqCQ7xLFlgO0Ww
         iBwOyDsriwmo6HamRHFo7uojGaiFcg1HG+9HHB1c1qeEHWwTXm1pyYt4olRWeu/FmlOJ
         4O2iCfykUdMBY+3pvihOJlHJ1neNXq5tIdE/vFv8uZZ6HkNi9KGCLDn2FUY+ZuIbXI+U
         ODCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6-v6si7521722ybi.116.2018.12.03.03.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm1t-00046f-57
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:04:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1f-00045V-AA
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1d-0002bG-8O
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:31 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:21106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1c-0002Vh-Rs; Mon, 03 Dec 2018 06:04:29 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 06E6613392A868DECE5E;
	Mon,  3 Dec 2018 19:04:23 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B4CPF097927;
	Mon, 3 Dec 2018 19:04:12 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319042060-14451331 ;
	Mon, 3 Dec 2018 19:04:20 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:47 +0800
Message-Id: <1543865209-50994-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:20,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:12,
	Serialize complete at 2018-12-03 19:04:12
X-MAIL: mse01.zte.com.cn wB3B4CPF097927
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V11 6/8] hw/arm/virt: add configure interface for
 pvpanic-mmio
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P5Ec+ETaSOd4

Add configure interface for pvpanic-mmio device in virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a4541fa..fdd3f20 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1655,6 +1655,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_pvpanic(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->pvpanic;
+}
+
+static void virt_set_pvpanic(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->pvpanic = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1884,6 +1898,15 @@ static void virt_3_1_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    /* Default disallows pvpanic-mmio instantiation */
+    vms->pvpanic = false;
+    object_property_add_bool(obj, "pvpanic", virt_get_pvpanic,
+                             virt_set_pvpanic, NULL);
+    object_property_set_description(obj, "pvpanic",
+                                    "Set on/off to enable/disable "
+                                    "PVPANIC MMIO device",
+                                    NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 937c124..7d6d1c0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -113,6 +113,7 @@ typedef struct {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool pvpanic;
     bool virt;
     int32_t gic_version;
     VirtIOMMUType iommu;
-- 
1.8.3.1

