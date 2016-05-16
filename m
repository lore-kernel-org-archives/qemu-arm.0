Received: by 10.25.208.137 with SMTP id h131csp1291295lfg;
        Mon, 16 May 2016 07:17:36 -0700 (PDT)
X-Received: by 10.55.90.130 with SMTP id o124mr31559140qkb.178.1463408255945;
        Mon, 16 May 2016 07:17:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v44si23177813qgd.82.2016.05.16.07.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JKx-0004Hm-E3
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:17:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JII-0008Pp-Sm
	for qemu-devel@nongnu.org; Mon, 16 May 2016 10:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIH-00062J-RT
	for qemu-devel@nongnu.org; Mon, 16 May 2016 10:14:50 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33118 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JIC-00060C-Lk; Mon, 16 May 2016 10:14:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id C5AA51A451A;
	Mon, 16 May 2016 16:14:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id A04471A44F1;
	Mon, 16 May 2016 16:14:42 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:41 +0200
Message-Id: <1463407965-19733-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 5/9] linux-user: Update preprocessor
 constants for Mips-specific e_flags bits
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, edgar.iglesias@gmail.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NyGjWIo5H8Jh

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Missing values EF_MIPS_FP64 and EF_MIPS_NAN2008 added, and the format
of the surrounding code segment adjusted.

Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 include/elf.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index 28d448b..b7f59e4 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -46,14 +46,16 @@ typedef int64_t  Elf64_Sxword;
 #define EF_MIPS_ABI_O32		0x00001000	/* O32 ABI.  */
 #define EF_MIPS_ABI_O64		0x00002000	/* O32 extended for 64 bit.  */
 
-#define EF_MIPS_NOREORDER 0x00000001
-#define EF_MIPS_PIC       0x00000002
-#define EF_MIPS_CPIC      0x00000004
-#define EF_MIPS_ABI2		0x00000020
-#define EF_MIPS_OPTIONS_FIRST	0x00000080
-#define EF_MIPS_32BITMODE	0x00000100
-#define EF_MIPS_ABI		0x0000f000
-#define EF_MIPS_ARCH      0xf0000000
+#define EF_MIPS_NOREORDER       0x00000001
+#define EF_MIPS_PIC             0x00000002
+#define EF_MIPS_CPIC            0x00000004
+#define EF_MIPS_ABI2            0x00000020
+#define EF_MIPS_OPTIONS_FIRST   0x00000080
+#define EF_MIPS_32BITMODE       0x00000100
+#define EF_MIPS_FP64            0x00000200
+#define EF_MIPS_NAN2008         0x00000400
+#define EF_MIPS_ABI             0x0000f000
+#define EF_MIPS_ARCH            0xf0000000
 
 /* These constants define the different elf file types */
 #define ET_NONE   0
-- 
1.9.1

