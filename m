Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp103633wrp;
        Mon, 11 Feb 2019 15:54:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZIQriJpOC8KIvvJ5yhBT3sI71ZlssZUz8So1GWnfqo/acWULm8IAmLrXP6QCzYkooVDZUA
X-Received: by 2002:a81:748b:: with SMTP id p133mr626478ywc.501.1549929249136;
        Mon, 11 Feb 2019 15:54:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929249; cv=none;
        d=google.com; s=arc-20160816;
        b=ccXoXVINZ6Btb2hNquseyv6ppAOthtp6GEAbyRNi15rDV5tLYueOIyCKkH5yQfoBPL
         KUJGdbepuWMIDBD3V3JfC9tZvu/RNPEcBRDvra8nm//y+J+c8/XAP4NpxqV8TWGGgemM
         0yo25uKlWkUEjH5Po0Ntt9gYxyFYVH12kVcv7lPucKkknzLGu0sqdU7n6HqkyRYkjv0R
         Z6MFJraUIGxzY/2aXKeImictdRX+a7HFw0ezu/TV1uDBGxKzxoaLLDDdPD9ZjKGzW+HN
         eX/5s8JVd4Ha8cpzExBKhIVtux+wmpkuCZrpVmkz9aBp9hZJAvqcSUNb4o/c7AZSoaDN
         tP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
        b=CpRPjTW96deOPwFv7qg0+00L9vzGKty3QjSWJpEKIxjuZYPFFw2+I//kQ9f1gETOo/
         LBC5VSL+enxxep2lN0Jq2Etw2a8LIaSvLwMBV6AlSzifxu4aH691yJ4z5SbfNo70FYid
         vbNeYpYHQpvrx+uuP7iPooN0wCTwXGA7fa+11ZDfkORdTbkVz3JjsG089ylHVnAyjlG4
         +iEnwAwmc39G7YO74rMeoxq5qtHeiheNaDg+cD9Wllfn17DZFO4aVycR7lJqFrhS4JEP
         rEjRqvmTCcXEjQUFpR/QlDwAqcRbr43bcoHmnValQNiT8UbA+zUM58gAz4oS9s9PkiIh
         2Qrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kpTRBcPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g127si6618143ybg.0.2019.02.11.15.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:54:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kpTRBcPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLOq-0005jU-HA
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Mk-Ht
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004Yh-H1
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOC-0004Sg-7I
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pf1-x443.google.com with SMTP id u6so318822pfh.11
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
	b=kpTRBcPR1pjIbmKTUySdMX6vGJ3l+DDfNo6AvjTf2B8+LdoW9GwQHU4Ib4GiaFa966
	KDuBHGbhVRJqYaGcZcUUVveZzeLBYuHA1JtlYCOlJDsMJ4HhVlXjVxQa/9kp9jM02fz1
	G4uzk8PUcHCNW/Vy/jZEaWj8c7uxy4I7YzHZ4u0Mo+ye6HyZVZuykvi+sSpjDxiEonl+
	b+Y04tfOq0+fwa+Yqa/nrlFa6Uon6TFspiH0j6GFTlQc675xUbfj0TVrz5KKOrpedJ+Z
	UuZAD30J/j1dNKTE5pMsB/UVmJ0DM5+RWr8cEOB3MlFocFYHM3rFd1K1qlqFR20+cmMZ
	BPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
	b=HhCoVaHN/QwDeuiNI78PiTIH9VuZqz4Uib1dHu/rjROC7zAMskSrvITczMtT6B6KM0
	JxO6l+iTGOTDdo2CV++8sx/wX8FJKzg+bCIJ7ER84TgqHTsv8h235jS7UhtI+EstOH2p
	G90+z7QkWg2nymA/QiSEuQYjjJe8yA2oD2bqGiLuu3mWwVJcTYMDGRD0JTbwhvxXCOCP
	wS64m8P5stUcoPZDHaY4RLHErVKZcrAV5QyTKNUxxVuPl40VPjexR/4j+/4KkXplPv0L
	fcJj1nTNua5O9THVDM3DAX3l4Id3ml4aN6RstDLplWCywA0h9h7jU+I4p+c238DCnHda
	B/+Q==
X-Gm-Message-State: AHQUAuZlxiNqStBz0Y+v3tX9pruS8qFXZfGk/LEMlC8XIIkxkiah09jm
	N4DJpLlWhL/DbYtur1s2OeAvVw8KPhA=
X-Received: by 2002:a62:4e83:: with SMTP id c125mr907167pfb.101.1549929199620; 
	Mon, 11 Feb 2019 15:53:19 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:44 -0800
Message-Id: <20190211235258.542-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v3 14/28] target/arm: Define
 arm_cpu_do_unaligned_access for CONFIG_USER_ONLY
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
X-TUID: 5lI3aMptNNhU

We will need this to raise unaligned exceptions from user mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8698b4dc83..d3cf362e4b 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -87,8 +87,6 @@ uint32_t HELPER(neon_tbl)(uint32_t ireg, uint32_t def, void *vn,
     return val;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
@@ -179,6 +177,22 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     raise_exception(env, exc, syn, target_el);
 }
 
+/* Raise a data fault alignment exception for the specified virtual address */
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                 MMUAccessType access_type,
+                                 int mmu_idx, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.type = ARMFault_Alignment;
+    deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
+}
+
+#ifndef CONFIG_USER_ONLY
 /* try to fill the TLB and return an exception if error. If retaddr is
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
@@ -200,21 +214,6 @@ void tlb_fill(CPUState *cs, target_ulong addr, int size,
     }
 }
 
-/* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.type = ARMFault_Alignment;
-    deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
-}
-
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
-- 
2.17.2

