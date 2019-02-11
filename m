Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1944164wrq;
        Sun, 10 Feb 2019 17:12:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaZ2RvvODNYlv6XQrSDCyjG8uY3ggI/7S10Bw9tkQEVSwutC2+YP6Mldg8CgehJR1p/H8rw
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr25043653wrq.265.1549847563710;
        Sun, 10 Feb 2019 17:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847563; cv=none;
        d=google.com; s=arc-20160816;
        b=CyzTFpr1WdyGbcVfi2POwYxardJkcb6MtM+6vzydKzGoHJAcJnw9Obx+T3zELFieCj
         ZlhfqK6cjiBNJkwtcZTVmZgOiBkVTz5X5LpNBudkkPVlKUIC7qhoAGOgGQCncPMcA6JW
         V1Aq/hHl9gMsDOBkYecgk3DftIJaHt/HQmrqNXcKRWs5Hkv47HdOKEzqCIVW6PCekfN4
         BcpwZv6SMt9GL6ylmo2kDrA09163SMXysbDgJtaybI2Rfy6L522isdV3OoYbaM69SFFW
         0Rhr9bTPDdPZQ1XnrrTpobBpg6IFXrSizN1JvJvvMnIfAXzzI1XMPf5hfS84gUdYtf5Y
         eWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=btPp8hltDkFrd7qKQ50LGQORF7TOq+f4+8xGAfmBZ5M=;
        b=SgDoemBVh8Z4Rh9y2di3jcxLpYWm3jczkEazeGSqegQFr5UF6LjjmCtDvQSHJAaJOa
         73YVkhKVQqMFUOkeww5zgeTvwPRz+Kl+yO67KO+pCe1xJHAUgQi3edW3MyXwvGBcnA3r
         1WM9QJmbB3td3WGbSPG1ZmBOCUaCIH8iS2bMOIZe5/J23+rhW//TMiY9D/XnDU84RBCd
         z3BYucU4LaXTbfp0/x7UBxn80IpLe/how9GbJRW/GQXnGosPdPq+K8p939th6TAXOdNU
         im5ODv3jBgjwIG5cgLCn/fypGY/p1b2U8XzALtp9ceHX/7hHGF3Enfmy+apoKMC7TM8i
         vREg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ6MFe1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si6272987wrv.370.2019.02.10.17.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ6MFe1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt09F-0000CL-Rd
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0005eb-3r
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05g-0008L4-AZ
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42373)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05d-00085T-6N
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:56 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s1so4492303plp.9
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=btPp8hltDkFrd7qKQ50LGQORF7TOq+f4+8xGAfmBZ5M=;
	b=sJ6MFe1O9QLLEm0oNmM3TWjy7Y4iPUj26h91DwSCp4z74dlfzii4jjdnDkwUlIvKdJ
	puuyz0A3lYE/ShWtJ2uek0f782rfPe67kvRvfQJzbS2CEusicN86rhVysDyI0p39pdJE
	wovlj8XBud1Apk/+mEyV1jsaIcPINA2EyPo4D7cTTrk+q/Av8Fyj02/nhE7M7V4+30Km
	H87wCqrYg68JsrvGzdksCs/57rsAwPBnI/aHF/L18i6LPqhldm9ioY926+gUtrIdngpn
	KNfFydJXdSHXpUxwUgEMB+lE35VL98Pz7NtTq5ajfT33JopIII+SDm2pHtSGXnOJoUez
	+LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=btPp8hltDkFrd7qKQ50LGQORF7TOq+f4+8xGAfmBZ5M=;
	b=HUYN4LYmxNzxqpMW1epgxRT1q5qLcsrwzXplItEgIfOD5A9i/pjzCczmeW7+CWxHUT
	J9iT7pJBDJbKf4YyLFQFjzdtQd+m+fNH7rFaVLmzQbBg1+b/jvRA7yCGrA2JxnbP7B6q
	4/6nDKfv9PKL04Io+aoW9C9WwihzIThz40ICi62YiO5KtnMS9QcLSN57vCL6yj5y9da4
	/+X77oKYvDhCoaV/bUaoAcpVDGpjZrqHJJNiYdxSEO2/ZbJgH+i6PsmasSDDc7z3K9Cb
	IIIqwhunHfkaX75NPyXXI8ahFmDyp/AD+d6+hFe7C2+3fJSHXv0vkAm1IHsGi8PjqujQ
	vsNA==
