Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1183432ejc;
        Mon, 22 Aug 2022 16:26:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HBmfCEjdUo8eMfJv9qMU8jiHnp/gyRTrrLV2HuewKUbMflrQI36rrtbU46nlLuZPLVYx5
X-Received: by 2002:a05:620a:bcc:b0:6b8:60f0:f419 with SMTP id s12-20020a05620a0bcc00b006b860f0f419mr14440058qki.157.1661210804660;
        Mon, 22 Aug 2022 16:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661210804; cv=none;
        d=google.com; s=arc-20160816;
        b=dui0yr1fz+Wz7yo6kQNPHoGaesxCMR0dQX6JDUObSYzoF6Y5xpVYMbN5Ll5OUPD2Ir
         o3UJ+LeeoAZQcYHE5vu/2IlaPO7Zy/yn3kgIPyyYiP4QjtK6YnHEypBgoXlRlChMmZoI
         jf6drXyLxCoK356U0qXHfjR62bG0mQ5FYjfodoPVlSJE1GJE/mNvF5Q/uo7NFYGffy26
         XAZ8FZX4DcBn0t/YlnYjj46RCfvwqtDu3ZRRE7licuZu1pcjFCwXGQCA5wHCpm1mbMAx
         A3VkM4dArSvCqtsa40mHQRBBl9hcewecr2FKdHsuvW8GpQLA02s8M5V3fi9W2rFKShBQ
         ahyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tqkn/JG3p7hh15BhAIIM7TpuZb0gvOSNNm/i6FGCa5k=;
        b=IP6xj91NxjF/sdujfl+KsuVGi8f/M6I+RCyQTzwbhSE52FHjcYWKIvi3hCM5e+ioQu
         zItLbGmyvyXEQlrnZv0BQE2y+ZhwjfmpOaN9vyPKJMWF9BLJFVQzY3sundGw/er+efKP
         lFCRwgNMDH7uBQ3Uk1R66uL+WYMd6yF/YDfVrGs+rRrspQFXxlSGRAOFbbBsMso/ZBFA
         hg9Spkrx45LGR651Zfa7+sNPc1jVoTnFYP3DcMNWtV2q0NvRet84awJ3j1ZFWt3WYPFe
         7Yc6vxtQXYdEJa1Lf193q6cZMi/CRwn2OA5lSN0CqOmOXI7WEo7iixpIv3UfNF+Uz+u6
         VvNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V5gjnl/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020ac86ec4000000b003437a694feasi4760213qtv.91.2022.08.22.16.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V5gjnl/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGoe-00007p-2c
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlu-0005fB-FV
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlq-0005cP-85
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:54 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 202so10747766pgc.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tqkn/JG3p7hh15BhAIIM7TpuZb0gvOSNNm/i6FGCa5k=;
 b=V5gjnl/8ZVOuDEL7M+KJmYAgespi/skqzih9b3ZizYHyd6eaYbq9NOcCAiTw75xHj3
 umgDd4dv1RSzrKvpt6SCP2E63FTcoTr8tUGPKeCU1XKeSPGaAYUxYD3VW8KUC5vuhCvd
 sSYqSqeG99MwMS0CWhfWl6bZjcMecgo987qfsj2gAZY5+5yw84HsEtjfgv/0qcgQ21i9
 nXTl515X/RsPqm6Me2ZhcGquaS5OUmL1Vv9OfPx6wS2Sa0Fw2dhw53pBZpcqCSYduweZ
 6BjD0C49cQsDpAKqGEvIHlGvjI8KSR6HIA2TvWHBwXNMtV4mC1qeyza+QzltDmwZcO5I
 1SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tqkn/JG3p7hh15BhAIIM7TpuZb0gvOSNNm/i6FGCa5k=;
 b=slC6VLsGaiMYLG7TnWsxU+O9LOyd2rBWEQXqwdyoHkmetW/wyAWB0oMi7n7yMyrbl8
 656sBhrSh/SiPnPXVWB2W2Xe/vO0IwDbr6hSolEtujPui6rBY5BgDMVGCWPwilJ66WDm
 xZifCdY4bPLL41y7bQES3h4i6C5ABqJtCXkQx2dXdPKly/kgMIOfcs1xNwqEyIXWR7uc
 Ujtm6puOQrakkhrBC05tYuWaVEPBd5BtZQEgowl595n9xbl5DROxj14eoouiUaThqRHZ
 lTFFk8/Cv4d91fDmmfiMYQPyIop5mKOdMRX6wkXa3ngpNH6LUBW8FjnF5tX1z+76Ub5J
 sTgg==
X-Gm-Message-State: ACgBeo3kuj1qWZ05JchCfbF/D8fTJ8TAwvXce4v5nK65TcvhXv31kYqi
 4ZG3nnA85nsJxYEOwXG+Q4NF0JaCx/CmSQ==
X-Received: by 2002:a05:6a00:1aca:b0:52f:55f8:c3ec with SMTP id
 f10-20020a056a001aca00b0052f55f8c3ecmr22692315pfv.25.1661210629027; 
 Mon, 22 Aug 2022 16:23:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 08/17] accel/tcg: Split log_cpu_exec into inline and slow
 path
Date: Mon, 22 Aug 2022 16:23:29 -0700
Message-Id: <20220822232338.1727934-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7L9AJEmRjXF6

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 3fb7ce05f8..4dc0a9ec41 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -283,12 +283,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec1(CPUState *cpu, const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
+    target_ulong pc = tb_pc_log(tb);
 
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -315,6 +314,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
+        log_cpu_exec1(cpu, tb);
+    }
+}
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
@@ -412,7 +418,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    log_cpu_exec(cpu, tb);
 
     return tb->tc.ptr;
 }
@@ -435,7 +441,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(tb_pc_log(itb), cpu, itb);
+    log_cpu_exec(cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.34.1

