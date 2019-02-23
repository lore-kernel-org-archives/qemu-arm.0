Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7797075wrx;
        Sat, 23 Feb 2019 00:14:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbZNfIliOoL3kIUKx53YceHRKTNQQJmC6MoBHoE+LIj9RNp7hDI9/hjePOcWsO5nTSlUaiO
X-Received: by 2002:a81:9183:: with SMTP id i125mr6357892ywg.175.1550909660678;
        Sat, 23 Feb 2019 00:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909660; cv=none;
        d=google.com; s=arc-20160816;
        b=edpsbMpMu/QqURrf3eVH99I8cw/3NQN6h4rgY5s2a7A1VPD417kyGrwxIZrQX28PGF
         4NdDhicXmTgNusy5yenjaPHLGAUPczBhENu9a3uzMa28WmAENoVpC2V73lKyiV9jBu5i
         udimGyc3wX+GXlOnpG498ixOEULsuing1PUJedCmVU0WnVUItBtaMVcg020k6HX0V6oy
         R9nXrjTyAMULvhd8rVi61BET7JBZ9a/osl3CaTQyBfU4G5cBQuFf7z20fVDzjvdl7byb
         DxoKxBH83uNbZ6X7GtWzN09g1hHvVHK93ZrtMfpfHUrnta4r/GEHKrFJc10g15rNbEh5
         LBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=tbfkUJeoaUKqF3QGzpTjZbBlXpLuCa8Olp/I50JwuqQ=;
        b=K+orcWJcmk0nJRHSNtloYgbQqVoHIicnC/oT2/GmGeKcXhQR8T13IVaGTgWNlYiOPF
         u2oS6BXAY8JAtx5p2EFhCayOIKQR1RamfseqUyJERcAZbt4Hc3iMbbK4eFUqFe7lHIyT
         0Qs3EW/aFd13Qoqd4IpMiawhr9s7fCLluZLBgJ/64neqDXJy7Zs0xRhzPSUj2FalJH4r
         t4z1PwXgk7iz6G3dTrJgBjTP2eii2wrjlA/o23zZr5Em/oHhpAgcp3C8mRxjTBbpOmEJ
         MvuUxo/OWaDANaoP/+XVmcpKKJoRleC4MWplz5PdVgxZ+wJfnezRz1disfG6mEolTbJc
         z4Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x134si2300970ybg.488.2019.02.23.00.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:14:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSRw-0006KO-5e
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5F-0005PG-5m
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5E-0002zZ-GQ
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS5B-0002gh-42; Sat, 23 Feb 2019 02:50:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C3E4C057EC9;
	Sat, 23 Feb 2019 07:50:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18CF15D9CA;
	Sat, 23 Feb 2019 07:50:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:20 +0100
Message-Id: <1550908162-22644-29-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 23 Feb 2019 07:50:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 28/30] hw/arm: Express dependencies of the
 xlnx-versal-virt machine with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QE95QQHwpWcT

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 744b5ff..06e9e9a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -303,6 +303,10 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    select ARM_GIC
+    select PL011
+    select CADENCE
+    select VIRTIO_MMIO
 
 config FSL_IMX25
     bool
-- 
1.8.3.1

