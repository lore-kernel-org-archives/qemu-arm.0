Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23976CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3h-0007li-Fa; Tue, 13 Oct 2026 04:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3V-0007LD-UQ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3T-0007sJ-59
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so17363295e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880814; x=1792485614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=rsG3TCscVd7PYoqyQA/dMMFq21JiQcdL/3Au5s6HFt4=;
 b=gkuYDE/x+uxQlelbg+HsK0UVNrhrhXPgGLajX387YT3QA2dagnAQSuqrH1AAuz3xEG
 jBx9JN0Pbonw9E+peFB1NVXFgTkVU5Z3iPp9Q7DPX5kTirVMpN9o1hMZ9eXUU9Re8vgs
 slSiL/1dAd9cFmv+mzlyYWtK59QZB77B8wLcCHj+HNq/NtKyihtcQElTac3DAWbUrBbc
 Jn+P4fUTWrK6wkQ4fMIQJsMrSDVJ34Q4wA/tPH9p4qN3uuYxVUZA43h7mAlEngf2GQ3T
 W34gUerG0ltlJZ6efARnS0cK3gM+6Y7qEKyZHoQ3linbpKVLqCqT592qq47da+p8YN1T
 ZugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880814; x=1792485614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=rsG3TCscVd7PYoqyQA/dMMFq21JiQcdL/3Au5s6HFt4=;
 b=vGHZmmb4o4eOsUhWLAmYU0AbhmI286UCk0IRtubiqSU2om5X1lTlrvzs4xFjqzB29Z
 KRhNLFjliU1MKSpcUfkZPjIjFaRzAeUyLiWQ2XPmGCl/h8Pba/9AZmAsWXRR8+M8VNYL
 3868KlcNdo8ahwSIG/YfXmrbb+EiivODaa0LrR7lu+iEpIWtY87u2VEufhlr5hqhGN5M
 /SpPJGiQ7EhGXDzKNuNlk5SWyCRdDJnGVfg/EmP3XRdnLSviuz732wcZQFAxVbWQdSNu
 dCZKMqYzcH3Jy77J/cb06CV48OhnDXOPN79d7plThwUf6PNiQH5KikScqG+ZqF7fekxr
 Qv9Q==
X-Gm-Message-State: AFq9FYItpEigsfIdBgW3okyMklvonK6pHctjSXYfvAFDF0aqLPEL71HB
 H+tI7hi3GYPmHggt8ovfTRFQsVDfQN5TXgCsCk1ijtq+IGyUL4J46Mm4ocrpqBiIYRY9fct8qq2
 xZKg2H9I=
X-Gm-Gg: AYBFou3FfoZ3qoh0XT6C+oBHMOczDpWtftGcXq7Nkv6GMeD+sfjxRcVyHBqD/wQXUF6
 JD/OFtZDkqEqcgZxhM6q8oYmmrd+N9Vkxh9gtQ4xPDSLDt1zjtUcZoOhdVAFBwW8G8aVYFgz6mH
 jejNp4hKpmqxDTpF1Bw3O446DPStmx7aomUyCz0TNnbO8diGsNI08QdFgLwiyJEeCVXe1iNH8Ze
 KUa2rxIdjXEWaGFTj+m3BWxiw36oSkXDeh/1TstahnP/Dl7EvUvutNygpzOvKgjIhmuV8aPdpnG
 J4bN775+KE4T1IM7fRnR/Sw33rQda0/Dal6zhhZxfS203Dl2cdIFtmq0iROao1qNSuERQDaED4+
 zF/2SyDSQd1SH3ErLlkZlJkvNcRYwxF13VbRqhxTq0CVXm2KiYWid7xVHlVeHWKPebbqRuI2xZt
 +VrHsoljLxL6fYcC+36lhybj+X3EikJa0PgKW+STKJiH9RAzU9VWu0ydfeh4zjd6QGstVMqPybl
 iSTbL0Mzy/8s7bbfzJHuuGmBqZo52DpvjJCtltsB9X5fcbGucmRf03I++seLp9Gg2W5JQ5FlgkT
 xEg=
