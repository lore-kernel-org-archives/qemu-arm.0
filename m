Received: by 10.25.208.211 with SMTP id h202csp1987819lfg;
        Tue, 12 Apr 2016 05:59:30 -0700 (PDT)
X-Received: by 10.140.235.22 with SMTP id g22mr3819511qhc.43.1460465966753;
        Tue, 12 Apr 2016 05:59:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si24250419qhe.110.2016.04.12.05.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Apr 2016 05:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apxuf-0001lz-N8
	for alex.bennee@linaro.org; Tue, 12 Apr 2016 08:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtg-00088n-Rs
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtc-0006ui-5h
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:24 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43662 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apxtb-0006uW-Rt; Tue, 12 Apr 2016 08:58:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 93B721A4170;
	Tue, 12 Apr 2016 14:58:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 63E021A20B5;
	Tue, 12 Apr 2016 14:58:17 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Apr 2016 14:58:06 +0200
Message-Id: <1460465891-6142-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v4 4/9] softfloat: Clean up hex constants
 capitalization in softfloat-specialize.h
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
X-TUID: JXNuLVVXCmx6

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

With this partch, capitals A, B, C, D, E, F are always used for hex
constants in softfloat-specialize.h. The large latter size is chosen
just beacause it is currently prevalent in this file.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h |   34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index 807ecc0..a5680e0 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -230,7 +230,7 @@ int float16_is_quiet_nan(float16 a_, float_status *status)
     if (status->snan_bit_is_one) {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     } else {
-        return ((a & ~0x8000) >= 0x7c80);
+        return ((a & ~0x8000) >= 0x7C80);
     }
 }
 
@@ -243,7 +243,7 @@ int float16_is_signaling_nan(float16 a_, float_status *status)
 {
     uint16_t a = float16_val(a_);
     if (status->snan_bit_is_one) {
-        return ((a & ~0x8000) >= 0x7c80);
+        return ((a & ~0x8000) >= 0x7C80);
     } else {
         return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
     }
@@ -328,9 +328,9 @@ int float32_is_quiet_nan( float32 a_, float_status *status )
 {
     uint32_t a = float32_val(a_);
     if (status->snan_bit_is_one) {
-        return (((a >> 22) & 0x1ff) == 0x1fe) && (a & 0x003fffff);
+        return (((a >> 22) & 0x1FF) == 0x1FE) && (a & 0x003FFFFF);
     } else {
-        return ((uint32_t)(a << 1) >= 0xff800000);
+        return ((uint32_t)(a << 1) >= 0xFF800000);
     }
 }
 
@@ -343,7 +343,7 @@ int float32_is_signaling_nan( float32 a_, float_status *status )
 {
     uint32_t a = float32_val(a_);
     if (status->snan_bit_is_one) {
-        return ((uint32_t)(a << 1) >= 0xff800000);
+        return ((uint32_t)(a << 1) >= 0xFF800000);
     } else {
         return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
     }
@@ -758,10 +758,10 @@ int float64_is_quiet_nan( float64 a_, float_status *status)
 {
     uint64_t a = float64_val(a_);
     if (status->snan_bit_is_one) {
-        return (((a >> 51) & 0xfff) == 0xffe)
-               && (a & 0x0007ffffffffffffULL);
+        return (((a >> 51) & 0xFFF) == 0xFFE)
+               && (a & 0x0007FFFFFFFFFFFFULL);
     } else {
-        return ((a << 1) >= 0xfff0000000000000ULL);
+        return ((a << 1) >= 0xFFF0000000000000ULL);
     }
 }
 
@@ -774,7 +774,7 @@ int float64_is_signaling_nan( float64 a_, float_status *status )
 {
     uint64_t a = float64_val(a_);
     if (status->snan_bit_is_one) {
-        return ((a << 1) >= 0xfff0000000000000ULL);
+        return ((a << 1) >= 0xFFF0000000000000ULL);
     } else {
         return
                ( ( ( a>>51 ) & 0xFFF ) == 0xFFE )
@@ -961,7 +961,7 @@ int floatx80_is_quiet_nan( floatx80 a, float_status *status )
         uint64_t aLow;
 
         aLow = a.low & ~0x4000000000000000ULL;
-        return ((a.high & 0x7fff) == 0x7fff)
+        return ((a.high & 0x7FFF) == 0x7FFF)
             && (aLow << 1)
             && (a.low == aLow);
     } else {
@@ -979,7 +979,7 @@ int floatx80_is_quiet_nan( floatx80 a, float_status *status )
 int floatx80_is_signaling_nan( floatx80 a, float_status *status )
 {
     if (status->snan_bit_is_one) {
-        return ((a.high & 0x7fff) == 0x7fff)
+        return ((a.high & 0x7FFF) == 0x7FFF)
             && ((a.low << 1) >= 0x8000000000000000ULL);
     } else {
         uint64_t aLow;
@@ -1120,12 +1120,12 @@ int float128_is_signaling_nan(float128 a_, float_status *status)
 int float128_is_quiet_nan( float128 a, float_status *status )
 {
     if (status->snan_bit_is_one) {
-        return (((a.high >> 47) & 0xffff) == 0xfffe)
-            && (a.low || (a.high & 0x00007fffffffffffULL));
+        return (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & 0x00007FFFFFFFFFFFULL));
     } else {
         return
-            ((a.high << 1) >= 0xffff000000000000ULL)
-            && (a.low || (a.high & 0x0000ffffffffffffULL));
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
     }
 }
 
@@ -1138,8 +1138,8 @@ int float128_is_signaling_nan( float128 a, float_status *status )
 {
     if (status->snan_bit_is_one) {
         return
-            ((a.high << 1) >= 0xffff000000000000ULL)
-            && (a.low || (a.high & 0x0000ffffffffffffULL));
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
     } else {
         return
                ( ( ( a.high>>47 ) & 0xFFFF ) == 0xFFFE )
-- 
1.7.9.5

