Received: by 10.25.150.194 with SMTP id y185csp1556147lfd;
        Tue, 8 Nov 2016 04:18:20 -0800 (PST)
X-Received: by 10.202.108.8 with SMTP id h8mr1478345oic.146.1478607500391;
        Tue, 08 Nov 2016 04:18:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o187si18886195oia.11.2016.11.08.04.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:18:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45M3-0001Jv-Ld
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:18:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Ly-0001HP-Nr
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lx-00044u-RQ
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45Lx-00044V-LP; Tue, 08 Nov 2016 07:18:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F18C7804F8;
	Tue,  8 Nov 2016 12:18:12 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA8CHsvn027755; Tue, 8 Nov 2016 07:18:10 -0500
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Date: Tue,  8 Nov 2016 13:17:53 +0100
Message-Id: <1478607473-25851-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1478607473-25851-1-git-send-email-thuth@redhat.com>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 08 Nov 2016 12:18:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 5/5] MAINTAINERS: Add Fam and Jsnow for Bitmap
 support
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
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSQoH2BQD9N3

From: John Snow <jsnow@redhat.com>

These files are currently unmaintained.

I'm proposing that Fam and I co-maintain them; under the model that
whomever between us isn't authoring a given series will be responsible
for reviewing it.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Fam Zheng <famz@redhat.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05b1c97..d8575ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1158,6 +1158,20 @@ F: block/qapi.c
 F: qapi/block*.json
 T: git git://repo.or.cz/qemu/armbru.git block-next
 
+Dirty Bitmaps
+M: Fam Zheng <famz@redhat.com>
+M: John Snow <jsnow@redhat.com>
+L: qemu-block@nongnu.org
+S: Supported
+F: util/hbitmap.c
+F: block/dirty-bitmap.c
+F: include/qemu/hbitmap.h
+F: include/block/dirty-bitmap.h
+F: tests/test-hbitmap.c
+F: docs/bitmaps.md
+T: git git://github.com/famz/qemu.git bitmaps
+T: git git://github.com/jnsnow/qemu.git bitmaps
+
 Character device backends
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-- 
1.8.3.1

