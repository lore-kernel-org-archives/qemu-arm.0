Received: by 10.28.173.206 with SMTP id w197csp3166813wme;
        Mon, 8 Jan 2018 18:12:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBos9BbYbDrTY+yqegBkxEX9Lsb54p7Hu16MGF3yAa6FUzAFhfd7NCdL45LrA6je/R/QG9aAc
X-Received: by 10.37.61.7 with SMTP id k7mr13093659yba.87.1515463933653;
        Mon, 08 Jan 2018 18:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463933; cv=none;
        d=google.com; s=arc-20160816;
        b=zNRs2fihxe6js+hmJiLBFcjkzHAKd0nmlykm8UIaCmGz0ecUY8Q+jHlwycbabrERUe
         eGOGV34IvQCCvoRt6a7BPWMiIM6CggxkZpDuQE7ntAiUERjfkP/tNWV850x3taDGA+16
         0oLEupCBBb+ATr4AyiKSgYklDkk4GzHASwaNzHejnW50/VQSg9GONqHS+SJlPLm+VlPg
         soUpNsyPsvcXCwNS19AOQuuppAG38qoBlqKY9DaqYykDxe56iaqvKerFxPtbR4p74xYO
         YCc3FZ+pgOEeheh4oCWpjXxXxyqaMc9tTp7vFL32kIdEPt9gvf2IMMuGHwr8iZ2HxTee
         lyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=JGdW9JhJtOrnqQi4x9aT/c1nsEvibtllUaBMMBMXyXI=;
        b=ih+vKQkFs3rR9/kMMOooiq+U+7mTHnrfF27hoyXr5JN+l+/dykowpiwzPa66D0PD7l
         XRrl35wWvQrKiCV9ssGns+p6XIxOug0aquHHFjwTIST5EwjFhvTSPUU6pmI3/AISEplk
         WzMhypiP9IZVRUuMZtDHCkgXkZqn7bpYFMzdUr386baB+E/t47w4mFjvk57336imrRxj
         EZ2lWGfFRMKG4b4Y7W0kg6tW/sxd58k1Gvjm+665mYi48E1YGcSGIyNShienD4yk3pex
         xPcZye/uipYRhhmHY+2Bu0Yzfn23FsAeiMs/FebeyxadytG5tlB9hN7O4QqxrxOlAC1O
         BSYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T0BF/Kbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189si1341058ybf.349.2018.01.08.18.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T0BF/Kbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjOf-0001SS-4y
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:12:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEc-0002Dl-PF
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEZ-0002Vt-II
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:50 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:40028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEZ-0002Vg-Cl; Mon, 08 Jan 2018 21:01:47 -0500
Received: by mail-qk0-x242.google.com with SMTP id d18so6335344qke.7;
	Mon, 08 Jan 2018 18:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JGdW9JhJtOrnqQi4x9aT/c1nsEvibtllUaBMMBMXyXI=;
	b=T0BF/Kbev6xI+EfjfhhN0iFvUPeBYo+B34IXP+lAXlCWeh7hhtPct4yYqfjUpM1bhC
	pcHg1NfmVzZWocJ0+SmK2FYV0mSsvh+qHiXQVR+GEpU30F0Y76YPmb7DiRsQPr1M1GaK
	WMosaO0goK2QrZmATFHqKiVJ5m93/PbTMbRqHyhMTTlCuBOVzk3F3xowSnwY/R9goe4B
	jq+Q8tFTQN0ih3GsCv9zxbPFVkvasDvPoItZmTGo/HHfOtkcWQE9yXkyTX2sTaNQIhpg
	pyXK+UrdT+AhbBXTku8xOeSrKuGcf3/iC/7gQcwyWLa5N2bmEHUnfs51LYRrg/yriWlz
	JBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JGdW9JhJtOrnqQi4x9aT/c1nsEvibtllUaBMMBMXyXI=;
	b=LHBf0UCLM6n2ylWZ7eQP9tZxWSTgcLpyO74tV3uV/dclZD7NE5GzMqnJ4qa78w3JAS
	sgUNO3Pvnu9maNpu78zEIe+qq/XtMYLTxhEPCYYek4M8j7FP63RJnXqLRfYIj8KFc0O6
	fzGxt+w3o3eo/KGALqdDP/7ljhYSZ06wkd1seRPWpc7MOqgRo8/Z7x3zeAo/w09APKpg
	WW6SbYowtjEabuvyn9kjAlnRyzC+M3KiMv3ryEQsGUxWYrFljaUhVEKPvYpBqPFhf4fr
	vNZRim7rfcXs1f4Dcbecbha0Ni7OnC4pfEuYj4g+s6JoQwnvPFiwSaHetHCSEmMcsyvY
	lxNg==
X-Gm-Message-State: AKwxytfk/QrrOMaBdrFgDpws6D8pij8F58sdtdVZYuCz55uugKh6NaFX
	i1h1ezri6Lxh5ytSbRqr8b623xgyfX4=
X-Received: by 10.55.78.149 with SMTP id c143mr10912441qkb.30.1515463306820;
	Mon, 08 Jan 2018 18:01:46 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:54 -0300
Message-Id: <20180109020054.32553-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [RFC PATCH v2 9/9] hw/arm/xlnx-zynqmp: use Linux FDT
 names
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CyVL5W2yXYxi

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..fdcd6801b6 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -24,6 +24,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "hw/sysbus-fdt.h"
 
 #define GIC_NUM_SPI_INTR 160
 
@@ -138,6 +139,7 @@ static void xlnx_zynqmp_init(Object *obj)
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
     int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    const char *type_name;
 
     for (i = 0; i < num_apus; i++) {
         object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
@@ -150,12 +152,14 @@ static void xlnx_zynqmp_init(Object *obj)
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GEM);
+        type_name = type_resolve_fdt_alias("cdns,zynqmp-gem");
+        object_initialize(&s->gem[i], sizeof(s->gem[i]), type_name);
         qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_UART);
+        type_name = type_resolve_fdt_alias("xlnx,zynqmp-uart");
+        object_initialize(&s->uart[i], sizeof(s->uart[i]), type_name);
         qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
     }
 
@@ -175,13 +179,15 @@ static void xlnx_zynqmp_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
 
-    object_initialize(&s->qspi, sizeof(s->qspi), TYPE_XLNX_ZYNQMP_QSPIPS);
+    type_name = type_resolve_fdt_alias("xlnx.zynq-qspi");
+    object_initialize(&s->qspi, sizeof(s->qspi), type_name);
     qdev_set_parent_bus(DEVICE(&s->qspi), sysbus_get_default());
 
     object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
     qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
 
-    object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
+    type_name = type_resolve_fdt_alias("xlnx,axi-dpdma-1.0");
+    object_initialize(&s->dpdma, sizeof(s->dpdma), type_name);
     qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
 }
 
-- 
2.15.1

