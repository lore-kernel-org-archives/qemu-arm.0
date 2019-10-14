Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4502673wrm;
        Mon, 14 Oct 2019 07:25:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0N4QnO87AQZle7p5n4oOA+OpLeACx3Y13+VOCKZHMVqxWhaYeSRUVkO/jdmNi+sSv7wcF
X-Received: by 2002:a17:906:d971:: with SMTP id rp17mr29607166ejb.42.1571063134361;
        Mon, 14 Oct 2019 07:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063134; cv=none;
        d=google.com; s=arc-20160816;
        b=TghYSCC/NtMB1xiSk1uY3MHOoPIKd9b1bkDGSLfsdNZDubiZgU5c8CkSATWRw4IoCV
         dmfIyN5NPfzJHpzi0IcNzezAFH9rbH7onQL583taCVjKPcFCH05lLQv4ObwoJDWJmbiL
         TyyBGDVVWtOUUwQQD1QllosTjVQlMtnDtFf1VBhGZKMd1x+DqVW+4CurJ6kS5GDD8XKd
         Wk1SegfUkgbBEk/M9jcAVu+WsH8Xyy8qZMS8z+pedll5y12QPCZkAK+CNCLPMwHgkDbc
         fG2w9g5zmQvj3EpJm37TJ+/JDQL5QSlnx3/IP29fevBYDS/sCjqB0Pmj5TfTeseWBSn+
         7QRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2SNm9GrWMWgna+jwPG8ns902RvVZgFe5MMabcDWBEZA=;
        b=widAmUTK3JP7piuJpQYeW2n3a8kN4OJjj8CErXAhTlejmfTmlSSUt2Bt9uO1LCiLA4
         Ff5kycaDP5HZcwKztNI9sWnjTjBF9vP3+cvHiX7cOG2BEzN2sAFbtR3DeUMoLpiz+s5v
         Ff4xpF+XKOApNsnZoehvH61AiN8h8C/Q5Uj/eF6akw6VpA3YWw/P5Uv+zg5z0BliLpea
         /64/N0dS/QSmJqIoQphTbjMYnfLTJRMM1YuUZRh1vyNuTcB7Ngw2dOJrqRFp15vWgNYm
         PqYFun9MgfZUNWwTGif5DdWfzkmP1N4ZNQ48sAJINimJLQAxfR3HHoSI7WmnMDVV+IHT
         65mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si11959341ejs.94.2019.10.14.07.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Hw-0007WT-KZ
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Gz-0006ZM-MX
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Gy-0000I7-N2
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:24:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56127)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Gy-0000Hs-Hn; Mon, 14 Oct 2019 10:24:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 992A210B78;
 Mon, 14 Oct 2019 14:24:31 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE463600CD;
 Mon, 14 Oct 2019 14:24:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 03/20] hw/input/pckbd: Remove unused "hw/i386/pc.h" header
Date: Mon, 14 Oct 2019 16:22:29 +0200
Message-Id: <20191014142246.4538-4-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 14 Oct 2019 14:24:31 +0000 (UTC)
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
X-TUID: L7fX0lvBkWT3

The keyboard controller model don't need anything from
"hw/i386/pc.h". Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/pckbd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f0acfd86f7..2f09f780ba 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
-#include "hw/i386/pc.h"
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
--=20
2.21.0

