Received: by 10.25.159.19 with SMTP id i19csp1343343lfe;
        Mon, 25 Jan 2016 08:30:44 -0800 (PST)
X-Received: by 10.55.198.149 with SMTP id s21mr7444352qkl.5.1453739438246;
        Mon, 25 Jan 2016 08:30:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w111si25152575qge.27.2016.01.25.08.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 08:30:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNk2H-0001wM-NN
	for alex.bennee@linaro.org; Mon, 25 Jan 2016 11:30:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aNk2F-0001ti-3B
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 11:30:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aNk2E-0000u5-85
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 11:30:35 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aNk2C-0000tg-3O; Mon, 25 Jan 2016 11:30:32 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aNk29-0008CA-BM; Mon, 25 Jan 2016 16:30:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 25 Jan 2016 16:30:29 +0000
Message-Id: <1453739429-31477-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org,
	Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>,
	patches@linaro.org
Subject: [Qemu-arm] [PATCH] libvixl: Avoid std::abs() of 64-bit type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tpNVZp2n+NFx

The std::abs() function did not get a version that works on
'long long' until C++11. Avoid it, so that we can compile on
32-bit platforms (where int64_t is 'long long') with older
compilers (which don't support C++11).

Reported-by: Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've reported this as an upstream VIXL bug and expect it will
be fixed in a future version. I didn't use llabs() because of
its undefined behaviour if the input value happens to be the
most negative integer.
---
 disas/libvixl/vixl/a64/disasm-a64.cc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc b/disas/libvixl/vixl/a64/disasm-a64.cc
index 20caba4..7a58a5c 100644
--- a/disas/libvixl/vixl/a64/disasm-a64.cc
+++ b/disas/libvixl/vixl/a64/disasm-a64.cc
@@ -2688,8 +2688,12 @@ void Disassembler::AppendRegisterNameToOutput(const Instruction* instr,
 void Disassembler::AppendPCRelativeOffsetToOutput(const Instruction* instr,
                                                   int64_t offset) {
   USE(instr);
+  uint64_t abs_offset = offset;
   char sign = (offset < 0) ? '-' : '+';
-  AppendToOutput("#%c0x%" PRIx64, sign, std::abs(offset));
+  if (offset < 0) {
+    abs_offset = -abs_offset;
+  }
+  AppendToOutput("#%c0x%" PRIx64, sign, abs_offset);
 }
 
 
-- 
1.9.1

