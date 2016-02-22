Received: by 10.25.208.211 with SMTP id h202csp24170lfg;
        Thu, 3 Mar 2016 10:54:41 -0800 (PST)
X-Received: by 10.140.246.136 with SMTP id r130mr5431992qhc.12.1457031281207;
        Thu, 03 Mar 2016 10:54:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si42143577qgl.121.2016.03.03.10.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:54:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abYOW-0002DT-NZ
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:54:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>) id 1abRLv-0002GN-4x
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>) id 1abRLr-0007mB-47
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:23:31 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>)
	id 1abRLq-0007ll-Qe; Thu, 03 Mar 2016 06:23:27 -0500
Received: from localhost ([87.161.202.150]) by mrelayeu.kundenserver.de
	(mreue004) with ESMTPSA (Nemesis) id 0MbtgI-1aLYOM351C-00JL3w;
	Thu, 03 Mar 2016 12:23:12 +0100
Date: Mon, 22 Feb 2016 23:25:54 +0100
From: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>
To: qemu-arm@nongnu.org
Message-ID: <20160222222554.GA11598@beta.comsecuris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K0:lURtIResDnsRxbcJTa8ZyqFAOEw/CuRUC0zmNoNs9UiX5cWGoeV
	8HEFN9CVBotqxp20eEGLKRI+pc/CkA01Rmlq2+GYEh2qH1DZlDZMagCp2qOigcgckvOJ8rw
	p/rl4vKeF9HLH6A4fy0buEWX69aBfxZ3r0GnBjwT/Ml89YFWsPxeRNMAW+Pynbi0GZx9fHn
	KL0yAQcaQ83uOG4sBppVg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:qD/20xk2WXA=:T983G9PDVSr/d50UOgRAmF
	hdZ5ZaXuNZL/xkJWmFC33DuJZrfpUWHzyZhaKNNNK9PS/1GRHSRGEpZFZ7tzmpLozDyxloQXN
	Lqc2uixzyDOMMt14UOCvp9Zc6MFCwMXn+jwYAb+ihQ4p24H+e3dRKSE75cPpDzyulZQuakxB/
	vtK2YGNJZ0f3HZg3PlU3smaGvWn4sEemrKJPuc9dyntcJ6IXhRNa42YQUgmru9go9i1bS2TIx
	bxJMJneodln7eXj9Y2kkDL4cXBsj9hlzzEd80cYrFbhgnrYJw7mbDqsZVd1DhrN3Q8DxJCxmX
	5Ig9uo+jNNs527gL+7bqNmJZnDR4ruUIjgZ9ZyCy6JMJA619Eq5ELbHjh06ZZE0fztQsilG9F
	Xpox32Jh1pn3G+s8ioviBws5pNwTLmOSOwHbWAT0zNf7adrTLby7EEptyO6fqVdQUXXsBxHnv
	fjlFz30kG00CWBiPEEdzMUyvQ9O89p6ehPwPrEf0mohJVxZSAkHsoynG+GeI4IggtmFfq14p1
	Kc8NTEOB+K4+Fx9Y+BThp+r6J1ecQSEIAZGCChbu2DungbGo7pPljSGatQMx4V0XEdPNmlGdl
	3GSxGBH0K+g89i51/YLTyk4eX4R3P/js8itv90fqXQ7T3rz+xyJp7tbUlL0+o7MuW/ppLPhHZ
	atOz4NsgoF7psRW+ynrdG8ohy9/vwe1oZWHiD+y7vaDPMoesTwSLlwLzUIytVesoR/2s=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
X-Mailman-Approved-At: Thu, 03 Mar 2016 13:54:33 -0500
Cc: qemu-devel@nongnu.org
Subject: [Qemu-arm] [PATCH] Fix bug: SRS instructions would trap to EL3 in
 Secure EL1 even if specified mode was not monitor mode.
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
X-TUID: QosbJxb62qn6

According to the ARMv8 Architecture reference manual [F6.1.203], ALL
of the following conditions need to be met for SRS to trap to EL3:
* It is executed at Secure PL1.
* The specified mode is monitor mode.
* EL3 is using AArch64.
---
 target-arm/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index c29c47f..a7688bb 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7582,7 +7582,8 @@ static void gen_srs(DisasContext *s,
     bool undef = false;
 
     /* SRS is:
-     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
+     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1 and 
+     *   mode is monitor mode
      * - UNDEFINED in Hyp mode
      * - UNPREDICTABLE in User or System mode
      * - UNPREDICTABLE if the specified mode is:
@@ -7592,7 +7593,7 @@ static void gen_srs(DisasContext *s,
      * -- Monitor, if we are Non-secure
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
-    if (s->current_el == 1 && !s->ns) {
+    if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
         gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
-- 
2.5.4 (Apple Git-61)

