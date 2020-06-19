Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp773513lfm;
        Fri, 19 Jun 2020 10:03:27 -0700 (PDT)
X-Received: by 2002:a1c:2c45:: with SMTP id s66mr4960261wms.40.1592586207680;
        Fri, 19 Jun 2020 10:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592586207; cv=none;
        d=google.com; s=arc-20160816;
        b=YRZfyS2E4pJndD5TRTS9qpE8fqHI41rL13LBKFew9EMDiUGmxotPZYIZBmcTod6VDQ
         1UI1kNKS+MPynV50eUm5VCIcokC8A3EPimh/CeuEiRQAnRS/n9D2+5MO8Q/q7GZrNyvq
         3/EL6ze3ENLQhfS52qV5qvguKxcKkkPt5ZEcRQqk5AX+zf+7AGfOoIWj4CEXd8BkxSx7
         37qIc3bPraTiE5S1fvFxUrck4bLIeIlfQcRKVhbGaWeqIrx1tlHMmf9/EibJsXeno6lJ
         6n6mJAO4UoFkSbn3hvpByZ8RxdV1jWgBoOXAEzAgTaQ5tfq2YcZgKAZH2p6A++6iYTgl
         csSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GYiZ1xEPMJbBnQLRCPAHG6+ogJ1s4ydI9hrrJEU1OmY=;
        b=MzChXmjfS4XzuT7yc4AEI0jqtdwBcX3BzQAVXiQyMiU7rerp1Mxm+deWV/jNMsiQEk
         cylKNZTFV7GxUGa3I2xeJEqEC14hAHga2pdzviFoMTx0qjtdE6TA/kqNTCZwyFMfYNTk
         v29DqwTb0sZk+/xj4Z0hmuiTr4xyPB5yiPOn74WqBEd3m+0RpZ8cfcgyRBFIRiZEx777
         mTEZu4VMY79gnrge161IOuwJcwD7nb7VcGsb+22mgZOu0ip/ZK2JNd5oyUyJZ8F9jaM0
         BXWH6Bf5isYhFFTGM0KiKb9OeELqFDCxtthkOVkKpKW7zf914Z8dr25qVW7/Wn9zimDy
         cGAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xn6VMQhX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l7sor4136194wmg.22.2020.06.19.10.03.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jun 2020 10:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xn6VMQhX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYiZ1xEPMJbBnQLRCPAHG6+ogJ1s4ydI9hrrJEU1OmY=;
        b=xn6VMQhXt+eLYKC+z4+ojovsahLJShdYj7IqpOBt061U6E36FkmQNSEIpvlWgpR/Fx
         sghGplLT+XIpjBstjlNKmY6eWA1WuOjDyYhDIELuZnW7xbVqCrj4aIE+Qg9cN+kLV7n+
         +pWOQHEACN8TOqe1Qvo9hJmIxb+2VDLAIJF6Bog3IGsn+wBGdjuaH1eLuV31sFYhZUXD
         qXQ3RnNFuoKSZ87aOFcimu4j56/P9S1XAMExRCPqR5P7TBv3jFy/PSLZccDufVxP9LMe
         J1XzBERhhNo/sI+KDAKHdsKsJhEW+UShLeUX8PtUIARxAMkO8mKSopLSCP04XSfvauc+
         6b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYiZ1xEPMJbBnQLRCPAHG6+ogJ1s4ydI9hrrJEU1OmY=;
        b=eKLSMOtSjfZT1tVyVu+XczDfFFHFULAvogu6dJbBje/X6WgTzdBdmLHRTntRqO5sht
         XR9ydGv/qicqUvKJIGxUNuwpxYYNI5Hau9c1B2iyj4ltOSxnGDylVhDxRN3Xyk7eKj79
         vVFBz/h8lNDqkb73QD4hf6pPMTSZHi+yXipwLETLm9zVBE/zxSldedKjNn1gxyqxfOsH
         CYdCDs9LNTu96jN6N0rb9SEPTojfsKta+ENsRohwgGFogo/m2cm8D6Dlqh82y/G8GDlk
         TjaaIGe1o3/8/KXtx5YDX/hloIhRH5vkGTlfIENrE4qXUpGqcu+Icvyh8zzUDxm86Giu
         SlBQ==
X-Gm-Message-State: AOAM533byNAyJCDSYgH/hmZSV5NxFMl9AT8SjSZRf+9QinyfJI4vLZHK
	Yrc3j0cBL7aIVu1Utt21ClsXWFOI
X-Google-Smtp-Source: ABdhPJzwNFjqUxBaVqvNXzKvzvydti1oKGLGHJm2WelH8mGrg665RTNTAWp/dznGLQJNeZObcorMEQ==
X-Received: by 2002:a1c:98cc:: with SMTP id a195mr4646798wme.89.1592586207324;
        Fri, 19 Jun 2020 10:03:27 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id c16sm7982936wrx.4.2020.06.19.10.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 10:03:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>
Subject: [PATCH] target/arm: Remove unnecessary gen_io_end() calls
Date: Fri, 19 Jun 2020 18:03:24 +0100
Message-Id: <20200619170324.12093-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ncfRMw26biU2

Since commit ba3e7926691ed3 it has been unnecessary for target code
to call gen_io_end() after an IO instruction in icount mode; it is
sufficient to call gen_io_start() before it and to force the end of
the TB.

Many now-unnecessary calls to gen_io_end() were removed in commit
9e9b10c6491153b, but some were missed or accidentally added later.
Remove unneeded calls from the arm target:

 * the call in the handling of exception-return-via-LDM is
   unnecessary, and the code is already forcing end-of-TB
 * the call in the VFP access check code is more complicated:
   we weren't ending the TB, so we need to add the code to
   force that by setting DISAS_UPDATE
 * the doc comment for ARM_CP_IO doesn't need to mention
   gen_io_end() any more

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               | 2 +-
 target/arm/translate-vfp.inc.c | 7 +++----
 target/arm/translate.c         | 3 ---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e5da0..cf66b8c7fb0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2334,7 +2334,7 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
  * migration or KVM state synchronization. (Typically this is for "registers"
  * which are actually used as instructions for cache maintenance and so on.)
  * IO indicates that this register does I/O and therefore its accesses
- * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
+ * need to be marked with gen_io_start() and also end the TB. In particular,
  * registers which implement clocks or timers require this.
  * RAISES_EXC is for when the read or write hook might raise an exception;
  * the generated code will synchronize the CPU state before calling the hook
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index e1a90175983..bf31b186578 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -119,15 +119,14 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         if (s->v7m_lspact) {
             /*
              * Lazy state saving affects external memory and also the NVIC,
-             * so we must mark it as an IO operation for icount.
+             * so we must mark it as an IO operation for icount (and cause
+             * this to be the last insn in the TB).
              */
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                s->base.is_jmp = DISAS_UPDATE;
                 gen_io_start();
             }
             gen_helper_v7m_preserve_fp_state(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_io_end();
-            }
             /*
              * If the preserve_fp_state helper doesn't throw an exception
              * then it will clear LSPACT; we don't need to repeat this for
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d18892adee..2677eaeb1e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8824,9 +8824,6 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
             gen_io_start();
         }
         gen_helper_cpsr_write_eret(cpu_env, tmp);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_end();
-        }
         tcg_temp_free_i32(tmp);
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
-- 
2.20.1
