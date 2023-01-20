Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1188200ejc;
        Fri, 20 Jan 2023 08:00:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzmOJhzYgVxpqmTmkiE/dHA51JwQSLw3xsvPsnny0ax/oeh0wyqaSWVvxob4VLD3JdIZMS
X-Received: by 2002:a05:6214:5c84:b0:534:e733:54 with SMTP id lj4-20020a0562145c8400b00534e7330054mr21862712qvb.25.1674230432422;
        Fri, 20 Jan 2023 08:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230432; cv=none;
        d=google.com; s=arc-20160816;
        b=lr0wbuErnIGaNN88ftgCoGa8KBu7B0ST40LiW8trOCvT6yIYKSYt2jwgdlJytVrker
         k5w1kjT79+XdeiMob35QVNd/DwP5I2NkYjHOpwJiAjPiSRLj4rbVnl0GHIiadYb+D0pE
         vTNU+Xw3ghPUxyxN8F7D5PKhS7ruJocZ2yqf+9uOJGj7DnjyLA2SGL/DLDmiWF8bisBT
         8n/EGzj2KpYj1ZNMYmqKoC0UmQ1jwD2iZzCmjPf3Xt939juIH/G8NyUEriheU9HiLe7d
         i/ak+LGciMiloQ9xE+Q4dZfYJtFLJCg7Igev7nkDXOTzRE6ilq6orxa0sqLL1f/wCmef
         V5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=xjU0A6EWYiNLwYJgdO7eoXekRsEpTkp7GSHFPh8wy88=;
        b=QyEGIsgVdltV4ybZxeqxZPWAt6VgNK18JiBZllRuR0nfOMTp6NlvE1WiHaB9khFs3S
         6HaasEFd45qoJgW9tF5LRJdxgoEx0KeixU6T51YWT/mEmJWNHVuzhRTNo4sZsSmdgDXp
         NgFoBxX2T27w3mVcHjrxgHTMfe62fPLpAMllJgrmVuL+Xec/6viigThe7ujOjmVahtVU
         tf+f7CUMgEPTQrw2Ay2tfXuVQfA5TMghCdQhz5QawhvU4xFVzCFHsqOVlTq96tWrXYAn
         ub1w7lhDOBfE1YC7zvKiG7VtsgvKHyY9oixu7LqLD82tEjS+dRsRVK7Hk4sQN6wWACPM
         HKlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=VYJoKmTL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a05620a448d00b007067c891977si10004528qkp.235.2023.01.20.08.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 08:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=VYJoKmTL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItnq-0000gD-KM; Fri, 20 Jan 2023 10:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItno-0000em-1y; Fri, 20 Jan 2023 10:59:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnm-00073f-7E; Fri, 20 Jan 2023 10:59:39 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 393C520E1A45;
 Fri, 20 Jan 2023 07:59:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 393C520E1A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230377;
 bh=xjU0A6EWYiNLwYJgdO7eoXekRsEpTkp7GSHFPh8wy88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VYJoKmTLzxvQbeZ93htvim0OBw5U3aD/iqNNf5Kf60ccw0wgdDA+d5hf8onikepz0
 ztvsdDfbwkTDCjbeaiLXojLXLLIB4UHoF/SqMwKrP975Y7vyOwVWOjppr328rrON4w
 JjiuWh4imfV4foh5lbxPdmeZkx3W6ZkbJdqoRhlw=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PATCH v3 1/2] target/arm: implement DBGCLAIM registers
Date: Fri, 20 Jan 2023 16:59:28 +0100
Message-Id: <20230120155929.32384-2-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
References: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cETulIyf5Zvz

The architecture does not define any functionality for the CLAIM tag bits.
So we will just keep the raw bits, as per spec.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..d1ad0939ca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -495,6 +495,7 @@ typedef struct CPUArchState {
         uint64_t dbgbcr[16]; /* breakpoint control registers */
         uint64_t dbgwvr[16]; /* watchpoint value registers */
         uint64_t dbgwcr[16]; /* watchpoint control registers */
+        uint64_t dbgclaim;   /* DBGCLAIM bits */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t osdlr_el1; /* OS DoubleLock status */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2f6ddc0da5..f95a73329d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -632,6 +632,24 @@ static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void dbgclaimset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim |= (value & 0xFF);
+}
+
+static uint64_t dbgclaimset_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* CLAIM bits are RAO */
+    return 0xFF;
+}
+
+static void dbgclaimclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    env->cp15.dbgclaim &= ~(value & 0xFF);
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -715,6 +733,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
+    /*
+     * Dummy DBGCLAIM registers.
+     * "The architecture does not define any functionality for the CLAIM tag bits.",
+     * so we only keep the raw bits
+     */
+    { .name = "DBGCLAIMSET_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
+    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_tda,
+      .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-- 
2.34.1

