Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1086280ejc;
        Thu, 23 Feb 2023 12:44:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+8j4SBBdSECWhfpbyMs/KIhYrvnj4orxJ3JS2NQLaxXZDI+jR3eGdpomdFyxjzYjl+t6pM
X-Received: by 2002:a05:6214:27e3:b0:56e:98a1:fff1 with SMTP id jt3-20020a05621427e300b0056e98a1fff1mr23546213qvb.7.1677185088457;
        Thu, 23 Feb 2023 12:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185088; cv=none;
        d=google.com; s=arc-20160816;
        b=nl9TtSunIcHIGmlfgqgRq+MGAW6S5JJHMRS2O/NF+jzoyX+Rb9nbRtq7n7xrS42Dvp
         3WIUsY5yFuw3k5lBunVl3EantVbmRm8pKbjPHRjo1Uuk5GBuLzPOTT6sfi3NFzgQIJCQ
         5ankthgAaUKVU37jmPBhB9r8PDCaMBx5fMTPDpBecy7KoozYw8/0kSbyLWxdyFDkXkDS
         pUu+iJN+vG7I9O7pMr/UwXZUJuq06XWNnj9Gy/8CjUJCfx6y5sWYTDlorc/xcHpXozTW
         Mzxv15VW7eQSDSy06P+cXGpY3dKuX+irBomWK5odp59jUlCBGw4aiFLuvrxpS31dXRyV
         KMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uCfgSwaCWGjVH4XmiAS5xzTjPaTu2Mc57Kv2qaU5lRM=;
        b=RRIt2F2PZqgIWq4GALxRhnQ9Myib3zn8BDEzvbWAzTFe4BujhVTOzZaAaaJecTrR5l
         OyPtsEdK/px3wDjGlh6KThoRKfzL3Rtz0SYWnPbTOE1QSssay+waRE+ennHLNAXxh+5e
         rt17Rad+s4VwvFD5BZIav18iwapQHABe+HGIhpE9Q4PlxrTnHIVw+gKlwohKNWOE66yB
         wI7/z1BzpWgK6dKt0Pv8iYtFPNYKq4UoxbHUZ4BHX6n3nvQDYtAjd+2Kri46u4AVPaWS
         06uhzPjnK/X9OLs0Wb2VpINTR+/TnVTi4RvnUcgyz3KS+mq7bmO236Fkw5AE9AzFwvtN
         rZhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n89/wfw9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a0c9e8a000000b0056ea7cac144si2114009qvd.376.2023.02.23.12.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n89/wfw9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRb-0002oX-NJ; Thu, 23 Feb 2023 15:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRa-0002nk-N0
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:43:58 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRZ-0007RJ-51
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:43:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso554081pjn.4
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCfgSwaCWGjVH4XmiAS5xzTjPaTu2Mc57Kv2qaU5lRM=;
 b=n89/wfw9eZdbECZlYDz5DfRTWcaLs9CRGk61ZLnt0wYLe7RkvzUXWZxy/qVdfS/xMx
 jhsvJk5jAkHNTzM81PI0a2bQQTbAZvfnVX8sAfjjaNeQsDs4wj0zY/cwXWeHTiefiCab
 LKLWuP/9XG+VMZ4JnJ5xrnl5S+WFM3XgAXMW3c/f8WuxGqF5jLknWA8HkHqCRJpRw/wJ
 fF0P+VrmAlNGpOZI5BCoMTEDk5mXgU4pN+OP5Sdrd9UUPfchmR81q3hbglvMBN5bOSUy
 cV1N3zw+lSJPnew/CiLPXvFrEaqiZDMYaQLK2t4Hy0JAmDl6ATXosa0QSXk15skr8h/R
 R/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCfgSwaCWGjVH4XmiAS5xzTjPaTu2Mc57Kv2qaU5lRM=;
 b=zItnExvz1x8RIro7hsSOFhS6IplVu8VGTRHWXlvk+hCmzfV+Ts045DhAFNurzXub+n
 SBsFwbaPaqPJLjgx1kbHpUKm6zziOtV5lL+EhV6ma8Ru3FywZcjY8G1x0Yl66pzdbBMo
 n6DReF+YFmpGq0DQSy30ENXB+Ig3YT4nENYryqTy++7M4mWiOeOxMTj09B3tuGW6tj94
 vuNCfQCPOVjTfbHKn/q2aR4qnjMURT6jeyQD25w7sWNMg0io1pksVUJlwtmjV7kftME1
 2jE25ccqeIhViHtX3Nb+Mb5+M24afYpz5u3nuHplvTDEopFfD5mVvny8ODzM+rEq4JNT
 E4Gg==
X-Gm-Message-State: AO0yUKWgQ+Awsl2fJK8eXbM0XRR1CrN8E82g9O/CCRRXdgIZFp8J4tWd
 LHj8LNkGuCz4b9OzlPe3FY39VF/IlkdeLXRCNfQ=
X-Received: by 2002:a17:90b:38c7:b0:234:a88e:d67e with SMTP id
 nn7-20020a17090b38c700b00234a88ed67emr14757191pjb.34.1677185035744; 
 Thu, 23 Feb 2023 12:43:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/13] softmmu/physmem: Check watchpoints for read+write at
 once
Date: Thu, 23 Feb 2023 10:43:34 -1000
Message-Id: <20230223204342.1093632-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XH6fPO4lp2SQ

Atomic operations are read-modify-write, and we'd like to
be able to test both read and write with one call.  This is
easy enough, with BP_MEM_READ | BP_MEM_WRITE.

Add BP_HIT_SHIFT to make it easy to set BP_WATCHPOINT_HIT_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  7 ++++---
 softmmu/physmem.c     | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236..2f85ba14b3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -921,9 +921,10 @@ void cpu_single_step(CPUState *cpu, int enabled);
 #define BP_GDB                0x10
 #define BP_CPU                0x20
 #define BP_ANY                (BP_GDB | BP_CPU)
-#define BP_WATCHPOINT_HIT_READ 0x40
-#define BP_WATCHPOINT_HIT_WRITE 0x80
-#define BP_WATCHPOINT_HIT (BP_WATCHPOINT_HIT_READ | BP_WATCHPOINT_HIT_WRITE)
+#define BP_HIT_SHIFT          6
+#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cdf23..c4f62dee60 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -915,9 +915,12 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         /* this is currently used only by ARM BE32 */
         addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
     }
+
+    assert((flags & ~BP_MEM_ACCESS) == 0);
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
+        int hit_flags = wp->flags & flags;
+
+        if (hit_flags && watchpoint_address_matches(wp, addr, len)) {
             if (replay_running_debug()) {
                 /*
                  * replay_breakpoint reads icount.
@@ -936,16 +939,14 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 replay_breakpoint();
                 return;
             }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
+
+            wp->flags |= hit_flags << BP_HIT_SHIFT;
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
 
-            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+            if (wp->flags & BP_CPU
+                && cc->tcg_ops->debug_check_watchpoint
+                && !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 continue;
             }
-- 
2.34.1

