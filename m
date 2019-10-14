Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4517639wrm;
        Mon, 14 Oct 2019 07:38:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrpgdSuewGAS5GidtW7JacWJEFDwhMaW1TWdUJjLsiAvw8DV5sOIrGV3u9WhmJVVJ58vkh
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr28820390edy.278.1571063935160;
        Mon, 14 Oct 2019 07:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063935; cv=none;
        d=google.com; s=arc-20160816;
        b=qOJEd46VlvomHORxuKIT1A91WaxikK9ZCu7Js3WucYLCG/InMNItVsrq8YczV6xmY8
         vZMsecSORGJPgBB4aRuJiPTtO+fyoOpXye2BhxQqADScrb1LuR+6xGZvCvTqT9IPc3FL
         5LP8JODMha7v0AvjfmhHAGhnkPJpcWN9xrrYLr8wGM/uX8k1qONeXw3qkPSfJhKZh4sg
         r+Gpsxx3sKUnxdA1QauGvyhY6S3Q9XJ2Botwngtboh1W62VMsfdIar94NwrCOvEOUtMf
         B5No61gikuVG9C/pUuBOOHGJt5OUQI2/Ny+Dkn3H7FeoxUnJ8UUoqdRVpUpHB/BPWJ7T
         e3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8wq06n0LKStFhK8v/SNeSCnwMskAXuAIbdJvPFdEtbY=;
        b=scBJT35w4Af0N2LS1QmqRZlK9K35pCUxrisEShehefHIYVTIaLQ5isFKh3eAByjjL0
         cy3okhHCBXgyLwmTErf20AawXiVW19Ot/97nfselEVvaEaEZxm9gl/TgXPnz6NILlR4K
         1xm7/CuetDqmPgD39hASa2B/sgcguODx8iaBcSlui38ymmkHB1Zm/S4DllVwtr/Rbm/E
         8dThqIsEG01UAxgmM7GarTTwQgvOGvntYcITnP4hrzAaDDpMqb9ZXbBWYUyW//+1FYLG
         vwqocmt6gJXQL19/U9PWUdl8jzK54n5UjLL++7N1y3J/2j1TgqUP6RaBLT8F40k/J9Qq
         VI3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si13367373eda.27.2019.10.14.07.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Ur-0005gV-L1
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Ot-0006PT-US
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Or-00034G-Sc
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:32:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Or-00033y-NI; Mon, 14 Oct 2019 10:32:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1372C18C891B;
 Mon, 14 Oct 2019 14:32:40 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 545AE600CD;
 Mon, 14 Oct 2019 14:32:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 20/20] hw/i386/pc: Clean up includes
Date: Mon, 14 Oct 2019 16:22:46 +0200
Message-Id: <20191014142246.4538-21-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 14 Oct 2019 14:32:40 +0000 (UTC)
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
X-TUID: 4kC1JXJXWps7

Various headers are not required by hw/i386/pc.h:

 - "qemu/range.h"
 - "qemu/bitmap.h"
 - "qemu/module.h"
 - "exec/memory.h"
 - "hw/pci/pci.h"
 - "hw/mem/pc-dimm.h"
 - "hw/mem/nvdimm.h"
 - "net/net.h"

Remove them.

Add 3 headers that were missing:

 - "hw/hotplug.h"

   PCMachineState::acpi_dev is of type HotplugHandler

 - "qemu/notify.h"

   PCMachineState::machine_done is of type Notifier

 - "qapi/qapi-types-common.h"

   PCMachineState::vmport/smm is of type OnOffAuto

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/pc.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6df4f4b6fb..e5c2dc9081 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -1,21 +1,15 @@
 #ifndef HW_PC_H
 #define HW_PC_H
=20
-#include "exec/memory.h"
+#include "qemu/notify.h"
+#include "qapi/qapi-types-common.h"
 #include "hw/boards.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "hw/block/flash.h"
-#include "net/net.h"
 #include "hw/i386/ioapic.h"
-
-#include "qemu/range.h"
-#include "qemu/bitmap.h"
-#include "qemu/module.h"
-#include "hw/pci/pci.h"
-#include "hw/mem/pc-dimm.h"
-#include "hw/mem/nvdimm.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/hotplug.h"
=20
 #define HPET_INTCAP "hpet-intcap"
=20
--=20
2.21.0

