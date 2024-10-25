Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1085992njx;
        Fri, 25 Oct 2024 07:12:59 -0700 (PDT)
X-Received: by 2002:a05:600c:474e:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-43184241f98mr93368075e9.23.1729865579689;
        Fri, 25 Oct 2024 07:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865579; cv=none;
        d=google.com; s=arc-20240605;
        b=d83RIZrzKjdQeQvLnWHMMD3jfAWLzSZteO4tqzXSkfIjx0GsWXrVsPh+ra0kbMUPJq
         frWHDbCKASWWWjJn6M4jfj/yqnJQadnXGtk5yMgWzMCooM+LgaAJZvPeGUFo42dJFuHP
         g/uCUtDWZF5sgZLXaXTnogAvx6iCe4iggnj1oUgeAGfqmfvoW0km85+PRpcKQLVm4YG8
         /0TNoHMj3tOsDGyveyznJa/+ZkSTkhj8FFi/On5c9ZE7eEFGrN3nUqJy3vJy5O04PHON
         Qpss4zHdfOb+xMSVrvWRpAK40i/PQ94f3S1ppOTwkK3SLL+Up17J0dgNxIzssf6y5/RG
         DVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eGwvRk7TZZeC43moIVYb7p9RL4z/VBbvk9hnG7xUO3c=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=dFSahCq2/JgHfPa9SaCjVsar6WPzipfaZzaIcmBvRbkTulb4V7Tu6NhuT2Z9/Qp6xS
         uX5yLddveXLIu57tFXjOXVpikUoxW75EUZlVlt6S+xcccD17c7pmakb8rwVnzyPdunGw
         2KS5Dj2u96Z2a9dRmxcrjjpDKYemI4Mfc4neWmbhnFW6xC88LDjqI2WJicDO1Uz/76+a
         S8kUiza0NvBRTv3+QhItta3zeMNJ9M1w99dDOhH4ySKfghPH6RGQTCd1PFFNIUol0Y5j
         sCRd9BywJaZJRfAaYZ3XE0IX4Gr3UWkLedL06htDjVaNWIbTwPXayNlRFpXCphLjmhJZ
         aUFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sG0Lm6DC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319396f3d8sor5721645e9.8.2024.10.25.07.12.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sG0Lm6DC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865579; x=1730470379; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGwvRk7TZZeC43moIVYb7p9RL4z/VBbvk9hnG7xUO3c=;
        b=sG0Lm6DClnFtlefe56QP8gkkaM0M2lSTYi+lZYyinTrvNwOXQvveGNP5gh6GeWqATG
         0tidAj+CoXHWZoN5XBz0WCYuQDe61Y9lvIL58G5MbGMdg7EIBuEleippNgLegp2b2Dnx
         d/bRoYIv4BEpEK7GQM43gD6shK+DQ5PQ5U1O675a3j+U0+jZqIVUnZyR1vjKQlY3hFuV
         +HaITcMwoBkfQO1KXAkapqjop3UqTPORZErLxEmyZ624lx2LK2uco1MNK+N9h0TeUdgQ
         rahPPZyWtUedm8NBh/Kt9lf9ql0i1x/smwIFJd5pTGxr8SWLmty4dyS1Cv0pwI4bmVOB
         BY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865579; x=1730470379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGwvRk7TZZeC43moIVYb7p9RL4z/VBbvk9hnG7xUO3c=;
        b=po0jH2FcfuVGJvYgIa6YVdrF5t/BoVBxbsDsQjkthW8ediMbJsCSrTFgj4gybmK0lB
         6+khPzBjwH+c6qjBWWHt2THPaZhlS3Hzr+/lz9Drbhjn0sKyM3Bf6B5pjBpB2il749TT
         jpkO4SsunJgp3/gTUAx2zNUKmtfemoHYN0WUy0WyD5j5oy32ur0SgM55u93cyu5h5fis
         H8DW26FhKYa2j2VBE9SW3EEb6WhK2CO33eARUzBPQ07gBZJEhs7cbom/l2mlU064KTsH
         Hv02kbvbJ6IKEAoKa1hz6IUG5097JZIeLwt1IvlGr9S6TzPToEzCgNlFN9biB3uVsWK5
         HS3Q==
X-Gm-Message-State: AOJu0YwfF6Hxujg3J5w1X6xA9YjTomSdftDENjOdV3eg1ydKRInn/9Ux
	VC+iYBccGyem7UGx47NpDzXHpW5kSZAL0IKCsM/fZDG6yOg2Bl0YOK4y7M85HSsjnA==
