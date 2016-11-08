Received: by 10.25.150.194 with SMTP id y185csp1558004lfd;
        Tue, 8 Nov 2016 04:22:09 -0800 (PST)
X-Received: by 10.202.226.138 with SMTP id z132mr7444349oig.54.1478607729039;
        Tue, 08 Nov 2016 04:22:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s7si8674554oib.57.2016.11.08.04.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45Pk-0004MJ-9K
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:22:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45M0-0001JB-JE
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Ls-00040M-GN
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45Ls-0003zs-Bf; Tue, 08 Nov 2016 07:18:08 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6888804FE;
	Tue,  8 Nov 2016 12:18:07 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA8CHsvl027755; Tue, 8 Nov 2016 07:18:05 -0500
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Date: Tue,  8 Nov 2016 13:17:51 +0100
Message-Id: <1478607473-25851-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1478607473-25851-1-git-send-email-thuth@redhat.com>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 08 Nov 2016 12:18:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/5] m68k: Update the 68k sections in the
 MAINTAINERS file
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
X-TUID: ItKiAAeUXWdT

disas/m68k.c obviously belong to the m68k CPU section in
the MAINTAINERS file, but remove the hw/m68k/ directory
here since it only contains machine (not CPU) related
files, as requested by Laurent. Add the machine related
files to the right machine sections instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 451e7cc..5d8b584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -148,7 +148,7 @@ M68K
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: target-m68k/
-F: hw/m68k/
+F: disas/m68k.c
 
 MicroBlaze
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -550,6 +550,7 @@ M68K Machines
 an5206
 S: Orphan
 F: hw/m68k/an5206.c
+F: hw/m68k/mcf5206.c
 
 dummy_m68k
 S: Orphan
@@ -558,6 +559,9 @@ F: hw/m68k/dummy_m68k.c
 mcf5208
 S: Orphan
 F: hw/m68k/mcf5208.c
+F: hw/m68k/mcf_intc.c
+F: hw/char/mcf_uart.c
+F: hw/net/mcf_fec.c
 
 MicroBlaze Machines
 -------------------
-- 
1.8.3.1

