Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413121njb;
        Thu, 28 Nov 2024 02:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhCSociEFnXW0Ha2GBy3c4oHl8LzcOa67KverES++Le9c9PtOFI5VZygdwJqHzQR7WXf+Rv9Ppao6giw==@linaro.org
X-Received: by 2002:a5d:5983:0:b0:37d:4fab:c198 with SMTP id ffacd0b85a97d-385c6ec0cfcmr4302870f8f.26.1732790605131;
        Thu, 28 Nov 2024 02:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790605; cv=none;
        d=google.com; s=arc-20240605;
        b=JpntfHa978x8L29ITsSHCZXzUvDzRcJcp472pet6O/YU8fqHY9JYaka03/GxLHINFf
         jTREO4a8zU8He7qnN5nOFEfIYCX7DQby2DRkfeEhkFxJCGs6dbyAs8djc2UOtoBrqO//
         nXcJ11jsYnHMR8xVoZl0IZUVs8sV47rrwP7no9FLgG7JsxsOuMAjJDpwWpmqHJ1Ns9m1
         1A+ZBhhCcH6a4oUnLAhtAll3tJ2Nyy2sEoWfNI30tiHTxW1rVS1XBiWHKp4CvlC6TevU
         z1vF69Jn3yN3pEC5vQjdwn9Iz2T976jyPi30f+ma8amkBtUi/eDjlXm/VV9+CL7N5Asd
         c+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hyYEZNn0XnxoTIdyelbgzeOaKzs7K1fWizjpa6l6dh0=;
        fh=HHYwKoGXVtK9zFtVlZFOLccLIdSI2T+mJ/i+hmkfJIU=;
        b=JTtVD2/0+CSPvRJa08ihVvVxhwsz5cZt4YPeHj5EtsK423CSBKpjfy0li7q1ra6mPo
         MeVkI13VoKrkLNiH6CcL4gOwzeyHMnl6ArsLvB+Cci6XnmTxIUv2x+nyXorCEl3U0rEM
         ZqoHzxO9pgcQmsQF4bo7wUY+RH9lIWUfbL6Pz+K1C0OlL6NPqMJYhJvZ8giMwzJX1q1S
         6tKhFl6DHhwJ3DOfwzEd1SUiGk4ieQfMdOq10DuKLszwgE60lKKvp/hLC1U5EEecAylj
         ymeHFyMFTxn0Du0+TLpbNEjKGgNUJySaAz0tZ5oWqjq4ZVPmHPIQ/v4vSkXleaW1o5pH
         6PeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIL2eiJs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1044f3dsor5136955e9.3.2024.11.28.02.43.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIL2eiJs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790604; x=1733395404; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyYEZNn0XnxoTIdyelbgzeOaKzs7K1fWizjpa6l6dh0=;
        b=IIL2eiJsPCMoQFtGq5HbclElyV56ZxNqB6kFd8frqSOr9I5SQ6kkOa+9sMiGsghGvd
         fCxUbm25MSZ4V1MGuMje/Xn+aeISC42NWHHTOcasHNiJzLi7d9AL5gE9557UhOOC7iaS
         TvGnDPKMGougFBAlPlQEtJCpE5VvxJR/MULJG+UgTx5zh++tZuxKzHhyK9f5Pu2iA1P4
         fQwvdnCspunUsr1235HPkMkZfm5Z9sDx3JhdzqtnYwucScn/3mQfiI2qJTNgoZez4VQD
         /Hi3heBhqBp50JiNg5hoPKfiFD8itoi8nYpDX8OCk3nZvnKIu2HLa17Yjgs3QjZr2ANN
         VLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790604; x=1733395404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyYEZNn0XnxoTIdyelbgzeOaKzs7K1fWizjpa6l6dh0=;
        b=QFtP6qaveoXQOm6feKGjR/2ymxEV+1SVhPsA5eARxYev4lX6SQ+4JzykBxHBRIEAv5
         cPeh4/xPIsYRDCVtKdRkWrUbOSLs6anXQUy7I71c7DtipJooeJm1ytJ44C3fzBIRraOQ
         kzo//JEVCLvJFcZkvUTEj4jso37lOzYQVVRHOuIt/fxpV6x9QP1/yo2vdFJy2COKxGix
         IhPTdmM8MMdBBPwZFo9vXOCyAPWZHnYx+Y43HOJKAkTRx0k03PCks/1fAieNGRWQwuBS
         CX1MuX0oqgO01lQjDlkbPwEbl59NnXa1ecAmSp216odboFBnHEXXcWOawrDTnORJeFv1
         nP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJsrUYeWBvljXG+mRp24XaSPTZEKUCCD/5yON+PtIjs5Uu4bHfLwp808WMp1qMYkeNoEUk/RIZFU8/Nw==@linaro.org
X-Gm-Message-State: AOJu0YzMz1dA63+i2Y2tSaBLeTiYxxa5Chnv8KHxMfD9oiOBzkUFMdnY
	xN9geTpITlrWZ865/GpIodZhfD3/QvBO4/T4eOjqTBbxDBM5gayd+HNttea8Eh16SQ==
X-Gm-Gg: ASbGncviwzWXgYeGZZCJ+wPlntKaStiFFjyvuLlAg49F4/NcmSsdFPNQRg/z7tOD7ig
	ZNrpkrZkjVrCcl6GVuHiDNTVlqL9Fz6t9rEp2Zbp4Junr9HQ7MP93UMvF2+fers3x293LEqiLNP
	7jC/gd2VhecVREzm0G4BGUzLPc4w4IANMp6mUW9GafVX9lc89SUtHe7psu+4WN5bj8H9sPfBLWJ
	3Y+LPQRc/g2zCMUzovJOb3/o7SIfPtocqndpvQ60n5Rp6yLmiqz81Q=
X-Google-Smtp-Source: AGHT+IGbzy7EzKb4dzUEAavEzzJsSYKrO6t+vXSJ9MO8ux6hcDinUpScoS9ZCNZkY9iXna2ctNwC7A==
X-Received: by 2002:a05:6000:2c8:b0:382:4792:a48e with SMTP id ffacd0b85a97d-385c6ef39b2mr5795236f8f.48.1732790604581;
        Thu, 28 Nov 2024 02:43:24 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:24 -0800 (PST)
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
Subject: [PATCH for-10.0 13/25] target/hppa: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:58 +0000
Message-Id: <20241128104310.3452934-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hJsVClbmXIoD

Set the FloatInfZeroNaNRule explicitly for the HPPA target,
so we can remove the ifdef from pickNaNMulAdd().

As this is the last target to be converted to explicitly setting
the rule, we can remove the fallback code in pickNaNMulAdd()
entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
