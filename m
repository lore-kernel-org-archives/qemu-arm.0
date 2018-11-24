Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3054174wrt;
        Sat, 24 Nov 2018 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UrYBqJF6r0aVmd/0QQ9XCjT3CaTpmVSH4hezd19BsNzUO8mebnkxL7FeWpfAKUnjVYHeR7
X-Received: by 2002:a25:7e46:: with SMTP id z67-v6mr19284973ybc.90.1543048146584;
        Sat, 24 Nov 2018 00:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048146; cv=none;
        d=google.com; s=arc-20160816;
        b=tD+DpYI/lYv2IWgThWIF38RcAxhJr/s0Mzpf8bFkWw/zTNSvpkdTjt8FETfoJ6X3iS
         qgKB0g+ykym4/CRROQDa/y9NBgh/hU2CoNcH5DK17FmEBnYLlK4CzOrE6/+nZL7if5ER
         vH+zLHdG55M9hnnI9K6q7+TANsfLYRHO8DDObbWDngc25nFWgbMjG9CG3+rKJdaSsIcw
         ZGRNqyWQxus+eT4G/lnRtSfXQ3xPGx35zm+ky5w12B/T1/k3TzPH+Rqn4WlSLQrOCJHq
         Dt0htDMgKvy+EPyqN9Jm9iN2Df59ZDGG/haMzazxmn3yvELxgJ6QaF931HFrv4sMLM6S
         rBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=RyjwoAET1gPQz1fa1CGhEy41cBZ8V102TlFCFSVWlww=;
        b=Df9r4lspa8caoMFdMtHzlBFYv1ghu3q4I5WsBXU3lOAfJiES+FOCP74zQgIFviJJq/
         5sdn8J8RzwuY7Q3u+T/v6D0o/Q3gle1VKk8OK3DQB+l3aapEUZfxQ0K+0Wvy35yYiX/9
         apLZDOvxKuJMs8OE+DxUQ6E//TPxTSBx9yc0py+dXb8lKPBuOo3fL0vEGrp+rZG/27qQ
         2wbRLvWyXlWdxEjznGRQ1jrnN4gvcn5goldZCxThxA9sXoJRmEupSZaM8eXgbxaj/dK5
         pbK2oXDoeduIbh/JEGEL1ZSfxmlhxQebFGI5U+aH+pii1uSVUAbQ52yRgfkqHJTQ+Pt3
         gJrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x131si17699166ywd.27.2018.11.24.00.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:29:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTJK-0007nq-1Y
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:29:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAt-0008It-Pq
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT44-0005iF-2z
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:56142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT40-0005ES-Fy; Sat, 24 Nov 2018 03:13:16 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id E916C7B32ABDB20105E0;
	Sat, 24 Nov 2018 16:13:06 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8D2oj023478;
	Sat, 24 Nov 2018 16:13:02 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416134599-12697213 ;
	Sat, 24 Nov 2018 16:13:45 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:31 +0800
Message-Id: <1543077273-16201-8-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:46,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:42,
	Serialize complete at 2018-11-24 16:12:42
X-MAIL: mse01.zte.com.cn wAO8D2oj023478
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-devel] [PATCH 08/10] hw/misc/pvpanic: preparing for adding
 configure interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6kSrSPvi8KZ6

Prepare for pvpanic-mmio configure interface.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/sysbus-fdt.c       | 2 ++
 hw/arm/virt.c             | 1 +
 hw/misc/pvpanic.c         | 7 +++++++
 include/hw/misc/pvpanic.h | 2 +-
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index ad698d4..34577f3 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -38,6 +38,7 @@
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
 #include "hw/arm/fdt.h"
+#include "hw/misc/pvpanic.h"
 
 /*
  * internal struct that contains the information to create dynamic
@@ -459,6 +460,7 @@ static const BindingEntry bindings[] = {
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING(TYPE_PVPANIC_MMIO, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 899131a..921220a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1785,6 +1785,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PVPANIC_MMIO);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index aaa8b0c..6fea162 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -121,10 +121,17 @@ static void pvpanic_mmio_initfn(Object *obj)
     sysbus_init_mmio(sbd, &s->mr);
 }
 
+static Property pvpanic_mmio_properties[] = {
+    DEFINE_PROP_UINT32("mmio", PVPanicMMIOState, base, 0x09070000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
+    dc->props = pvpanic_mmio_properties;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 1f20775..e733e1e 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -37,7 +37,7 @@ typedef struct PVPanicISAState {
 typedef struct PVPanicMMIOState {
     SysBusDevice parent_obj;
     /*<private>*/
-
+    uint32_t base;
     /* public */
     MemoryRegion mr;
 } PVPanicMMIOState;
-- 
1.8.3.1

