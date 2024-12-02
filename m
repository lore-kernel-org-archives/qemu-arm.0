Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801870njk;
        Mon, 2 Dec 2024 05:14:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbMOBQVraGPxqRl7AaaCwIbIeBfPTjaB64ukOuUHLb3GydddEWmeOrajVGDQRoKVZMRiWLoF8+vKWD6w==@linaro.org
X-Received: by 2002:a05:6000:154e:b0:385:f398:3e2 with SMTP id ffacd0b85a97d-385f3980644mr2777219f8f.37.1733145253008;
        Mon, 02 Dec 2024 05:14:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145252; cv=none;
        d=google.com; s=arc-20240605;
        b=U5P/nCUMrYf5LN9c6yZQxy4qk9CQiejymhc0e3L42ilZbaGLWUZrnMi9Y0z7bKTf1T
         kW1FOhkHGz3cut0E3OxuFnhXvSO5eYOMXoCvejmSIytNJrgB7T3gZm1Lbd/qh046ovRU
         Szpk/OBlzubxsM7VTfAOcoJWDWozLFsILDN6uvZv+OIw04dtT+BBu3NOp3TQ7JqwM/jT
         mHYzygQBy4F3Sgh+HEkr5LdJkXKIq1ccZ9raQoVmPI3JPzxm2uRq2Q4bHxmbb82qyP4V
         6jWh3vXIMgQdweZMK+AcPoCzHoMRltk0zgRoEKjNE3f1pJVt6Ti/th9+syBP0DrRhVJ4
         FXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r8XgmjddIhM612jj3JENDu5XxtMOP1j+6PXpvtg3rDM=;
        fh=udRYNizEqTxVy24j968h001wsgrVr20L37AMRVgUWCE=;
        b=D/8YYSeWtFFiKCrM5ivRQ8SYsRKlaQlFyaAqA9Al87hE0wdlzdnmreUydrthvRxOvA
         pShyQzlA6c38nYthNpDds7c1Fxgqy6aErU3YkGTtpk4hEZbI8IKweIcqErX2Z+C97zB6
         L/PEIIaRQt4N3Rm9AMfhk/yMcKyNSkzBZgMgVZflVzaYYzpFxEk31kdrCIUmnn9k/NsE
         FmL2wCAdIE6ptekLEag8nXxWEiSmrasCSj0ylk8Q/3lCIZh8V5VxJw7Ll+ByZjpb41y+
         wH0FXDfQA3qGd1ilcn67jwiG2Z50SvMsaWgCoUexOMxzeURDs998tMtuP1OvwroB3q/U
         wlOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQ9EOO+W;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385de1ba74asor1763010f8f.3.2024.12.02.05.14.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQ9EOO+W;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145252; x=1733750052; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8XgmjddIhM612jj3JENDu5XxtMOP1j+6PXpvtg3rDM=;
        b=oQ9EOO+WC80zVIpwALemSa3FagbxMNMYcyw1a6If/mHi3bG53MXTMtMvil8t2ucco/
         x+SWAsoRvVpCF/jobfccIFZrPuxHw0M5dAc4vI+PdcQddLa28WPggav27nQXIWVhfBXe
         fq6cxta3UOJe/WPEQ+mNEHBGyCVEWGykC0r/lpLYUDoMyjc+XwmvP1+oAAjSZ+FfYmTE
         N1RtlmcDami1xfcM1I7PEOPO/2c6Boldg/fWmLgQu0PigMojAyt+GDWkJErMJw4qXVp+
         OXwFLltsUPkSphhEXE45MuntDE2lDUufVfME73I/rP2avNqO2F07u6cTKKhV+6SJslG8
         ZdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145252; x=1733750052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8XgmjddIhM612jj3JENDu5XxtMOP1j+6PXpvtg3rDM=;
        b=hE1VvUmE+YPgamHSsHVXnh0mSNxm4/ieUnNdrvVRjd5UU/ALogRR0A335+pRHAZpfm
         ubjwN17EGAg6sS9zcRuNVbOsvuimWWLKGAmkEHAzpOp7WHy+6Dx7f7vkcfsqo3BKfYqZ
         qJAUvEcpItLQkDeAOkayudeUSIGc5EICsxD7ag+kIEhaSJGfw/ildqOECdtz3517Sm8x
         e+SNxml1qIGzTPQQm6XfS8mnN7ByQoplpEKQrjoyyr9sRBF0yorZP+LBp+e4cCWekg2d
         gKpJOWDsaowVGlDMjvng3Onq0zYm1wIJTGdDbdlYUCYcaEhkjtgZ1JP4vEnfRVxx+Dvt
         15wA==
