Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp451691lfm;
        Sat, 13 Jun 2020 14:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe22/lRRnkrh5WAiPFr9J/rXTfKycTmG+upxLkM3e1iZvvWRH9Md4cHG+8NoQAbMQqX4+Z
X-Received: by 2002:a25:cbcc:: with SMTP id b195mr31793525ybg.91.1592084960160;
        Sat, 13 Jun 2020 14:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592084960; cv=none;
        d=google.com; s=arc-20160816;
        b=xp5RIoTOmirl95VQAw2dcLmwoIsviE6Hbked2V4XH1fqLem3D5aMUjN6CNfAcfS76C
         ti8DCtQ3PKK7Wjj2V+1clcBnZpusZQet1eabANmraKtfg1oia3ma6KuZaSF6l6R6nXjU
         2bIROeIB1h9aAItWln14bCiTUoGPifKsdE1ysZahhkLwgpmACu6vMkzIb559Zm5hluVp
         1g8bbs4ZQZykZ/NNEgR0YakUHsWP5WIumpbssLBD13JamLDbnpr86B5zz9DCvKAcFrgs
         DWd1rRdcMV7VxvOILKfWKHsePLLK6MsdPq4HlAPo43bbhfwfyP81U0QzU/C+V5WRmC0k
         9u1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=0yff527cHXWdzwx+n5n2z19CODuo/vU7BLGvOJJjAsc=;
        b=YvEIIZTMwGEFCMytqCWpl0+ibG6fAI/ltRkpoLtzPbCT8WedKJXYCTfRVqUNZWnjPC
         C7i/Jivb4O18julbNe0b+AlaZfuhgenP6Lhb2hoZ4PEDLGvHCPYlsuuPB903J99xYKwe
         ri6N1JPprANsEhiA0No4EtSc7O91IYNFPq/4EPArHOPBDAz96GPzm+4gkdiRzan37pPa
         G+CBSY35xdksguqlQgCj8LUMrqFELbjtIFsbgsjz3F2syG9uipxBN1xjYQjiis0P8Iys
         p0+mWvILOemGSlrY4rCbwoWsjBilNmXer5Z+O62hqOLFKTM3UH8doO7w4BwnfTJbN+rp
         3gnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si8961585ybs.368.2020.06.13.14.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE1f-0003cT-GY
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDxz-0006tJ-C3; Sat, 13 Jun 2020 17:45:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3776 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDxx-0003GQ-Dn; Sat, 13 Jun 2020 17:45:31 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EF046561478D198E2282;
 Sun, 14 Jun 2020 05:45:25 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:45:17 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 11/22] arm/cpuhp: Update GED _EVT method AML with cpu scan
Date: Sat, 13 Jun 2020 22:36:18 +0100
Message-ID: <20200613213629.21984-12-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxtv0yqF/8gJ

OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
results in start of the cpu scan. Scan figures out the cpu and the kind of
event(plug/unplug) and notifies it back to the guest.

The change in this patch updates the GED AML _EVT method with the call to
\\_SB.CPUS.CSCN which will do above.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 0f2c8a959e..79177deda2 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -108,6 +108,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
+                                             ACPI_CPU_SCAN_METHOD));
+                break;
             case ACPI_GED_PWR_DOWN_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 48b291e45e..f47fc8e79b 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -20,6 +20,9 @@
 #include "hw/acpi/cpu.h"
 
 #define ACPI_CPU_HOTPLUG_REG_LEN 12
+#define ACPI_CPU_SCAN_METHOD "CSCN"
+#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
+
 
 typedef struct AcpiCpuHotplug {
     Object *device;
-- 
2.17.1


