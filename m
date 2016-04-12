Received: by 10.25.208.211 with SMTP id h202csp1987539lfg;
        Tue, 12 Apr 2016 05:58:57 -0700 (PDT)
X-Received: by 10.140.240.3 with SMTP id l3mr3815831qhc.93.1460465936352;
        Tue, 12 Apr 2016 05:58:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si24254366qhc.88.2016.04.12.05.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Apr 2016 05:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apxuB-0000ff-2N
	for alex.bennee@linaro.org; Tue, 12 Apr 2016 08:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtf-000861-HH
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtc-0006us-As
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43630 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apxtc-0006uS-4T; Tue, 12 Apr 2016 08:58:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id B7BF21A4547;
	Tue, 12 Apr 2016 14:58:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 9120D1A224D;
	Tue, 12 Apr 2016 14:58:16 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Apr 2016 14:58:04 +0200
Message-Id: <1460465891-6142-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v4 2/9] softfloat: For Mips only,
 correct default NaN values
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
X-TUID: 1pi9rGFY2fTn

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Only for Mips platform, and only for cases when snan_bit_is_one is 0,
correct default NaN values (in their 16-, 32-, and 64-bit flavors).

For more info, see [1], page 84, Table 6.3 "Value Supplied When
a New Quiet NaN Is Created", and [2], page 52, table 3.7 "Default
NaN Encodings".

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32=C2=AE SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index 53dae9b..169246e 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -97,7 +97,11 @@ float16 float16_default_nan(float_status *status)
     if (status->snan_bit_is_one) {
         return const_float16(0x7DFF);
     } else {
+#if defined(TARGET_MIPS)
+        return const_float16(0x7E00);
+#else
         return const_float16(0xFE00);
+#endif
     }
 #endif
 }
@@ -116,7 +120,11 @@ float32 float32_default_nan(float_status *status)
     if (status->snan_bit_is_one) {
         return const_float32(0x7FBFFFFF);
     } else {
+#if defined(TARGET_MIPS)
+        return const_float32(0x7FC00000);
+#else
         return const_float32(0xFFC00000);
+#endif
     }
 #endif
 }
@@ -135,7 +143,11 @@ float64 float64_default_nan(float_status *status)
     if (status->snan_bit_is_one) {
         return const_float64(LIT64( 0x7FF7FFFFFFFFFFFF ));
     } else {
+#if defined(TARGET_MIPS)
+        return const_float64(LIT64( 0x7FF8000000000000 ));
+#else
         return const_float64(LIT64( 0xFFF8000000000000 ));
+#endif
     }
 #endif
 }
--=20
1.7.9.5

