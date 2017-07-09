Received: by 10.25.44.15 with SMTP id s15csp2630676lfs;
        Sun, 9 Jul 2017 14:04:29 -0700 (PDT)
X-Received: by 10.200.8.187 with SMTP id v56mr641741qth.213.1499634269753;
        Sun, 09 Jul 2017 14:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499634269; cv=none;
        d=google.com; s=arc-20160816;
        b=06G35w3AzEHKGIkqLYNf89TVm9BV7VbDBN9oJK/HqY1yDHYpoIwK+0LsoOt3+hymNq
         abvj/wfrmeLE6sRslZp4dj+DqzMYNWkj5PLHeyPn7uO8vFBVdkr2OLQ7i5ovk38b57Ja
         fgWAX7VlGtKkRKSc6LcT+W9XBvUb9fkeN7yOBpW2Af+FfmxmTLr1R2Y7IbRMsHJ7EBZa
         SzYoxA3StJo+ARNzJnJijo8TX5zl+EG9AM4FBl1dBuIm3boenROa8ghhbGjOy4tx7EG6
         vSs2Qwxq89E/i/IWRBDmyEJNk6SahYM+Okbufdd8HpvHbb1sU+ij6D3DjLPPQTjGBYUa
         AzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=YBREcAx5Rlbqk+RQ11/W4QNFcInpwwiZckTEKMg3TDQ=;
        b=BRcpdPr4fL2bFG2UQ623ZotPm1q04OZ++7WHz63QRB9XRQpFwcOE+a6SynJwnbeiiv
         rgjfem38ifhRW0B7XmQHPDJbIlTSFFS5EsfG6F+03UfJwQtjAJ2PRbrnIxr67H/WdyJv
         D8xDP6dTx/pP1F3ozolbkDbpmDB1TzHIfw2rKIvp2pHSnwGKYx44ych7W5CN+Lu0JYlb
         caqDaWIN5rdS/9MiS8lOvK+vKSZ3x87js3fSI3HALkO4EGpOA4Vf66GT7+6Q/4oANiHI
         SJoGPrHnCwLUODqiq2SNBnrVuERgC7teUXfsbWjvS4WwZVhKsTgeT3cSfjh6xZCEdB1l
         H68g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h53si9842561qtb.180.2017.07.09.14.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 14:04:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJNS-0001hJ-PG
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 17:04:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLr-0000ZC-PW
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 17:02:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLr-0004ku-2g
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 17:02:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJLo-0004kN-Vy; Sun, 09 Jul 2017 17:02:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7B4183F3C;
	Sun,  9 Jul 2017 21:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C7B4183F3C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C7B4183F3C
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7BCC17DC6;
	Sun,  9 Jul 2017 21:02:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun,  9 Jul 2017 23:02:17 +0200
Message-Id: <1499634139-20399-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 09 Jul 2017 21:02:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RESEND v3 1/3] hw/pci-host/gpex: Set INTx
 index/gsi mapping
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
Cc: wei@redhat.com, drjones@redhat.com, agraf@suse.de,
	christoffer.dall@linaro.org, pranavkumar@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8DM9g3/lz5R

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
index 83084b9..0d42ac2 100644
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

