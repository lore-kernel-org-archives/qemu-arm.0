Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1428197wrh;
        Sun, 5 May 2019 06:57:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypEX5/4NwOgPuEuXrk91J038ulFMk7+DsNn0ihZ8746xlvWNGIjHeIPxMq5HPGLN1UMr4g
X-Received: by 2002:adf:ee01:: with SMTP id y1mr14775154wrn.51.1557064656463;
        Sun, 05 May 2019 06:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064656; cv=none;
        d=google.com; s=arc-20160816;
        b=GwsAqT4jZ0LbOKe7uDtPCp+qz3SFp4BS2TAVqSQEFY/q/v2nZZaUwpdGnn6H5v8Ax6
         pOldTSGgjl6rs0NBI1m/y47HcPcAZUiCU7H2+buVo9zw3sTzALqjJJLg1PAKrJvbbqwQ
         eUiYeLG+FEWijcir1oWuCz3ibBJTKSl4wHbHdgCrNklFO4ZVylLpeNFtVOHBZxfEpNAs
         l9Ao6usdJ8PmCYHKJTCBdNHRiKQ6CwGIVGo6S5QZ2pFnNtA6WGO/IXLBUVhv4zcPwV/b
         m9+KTGA9aB8jpTI7je/Pa7PWleOwPsxJkAI1wRf3suLMYkWlOdlhFtJXpIo3+3ChYFPa
         7FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=G/vgm/FqmDagdu00hXqxV8ezDGzOSsdVuE2fxpL0s18=;
        b=nu6xSf5Wlhpr1qkxH8e7759bGzLL/2mNClmJm6mWWqj8RKtaQ7Bq12nMH74cC+s9af
         BJxwHXeE1v2Qn0bJS9vfJRG9rucfGLmMXq6JfPdu7FcX3mpdF2GbS+WW+na11yAUk14K
         faLA74IiWrnA0os2Jj00ZDJuZMPHlApg5HWFATE+NLzT13FXU3LdI9agLmg3E6gL1ynF
         ZHJROC1dol77xc73PyFS4qMec9/2UH5P9dKDhWmBA9i5kdqyJgV14wTBsTqufEeBIS+W
         dI4oY1JZKnWLu5Bl704qSyr8YvNcpfrCs+9zWKOqRwS63JR3e+P+sQDSFvmsrBJTUWJ2
         qa5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si445882wrn.171.2019.05.05.06.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 06:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHe3-00041u-4i
	for alex.bennee@linaro.org; Sun, 05 May 2019 09:57:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdq-00041h-3k
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdp-0004WY-7o
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdp-0004Vt-2h; Sun, 05 May 2019 09:57:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66E6330820E4;
	Sun,  5 May 2019 13:57:20 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5701C60C43;
	Sun,  5 May 2019 13:57:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:47 +0200
Message-Id: <20190505135714.11277-2-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sun, 05 May 2019 13:57:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 01/28] hw/pci/pci-stub: Add msi_enabled() and
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f19LeJXdX45f

Some machines have an AHCI adapter, but no PCI. To be able to
compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
functions msi_enabled() and msi_notify() for linking.
This is required for the new Kconfig-like build system, if a user
wants to compile a QEMU binary with just one machine that has AHCI,
but no PCI, like the ARM "cubieboard" for example.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci/pci-stub.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index b941a0e842..c04a5df651 100644
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
--=20
2.21.0

