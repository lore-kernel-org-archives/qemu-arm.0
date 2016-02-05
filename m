Received: by 10.25.159.19 with SMTP id i19csp1084219lfe;
        Fri, 5 Feb 2016 06:38:38 -0800 (PST)
X-Received: by 10.141.0.212 with SMTP id b203mr17008374qhd.104.1454683118759;
        Fri, 05 Feb 2016 06:38:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si16084937qgf.53.2016.02.05.06.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 06:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRhWw-0002zk-6a
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 09:38:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWH-00027Q-2n
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 09:37:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWG-00065R-9E
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 09:37:57 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhWG-00062e-1u; Fri, 05 Feb 2016 09:37:56 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhW7-0004Ak-RF; Fri, 05 Feb 2016 14:37:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 14:37:46 +0000
Message-Id: <1454683067-16001-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-devel] [PATCH 2/3] target-arm: Fix IL bit reported for Thumb
	coprocessor traps
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: btxuH2ItVAp4

All Thumb coprocessor instructions are 32 bits, so the IL
bit in the syndrome register should be set. Pass false to the
syn_* function's is_16bit argument rather than s->thumb
so we report the correct IL bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 3ec758a..10792e8 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7184,19 +7184,19 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             case 14:
                 if (is64) {
                     syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                                 isread, s->thumb);
+                                                 isread, false);
                 } else {
                     syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                                rt, isread, s->thumb);
+                                                rt, isread, false);
                 }
                 break;
             case 15:
                 if (is64) {
                     syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
-                                                 isread, s->thumb);
+                                                 isread, false);
                 } else {
                     syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
-                                                rt, isread, s->thumb);
+                                                rt, isread, false);
                 }
                 break;
             default:
-- 
1.9.1

