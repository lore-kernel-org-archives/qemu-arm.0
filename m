Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086007njx;
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
X-Received: by 2002:a2e:be8a:0:b0:2fa:cf82:a1b2 with SMTP id 38308e7fff4ca-2fc9d595860mr56526991fa.31.1729865580620;
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865580; cv=none;
        d=google.com; s=arc-20240605;
        b=EY/jeFwt/Rycaaz2+IiZ19Aq4RaOAAMF3zfLZ8wqy4y908xkB+8UmSCseVq9bgI/dc
         jBjSztwSjXojoLAniFDmEQ7mWf06J4XCSdxumpEQ1SAfx1tvmAI/srF/xx3aXaWUdowo
         9RjXxcCn2TdLF8iKlWczM3F7HxaJYvSXQwbS7L0IkthTNYt8b0ImMNTXt/D/bUFUH8VB
         F4gtAWuMHZFUzJLy2u/Qjx7ggakl0uOwuoX8EHNseTtV6R4/XSl2678IVlnKaUp1uoZ+
         RgKxo1auDyUjcPksk6Bz2Lw2asXCKRGlhgQfGmB51rnPtXMjQiR/3vd64pMbtYW92q4w
         Xiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oxpTyYZBHeinKYjs0KLdQZTFPyy0lkXjTFzf5hZbbFo=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=QDvxxD8huII7aJEISELGU2NRNGNBrIUnNwTn8gOaMKPh5ujTay02yjzv/Fq0tM9Gyw
         Tis3DFk5ZQwZSzWsUCZ/nPifyTReaPZjcn40HMoK1Xk7aNu3nrzt96daw+wdoqbOBMI5
         wSDx4PhEOhLGdCgraUZZ0sOJV+WUV0YfKLazHUMBedI5qF1j/G/lFDzYHJFRqLQoXdba
         ryrauaIhTI6izFfW6OF2ZagI5Jgzj4tgml9VRHu8RChX04qYef6AX9XwwJ8rcGvzgaRV
         k8cdOQEDG5dlsizIZ6Mg0IA6PEFT48nFa2cIQA6cDV080m9QFPXfhGC+2rGupFPWto+Z
         xQMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q3Q/wt7i";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938dcba1sor4628565e9.4.2024.10.25.07.13.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q3Q/wt7i";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865580; x=1730470380; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxpTyYZBHeinKYjs0KLdQZTFPyy0lkXjTFzf5hZbbFo=;
        b=q3Q/wt7ih8NKaCAtVzvdj0N0n9rS3fPNVZwfmYXrg7DR6qAglzzCGXcS2IDigzoH0E
         tBfI/n5cSZVWf2dZnjXLuUVQRr4dRSBHL9I77w5eLYSwoqylm5BKAK0vHyc0htsILTl3
         LK7HevuaUuX7H7IRVzziFmBDcgcIiFUa5rUVSIWLCOkNdom1LEdPsrjKrxT23Wjhm9RM
         QzivO7Bo7hQZhI/6NGWa+pB45kR0Dg/mKLpPVWQzaHQQqQtzbd/m4aSHdciSSfWXa/t9
         wUScGPeUllQa6f2dcc5xFYuG6mE+Km3DahDfpGwM1jwaDpL2MdRsXFXxN7v2Z4haYtqK
         w/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865580; x=1730470380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxpTyYZBHeinKYjs0KLdQZTFPyy0lkXjTFzf5hZbbFo=;
        b=cDT1CETjauHZN2GlWXyOofBrinGXhhqtfce+b8c0pjBBTdyqPOzXX8PNPJ9SKeCJkd
         b75yTmi1Re7OZPDnlXHD1285UieYRNrNFHclLzaIt3rISnxSG5rm8q02Cg7jjFVoSgAH
         irQ1Nfq84ULAC2ZdCJ4qD6qxzhvcWc4wCkpb53PI+zvLIOMHGW4hzAZSi1KhjfONC+rR
         mX0WTz/BiE4WX2tLpFyJtxmnWOcHI5W4i5QcG95lt7zqs3yELpeCqAoVXvW/R9rU2RaU
         PHiASfVUeczBfTls8lGuS9SJ1EG1gBcxD2T4utEkM7X7RTOTW2yu/1haoQHyfmK39Y+1
         TV0A==
X-Gm-Message-State: AOJu0YxRY6bhlbZEabFKJqjb4P+CuzRzhyLgwylZ/iKgW5bF6tH2t631
	88sqELE/CIIaDuWnSPou9hhOv1f2P0WkJSrWZgolfizw8fa7J7O+A65r/4kqJqBw3A==
