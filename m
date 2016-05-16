Received: by 10.25.208.137 with SMTP id h131csp1290788lfg;
        Mon, 16 May 2016 07:16:14 -0700 (PDT)
X-Received: by 10.55.201.68 with SMTP id q65mr21937099qki.34.1463408174357;
        Mon, 16 May 2016 07:16:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13si11678310qkh.180.2016.05.16.07.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JJd-0002MA-Li
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JHj-0007SV-HE
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JHd-0005me-C6
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:14:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:32982 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JHd-0005mB-4s; Mon, 16 May 2016 10:14:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 4C15F1A44E2;
	Mon, 16 May 2016 16:14:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 1D3351A4177;
	Mon, 16 May 2016 16:14:07 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:39 +0200
Message-Id: <1463407965-19733-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 3/9] softfloat: For Mips only,
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
X-TUID: b+WqSW/E1AZg

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Only for Mips platform, and only for cases when snan_bit_is_one is 0,
correct default NaN values (in their 16-, 32-, and 64-bit flavors).

For more info, see [1], page 84, Table 6.3 "Value Supplied When a New
Quiet NaN Is Created", and [2], page 52, Table 3.7 "Default NaN
Encodings".

[1] "MIPS Architecture For Programmers Volume II-A:
    The MIPS64 Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32 SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index e03a529..093218f 100644
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
         return const_float64(LIT64(0x7FF7FFFFFFFFFFFF));
     } else {
+#if defined(TARGET_MIPS)
+        return const_float64(LIT64(0x7FF8000000000000));
+#else
         return const_float64(LIT64(0xFFF8000000000000));
+#endif
     }
 #endif
 }
-- 
1.9.1

