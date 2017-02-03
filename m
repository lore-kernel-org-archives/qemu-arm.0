Received: by 10.25.77.65 with SMTP id a62csp723766lfb;
        Fri, 3 Feb 2017 09:49:17 -0800 (PST)
X-Received: by 10.55.161.75 with SMTP id k72mr14628268qke.193.1486144157454;
        Fri, 03 Feb 2017 09:49:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si17166498qkb.59.2017.02.03.09.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 09:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZhz2-0006Nz-FL
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 12:49:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZhyo-0006HF-9K
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 12:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZhyn-0003iS-Fp
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 12:49:02 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cZhyn-0003iE-8Z; Fri, 03 Feb 2017 12:49:01 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZhyj-0002fV-1C; Fri, 03 Feb 2017 17:48:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Feb 2017 17:48:54 +0000
Message-Id: <1486144135-4894-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
References: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 1/2] target/arm: Abstract out pbit/wbit tests
 in ARM ldr/str decode
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EDovsm5Ri9r

In the ARM ldr/str decode path, rather than directly testing
"insn & (1 << 21)" and "insn & (1 << 24)", abstract these
bits out into wbit and pbit local flags. (We will want to
do more tests against them to determine whether we need to
provide syndrome information.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 493c627..175b4c1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8782,6 +8782,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             } else {
                 int address_offset;
                 bool load = insn & (1 << 20);
+                bool wbit = insn & (1 << 21);
+                bool pbit = insn & (1 << 24);
                 bool doubleword = false;
                 /* Misc load/store */
                 rn = (insn >> 16) & 0xf;
@@ -8799,8 +8801,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 }
 
                 addr = load_reg(s, rn);
-                if (insn & (1 << 24))
+                if (pbit) {
                     gen_add_datah_offset(s, insn, 0, addr);
+                }
                 address_offset = 0;
 
                 if (doubleword) {
@@ -8849,10 +8852,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                    ensure correct behavior with overlapping index registers.
                    ldrd with base writeback is undefined if the
                    destination and index registers overlap.  */
-                if (!(insn & (1 << 24))) {
+                if (!pbit) {
                     gen_add_datah_offset(s, insn, address_offset, addr);
                     store_reg(s, rn, addr);
-                } else if (insn & (1 << 21)) {
+                } else if (wbit) {
                     if (address_offset)
                         tcg_gen_addi_i32(addr, addr, address_offset);
                     store_reg(s, rn, addr);
-- 
2.7.4

