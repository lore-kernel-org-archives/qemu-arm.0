Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382670ejb;
        Tue, 19 Mar 2024 08:44:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW66R1RfxGevQB+3Csppf8aJfknoFgkmcGmXX2QiKI7d3Cd1RI4h4K+mF7y1+dLmXThm484A/TnJQG+XgmZrjNi1KHZm/+8
X-Google-Smtp-Source: AGHT+IEmNpFyXggTWWlZfzss9wJg3exT8zfYYqc05ERGLreT38gLh8+E4VETdrH5LABI8Bjs5QSq
X-Received: by 2002:a05:6122:3c4c:b0:4d4:243e:7208 with SMTP id fv12-20020a0561223c4c00b004d4243e7208mr2359216vkb.3.1710863082381;
        Tue, 19 Mar 2024 08:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863082; cv=none;
        d=google.com; s=arc-20160816;
        b=UyWYZM1wK788iyjX/hoqGrGzLq48VKFPO9Yscn7lzqBgzGIW5INvj4ZfYnh1aAeX2h
         KVAlxbRhH9OxvcZ+oWh4N7kvBE3tYJHmaohOAaTk9p5ItNe9yiiVa5giFgKRTAE6btug
         cdyDAUG8UvOTvST9Ei0OqKNhl37unlEaDRFdW8cB88FpuLhMqBJkxkx+S/XAhxJQtPpH
         zajAfBU8rCGEZcIACsiPtdcawmMHJKhnqKngnCEdAp32tNIqNP9fCxrBJgOqBGBHTz6n
         hkloTpPigiQeKaOmQF7zi4jhca9vmc5jMAYlPI+QTZu6YgPzFKwaKfhZS8GKZnKYjCEk
         bpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2kOlmQKWOdk+OL6bKivQd41MjZmQhEJZYUXe/hoRFYk=;
        fh=SkEWUtW3mHKG/w6NVdPwUt5b2VYh0RiIWp3pjBQpD2E=;
        b=viwK+ELmYA/K9P/nhXvjDAOfrjDURb8Y2P12xY0ExBFbCjAatkjSsxzJghY6uuZoxf
         nYihk/ZS3z7S1go4hGDe8FVyNKGogVsRMmeMjtZUf7prXfAl9lb+JY8ZqWx69H4qA2H3
         OffWUONhPwoSXTYTQ0rSp4ExSfIsiz96uC6N7MwOY3XWYv68XdxvwxpoXH2f6GXuNAgQ
         YI52K1HYNERBWsZhVvsqQ8h5Dk2d5Ev3MoOjoYtnce3kKHYi4M9x7ZBsLpQ1afRTsml1
         z8LBQouPvI5KRFNPlbmHU1AjzvwgIUk0U3PiX1ahU7n863D/sznV6XqOvMi0KPG2PORM
         960g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jurkxHUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a056214224300b0068f13cbbc3asi9172228qvc.83.2024.03.19.08.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jurkxHUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdF-0005tJ-9s; Tue, 19 Mar 2024 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbd8-0005lQ-Gy
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbco-0004ro-V1
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ed7ba1a42so2099342f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863017; x=1711467817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kOlmQKWOdk+OL6bKivQd41MjZmQhEJZYUXe/hoRFYk=;
 b=jurkxHUVSIc24pBN3Fram4I9F2nMu1vzIsCMPSHhb8nZY+uyWIsKB6g7frflcdsSKJ
 hJhotZYFeA3Ya3hDNNmCYnGewuZPKg8FWSIuyAFX4xywyzrFxpVsga7kPq+JGSLA8eTk
 t4qsTnQoATBPNSGH6sQDGx0lJbUX6JskzVgqer+QmWEAIy0b1DwnQH4PbN1raHoGY4I3
 qVt84nVvwSX9+0OFc60ozt/ThHVAvqf278FtE0XYmzZNmiONz7G6CGuJsLfRL8NUORWb
 GmvW8a2JWXvkb0sdEig8dEhLgn9NXwS3qAed2qpQiE3zqWtoDyklWFBrDrN9iZiahp/S
 z4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863017; x=1711467817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kOlmQKWOdk+OL6bKivQd41MjZmQhEJZYUXe/hoRFYk=;
 b=jEW88uUW3KqDNnztkTwHVr0OrC3y07wHIJppavAvqKlB/JdPDegTrHsLY3bmVuTKmL
 bFDnwvLKV2wIePkLWMrcegaxWsG5fLLIUBvEfxV4jmKdoD53prOkPTToCwD3rZDV+Sin
 N8v2+ZkfMkwq4DONyxYHQQHVdyDzXyWs40dhwOIETzeomLiFkVTrNBZxbssLzciZm8dG
 ri8dNI3pa7C9xSJ0F8jeWjH5ajMCWe6MxUa0XWW/StAr3pQB/ZWIrAcy1/uZvBzQB/Y9
 GrqtMoMmNOIo9cIC2rNA/gYaDQ8GIXTM6NyD5v0uelwJzOFsmXz87gl05/W/d2C8F4+i
 uPqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx04pxyyR1mGLV9pUyS+KBvilTd0AV/Qy7U/DNFymevXFCHFQH8kwjEHZnSDHQgP33tHRCR+HlSc0CKa6GI9mKp7av
X-Gm-Message-State: AOJu0YzLcU1yQ/B3TlOL+ye63q3cVgeyLixlRrvyXc9y20ij5MzD2bIb
 ziqmxIMlDZzq+sQjI/32RGF7KrJ0Npdmfo2NqeXHp8GXauxBfn1xaXCGY5bXtfY=
X-Received: by 2002:a5d:5190:0:b0:33d:82a1:626d with SMTP id
 k16-20020a5d5190000000b0033d82a1626dmr1877582wrv.38.1710863017273; 
 Tue, 19 Mar 2024 08:43:37 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a5d504b000000b0033e7a102cfesm12592441wrt.64.2024.03.19.08.43.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH-for-9.1 06/27] target/avr: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:35 +0100
Message-ID: <20240319154258.71206-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: igrZSwSMgsEe

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/cpu.h | 20 --------------------
 target/avr/cpu.c | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 0c0aa580f5..284041a87a 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -193,26 +193,6 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUAVRState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *pflags)
-{
-    uint32_t flags = 0;
-
-    *pc = env->pc_w * 2;
-    *cs_base = 0;
-
-    if (env->fullacc) {
-        flags |= TB_FLAGS_FULL_ACCESS;
-    }
-    if (env->skip) {
-        flags |= TB_FLAGS_SKIP;
-    }
-
-    *pflags = flags;
-}
-
 static inline int cpu_interrupts_enabled(CPUAVRState *env)
 {
     return env->sregI != 0;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 45ee1b5f89..c765f49c9f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -66,6 +66,24 @@ static void avr_restore_state_to_opc(CPUState *cs,
     cpu_env(cs)->pc_w = data[0];
 }
 
+static void avr_get_cpu_state(CPUAVRState *env, vaddr *pc,
+                              uint64_t *cs_base, uint32_t *pflags)
+{
+    uint32_t flags = 0;
+
+    *pc = env->pc_w * 2;
+    *cs_base = 0;
+
+    if (env->fullacc) {
+        flags |= TB_FLAGS_FULL_ACCESS;
+    }
+    if (env->skip) {
+        flags |= TB_FLAGS_SKIP;
+    }
+
+    *pflags = flags;
+}
+
 static void avr_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
@@ -209,6 +227,7 @@ static const TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .restore_state_to_opc = avr_restore_state_to_opc,
+    .get_cpu_state = avr_get_cpu_state,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
-- 
2.41.0

