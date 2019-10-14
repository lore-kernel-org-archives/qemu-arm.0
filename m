Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4504753wrm;
        Mon, 14 Oct 2019 07:27:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+gTtryTkk5E8zbOpLQdnLbsUJ5ZMxsCjzETilrTyBDErAofOeDGkNJ8wpKz0N9AO7otf4
X-Received: by 2002:a37:93c4:: with SMTP id v187mr7998252qkd.490.1571063248239;
        Mon, 14 Oct 2019 07:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063248; cv=none;
        d=google.com; s=arc-20160816;
        b=yMFrHweRl4YKitGbbilgR7M45hzmV5N728ORcufbz+uWcIplE9Eb9NtEIfdsn76i0Q
         2+VeWiNG/iF0MbEt1kAsL1fQmHF80P2XVcCCYORyQ6s393C7i4TqKQ0+X31t2qQvYAwD
         aeXeY3uVkiJjnK2imKVhTiV7oSzCfcjj102/4k8xgu1h/aTp52n/wSaktxUh9dIwTT/G
         bWB8pxlYZuHreBA/niSF6xUjxZ3Dwtml+CoLcobfLQ7A4brnEokNyykLxM35xBzyGYea
         NZ+/zCzOolIOgtMXZ/VLY6VkbCBSPbfG463xJ+QedC4z61yuIjnl1ED8p8f/KNtUwsBu
         cbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=A9s1VEZlG8VcrCsUEYhzwPKqm8c6JbvXFKuH2wkqWRQ=;
        b=GzLJEcJWHUxg7/jgxA0aQQXR8pw/RBZOvJn9iufa6eIBpKCtaGPGO+Zuckp9tjCgSP
         uVHigXSNVLEDoJywP1g2iojUfw2dwW8x8mSb5H1rnrdnlAdWvuUHzT1aLiXy/2WNDML0
         ghGueNYM/uXq53Ya7kaw4jJfRXycoPBjujFOKIHN/rjqP3zxIesrnfwYZOuREkc01trh
         Rsr/azkP9TOSTsKZYqFjrdUgcxbQgDacRyh+QFJKK6MSDtcSfYpphIP4JDXv6QPYoeZ2
         xXSvkC5AkYDkSYAmiqbSkUm/nfkUhSuQeBoAGjH2/2ymHzFu8nSmx7hhyD0BPZhSgBnQ
         Mxtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si7829637qki.313.2019.10.14.07.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Jn-0001GP-4c
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Gc-00066M-9O
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:24:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Gb-0000A9-7C
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:24:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Gb-00009x-29; Mon, 14 Oct 2019 10:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 112BA3086228;
 Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B130D600CD;
 Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 02/20] hw/southbridge/ich9: Removed unused headers
Date: Mon, 14 Oct 2019 16:22:28 +0200
Message-Id: <20191014142246.4538-3-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
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
X-TUID: 7dWjO7TGTxCN

The ICH9 chipset is not X86/PC specific.

These files don't use anything declared by the "hw/i386/pc.h"
or "hw/i386/ioapic.h" headers. Remove them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/ich9.c         | 1 -
 hw/isa/lpc_ich9.c      | 2 --
 include/hw/i386/ich9.h | 1 -
 3 files changed, 4 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 2034dd749e..fdd0a6c79e 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 17c292e306..61cee2ae3a 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -35,10 +35,8 @@
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 72e803f6e2..a98d10b252 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -5,7 +5,6 @@
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
--=20
2.21.0

