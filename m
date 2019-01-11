Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp194859wrt;
        Fri, 11 Jan 2019 06:23:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5zZYk1shoJsYqGhti4iq89aLxLJ/Xt5j6yi7qg+5dwP+c/L5fhpy7nMJSkyONy/76VIb4s
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr2641906wmf.32.1547216614917;
        Fri, 11 Jan 2019 06:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216614; cv=none;
        d=google.com; s=arc-20160816;
        b=z1eSrwoNoxBBI2vxpgLjnvAwXBFe2GWLUWB5x72ftDBY3YsjqyDTsloEGYQFnrqMW/
         eVRSIcVDn/llNYloq/Q4EqE/xWIidxp8fsFyfk2eZm7MHVOR184YFTl+0DBya1iBnS5L
         asNi/aLodmq35nVBRAFmLsOdUN2lGMFlvCDHp8c6559fT6NXo++K8N+3L7ae3jRBE6ji
         duwX754yANeA6K6HB9YENCqcfXdD9RldBxlNt8GBC+0/ewr6uFgj7JOajX+wXVbnw+ZI
         lqPPHgAzINT60nIiAP7d7dTeTRQx43IgRYmjRQZaJGkyBrWSqki96AphpKRtV8jbFcPS
         xkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+KG/twszNnbdOo6srcykILYIKl/bYOYBhRqozexPO7U=;
        b=RgiJhzljkpmDcWnMaen++OtFl0Iv/VSHwpv4hvyir+9cJHTS/+sxTehMeaZSr3gEUK
         4zgFJ6uEf1AqovmIRc720N9bDOw1yL+RFKXMjWGC1lhDM4oNVOpIWjSKDLuNZ11MqBS/
         hJKx6EeN+wqz4LZS2sxf54jTbPJtg4uQz0tuO3l4r08Eb9pmzNKKU84w6QmofouljKMe
         IWPsVu7iGq+27vR09JuVl1ScYOIRub2DvnhbaFYi+03YCGiOPnJnizenyiUyT7qrDyGa
         qL3TqgARTCzqWj3o0oRUvfzHDb/2HV4/YLbsa17l5ImhUQsCGE4yRnpDhwk2wZqlaCBc
         x+ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w75si13535320wmf.95.2019.01.11.06.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxig-0001iq-0P
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe2-0005j5-9x
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxW9-0003KX-1k
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:10:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxW6-0002eh-Qu; Fri, 11 Jan 2019 09:10:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6E2664100;
	Fri, 11 Jan 2019 14:10:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D41795D739;
	Fri, 11 Jan 2019 14:10:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:47 +0100
Message-Id: <20190111140857.4211-6-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Jan 2019 14:10:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 05/15] hw/nvram/fw_cfg: Remove various typedefs
 from "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SOwInh/BZvc+

There are only three files requiring these typedefs, let them
include "hw/nvram/fw_cfg.h" directly to simplify "qemu/typedefs.h".

To clean "qemu/typedefs.h", move the forward declarations
to "hw/nvram/fw_cfg.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/acpi/vmgenid.h | 1 +
 include/hw/arm/virt.h     | 1 +
 include/hw/mem/nvdimm.h   | 1 +
 include/hw/nvram/fw_cfg.h | 8 +++++++-
 include/qemu/typedefs.h   | 4 ----
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index 38586ecbdf..be53de38f1 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -3,6 +3,7 @@
=20
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/qdev.h"
+#include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
=20
 #define VMGENID_DEVICE           "vmgenid"
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..fef632dcf5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "hw/nvram/fw_cfg.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
=20
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c5c9b3c7f8..51d3a52c4b 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -24,6 +24,7 @@
 #define QEMU_NVDIMM_H
=20
 #include "hw/mem/pc-dimm.h"
+#include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
=20
 #define NVDIMM_DEBUG 0
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index f5a6895a74..244ed78afa 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -14,7 +14,9 @@
 #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG_I=
O)
 #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG_M=
EM)
=20
-typedef struct fw_cfg_file FWCfgFile;
+typedef struct FWCfgState FWCfgState;
+typedef struct FWCfgIoState FWCfgIoState;
+typedef struct FWCfgMemState FWCfgMemState;
=20
 #define FW_CFG_ORDER_OVERRIDE_VGA    70
 #define FW_CFG_ORDER_OVERRIDE_NIC    80
@@ -24,6 +26,8 @@ typedef struct fw_cfg_file FWCfgFile;
 void fw_cfg_set_order_override(FWCfgState *fw_cfg, int order);
 void fw_cfg_reset_order_override(FWCfgState *fw_cfg);
=20
+typedef struct fw_cfg_file FWCfgFile;
+
 typedef struct FWCfgFiles {
     uint32_t  count;
     FWCfgFile f[];
@@ -34,6 +38,8 @@ typedef struct fw_cfg_dma_access FWCfgDmaAccess;
 typedef void (*FWCfgCallback)(void *opaque);
 typedef void (*FWCfgWriteCallback)(void *opaque, off_t start, size_t len=
);
=20
+typedef struct FWCfgEntry FWCfgEntry;
+
 struct FWCfgState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3a5ca74bd3..1c294c296c 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -31,10 +31,6 @@ typedef struct DriveInfo DriveInfo;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
 typedef struct FlatView FlatView;
-typedef struct FWCfgEntry FWCfgEntry;
-typedef struct FWCfgIoState FWCfgIoState;
-typedef struct FWCfgMemState FWCfgMemState;
-typedef struct FWCfgState FWCfgState;
 typedef struct HCIInfo HCIInfo;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
--=20
2.17.2

