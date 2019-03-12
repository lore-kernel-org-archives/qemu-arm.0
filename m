Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1004121wrs;
        Tue, 12 Mar 2019 15:58:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwr1kU98tNDun/eFxRAgVG6ELYrNPURMpk5bDVKUuCfDLnun6vLDWYQ6sxNBv3wrRZQ84n+
X-Received: by 2002:a25:8b02:: with SMTP id i2mr34114780ybl.311.1552431504637;
        Tue, 12 Mar 2019 15:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552431504; cv=none;
        d=google.com; s=arc-20160816;
        b=Oq5AvV3Z7JQZt6Tx84e+8qr/IJEg3V6Y59x48W/w8XSq1y2spD0XC0DrOPtJiW1yfe
         H8/ncNGULU1e7b/VlspaL7p6gHAzFSlXKdnzOWyNrJcVPVUSEOrLxYe+frGqFILX1hF/
         XSSefMNU4ZrWB1otDwB7AY6zsqTX2ZtsHlN6HJpo4JlXD3YtlQnh8u69aiGrB6eas6ju
         GCZwn2BIxE1U8r981v/pqYtN5uHEKA+acOiQwZUnOnc+JC2vb3dqS8obK6+pUYWBzRB9
         c9Eb46Gxkp4BcKlpiEwRr9RjqfiMOoSF+UPiZ2gyVmkqq3tbU6qgpvQ6JhBHeky18xdF
         dJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CVNC6Z0d/B5zyxt+vPn7sQd1qaIM5GFyeZMj6mA6eCc=;
        b=fHOuTiumSTWdQmmPmvL2PvMnZAL3qun7446Pgj/cYFGNTCYX2GEAD5i2xcUUSevpWY
         D/OixVduLPPlDkoxk8XMTn9DB8+8kEmUX2culKCv6GD8Ha24JqG3Yi4scMYQB1tsLbYq
         D9PMQa/OI2CUqG59tlRhx6j36V9d7/zf4IBBlhJa/Z823JMzvZqMaHj1WnKYcHo7LwZZ
         FXz9m3m36TNw2gisCikuliKN/po7F0qW0Ydwfn1gPugBNmPC/lv4fkNI/assfYGfwV6b
         tHBXdR0AqAJ+lbaOcjZIIdCnsZqhKI8oiYvm77fpKEQ1UYrj+QYA12zc4lxZy6xzsyKs
         smOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si5616471yws.295.2019.03.12.15.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 15:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3qLn-00029q-Up
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 18:58:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qLE-000273-A9
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 18:57:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qLD-0006Nh-5i
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 18:57:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3qLB-0006Lf-8G; Tue, 12 Mar 2019 18:57:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 887053086201;
	Tue, 12 Mar 2019 22:57:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F47660C1B;
	Tue, 12 Mar 2019 22:57:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 23:56:32 +0100
Message-Id: <20190312225632.29777-5-philmd@redhat.com>
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com>
References: <20190312225632.29777-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 12 Mar 2019 22:57:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 4/4] hw/arm/virt: Use
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u4iTW3qGufh7

Enable the EDK2 Crypto Policy features on the Virt machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce2664a30b..927d4ff31a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,6 +56,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
@@ -1301,6 +1302,11 @@ static void virt_build_smbios(VirtMachineState *vm=
s)
     }
 }
=20
+static void virt_uefi_setup(VirtMachineState *vms)
+{
+    edk2_add_host_crypto_policy(vms->fw_cfg, &error_fatal);
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -1329,6 +1335,7 @@ void virt_machine_done(Notifier *notifier, void *da=
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

