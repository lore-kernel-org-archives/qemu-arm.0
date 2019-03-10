Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9955045wrx;
        Sat, 9 Mar 2019 16:48:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR8HPSyHm6XReP4bIDaqJKYwLRLm7fjZOTl9TiC1NW2BRAJJqyQsSv5sczabpiTHYQMgyU
X-Received: by 2002:a81:3a81:: with SMTP id h123mr20698329ywa.412.1552178929809;
        Sat, 09 Mar 2019 16:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552178929; cv=none;
        d=google.com; s=arc-20160816;
        b=QSxopSwrG3GpLvLP5quBv9wq0dm5sVP5lSk/LWLsOOBTfzn3vy5phc/tgO2ymoEPuK
         BdguYPFSvyaH04B5XvVXUYaOSKzCirl4xdUbhuWNdLlcBS87n2hI9kAgEI1rPfqyK2D5
         v3CjMjrE3sBTdmP2Mwiob1WIrBb/9e+k0N3j4J6a7jgBIzmOobIOHrC3yLXZxuBWTH1A
         3KecX0I3PDZ0M3dtUGE66YT5+RgpF+18sulyAV1P9CNHYuTJNLnzwlNZiMXGnqUcpvd9
         ilEHYwiNb8MKvZw5Dwt1Xa7jiAlAs7UEoj1eiLIACeUvisEjm4koUoEjemrDpXU7xJM1
         dukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EoUUSfNq5v0KFuF0irCIViSv84pyJZY3pEBLYsE/3p4=;
        b=QekBf+qpyZaP3O2QjS0L2qmHiEgaPWpldoC3RXBfG3qzjQ9IPDSGNxSnjZl8ehdEjY
         Gp/ji2O9LNphAT/nL/Qyrj4K3Ty0abCJbqxKO+t0k/va0KycN3yQoTVfOdfRfnZtuuyF
         akJ+PnFqJzI8YzOA11inlAPMM/FT3cNBE2pPK+RaOELgF+yMPlsMYCih3dDvY7cxTMj9
         r9ksJbWVyT9/xbTvGVMzSuetIiSk+fGnnjVcRrivEOrLq0bLKVjFcQtKXUbuG3iejNBC
         6NMeVO4I0nT6Zioubnxuj7XL+9F/+PBd1efFMcvPcy86rT2nZi8jupxisk1avq7T2jww
         QTJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si892640ywg.369.2019.03.09.16.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 16:48:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2me1-0001QN-AL
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 19:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2mdh-0001P7-0f
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 19:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2mdg-0006hm-81
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 19:48:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h2mdg-0006hG-2E; Sat, 09 Mar 2019 19:48:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56C674E916;
	Sun, 10 Mar 2019 00:48:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F2A1001DE7;
	Sun, 10 Mar 2019 00:48:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Sun, 10 Mar 2019 01:47:49 +0100
Message-Id: <20190310004749.27029-5-philmd@redhat.com>
In-Reply-To: <20190310004749.27029-1-philmd@redhat.com>
References: <20190310004749.27029-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 10 Mar 2019 00:48:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 4/4] hw/arm/virt: Use
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:Virt" <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: isffvbM/E+Fu

Enable the EDK2 Crypto Policy features on the Virt machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7f66ddad89..940f41056a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -55,6 +55,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
@@ -1304,6 +1305,11 @@ static void virt_build_smbios(VirtMachineState *vm=
s)
     }
 }
=20
+static void virt_uefi_setup(VirtMachineState *vms)
+{
+    edk2_add_host_crypto_policy(vms->fw_cfg);
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -1332,6 +1338,7 @@ void virt_machine_done(Notifier *notifier, void *da=
ta)
=20
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
+    virt_uefi_setup(vms);
 }
=20
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
--=20
2.20.1

