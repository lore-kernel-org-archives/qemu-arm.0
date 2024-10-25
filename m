Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086167njx;
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecb:b0:42f:8287:c24d with SMTP id 5b1f17b1804b1-4318415cfccmr88744165e9.21.1729865590021;
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865590; cv=none;
        d=google.com; s=arc-20240605;
        b=gDQfpnv8ahNQpb/BOrdhhBBq+/bbOS85TD3FoZWgUGYXHkGxdnGGaUKc1+WAS9Dt1+
         2X2pTlzJKIqnz8q1Igskwqkqz/G4c1dxfH2mPA5fiQPLZcdQ0jRSkjvwoqP2N27f8szB
         O6bDaBDvhEW6hVbnLTvzmDjBNXQfwDk0rE4FBnSxgh7DKQQ7QRwty1cFP0o2ASIUPKJF
         /eyDFWjty4IsnURCqCpe7mhBT1L+OsNIIWQjNZewssmRwBtheOzcQAYtK9HRVmGVidl1
         vInKH5NwlCGRM7mjhDIXginz1mocYvmnOzPdik39O/jB4az3a+1c6jkGFUg4G0LYBCJA
         S+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1cCo50wdC0NIgQKfnDkwtGpzRTYsS1ol+AjTcdAhO0A=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=aLt8ir1Hhf0jz4N+9Jt4nXTlJMZNe9UWxXSlvpZm4j7T+zwq6kLSZopu8y7FB3v2AT
         7IuESmO5StVkUWCX3bbeE7mFV8MvbN1Ow+XbzHSQV8Dug/0g2JjkOD60yPtJZDXR++wR
         lw3FZmFhaFJsU0BCOUu8i7TrfHErKCG8OwQf4+a4u64HUfep5SndT9JbOFVRTJS62PQA
         +uxLzeVdvug6u3jeLDwBSN+LVShmRrtFvPoF8b1Aas4UQZWgYysm54fYYqB7OgIWQ7uw
         NO0Y+Kni0+SfE6UqFSdZizVP26iG/mcP58syAfAUarJrB1nVM9evNkAuslvtrdL9VxTz
         nzLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPKzpnTF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43193840569sor4563315e9.0.2024.10.25.07.13.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPKzpnTF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865589; x=1730470389; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cCo50wdC0NIgQKfnDkwtGpzRTYsS1ol+AjTcdAhO0A=;
        b=MPKzpnTF46J2QubyJKts3PTxb8DbgHP1RWzsey7iz41Bs5+RgH4P6eMySkQFSRmhLP
         V5Al6eO/qwCzV36nGjkvrenoZ9TW7oMDzTHoamssviJcvli2jt7E2lO4/8aFRdGYH5QE
         xh9ktjNUzb6FspBsL+Xv9QoOxnPwW9jRRFDfzLnim42ya1x2QwufOQQDnjC+zZc8v9nP
         x11PXox1ro287jNKsHVcKuj7kgqYx7ebD+iXwBZxWMiYefsxPKfFVTEwd7Kt2rcg46eU
         +vr6PBHXLZ8uDip9Ph/jp9sM2dEN7141Dp4isYHxzyWbLscSswO3M5E6D4bMsaMc1zVY
         jNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865589; x=1730470389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cCo50wdC0NIgQKfnDkwtGpzRTYsS1ol+AjTcdAhO0A=;
        b=qhPPURsU8DBaSX5W3na1B73D9GxCBYX3dJScKx5fHdyqVl+1qRXXLA7++LdMN2cPd9
         X4gmM7I7NmTBGIkGmlVZ+9XlEQi7quXNnJ42n2LVRt4t5SOoHttHJvFh5LiDYo/3rNRT
         vJac28mYLAoHb2qkfMjBjx462yPbP7DPMfKZZONjp49FOGGKLhihmDf7QJ/gVOXY73pS
         SZD4x4KD3L6yU36bj3/hV8haLdGtqQZtG1OqqlYSbwTGaPx1l0Ax7xyF1prSrJdsCqY9
         hNmDtdVNjA15B0+H+uiXdUTeQYTSs2cR/wZ22Njr9vy5SfKAXZMCQWX0LTxE2knIlRFP
         QTTw==
X-Gm-Message-State: AOJu0YwW0Hox7+TphUNyQOcols1ZYW6lej0nDm49yKR/8t39TNtmrcj8
	Mxtd7sVSEdVHYTCJDGOF/8dGIW9+A/ZhuCpXAPtT7xLZ3QzM0Rk9cDg10afRggA7QA==
