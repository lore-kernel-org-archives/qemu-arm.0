Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4342756lfm;
        Tue, 23 Jun 2020 12:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6wIE16tjD20WUrzqREsBVu2eJqKicBg3qiCr5V9nawdX5lVBAdfE1JF1u4IStPABIS4+2
X-Received: by 2002:a5b:18d:: with SMTP id r13mr36435050ybl.235.1592941217923;
        Tue, 23 Jun 2020 12:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941217; cv=none;
        d=google.com; s=arc-20160816;
        b=hkw8ZB1PL6X9JaE2HexrHZM2nnBtOTGpHnnV7Lyao9woC3OP83dWgjsvHBwzZWaiXt
         WLxCBT+6NJWgDekpUFUwBH4BGGPIpzQvAmwvMJgfACzg77Izjig22D4z0bRVE8KRSwXv
         Zr3pmr+hwxuWPr+alscMcBeiQLk8A7vdcV+hsw3ZHKBuVdsCZvGAH5gnQztPsWw1fLh1
         0Kt3CHMX+hnJEH0y2BGrgsDbByMKo7r6Jnjuigisof4Q9KsqGAFJq0Lha6/JIglSQMm2
         Psdzi5UYETuIFxXTCXVpRxgHgTYvkYDR5KTsv1zaZQ+4MVFjinYgQ+E6pMfKfkf/7Ind
         u1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=drS4gTiWZxC3Kosp8AvXNBkFhO1l78w6MG//p420qaQ=;
        b=JEiBbAPjkpjOmVgUxJ8MvbY+ADIsd3QdDNk3QugBbiqzG2hZnkl4CEkzasGvF+7jA3
         vt6CMuDinbssYFpM1FtNrtV1vqtkE9dkIWc5xB2c/HcDRmYnvMeFAAs9nFLgOoGWu4Fb
         VqbYVKcBq1gQOll5uK/iNtqPdvyC3oflUOibyimJcuIYemujGBQhi8ovFwNOSTt7kA2v
         BdvCrvDaSZbe5mG2rHTIB29BPJxqQjfz53a//X6EIWkMZo+Vh5rKyeFOhBbNidupzKIA
         z2tBDc7yNcvpD9eBt8MsKcuGckdlGnB4boy/wN9pLrSKG6fgdx/nNCimCvJU/RdkSbsS
         NaQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tsjgXD6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l70si17039197ybl.11.2020.06.23.12.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tsjgXD6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnomH-00010Y-5j
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojT-0003jK-Ki
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:23 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojQ-0005eF-V1
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:23 -0400
Received: by mail-pg1-x543.google.com with SMTP id p3so25084pgh.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=drS4gTiWZxC3Kosp8AvXNBkFhO1l78w6MG//p420qaQ=;
 b=tsjgXD6fZTateWW5KZKXQRLhJ/Gs65xk/vXMZ4Qs+qqFj0C5SnrNjoRRbMSZUmDNCV
 jbFLS1wSE93UWfv2XcCrwO/jekmD8RBDPtw7d5aFsknC3ABqqAxSih7iDN0QHOGOJVXg
 K/jH3PD2MrDbWthdeqeTx5GlNVZhe4fNasidrTEg6DsQuozVxkY/dySzWj+yCAVWKgL9
 8F6F1ND2IFCAmAanrnJN1pYFWcUHXoP4Ehl+k38gWa5bWc7dfJlt0eU9STtk452STKkl
 O/E2DGA09Y00XaF3OPNXxGP+AljE86Y3/BzP8U1QoUY0RPLidFolRD38owxXvgbJ3gFZ
 4dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=drS4gTiWZxC3Kosp8AvXNBkFhO1l78w6MG//p420qaQ=;
 b=QMcC4TXOsJZyD7JEtNzfsIW+pWVCz3yrayAZsIp/rMXTAP0gLyIZoYKrWNn5FTr9XK
 BO70CkwI9hlGi0Au5DM3IJ0gGbGYNs9hO+lm1kndF+qCMJM5Pc/TuCe7dE0GguAbDr1Q
 rETUlcgBDFc2bCL5ao/YvMpcn1Cc+zFfnCeKxC1Fwt7ec9vjCfrvaIYvR7nBQNS4BXw9
 E6Q96eWNKa0s/YA9iUWriu20E4jMJgeQJJP9extUPYdpuqRu0di/d8pRRVg2SyljlccZ
 M9c5+iaAP1KPO2h5nhJWw5vll/ZgXVIcl9/rCewthox9ht1dCIHrFroQ1XpuYY2V1cAB
 2Euw==
X-Gm-Message-State: AOAM530DECE+z2jM2oTJuyxZRkzSrCAYLbkPnyOZEw4bZ14Y6u3u1Gbs
 zx+WTPoxCAt7nu3/gXPUf4KT/g==
X-Received: by 2002:a62:cf01:: with SMTP id b1mr25307278pfg.84.1592941039233; 
 Tue, 23 Jun 2020 12:37:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/45] target/arm: Define arm_cpu_do_unaligned_access for
 user-only
Date: Tue, 23 Jun 2020 12:36:27 -0700
Message-Id: <20200623193658.623279-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Vv+0UQN80bw

Use the same code as system mode, so that we generate the same
exception + syndrome for the unaligned access.

For the moment, if MTE is enabled so that this path is reachable,
this would generate a SIGSEGV in the user-only cpu_loop.  Decoding
the syndrome to produce the proper SIGBUS will be done later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Raise the normal data exception + syndrome.
---
 target/arm/cpu.c        | 2 +-
 target/arm/tlb_helper.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5b7a36b5d7..10677c0c23 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2169,8 +2169,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
-#if !defined(CONFIG_USER_ONLY)
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
+#if !defined(CONFIG_USER_ONLY)
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7388494a55..522a6442a4 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -10,8 +10,6 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 
-#if !defined(CONFIG_USER_ONLY)
-
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
@@ -122,6 +120,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
+#if !defined(CONFIG_USER_ONLY)
+
 /*
  * arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
-- 
2.25.1

