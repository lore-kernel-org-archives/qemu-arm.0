Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4524707wrm;
        Mon, 14 Oct 2019 07:45:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxqo+28NzxqGnwcFfr+ZM4fFvE6RSB89WWkPp0/SLHBrvqI3EEsk1WLiRzzdasO4yFcCLa
X-Received: by 2002:a05:6402:656:: with SMTP id u22mr28954778edx.70.1571064326247;
        Mon, 14 Oct 2019 07:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571064326; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9D3L02vhbymzvw4FEpRCWKyTRbeKx4sOTyKlNxnLOq9xlN4f3uPLhIMgw+yyP6x2i
         DxMRg9UwohFOmRsC+lo/Bf/mTpcTMya0E/irZwMldHhJMewHVrJKGwEyYVvDUxEnszcu
         ALT6UTH9YDqousDCzDB/vzvrKCrmpB5DVQXCV6dfnZuNgipeOtr5KafTPebCwLE15CLX
         TSgXWl4RvIAw/CrzTxSQS/nYo5A6WYRP+IIQK/6tCv/YsMcrhdW3XzvBB9oTjo0haOab
         cfJFmMTv8/+jraTiK53POV9wjPGxl8pj6G44bqD3CTN3Ysl+MJnjj0hpkXl9Y4E2Atco
         GKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=zgwW2dE9EkGeGDTVNUTPiHGkLsY5zzThIOmANXgiv3k=;
        b=E/0026pCrpyFWO5rYgcvAnhAcN38G7GgQSFfIDg8kuT6J++XGH8mOh4oEJYdv2iW13
         Z7HWmo2K0wiWlL9OolzLcQEwwXzs6TQvgA2bjSwewqsyTIubIPqDaDd6Y21OyNrhVUxX
         WDdtZRTaEWzrMApKk2jJnzkSN+jBHwm0VWT1U0kPcBlGDWgMedH2kLTruD2pxEyl3Pfj
         ynuHxxCibXD5TI+Wzyo0glC2h/ksggotV6ANZxQx0kyl94NvIMfMBu0wr44BTekRHs5m
         mT+gSh/oANHo22Hz7btOUoQO35ptNRi8oCaluOgVXNfkxn9/cGG+AyChNHa9jAPXA1v6
         VhIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b42si12607704eda.367.2019.10.14.07.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1bA-0004gn-W6
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Nc-0005EX-1r
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Na-0002Xy-TR
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:31:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41698)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Na-0002Xl-Kz; Mon, 14 Oct 2019 10:31:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA45476525;
 Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 995CB60126;
 Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 17/20] hw/acpi: Include "hw/mem/nvdimm.h"
Date: Mon, 14 Oct 2019 16:22:43 +0200
Message-Id: <20191014142246.4538-18-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i3fBUDWA5aM6

Both ich9.c and piix4.c use methods/definitions declared in the
NVDIMM device header. Include it.

This fixes (when modifying unrelated headers):

  hw/acpi/ich9.c:507:46: error: use of undeclared identifier 'TYPE_NVDIMM=
'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/ich9.c:508:13: error: implicit declaration of function 'nvdimm_=
acpi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^
  hw/acpi/piix4.c:403:46: error: use of undeclared identifier 'TYPE_NVDIM=
M'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/piix4.c:404:13: error: implicit declaration of function 'nvdimm=
_acpi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration=
]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/ich9.c  | 1 +
 hw/acpi/piix4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index fdd0a6c79e..4e74284b65 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -39,6 +39,7 @@
=20
 #include "hw/i386/ich9.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
=20
 //#define DEBUG
=20
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 5742c3df87..11a3e33e5b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -39,6 +39,7 @@
 #include "hw/acpi/cpu.h"
 #include "hw/hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/xen/xen.h"
--=20
2.21.0

