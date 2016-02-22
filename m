Received: by 10.25.208.211 with SMTP id h202csp24179lfg;
        Thu, 3 Mar 2016 10:54:42 -0800 (PST)
X-Received: by 10.55.76.134 with SMTP id z128mr5123951qka.90.1457031282372;
        Thu, 03 Mar 2016 10:54:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si16522806qkb.71.2016.03.03.10.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abYOY-0002ET-0O
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:54:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>) id 1abRc7-0004Co-MN
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:40:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>) id 1abRc6-00053G-Om
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:40:15 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:62715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ralf+devel@comsecuris.com>)
	id 1abRc2-00051m-EH; Thu, 03 Mar 2016 06:40:10 -0500
Received: from localhost ([87.161.202.150]) by mrelayeu.kundenserver.de
	(mreue003) with ESMTPSA (Nemesis) id 0Lv6gg-1ZuAOp0Ntq-010PI3;
	Thu, 03 Mar 2016 12:40:09 +0100
Date: Mon, 22 Feb 2016 23:42:51 +0100
From: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>
To: qemu-arm@nongnu.org
Message-ID: <20160222224251.GA11654@beta.comsecuris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K0:myZiJGRMTCc7qdd344HZB+a2CelRS7dGTWsN5PLfVRnOct90MxB
	fPPc2KJPE/CyXc0JPVo6dOTuWtc+RjhaPH5IfhvoPJXTpGFZ5jvjyuRTK8c8yIQ+dVTr9+5
	PDmW4gJxYyypvwTO/0d8g2gTvo9f2omT6btjqvHxKtS0GXkS8qdAeg4cEQfzsf4N7NvPJoZ
	cx7vZVhpPFPliIMQmVZpQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:PVpbcsfO8IY=:VmmspfRf93XNDrK3BN0+9k
	P9BIEqlrPjzCvL4dTYyFV0P6jqj4sBmo7vN8rva7Y31nPsxyL4Ll1BfSKFWjKFpe9BD0qscUE
	ezdh81MeaMUXl7N13LcuS3dw4H6PL8Rv/OtyxUsrnnnPjrKPYG1zTchNe8nkp7Wawo7VFZFyE
	I3VeS6W9gU8gn68Hb6LiU9nAHPjInYtUA3XC1wIyyIJqZyAquds6uUYcrVjVxN4+gW9dw7OAG
	lecSYfji+mz7R5uVhVV0eWXNBp3yMAZJe+NGxQtYFprAEjw35aGncxexuDJ5bKDd6uaoa6kpy
	qUKzYW0g5s7Mj850Thk7S+EN4NRnUz5aDn9SKUcBupp4PNAICggzTlnJT9pvUOKQ9tM1xw+ze
	Py1pT/QYzo4NL3brgzWWytC95naZkb6uR0oBLdxSOOJz/EJioIQJDQltUKTnhiMkMes40uqmn
	WETDXj2rmxS/ssYuQLSoUE9oF3JHs6Jeeh6ysIo9SZYI0wXTZFxJAH/Nl0GaUQV7X+EdqWLiH
	qTUPK1fmJ6a6cLBta0I9CQc9o2rsOPKwljv9iJgs8q1vm1tEGsGPKuoUelAHPBhzdEPs8OM1q
	Iy5E1x+Nk9cG3N/c4pzheNb8/pAaz0rnQrRt8Gh4CZlWwNkd17T4Rrwq0el5lTl38hlw8DGEG
	Q6Xmh0NphL2Be7mALGXFfmgp+BMiu20saSjIzw1tyEdXkDt0axHAW0Bvh+K7yhfyrcXs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
X-Mailman-Approved-At: Thu, 03 Mar 2016 13:54:33 -0500
Cc: qemu-devel@nongnu.org
Subject: [Qemu-arm] [PATCH] Fix bug: SRS instructions would trap to EL3 in
 Secure EL1 even if specified mode was not monitor mode. [RESUBMIT DUE TO
 MISSING SIGN-OFF]
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
X-TUID: uciFlqvX+6Lj

According to the ARMv8 Architecture reference manual [F6.1.203], ALL
of the following conditions need to be met for SRS to trap to EL3:
* It is executed at Secure PL1.
* The specified mode is monitor mode.
* EL3 is using AArch64.

Signed-off-by: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>
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

