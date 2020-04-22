Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp198043lfm;
        Tue, 21 Apr 2020 21:42:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypK8R8qN57kKoOY8y7n/ZyUffcAtrLUXGDossnJx1WPT+rocpRRIVXL6vWsfTyoqyBEUIXS2
X-Received: by 2002:a0c:eb0e:: with SMTP id j14mr22078031qvp.230.1587530524091;
        Tue, 21 Apr 2020 21:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530524; cv=none;
        d=google.com; s=arc-20160816;
        b=oHJUnhjR7cycRL+NT0i+1i4Wl77Y1aCiqhpPgw5tQTnMS5VseDmsio2oe3aQmDbzn9
         I3+TQ+KXnTTKPmDHaRk3M+PURVam9ZzLPleNDAouk2KCDPfJiAte+99Q3ckYtCrMkFqp
         sKu2UaU62yp4DeO1ALaJl1jlQSYgwIOhS0ndttKFiCivRg7lIxkfWALPFG3nUVruEZMs
         VbmiKdF4vPWLdtz9ZBqIeo4WiLJebh9758xjSR6Qr2zCZqnXh/EPO4ZG5d5p1F9ly/HX
         80S+kTbOnPhLAaRngsbWe/x3GerFOgeXPMY4yW8GchRjlcGUzv+S2S65o08Y7orDRhVP
         B9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4tSyrjuk3Om51Zcagt3t6yh4FkYKfOOT3yWLv6tJ2Vs=;
        b=dJPEXK/tVYHXsBaV8gagQ2AQ0Lb7v5fStUSxDF0kjtxI8VB/8+oWcPrsDK3UiedOcr
         GHIOfuQi7xqtLhrhh9BM32iQ3XUCkbLB5t+0xEYIIoUDJlyXVCRhfQWb6FShDNe3GPtK
         +fXk4HbdmNoX6D/1AVJB/3MJWzR41fKwtdYltph5jhZ46ai2gsBR6lDlCyzyDGnfcpWK
         LkR5hkOFOnJIXwR41qXpv8ltJg1Z97zE259aAqZae+guyrkCNI3BC8Y3w01IKIJEt40P
         SBz6FXu513UyZYaZM579Bx4FvgJ0WSRCiWObNjk5Zq+jYehthP0hyhyHMAPJVq2hdvNM
         k1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdEcW4t6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si2619197qko.188.2020.04.21.21.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdEcW4t6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR7D1-0006qn-Aa
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74u-0001AN-Mh
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74i-0005YE-Dj
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:40 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74h-0005Rl-Ux
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id f7so436151pfa.9
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tSyrjuk3Om51Zcagt3t6yh4FkYKfOOT3yWLv6tJ2Vs=;
 b=tdEcW4t6iHlzfHZT7MTd+nowW120rfdwA2OWXW5lqAGzmrZSFDwmt+9n3UmPfoAos4
 eqUEb+ZQd+XyrEp7acgd9JM1ZfU10GoY8T9KRHdujmvKCfxVwVHyBKljXimnCsJRCUM+
 xCWBT9TDkC47pnwCghsS8QNiqmwZnNzev7VjiPJJ3dHwVw82nOq9FpLDIWkHQpOdIWWu
 T9upG/pVuPXfen905x9u1FgVNC0eLnPpms3RNdCoRhZApYoaDM0yPI8gkh9BgWNxDf3J
 rm6iksS38MZLlCGNFKp0trbfMT2g/SYSqIxl9QGoKQxZli1skpOMGuD0jSz/wDOqTp9i
 TWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tSyrjuk3Om51Zcagt3t6yh4FkYKfOOT3yWLv6tJ2Vs=;
 b=G46D4FNEFqLzltbsXoIN3VHYfHG/y/Ebet2k8cJExYI+6gvC1TXbzVq7WLijkOOOMJ
 TmCNxq9Bzc1BCavFs35gHkR7p37rrvZzrgNA6OUsB4vJOTPzGKlSzlR7xqHaGGatQ5OZ
 1Ua5Xw9xNiwwHH8zdcXpn4S47+JLlnPbnoskZQmMOuDC+DzeoBfSV37i3bGoglhegIDe
 Ri5FltRly0DAOpQ9zKSDabkiryPchujFTYmOAidClfu7/wcdECk4QiTKhQie9d8z7I71
 YZP5RkyCsCQpIgiwaACJ7PoGlL4P9n/Pc6xjBBTkmgcV+TckPn2PRWJlvrXOcAlL7HBV
 6laQ==