X-Google-Smtp-Source: AGHT+IErRofvNVko14JtpQxdLcThoMuGjBJqi3FTPlWg0ZwyTazi/nWN12GMkiVoSHlJvSwtaTXZqA==
X-Received: by 2002:a05:600c:1d27:b0:431:58cd:b260 with SMTP id 5b1f17b1804b1-4318418a568mr84761005e9.25.1729865589416;
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
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
Subject: [PATCH 15/21] target/i386: Set 2-NaN propagation rule explicitly
Date: Fri, 25 Oct 2024 15:12:48 +0100
Message-Id: <20241025141254.2141506-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KclOrljxpIOy

Set the NaN propagation rule explicitly for the float_status words
used in the x86 target.

This is a no-behaviour-change commit, so we retain the existing
behaviour of using the x87-style "prefer QNaN over SNaN, then prefer
the NaN with the larger significand" for MMX and SSE.  This is
however not the documented hardware behaviour, so we leave a TODO
note about what we should be doing instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/cpu.h              |  3 +++
 target/i386/cpu.c              |  4 ++++
 target/i386/tcg/fpu_helper.c   | 40 ++++++++++++++++++++++++++++++++++
 fpu/softfloat-specialize.c.inc |  3 ++-
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 74886d1580f..43ba62e92d3 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2562,6 +2562,9 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
 int get_pg_mode(CPUX86State *env);
 
 /* fpu_helper.c */
+
+/* Set all non-runtime-variable float_status fields to x86 handling */
+void cpu_init_fp_statuses(CPUX86State *env);
 void update_fp_status(CPUX86State *env);
 void update_mxcsr_status(CPUX86State *env);
 void update_mxcsr_from_sse_status(CPUX86State *env);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1ff1af032ea..e9260fbc654 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7083,6 +7083,10 @@ static void x86_cpu_reset_hold(Object *obj, ResetType type)
 
     memset(env, 0, offsetof(CPUX86State, end_reset_fields));
 
+    if (tcg_enabled()) {
+        cpu_init_fp_statuses(env);
+    }
+
     env->old_exception = -1;
 
     /* init to reset state */
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index e1b850f3fc2..53b49bb2977 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -135,6 +135,46 @@ static void fpu_set_exception(CPUX86State *env, int mask)
     }
 }
 
+void cpu_init_fp_statuses(CPUX86State *env)
+{
+    /*
+     * Initialise the non-runtime-varying fields of the various
+     * float_status words to x86 behaviour. This must be called at
+     * CPU reset because the float_status words are in the
+     * "zeroed on reset" portion of the CPU state struct.
+     * Fields in float_status that vary under guest control are set
+     * via the codepath for setting that register, eg cpu_set_fpuc().
+     */
+    /*
+     * Use x87 NaN propagation rules:
+     * SNaN + QNaN => return the QNaN
+     * two SNaNs => return the one with the larger significand, silenced
+     * two QNaNs => return the one with the larger significand
+     * SNaN and a non-NaN => return the SNaN, silenced
+     * QNaN and a non-NaN => return the QNaN
+     *
+     * If we get down to comparing significands and they are the same,
+     * return the NaN with the positive sign bit (if any).
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
+    /*
+     * TODO: These are incorrect: the x86 Software Developer's Manual vol 1
+     * section 4.8.3.5 "Operating on SNaNs and QNaNs" says that the
+     * "larger significand" behaviour is only used for x87 FPU operations.
+     * For SSE the required behaviour is to always return the first NaN,
+     * which is float_2nan_prop_ab.
+     *
+     * mmx_status is used only for the AMD 3DNow! instructions, which
+     * are documented in the "3DNow! Technology Manual" as not supporting
+     * NaNs or infinities as inputs. The result of passing two NaNs is
+     * documented as "undefined", so we can do what we choose.
+     * (Strictly there is some behaviour we don't implement correctly
+     * for these "unsupported" NaN and Inf values, like "NaN * 0 == 0".)
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->mmx_status);
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->sse_status);
+}
+
 static inline uint8_t save_exception_flags(CPUX86State *env)
 {
     uint8_t old_flags = get_float_exception_flags(&env->fp_status);
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index b050c5eb04a..77ebc8216f6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -405,7 +405,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
-    || defined(TARGET_SPARC) || defined(TARGET_XTENSA)
+    || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
+    || defined(TARGET_I386)
         g_assert_not_reached();
 #else
         rule = float_2nan_prop_x87;
-- 
2.34.1
