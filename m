Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4511535wrm;
        Mon, 14 Oct 2019 07:33:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtlLwg3fJItjDtpZvfnBJWz9yPn2PgW1rg224km8pq/IZUY+xN0RTmv2XN29Al8OdUm4P6
X-Received: by 2002:a05:620a:74f:: with SMTP id i15mr29773137qki.199.1571063607273;
        Mon, 14 Oct 2019 07:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063607; cv=none;
        d=google.com; s=arc-20160816;
        b=ITWVLGlgsH47fevIo6Pu1jWOeXIsWmpmP9ObWr/rf10I7ZNsQKytCbqV6oImBFu9BV
         71UN0M8zIVsEyNAOjYwdcbwz0sJ//utq5wIQJaKIkggi5/pP+o5FGwq/wgwqLs6RVfCI
         J4mc0Jq8K9L0Gayg/Yrz+9gA2Ko7i7ScmIWG6sPJcW0UdGPzo4j4Xgd083p+7z2O/GBM
         EC1R7pwNe0HoW/MIdlVw43Tyrvzs4bXgiDbXu7AH5h7zNag2HUdWT/9FikyLRvxZ/7gR
         7MvbsWup/KfC4IOz54WZQ71lI0SxDAuRAMWCJAIBCo3QOv1qmhY289SywXbTbkp9SC21
         wuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=oboPq7f043wrtp3GH6f4zLfMoSB47xNJOIu2k0Z261Q=;
        b=R5dVWhKXnz6FGYQkZkBhyVy9Vun1QBGsFEl6yMdk1+Bz19Dt/O/GT+Nz5KdEINZ1lt
         hLkHM610nALZhlnmps7WC8cV9P4z4RB76bzp17knki/nd7qX56P8+rtF+uAvR969LLM1
         NmasNx20UyPM/bkB0eeQL328snO0PqV4ABED4MZY73JQWpN62Qtwo1h0HAO54Bcqf80d
         8hSxXvOgRA0JeVn5XbmCRVjDBQf3N+5cAQ6CsfBAdmp/SgIpWlhC4KoHqFcmwiPLmRYX
         J/Ma1ZETQkq+CD1kqc1PDE1iA2sDdRI8LUmBJvdFYduepK0pCDs/MnENpEvdLKzV6dBa
         6ATw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si16294366qtn.321.2019.10.14.07.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1PZ-00076J-VR
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Jc-0001JK-1X
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Ja-0001D9-Vt
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Ja-0001D2-QZ; Mon, 14 Oct 2019 10:27:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C82C969061;
 Mon, 14 Oct 2019 14:27:13 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70211600CD;
 Mon, 14 Oct 2019 14:26:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 08/20] hw/xen/xen_pt_load_rom: Remove unused includes
Date: Mon, 14 Oct 2019 16:22:34 +0200
Message-Id: <20191014142246.4538-9-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 14 Oct 2019 14:27:14 +0000 (UTC)
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
X-TUID: FBhNxXT3Z5Qj

xen_pt_load_rom.c does not use any of these includes, remove them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/xen/xen_pt_load_rom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 307a5c93e2..a50a80837e 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -3,12 +3,8 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/i386/pc.h"
 #include "qemu/error-report.h"
-#include "ui/console.h"
 #include "hw/loader.h"
-#include "monitor/monitor.h"
-#include "qemu/range.h"
 #include "hw/pci/pci.h"
 #include "xen_pt.h"
=20
--=20
2.21.0

