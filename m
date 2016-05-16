Received: by 10.25.208.137 with SMTP id h131csp1290509lfg;
        Mon, 16 May 2016 07:15:29 -0700 (PDT)
X-Received: by 10.140.223.10 with SMTP id t10mr30621039qhb.96.1463408129220;
        Mon, 16 May 2016 07:15:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si23132670qkc.189.2016.05.16.07.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JIu-00010g-JQ
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JI3-00085H-2Z
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:14:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JHv-0005vN-8T
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:14:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33044 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JHv-0005vH-0z; Mon, 16 May 2016 10:14:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 258501A44EE;
	Mon, 16 May 2016 16:14:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id EA9C91A2239;
	Mon, 16 May 2016 16:14:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:40 +0200
Message-Id: <1463407965-19733-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 4/9] softfloat: For Mips only,
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BuRuSK2KV/3s

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Only for Mips platform, and only for cases when snan_bit_is_one is 0,
correct the order of argument comparisons in pickNaNMulAdd().

For more info, see [1], page 53, section "3.5.3 NaN Propagation".

[1] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32 SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index 093218f..11fc66b 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -571,19 +571,36 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSNaN, flag bIsQNaN, flag bIsSNaN,
         return 3;
     }
 
-    /* Prefer sNaN over qNaN, in the a, b, c order. */
-    if (aIsSNaN) {
-        return 0;
-    } else if (bIsSNaN) {
-        return 1;
-    } else if (cIsSNaN) {
-        return 2;
-    } else if (aIsQNaN) {
-        return 0;
-    } else if (bIsQNaN) {
-        return 1;
+    if (status->snan_bit_is_one) {
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
     } else {
-        return 2;
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
     }
 }
 #elif defined(TARGET_PPC)
-- 
1.9.1

