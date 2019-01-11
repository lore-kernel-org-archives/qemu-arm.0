Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp193705wrt;
        Fri, 11 Jan 2019 06:22:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5xapGNCxouFLvAutO9//SFI0uE2I53MvF/roC3fUQ9Q1sGl2r3sLxOrGBZ9KEZk8p9aaCU
X-Received: by 2002:adf:ef88:: with SMTP id d8mr13671742wro.163.1547216553993;
        Fri, 11 Jan 2019 06:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216553; cv=none;
        d=google.com; s=arc-20160816;
        b=vTSiElGZc3ByBAZSKaa31l/O1GoG+WjY35myODqj5QdAeLV3N22wpVcedGwZRKqPSR
         9U8FE7twtnKmD/muqMPm/XvBG0yl7OX9EW+fw8hnHFET1r3s+olASplYRdLkmIFZq727
         8WnADGlzuidqMzlsgOyiz1+QmCVxSnOsBAMms1yknH51S+PAP/GUCTo1nCD6ETda8yHj
         7hufH1PUw3jv/89f/9b1Te+i17bZ/U9cHWMG18j3Cw5D8fa+M38dLr9aVNAyB/bify99
         bm67TigH4MgMTLKriY9X3jhxrqlc3ZTah7H5u1gVaTLp06yKi4lbrgnER/KnKTQEJjmn
         eS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gKk1awim+9WGVcbTyeM19FfrYoa5z9rtr60ZSJdsmuI=;
        b=V0XHIkrVoMRBNavPz4fJZxwXt5+gan602BHGZV0+R4J6wl/vSjIuzXFXbbSGqd22W3
         7p5cuEbmeSDex0vrPZxUequEYjDvfvxinXVAvTNwY3x/GDLIW3yWyvX0nAb+1yL0tPiU
         CPuafTyCsjm6HDGbwDohOLZBJD0I9gASxWWolH0mNIs4cSoJ8QjgfR5y85swHbqLRBI1
         Yd4X6J6QCCqIyJ6/2HmAqgaFQfYzXBqXM7UaowniH4ew6gKRd34M6RBYQf3RwM9NdFlD
         L8y3RGuSOJ4KNJ6TCeERckmGFofeNvU3UV1VkdGBnqNfZxncQWKA52BrqUJh8uY/OhmX
         lsWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si42157666wrt.328.2019.01.11.06.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxhh-0000vk-2J
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdx-0005cg-J5
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxX5-0005s6-Lt
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:11:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxX5-0005gy-Fg; Fri, 11 Jan 2019 09:11:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5886C05E767;
	Fri, 11 Jan 2019 14:11:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2782E5D6A9;
	Fri, 11 Jan 2019 14:11:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:52 +0100
Message-Id: <20190111140857.4211-11-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 11 Jan 2019 14:11:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 10/15] range: Remove Range from "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mxuy6Yjb9jlD

Range is only used in "hw/pci-host/q35.h" in the MCHPCIState, and
in "hw/pci/pci.h" by pci_bus_get_w64_range().  Let them include
"qemu/range.h" directly to simplify "qemu/typedefs.h".

To clean "qemu/typedefs.h", move the declaration to "qemu/range.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/pci-host/q35.h | 1 +
 include/hw/pci/pci.h      | 1 +
 include/qemu/range.h      | 4 ++--
 include/qemu/typedefs.h   | 1 -
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 8f4ddde393..236ff008c9 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -22,6 +22,7 @@
 #ifndef HW_Q35_H
 #define HW_Q35_H
=20
+#include "qemu/range.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d87f5f93e9..f9c020fd98 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -1,6 +1,7 @@
 #ifndef QEMU_PCI_H
 #define QEMU_PCI_H
=20
+#include "qemu/range.h"
 #include "hw/qdev.h"
 #include "exec/memory.h"
 #include "sysemu/dma.h"
diff --git a/include/qemu/range.h b/include/qemu/range.h
index 7e75f4e655..aaa09c8306 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -29,7 +29,7 @@
  * - Ranges must not wrap around 0, but can include UINT64_MAX.
  */
=20
-struct Range {
+typedef struct Range {
     /*
      * Do not access members directly, use the functions!
      * A non-empty range has @lob <=3D @upb.
@@ -37,7 +37,7 @@ struct Range {
      */
     uint64_t lob;        /* inclusive lower bound */
     uint64_t upb;        /* inclusive upper bound */
-};
+} Range;
=20
 static inline void range_invariant(const Range *range)
 {
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 5e9a070ff3..fb9f29d892 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -97,7 +97,6 @@ typedef struct QNum QNum;
 typedef struct QObject QObject;
 typedef struct QString QString;
 typedef struct RAMBlock RAMBlock;
-typedef struct Range Range;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
--=20
2.17.2

