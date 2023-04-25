Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3715726ejm;
        Tue, 25 Apr 2023 12:32:14 -0700 (PDT)
X-Received: by 2002:ac2:5597:0:b0:4ef:ed49:fcc2 with SMTP id v23-20020ac25597000000b004efed49fcc2mr2548790lfg.26.1682451134076;
        Tue, 25 Apr 2023 12:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451134; cv=none;
        d=google.com; s=arc-20160816;
        b=Ji90ovKHjSmCSJ8iw/NS/hODm/s9Krud6bph0DffEWZ1/6LHbRlUMoUNB/pLh3PZOZ
         tIEAdmM4TiOUd3sSBjke6iFwXx/2+6yCmDIcXrRQIDCYX/giFQdDjARM8EAlF50xQQII
         XpYrO5GnHtAiLZNKeeCJneZP8UaTzB8VeLfZYN9+skmuO49OK4iLQbQrYVR60wwCvO2S
         v/gQ55Mkj4znkROP1hS6TYtgEFHw/ZICYNUo+bUn+sHZIEroSL/HFhncb86DRlRNbQwH
         pIJJ5SD9P6o/AdrGd6Igx81IDnsCBXXI4EzozM1TkYRf+L1barcu9GoeUa8BVY+t9yNS
         Zebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R+fxTxTqIhiI86kN5IY9M/+obOs0ta97k4WM4ZR41R8=;
        b=MZB4H7sqqXfq2ruQTJvvCspePo/RcRfpIThzbX1WjamhZvSlLEGbNs+s2FH0MVj81M
         G1emPhObxXBjghJzi9FqoefUb8wEn+zF+A2jNvJtFkxxLFk7QkgoOWy9go+C+uCzD3xQ
         Tqn7/nLpp848Q9ERYqApW6Pz1ENa93U1baT/OASmx235psXEBKknxvOdrE2acaxM/Euk
         JnU91ebIY4ZfX7ylokYfKp/hn7XLVe3CS47qATviqAAgku5DcCWHTNIoObaIVeBCj+I2
         3x1qmk9F5LZA/7ySE4RK5OutWxAqCBY9isKV4supFOEi2N3T2ufPFM8qv+GOhzs+LHhT
         M2GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X+97rYn7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j2-20020a2e8242000000b002a8b11976desor4571881ljh.19.2023.04.25.12.32.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Apr 2023 12:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X+97rYn7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682451133; x=1685043133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+fxTxTqIhiI86kN5IY9M/+obOs0ta97k4WM4ZR41R8=;
        b=X+97rYn7nYhePOgZIOufdVTChNLCg1ILAZNK6JF98HvkPuvQ6h4ZOmVWwXCYKLFXAb
         zT9ZI2rCNNxKwLYS7397Dt+CYNqhlxrmyEqZaqDZ2C2h7xb0xw6bme8oW90JX3z6EDql
         RbUbhwkeQEm8FnWA8rmLSEuffeamgPyLTbBWuAb18Z6L2kTCJUBiz4ZS6+tbe0YVtnjJ
         A/F5RIdnbr4fkD7KL/hkTnwuycLIvz4h+XM1uJnnFN1ZcoiEjVlJJiMj3ecUBq13dgMu
         ii9tXAvn92OjS4pLUTDldQf8VHidA/mSrRRsCnweHmF39FpdIAyljaveHOcu0pWqgIMp
         PpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682451133; x=1685043133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+fxTxTqIhiI86kN5IY9M/+obOs0ta97k4WM4ZR41R8=;
        b=NIynjC6Yu7CAJ8gbAyHueQYoVT/BDbNCsqhqTO5pRiYwPc8XJwmg3ig8vtspaCL/Ta
         /QKit7ZemWeeBsaLuP3jOTCVMWRNXODfdV/yJL6hrenk6wRWycoxpLXLOUwqdMIr8+eC
         GY4JNZcKDwlb8ZOj9xsqGLXF3nLqt4EED5cM77Q9RiKXiglp4TwbD/7tKqn38vyopTry
         6ftkcBwY/JZHryMYz4OvYv85kwjsevmeEEl+WhhfuiENB68q53dQAbJvsUtmFc9E5YT1
         Zvh0xrCaOB/2SWkxEhVJJ98RgGHFCh7rX8QYjQe/J3/WUghyewDuXd9aedjZsGAVrrX/
         Ba8A==
X-Gm-Message-State: AAQBX9fGymz9BLcYokFwrwuMNn58hGmHcps84wpAu2a1pRfxQ5wJpGzY
	8s3kgBq4HhjpaPjuoN+AZNmQ6TFW
X-Google-Smtp-Source: AKy350ZEhMVq2MhtpL8/LPCYy0S8TrfSY41eE9e1biZYO5Tq8sjSdOsKUyp8IAy7TbYhsUf8WbQc7A==
X-Received: by 2002:a2e:7010:0:b0:2a9:f114:f166 with SMTP id l16-20020a2e7010000000b002a9f114f166mr3637834ljc.2.1682451133777;
        Tue, 25 Apr 2023 12:32:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([91.209.212.61])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 12:32:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	git@xen0n.name,
	jiaxun.yang@flygoat.com,
	philmd@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/57] accel/tcg: Add cpu_in_serial_context
Date: Tue, 25 Apr 2023 20:30:51 +0100
Message-Id: <20230425193146.2106111-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kZZgT6miSm1K

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
index 96f198b28b..8250ecbf74 100644
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
