Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1860257wrg;
        Thu, 20 Jun 2019 05:28:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFQRQofgSh6GuQZxVIczaDOubgJJvEeRFGf4c/lnVVeXg2pgvBbfmOps4Rwz3sMKpY5tWu
X-Received: by 2002:a50:bdc2:: with SMTP id z2mr8445309edh.245.1561033704752;
        Thu, 20 Jun 2019 05:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561033704; cv=none;
        d=google.com; s=arc-20160816;
        b=E02SopuaKi080JYocBd4QAQWrETJLifsdQW/kEw9m2Ub6MbLgPUEVhqk4RcozdWxG9
         8E5+pVd06zmHd8AZ6i6CnzpA8t9m2G6IVezmAbohcb+lJcDEhYTrodavFRGChs1hTkWL
         Z5bU8wZvRML6CCblsTjbhUlzjqghBGVj64NPP+3ZXj8w9P9sJZA+xmewHIZcLT01Tzww
         SWH+TZFvI/Go6SMXyI0ZCm3Eq+ol68XNmzukrpFp5awbGxynlIEBi9oJr4AwJCQhp58U
         b8sESIFT1rAr2AXGzTUlyxnNvwEBTH1gbv9V27iKYaT9hUADo646kNlNmtO82BegyWbH
         CIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NZkVLC2iOCy4h1+L3si0WC7BPSC9iy1wCGi+Zosyfxw=;
        b=nkIAuPEgd4mDHjZusls8Fz5anB/uL4dHtajPM8EGU2uV7yWp9Xgww3l30hc/yplFPy
         V6uuRiIdotqqGF2jtxTUtzTI8mErqrgVrwEVtaiBISP6sPgmlfN2nAjiCslu9tjUfJ7q
         DyjOPnG/EtOGopphfJdYS8b1GJ1/JKpEU6b2bLdPWhMvjp/ZJ/bjyNBlICC+Tl4vG1I3
         A4i79Akg7t6arWymQJtVKR8zae+c+aH/wqougUqJ50yoEXM/Gj3pCumNcisMd1iS7T0j
         pRgw1rPM911agYZ6bJZ/dW6TCNI4wC7FORkEWfmvRcIMIFAJaujFMcsUOASXg2DZnL7X
         +rDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si12639242ejp.49.2019.06.20.05.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 05:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdwAx-0008Lt-OG
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 08:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34975)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdw4z-0004Hp-QS
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdw4v-0007YJ-UW
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hdw4o-0007Dk-LK; Thu, 20 Jun 2019 08:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C18B7CB87;
 Thu, 20 Jun 2019 12:21:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-106.brq.redhat.com [10.40.204.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C09E85D9D2;
 Thu, 20 Jun 2019 12:21:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Date: Thu, 20 Jun 2019 14:21:32 +0200
Message-Id: <20190620122132.10075-4-philmd@redhat.com>
In-Reply-To: <20190620122132.10075-1-philmd@redhat.com>
References: <20190620122132.10075-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 20 Jun 2019 12:21:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 3/3] hw/arm/virt: Use
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVgLfVptKYdd

Enable the EDK2 Crypto Policy features on the Virt machine.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 431e2900fd..15727b3d59 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
@@ -1355,6 +1356,11 @@ static void virt_build_smbios(VirtMachineState *vm=
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
@@ -1383,6 +1389,7 @@ void virt_machine_done(Notifier *notifier, void *da=
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

