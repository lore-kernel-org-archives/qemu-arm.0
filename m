Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2532718wrt;
        Sun, 13 Jan 2019 17:15:32 -0800 (PST)
X-Google-Smtp-Source: ALg8bN785JW7khGw28suMGsQeoyojUjSNzcQFlJGpE3K8Vzw47oXqDVt/EBu7TpT6hx4WAB3OKhO
X-Received: by 2002:a1c:2686:: with SMTP id m128mr9397577wmm.52.1547428532298;
        Sun, 13 Jan 2019 17:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428532; cv=none;
        d=google.com; s=arc-20160816;
        b=BfHY130N4A+NZlljJyatq9FNck1jGSEKne3IopqPKHc/n1mr2D4eQlGTEQW06e06jh
         1fDIRvEJvmcd5kgHFy4ehznFHhQo1OOEcUnYGtyR8tsUh3UxXt7r4nz+Ol/db6c0wE5m
         qd6hDDwsTUqXn7t7LdbSuhSYNkQcccL4qNM/24MFkU+kiz7YamKioZ/lKBLCcprDEMBU
         yGJCXE1WUtuJmhM6c5EvYSTpDlVl4lxlflm6PTCzG86Aota0mxZ8qfGdS5o92tsWdqz2
         Ms/rvp/YzKV2fZt1OfIsie73+rJng+T2ZA8GOSm7/sGklaRKeZ+JzL2RW4+NmxupjZ2F
         8A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=k193oIJuWHKJSh/ld1DTHsXHomhufh+pF4VSc8r0za4=;
        b=cNrttVuOxuMXo02bwyWGyO10czFl5CyyziDKHEfA9dq8MDpWDrooqVW8mmdkBXmVES
         y0HTulqum/hrqr0284KzWod/Bn5VKpRJFTXBawXcCvXK+fjvZDawo/IE68dZMsk7gZbK
         5HrGvjeh53HuUj4QqvsMdi130vNTr3BXuUeZLYexEwV2dbBqb4EWcUyjxAkW152Euj5n
         6lSqsfHAPGRbq1Zbz7R7TjVmUTqBZ/F0AlhquSep5r4U3V63FszK3PWql04kLrqVZrBd
         gC7LtMFy2ZrcLiLumuqiZTG/MR8NvLlNpyqMZhlvW6bUQASQMkwynnJoCphPJXlQVke9
         ZcUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gnny0ZGD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si49080545wrp.196.2019.01.13.17.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gnny0ZGD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqqh-0007os-AH
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:15:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn6-0005Vb-Cf
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqn5-0000ox-Jm
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:48 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqn5-0000oT-EE
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id e11so9337510plt.11
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k193oIJuWHKJSh/ld1DTHsXHomhufh+pF4VSc8r0za4=;
	b=gnny0ZGDj+saAhIbe5JCMAVn9AaA9pJMSu8kjRZPumbLA/s/pX+5mWNidPVbOAJR64
	1DE/laG55VGrZhL+ttIGQcpKh0thNJVq/rfj2D4HZNsTG9YnYaUJ3R5mRmc0kyiQgvLA
	l42xGTIWG+fQGCNOg028gdIL7gQ1KrCK4UC+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k193oIJuWHKJSh/ld1DTHsXHomhufh+pF4VSc8r0za4=;
	b=EeQZP0fYGUu49INuxAQsJhAKmLPNFuhOKicqmi1vn/Yahw9ijtOZalUSzld4cVBfMx
	O1o9dmdLXbmOWoNTdcXyR5GQe6PdlKl95vs/OSCWNNiI9BdQRVmg4Lv23NifoCQbIags
	8sReqohOMd7722vSw3GeBSjWgzj2Iihd/DMiqa1HSulrvG2qkxN0bK37gkatoAo7WgXG
	gWQgbKF9e4JOkc+LxR0+RwP3JyKXTHJ+MkVCU5F6thhsnjcfOU1aEYDFrtxa2SS8kiK7
	yhSECqKf/UuTkDMNs9BAjk0fxXbMAnUSe2vWKkmgqQUpqyavQYkufpRbTDybkIBKw2xR
	ubSQ==
X-Gm-Message-State: AJcUukfx8HTncHNPYrkWmhX/vaaxWA0YmCClPo7hrn5sVnowV0pd2rAi
	R4HKgPH4Hlocg+AEio6869OlzMkVGVE4pQ==
X-Received: by 2002:a17:902:7e0d:: with SMTP id
	b13mr23702510plm.154.1547428304988; 
	Sun, 13 Jan 2019 17:11:44 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:09 +1100
Message-Id: <20190114011122.5995-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: [Qemu-devel] [PATCH 04/17] target/arm: Fill in helper_mte_check
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNemIq5EkjmK

Implements the rules of "PE generation of Checked and
Unchecked accesses" which aren't already covered by XXX.
Implements the rules of "PE handling of Tag Check Failure".

Does not implement tag physical address space, so all
operations reduce to unchecked so far.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 80 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a3226c44a4..6f4bc0aa04 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -25,8 +25,86 @@
 #include "exec/helper-proto.h"
 
 
+static int get_allocation_tag(CPUARMState *env, uint64_t ptr)
+{
+    /* Tag storage not implemented.  */
+    return -1;
+}
+
+static int allocation_tag_from_addr(uint64_t ptr)
+{
+    return (extract64(ptr, 56, 4) + extract64(ptr, 55, 1)) & 15;
+}
+
 uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
 {
-    /* Only unchecked implemented so far.  */
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, true);
+    int ptr_tag, mem_tag;
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
+    mem_tag = get_allocation_tag(env, ptr);
+    if (mem_tag < 0) {
+        goto pass;
+    }
+
+    /* If the tags do not match, the tag check operation fails.  */
+    if (ptr_tag != mem_tag) {
+        int el = arm_current_el(env);
+        int tcf;
+
+        /* Indicate the tag check fail, both async and sync reporting.  */
+        env->cp15.tfsr_el[el] |= 1 << param.select;
+
+        if (el == 0) {
+            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+            tcf = extract64(env->cp15.sctlr_el[1], 38, 2);
+        } else {
+            tcf = extract64(env->cp15.sctlr_el[el], 40, 2);
+        }
+        if (tcf == 1) {
+            /* Tag check fail causes a synchronous exception.  */
+            CPUState *cs = ENV_GET_CPU(env);
+
+            /*
+             * In restore_state_to_opc, we set the exception syndrome
+             * for the load or store operation.  Do that first so we
+             * may overwrite that with the syndrome for the tag check.
+             */
+            cpu_restore_state(cs, GETPC(), true);
+            env->exception.vaddress = ptr;
+            raise_exception(env, EXCP_DATA_ABORT,
+                            syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
+                            exception_target_el(env));
+        }
+    }
+
+ pass:
+    /* Unchecked, or tag check pass.  Ignore the top byte.  */
     return sextract64(ptr, 0, 55);
 }
-- 
2.17.2

