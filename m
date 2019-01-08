Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4863042wrt;
        Tue, 8 Jan 2019 10:00:51 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ZHncltfjotDGVf/lZ/8L0gKvDge+1CjF2cvFASQxhdixHF277q7lEhsURiA8wfYX5SsM2
X-Received: by 2002:a1c:c58d:: with SMTP id v135mr2665069wmf.88.1546970451800;
        Tue, 08 Jan 2019 10:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546970451; cv=none;
        d=google.com; s=arc-20160816;
        b=hT/oS5aGgwz2OUGCnoc3mDg96A/k9EGFCDQ1q5sX216kKm1OvkbR7Vg9jnYMQPGnuk
         W0fb6BGRbliIbnRnwHhNhS9o6L2768ly8Z6qlx6i+vvITc9M21hMNmMxVUCROkLVtWen
         1renRVHzy7WFI6/4Bb4uSRSYG+JzYSxI1Og5wC1gQqfw33ftV+kh3Y6FAZqpZdn4Xm7F
         ZbCnsCqK6wZMTL+ewVnjZuupfkMWQbciWhWR2BVUQdiwJbQWlxbl4+ylID4M9nYWv2rH
         4bkV6opodiUbbMP0mVhwcmB9McJtZGY8cPD5MTy45vuaH9D5LWZrz/dB9GxjKx2DLSk4
         gXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=rv4ZubjSiBZw4VBG0d+ylKob+8B/qKd0tficu4kTNoo=;
        b=FGAxbxAz0s22x0toYkDjO0Zb4HQ7ohf3SpLzSnozVMuL4g2Pc9xMvqex9jYKSYv/g9
         fM1wruUEDWQOOemrOr+Sa/KqVIteVO5QpkMY1MQ0PDkjLPe2F7n5577Wyl2NJp+L4AL6
         MBip8rH0Gda07p63B8tgJ8jQap71TOE+fIkhWUEkYv/5wPWkFoNYwG99AuatvsQdlHUN
         5A4wDL4sJOxITwjYX9+ikUxxdb1foKikdk+uz7x+JVH08Ra5ptBVcfKfHP7QOP+IPdYC
         ax49HUDnMAGuKBhfGwXLqPobnUHFtIFv7n+J7wOOdvSkfYZ7eiQhcysv2Ci8tG7VGkAs
         1VCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JZZ7h0vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si37476018wrw.148.2019.01.08.10.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 10:00:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JZZ7h0vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggvgI-00033t-Ph
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 13:00:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvg3-00031G-80
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:00:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvfx-0004Oa-4u
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:00:34 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggvfo-0003wf-DE
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:00:24 -0500
Received: by mail-wr1-x442.google.com with SMTP id q18so4970708wrx.9
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 10:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rv4ZubjSiBZw4VBG0d+ylKob+8B/qKd0tficu4kTNoo=;
	b=JZZ7h0vq/FTENOESLiAwPiAINKSkB7P+h5WJxVNI1FXmteWLaRtdANtQXVWFrkOAhu
	N6X6zme+qadGnDx+N5ma2GhdMgGiLA9SMANOUDOjg/7amA26VL+CPb4umw2cVoKRnsOr
	IN47VF48fTYdz+cu9NLq1erzUs667Jr0XYiNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rv4ZubjSiBZw4VBG0d+ylKob+8B/qKd0tficu4kTNoo=;
	b=IHr3DGXyeU9zgi5N5vbmDMHYXEtgvx7x9gQros3gUZ3wxJXuQzHn8Av2fWlgzeg/Z+
	O5KriLtTudDEf6gOFgpES8rVkWdqWiOmelngiaLq4IMN64/byGryazm3BoSF5S0RFrKu
	0X1w/ajyHchgcDSIQaL2zHH+nCL4HDxFQihjiv0UoIkVJRG/5MRq8j3sr3ClKqxQ41Y6
	0FECkvDCq/1fmY4G3NciUQnxPSqk1Ou29fcKAYJjZN3j62756rbbfRqRiAlJKCcv3nzY
	wGTaMymC9AD/L87JIWok7Tk4t2m85AYG3GG4Cp5h+BemXsLG+CqEKuOyCmX45Hd0pjjI
	9pPg==
X-Gm-Message-State: AJcUukeJR8fprk1iOW+8RoOrw5hldNmV3HUY6t/qXx4c4fo6vObr5FS9
	qQDP+SriDZoqmdDTcvw4C0s4sAQoUEYcqg==
X-Received: by 2002:adf:e08c:: with SMTP id c12mr2089622wri.199.1546970416902; 
	Tue, 08 Jan 2019 10:00:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	b7sm47917422wrs.47.2019.01.08.10.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 10:00:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 18:00:14 +0000
Message-Id: <20190108180014.32386-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH] accel/tcg/user-exec: Don't parse aarch64 insns
 to test for read vs write
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aOcpQKpnjh9r

In cpu_signal_handler() for aarch64 hosts, currently we parse
the faulting instruction to see if it is a load or a store.
Since the 3.16 kernel (~2014), the kernel has provided us with
the syndrome register for a fault, which includes the WnR bit.
Use this instead if it is present, only falling back to
instruction parsing if not.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Since I originally asked the kernel folks to add the ESR context
so we could use it in QEMU, I figured that it was about time
(five years later...) to write the code to make use of it.

I wanted to say "everybody surely has at least a 3.16
kernel for aarch64 machines" and delete the fallback code,
but it turns out that the gcc compile farm box has 3.13.0...
---
 accel/tcg/user-exec.c | 66 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 941295ea49b..66cc818e3f3 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -479,28 +479,66 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 #elif defined(__aarch64__)
 
+#ifndef ESR_MAGIC
+/* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
+#define ESR_MAGIC 0x45535201
+struct esr_context {
+    struct _aarch64_ctx head;
+    uint64_t esr;
+};
+#endif
+
+static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
+{
+    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
+}
+
+static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
+{
+    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
+}
+
 int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
 {
     siginfo_t *info = pinfo;
     ucontext_t *uc = puc;
     uintptr_t pc = uc->uc_mcontext.pc;
-    uint32_t insn = *(uint32_t *)pc;
     bool is_write;
+    struct _aarch64_ctx *hdr;
+    struct esr_context const *esrctx = NULL;
 
-    /* XXX: need kernel patch to get write flag faster.  */
-    is_write = (   (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
-                || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
-                || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
-                || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
-                || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
-                || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
-                || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
-                /* Ingore bits 10, 11 & 21, controlling indexing.  */
-                || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
-                || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
-                /* Ignore bits 23 & 24, controlling indexing.  */
-                || (insn & 0x3a400000) == 0x28000000); /* C3.3.7,14-16 */
+    /* Find the esr_context, which has the WnR bit in it */
+    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
+        if (hdr->magic == ESR_MAGIC) {
+            esrctx = (struct esr_context const *)hdr;
+            break;
+        }
+    }
 
+    if (esrctx) {
+        /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit */
+        uint64_t esr = esrctx->esr;
+        is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
+    } else {
+        /*
+         * Fall back to parsing instructions; will only be needed
+         * for really ancient (pre-3.16) kernels.
+         */
+        uint32_t insn = *(uint32_t *)pc;
+
+        is_write = ((insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
+                    || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
+                    || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
+                    || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
+                    || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
+                    || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
+                    || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
+                    /* Ignore bits 10, 11 & 21, controlling indexing.  */
+                    || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
+                    || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
+                    /* Ignore bits 23 & 24, controlling indexing.  */
+                    || (insn & 0x3a400000) == 0x28000000); /* C3.3.7,14-16 */
+    }
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
-- 
2.20.1

