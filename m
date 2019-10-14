Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4515788wrm;
        Mon, 14 Oct 2019 07:37:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8ViF74hX0g+ragvfmKPz6xMvp5max7an2WNSA/kGF2lOfiaIPF+XO3RDRUYORJwaDerUF
X-Received: by 2002:a17:906:4545:: with SMTP id s5mr27904691ejq.223.1571063822939;
        Mon, 14 Oct 2019 07:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063822; cv=none;
        d=google.com; s=arc-20160816;
        b=p5wMthCi/N/b5CQFYkfUkaN6iEf0KREFqpku2OUTnt3ySysTxZacxpgav97SdG0Dxj
         ZzRC2/wAbeLSCSzO6fb5iT6AXV1S9H/XV1AuAcCbnaujz8nvflmlqq/taS2WpVE+wLSF
         ZIavkibbA5f7A7id//KjGjkuJn7DJcFM55pgfsWWMJsqVsWMyX4FN3OWEgxveXfFkDDn
         eypbPh8F91ORZ1FtiFngfkHVDmZpOws0YU0n1xh+ExxS2XqJatBWCeHTdQ2v6q1y9bS1
         hrotEiGzk2anqF8pzJG0jKDpNslHYeFqis1NGBOK0++wJs3l/Tz/lyGEw2xAxc4ZDurx
         V9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=KsvdMWXYfaDAf9Ekrx2J/GuZtqV8HhlNv9m26QBYQuY=;
        b=eZgy0IfQvppIvFL4OFFjmcLCCB6Qcz//aem7kHqn4/prWj/iTw4EHnjKuRwWFsnkGw
         csJ7HN5c9HfkFX0iMotvP729g+/OYa/tPqzF8QfqADm0UdDqyBZIao/cTm3kJH+rTTHE
         pBe1TdSpjmI/c/7iZCFaGIB8iIexsKmpEum+u2toWy3L32qS+DUnHy0rX0W0nyxBYvMr
         vwWgP3ggmxhQzA1QfDKGgnvkSgnd0KH5spujxUlJUpon/p7AIBd9HvkwewR6lLbNmtJF
         h0hTcy+7AEQ0Oh00brLP6nvCa1Z32aWQbs8Xg7qKo7i5Dxk5BN/ccEeR1XMBB2ADMMrM
         Pq+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si11095180ejr.99.2019.10.14.07.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1T3-00030w-HO
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Lc-0003Rh-2h
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1La-0001sj-UD
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:29:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1La-0001sc-Oo; Mon, 14 Oct 2019 10:29:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B16E7190C018;
 Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC02E600CD;
 Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 12/20] hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
Date: Mon, 14 Oct 2019 16:22:38 +0200
Message-Id: <20191014142246.4538-13-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 14 Oct 2019 14:29:18 +0000 (UTC)
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
X-TUID: GRq1nG9lr3wp

hw/acpi/cpu_hotplug.c calls pci_address_space_io(). Include
"hw/pci/pci.h" which declares it.

This fixes (when modifying unrelated headers):

  hw/acpi/cpu_hotplug.c:103:28: error: implicit declaration of function '=
pci_address_space_io' is invalid in C99 [-Werror,-Wimplicit-function-decl=
aration]
      MemoryRegion *parent =3D pci_address_space_io(PCI_DEVICE(gpe_cpu->d=
evice));
                             ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/cpu_hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 6e8293aac9..7fb65d9065 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "hw/i386/pc.h"
+#include "hw/pci/pci.h"
 #include "qemu/error-report.h"
=20
 #define CPU_EJECT_METHOD "CPEJ"
--=20
2.21.0

