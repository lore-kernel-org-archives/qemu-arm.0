Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1445584wrh;
        Sun, 5 May 2019 07:16:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCSjnHJOSDb913PKIzFx+HyEtlZH9+1C8D7aRPJqhfzkO0ydSZBoEKLdDDlq9thAunMI/T
X-Received: by 2002:a1c:a541:: with SMTP id o62mr13152090wme.22.1557065780833;
        Sun, 05 May 2019 07:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065780; cv=none;
        d=google.com; s=arc-20160816;
        b=vcJFJiYvyBwZIKQUDhJiYVK8vgTpxisZNoCJPyBD6q+kPoSFkGvHIgqehYyFcvem53
         fqhf5S91fjzy1/jGTP4Y1cMkGBuqtfLBTW/7HGiWyRRdNG+1Mn53xnXBWmueI2KpQ9aW
         b8nREXhMW8tSxPNBj97SmU+sLy5kZ0bGkXt6GKp9WiuexRc+O7l6tBeZKPULp7qeZ1Zs
         nHV6sQmbZRj+y50K57oZjrZO9WMbU4bkLKMFujn+2HHz0+pbQ0Hs/B6oQ5fBb+BYMlmU
         Ufc4VMptORZd5ozrKVGRMCtprZJ8uiZ3Wy8RNDYH8gJtubwJiemp7S/mb81FOQnnv9QO
         qm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=A4Ji2jobzRSF5eoAJxtNT9uy7Q7jDmWZxpg9YHBodmY=;
        b=geSAZ/pmVLv/qPJD7ToM0Wooe1JumSugb5wTxm58LSFoGKsuPEIRDx50gwwEnFZpgs
         JgR8/LI9fD5ttVMlxqb9pYRKRcFYs71ILL6aKtgGhLjFyRhdz+DDXhwl+V7yIUZ+HVrU
         SLrrF0/voJRwYO30i4ZJX1slRPHXOesA60/eRzpgYUJyXMupgPxaseJP6lAJN0M2L5T9
         U59JuREYHIEXuloA3fhZRTd05ZNHWPyjjOPOwXl5ZPHIvp+ngr4ljXcQD2iBbNs4xbse
         eogCKtTq4HnunEMD4OH2s5nvbj2M3aM3UiCP4FGvR7j5HQvfCUJMXbYUuYchNsYNOsn5
         ShYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si1763162wma.38.2019.05.05.07.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHwA-0003Lo-Jw
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:16:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeU-0004eq-JT
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeT-00053o-L7
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeP-0004zr-Um; Sun, 05 May 2019 09:57:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73C8B3087939;
	Sun,  5 May 2019 13:57:56 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6258760C47;
	Sun,  5 May 2019 13:57:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:12 +0200
Message-Id: <20190505135714.11277-27-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sun, 05 May 2019 13:57:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 26/28] hw/arm: Express dependencies of the
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpKrY0Ww6QVs

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eff61efab9..9609caef87 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -293,6 +293,10 @@ config XLNX_ZYNQMP_ARM
=20
 config XLNX_VERSAL
     bool
+    select ARM_GIC
+    select PL011
+    select CADENCE
+    select VIRTIO_MMIO
=20
 config FSL_IMX25
     bool
--=20
2.21.0

