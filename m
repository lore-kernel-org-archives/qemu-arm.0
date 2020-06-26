Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp51132lfm;
        Thu, 25 Jun 2020 20:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3gdGG1gAY1NSO8A84zQbkM5UG8AHxUfwvOHplbNDJBRlGV35dJVBKwDwxWOPuJWSvK8tn
X-Received: by 2002:a25:7804:: with SMTP id t4mr1936250ybc.43.1593142718071;
        Thu, 25 Jun 2020 20:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142718; cv=none;
        d=google.com; s=arc-20160816;
        b=ky1N3h+8fU7/IyRafb1G55v/s2JAOtcDJkZg8xxrlPmuvkGVf20O+LY2j0MFXez1dL
         zos9E8ZzzDOkpnj4fbI6FecRSypCZ7Blbn4MFwWBdbb7QCS6Z3/05FYHgJIN2kZmtxPf
         ek0QJv6lOR6F04mFXcii9Ah+8cVALzrQm39ES/liF1VhYXKDXs4u1HhuEhoi/5in7ttc
         yPlaXxdPMH356KSLJB2C1GoFI8DFlf1MiYjyzY1zgcJY8WppDMXkh1NgcLoPYIaNvGpV
         6etVmaKpnNqDzXrcgig0aDklOm05ViDfKKJktHwmpL7jKMqlMu9i2mI0rBhcxu5YtuNS
         965Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2NZq7MwSZVbDTTVTgGqliRVuFgoYZu09YHrFiII9iDw=;
        b=rYhXPSe8v5Nd7DbKk7kGZHuGwGVoOJI+ZxA24noPnBtfm9hkrj8CMXFMuC1VD6wTwx
         YCppX5+efsUtKj8JQDRmwXkZnWollcoPNNY8jcZ+hN2vXl/mYB4rpXkJRrVoD8MbWs3D
         Pi7Chl4dADePU83OHZ5QNVTIZbwhtExwVmaLBstPveg1leyY7EhGICK3B1dSx0DZoFBr
         CgJ9BKXL/3sQrSKumalxrH31JmdvBtYgLr2+iSwucmAPVAyRhK5tvNMVLYmJv0+LjzGP
         mocQmwUVhMQyIehD3hlvN89SKcX2kHENUx39CWF9WUFJKdMrzxc7wHdBTvgrA3NxU6iH
         CA9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIb9kVzw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si27962963ybd.373.2020.06.25.20.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIb9kVzw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofCH-0003ht-EY
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof60-0008IX-DS
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5y-0001qO-Ia
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t6so4370149pgq.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NZq7MwSZVbDTTVTgGqliRVuFgoYZu09YHrFiII9iDw=;
 b=RIb9kVzwYaarnoG6gExGMCaFZKMkcfeueM1HUKvdnlUI05Xyn97uZITOyyGBOlybRd
 VUtVeFdM2QMm+q3P3BMaUTgzAtyAS7fmS80KaZSk1wzTv5GgSdiv6fiHYxZuhssSDu0I
 AFFAfvJ/uCjRS6olsmcPpxW3rnFxpdeMm/+qJyWy/XgUUGQUczLt43OpwBm+cmjGE1+u
 y+eXTrqBuguHnmwj8oIznrHWQcFY6BAMUQcTvFjmIg/JcNCQF6IZ6okZcGqJHAzhwfzy
 IQ880rxwED1IJ4Zs5bKq6aBeZRYsSf41sxLLoyQGCLtP1fpp4nzlendCC6nSpFQfvkj2
 pb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NZq7MwSZVbDTTVTgGqliRVuFgoYZu09YHrFiII9iDw=;
 b=Gg2PMFxz5JX2Lopuiu38wUFCPS2efTDciBUl0eniIYuNz8RlB+F60eoHUpz+zBk0C7
 X2SpIhQXjS7jukrKjBpBc+3t4QuWQtQ86avf5dxLXnfw+dZwgniR6Lbx5fmXIFyLfNWR
 xdrKVFhwSLF6sdhgZ3UfXXLCazvH7QTnqc2SWC3S1Rn79Y1Y1/TOoY+/Mjuv9LQ7rUeh
 LCTAzBIXVVUkQhjodzxEkDs4jZL4lP+Mq/lfSnfWEfmpJq30sUhMX4W5Iddl0k+BBZem
 GC6RaoMH0hk7L6sEmHpOvBQrrlhx3ow7q9h705bc0AAXzCf/A3Ei04MMuu4Tesf+LwrN
 hBtA==
X-Gm-Message-State: AOAM533fgpwO/eq4Sn1W2CoGnFa1UqtUJDYt7qXVE2Na37Fqr+PmdLPx
 r846GZvjfQQStantt85PsP9ySSsQ6DA=
X-Received: by 2002:a62:7883:: with SMTP id t125mr559197pfc.229.1593142325213; 
 Thu, 25 Jun 2020 20:32:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 14/46] target/arm: Define arm_cpu_do_unaligned_access for
 user-only
Date: Thu, 25 Jun 2020 20:31:12 -0700
Message-Id: <20200626033144.790098-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: bJYMt9+gBxvj

Use the same code as system mode, so that we generate the same
exception + syndrome for the unaligned access.

For the moment, if MTE is enabled so that this path is reachable,
this would generate a SIGSEGV in the user-only cpu_loop.  Decoding
the syndrome to produce the proper SIGBUS will be done later.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Raise the normal data exception + syndrome.
---
 target/arm/cpu.c        | 2 +-
 target/arm/tlb_helper.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e44e18062c..d9b8ec791e 100644
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

