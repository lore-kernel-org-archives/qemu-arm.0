Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp442181wrp;
        Wed, 4 Sep 2019 02:01:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsgmwuXLhYu9Ez9wSTSmr8P2nxiP0fQlG2nL+cv84L3wJNi5jwDq/lrdngJp734I+NVo2y
X-Received: by 2002:a17:906:cccc:: with SMTP id ot12mr827644ejb.210.1567587698359;
        Wed, 04 Sep 2019 02:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587698; cv=none;
        d=google.com; s=arc-20160816;
        b=OKiEgDgpqsL/GXDz/qT2pTObpz8jLba9TcEv5xpu9+KCQPoQQK26OtfEtxqC5ESZd1
         G7UxEAG1lNhgstSA6p24GlMJ9ptEJpfsi6zuEVanfEbYctd4Xd5cr0SomQ7CVYjDm+XQ
         +E5BhzaqHzHc+sfDAGUSuz32ClQfKIBvvbSCbg61kq5FIF2L2Q1eHorB2NTVIEeGeXkc
         zdj5w8jsI4KmSUlHCUf6Xbj5e2n6hmaa0pfU9EHFqa834EgrYzJF2B/j9MqQE4jK9f36
         dTgTTPbkgmK9e3EZRyvAObtEQ5lgEjObhD2Ua3Tl4w7NhLMqhSveZ0Uge+I8FHD/a/iS
         xt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=f8D/tQdT+Jv9daEw0/qh5r6hCDPHdJrh65qK9xGVIUo=;
        b=CPX1pzLMbJZTTIjpb6lJWcA5L6E+Ip5LKJCUIIFQALaI1s5G8JqOVKfJNrWEODduGF
         IbhfJirYteFUmIi11lZjlWcYsXgWbSB9G3B5mB+IQQ6yDR/tAeK2kBcv8+pBeQalTBdS
         IWFyxseS1TPIyMYYMTWsYWVcm8y80k5W8p3aIKxv2dkZySWFezgD8+OHOhVk1TVjrxfs
         snqL+YP6usBKO6oYZmH8CMdBbIl9spEYqynf3Ck6UyWjVFBo1nEs49nByk2JY9K+PlqP
         ZvMYXW+eFWdJawHZutlqTnljePKYQgSHzM6P+qsy4ZnsXx/nF+UdDZELILWm4vjcymZB
         QYDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qo28si6377212ejb.378.2019.09.04.02.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 02:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5RAW-0002Pv-H9
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 05:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R79-0007TP-V7
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R78-0007Gj-CV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2261 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R78-0007Fw-0n; Wed, 04 Sep 2019 04:58:06 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1D9BD3FCE8CBABA5053F;
 Wed,  4 Sep 2019 16:58:04 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:56 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:27 +0100
Message-ID: <20190904085629.13872-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v10 09/11] docs/specs: Add ACPI GED
 documentation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zGWdao3tXSmE

Documents basic concepts of ACPI Generic Event device(GED)
and interface between QEMU and the ACPI BIOS.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/acpi_hw_reduced_hotplug.txt | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt

diff --git a/docs/specs/acpi_hw_reduced_hotplug.txt b/docs/specs/acpi_hw_reduced_hotplug.txt
new file mode 100644
index 0000000000..2d78c40d6a
--- /dev/null
+++ b/docs/specs/acpi_hw_reduced_hotplug.txt
@@ -0,0 +1,60 @@
+QEMU<->ACPI BIOS Generic Event Device interface
+
+The ACPI Generic Event Device (GED) is a HW reduced platform
+specific device introduced in ACPI v6.1 that handles all platform
+events, including the hotplug ones. GED is modelled as a device
+in the namespace with a _HID defined to be ACPI0013. This document
+describes the interface between QEMU and the ACPI BIOS.
+
+GED allows HW reduced platforms to handle interrupts in ACPI ASL
+statements. It follows a very similar approach like the _EVT method
+from GPIO events. All interrupts are listed in  _CRS and the handler
+is written in _EVT method. However, Qemu implementation uses a single
+interrupt for the GED device, relying on IO memory region to communicate
+the type of device affected by the interrupt. This way, we can support
+up to 32 events with a unique interrupt.
+
+Here is an example.
+
+Device (\_SB.GED)
+{
+    Name (_HID, "ACPI0013")
+    Name (_UID, Zero)
+    Name (_CRS, ResourceTemplate ()
+    {
+        Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
+        {
+            0x00000029,
+        }
+    })
+    OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
+    Field (EREG, DWordAcc, NoLock, WriteAsZeros)
+    {
+        ESEL,   32
+    }
+    Method (_EVT, 1, Serialized)
+    {
+        Local0 = ESEL // ESEL = IO memory region which specifies the
+                      // device type.
+        If (((Local0 & One) == One))
+        {
+            MethodEvent1()
+        }
+        If ((Local0 & 0x2) == 0x2)
+        {
+            MethodEvent2()
+        }
+        ...
+    }
+}
+
+GED IO interface (4 byte access):
+read access:
+    [0x0-0x3] Event selector bit field(32 bit) set by Qemu.
+    bits:
+        0:  Memory hotplug event
+        1:  System power down event
+     2-31:  Reserved
+
+write_access:
+    Nothing is expected to be written into GED IO memory
-- 
2.17.1


