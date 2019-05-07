Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3359746wrh;
        Tue, 7 May 2019 01:23:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqys4SUBY75bp8jB58PRSJUfrtVZEvHcUIZ+nA8a/eRl7PHBxxC5cvVnKVazee/BE9ETBxu8
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr18736790wmb.94.1557217429607;
        Tue, 07 May 2019 01:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217429; cv=none;
        d=google.com; s=arc-20160816;
        b=Ju67K0w2WbkWY7vyXzY1X8u1NdQlAzsWFz+mK1FxisoRUbfXfQmW8n5tFWY56U75uR
         0NS3PmpOV5qdPh/qhJcKr4VWdnD5CweehFbjKBMoru2EY2Nvd4SnMZaN9waqJXbpcsUQ
         VuZ7mlz4mJQeH2f7e6hiZ5IUo5TIbE5BZC0AFGBWtSTqyncoRJtxzVEp2D9GtM+8Uazs
         L1sUFSZVatUj0R8uvZPMyxSbe0mkkP8nAaBMyRFfGCLYGo1yxQJPNJOoPyF2V1peVcZc
         5YEIMqoAvkQSdbETg5BZMsWhjBGwG1ldlVfNzNJvf0WM02RsMnmg6aIqYc7m0NTIu9Xn
         11sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=cezArTSQJn5DV1ANFpz7CZJhepwT89nmuQEX7MjA+HQ=;
        b=X/IDAHCwb+Alu96BNSqu4dnzL3kFppWe0Ei2WzNx5OuQiVV2hc1/YwSgI+M0Y3xCSj
         Q5JjuXii2ySUBT/goPViA8fybEohA1hE6mrQHZ+2GIEhUZZAGaVH8tZVPUW+WhvCWjit
         mLqev7lus55CQFkU6vK8lyLc4en0uComiz7fKFCoadmLr+WokPw0ZBC+w85W994ADs0e
         6VrxUu6AhNUX9RrfbJW98EWA7o4qtmW86Ub5GBSwN8ydVZtNrXPhyJ3u2+IsB9H/RSzM
         ICoIZW4nFp3Vqgy5THDxgnm0LuEZC10omZbtMLTBbHz2v5TdqQ0w8mvheEglwLG0J7TT
         cgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si1893922wrm.128.2019.05.07.01.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvO8-0004ID-J7
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:23:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKL-0000dm-Kv
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKK-00088i-GD
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28115)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKK-000881-8d; Tue, 07 May 2019 04:19:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C2A983F3C;
	Tue,  7 May 2019 08:19:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB21F171F1;
	Tue,  7 May 2019 08:19:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C3765A1EA; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:46 +0200
Message-Id: <20190507081946.19264-9-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 May 2019 08:19:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 8/8] i2c-ddc: move it to hw/display
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
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7hkuksC5EIZ

From: Paolo Bonzini <pbonzini@redhat.com>

Move it together with the other EDID code.  hw/i2c should only
include the core and the adapters, not the slaves.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20190325155923.30987-1-pbonzini@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/{i2c =3D> display}/i2c-ddc.h | 0
 include/hw/display/xlnx_dp.h          | 2 +-
 hw/{i2c =3D> display}/i2c-ddc.c         | 2 +-
 hw/display/sii9022.c                  | 2 +-
 hw/display/sm501.c                    | 2 +-
 hw/display/Kconfig                    | 5 +++++
 hw/display/Makefile.objs              | 1 +
 hw/i2c/Kconfig                        | 5 -----
 hw/i2c/Makefile.objs                  | 1 -
 9 files changed, 10 insertions(+), 10 deletions(-)
 rename include/hw/{i2c =3D> display}/i2c-ddc.h (100%)
 rename hw/{i2c =3D> display}/i2c-ddc.c (99%)

diff --git a/include/hw/i2c/i2c-ddc.h b/include/hw/display/i2c-ddc.h
similarity index 100%
rename from include/hw/i2c/i2c-ddc.h
rename to include/hw/display/i2c-ddc.h
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 26b759cd448d..45a805033a53 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -27,7 +27,7 @@
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/dpcd.h"
-#include "hw/i2c/i2c-ddc.h"
+#include "hw/display/i2c-ddc.h"
 #include "qemu/fifo8.h"
 #include "qemu/units.h"
 #include "hw/dma/xlnx_dpdma.h"
diff --git a/hw/i2c/i2c-ddc.c b/hw/display/i2c-ddc.c
similarity index 99%
rename from hw/i2c/i2c-ddc.c
rename to hw/display/i2c-ddc.c
index 7aa872777145..9fe5403a923e 100644
--- a/hw/i2c/i2c-ddc.c
+++ b/hw/display/i2c-ddc.c
@@ -20,7 +20,7 @@
 #include "qemu-common.h"
 #include "qemu/log.h"
 #include "hw/i2c/i2c.h"
-#include "hw/i2c/i2c-ddc.h"
+#include "hw/display/i2c-ddc.h"
=20
 #ifndef DEBUG_I2CDDC
 #define DEBUG_I2CDDC 0
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index 9994385c35a2..9c36e4c17ec9 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "hw/i2c/i2c.h"
-#include "hw/i2c/i2c-ddc.h"
+#include "hw/display/i2c-ddc.h"
 #include "trace.h"
=20
 #define SII9022_SYS_CTRL_DATA 0x1a
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 2122291308f0..1e2709b2d002 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -35,7 +35,7 @@
 #include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 #include "hw/i2c/i2c.h"
-#include "hw/i2c/i2c-ddc.h"
+#include "hw/display/i2c-ddc.h"
 #include "qemu/range.h"
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 72be57a40311..c236cd2d0a7c 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -1,3 +1,8 @@
+config DDC
+    bool
+    depends on I2C
+    select EDID
+
 config EDID
     bool
=20
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index dbd453ab1b01..650031f72536 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -1,3 +1,4 @@
+common-obj-$(CONFIG_DDC) +=3D i2c-ddc.o
 common-obj-$(CONFIG_EDID) +=3D edid-generate.o edid-region.o
=20
 common-obj-$(CONFIG_FW_CFG_DMA) +=3D ramfb.o
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 820b24de5b27..78a2008e3ad5 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -5,11 +5,6 @@ config SMBUS_EEPROM
     bool
     depends on I2C
=20
-config DDC
-    bool
-    depends on I2C
-    select EDID
-
 config VERSATILE_I2C
     bool
     select I2C
diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
index 5f76b6a9909a..d7073a401f1c 100644
--- a/hw/i2c/Makefile.objs
+++ b/hw/i2c/Makefile.objs
@@ -1,6 +1,5 @@
 common-obj-$(CONFIG_I2C) +=3D core.o smbus_slave.o smbus_master.o
 common-obj-$(CONFIG_SMBUS_EEPROM) +=3D smbus_eeprom.o
-common-obj-$(CONFIG_DDC) +=3D i2c-ddc.o
 common-obj-$(CONFIG_VERSATILE_I2C) +=3D versatile_i2c.o
 common-obj-$(CONFIG_ACPI_X86_ICH) +=3D smbus_ich9.o
 common-obj-$(CONFIG_ACPI_SMBUS) +=3D pm_smbus.o
--=20
2.18.1

