Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4517099wrm;
        Mon, 14 Oct 2019 07:38:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcIYa2+9yX/S1Aht9NbaYMUhdYebm1qUZR8YvrVmcT2VhpetPcPaJ56wgp5wvkUgQ8pN4g
X-Received: by 2002:a50:ab10:: with SMTP id s16mr28003921edc.118.1571063900073;
        Mon, 14 Oct 2019 07:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063900; cv=none;
        d=google.com; s=arc-20160816;
        b=hIuv5Dxc8skedJCSa7Jn65sq75RIiTUVlz3M39oUw/PrOCh+6E4mfrppRIVluDLKcZ
         hfWtKQxiqOTa9vEfg7PSWDkjVmTTBDOCs6a8Seg8zw3wNaeqA3n217akGRLb342H/2IZ
         UxsE5ubBan3se56meO84lNq6ZM6TNBNW+BX+qPJ6L3lQRQ5t+FXNejNvzdeei2ZZyIfj
         u1CLhjUE0+vL88oDHJwWXjlgnx5vgGszR5Fgw9uMue9Oy6Qea9QYNTpJjJx0IXA/bOf1
         AI0DrxwcGJyG/W+znmy5vU5LRzmmU2w24+dAZExbFGWjpjqH6v7ojbCHCSI+NFM6acSk
         VmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=5VobG24JvPzLlEDcuse9Mydpi5KdB9CPhwIDd54LTCo=;
        b=LTRHhY5nF//KTX84vAKGYrztUIgV03mR7cT2XsAlVs6hSRk9nih5ItJ6oKHpLTq5Hp
         LdqelNjogVns74Unw/0Ghz1i1kAF7AcdudcVeOHSN0jId5ErFGWjPevaRx7n0hdp5nE2
         a1aPfmO0MUQdSNpxppKVDHolfhxBtc7jbE03oFl0yqS679A5z8W0Md0JQGgA6j7BVgpu
         GkVt0So+JhD65lu0+EDv+Y8ZGliWkJDYpOA6aWctLKSHwH7fIQfo5ieZQJcYqfaXa6Mo
         KCbF/4H8ijaTwKDl69wVuQXXE//jhQBmz+22pDsetRdg6wNo2usic7kjAH3/i4fZN/2/
         XFcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rl13si11302452ejb.228.2019.10.14.07.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1UI-0004gu-OT
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1O3-0005h2-Pj
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1O1-0002fV-CP
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:31:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1O1-0002ev-1h; Mon, 14 Oct 2019 10:31:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F7D63086211;
 Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5E7600CD;
 Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 18/20] hw/i386: Include "hw/mem/nvdimm.h"
Date: Mon, 14 Oct 2019 16:22:44 +0200
Message-Id: <20191014142246.4538-19-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
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
X-TUID: VEHpKSR9zrCX

All this files use methods/definitions declared in the NVDIMM
device header. Include it.

This fixes (when modifying unrelated headers):

  hw/i386/acpi-build.c:2733:9: error: implicit declaration of function 'n=
vdimm_build_acpi' is invalid in C99 [-Werror,-Wimplicit-function-declarat=
ion]
        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
        ^
  hw/i386/pc.c:1996:61: error: use of undeclared identifier 'TYPE_NVDIMM'
    const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM=
);
                                                            ^
  hw/i386/pc.c:2032:55: error: use of undeclared identifier 'TYPE_NVDIMM'
    bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
                                                      ^
  hw/i386/pc.c:2040:9: error: implicit declaration of function 'nvdimm_pl=
ug' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        nvdimm_plug(ms->nvdimms_state);
        ^
  hw/i386/pc.c:2040:9: error: this function declaration is not a prototyp=
e [-Werror,-Wstrict-prototypes]
        nvdimm_plug(ms->nvdimms_state);
        ^
  hw/i386/pc.c:2065:42: error: use of undeclared identifier 'TYPE_NVDIMM'
    if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                         ^
  hw/i386/pc_i440fx.c:307:9: error: implicit declaration of function 'nvd=
imm_init_acpi_state' is invalid in C99 [-Werror,-Wimplicit-function-decla=
ration]
        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
        ^
  hw/i386/pc_q35.c:332:9: error: implicit declaration of function 'nvdimm=
_init_acpi_state' is invalid in C99 [-Werror,-Wimplicit-function-declarat=
ion]
        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
        ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 1 +
 hw/i386/pc.c         | 1 +
 hw/i386/pc_piix.c    | 1 +
 hw/i386/pc_q35.c     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4e0f9f425a..ac46936f63 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -48,6 +48,7 @@
 #include "hw/timer/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/mem/memory-device.h"
+#include "hw/mem/nvdimm.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
=20
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bcda50efcc..cff330802d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -73,6 +73,7 @@
 #include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6824b72124..8651b6e2ec 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -58,6 +58,7 @@
 #include "migration/misc.h"
 #include "kvm_i386.h"
 #include "sysemu/numa.h"
+#include "hw/mem/nvdimm.h"
=20
 #define MAX_IDE_BUS 2
=20
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 8fad20f314..91ba231ef1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -53,6 +53,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
+#include "hw/mem/nvdimm.h"
=20
 /* ICH9 AHCI has 6 ports */
 #define MAX_SATA_PORTS     6
--=20
2.21.0

