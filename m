Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2651722ejm;
        Wed, 3 May 2023 00:06:59 -0700 (PDT)
X-Received: by 2002:a7b:c8c1:0:b0:3f2:5840:5f7d with SMTP id f1-20020a7bc8c1000000b003f258405f7dmr13073091wml.17.1683097619635;
        Wed, 03 May 2023 00:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097619; cv=none;
        d=google.com; s=arc-20160816;
        b=KbhEdN+jrkpGcEvM7LOuoybvpSQbfFrTtK0LLMhfegmxjdo71R97majSxLVYaigdlE
         GeXvFCq5L4VIYgNX9XrfesKEk40QRboAZmI0Sio/O9RuUzRTIQo+rqAsZFUTGXDKdXtH
         Imp40pBFds0W5Hl4vzfpKPRIAk31QtayAcouiDFiLXLV5noysiReS/mkTDXbz27+RxsC
         WIIkYFnTIrhZxj4jySiEtRVcLr64vEc3LOTQFH0sPG3EtmrK+ctZfrpxN1LH2U38PsHy
         75Krr87ELSPkTzoqklWzd1eKc4u9Fhe08N7D997B/iAo6fMZAyIGRHcE0IgtCMfRts+E
         II4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bcNujZc9aYQmCLoddPQYpB6/3gwl5pOhsjTd6sdWfnE=;
        b=gNWiX0C8/KobLeY6dM4yFPQjDv7wykesfmtoj1VtDwzuBkx7rhq+d2vfbhnyKJeNti
         3vr56FNVfJeIPAv9zWkhMabZEWLcDP9Ahhc6vZhx8vrmCFd/6MDTUEuxmf5hEECEuRH7
         iKFoJP1Dk37N6lMXQvhvmVUzcrczjQOv6pyatAOfh/QVY5KFJz1WL9UcDAIbvcPuoDRZ
         GfUgrBRNu6wzlynN2V8z9NhvJ7HRyjRaHDZSbVR5oFx/iCsEjUbhriW0okYXCbskuixT
         fm2vj9H4hBxohedbjryS0jWuBXymqxTstDjjhEaL0n9P8oIFDUo+/RVRdKo8IrVz9XHB
         6ZDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jVj/ietQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15-20020a1c770f000000b003f0b1beff14sor193528wmi.19.2023.05.03.00.06.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 May 2023 00:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jVj/ietQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683097619; x=1685689619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcNujZc9aYQmCLoddPQYpB6/3gwl5pOhsjTd6sdWfnE=;
        b=jVj/ietQx4LaMjfG8tQYpGGDdD3HDGS+JWCsVWx7lh7ZmIWnvb7VUnNku/7YzvKaWM
         LC4ZyUvV3TpVCz6SaW8LCU+0lEQvO2ZSD7l/4uMN5CdY7arTd7ke/obqwPH3zCEeeSQq
         2lOEufTMtXpn8EVoBimsDvYKTHLfSK0ecIQa17Y3/lSpcX9HjuxVRhIKX5GxoZlpFsU9
         Wrxyqrcq1ylvMe67QYSVCyH228OXvWmbNVj/ObhkO+epIy2JmclIEIlwgwRsY/2v23p8
         uFKUTgZSTnLpq18nDmsYqaFilaew1epYzyRT+zKQO/Syr9F0/ZFlg/AIEDKl+ZKjdgCI
         6TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683097619; x=1685689619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcNujZc9aYQmCLoddPQYpB6/3gwl5pOhsjTd6sdWfnE=;
        b=TQXJjCwM1mxV5eTZywC/GGgzzElF41HzPdbE3TnW/yAMeyP5Q/4+PSeN9aeiV0bQZu
         afw+xJTqvQlrT3fRy5wXUXCWiOGKZ3nUAn69CyjR9+FODP1hpUZWCfRFGbcXYn2+29Fa
         T8vNGpQnTIrApNqN9AwPbGhcrKse/B1OSzHMtu4wjVtlEWVzXajLdDyrJk1EXyHGwC6P
         x1ptHnV9JW9KtSs3tku8ktMzj/rnlH7K22ULEJoOSIHh8sPUT+3v0jX+LEIFuOf4KOyl
         G97DYs9Il1iCP5lkisD2KyzJqFoNRIMu+h3H2m+pS6oinvb+yxE4Bhd9tmq543tUY56H
         6PWw==
X-Gm-Message-State: AC+VfDy4hXlgGQijQZsQik4s1aB6gEnEOvfYpN6n6j1frC2g0iVRaYUw
	BAdQ7xoMW0iCT9Ys6ewi4EQvu+13
X-Google-Smtp-Source: ACHHUZ4zx9cYhH1xnVpx1gzt3gf/RZNJhdk7sgkExN+7eA41gxXYRJC3M1cEaeNGQN4BV1CYNwp/ew==
X-Received: by 2002:a7b:cbc8:0:b0:3ee:775:c573 with SMTP id n8-20020a7bcbc8000000b003ee0775c573mr13166311wmi.20.1683097619227;
        Wed, 03 May 2023 00:06:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
        by smtp.gmail.com with ESMTPSA id q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 00:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name,
	gaosong@loongson.cn,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 02/57] accel/tcg: Add cpu_in_serial_context
Date: Wed,  3 May 2023 08:06:01 +0100
Message-Id: <20230503070656.1746170-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qMJx9baLV7m1

Like cpu_in_exclusive_context, but also true if
there is no other cpu against which we could race.

Use it in tb_flush as a direct replacement.
Use it in cpu_loop_exit_atomic to ensure that there
is no loop against cpu_exec_step_atomic.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h        | 5 +++++
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/tb-maint.c        | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 7bb0fdbe14..8ca24420ea 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -64,6 +64,11 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
     }
 }
 
+static inline bool cpu_in_serial_context(CPUState *cs)
+{
+    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(cs);
+}
+
 extern int64_t max_delay;
 extern int64_t max_advance;
 
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index e7962c9348..9a5fabf625 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -22,6 +22,7 @@
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
 #include "qemu/plugin.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -81,6 +82,8 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
+    /* Prevent looping if already executing in a serial context. */
+    g_assert(!cpu_in_serial_context(cpu));
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00..7d613d36d2 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -760,7 +760,7 @@ void tb_flush(CPUState *cpu)
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
 
-        if (cpu_in_exclusive_context(cpu)) {
+        if (cpu_in_serial_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
         } else {
             async_safe_run_on_cpu(cpu, do_tb_flush,
-- 
2.34.1
