Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781376wrx;
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IboaaG+d5GeGebE0Z2AdevgInjDtc7nTKE+BglSlsJ/cUHVm9LOaAs+diYZLtaSDlju/GvA
X-Received: by 2002:a0d:c6c6:: with SMTP id i189mr6443097ywd.12.1550908210546;
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908210; cv=none;
        d=google.com; s=arc-20160816;
        b=kPPv0DqC5t5UfjSMlhOP3OTU4wegIntwAuCEwoF3X/Sfl2ETnHcPRLusY7kKSa59yM
         3eTcaPSBH/N4Tiiyr5tg+7zLiCgEvjv7xMSRdr08KZqjkEHhUg/yznaPORvTzEikBa2u
         rwa2S4EQUMfz7a7dL1B86SQOEDI0JvQSKEdTi2/ItEmWmYgq5hLdxphAnwuDGNbFVmuR
         87Hy7GG5EoZ8X8wsiV2YM4yfimFo6PZhJbPPfMzBCzBRZrGNDst3NHbm+i67jvXl3zN8
         aiNoKGCPLxhM6Mt+bIpqrFAo7RqUyvigmzsHpJVOQYQ+NzqjYEuUeSwHococeA11b9OU
         6j9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=73OXjYhV5GPFVlqwbGax6WlG8fmujCPCsoxi4uL9pBs=;
        b=VN2s6MGInNPFGulTTK5KH0SrMTfly2UEq2Jrqgv/HdkgnonqJGhtOFr20TlKxgemge
         RGaUd7rvSgPAq5BvGhYLl0hV/6mt6yUIwxVTaAfdlCb2dlQSEg8wweRErfycVeBHwZNe
         wNTNz3ACta+qlO7wAcE8dfwQqQ2NuU7uLY8H5vhlEn20ansmEc5EJakpMFAbCifsPnzv
         xYzOKmVwtbewt320SxISj9U5+wxAweRDi10AsSCl0BksBXc6dLFQlsbZ1Tp6jTZDON1Q
         rH0WPbSLzgy4vCI+9pYt3imxWXqDzcdprWYr8o7/VlS/hsdRzIynIA++nu+B4en8w57Z
         INGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18si2185262ybk.216.2019.02.22.23.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:50:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4Y-0004W0-0G
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS44-0004SE-4g
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS42-0001o5-2R
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS40-0001jD-4L; Sat, 23 Feb 2019 02:49:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C720FC057EC9;
	Sat, 23 Feb 2019 07:49:32 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9B75D9CA;
	Sat, 23 Feb 2019 07:49:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:54 +0100
Message-Id: <1550908162-22644-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 23 Feb 2019 07:49:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 02/30] hw/pci/pci-stub: Add msi_enabled() and
 msi_notify() to the pci stubs
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: welfCQPNYl5o

Some machines have an AHCI adapter, but no PCI. To be able to
compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
functions msi_enabled() and msi_notify() for linking.
This is required for the new Kconfig-like build system, if a user
wants to compile a QEMU binary with just one machine that has AHCI,
but no PCI, like the ARM "cubieboard" for example.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci/pci-stub.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index b941a0e..c04a5df 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
     g_assert(false);
     return 0;
 }
+
+/* Required by ahci.c */
+bool msi_enabled(const PCIDevice *dev)
+{
+    return false;
+}
+
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
-- 
1.8.3.1

