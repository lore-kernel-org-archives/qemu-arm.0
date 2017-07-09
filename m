Received: by 10.25.44.15 with SMTP id s15csp2629380lfs;
        Sun, 9 Jul 2017 14:03:00 -0700 (PDT)
X-Received: by 10.237.40.35 with SMTP id r32mr670216qtd.212.1499634180809;
        Sun, 09 Jul 2017 14:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499634180; cv=none;
        d=google.com; s=arc-20160816;
        b=vVGvaXEnC7olWmL5XWDlbxRTuZLUOUCIrgFmxGTZiKHZyHILfAbaNNDZGD3Mgsb93L
         YYLtKGqq5220UC/ECcCanDQ7/EDOnKYLsLdueu2HbgE/ERsPVhgKT+2isPkcrld93lJ1
         ii2T3khGaz0xigkHpq5h5TBpzAhurI9r6djkaXQFc/7b53wVJlkYe8ozvamx+aiKgl6+
         zO4qZdqf1uVz9y3dZzDXI8b3V4kYTEJ2s3QB4zwaTNs3cRWVEwcKCG5k0QTT6hgm55uv
         exYRPfBLeGsv9CxiYYXqWtZUN0GBq6kXa8C+aCVnL8kEF1Z6K11gMBE4XPcUgg2Ah69V
         YgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=2F2C8WIavqVjiWQNkvpFB19Qq+F+1YPiN2fSPLPAJSI=;
        b=MmG1ZFPax1UuUjyFbL4pjT8ZSLPMAP4LwHxofT2PyL5zzYKo7lB9a+JYH/paGURkIl
         I60Ru5WhNBVkd/Fx4EUVnrbiQB+ctV9GrXY1N+K3vOoYa/oGbUCDd4kl5JI8p3QJUAqu
         qh5gic9eEF8l472b5ITjjvvW2oWlOGvwnegfkXXoFBn4zi4mSQFLKYjM9xN0zfDDuRph
         0QDvc7bQxfg+vc/TmyAIVCVVgVwpon0aAPQdH3hp/1+qvhxpTcn4bS5I9n/HJQBr/8FY
         j50viSqtu1oRwFj9cGXNjJtpBaZhYtkdNWB/PkMZKsbrJk8rP1d1obXlrXuWGcXTntNI
         iG9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u43si9173991qtb.313.2017.07.09.14.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 14:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJM1-0000df-UC
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 17:02:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLw-0000cB-2H
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 17:02:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLs-0004lO-SA
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 17:02:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJLs-0004lB-MN; Sun, 09 Jul 2017 17:02:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8127D61B84;
	Sun,  9 Jul 2017 21:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8127D61B84
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8127D61B84
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40D3753C32;
	Sun,  9 Jul 2017 21:02:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun,  9 Jul 2017 23:02:18 +0200
Message-Id: <1499634139-20399-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sun, 09 Jul 2017 21:02:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RESEND v3 2/3] hw/arm/virt: Set INTx/gsi mapping
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
X-TUID: 4FueYcZQ0B8u

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

Let's provide the GPEX host bridge with the INTx/gsi mapping. This is
needed for INTx/gsi routing.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 010f724..f86c229 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1012,6 +1012,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     char *nodename;
     int i;
     PCIHostState *pci;
+    GPEXHost *s;
 
     dev = qdev_create(NULL, TYPE_GPEX_HOST);
     qdev_init_nofail(dev);
@@ -1047,8 +1048,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     /* Map IO port space */
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
 
+    s = GPEX_HOST(dev);
+
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        gpex_set_irq_num(s, i, irq + i);
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-- 
2.5.5

