Received: by 10.25.159.19 with SMTP id i19csp1084201lfe;
        Fri, 5 Feb 2016 06:38:35 -0800 (PST)
X-Received: by 10.140.232.15 with SMTP id d15mr5788793qhc.87.1454683115517;
        Fri, 05 Feb 2016 06:38:35 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si16048829qka.117.2016.02.05.06.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 06:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRhWt-0002tf-0i
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 09:38:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWG-00027N-JA
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 09:37:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWF-000659-KG
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 09:37:56 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhWF-00062e-Dt; Fri, 05 Feb 2016 09:37:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhW7-0004Ao-T3; Fri, 05 Feb 2016 14:37:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 14:37:47 +0000
Message-Id: <1454683067-16001-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-devel] [PATCH 3/3] target-arm: Fix IL bit reported for Thumb
	VFP and Neon traps
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
X-TUID: /7vh1C/xN3Yr

All Thumb Neon and VFP instructions are 32 bits, so the IL
bit in the syndrome register should be set. Pass false to the
syn_* function's is_16bit argument rather than s->thumb
so we report the correct IL bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 10792e8..fa8e22c 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -3077,7 +3077,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
      */
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
 
@@ -4399,7 +4399,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
      */
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
 
@@ -5137,7 +5137,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
      */
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
 
-- 
1.9.1

