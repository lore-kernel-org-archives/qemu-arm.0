Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6398815wrt;
        Mon, 21 Jan 2019 11:17:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4vgF4UH4sw/ANucb31ONbnFreELXUN+zJujpwh61SgAMM6jvUgz3l6GaEmnJoOY1vBkI3C
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr626660wmc.106.1548098229580;
        Mon, 21 Jan 2019 11:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098229; cv=none;
        d=google.com; s=arc-20160816;
        b=V1LOmejJvuw2GJNOV6OdrxBES4ScXhJorUh9BwB+S+FYTf/jZS0Ogxvn3soLdLZhH6
         ZPADU+oAhQqF5xqXQ8z+KXy265iXkX/dAXdsIE9jI2UCy8IMynkHylqHvM+1hSl63BY6
         cp3MVu2NtalK9jtCMTpyFPIEMnnbnzHjopfmC/Km4nIATasWBqT2/SVsBdiTNEKkNeXW
         ZgZoRc4Lekf4UtsqmrLHBxXp9Sxokhslr02CN6VqoYBbFACe3ZgeJmRlT3ZqDtsBVi69
         OH1DBMAxfPKE5lEYguGyBV4iKRyX+cj4ZLXKQ33XvC+5DSu/lxz0wmE602dTz6+WQubZ
         wvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=bbMrEQttECEQjo2HwYbstwzK4LFM5IR2j7Wqx0jx8pQ=;
        b=VNPH4ZxTOouPR1hOPpqzL4cH0L9GpD4TGNTYAWvCXKI2btuxEYqBQSk0UAxW6APffk
         SbDAUiGcUmt4MYwTXfH2T8IYvcQ4bKV5IYLEQgAshPIFusLsxO8LaG/HdxHhussdJNQe
         P1W+FnyXzbbavKxYWjA8WMK5+jsfVvOwQV/9K8kvt9b316WgGo3NH9sJKrpts/XD9cy3
         6fwkAh5ajzVU0S3EykDtnREUl6oIE95zzOCDMTVThUDKIi/XfbvgD6R9OMyHKf+2ZxtC
         eS1bBXD5iJUkGPNwflri7dgQuS2qNqSgdhxEJnG7+l39IVwZJNTlKTuetDyfp5Qpxem7
         rL8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e2LCMT9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si63409779wre.392.2019.01.21.11.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:17:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e2LCMT9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf4G-0007YN-Ig
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevR-000888-DD
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefg-0002vo-Or
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:47 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefg-0002un-HU
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:44 -0500
Received: by mail-wm1-x343.google.com with SMTP id y8so11810415wmi.4
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bbMrEQttECEQjo2HwYbstwzK4LFM5IR2j7Wqx0jx8pQ=;
	b=e2LCMT9LQ1Mdjr+1MMgPhcU5vqCfD42pcIcOC2kWUhNHqY2Hc1atNU7gxGo9xrxpVm
	0L2D8irYgnl4IBD04V40VfOQYRYlzIR5e6GK+UuaKXe7jWiSzJfkCIwAARWuc+K/R7co
	Zck7bUIm2d70xj0kbfJ6chpxPUq+9MVMgmAnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bbMrEQttECEQjo2HwYbstwzK4LFM5IR2j7Wqx0jx8pQ=;
	b=nkpjR/k/O/E1E+MfqEeEzzG3njucfEqm1y05jyKVcieeSso95tHCSwAr4ySQYhGg22
	IzgyolWZm1JT/g425PSGwdgYbD6dokbWVy1IT3LVlKcVKcv2i0WqHcK3nK8EDz4G6zfa
	sOe3omv4inmgK9cK0ja3EDZlOsezwlmuWRHc7mt83USNPPGGrOi541P/641zSdEX+dyl
	qPck+MApmV9gp0nYGSwTzu7yX0dkHKW+LWaSz9Jk0RH8Jgoa/lYWqPyfIjuTSvfD8CBV
	B9hHS0XyfS2ghMMKuBXoTxsNB3ruy0FqynWpchr7c/5OnJr8aMPSPCrbDzmOEHV2jPZ5
	PC7A==
X-Gm-Message-State: AJcUukfVzfW0Taotv6XZnpVvnj+Lfm9Mtms2R1jWB21DmNNKU7Mu8XsV
	FxDWH/xyBlvq7w89WSUGWIvEDBP1xjFqhw==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr504644wmk.59.1548096703334;
	Mon, 21 Jan 2019 10:51:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:15 +0000
Message-Id: <20190121185118.18550-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 20/23] hw/arm/armsse: Add CPU_IDENTITY block to
 SSE-200
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHG+CI4RfvRO

Instantiate a copy of the CPU_IDENTITY register block for each CPU
in an SSE-200.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 +++
 hw/arm/armsse.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 961dbb3032a..3914e8e4bf2 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -78,6 +78,7 @@
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
+#include "hw/misc/armsse-cpuid.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
@@ -153,6 +154,8 @@ typedef struct ARMSSE {
     UnimplementedDeviceState cachectrl[SSE_MAX_CPUS];
     UnimplementedDeviceState cpusecctrl[SSE_MAX_CPUS];
 
+    ARMSSECPUID cpuid[SSE_MAX_CPUS];
+
     /*
      * 'container' holds all devices seen by all CPUs.
      * 'cpu_container[i]' is the view that CPU i has: this has the
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9c111ac6a40..eb691faf720 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -34,6 +34,7 @@ struct ARMSSEInfo {
     bool has_ppus;
     bool has_cachectrl;
     bool has_cpusecctrl;
+    bool has_cpuid;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -47,6 +48,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_ppus = false,
         .has_cachectrl = false,
         .has_cpusecctrl = false,
+        .has_cpuid = false,
     },
 };
 
@@ -314,6 +316,16 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_cpuid) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cpuid%d", i);
+
+            sysbus_init_child_obj(obj, name, &s->cpuid[i],
+                                  sizeof(s->cpuid[i]),
+                                  TYPE_ARMSSE_CPUID);
+            g_free(name);
+        }
+    }
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -864,6 +876,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             memory_region_add_subregion(&s->cpu_container[i], 0x50011000, mr);
         }
     }
+    if (info->has_cpuid) {
+        for (i = 0; i < info->num_cpus; i++) {
+            MemoryRegion *mr;
+
+            qdev_prop_set_uint32(DEVICE(&s->cpuid[i]), "CPUID", i);
+            object_property_set_bool(OBJECT(&s->cpuid[i]), true,
+                                     "realized", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpuid[i]), 0);
+            memory_region_add_subregion(&s->cpu_container[i], 0x4001F000, mr);
+        }
+    }
 
     /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
     /* Devices behind APB PPC1:
-- 
2.20.1

