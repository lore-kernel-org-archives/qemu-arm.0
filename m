Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4503545wrm;
        Mon, 14 Oct 2019 07:26:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqww0vg2AwzDPA9AY5j+L7A/Fs8veJtrJ1SZ/eC12RQePlVNhsyD4WdqzYN80SoTS2grc3d2
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr30873870qvp.73.1571063182910;
        Mon, 14 Oct 2019 07:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063182; cv=none;
        d=google.com; s=arc-20160816;
        b=AEjhntDulwY2gb5Eavo7Z2U+KNHzjECJZm+WDFBLquHKi2xdCacbLiiYhStHPO1zf7
         /hi9bItFl0gH7Pg29aetL5nBe5sTrdLX/8dfms22/GNmiHT7K1fzuPF7TGGJM3mzelip
         LdbSUTmqNsurrL5oONC0XMTgxyF83O21oOwFIx/TBF3GrcHiVUUSwt4LSnwIPx3M6cJY
         F2R0jEGGN3g6VGczogcRSj7q/itB3uFlRfIPiYFrE8oT2mrdwjN86Uob/Lm09vi46Igy
         Sf6wM2ZNHTzGRGWT2J//pveoHPQfgnMvF48JmtteAcdtMBlsSxbwf0ZCHMfMkJXbwr9f
         LmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aK78kOHCYsYDyNWX4Eo/1Wl8VB06PbK5q3RGlRWJXeI=;
        b=SrQqC2hYzUvIAS/HhXWm8Vc+oCLDgwbtwy8bomKEk7a7/srv99PN/9QbQnaZERqciJ
         fkeYw4vWKCfptB7sPX8iAYtw7iY+cZAL3InAMp0o9wywwutYABJ66jFvk7pXIQavTnZj
         X5v1qhkVW67MofzNp+2CaZNF+H6QRx+szuG1LdncJ/aihGnzjK2TzGDYh/6gweZON0xc
         u0MVuLyXceo+aKsT/nZcKNzyhSy4zzkMnTW4klDkCqczJDuCeniu1Y4f8/WQXjKKqr4V
         xE4vaAQbGJUpzVmtz0OGiOT26katduWbR2+5S7o3N19lcYDKw0gKSyAv2Wdo4OEX/9UH
         PCag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si16779533qvc.116.2019.10.14.07.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Ij-00009F-SB
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Hp-0007es-WA
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:25:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Ho-0000ak-R2
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:25:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Ho-0000aa-LL; Mon, 14 Oct 2019 10:25:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AAB8044BCF;
 Mon, 14 Oct 2019 14:25:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8DF600CD;
 Mon, 14 Oct 2019 14:24:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 05/20] hw/timer: Remove unused "ui/console.h" header
Date: Mon, 14 Oct 2019 16:22:31 +0200
Message-Id: <20191014142246.4538-6-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 14 Oct 2019 14:25:23 +0000 (UTC)
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
X-TUID: qvoAbR28CGFb

The timer models don't need anything from "ui/console.h".
Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/hpet.c     | 1 -
 hw/timer/twl92230.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1ddae4e7d7..4772cccfe3 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
-#include "ui/console.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
diff --git a/hw/timer/twl92230.c b/hw/timer/twl92230.c
index 63bd13d2ca..d0011be89e 100644
--- a/hw/timer/twl92230.c
+++ b/hw/timer/twl92230.c
@@ -27,7 +27,6 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "sysemu/sysemu.h"
-#include "ui/console.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
=20
--=20
2.21.0

