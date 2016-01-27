Received: by 10.25.159.19 with SMTP id i19csp2423671lfe;
        Wed, 27 Jan 2016 05:52:13 -0800 (PST)
X-Received: by 10.55.27.193 with SMTP id m62mr7839223qkh.59.1453902733497;
        Wed, 27 Jan 2016 05:52:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si6676755qgd.61.2016.01.27.05.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQW4-0002of-Po
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW2-0002jg-63
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW1-00029s-DN
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:10 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:33184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW1-00029i-17
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:09 -0500
Received: by mail-wm0-x22d.google.com with SMTP id l66so3569060wml.0
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kEW56HVBFvuQTMjsJ+gLpiZFhLSeIYnrHPa0qOfsN0A=;
	b=iXmNgbQ5yFdNG+vOTGbqstYetFISWSpgrXF1IzRPDHnLdxlwhhLgwWihkpYPv+Atin
	ql++UHGfURp6OyByFQaR7Mvkva2qm9xB7JS+obZ7o49MdHYdYAKJ5HKx+iC65NI2j95O
	RBvj0VSLgwLL7ARIjm8LaakOPpY9BhKYk3LOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kEW56HVBFvuQTMjsJ+gLpiZFhLSeIYnrHPa0qOfsN0A=;
	b=dGlUeLI6AXMyE/WtgLUsqWG/79UZkUlKKNuviqsLMoJ5gkiLTh/vOlL+sKeifWFguC
	q7WSJQdchwAnlWWDNkuxhzsORj6mLcQXWklE9b0u9ztGUN4D4IZaxw2/+ksdi/VKe0fM
	vAdZgO6vzL1qWgIVpT4tL+mZ3nKMbsEk8X/MPtRwExfYCE+wcGCiVhFVknj8bEuIrcsW
	kHu4pWToS3/JoX1lhfHO5Gw+M8pMv12YKEz6GTtvX1mrSBCSDlyJGIXzQUGtYKMdHADK
	/D+cEknNguRnZtsc4YI85cUfhHLnUzmHsX5Fzn+2/RvG//3zw2/82m2LJJmdsbYp9KiM
	97gQ==
X-Gm-Message-State: AG10YORzm+HM2RmzFMVYYEsjxKV8IDJ50KrGZN6PKQHw8gafhVvTm88pY9KHPdYVnltBspcy
X-Received: by 10.194.71.77 with SMTP id s13mr34491063wju.175.1453902728240;
	Wed, 27 Jan 2016 05:52:08 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:07 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:51 +0000
Message-Id: <1453902715-25304-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 3/7] Generic PCIe host bridge INTx determination
	for INTx routing
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6oyNOaBUNx9T

This patch stores information about assigned legacy interrupt numbers in
GPEX host structure.
This is used during GPEX INTx number determination from a pin during
INTx routing.

Signed-off-by: Pranavkumar Sawargaonkar <address@hidden>
Signed-off-by: Tushar Jagad <address@hidden>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15658f4..3839c68 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -826,6 +826,7 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     char *nodename;
     int i;
     PCIHostState *pci;
+    GPEXHost *s;
 
     dev = qdev_create(NULL, TYPE_GPEX_HOST);
     qdev_init_nofail(dev);
@@ -861,8 +862,11 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     /* Map IO port space */
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
 
+    s = GPEX_HOST(dev);
+
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        s->irq_num[i] = irq + i;
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-- 
1.9.1

