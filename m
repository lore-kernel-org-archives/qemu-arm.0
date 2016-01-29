Received: by 10.25.159.19 with SMTP id i19csp1053535lfe;
        Fri, 29 Jan 2016 08:54:10 -0800 (PST)
X-Received: by 10.140.164.141 with SMTP id k135mr8441556qhk.37.1454086450480;
        Fri, 29 Jan 2016 08:54:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 89si18516844qgt.32.2016.01.29.08.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCJG-0001pG-1D
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:54:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJC-0001j7-7N
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJB-0003x8-DJ
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:06 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJB-0003wn-71
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:05 -0500
Received: by mail-wm0-x22b.google.com with SMTP id r129so76809721wmr.0
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kEW56HVBFvuQTMjsJ+gLpiZFhLSeIYnrHPa0qOfsN0A=;
	b=ONp3u6Bjrjg2J9AwxVh/qdPq0FZy17LqZg3WtQQF9tZmtxEYyrHCpPdcxdySUVN3EJ
	v2DhLg6IxWRs8x/mYlpi+RWJzebSf42EIjcQylkvOVwNBLfE1DbDaJkhUuD1DidE55Cc
	u0U8U7dsAKqA5/xdQO/Aql9YRZ+HJISZtz4Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kEW56HVBFvuQTMjsJ+gLpiZFhLSeIYnrHPa0qOfsN0A=;
	b=nOMZO5Vtgi/scDNBOsxEB6QsGkShE3pbgNzTskxXw7fwWAndMU+Iu9/aAu4wqnsHKp
	RaYPV6P/ZUwlFxm7dpxEgSPlkhI6e4+vs9MCIWkj9EwqUNcg8wxo6Vgwcl5R4isRMmW9
	I77vARb7UVf4xSsNWuhNmnMneIZX36UpSUJieqGwcopuHZo3PePJyRIqUjd2KzR3HjNW
	b8K56JWBf99g1AQUTpHR3AWjvXhajQON4mqCnP57jPQh+FnErKhPjN+niVDuK7knk37o
	l/tnzJd/RkZFiZ9tjVyi17rvxD09erxFxi4alYX6AzF7NRXDuUpU9pn245VUlpDwiRi1
	y8xQ==
X-Gm-Message-State: AG10YOTwDl0zASvnJqAHapqgupBWOjgCpcehCGcwfTrwD9W959N7GMRwkZCvdkkHwpgxImPb
X-Received: by 10.28.158.194 with SMTP id h185mr10805113wme.48.1454086444549; 
	Fri, 29 Jan 2016 08:54:04 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:03 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:44 +0000
Message-Id: <1454086429-4373-4-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 3/8] Generic PCIe host bridge INTx determination
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
X-TUID: +55xMadS9e0t

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