X-Gm-Message-State: AGi0PuZukiudRVGDrG3sloqXVB/mq/Lq6FxfaEj5UMxNlWqkWRvki0Td
 cY7p7X1sH5boaD7XLnbFZ8bZkKEdyXA=
X-Received: by 2002:aa7:9724:: with SMTP id k4mr10964808pfg.309.1587530006550; 
 Tue, 21 Apr 2020 21:33:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/18] target/arm: Handle watchpoints in sve_ld1_r
Date: Tue, 21 Apr 2020 21:33:02 -0700
Message-Id: <20200422043309.18430-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zeyvu9zdfen8

Handle all of the watchpoints for active elements all at once,
before we've modified the vector register.  This removes the
TLB_WATCHPOINT bit from page[].flags, which means that we can
use the normal fast path via RAM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 72 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6bae342a17..7992a569b0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4371,6 +4371,70 @@ static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
     return have_work;
 }
 
+static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
+                                      uint64_t *vg, target_ulong addr,
+                                      int esize, int msize, int wp_access,
+                                      uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    intptr_t mem_off, reg_off, reg_last;
+    int flags0 = info->page[0].flags;
+    int flags1 = info->page[1].flags;
+
+    if (likely(!((flags0 | flags1) & TLB_WATCHPOINT))) {
+        return;
+    }
+
+    /* Indicate that watchpoints are handled. */
+    info->page[0].flags = flags0 & ~TLB_WATCHPOINT;
+    info->page[1].flags = flags1 & ~TLB_WATCHPOINT;
+
+    if (flags0 & TLB_WATCHPOINT) {
+        mem_off = info->mem_off_first[0];
+        reg_off = info->reg_off_first[0];
+        reg_last = info->reg_off_last[0];
+
+        while (reg_off <= reg_last) {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    cpu_check_watchpoint(env_cpu(env), addr + mem_off,
+                                         msize, info->page[0].attrs,
+                                         wp_access, retaddr);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off <= reg_last && (reg_off & 63));
+        }
+    }
+
+    mem_off = info->mem_off_split;
+    if (mem_off >= 0) {
+        cpu_check_watchpoint(env_cpu(env), addr + mem_off, msize,
+                             info->page[0].attrs, wp_access, retaddr);
+    }
+
+    mem_off = info->mem_off_first[1];
+    if ((flags1 & TLB_WATCHPOINT) && mem_off >= 0) {
+        reg_off = info->reg_off_first[1];
+        reg_last = info->reg_off_last[1];
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    cpu_check_watchpoint(env_cpu(env), addr + mem_off,
+                                         msize, info->page[1].attrs,
+                                         wp_access, retaddr);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+#endif
+}
+
 /*
  * The result of tlb_vaddr_to_host for user-only is just g2h(x),
  * which is always non-null.  Elide the useless test.
@@ -4412,13 +4476,19 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     /* Probe the page(s).  Exit with exception for any invalid page. */
     sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_LOAD, retaddr);
 
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, 1 << msz,
+                              BP_MEM_READ, retaddr);
+
+    /* TODO: MTE check. */
+
     flags = info.page[0].flags | info.page[1].flags;
     if (unlikely(flags != 0)) {
 #ifdef CONFIG_USER_ONLY
         g_assert_not_reached();
 #else
         /*
-         * At least one page includes MMIO (or watchpoints).
+         * At least one page includes MMIO.
          * Any bus operation can fail with cpu_transaction_failed,
          * which for ARM will raise SyncExternal.  Perform the load
          * into scratch memory to preserve register state until the end.
-- 
2.20.1

