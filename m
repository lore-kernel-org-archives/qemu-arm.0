Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp656117wrg;
        Wed, 22 May 2019 09:27:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuvH4hC9KJpFlgEuVPAS+TWF9qlbYMVYWUj6CCxx2di4nKUyEz97SswzL6ISLgsVpia6A4
X-Received: by 2002:a50:b343:: with SMTP id r3mr91404689edd.53.1558542444752;
        Wed, 22 May 2019 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542444; cv=none;
        d=google.com; s=arc-20160816;
        b=QSZGGyW3dU/Z3weCbfIhdMVmO5xGur9BNmtzfonk3ApWzhaC9oxnalUtYjRCMp6Owl
         wZ82rJlFjbVhQMe9MWxFQtDpxs2Aox072a25h6c0r6Qoa+dbnyFHHn9fwFnifDYJMWKg
         c9tRt/n/Ar6NPi8FegRJkiuaPvJAZVDVPAet75jlnAaGuhv4goKKzsjcR3gQVyA5QLwL
         Oth+wqUqskzO0HwTujD0lE/53xjgifbap6bKd8R26m4AxFT/76J/qUGQSxk5L+ivldug
         D90EI/crHlxRLykHYSy6oUl1BRBheWgHSbGQlW0os5f39vI6WwtjVOFh3VrHwCFk+Qrl
         pv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=tH6RMAJrmzrPb+/L7KoeTD30P3yxyJiMKEugfjArIKM=;
        b=BTp/7AZTrW1JQjbNgVUyMohW47OoN+/vevEg5hh/qXvEcbXMhE5dOOxWxveRWS9IWC
         oshlDRTzbeAyqMR5wzubCRvIP7OqJzCaL/x/qb6hr7DSirwrWlV8oNWArgkaaVmxo7pD
         KsZ1M3SurNcfcjJi58RnFnW6MFygavoWD+68ZscmqKmgLGLhZLsR9PuPOTTYe720Y47T
         a2WMIotd05usZP9yeqSVL11KujIbCtJMCtVgWP3SPMPRqNwdVd1TTDXvSp8EtxCdKoqT
         g4bDSNcU8m6gWWdEGmjEvv4yxG5YxZNNGa0gdh2j2cpCqpnWq0QRXnOB7OFgYuulOUIi
         mdzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si1187518eje.159.2019.05.22.09.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU5L-00009r-O1
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:27:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU38-0006bK-RD
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU37-00025O-PD
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2218 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU37-00020t-Ci; Wed, 22 May 2019 12:25:05 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id D491ED543854AA74BCF7;
	Thu, 23 May 2019 00:25:02 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:24:03 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:46 +0100
Message-ID: <20190522162252.28568-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 2/8] hw/acpi: Do not create memory hotplug
 method when handler is not defined
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2S940rGlbvj

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index c724f5f1e4..7e30e6f886 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -719,10 +719,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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


