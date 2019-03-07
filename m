Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7196664wrx;
        Thu, 7 Mar 2019 06:19:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwD2vUNidTzwI2FkbRRFVuzLnayW6kMHlN1GYSEg+3r1Z8QvE8TDKtQXLB5LhsqK047jM2o
X-Received: by 2002:a81:3347:: with SMTP id z68mr10013101ywz.11.1551968376258;
        Thu, 07 Mar 2019 06:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968376; cv=none;
        d=google.com; s=arc-20160816;
        b=DKcBzDGXid0xrgmEDhkG0qaO0ky+bkPaKDmpjuE8tJTq0YSULyiDfd3GkBlRRke05l
         PPlOgWtJ87lGBhTQsJqS7h8aswm/lJOZmRyc67bxmAPCmXJvWWXRQbZG4KWWwglITL0u
         VBfqakfyX8BA2Q94iHfhv/MC+LAVg3BPa/bTCTyVRqus80uNC+hbaS5R+pvnJMuiG2te
         3ehtXMFDkPwtTVXD2CZ1K6lhnfBw8Kl1vrOHYl6gGuiS3Yc8UtFJ7YSbma/SrvpARgo6
         RzGGYOUYRpP8V6P4fSDYNozFUjKwU8k8BLZssMrkNMyo6b8WGc2ezOVtL7sTVV0A05un
         Xegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=73OXjYhV5GPFVlqwbGax6WlG8fmujCPCsoxi4uL9pBs=;
        b=NTI1wy9fCSQh5wM0mLkFNIMGpqYLiZ4a2AaWI6AaCaweLtqVbE6nZKj/ad1mb5oEWs
         PL3v4poaBZVFAh5BuuohBr+6Q2xKXyRIqJWexJ6T7j1Jwbnp3xfbTlNgkXh7vivwXFZv
         zRNOig6EWBxvy2sL4Ztl5DPLiX3o0UdnxPqbdT+Fwyc7r5qDnGPYbj0hQZkEiaHmVC/Q
         h8U2QjYXOeSeKl0TimVyPBsB742hoxmd2LvzTbzGfABF5UnHzwSmza7iPggKf46GQ/LG
         QsaD0lsNPsdjRlUUEXYEWYU2d+vDlqEOtfRXu6tM8BJc4GEIM87oHhFaeC3SzG9dNpRI
         Zxsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si2607900ybo.413.2019.03.07.06.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:19:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1trz-0004NA-Mz
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:19:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1trh-0004Gd-8g
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1trb-0007yH-Lr
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1trb-0007xs-FH; Thu, 07 Mar 2019 09:19:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5FDF3089E61;
	Thu,  7 Mar 2019 14:19:10 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A17A65C1B5;
	Thu,  7 Mar 2019 14:19:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:26 +0100
Message-Id: <1551968334-18982-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 07 Mar 2019 14:19:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 01/29] hw/pci/pci-stub: Add msi_enabled() and
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ND0mp0QQA6QX

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

