Received: by 10.25.208.211 with SMTP id h202csp1577925lfg;
        Mon, 11 Apr 2016 11:16:19 -0700 (PDT)
X-Received: by 10.55.17.102 with SMTP id b99mr25287171qkh.86.1460398577530;
        Mon, 11 Apr 2016 11:16:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f186si1346975qkb.32.2016.04.11.11.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Apr 2016 11:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apgNk-00045A-Ti
	for alex.bennee@linaro.org; Mon, 11 Apr 2016 14:16:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apgNg-0003xA-GC
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 14:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apgNa-0005qD-L5
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 14:16:12 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56563 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apgNa-0005nN-Es; Mon, 11 Apr 2016 14:16:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 62F4B1A4539;
	Mon, 11 Apr 2016 20:15:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 3428C1A4155;
	Mon, 11 Apr 2016 20:15:41 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Apr 2016 20:15:27 +0200
Message-Id: <1460398530-4412-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460398530-4412-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460398530-4412-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v3 3/6] softfloat: For Mips only,
 correct order in pickNaNMulAdd()
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weyaufWn0nyb

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Only for Mips platform, and only for cases when snan_bit_is_one is 0,
correct the order of argument comparisons in pickNaNMulAdd().

For more info, see [2], page 53, section "3.5.3 NaN Propagation".

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32=C2=AE SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h |   41 +++++++++++++++++++++++++++++---------=
---
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index 169246e..807ecc0 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -569,19 +569,36 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSNaN=
, flag bIsQNaN, flag bIsSNaN,
         return 3;
     }
=20
-    /* Prefer sNaN over qNaN, in the c, a, b order. */
-    if (cIsSNaN) {
-        return 2;
-    } else if (aIsSNaN) {
-        return 0;
-    } else if (bIsSNaN) {
-        return 1;
-    } else if (cIsQNaN) {
-        return 2;
-    } else if (aIsQNaN) {
-        return 0;
+    if (status->snan_bit_is_one) {
+        /* Prefer sNaN over qNaN, in the a, b, c order. */
+        if (aIsSNaN) {
+            return 0;
+        } else if (bIsSNaN) {
+            return 1;
+        } else if (cIsSNaN) {
+            return 2;
+        } else if (aIsQNaN) {
+            return 0;
+        } else if (bIsQNaN) {
+            return 1;
+        } else {
+            return 2;
+        }
     } else {
-        return 1;
+        /* Prefer sNaN over qNaN, in the c, a, b order. */
+        if (cIsSNaN) {
+            return 2;
+        } else if (aIsSNaN) {
+            return 0;
+        } else if (bIsSNaN) {
+            return 1;
+        } else if (cIsQNaN) {
+            return 2;
+        } else if (aIsQNaN) {
+            return 0;
+        } else {
+            return 1;
+        }
     }
 }
 #elif defined(TARGET_PPC)
--=20
1.7.9.5

