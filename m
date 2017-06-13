Received: by 10.25.0.23 with SMTP id 23csp322161lfa;
        Tue, 13 Jun 2017 06:31:45 -0700 (PDT)
X-Received: by 10.200.50.68 with SMTP id y4mr54737151qta.108.1497360704897;
        Tue, 13 Jun 2017 06:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497360704; cv=none;
        d=google.com; s=arc-20160816;
        b=q/En6RRb6tBEhDW/C/ydY0CrGBlBx/jJlRcr5vi1daehg4tQYTp2KRaN3cUYjtJrN8
         rDeIE71evKUa7wxliW+BXqwCoVrRCy5xYOkISeR2hztszxZohdvD0pAHQGOyAZ3Y1uwu
         ClSrVBk8CHZFvoLjCJWwM27p2xa5aUgk10fAX+SihPeB414fcb98ZkUXv+6PchvnMSZU
         OJGF4T59mFn7J6UXeLD3hWN+YzJ2HKdj0HD0CNP0WDLL6X7bSKAJsqhmUP6lCOysgAvW
         kIQDEntX7Gi8qcVRbuNJ5wNAG1YsqeKuCuIvIcCVwKHVH+iU4IUxGvZgN4RRHEbzTr6b
         TJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=xlMyF7Z+0tKXGm6h91BO5LoaZ5f+4mMi+6AD7LZi5Jk=;
        b=SPkc2RmJ706kIpO4gqHHkuyCmwGf45JCVVp2p1gyZ16A6294AoOvaPcqg54ERbHNCy
         fJmSabB1B8EHxLTXwMC4vCmcWOPAwBtt61m1jdXewgrhquwOD8/Pjks05YaflVNkdzLA
         2INYfodYT0W7VSQGQ+zFCaSEVxB3FhjQoNI41ZS4Y/JygSpB4dtyOU8CUdKZ2dMzdzMh
         FyGtMA5kMpKI9JZJoi6svGx5U9aSSPmRGd84rU0NahtlsKNYXCqXkVN4fsKhcRGZeDJ+
         MqiBA3ez55TiWg52t7Zg4clFcl2sKlhuwZnWt5SJcmlGJ8ioQJHOi1oYJRKJ6SEqry+x
         qQ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z42si11676040qtb.211.2017.06.13.06.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 06:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKlv4-0007hF-6v
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 09:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKluz-0007fE-AH
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKlux-0008Da-2L
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:31:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dKluw-0008DN-Sk; Tue, 13 Jun 2017 09:31:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEBF68FCE2;
	Tue, 13 Jun 2017 13:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CEBF68FCE2
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CEBF68FCE2
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F36CD85AE4;
	Tue, 13 Jun 2017 13:31:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 13 Jun 2017 15:31:15 +0200
Message-Id: <1497360677-4780-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
References: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 13 Jun 2017 13:31:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/3] hw/pci-host/gpex: Set INTx index/gsi
 mapping
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+oD02MLabAw

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

To implement INTx to gsi routing we need to pass the gpex host
bridge the gsi associated to each INTx index. Let's introduce
irq_num array and gpex_set_irq_num setter function.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci-host/gpex.c         | 10 ++++++++++
 include/hw/pci-host/gpex.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index e2629ce..22367aa4 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -43,6 +43,16 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irq[irq_num], level);
 }
 
+int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi)
+{
+    if (index >=  GPEX_NUM_IRQS) {
+        return -EINVAL;
+    }
+
+    s->irq_num[index] = gsi;
+    return 0;
+}
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..db26b3e 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -51,6 +51,9 @@ typedef struct GPEXHost {
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
+    uint32_t irq_num[GPEX_NUM_IRQS];
 } GPEXHost;
 
+int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi);
+
 #endif /* HW_GPEX_H */
-- 
2.5.5

