Received: by 10.25.77.65 with SMTP id a62csp304599lfb;
        Thu, 9 Feb 2017 04:53:31 -0800 (PST)
X-Received: by 10.55.26.38 with SMTP id a38mr2569446qka.183.1486644811828;
        Thu, 09 Feb 2017 04:53:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si7921460qtb.60.2017.02.09.04.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 04:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cboE5-0002bw-4J
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 07:53:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDx-0002bH-7t
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDs-0007OJ-D4
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:54706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1cboDs-0007O1-6h; Thu, 09 Feb 2017 07:53:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E934BAD95;
	Thu,  9 Feb 2017 12:53:14 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Date: Thu,  9 Feb 2017 13:53:28 +0100
Message-Id: <1486644810-33181-3-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1486644810-33181-1-git-send-email-agraf@suse.de>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: [Qemu-arm] [PATCH v2 2/4] hw/arm/virt: Declare virtio-mmio as dma
 cache coherent in ACPI
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKVSwjYkPJN+

Virtio-mmio devices can directly access guest memory and do so in cache
coherent fashion. Tell the guest about that fact when it's using ACPI.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 hw/arm/virt-acpi-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 07a10ac..8955a9d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -135,6 +135,7 @@ static void acpi_dsdt_add_virtio(Aml *scope,
         Aml *dev = aml_device("VR%02u", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
         Aml *crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-- 
2.10.0

