Received: by 10.28.71.27 with SMTP id u27csp952299wma;
        Fri, 19 Jan 2018 08:42:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBovoMbRolGQ6eFdKgNfV9QNy33WGqJC+H5+xOUeBiIp/ipN4IGSzpG4jrZ8aVmWcSdfvnYm/
X-Received: by 10.37.50.194 with SMTP id y185mr22438712yby.417.1516380175041;
        Fri, 19 Jan 2018 08:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516380175; cv=none;
        d=google.com; s=arc-20160816;
        b=oHQd858HqbVRrwzbbQPGO0pDysl5OT3ZMtSi6UjwndGfHNsBlvQ6EBnv2sxjOVa03x
         620+zslSIMnIBoN4X1oQ2itSkZ+OtLzDGn2UcUQgmTkC9r9Ayn21Nk8scrEHCZUvSvyP
         08qPbD2yNHplzikoH13aq0FlmbHzIsIwh+/2agxSzyItS/nmBLToyH9Xh58rtaGDW4hF
         kBR58i9rsHKpnNU3c6sBVOb2gNblUmUlVDYKMRl13TrYCrqwBwH8HhOiupdBnZtZoLd1
         +d4FIupR3hTGbQHdXtC+daR9mOhcns8qdV4Sn9mEfBaKF6ey86E91fgKxM/1NF5eUyou
         b7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0jyg+n5Bi4/rMwbkZQm1pF0J2FG0uNN29bI+X1n3uYc=;
        b=E7DT7si4okny//5CwY/mBg0GH9JOlKuVFTkE9lGFb8nqwi0q8+od+14F93X5dqK0by
         28jk8s1jWHI2MApnEzswGeO0twV9AnksthT2kmk95/khFcN6NogsxKfYZbwvF4oul5Kb
         sftXIBc+Ww5MzXFWQhlGtTuh+CsP84IFjWlR8VMlP05GDVswZhfHa9iFl9xT4AbvA1U8
         isvrLOlYErDj/lPZGwDZGlTzfcOY9O57CcLu7Rv/87qglAkC6cNANEITIv9jEYfMEy8v
         V/EHsheQxT9Sw99nZvgAPlr/GkIxNpFwGSXS9EIQsmY+O3+XywKyKVHJM1xGyMDXYbRv
         ZJxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k82si652575ybb.810.2018.01.19.08.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 08:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecZkk-0004NV-Cy
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 11:42:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecZcy-0005vi-N4
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 11:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecZcx-0006mI-E4
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 11:34:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ecZcx-0006lB-98; Fri, 19 Jan 2018 11:34:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 769155B2F8;
	Fri, 19 Jan 2018 16:34:50 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 773FF60A9D;
	Fri, 19 Jan 2018 16:34:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 14:33:33 -0200
Message-Id: <20180119163345.10649-8-ehabkost@redhat.com>
In-Reply-To: <20180119163345.10649-1-ehabkost@redhat.com>
References: <20180119163345.10649-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 19 Jan 2018 16:34:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 07/19] hw/arm/virt: Allow only supported
 dynamic sysbus devices
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YrR1iSiy5vfC

Replace the TYPE_SYS_BUS_DEVICE entry in the allowed sysbus
device list with the two device types that are really supported
by the virt machine: vfio-amd-xgbe and vfio-calxeda-xgmac.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20171125151610.20547-3-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7549895fd2..4a6fdcc4f5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -34,6 +34,8 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
+#include "hw/vfio/vfio-calxeda-xgmac.h"
+#include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/block-backend.h"
@@ -1591,8 +1593,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
      * configuration of the particular instance.
      */
     mc->max_cpus = 255;
-    /*TODO: allow only sysbus devices that really work with this machine */
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.14.3

