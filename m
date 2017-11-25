Received: by 10.223.159.82 with SMTP id f18csp3360999wrg;
        Sat, 25 Nov 2017 07:18:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZwzO8gGZ4sEVf0Cbp31eqzQfuinujxHUnh43L5dysEBVvNwf3vlkej+DzpNSlOOJs4Pamo
X-Received: by 10.37.194.199 with SMTP id s190mr4510509ybf.86.1511623135914;
        Sat, 25 Nov 2017 07:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511623135; cv=none;
        d=google.com; s=arc-20160816;
        b=oyLLWY9pbZls1JfTNJCihAnGksG74Ln0NX293lMiVG1tbXt29czlOl4j+Emrh2YkEK
         QDZ/nz0jONekubB1PQgBrNSdQcT+jgenV9x7KygnTSPENNhOb02nm0VJImHLtyxdflnh
         UES7qn8c3YSN7VMMtx62Qb8DR0smGN1e3IZMA0wmTK9oKQE6Qmu/ZcNbcOczjffk2LNu
         wZoMrLY809SCCo5eOVi15dXj62/3/5wJ8v9hLMqcqShoTVv0/1bLEK6/iWEhipDhuHkx
         X/z70RH/Sexcr0zbUHHzQhDHawxJ5bjTaaaPoNmlRxRQZ7Rgq+oPO6TUwJ1K5YzKx1jT
         fBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=W2ursjvwbSa0ynVLzP0TS/wWKuqkIc/IwrDQ+EZflqY=;
        b=ca4Tz/SMhpqbypQBkeB3Ou9ZpZrnrd4WFc5eD6Z/TK+e9XCu54qumCsycylM9RQy5r
         I0elh+7/NxF34K2YGpneR73pjhtfpPNfvBCJbSla7FZVMuOSZoAy2c4hzioluVP/48q+
         fCgohQYsAjlq9BIoXfd/He+dkgf97oFLyT9ZZyom7FANC2nQR3QrXOvm/hxfPl47ORbf
         2+xRBkLYmWmKBShFJgHiK3Bvp1YsTjd5+mvsBaZ7lwWCycs3mmtEGGx01Jpmp2SbfpQ9
         KDvCUeF9A06RAVDHV59aAJZjohAPoB5a/uwJYvIF5gv6rCBdPhjm5TEjDqHmj1ZeVIoZ
         z/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si5076279ybd.78.2017.11.25.07.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Nov 2017 07:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIcEJ-0007Ji-BT
	for alex.bennee@linaro.org; Sat, 25 Nov 2017 10:18:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eIcC2-0005QL-8s
	for qemu-devel@nongnu.org; Sat, 25 Nov 2017 10:16:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eIcC1-00056U-AG
	for qemu-devel@nongnu.org; Sat, 25 Nov 2017 10:16:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eIcBv-00055C-PM; Sat, 25 Nov 2017 10:16:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E56175F73C;
	Sat, 25 Nov 2017 15:16:26 +0000 (UTC)
Received: from localhost (ovpn-116-25.gru2.redhat.com [10.97.116.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3CF460634;
	Sat, 25 Nov 2017 15:16:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 25 Nov 2017 13:16:06 -0200
Message-Id: <20171125151610.20547-3-ehabkost@redhat.com>
In-Reply-To: <20171125151610.20547-1-ehabkost@redhat.com>
References: <20171125151610.20547-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 25 Nov 2017 15:16:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/6] hw/arm/virt: Allow only supported
 dynamic sysbus devices
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
Cc: jgross@suse.com, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, sstabellini@kernel.org,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KyY52nndW4MD

Replace the TYPE_SYS_BUS_DEVICE entry in the allowed sysbus
device list with the two device types that are really supported
by the virt machine: vfio-amd-xgbe and vfio-calxeda-xgmac.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2:
* New patch added to series
---
 hw/arm/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fa6dc15fcd..f267ef0ff5 100644
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
2.13.6

