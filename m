Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp389990lfc;
        Tue, 10 Mar 2020 23:48:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuF/RY/LII7iPBzFqkboWfspX4ClBTlOl0agoaJc+UlbJhNfnMwc7QIpVjSuhryMkmLlLy9
X-Received: by 2002:a0c:e902:: with SMTP id a2mr1559408qvo.20.1583909301444;
        Tue, 10 Mar 2020 23:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909301; cv=none;
        d=google.com; s=arc-20160816;
        b=Wx4/rbawucSPTjsqn5gUdYnuDHjzktpj34upR4yGB3P6x9R6G9jMUFmIEVpWiPN+RC
         ZgE2/K3JAfoJxO31sph7xQMwkWtthgqsqMr0RceXRXFG+HGaL5QCgc2j+orLP1WqdpBV
         Fkoo4cqT+iVwK6ycEjdTn5tAbFSTI7gscOk8l1sHogOmaa7GKWCYIAnPfu4JiLptsYlG
         5ZNBIDC/XhqR5zM3xsL6frCgoDiY/w44+u0uZNtBwA3l95PHS3n0H2CPm/Q3P7OHcYjO
         slZ1WWj5Lq4I4+Z8s8pXD/DoxxBkJOp25BGEC4pIczA4bhAwCLUUVBATeL7D76xT1qLj
         9Eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B3XDGQrOIHo2Z/Fxm4hqpcuhDa9MTHMM7/GJHSmNf48=;
        b=KMeGthcHu489lQOxGLbbiWWFYXAfOYbgCrG9zSeRmFRyJkdZD4GVtznSaiCbh+gfbz
         OAXA/l95XSIhuICYNr8JYjBSKPW3+87r8hcY+6AYq6gv3qEma+FibSmUdF0d7b3Vz9Gq
         86rjoVHMpqZ1ExsbuQyIevCoqfbhy9lFv0gKtzNi4udXBoYKUO7vC59wjck29adj9thP
         IqKMdQr73XnVTOrcd7W2ArN4IGNWBtDPRuILRoHaH3xanMC4xiu0yfFXG/9WZe379ip8
         4nPyMvp4C6rw93cKyiV0HhYiyCCYZhOmgjWtUDz2VuFoivtGVyF9ZXN/5sL4j723m2d2
         Lk1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GshumYDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n123si496594qkn.110.2020.03.10.23.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GshumYDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBvAB-0002zU-T6
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6U-00067o-1x
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6S-0001mm-6A
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6Q-0001hE-Dc
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id u68so751725pfb.2
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3XDGQrOIHo2Z/Fxm4hqpcuhDa9MTHMM7/GJHSmNf48=;
 b=GshumYDGLFLuvesKBTQC9q0ilBA4N4T54w6gyQPr9gXCq4SD15BazgVA4Dze02YJEj
 RdGGW+qMy4eYhuAM0HTSXQYYOVfGekhn8MoWFP3NgI0+Zy0pi69L6o9X5xJJ+qruIMw4
 dYH1Q8KSF1a6SwDOgg8y3js+Ib15hBL3oSa3V4M5tqp5C6pD5AIRJuxNY0GSDRpKkukt
 4dDaPwC5j+or5ACIrzO0WHc0CQ6kE3Iojl84TVuDMy9u9ffvwHxcipzjndCplSySkJ6u
 dkGCMiaURON6IW0WxGhs1uTyMSL4kQhHmqUsoLARvngm3bTwVE4Cnn/CGh7RMRP1Zkmw
 DskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3XDGQrOIHo2Z/Fxm4hqpcuhDa9MTHMM7/GJHSmNf48=;
 b=XfEJZUsuKXzs+Gju3dSf8R1aQhT9ba2XtkDtBhNSDr8THKJiDf7r/VEtHZPk5TrneC
 Ss8STcVAmKSWUCWYLq8tYbMzYLYSiIdlIQRq2V/ripxWdH+pQGMcV+Vqu8mFcXzGxpZ5
 hx573fk6KAz0kXOaG3BGYZ7E4oQEvweS1+f2wlhQ11V90pOgmjeLOdL12pKYWt5JVMv/
 Z4zCpyAGIIAU0eXST9AoOPZ7/mKXC8SZMjsULGU6Hq0md32Wmz928btgafXQmTJGrLW7
 olCgHlluyAlYEK5lyUf5kBPkQg/ooPs3vNzAboNc+a6EV9Oizh1dqBFa9rU48WVYoeYu
 wj8g==
X-Gm-Message-State: ANhLgQ2WhVis11h1hzjhgVZjZeDD6ev8EdSju3qNxcsRQ6WBjY9z8v/+
 O4DHOW+U0iJldhpExojbri7aCjLLxug=
X-Received: by 2002:aa7:9732:: with SMTP id k18mr1368276pfg.231.1583909065441; 
 Tue, 10 Mar 2020 23:44:25 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/16] exec: Add cpu_probe_watchpoint
Date: Tue, 10 Mar 2020 23:44:07 -0700
Message-Id: <20200311064420.30606-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
X-TUID: aUU94hyAT6bu

Allow probing of a watchpoint *without* raising an exception.
This is of most use for no-fault loads, which should indicate
via some architectural means that the load did not occur.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  7 +++++++
 exec.c                | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 73e9a869a4..8ec44267a4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1090,6 +1090,12 @@ static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
 {
 }
 
+static inline bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                                        int flags)
+{
+    return false;
+}
+
 static inline int cpu_watchpoint_address_matches(CPUState *cpu,
                                                  vaddr addr, vaddr len)
 {
@@ -1104,6 +1110,7 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra);
+bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len, int flags);
 int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
diff --git a/exec.c b/exec.c
index 0cc500d53a..2b8f601b9e 100644
--- a/exec.c
+++ b/exec.c
@@ -2735,6 +2735,25 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
     }
 }
 
+bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len, int flags)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUWatchpoint *wp;
+
+    assert(tcg_enabled());
+
+    addr = cc->adjust_watchpoint_address(cpu, addr, len);
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (watchpoint_address_matches(wp, addr, len) && 
+            (wp->flags & flags) &&
+            (!(wp->flags & BP_CPU) ||
+             !cc->debug_check_watchpoint(cpu, wp))) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.20.1

