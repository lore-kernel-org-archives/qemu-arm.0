Received: by 10.223.197.9 with SMTP id q9csp2470272wrf;
        Mon, 9 Oct 2017 06:49:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDZLe/RG6SSfCXRiHHi4mnRpttD4i8cHfYeoTNSR0qyukkr05wfkUXlKYdhSkGGEBlRtxT2
X-Received: by 10.237.58.7 with SMTP id n7mr14885348qte.205.1507556949279;
        Mon, 09 Oct 2017 06:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507556949; cv=none;
        d=google.com; s=arc-20160816;
        b=SXlOgD0uRF33tkcuBFJT+dm+4DIUGGTvddUyJJSTgk/8hywWJZRFQ6k1nd3pADB4d2
         B9HUcHQ7xlzz88/oJ1e61qXjLdmeJOYDbRRB7I4Bn9Rrhagg+1jIm5xH7ch/viDNuOcd
         ZlyKkRIqBigle+lx3bg6IGPI88Qcqt6p0wYrsmnam76DzTuN6Z/veW7/Bs8l6yLS/FPe
         Vk59AKw78CGrGQR69miUd6t6q9ThxV5HWrZhRRZqRpaokbU35tt9sqlnHKmhsVVTvmdz
         BtvMUf368UanUG/xKsvwh3A2kpg1o2fPWilJTjpRZ0N3r1nQOQWDTxNxva5czuCBIzO2
         CheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RTIgApJRaK/i4iWNBjTprubZ65FNC6P8cp5+ka6vUK0=;
        b=zu5UHErICeiNy0PbNBFnXheWo/kyHghBja4+y60KeguYl+4pBFCJ4OAx7peZ38WmRC
         klKicWbDrarOQ8xwzsX32KkeP+fIJMk9kX6boZl5Vnh+G5B8fmmMbKtYRQ8y8qAQt19x
         UfOl5eEXkUpglNhtixX5ND1g6sy1Pwu+78nmawza536Sz0KORCiDlxVIHJWSaV5ins8H
         yXQyaAsnfVEdVGE444Az2ooAlmASImFiCVLfBlSDpSOgmUFHvsqZU0U3uAk/WpgFwma4
         2SdOvh3K5lmcQEMnsVptdT6DLVGN/y3e3FzmFD8SdF82PEHP2p5laX8NxUn/LvU3zZn8
         EnHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b16si561497qkh.258.2017.10.09.06.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YQe-0001Mb-N4
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:49:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQP-0001Ik-W6
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQO-000473-2o
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQN-0003zX-RF; Mon, 09 Oct 2017 09:48:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQG-0004a4-8e; Mon, 09 Oct 2017 14:48:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:39 +0100
Message-Id: <1507556919-24992-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 9/9] target/arm: Implement SG instruction corner
 cases
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sum8fsGGrwkE

The common situation of the SG instruction is that it is
executed from S&NSC memory by a CPU in NS state. That case
is handled by v7m_handle_execute_nsc(). However the instruction
also has defined behaviour in a couple of other cases:
 * SG instruction in NS memory (behaves as a NOP)
 * SG in S memory but CPU already secure (clears IT bits and
   does nothing else)
 * SG instruction in v8M without Security Extension (NOP)

These can be implemented in translate.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9d16760..3db6d73 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9781,7 +9781,28 @@ static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
              * - load/store doubleword, load/store exclusive, ldacq/strel,
              *   table branch.
              */
-            if (insn & 0x01200000) {
+            if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
+                arm_dc_feature(s, ARM_FEATURE_V8)) {
+                /* 0b1110_1001_0111_1111_1110_1001_0111_111
+                 *  - SG (v8M only)
+                 * The bulk of the behaviour for this instruction is implemented
+                 * in v7m_handle_execute_nsc(), which deals with the insn when
+                 * it is executed by a CPU in non-secure state from memory
+                 * which is Secure & NonSecure-Callable.
+                 * Here we only need to handle the remaining cases:
+                 *  * in NS memory (including the "security extension not
+                 *    implemented" case) : NOP
+                 *  * in S memory but CPU already secure (clear IT bits)
+                 * We know that the attribute for the memory this insn is
+                 * in must match the current CPU state, because otherwise
+                 * get_phys_addr_pmsav8 would have generated an exception.
+                 */
+                if (s->v8m_secure) {
+                    /* Like the IT insn, we don't need to generate any code */
+                    s->condexec_cond = 0;
+                    s->condexec_mask = 0;
+                }
+            } else if (insn & 0x01200000) {
                 /* 0b1110_1000_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
                  *  - load/store dual (post-indexed)
                  * 0b1111_1001_x10x_xxxx_xxxx_xxxx_xxxx_xxxx
-- 
2.7.4

