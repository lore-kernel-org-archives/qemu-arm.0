Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp829639wrd;
        Thu, 13 Sep 2018 08:45:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYXDEPsHCU+N6QxOyR01TQVZAmZB/rCWAJAMgjQyi08nlpE7Il/vNKcq0bF/7aWRP/Bu/iX
X-Received: by 2002:ac8:1846:: with SMTP id n6-v6mr5749338qtk.85.1536853548436;
        Thu, 13 Sep 2018 08:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536853548; cv=none;
        d=google.com; s=arc-20160816;
        b=L2tz5l3csyxA2cFneO65im9B8yKtqdlj4uDlRn4BEPHx+/39/Az1hSyT/cmYqq3ZsR
         P/umt9SBQE+u6iRTJQPxRHu7W3VVM90uFl7IP8b944wOAhIeKXnJ9U9UkN5Yw/1WqmQ4
         r9MNFQc+OYQ11vt1dqNiAGm/ESTIB98zUoETkLXMzuIsrLhVJlUj+RavYrvGLKx4/1Hd
         7jxyl33PHIpYbIr/0Wk6bCi9+3ovn2KMABwbO1ProE3g2QRxXeM/n2QBik9510zFapeA
         E6zpKVnhqPm7IZ6Ni8uU3sn12LutICUibK0MF5F2vW01QuHCqKDshZP84zBJyqGb941B
         Ci9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=UZ6ushPfQOWpnAPWzFmq1royUbcOuSbkayeB+QlCnM8=;
        b=MbGUJE1ap+cnAIRDIcMIWvV8F26GBACMJntkAX/QwFhnfhlLKQ/cyFSCkccRzYYrpY
         reWHfLM7rgYN4+7+40zBt1U3hnz9nIinANJZJFrCUgAQGx22VJo3ZNhciuqSUzVCrCA0
         xcOhQnsWIiyNejm7vXazx60qn6cZZYE+atP2aIgklI0vY4jkjVj16F7U71crf4zodoEH
         FWTjghL+CzdWjhTlo7CXbkvWVDrNXAxmyLDhVpCB3l92s1niUkde9qolL+nHgJn8yV7I
         VSk1lnrcdJZVQtw38+i+Q3odPiqUIHALyCi5blhwow6YPqDSp3w/biaGtm8Hbni7Ss1R
         JjeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r70-v6si493964qki.234.2018.09.13.08.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 08:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0ToS-0007F4-0W
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 11:45:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To3-00079D-00
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To2-0002vs-1G
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:22 -0400
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18]:50200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g0To1-0002jl-Ce
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:21 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by michel.telenet-ops.be with bizsmtp
	id b3l51y00a3XaVaC063l5FZ; Thu, 13 Sep 2018 17:45:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-00018T-9S; Thu, 13 Sep 2018 17:45:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-0006F1-8F; Thu, 13 Sep 2018 17:45:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 13 Sep 2018 17:44:58 +0200
Message-Id: <20180913154458.23939-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180913154458.23939-1-geert+renesas@glider.be>
References: <20180913154458.23939-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:18
Subject: [Qemu-arm] [PATCH v4 3/3] hw/arm/virt: Allow dynamic vfio-platform
 devices again
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YPOtg72FeNQd

Allow the instantation of generic dynamic vfio-platform devices again,
without the need to create a new device-specific vfio type.

This is more or less a partial revert of commit 6f2062b9758ebc64
("hw/arm/virt: Allow only supported dynamic sysbus devices").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - s/sysbus/vfio-platform/ in patch description,

v3:
  - Drop RFC state,

v2:
  - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
    suggested by Eric Auger.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b57f87abcbfd54b..e33f7776c72fa9d0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1758,6 +1758,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.17.1

