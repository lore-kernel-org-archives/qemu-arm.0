Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp989698wrp;
        Wed, 4 Sep 2019 10:25:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw76BxqW+te39+lYvce11o5p1DjGyO2DNQg9hk00OhPLS66wAKuGa/mrQzjb5o1WMgfPWDy
X-Received: by 2002:aed:33e5:: with SMTP id v92mr20287907qtd.147.1567617917936;
        Wed, 04 Sep 2019 10:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617917; cv=none;
        d=google.com; s=arc-20160816;
        b=E6EoVYTXgCeNDP41XzQdyee/mKLVmWZmcdGSBj4WNx4X6EPffZYNycBktCfsR+ZFJB
         9GE+js8PZTbZbhbpuYk5104y99jHezBLC1lLg5zdYvpy5SUMcCRVGFwHUaY0AiftRONn
         QMQHP3jzXF0UKKyo7kKZeA0iTIXM6P2t/fZdzI+QHR6uCb/ubweXld6W1c/VqYDhxhSl
         0jE2xxTjzkkt0QqID1s3tAYRzvtBM6gzURAMjkyf4HWXK9jv1oscl1eztPvrXaPGrlp/
         Z9SKtAryGAauf9FbZyGnXEbyEuEIwxybCyqOuoQyGJflhRa8pVBB+sckuLMj34yWnlwU
         5XbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fquUmVkncxEMfeAsRc3/6BsqyJ3/ccTKHRFzefWvbc4=;
        b=nq0BbuQIEfqGUkjkJ5yqOEJB9tGA5dNVpziCDgQ7Ph24d1iodEHyCDm1ucoJgM3oaX
         VUC6Es3USBGY0C068szLYbT6GRzPr0JNyIzN32Oxx4bXVQmGxCp1UFpJGm/liwxGOF3E
         n0hCSw0hyPQ6YNupG8ZQNMdqVOkAmfSo6fZNV2CK1cdfKv+cg5xQjLlZ6L8hJE8Mczo7
         BHG5h1xes4313eeYkPImARHtToFSG4lb5pSUUXAYwrXA3R1FXjT78IL1ZA7qTGO3oYIw
         EScVterDLD9uXTx/AYPQ4cdvYgSTXCZFc22AKPSg+s01kOO1/8WNIFDzoKYyKaOUrAPQ
         vTbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDrdlb2r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si5837518qtd.144.2019.09.04.10.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDrdlb2r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Z1w-0003Dz-VX
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yql-0001jg-SE
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqk-0007AW-Jw
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:43 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqj-0007A1-MG; Wed, 04 Sep 2019 13:13:41 -0400
Received: by mail-wm1-x344.google.com with SMTP id k1so4154652wmi.1;
 Wed, 04 Sep 2019 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fquUmVkncxEMfeAsRc3/6BsqyJ3/ccTKHRFzefWvbc4=;
 b=pDrdlb2rH6HXIVh5RptUMn3al7DtlWvRcvKpBaPq53spQUKpEKQ8tu2amFuF36KcB1
 m0xhE9u/BWG35kTr/duYfN+6ZpnvRO3m8IqMnljYOymenAdTX22gVSG3Y5HVn4hx+wuN
 4TY4rPvOUVTYpQV5MliBprE8tdGbsVkF67cHWQ6/dPredUf+NkOePIQ1iGd6dGT0e4lD
 IlRtNNsbGvFz9SAxxV/YyURoh7b0iNsTslvE5mVaAkOxu5TUGJxHSVLFTSvvS4W+ta/M
 WF74ijiw1jQpfVBvvERdwQZ7WKDth9Sf5SbO3O63n0PgA8mHsGBUEZR78lpgPnRCADw0
 1Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fquUmVkncxEMfeAsRc3/6BsqyJ3/ccTKHRFzefWvbc4=;
 b=DdaWThf8lTQCei+iygxqZAK+wqD+WHjl+5xdahGNFuSBCHB6Jfnyn2HVliB5s7GPAR
 EEZLXQmbJvftXYKkm7Uu0x9GJPPEeJ4XYjG7Dcy+N6KyKQ+xUWnJ5LuNAxMSmjeVMBA8
 87um/BbMVmgNNknJLfIb6AIabNRmGoYBQqJYl9IcGCl00h8atg3567GJuf5656vFBroK
 msFmro1JJfw0oBxesYz0DqgfPG/WDiNv/r6wBSb/TPOXkFjrp7tpm2vlAGCqBEYcRZA1
 xchYn01mUR5ro8BnZpwwQTmsyivBKkBe365EVESQjEOHnjFAamPMkpA8yYXED7t6OVJh
 NVkQ==
X-Gm-Message-State: APjAAAU9N8u+YqbMXv5ceFAR3Rb+/uGFx3VDLWc76z2Qs68O7m0SorAF
 hyIiJiQ1kGuh157sXqkaDsQ=
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr224180wmi.157.1567617220721; 
 Wed, 04 Sep 2019 10:13:40 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:14 +0200
Message-Id: <20190904171315.8354-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [RFC PATCH 13/14] hw/arm/bcm2838: Map the PCIe memory
 space
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XHrIxZ2EMT+o

The BCM2711 has a BCM54213 Gigabit Ethernet block mapped
in the PCIe range.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
FIXME: create the bcm54213-geth in raspi.c?
---
 hw/arm/bcm2836.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index d89d7cd71d..39190a108f 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "hw/misc/unimp.h"
 
 struct BCM283XInfo {
     const char *name;
@@ -60,6 +61,8 @@ static const BCM283XInfo bcm283x_socs[] = {
 #define GIC_VIFACE_OTHER_OFS(cpu)  (0x5000 + (cpu) * 0x200)
 #define GIC_VCPU_OFS                0x6000
 
+#define PCIE_BASE                   0x7d500000
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -238,6 +241,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_SEC,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
+
+    /* bcm2838 kludge to easily create PCIe */
+    if (info->gic_base) {
+        create_unimplemented_device("bcm2838-pcie", PCIE_BASE, 0x100000);
+        create_unimplemented_device("bcm54213-geth",
+                                    PCIE_BASE + 0x80000, 0x10000);
+    }
 }
 
 static Property bcm2836_props[] = {
-- 
2.20.1