X-Google-Smtp-Source: AGHT+IFmo0A/cK7mxek7qVmenyHyXSHRnCM6HvcgZruK2l+y0NWBmuNTPj3PU5VnMspDYKzexoWsSw==
X-Received: by 2002:a05:600c:511c:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-4318423b856mr71363435e9.27.1729865580016;
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:12:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 04/21] target/mips: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:37 +0100
Message-Id: <20241025141254.2141506-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HqHppWdyxXIw

Set the 2-NaN propagation rule explicitly in the float_status words
we use.

For active_fpu.fp_status, we do this in a new fp_reset() function
which mirrors the existing msa_reset() function in doing "first call
restore to set the fp status parts that depend on CPU state, then set
the fp status parts that are constant".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/fpu_helper.h       | 22 ++++++++++++++++++++++
 target/mips/cpu.c              |  2 +-
 target/mips/msa.c              | 17 +++++++++++++++++
 fpu/softfloat-specialize.c.inc | 18 ++----------------
 4 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index ad1116e8c10..7c3c7897b45 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -44,6 +44,28 @@ static inline void restore_fp_status(CPUMIPSState *env)
     restore_snan_bit_mode(env);
 }
 
+static inline void fp_reset(CPUMIPSState *env)
+{
+    restore_fp_status(env);
+
+    /*
+     * According to MIPS specifications, if one of the two operands is
+     * a sNaN, a new qNaN has to be generated. This is done in
+     * floatXX_silence_nan(). For qNaN inputs the specifications
+     * says: "When possible, this QNaN result is one of the operand QNaN
+     * values." In practice it seems that most implementations choose
+     * the first operand if both operands are qNaN. In short this gives
+     * the following rules:
+     *  1. A if it is signaling
+     *  2. B if it is signaling
+     *  3. A (quiet)
+     *  4. B (quiet)
+     * A signaling NaN is always silenced before returning it.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab,
+                             &env->active_fpu.fp_status);
+}
+
 /* MSA */
 
 enum CPUMIPSMSADataFormat {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 9724e71a5e0..d0a43b6d5c7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -407,9 +407,9 @@ static void mips_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     msa_reset(env);
+    fp_reset(env);
 
     compute_hflags(env);
-    restore_fp_status(env);
     restore_pamask(env);
     cs->exception_index = EXCP_NONE;
 
diff --git a/target/mips/msa.c b/target/mips/msa.c
index 61f1a9a5936..9dffc428f5c 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -49,6 +49,23 @@ void msa_reset(CPUMIPSState *env)
     set_float_detect_tininess(float_tininess_after_rounding,
                               &env->active_tc.msa_fp_status);
 
+    /*
+     * According to MIPS specifications, if one of the two operands is
+     * a sNaN, a new qNaN has to be generated. This is done in
+     * floatXX_silence_nan(). For qNaN inputs the specifications
+     * says: "When possible, this QNaN result is one of the operand QNaN
+     * values." In practice it seems that most implementations choose
+     * the first operand if both operands are qNaN. In short this gives
+     * the following rules:
+     *  1. A if it is signaling
+     *  2. B if it is signaling
+     *  3. A (quiet)
+     *  4. B (quiet)
+     * A signaling NaN is always silenced before returning it.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab,
+                             &env->active_tc.msa_fp_status);
+
     /* clear float_status exception flags */
     set_float_exception_flags(0, &env->active_tc.msa_fp_status);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 70cd3628b54..c60b999aa3d 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -402,24 +402,10 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
         /* target didn't set the rule: fall back to old ifdef choices */
 #if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
-    || defined(TARGET_TRICORE) || defined(TARGET_ARM)
+    || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS)
         g_assert_not_reached();
-#elif defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
+#elif defined(TARGET_HPPA) || \
     defined(TARGET_LOONGARCH64) || defined(TARGET_S390X)
-        /*
-         * According to MIPS specifications, if one of the two operands is
-         * a sNaN, a new qNaN has to be generated. This is done in
-         * floatXX_silence_nan(). For qNaN inputs the specifications
-         * says: "When possible, this QNaN result is one of the operand QNaN
-         * values." In practice it seems that most implementations choose
-         * the first operand if both operands are qNaN. In short this gives
-         * the following rules:
-         *  1. A if it is signaling
-         *  2. B if it is signaling
-         *  3. A (quiet)
-         *  4. B (quiet)
-         * A signaling NaN is always silenced before returning it.
-         */
         rule = float_2nan_prop_s_ab;
 #elif defined(TARGET_PPC) || defined(TARGET_M68K)
         /*
-- 
2.34.1
