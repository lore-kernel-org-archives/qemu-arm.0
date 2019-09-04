Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp439906wrp;
        Wed, 4 Sep 2019 01:59:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+8LJ04pQT2rStUL7f86MWSEG4bDamvLjJ34pY6YuPVIpA48xEOStNOBoYu5oPQpLQIfMj
X-Received: by 2002:ac8:368b:: with SMTP id a11mr20742611qtc.47.1567587558237;
        Wed, 04 Sep 2019 01:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587558; cv=none;
        d=google.com; s=arc-20160816;
        b=jsOS56aEPWJvkGR7enySJK2wcF/q4dYehcwHukXZHIq3BmUFRzzwSSnnbRt04Tdc2x
         K7lVyPv4fUqFvm2lOn5g2FLowNm2on7MGTQp/AWt+3ubVblsfmrzkfQRWM8as/i5cQC4
         If6EFUEWoYXApVZY8eNuv8NN5sREMHpIs4zw46sPhHN6kbs7mEwmOb9RWOR24vROmqgs
         /v2HJAlpoQnlRNE+GYCwuilTWfaMm/sCJe28fGNrWUm8J9ZWXQxi9ZLiARtFpDcdo0OG
         gGATD6ycEWa8gENupVoMj7VD1iblsNwnrVdXpz4H6D0HCLZsdJ8TQ8BFur0OXFm6Ela4
         oiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=baRvW1oCGVZkVk4Dgfg2Qxz+MISC/NzNUi8xulrSLos=;
        b=ixUQpwdEL0sACGjIZanvfA44vpxCPemLrlh8VbdyIl74Xxm9f/5l9L5npwE/Gtzo13
         sUv23x+7YFkUGYRXnabnkY/BfPy2AqzZ+tI7LbNcBUaoBmynobssI5yc9gixvtfCgEiT
         vpEpaxBDtHq2aJLXzqmGU30NQJbBOLgENIzcFS6Y9jn9rD6ePaxNnD33l0gkqSOe75om
         7UACpwQpCbb3yiEIgWESsX1On7+qhaouZh7STWkz8JsME1qP/XsPHM2DNYdUSneIoJMx
         u7L9LlDyvvdwAUHdVCzc+DOEX6fwlw1s1Wn6aA1a03zgIdjuU6yom0MpBmh3tfzIbua2
         JmNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si3620651qth.95.2019.09.04.01.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 01:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5R8H-0000Bh-4d
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 04:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6p-00072F-Hr
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6o-000776-71
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:57:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54312 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6n-000765-Pc; Wed, 04 Sep 2019 04:57:46 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C94F367E587719552E02;
 Wed,  4 Sep 2019 16:57:43 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:33 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:20 +0100
Message-ID: <20190904085629.13872-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v10 02/11] hw/acpi: Do not create memory
 hotplug method when handler is not defined
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
X-TUID: YEYKEq3slzZX

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 9b0b150f4f..8d2e82240f 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -712,10 +712,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     }
     aml_append(table, dev_container);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_call0(MEMORY_DEVICES_CONTAINER "."
+                                     MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.17.1


