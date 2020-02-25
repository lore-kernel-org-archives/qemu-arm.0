Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1091332lfg;
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxC9YeKFlP3CJG8NgCeHZtpCCk3nATYruOV5AWk4OAHj9DFL1SSiA3WVx5DqnAK88ta/2T
X-Received: by 2002:a37:a402:: with SMTP id n2mr1558706qke.71.1582600475640;
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600475; cv=none;
        d=google.com; s=arc-20160816;
        b=UutIJ6WWY+iXoSI02LcEJtQ5K9J9zHHVmAU60l5a/bzTl80QsZHRGWiFpJRJwc2UV9
         VZFLe95RV+rRmaipmmWXJ9A3moRWc/UK1gN7eeISFybkk9cKJUrjT0e8x7lt49hRd1oa
         wIM7KvJMOuUvhurQFfN6vno9R0L5OrIZb3sxJZAc+wozia3sz0lEqMpjhcQhaCrDg2FL
         CbW8HP5qohZ47s76IrrQ+VD4+WSdKc59VM+BUDQAPkwMaesZpMxgniDYDHDStYbz6B+l
         u5earGjP3gaV7xcXtHmE44soktcPL/0vv41Lb1x1HMzy6BUrzBABSx41PR8YjKGmk4yN
         C4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A2W1ZRYZOUSzamV5z535LWD+FZ9UxwYNyg0dvNAaos0=;
        b=AKucTSreTXu7++7MOXKOhlLDERx5k0nxS2gHTmM12e3UjLM5ZfDLhVW2/kpDjii6mA
         dvLIhfQocW1UC0cPVluvse3hzZeFm0ddLywRzVTBTrtT2C2DcBLbNMytlZo0QZ3BgzP+
         gyhgO9b1XOw0PRZCfxKzzks113UWThvmFs801HXbeM1jP0hxCASHgRXVnwcT1/e7nkIk
         P/mz2bl3fN7IvXpq0buXmgXdOq1alBDT06CmnX/jh3dHb9C6bMtRChcF+OyppeEOlZnT
         Mt9DV2tfEu2if8VB4p91my0EV+N/Jh0r/53zE/bT5degPUFphHGm/iwXxACi9ZGez7Y5
         RHNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gyUb2bdF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz6si5998603qvb.10.2020.02.24.19.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gyUb2bdF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Qg7-0002tt-2R
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfq-0002tc-KQ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfp-0005KD-Kd
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:18 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:36446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfp-0005Ju-F5
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:17 -0500
Received: by mail-pj1-x1042.google.com with SMTP id gv17so656984pjb.1
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2W1ZRYZOUSzamV5z535LWD+FZ9UxwYNyg0dvNAaos0=;
 b=gyUb2bdFAPWdiid3Y/8AxYSkDxXGe0LXMIQFRcQgaF1trTiRUAgnCeXQ9s52dmyifi
 x51DoPH6Wz5I4vvc1QQnVEuRD8w1lf/dmsNM7T+uRcr1KgucfjGVbSZx2AcGZkoLAKw8
 /hAXE6KUyV96lHVNIOrGcl3Kg95qaY4r0k/wawIYi3JU1uWO0WjjIYfGv5I8eoIesWTZ
 iRpkwKAkcpHCBQjw3EBCWOw2zpCM1ok1pipUncgeSAF5Eaxkp/G/ygih2RTni8PO96RS
 Y3KgmzW8O9bhqnMXrxWVrxzmPB0m3AO570p4OEQPfgvutYfRWEUeWMexL1cl06x9WH/O
 kmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2W1ZRYZOUSzamV5z535LWD+FZ9UxwYNyg0dvNAaos0=;
 b=pD101JmLCif/m3UXlp20v0C6q9uWdc4FV1Tb91Aax0TE1t4DG7uIVHIJvqml0IeH2j
 GqNnj6ivcqLXjqqGk/LQPvQtyfoi3eCJd0Ear5HHNUyPIi47Ie6nQOSBcPLM/Q3NH+Df
 apvHv8JPpbXwIxtjKonoQgpa0IwKTSdl+E4lPAI3of0IextbIu0ApwOFGi8Hqva4HrO9
 qomVRXrtCWIrOXY9GBNpAgUO8oUe13tkE4+ruppmYnbwoYbqBb2wCto+6zywS724AnV3
 7lVYht3p5OKHPViPv+Mg1a4Nsjl+KaIS/wv0TIgaKfGCWs/a10WXEyK+OPOv4kn+32lO
 6N0A==
X-Gm-Message-State: APjAAAXol53HpimafSCmoau9bZzBeq7/8QldcN5wAr5aWAR/ko8WcOOk
 W0VSl1KYjNwdla/Kognxagm+Gg==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
 d11mr2644397pjr.22.1582600456350; 
 Mon, 24 Feb 2020 19:14:16 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] target/arm: Optimize cpu_mmu_index
Date: Mon, 24 Feb 2020 19:14:08 -0800
Message-Id: <20200225031414.15649-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031222.15434-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: Qh+MmhN/bMqN

We now cache the core mmu_idx in env->hflags.  Rather than recompute
from scratch, extract the field.  All of the uses of cpu_mmu_index
within target/arm are within helpers where env->hflags is stable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 23 +++++++++++++----------
 target/arm/helper.c |  5 -----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 65171cb30e..0e53cc255e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2939,16 +2939,6 @@ typedef enum ARMMMUIdxBit {
 
 #define MMU_USER_IDX 0
 
-/**
- * cpu_mmu_index:
- * @env: The cpu environment
- * @ifetch: True for code access, false for data access.
- *
- * Return the core mmu index for the current translation regime.
- * This function is used by generic TCG code paths.
- */
-int cpu_mmu_index(CPUARMState *env, bool ifetch);
-
 /* Indexes used when registering address spaces with cpu_address_space_init */
 typedef enum ARMASIdx {
     ARMASIdx_NS = 0,
@@ -3228,6 +3218,19 @@ FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 FIELD(TBFLAG_A64, UNPRIV, 14, 1)
 
+/**
+ * cpu_mmu_index:
+ * @env: The cpu environment
+ * @ifetch: True for code access, false for data access.
+ *
+ * Return the core mmu index for the current translation regime.
+ * This function is used by generic TCG code paths.
+ */
+static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
+{
+    return FIELD_EX32(env->hflags, TBFLAG_ANY, MMUIDX);
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c1dae83700..7cf6642210 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12109,11 +12109,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-int cpu_mmu_index(CPUARMState *env, bool ifetch)
-{
-    return arm_to_core_mmu_idx(arm_mmu_idx(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1