X-Gm-Message-State: AHQUAuag/q3ii0RHjoQKfjEzlQLLFkqh4LOag9/HDDs2DmMNfeEateH0
	thJlStAFWglS2JQMHsSWaFugkA==
X-Received: by 2002:a17:902:298a:: with SMTP id
	h10mr35277076plb.312.1549847322224; 
	Sun, 10 Feb 2019 17:08:42 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:11 -0800
Message-Id: <20190211010829.29869-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62e
Subject: [Qemu-arm] [PATCH v2 08/26] target/arm: Fill in helper_mte_check
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMbBCW4nQqSb

Implements the rules of "PE generation of Checked and Unchecked
accesses" which aren't already implied by TB_FLAGS_MTE_ACTIVE.
Implements the rules of "PE handling of Tag Check Failure".

Does not implement tag physical address space, so all operations
reduce to unchecked so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix TFSR update.
---
 target/arm/mte_helper.c | 94 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index f1174d6f9f..d086925a91 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -25,6 +25,8 @@
 #include "exec/helper-proto.h"
 
 
+#if 0
+/* Don't break bisect.  This will gain another user before we're done.  */
 static uint64_t strip_tbi(CPUARMState *env, uint64_t ptr)
 {
     /*
@@ -49,9 +51,97 @@ static uint64_t strip_tbi(CPUARMState *env, uint64_t ptr)
         return ptr;
     }
 }
+#endif
+
+static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
+{
+    /* Tag storage not implemented.  */
+    return -1;
+}
+
+static int allocation_tag_from_addr(uint64_t ptr)
+{
+    ptr += 1ULL << 55;  /* carry ptr[55] into ptr[59:56].  */
+    return extract64(ptr, 56, 4);
+}
 
 uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
 {
-    /* Only unchecked implemented so far.  */
-    return strip_tbi(env, ptr);
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, true);
+    int el = arm_current_el(env);
+    int ptr_tag, mem_tag;
+    uintptr_t ra = GETPC();
+
+    /*
+     * If TBI is disabled, then the access is unchecked.
+     * While we filtered out TBI0==0 && TBI1==0 in cpu_get_tb_cpu_state,
+     * we did not save separate bits for TBI0 != TBI1.
+     */
+    if (!param.tbi) {
+        /* Do not ignore the top byte.  */
+        return ptr;
+    }
+
+    /*
+     * If TCMA is enabled, then physical tag 0 is unchecked.
+     * Note the rules R0076 & R0077 are written with logical tags,
+     * and we need the physical tag below anyway.
+     */
+    ptr_tag = allocation_tag_from_addr(ptr);
+    if (param.tcma && ptr_tag == 0) {
+        goto pass;
+    }
+
+    /*
+     * If an access is made to an address that does not provide tag storage,
+     * the result is implementation defined (R0006).  We choose to treat the
+     * access as unchecked.
+     * This is similar to MemAttr != Tagged, which are also unchecked.
+     */
+    mem_tag = get_allocation_tag(env, ptr, ra);
+    if (mem_tag < 0) {
+        goto pass;
+    }
+
+    /* If the tags do not match, the tag check operation fails.  */
+    if (ptr_tag != mem_tag) {
+        int tcf;
+
+        if (el == 0) {
+            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+            tcf = extract64(env->cp15.sctlr_el[1], 38, 2);
+        } else {
+            tcf = extract64(env->cp15.sctlr_el[el], 40, 2);
+        }
+        if (tcf == 1) {
+            /*
+             * Tag check fail causes a synchronous exception.
+             *
+             * In restore_state_to_opc, we set the exception syndrome
+             * for the load or store operation.  Do that first so we
+             * may overwrite that with the syndrome for the tag check.
+             */
+            cpu_restore_state(ENV_GET_CPU(env), ra, true);
+            env->exception.vaddress = ptr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                            syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
+                            exception_target_el(env));
+        } else if (tcf == 2) {
+            /* Tag check fail causes asynchronous flag set.  */
+            env->cp15.tfsr_el[el] |= 1 << param.select;
+        }
+    }
+
+ pass:
+    /*
+     * Unchecked, tag check pass, or tag check fail does not trap.
+     * Ignore the top byte.
+     */
+    if (el >= 2) {
+        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+        return extract64(ptr, 0, 56);
+    } else {
+        return sextract64(ptr, 0, 56);
+    }
 }
-- 
2.17.2

