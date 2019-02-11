Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1944367wrq;
        Sun, 10 Feb 2019 17:13:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibvdmo70zYZNMJAJw34F704IEvZMG72a0MobaUeTqfTUY1gxKlILbVFKXjwAm/VmP91KLCd
X-Received: by 2002:adf:ba12:: with SMTP id o18mr3642830wrg.326.1549847581314;
        Sun, 10 Feb 2019 17:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847581; cv=none;
        d=google.com; s=arc-20160816;
        b=Wh5LFhxEF9BZCAlGrywBS8p/9l1qUjGKbK7ASpmCMnp5yV4DBVAoCbHzQWRQoSGJ64
         GZSrHKmUZbSpmyDOAjOJ3R2BInH2/C3E7ptWH6p0BfqNARSQeK1FRy/eMomnAD5MMSg6
         l5zFQSbTLrsNKTr1o0Gm8hzdGxzqg/GVb4KP6tTdV34P+sjySwri/hynRzs+XpA/T5dK
         DJf8/me8elaviQ3ai7GzxDwqbJWD+F9Rs/sWeP0iYUI3zQUKOlT2Q2B1YSh4yAuSymoB
         /Y3LEGkcvBjR7o8OsHVmq5JCP0uss7VaRiEqWT/czFGbCDe0N5ib+Y+zmSpJx8Ef8Qh3
         4dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
        b=vVR1oo/4SRkXQIqqYMopYK/JvN93wKx3QPWBrS0PG+RgWb3DAX3FKIDsY1NdafgkXB
         9EwFl5lsrfHYBON7Xg9qMi5X//fhjrMIekZnDmpMzPwfshN5FIEtC4LVigbNhVxpBjXO
         9tUp2K983eDkyKnRIO+9hXl7mRiAEkqNEsK3APrL2CfFJY5gOsbtH2wCTs6SjBhr61wr
         8+L6NodqqZWFsGfDEYdpbhjpe7sZ8bHy+A3SKaiqhuwKSp/gEchgu+eNAVpnfb4IDPYQ
         oQDZsqG7yOiV1mDn/OQ7FP+SBx7BVdKYdtwnN3bMBfkd4fdsgvd5cfIFbN4pKjfHcxIV
         fu2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B1QiOMZn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si6573526wrw.175.2019.02.10.17.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:13:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B1QiOMZn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt09c-0008Lv-9r
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005id-5J
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008OE-Kq
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05i-0008FU-Bp
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pl1-x642.google.com with SMTP id w4so4525589plz.1
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
	b=B1QiOMZnSPrk9MyjosQyjsyNuen03qqhyAoKV/xGBtTRGiG04TVGbjQU65p4ENWKVl
	Y6SF2Jr0MCr3fzQJx7+F0A3PpKwNafSodW/cpznDd6YrhihqWXvejNr98oIXWO7+Ri9T
	I+zZv0sLYtOA6bsknsWCvdcRHKsKLkGzCxztJRzhzKThxBa8Z1z4SK0Kpu8HdaR6lVn/
	cfYi4BvROGkx8q+ptlmzGUi15Y85iZAn45BpYy8X1rpp8VQp7D84IoRhGHbdeXfwhRyw
	7fu+UJP4qCZY/0DeCUPwp12CYf/DjnEqQCbSGLSe2F6Nlwb7NMw8jSIV25oR6D98YeuS
	vvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AmqIDdbNf59JA1t3/NmXQ2mwEInbv+gIdpyKJXCMyoQ=;
	b=p0ySa3TbyV3VwD87LYY0B5+tRJ2AVqclQu8ZU15V0ozeEhvMGeATK5EYUhaV4VKL0V
	bP15QPeliW6hF2rqfOJRieHmGnGS7Ce5POE52KzNsrigYjayqs5YAH05cCXL3+dwCaV+
	vGehoXhU7CmX9jMi8smCb2FdHBmnT1NRwAZif8BducV/DglUSfoFXuBhWTRoA42I9Bd8
	siKzVgFT+9WOxUGZWoC8k1I/lTqdbBmnMX3ZR1ny/p5FgT9YcBwgOeZmXK41dZxAUu/W
	YOVRFgt2lURJDOvid8VK4Ga1DX7moq/fTh7HWyDlSefNdVk+5IROVVUWp9ZfCsmqfrN9
	fXkw==
X-Gm-Message-State: AHQUAuYeUgVMV3j1F8cIoMkSLXTPJVKO5PkIuOYk1YIfxhQD9n/KukDS
	z9xByM2KpvAyimU9q8YcnF/U9Bp5Ms4=
X-Received: by 2002:a17:902:2bc9:: with SMTP id
	l67mr666069plb.241.1549847330237; 
	Sun, 10 Feb 2019 17:08:50 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:17 -0800
Message-Id: <20190211010829.29869-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v2 14/26] target/arm: Define
 arm_cpu_do_unaligned_access for CONFIG_USER_ONLY
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
X-TUID: WVZ1Hpe3ZFEv

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

