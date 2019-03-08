Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7816215wrx;
        Thu, 7 Mar 2019 17:47:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmLGMXc5kyN7gbORoIoyMGUUpVli7b9gnVUrd/f2XNT2OEVfi5Vw1mDL/pLgl4CuNJ3bHF
X-Received: by 2002:a25:4254:: with SMTP id p81mr14188599yba.178.1552009667176;
        Thu, 07 Mar 2019 17:47:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009667; cv=none;
        d=google.com; s=arc-20160816;
        b=jTrrx5GfZ/cW7dVdyJcJmM/3On9UKMjHQRQqjaHFPHjIHl7WhQqGucOFJh1xIbm+KH
         LhHevE3R186dixbPS2z1cWVOsTwEBLqtgqXlFvjiM8ebflVNRyxX2x8jNj4J5hBGeuJi
         Y9vMP4t/Qfa5W/fb8cre8UqGZLJmcYfpXfjhi8HIWec6DLu0Dcp7dQCHRAasXinTsRW1
         A9iLGtlMRIVH2ec/au5iySaqoh0vrqnrAbMlX0W6MDXMIfwfe8H1DK6scewsnHApUyUb
         uxJYGzpacG2Gl6H1iuAE6/iF2/dl1BBkB12Y6XzWVpxuAl/g3/RRg//o/xZ3urDwflVb
         93Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YHz5W732Qar1j/oezp/tZwrcV6uIJXTsJV+5gE8NIG4=;
        b=j402r1Wg+xGoO2niK+OYtcX1LN3tO/uqLPDdceBTndjyHt8zuKkSRkRntVdtYZWX7N
         lAVWfAonResXbBu/YymiEnTn7KyAEuu7v2WnHcpAeGCgi6vlDPlN5LgsidYqc23cezFt
         1KcLB0z+wbpAOeoltRVDRSOYtVZXwhX9f3SUGVcRaBbirX8jZHVwtvYppiBDV2/Dqc2w
         y8MPujg4/xKqdRmHaOYHiIS6RqkPrtQvIgqBwXn3aEQ/tp6g3JZ3GmMr/pcyS5V7UFxe
         LTbo3wk2qqE4hPMW340HTPmY8TMxhLc26clbT2+DQZM0gs6NKXsV95vbsvxO6AiQypQR
         a9EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si3920462ywe.230.2019.03.07.17.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24by-0006Xt-II
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:47:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Qm-0004wD-3h
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:36:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Qi-0003vM-8M
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:36:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Qc-0003gf-BJ; Thu, 07 Mar 2019 20:36:04 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1495358596;
	Fri,  8 Mar 2019 01:35:56 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E327A60BE5;
	Fri,  8 Mar 2019 01:35:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:22 +0100
Message-Id: <20190308013222.12524-19-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 08 Mar 2019 01:35:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 18/18] hw/arm/virt: Use
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOuxLgUyo3fw

Enable the EDK2 Crypto Policy features on the Virt machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bb7255a080..bc2b14af48 100644
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
+    edk2_add_host_crypto_policy(vms->fw_cfg);
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

