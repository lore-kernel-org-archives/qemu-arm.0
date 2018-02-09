Received: by 10.28.71.27 with SMTP id u27csp1205424wma;
        Fri, 9 Feb 2018 09:42:45 -0800 (PST)
X-Google-Smtp-Source: AH8x225nZjo6tuNlIrZ7zKJbMspmoN7+0WMIEgVc/+LZwyegAdl8cSUv9h6jOBT4M4i2QLFgGMRb
X-Received: by 10.13.220.3 with SMTP id f3mr2528743ywe.288.1518198165808;
        Fri, 09 Feb 2018 09:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198165; cv=none;
        d=google.com; s=arc-20160816;
        b=P3f6C28b/XvUba97L0Ji15F9wqDcqpApwLAfyEOFLcZB7/U1LIxubotiGmpB6JVxkN
         kXwgV6eFHHnKbeYtq0XTx3BL6mFtPxqKW+gyOXTbPSExUHqChtAg53/M8cEjdKvBJocQ
         /tCx/CWp/W2QC+/3EtWCn6paND675Ff678xRN73Oqw3sA00Az8iU8Z1LlJWJHF+qYBUO
         CEpSNhrcNsdZhJV/W2oRxu0i9yEz72okMGDV/76xUBfiI/0qaOl7f9SjL2yMKHBGpDhs
         67ScxxDmm7OvztBAukHYWb/ylBQ3/nfrwTR+Wri1eLLdBtsRYtnYa4ZuSEGL02V4tCtg
         exKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5V2DyxsW4hrYAUCDTKuLzoA5Cm9YGxpnTSr3bgkLGFc=;
        b=eKw1+5qTemFtZ8U49yM94jRfpVTglmlntxy0ml2z1Y15bYI8xnXNyzHtsTAfL0REnd
         qA79e91KFr/7PBMWBF/2HUNa/GsGzqr6tcVNgnKvDY9lshkoy3trAuyy7QHuAilHHvDG
         kxQdNWRlIYuTgrkNZlzSqmjoPX9GudoA4bGV2FPiGLzrDCS7GthhZcHUl2x91uiHrpTF
         UCRKzbaImofGSn+vy2gR/BerZOdbeS9lj7A49VJGkkE7eZyFv/zkwCbW5iM84UpqeVnP
         qKwnNOV2ZgwOhXIhPRiKE0b8UJm86nEY0qw4NDKKQLoQ5LO9BTokf0ObKtxQPgGbN0Ed
         wj9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si464959ybc.812.2018.02.09.09.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekChB-0005Hi-2g
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:42:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBHl-0002lR-Ar
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBHi-00052T-6J
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:25 -0500
Received: from newton.telenet-ops.be ([195.130.132.45]:43784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekBHh-00051d-W7
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:22 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
	[IPv6:2a02:1800:120:4::f00:14])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 3zdJwh1mgbzMqq0x
	for <qemu-arm@nongnu.org>; Fri,  9 Feb 2018 16:32:52 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id 8fHm1x0393XaVaC01fHmhK; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003S2-Ou; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lO-Nn; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:34 +0100
Message-Id: <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 195.130.132.45
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:06 -0500
Subject: [Qemu-arm] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y8WzaY0yp5+i

Allow the instantation of generic dynamic sysbus devices again, without
the need to create a new device-specific vfio type.

This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
Allow only supported dynamic sysbus devices").

Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b334c82edae9fb1f..fa83784fc08ed076 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 255;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.7.4