X-Received: by 2002:a05:600c:c167:b0:4a1:a3cc:3c5c with SMTP id
 5b1f17b1804b1-4a1a3cc3c71mr70078265e9.16.1791880813676; 
 Tue, 13 Oct 2026 01:40:13 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/86] target/arm: GICv5 cpuif: Implement
 ICV_PPI_PRIORITYR<n>_EL1
Date: Tue, 13 Oct 2026 09:38:34 +0100
Message-ID: <20261013083933.1024405-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement the redirection of ICC_PPI_PRIORITYR<n>_EL1 to
ICV_PPI_ENABLER<n>_EL1; the data for this is stored in
ICH_PPI_ENABLER<n>_EL2.

The algorithm in gic_ppi_prio_hvi_mask() for expanding 8 mask
bits out into 8 mask bytes is suggested by an AI, but it is
only 4 lines of code, and I wrote the comments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 64 ++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 2c717b99a0b..e1d3ffb7b1e 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -487,11 +487,70 @@ static void gic_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static int icc_ppi_prio_reg_index(const ARMCPRegInfo *ri)
+{
+    /*
+     * Return the index of the ICC or ICV PPI_PRIORITYR register,
+     * which is CRm[0]:opc2[2:0].
+     */
+    return deposit32(ri->opc2, 3, 1, ri->crm);
+}
+
+static uint64_t gic_ppi_prio_hvi_mask(CPUARMState *env, int idx)
+{
+    /*
+     * Return the mask of which fields in the given priority register
+     * the guest cannot see, which is controlled by the ICH_PPI_HVI
+     * registers.  We need to expand the appropriate 8 bits from
+     * ICH_PPI_HVI out to a mask where each byte is either all-1s or
+     * all-0s.  The return value here is 1s for "do not show the
+     * guest", the same sense as the ICH_PPI_HVI registers.
+     */
+    int regno = idx >> 3;
+    int startbit = idx & 7;
+    /* Extract the relevant 8 HVI bits from the right register */
+    uint64_t mask = extract64(env->gicv5_cpuif.ich_ppi_hvi[regno], startbit, 8);
+
+    /*
+     * Now we're going to distribute those 8 bits so they end up in
+     * bits 0, 8, 16, ... 56 of the mask (i.e. in the LSB of each byte).
+     */
+    /* Split the 8 bits into two 4-bit chunks at bits 0 and 32 */
+    mask = (mask | (mask << 28)) & 0x0000000f0000000fULL;
+    /* Split again into four 2-bit chunks at bits 0, 16, 32, 48 */
+    mask = (mask | (mask << 14)) & 0x0003000300030003ULL;
+    /* Split again into eight 1-bit chunks, at the LSB of each byte */
+    mask = (mask | (mask << 7)) & 0x0101010101010101ULL;
+    /* Finally, the multiply turns each 0x1 byte into 0xFF */
+    mask *= 0xff;
+    return mask;
+}
+
+static uint64_t gic_ppi_priority_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    if (gicv5_icv_access(env)) {
+        int idx = icc_ppi_prio_reg_index(ri);
+        uint64_t r = env->gicv5_cpuif.ich_ppi_priority[idx];
+        uint64_t hvi_mask = gic_ppi_prio_hvi_mask(env, idx);
+
+        return r & ~hvi_mask;
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
 static void gic_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-    raw_write(env, ri, value);
-    gic_recalc_ppi_hppi(env);
+    if (gicv5_icv_access(env)) {
+        int idx = icc_ppi_prio_reg_index(ri);
+        uint64_t hvi_mask = gic_ppi_prio_hvi_mask(env, idx);
+
+        env->gicv5_cpuif.ich_ppi_priority[idx] = value & ~hvi_mask;
+    } else {
+        raw_write(env, ri, value);
+        gic_recalc_ppi_hppi(env);
+    }
 }
 
 static void gic_ich_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1239,6 +1298,7 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu)
                 .fgt = FGT_ICC_PPI_PRIORITYRN_EL1,
                 .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_priority[i]),
                 .writefn = gic_ppi_priority_write, .raw_writefn = raw_write,
+                .readfn = gic_ppi_priority_read,
             };
             define_one_arm_cp_reg(cpu, &ppi_prio);
         }
-- 
2.43.0