X-Forwarded-Encrypted: i=1; AJvYcCVrLVwzvcZEjif5UmaZAS97m7SVMV0Yna302wa06s3O/lYA6NtUU3HiEoUBBvogtRMVS7+C8rzGa63nsQ==@linaro.org
X-Gm-Message-State: AOJu0YwOTj8HFM5swCdNM5Yfz+9BrfYnAJi9K1AguuJ/yfxGNyY0BBqv
	+tSuO1qH4/hs1WXyFxgnsWbVT/GNpk38CjHpEuT+2Cmkd13w9OcKBA638XeVPPfFcw==
X-Gm-Gg: ASbGncuI/sP+X8OO8VkSmaF7SsrLyQ8qmJ6Q0iFNdzbcM3oE2XXfBfn2HUz4PqaukIg
	LkN1Z2SE90KlVLTnQ7o9BIce3NdWT6kdwwt7/+C94m9G4LmfiFZTFo9HIw0FCOADWctO2750yXL
	3Ax0iRvj6XHAO8+MXkIBWCiolV2P2ZM6zASEkazr+Jk4iIpR/j5eo53Ku2lW4DWIi1PAwCmIUdb
	KW4LE5CW0NWRls05pBSl8jtKiQswL9l4Z4+eQ9Xq9rFOT+c0OwIJuU=
X-Google-Smtp-Source: AGHT+IFGAqP9oBoobvwRTVsxyHV68P3Uq4eNLluzGyHDJ84r6ieo+CCHSPp2emlfRlyYJlsQ5T8PFA==
X-Received: by 2002:a05:6000:1fac:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-385c6ebaecbmr21012001f8f.35.1733145252416;
        Mon, 02 Dec 2024 05:14:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 13/54] target/hppa: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:06 +0000
Message-Id: <20241202131347.498124-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Jg9Jrv3pIoSv

Set the FloatInfZeroNaNRule explicitly for the HPPA target,
so we can remove the ifdef from pickNaNMulAdd().

As this is the last target to be converted to explicitly setting
the rule, we can remove the fallback code in pickNaNMulAdd()
entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/fpu_helper.c       |  2 ++
 fpu/softfloat-specialize.c.inc | 13 +------------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
index 0e44074ba82..393cae33bf9 100644
--- a/target/hppa/fpu_helper.c
+++ b/target/hppa/fpu_helper.c
@@ -55,6 +55,8 @@ void HELPER(loaded_fr0)(CPUHPPAState *env)
      * HPPA does note implement a CPU reset method at all...
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
+    /* For inf * 0 + NaN, return the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 }
 
 void cpu_hppa_loaded_fr0(CPUHPPAState *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 05dec2fcb4c..3e4ec938b25 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,8 +475,6 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
-    FloatInfZeroNaNRule rule = status->float_infzeronan_rule;
-
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
@@ -485,21 +483,12 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      */
     assert(!status->default_nan_mode);
 
-    if (rule == float_infzeronan_none) {
-        /*
-         * Temporarily fall back to ifdef ladder
-         */
-#if defined(TARGET_HPPA)
-        rule = float_infzeronan_dnan_never;
-#endif
-    }
-
     if (infzero) {
         /*
          * Inf * 0 + NaN -- some implementations return the default NaN here,
          * and some return the input NaN.
          */
-        switch (rule) {
+        switch (status->float_infzeronan_rule) {
         case float_infzeronan_dnan_never:
             return 2;
         case float_infzeronan_dnan_always:
-- 
2.34.1
