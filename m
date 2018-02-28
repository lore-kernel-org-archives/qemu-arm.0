Received: by 10.28.91.67 with SMTP id p64csp984080wmb;
        Wed, 28 Feb 2018 11:32:07 -0800 (PST)
X-Google-Smtp-Source: AG47ELtTyaoGpi0RUVI8f3vRC/4R5TYYr7x47m6Ddm/WFomfWx8YvJ1qHcHPUHEHxfO3JzE20TER
X-Received: by 2002:a25:ff12:: with SMTP id c18-v6mr13291223ybe.271.1519846327368;
        Wed, 28 Feb 2018 11:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846327; cv=none;
        d=google.com; s=arc-20160816;
        b=lJQApNYm8V0xT5MaTYunGpPlqszGs8wXh3YHsY2+367JssFmGsiOjk9mxxXQVTq3tV
         fExm3xbyx2n7T0N6QEEp601iOLgDjDeAeJ/BAsRaXjYQF2mu6g7KO53JmlSasqSbZHqE
         DrRxzTI4PXlszCw9iCZx6OOUh9tPoEyxa3gk+pfL9MpWQQCKEyhSj8RF310chsXetz6l
         GVKVaJzUeTxrW/CSLEMvmkblNaL7POvhDCUH8KU7L6jFPNqhVxvEnu+4U0KOtf0+1jt+
         awzS8AXA+4Iof9WWgJ/qqelSNjzfxqmaOF0GXlMv+8Vjhv+tSPBKQpomg57rNIuodq1O
         uBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aDbouliVWWr3hNOE8ldscKdsfFLWXw8zhcxRCOLGT0M=;
        b=lmjM2rj7VVWo+DK6H15ASZ+XqN3vUwE/4VepizivRDiVqII8cvNtxLwWSvutf6l6Ot
         cPTYqaOdPgkWuE1NOsswW6XmLMcffEhXYH2RAjQHL13gGJhsHNySf6LF28GC3jqIuCjk
         qfjE8v7HI5HQLZ8vCPSP2ibj0IZIRoGQZK+UeT7fWurN5NQusqw9J9v4GcAsleLxcR7g
         NgYianaKuQfUV8kHIjD/i7DbuNM/J9ORGhS7z8ryHkDAfIyd/jykOyQdyAviH5fi4EPe
         lUw0BxTwBsNJCAd55eBB2J0eSM5uWRMcnDqCACKfNLW1S9gFfxOQP47+64YA0w/xh8x5
         ZJbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wnn94taC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15-v6si377924ybj.571.2018.02.28.11.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wnn94taC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7SQ-0003XA-LH
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rt-0003FL-Rw
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rs-0006GH-Vk
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:33 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:39548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Rs-0006FU-QR
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:32 -0500
Received: by mail-pl0-x243.google.com with SMTP id s13-v6so2118974plq.6
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aDbouliVWWr3hNOE8ldscKdsfFLWXw8zhcxRCOLGT0M=;
	b=Wnn94taCRxw6ks/jAqoIdl6M+x4xDpV17Vm6YW4uxvh/zw5o/6w1f6UzHTJWQVt/zc
	m6EajvuaDdelwG/igt5rgAbaCiCx6L7jiaNqJzIRLP/SyMAY6slZWBjzIi4WKiVC+5Vm
	1dah568q1zrm3yHaiXUbGYiBEEEv4PKJidXGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aDbouliVWWr3hNOE8ldscKdsfFLWXw8zhcxRCOLGT0M=;
	b=HZK0xHOargZjP++qfRNcbi7kmBZzbfT19GHGYNAIs38Bq7QSZzIsqYmmpYFLRqeTV5
	5WkNFpjNQSt4B8GlXFoiK7I1r5lGoW53BYhXqqUNjTkj4gbeBLb2g4pKW033rzCfEyG3
	2X9p172DkNp2fOthbZpWO2gnzs5bl2z/vkAuyvzbZwbnopfifKEIUYmZt4wrFcI9s5jM
	n0UCHUCX0U9wbSI9zf5SoJHk1+eISGh8kmLhICgrT8Atx9GBkwWP6JPNUxediR2Si358
	hEn3Cx6722oS+WaLvyftnuZPozi4TfUL5uyA7It9MzxL/vuXto7ufMqpDtRuKCcUWkw5
	QXtA==
X-Gm-Message-State: APf1xPA6bQEZ3M667krXhTrObdguUuZzXvcnpXqI9ddWSo8RF7uHjiye
	55/eXD1Vj24WpE3eFYljpSnClA==
X-Received: by 2002:a17:902:20c9:: with SMTP id
	v9-v6mr19197533plg.41.1519846291895; 
	Wed, 28 Feb 2018 11:31:31 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:12 -0800
Message-Id: <20180228193125.20577-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v3 03/16] target/arm: Refactor disas_simd_indexed
 size checks
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5UTmuXygnenx

The integer size check was already outside of the opcode switch;
move the floating-point size check outside as well.  Unify the
size vs index adjustment between fp and integer paths.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 65 +++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fc928b61f6..cbb4510e3a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11820,10 +11820,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x05: /* FMLS */
     case 0x09: /* FMUL */
     case 0x19: /* FMULX */
-        if (size == 1) {
-            unallocated_encoding(s);
-            return;
-        }
         is_fp = true;
         break;
     default:
@@ -11834,45 +11830,48 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     if (is_fp) {
         /* convert insn encoded size to TCGMemOp size */
         switch (size) {
-        case 2: /* single precision */
-            size = MO_32;
-            index = h << 1 | l;
-            rm |= (m << 4);
-            break;
-        case 3: /* double precision */
-            size = MO_64;
-            if (l || !is_q) {
+        case 0: /* half-precision */
+            if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
                 unallocated_encoding(s);
                 return;
             }
-            index = h;
-            rm |= (m << 4);
-            break;
-        case 0: /* half precision */
             size = MO_16;
-            index = h << 2 | l << 1 | m;
-            is_fp16 = true;
-            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
-                break;
-            }
-            /* fallthru */
-        default: /* unallocated */
-            unallocated_encoding(s);
-            return;
-        }
-    } else {
-        switch (size) {
-        case 1:
-            index = h << 2 | l << 1 | m;
             break;
-        case 2:
-            index = h << 1 | l;
-            rm |= (m << 4);
+        case MO_32: /* single precision */
+        case MO_64: /* double precision */
             break;
         default:
             unallocated_encoding(s);
             return;
         }
+    } else {
+        switch (size) {
+        case MO_8:
+        case MO_64:
+            unallocated_encoding(s);
+            return;
+        }
+    }
+
+    /* Given TCGMemOp size, adjust register and indexing.  */
+    switch (size) {
+    case MO_16:
+        index = h << 2 | l << 1 | m;
+        break;
+    case MO_32:
+        index = h << 1 | l;
+        rm |= m << 4;
+        break;
+    case MO_64:
+        if (l || !is_q) {
+            unallocated_encoding(s);
+            return;
+        }
+        index = h;
+        rm |= m << 4;
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     if (!fp_access_check(s)) {
-- 
2.14.3