X-Google-Smtp-Source: AGHT+IEYimKNM/5+v3TTeeUBvxWOef5wpaX97b0yuiLjdVPgKthFZTkVWfIVxbwFrprYwlrLlBD4eA==
X-Received: by 2002:a05:600c:1f09:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-43184241cc5mr111818875e9.26.1729865579076;
        Fri, 25 Oct 2024 07:12:59 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
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
Subject: [PATCH 03/21] target/arm: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:36 +0100
Message-Id: <20241025141254.2141506-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bW4OhhgLwRIO

Set the 2-NaN propagation rule explicitly in the float_status words
we use.  We wrap this plus the pre-existing setting of the
tininess-before-rounding flag in a new function
arm_set_default_fp_behaviours() to avoid repetition, since we have a
lot of float_status words at this point.

The situation with FPA11 emulation in linux-user is a little odd, and
arguably "correct" behaviour there would be to exactly match a real
Linux kernel's FPA11 emulation.  However FPA11 emulation is
essentially dead at this point and so it seems better to continue
with QEMU's current behaviour and leave a comment describing the
situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/nwfpe/fpa11.c   | 18 ++++++++++++++++++
 target/arm/cpu.c               | 25 +++++++++++++++++--------
 fpu/softfloat-specialize.c.inc | 13 ++-----------
 3 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index 9a93610d245..8356beb52c6 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -51,6 +51,24 @@ void resetFPA11(void)
 #ifdef MAINTAIN_FPCR
   fpa11->fpcr = MASK_RESET;
 #endif
+
+  /*
+   * Real FPA11 hardware does not handle NaNs, but always takes an
+   * exception for them to be software-emulated (ARM7500FE datasheet
+   * section 10.4). There is no documented architectural requirement
+   * for NaN propagation rules and it will depend on how the OS
+   * level software emulation opted to do it. We here use prop_s_ab
+   * which matches the later VFP hardware choice and how QEMU's
+   * fpa11 emulation has worked in the past. The real Linux kernel
+   * does something slightly different: arch/arm/nwfpe/softfloat-specialize
+   * propagateFloat64NaN() has the curious behaviour that it prefers
+   * the QNaN over the SNaN, but if both are QNaN it picks A and
+   * if both are SNaN it picks B. In theory we could add this as
+   * a NaN propagation rule, but in practice FPA11 emulation is so
+   * close to totally dead that it's not worth trying to match it at
+   * this late date.
+   */
+  set_float_2nan_prop_rule(float_2nan_prop_s_ab, &fpa11->fp_status);
 }
 
 void SetRoundingMode(const unsigned int opcode)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1320fd8c8fe..2fd286972a9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -168,6 +168,18 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
     QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
 }
 
+/*
+ * Set the float_status behaviour to match the Arm defaults:
+ *  * tininess-before-rounding
+ *  * 2-input NaN propagation prefers SNaN over QNaN, and then
+ *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ */
+static void arm_set_default_fp_behaviours(float_status *s)
+{
+    set_float_detect_tininess(float_tininess_before_rounding, s);
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+}
+
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
 {
     /* Reset a single ARMCPRegInfo register */
@@ -549,14 +561,11 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status_f16);
-    set_float_detect_tininess(float_tininess_before_rounding,
-                              &env->vfp.fp_status);
-    set_float_detect_tininess(float_tininess_before_rounding,
-                              &env->vfp.standard_fp_status);
-    set_float_detect_tininess(float_tininess_before_rounding,
-                              &env->vfp.fp_status_f16);
-    set_float_detect_tininess(float_tininess_before_rounding,
-                              &env->vfp.standard_fp_status_f16);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status);
+    arm_set_default_fp_behaviours(&env->vfp.standard_fp_status);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status_f16);
+    arm_set_default_fp_behaviours(&env->vfp.standard_fp_status_f16);
+
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index fae6794a152..70cd3628b54 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -402,19 +402,10 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
         /* target didn't set the rule: fall back to old ifdef choices */
 #if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
-    || defined(TARGET_TRICORE)
+    || defined(TARGET_TRICORE) || defined(TARGET_ARM)
         g_assert_not_reached();
-#elif defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
+#elif defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
     defined(TARGET_LOONGARCH64) || defined(TARGET_S390X)
-        /*
-         * ARM mandated NaN propagation rules (see FPProcessNaNs()), take
-         * the first of:
-         *  1. A if it is signaling
-         *  2. B if it is signaling
-         *  3. A (quiet)
-         *  4. B (quiet)
-         * A signaling NaN is always quietened before returning it.
-         */
         /*
          * According to MIPS specifications, if one of the two operands is
          * a sNaN, a new qNaN has to be generated. This is done in
-- 
2.34.1
