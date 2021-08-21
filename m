Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp554990lfg;
        Sat, 21 Aug 2021 13:04:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx0SS6S2Y434EbRkGXtlRFy7d0+A9ykAk+m7DWlQLCRhXoTqaFR3W6QMxOsyEvVzxAgB56
X-Received: by 2002:a05:6e02:130e:: with SMTP id g14mr18165901ilr.81.1629576242459;
        Sat, 21 Aug 2021 13:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576242; cv=none;
        d=google.com; s=arc-20160816;
        b=h4Kk3PCOBZmnmcQZ7IoSvjGAsiOZSK9J6A/WJCvlkSi0xBLDYkKyO9jGJuTL9U5Nu0
         +Bdrsddx7Fmu2sCQXvpO04ZfxdYdh78XgGBmliE/tD/IqLHfbcJ97tfZ90gkyNnpJHVg
         iv5QHtuB9qn0gAJeupenUsnesyuBIFKzsKLG1NpMvKRKy8qNX3yYhUYPPO58yQoBYHbj
         6pSLt5r9RgS0ALJCYcyW4CJMgITvrh8z23xFq3oJWjgu4d3svUFlHNt8oQftPmGoQTFi
         C5++NWseYMLaZQCDEiNhFkVX49KRZIlHGYuPvzcJkCeNs37rEtEIbzIo15kFCLhUYzXW
         JYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+ZAhinf24CQJmFBs0vLR+aQqqKuFbYYjrTVj6/rZMr0=;
        b=D5mj/6AZO3XdEYhU9gx02D2LudqL0QAHHqur/Yle1qYI471D0tsY9Da/uTR/rAg4x6
         scwWipJLYuDg/aIR/n3cMAnMvZLou+lbzCYBB9pJLzcAiw3tkfhVMoin3L/OqwTamxn8
         LNWUk6erfVvygV2ktvQ50vDSh4wkpds8f7FxHWmv98+9rtQLRnObI2PwS+19SRF4012p
         l+A5zWJdjUAqGDXTh3Y5iX3mGCKfZrt8d+FKBlmLw29EtJ5O8VSnDVnImvZxtqqzcWwF
         tG737yEDnb/9q/dbNXL3qifTAb6Sy7BIST2rYwH9fedYay1oCQWzgJh06qeqeF84TjgX
         wO/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8XzlXMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si10676488ilr.157.2021.08.21.13.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8XzlXMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXDl-0007uo-Qf
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA1-0002G2-B0
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9x-0004WN-EK
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so3215786pjw.2
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZAhinf24CQJmFBs0vLR+aQqqKuFbYYjrTVj6/rZMr0=;
 b=x8XzlXMqmNwEWr+RvHQwja3b0lcaWPiL2/HWJRE+q+Mv02ofI9U+RD1kU0CRrE/g2n
 YlZNlvt5UfgZDDTEo2O9eVIX7CwOTUr6qQjSLT+lxpPbrEEcT2CTgwbXR7jWcF0VJdmg
 FkeWjLd3niDydLoNQ+8ksEmI1XlO+cieLMJMs1WVdgvwXLi7ZpudUWYMUFfQNgnBxw/G
 moGbzvBV1PTBxHkkY7i6yya4TqoUcSh/roxkGARu9yjXV5MtHRlifMl6cEG5Aq7Qe7yD
 ZuoZj4GKHQh/PzlmD2qX7w7jtMiIQNS7V/pPt68RmzKMioRSc3X1Caa6z77MwM/0/ChN
 ipRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZAhinf24CQJmFBs0vLR+aQqqKuFbYYjrTVj6/rZMr0=;
 b=XhsNZit+eHGp/YkbLDZKLGgrnerYoxPh/HX/jImgLrb+cxDaT33uWOXmyo1FDnYZJT
 Z6eSDZyTQ+yA4VgUujMGYPDTJ8r+CUnItdBuqmlGOcE+xq0uaYYToe6mn0+kqKhlJW7H
 LfKwMVbCc9JwXzSd9RB06c/mWhu/cZ2Zk0XX4j7Er+2sjM5Bd5MPCGolm8uLuYHVUu59
 OUaLT45RsTtcwOt/KycSYMQtpe1Kh3QSiKKlgXED90D33SkBiZN6Jkp1DgwGfr773+ks
 S/vpISEH5olejxRIXiOOxXDMPyleCRJyitjiADXgL87dHR/hOJgop/MHnSODE/XFlqx8
 BQKw==
X-Gm-Message-State: AOAM532pxAM+1oCV4GKt071yFp7mOfak8quWYHrQ0IKdMYUdNq60WPGn
 pdxyZxrYFpCAMMr5p/fWBNsOHA==
X-Received: by 2002:a17:902:8c90:b0:12f:699b:27 with SMTP id
 t16-20020a1709028c9000b0012f699b0027mr15372004plo.28.1629576003929; 
 Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
Date: Sat, 21 Aug 2021 12:59:56 -0700
Message-Id: <20210821195958.41312-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5RuZVef5CqC

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub.c   | 9 +++++++--
 target/arm/machine.c   | 9 +++++++++
 target/arm/translate.c | 3 +++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b341..a54b42418b 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -76,8 +76,13 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     tmp = ldl_p(mem_buf);
 
-    /* Mask out low bit of PC to workaround gdb bugs.  This will probably
-       cause problems if we ever implement the Jazelle DBX extensions.  */
+    /*
+     * Mask out low bits of PC to workaround gdb bugs.
+     * This avoids an assert in thumb_tr_translate_insn, because it is
+     * architecturally impossible to misalign the pc.
+     * This will probably cause problems if we ever implement the
+     * Jazelle DBX extensions.
+     */
     if (n == 15) {
         tmp &= ~1;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de824..b5004a67e9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,15 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * Misaligned thumb pc is architecturally impossible.
+     * We have an assert in thumb_tr_translate_insn to verify this.
+     * Fail an incoming migrate to avoid this assert.
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dfeaa2321d..a93ea3c47c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9595,6 +9595,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
+    /* Misaligned thumb PC is architecturally impossible. */
+    assert((dc->base.pc_next & 1) == 0);
+
     if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
-- 
2.25.1

