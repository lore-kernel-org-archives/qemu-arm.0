Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp33542wrs;
        Tue, 13 Aug 2019 14:10:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweZhMjiZUmzZJjNrocGqIsxnNChD99jcB7xUXot0gyr0tddNrgH+kXeA4ZrjNcFg8jD4An
X-Received: by 2002:ac8:444e:: with SMTP id m14mr22447564qtn.69.1565730649288;
        Tue, 13 Aug 2019 14:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730649; cv=none;
        d=google.com; s=arc-20160816;
        b=Sm7GikpcI7h9gOtOjaqdQVatWUkDT4SNglTLSvCunkUsvYr81drwGvm6EoizLHYm0+
         BirjFSvWWeLr096SXYROJPrGCfE/X4CJvNqM/PxobQUKUSI7/4bnXA2DGcZoOpD4jVXK
         xEaxug/nEyRrulgdJDOe12wbSAOa7C5SoLkd6+2iCbr/S2zeKEkviip9lA9sqTzbCglj
         48Cth3qlZXIo9Q5dIYSiu9E3a/OUrEOoSlO/9zcVVj8RdjBBbnBEq7/tJSWQiW49HvNs
         IEGvvWIqwilArwW9AlAl4ENMXSNWPUjftIyll6eoXWXnAFZfYkEgntMqGClg0q2ziTed
         cofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=2A77xDkBGjIvIFXCxAe1nFVvDQrOJVTqECfZ2tujOXE=;
        b=zZrr3H1f7ty4KAxemfq3LHbD37ptOQi2npTAmYnsdOqFFqLZMxpCjBgFf2vWnc+YKT
         G8jJQE16s4KqvSLGKGpaYAPFrGEdObPBKOPQGMYX7tjabmpkrdzees02MWipT5XvQN6s
         +ByTy7bA70bedGOMISnDmrLxdp/exr7vn9CvHOqpbPGHObr2vO2ZZEmAEdSTYgNOI1ci
         +WgEEPmvanmJdq8LjWyOLGxQEuwJcIKB9ZOFlvLx/khjOHhsujblpn3RcXRQcMyjhS62
         M8/unBvjsh00FNi/JCMVW9rB+/UDXm4Fu7zMNkQwgyFqqgz0q+KyVw+fyh/7F8bwoynN
         FH/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v145si8314751qka.248.2019.08.13.14.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe48-0000IK-Qm
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1G-00051K-MR
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1F-0001UB-AN
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33900 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1E-0001RA-Tp; Tue, 13 Aug 2019 17:07:49 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E23D4E12C927C458684F;
 Wed, 14 Aug 2019 05:07:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:37 +0100
Message-ID: <20190813210539.31164-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v9 10/12] docs/specs: Add ACPI GED
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
X-TUID: 7dRLLeXB7C5f

Documents basic concepts of ACPI Generic Event device(GED)
and interface between QEMU and the ACPI BIOS.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 docs/specs/acpi_hw_reduced_hotplug.txt | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt

diff --git a/docs/specs/acpi_hw_reduced_hotplug.txt b/docs/specs/acpi_hw_reduced_hotplug.txt
new file mode 100644
index 0000000000..46839be5ff
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
+        1:  Memory hotplug event
+        2:  System power down event
+     3-31:  Reserved
+
+write_access:
+    Nothing is expected to be written into GED IO memory
-- 
2.17.1


