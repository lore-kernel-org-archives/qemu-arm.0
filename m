Received: by 10.182.158.201 with SMTP id ww9csp1978681obb;
        Tue, 24 Nov 2015 04:01:37 -0800 (PST)
X-Received: by 10.31.107.193 with SMTP id k62mr24296583vki.27.1448366497541;
        Tue, 24 Nov 2015 04:01:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78si17382270vke.127.2015.11.24.04.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:01:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CHx-0007er-8r
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:01:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a1CHr-0007XC-Nl
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:01:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a1CHq-0005ok-SM
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:01:31 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:58966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a1CHk-0005ni-1n; Tue, 24 Nov 2015 07:01:24 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a1CHh-0002gG-Vy; Tue, 24 Nov 2015 12:01:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 12:01:21 +0000
Message-Id: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 for-2.5] target-arm/translate-a64.c: Correct
	unallocated checks for ldst_excl
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
X-TUID: WYOziYvqGgPG

The checks for the unallocated encodings in the ldst_excl group
(exclusives and load-acquire/store-release) were not correct. This
error meant that in turn we ended up with code attempting to handle
the non-existent case of "non-exclusive load-acquire/store-release
pair". Delete that broken and now unreachable code.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The easiest way to validate that we have the unallocated
conditions correct now is to look at C4.4.6 "load/store exclusive"
in the v8 ARM ARM rev A.3h: our three conditions correspond
to the three "unallocated" rows in the decode table.

v2 changes: remove incorrect comment too.
---
 target-arm/translate-a64.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index fe485a4..14e8131 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1816,9 +1816,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
  *  o2: 0 -> exclusive, 1 -> not
  *  o1: 0 -> single register, 1 -> register pair
  *  o0: 1 -> load-acquire/store-release, 0 -> not
- *
- *  o0 == 0 AND o2 == 1 is un-allocated
- *  o1 == 1 is un-allocated except for 32 and 64 bit sizes
  */
 static void disas_ldst_excl(DisasContext *s, uint32_t insn)
 {
@@ -1833,7 +1830,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 30, 2);
     TCGv_i64 tcg_addr;
 
-    if ((!is_excl && !is_lasr) ||
+    if ((!is_excl && !is_pair && !is_lasr) ||
+        (!is_excl && is_pair) ||
         (is_pair && size < 2)) {
         unallocated_encoding(s);
         return;
@@ -1862,15 +1860,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         } else {
             do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
         }
-        if (is_pair) {
-            TCGv_i64 tcg_rt2 = cpu_reg(s, rt);
-            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
-            if (is_store) {
-                do_gpr_st(s, tcg_rt2, tcg_addr, size);
-            } else {
-                do_gpr_ld(s, tcg_rt2, tcg_addr, size, false, false);
-            }
-        }
     }
 }
 
-- 
1.9.1

