Received: by 10.28.91.67 with SMTP id p64csp3849649wmb;
        Tue, 20 Mar 2018 06:42:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELugnwlOQ8/s+SjjfSgAs396rke6v0cca8EsN+UPUt8RrY9rJNK0IOcg388c18bEhwD6iGds
X-Received: by 10.55.87.134 with SMTP id l128mr22676198qkb.162.1521553343098;
        Tue, 20 Mar 2018 06:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553343; cv=none;
        d=google.com; s=arc-20160816;
        b=u8ql4Dl9sYnhvAxZvVTbzNE4QfujI7326gnCLfgFmyhyjOpQ0TIEf19hhJWKeFRII2
         h8wy6D9A8kjGGXNWJC3VvG9LRg/w1irwMWpuIqJ539NUecIckFUlrM0CviPu4aNdIAym
         uSaTVH81Z3EXzdIKPqpC1xSAeAyIAT9ysKlUmfyTgMm+lHzy6BV5rlrGJePQ8cOccPeD
         d5TIpHxSkKGCo1AIwyQDI5e6evGGsrqFIt0bedDtDmgI8Kk2DSOXf1SOrnBD55Ys4aUA
         zEwz18QFm2q8NwGy8BaW1vjyr/byMxiTcXTqY+ZLZXu0OKtlWJSiGE7zp09xgyU6SsSH
         Eplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=h03gLeAk29HQyplbx+UZ5O4iEAOgebznv2Fd3nAOsX4=;
        b=emQ6R2k/RdrkxUrQIU8AtFACiML5MKxISbGYHJGjG9J3SVRzk4RcTAYctTAcqKcPRv
         npkGh134d5wHsuZ6ikV5M8pX7JJ78Xiu4EPrZOT/hxSnRnPzBJeVF8Z33M6kgQwnkiql
         Wmyfu1Z0E4BBaDA3ODRAGtHB0/8h+nvFJBQ/j4Ion9Te+OpFvaFNVZg0MXI0w5jPmSKg
         LQ4nU8RLUaucAZHX5M6zljz6dpxyfv13MS6tRo372nlDcawOPGgyeEimYdwSqW5SUrrb
         fek716SRxb3QFVbNCjBcIqaEG3Bv6HCAv7riRi3M+BjaovZnGYMfl7Pd3Z6XaSfHnZSQ
         3GUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o39si697782qtf.290.2018.03.20.06.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHWw-0003OW-Fe
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:42:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHWH-0003Hj-BO
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 09:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHWB-00049C-Fc
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 09:41:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eyHW1-0003s8-0U; Tue, 20 Mar 2018 09:41:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eyHVv-00045u-Pi; Tue, 20 Mar 2018 13:41:19 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Mar 2018 13:41:14 +0000
Message-Id: <20180320134114.30418-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320134114.30418-1-peter.maydell@linaro.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-2.12 4/4] target/arm: Always set FAR to a
 known unknown value for debug exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99C2q0n/EB/a

For debug exceptions due to breakpoints or the BKPT instruction which
are taken to AArch32, the Fault Address Register is architecturally
UNKNOWN.  We were using that as license to simply not set
env->exception.vaddress, but this isn't correct, because it will
expose to the guest whatever old value was in that field when
arm_cpu_do_interrupt_aarch32() writes it to the guest IFSR.  That old
value might be a FAR for a previous guest EL2 or secure exception, in
which case we shouldn't show it to an EL1 or non-secure exception
handler. It might also be a non-deterministic value, which is bad
for record-and-replay.

Clear env->exception.vaddress before taking breakpoint debug
exceptions, to avoid this minor information leak.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8e1e521193..a266cc0116 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -490,6 +490,11 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 {
     /* FSR will only be used if the debug target EL is AArch32. */
     env->exception.fsr = arm_debug_exception_fsr(env);
+    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
     raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
 }
 
@@ -1353,7 +1358,11 @@ void arm_debug_excp_handler(CPUState *cs)
         }
 
         env->exception.fsr = arm_debug_exception_fsr(env);
-        /* FAR is UNKNOWN, so doesn't need setting */
+        /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+         * values to the guest that it shouldn't be able to see at its
+         * exception/security level.
+         */
+        env->exception.vaddress = 0;
         raise_exception(env, EXCP_PREFETCH_ABORT,
                         syn_breakpoint(same_el),
                         arm_debug_target_el(env));
-- 
2.16.2

