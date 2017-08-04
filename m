Received: by 10.25.221.202 with SMTP id w71csp2345769lfi;
        Fri, 4 Aug 2017 10:21:13 -0700 (PDT)
X-Received: by 10.200.52.235 with SMTP id x40mr4026725qtb.70.1501867273811;
        Fri, 04 Aug 2017 10:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867273; cv=none;
        d=google.com; s=arc-20160816;
        b=tTHyS8+ChBbVMl3SgOIRYWvLQgDrjhNmwNSlpX+CJxkWYGzUVUwArfBINVxzxKLfTd
         lkIWerkGWwmnWLDTDu/SbVKkDnJz5o+MsvLxoAnokK2CRnlwdnEIf2yfZ6rxc5E1CrBo
         D9sQmONxJABfI7YSAcT3EBHbworcCcXT3GPg0SQOZTw9BAUiyRwZYzSxvqyu2c6ioDqy
         /T4ZOODkXwJXwXE4fWcY4VyA3AGgJ2A/9VWCnpEgfOB4gWX4khwgT+YJjZoTKzg00KvO
         CTauvYp1TbC9raDkjsDhfQd8Q3/quKPbW/VY8OI/EetV34jzwWU/iuSUyqh/mOWizyMu
         +/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WlPMbaDz8T8kPX/fIMD/JjUTn2UaLwQ84Fie1bB9tUY=;
        b=yL7Si7oNXBD6UQntJNYGXKqdY+1ten/o1iLwImCQz/uJznO9MFkRWuwXlc5NsdjQIi
         jkgrCWzqG1cXeqLYHSZR6aJuxVyixBsAdTemFt9widMCFIiE8oUeNMVmyed/ZySfSiFl
         LoPz7isPRCusjIEEkQyOlfY0Vujd0qCMQXzPfr4rXRrB0ctuIG7Ps8zu6mjTmNRzwv27
         SVGc6q0Dxh0Z9K+AL+49gjTp4yaC/BuwgZwhRCzBb8OWk9S5eYJ56YH7OPaNjEHXp8tD
         +j3+K48A4+ZnMqmTx7FWxIbHJE4tawO/wv0f5xKWy+dnrhmWX4BUbpa/Vxvolhypa84i
         p6sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si1943561qkd.399.2017.08.04.10.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgHf-0007HO-3A
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:21:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHW-0007Cj-Fh
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHV-0001T0-FR
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgHV-0001Dp-7X; Fri, 04 Aug 2017 13:21:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHN-0006u2-V1; Fri, 04 Aug 2017 18:20:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:48 +0100
Message-Id: <1501867249-1924-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/8] target/arm: Allow deliver_fault() caller to
 specify EA bit
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKCHxwzy11rA

For external aborts, we will want to be able to specify the EA
(external abort type) bit in the syndrome field.  Allow callers of
deliver_fault() to do that by adding a field to ARMMMUFaultInfo which
we use when constructing the syndrome values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/op_helper.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1f6efef..a3adbd8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -448,12 +448,14 @@ void arm_handle_psci_call(ARMCPU *cpu);
  * @s2addr: Address that caused a fault at stage 2
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
+ * @ea: True if we should set the EA (external abort type) bit in syndrome
  */
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 struct ARMMMUFaultInfo {
     target_ulong s2addr;
     bool stage2;
     bool s1ptw;
+    bool ea;
 };
 
 /* Do a page table walk and add page to TLB if possible */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index aa52a98..7eac272 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -80,7 +80,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
-                                            bool same_el,
+                                            bool same_el, bool ea,
                                             bool s1ptw, bool is_write,
                                             int fsc)
 {
@@ -99,7 +99,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      */
     if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
         syn = syn_data_abort_no_iss(same_el,
-                                    0, 0, s1ptw, is_write, fsc);
+                                    ea, 0, s1ptw, is_write, fsc);
     } else {
         /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
          * syndrome created at translation time.
@@ -107,7 +107,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
          */
         syn = syn_data_abort_with_iss(same_el,
                                       0, 0, 0, 0, 0,
-                                      0, 0, s1ptw, is_write, fsc,
+                                      ea, 0, s1ptw, is_write, fsc,
                                       false);
         /* Merge the runtime syndrome with the template syndrome.  */
         syn |= template_syn;
@@ -141,11 +141,11 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     }
 
     if (access_type == MMU_INST_FETCH) {
-        syn = syn_insn_abort(same_el, 0, fi->s1ptw, fsc);
+        syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
         syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                   same_el, fi->s1ptw,
+                                   same_el, fi->ea, fi->s1ptw,
                                    access_type == MMU_DATA_STORE,
                                    fsc);
         if (access_type == MMU_DATA_STORE
-- 
2.7.4

