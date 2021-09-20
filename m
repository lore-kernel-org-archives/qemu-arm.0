Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1694421lfp;
        Sun, 19 Sep 2021 19:49:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOkXv9bfM/vR2leKL/X3OmCLZolU78J10UirCuyWj/HP3ialKHtad8rujGRO2GMgY0HS+W
X-Received: by 2002:a05:620a:533:: with SMTP id h19mr13484038qkh.108.1632106144628;
        Sun, 19 Sep 2021 19:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632106144; cv=none;
        d=google.com; s=arc-20160816;
        b=t1J7UvDHy7ehrsWYL8lvOcm+0roclLrTGEpUd2goKVwRcbGyYf0UKc3sCW3QT6ROp1
         YWok/xZMuKacfc8eKSIz4b7c4cRFkILCuEpKMtsumwIG2Q9jIG3woGPEn+G/cp5gmEwE
         SlvKn2BI/aIxC0FbSHR4NFKr2qBB1w4T4W5eSnmNjrL1CLSi1QqftcsFwWgEvffWGivi
         fmg/2WG61ncXTzo0XDJ2KuAwiDDmlAu7q9E8tQRpNaNV4KxMuoaIhqSSvLWt2BzSUHuZ
         W6+L6HCcNF6C9tMqDwqWlW7v9MDRjexQhZCWRNwEam+8TLRk+ccdxNhgBs0WsRZPpE+Y
         7Rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w3KUOion9XWWhoPS4rc4FuBN5MtiU2iUhO/KyBmkvEs=;
        b=mxcUN8B+sbFwV0b1lr2iNYNdKY920HqwTB3WobpUwXMi7Ks71xstT22aq+9THJFihd
         k5MoQoLkc6lqAqiUs/HOJy0c56ZxSxEHzRrPo612mubCx6PEwCScbrfEvS4vPJnJord6
         c9ExQ3rzgoJ/S7cdt/Q7rjPAIaTUR2zsDsDpMVQW20FSZFHKpA9JtBW31RyhW12bfHDf
         QjAu8iIilOiXeKL/lrt/CCySFwRauKtmYRZXDeMpEjE+evcA6zcuNK1kAO+zbtomGdWn
         N7uxZiekGtG+To1ZfncjOfLE50FmoQOan8dtxXaGT1Ubs7+QNzgRlCvBfw6v5kx+qLRZ
         o+Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4RMbwu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si9363904qtf.8.2021.09.19.19.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 19:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4RMbwu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS9Me-0002qF-3t
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 22:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iv-0005DD-0U
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:14 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Is-0008EU-DV
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t1so15901199pgv.3
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 19:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3KUOion9XWWhoPS4rc4FuBN5MtiU2iUhO/KyBmkvEs=;
 b=B4RMbwu5TdKbTQfxAy9Ztzg1LgicdEVJqzCH6kQbUMxCIFJ0sEZ3WizoT8BRgbbel8
 72jrCt96XbJAy6drqW4X1HZGIrnLuIszI86af6p1dxWFg7kdihpM43fIB3LczlqbS2rQ
 Nw1NFoKW67jHdoiWT6GPvHHQjEXe59jDnYbk7vYGhp2LKiFbvkr84neH3/1JavJRPSYc
 M5UXHDKe8/okjiDkWsJSsehybeagkpxVD1m8phS5MNC3vsa65NfGNz9yhjmM1EcWInlX
 CbwXedybl+rE7n96MWtbGvPOrRtLdX8f6yigjRhx84ShSBNpaL73c4sUh0aITOYWpDU6
 w+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3KUOion9XWWhoPS4rc4FuBN5MtiU2iUhO/KyBmkvEs=;
 b=wK+S3abASCLF//NAYv8CelJ7ej1qobNhUxqD/cuV78Ur7KRsbpri/Z9DuXDKdCz0wQ
 IywK+HuuHaQLqri4P5NJ6YmSOWSSI93GVayX7HMjLiPYsuK5Vyex4s9R9csdF93lHx5m
 IMLFbm4vpo/Av80cnZoL3oo8Neg104OeDL4cV0L25BelEMQIbOgga8jQRQl3+s2JJ5ld
 l2Zx0w0/wIZv9jhodWogu/SNmyIslyfv/1AoVeZCVc7n0H0EuZnQBSKSTeJOFit9p7bK
 LPTD3gOcopO+0tNLtMAI8UYfFFS0Clwl0XC8bI/8BPOCgDl6wjRQ2EXHRkdqrmMB+IZc
 7otA==
X-Gm-Message-State: AOAM532omJ7EU3UWFnb7mSEt9Lxct5ambW9k/2gSi+u9JGrziJ3zItiX
 brD3y95KoP9wI7CNElKp/eo6AA==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id
 a1-20020a056a000c81b029030e21bf4c15mr22361978pfv.70.1632105909096; 
 Sun, 19 Sep 2021 19:45:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] target/arm: Assert thumb pc is aligned
Date: Sun, 19 Sep 2021 19:45:02 -0700
Message-Id: <20210920024504.625965-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mniiPSH3untd

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 62c396b880..e522cd2fbe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9640,6 +9640,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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

