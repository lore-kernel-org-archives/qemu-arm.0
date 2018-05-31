Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5605593wre;
        Thu, 31 May 2018 00:17:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL9gZxj0v6N57ZCrNL+tkCSa4VujZMHs07l2k1fnk+BOxRWognwAaShjL+2Y7CI8YSBzgdk
X-Received: by 2002:a0c:be02:: with SMTP id k2-v6mr5650270qvg.168.1527751055003;
        Thu, 31 May 2018 00:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527751054; cv=none;
        d=google.com; s=arc-20160816;
        b=mgTwGRrU2idT6/2gAyekjx8QlzanewXddddJGnst8vUwkbaePSUuV5/OygLNtc488n
         7TBeMj8qrYRXXp7PJhdNaszLV9R8EXEH7L1PIT9GdOl0U/Zs49S/lpmePpRkyHjVoshR
         mNmKgh781URA1RS/usj20ahLM++eA7eUOcXv8vqhcuRXvKxr4J7/xClnFvnvvfREiUT2
         LN4uaXyRMyFlwsP3lmjxn87KiD5+Ac/9HR1vW4lo1Zu//JJIgGda1CfzMC+Tf10J5MSE
         8LYahOwQIdXz3s+gEuJf6NuL+WIXeg6QwYYvY9uVN86fsyhIhwDJteN0CcCGtZK3tuJd
         nXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=4Xm3kf+L8g6nDSdPF3/hbJ7xbhzqD0hxnQDopANIBEM=;
        b=aFqcSfsoveAxGBZpi9OhcMv+oscG4wA0o7FTP1kr8e9iBvzl2OqQgUU9cXxKK1epnf
         ag4wpFS8oRh/TFZ4qbCNZEvBs9xFANW/qs+nJ+ZmqOQSb8f9Qo5U/M+IOWuW0LvKlZXZ
         BaCYZm7uSgh0O8RFG/++iR43FDbiSbyRHhNXr9/WW/CHo1bINJyHdKmYWFIVgVuNFsdh
         prI+bS2XokJ69EDn2IcRndRwf8MLHwLTIV3cenEVZYpxt1WrO9rY21Eg7RllP1ETPaS/
         AQCu7wsCwJA/qU/FQ8eHOusM4CThyJkVayueUjz4lJ/lMIPDzTh1RfOVVPydeJya7K7L
         KLEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si3387704qtk.215.2018.05.31.00.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 00:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOHq2-0002Ch-Hw
	for alex.bennee@linaro.org; Thu, 31 May 2018 03:17:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOHpw-0002CK-Mz
	for qemu-arm@nongnu.org; Thu, 31 May 2018 03:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOHpt-0000eZ-Gs
	for qemu-arm@nongnu.org; Thu, 31 May 2018 03:17:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2105 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOHpt-0000cZ-5A; Thu, 31 May 2018 03:17:25 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6CED3F910BAE2;
	Thu, 31 May 2018 15:17:08 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 15:17:01 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Thu, 31 May 2018 15:16:34 +0800
Message-ID: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH] KVM: GIC: Fix memory leak due to calling
 kvm_init_irq_routing twice
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CCuPGs0lN1g3

kvm_irqchip_create called by kvm_init will call kvm_init_irq_routing to
initialize global capability variables. If we call kvm_init_irq_routing in
GIC realize function, previous allocated memory will leak.

Fix this by deleting the unnecessary call.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gic_kvm.c   | 1 -
 hw/intc/arm_gicv3_kvm.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 6f467e6..204369d 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -572,7 +572,6 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
-        kvm_init_irq_routing(kvm_state);
         for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
             kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
         }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 001d82b..aa4c7c5 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -813,7 +813,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     if (kvm_has_gsi_routing()) {
         /* set up irq routing */
-        kvm_init_irq_routing(kvm_state);
         for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
             kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
         }
-- 
2.0.4


