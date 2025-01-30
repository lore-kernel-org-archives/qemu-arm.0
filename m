Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181950njb;
        Thu, 30 Jan 2025 10:23:25 -0800 (PST)
X-Received: by 2002:a5d:6d0c:0:b0:38a:888c:676f with SMTP id ffacd0b85a97d-38c5194a531mr7329048f8f.15.1738261405515;
        Thu, 30 Jan 2025 10:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261405; cv=none;
        d=google.com; s=arc-20240605;
        b=f9kozFxnhYqCPFhW5GYoNWk6dd3lPIvRtpmMS9ziadL+3rNio5l5/vYL/yJImk/w9m
         NFTyzHHlPN1wajJ3Z/Md8hQfx/IKtMd3P1UX2lW+pP91DqYGKri5dPgb53Ov4ygOx4Ch
         2N7MP3NqaDb+rWW9esJjLj3mqzsnvYn4+N1W5SVf5Aas8PYIZg70ZodzX5yTW5NLfmTi
         4+dCaTzuoFlE5pMoo/o3u0XMKZviq4UCloICOXNjqlBcR2w4DFLoygXETIxsWIKWt/u0
         qPHcsPqBTQ2Dzi6yZI1/N0B+fPkWXsCD3QzNNNycN/7ktW5K59pjsO7FM0EUy9FhbHrq
         Nrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fT9psFAWJPNLFoqhflxpXdULv7n4FREA8vp9m2an3Sc=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=b5aRxWly6XchCiT8CIeXXlkjGR9ruLOKs56FRfp0W2YPbasNO2nsqOr7Cs7qJuuh6C
         u2c8847aZi+1SOuqh4WPmBbfbcNucwWNeAVF8jduHP3X5RW0z+zpsXhWh9fvrWawrDy/
         2+1Fs0dZYi7QoX1Q+nRh5UVAPHVCc7U89I6rj598MZHG9MpaCVbjFyFIFDTQg91ND6A4
         rYKEhXATqi7Id0pTFznTeZkuVJn88wSYTP3g00GnQ29w6KJRh50v8dazUM+ym6HdDc9R
         ZHEmjxplzZDtcWBjns9i3/VJmngiysufRkDH9lLUcVhQbCPr6bDFVSS1a/V/y0pgUWyb
         Q0TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CL6yDNS3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1cb904sor599443f8f.6.2025.01.30.10.23.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CL6yDNS3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261405; x=1738866205; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT9psFAWJPNLFoqhflxpXdULv7n4FREA8vp9m2an3Sc=;
        b=CL6yDNS3w+zXyp/c/aYqt3AdEwS5oDiXyYfBh35aUwK0K1L0T1AZaNr1kVxq27n9o5
         QmshT9tPzL5A+fNNsaaVjkwjyBUJPOlSbLazlgAOLVVq3OWaoDB5hhNo8nulKxB1MBCT
         avzCznhkdaTRgFD35pXy6T45L7VeZezzyBbhwwTFLrmW//u9KRlrK53fNmF1TnB9l0In
         ES3cuBXQi3i69OfO2ghsuInl8bHxMKwS3MNV498GbD8waRgPPBIzI6cUWmEkYjeWPnKG
         d7eY61ISMmX9gtJ+ufB0CcsRlX04EL4B5MQLq7tJ5YoPsz/k1dDkAfLIbVyjS7uFYl0r
         oqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261405; x=1738866205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fT9psFAWJPNLFoqhflxpXdULv7n4FREA8vp9m2an3Sc=;
        b=FLkOixVjZJJu4niFp8xkb4GhxW5DNHQfZHPlXIF9gLuQ7M1EhHDxfQDIY41kb2qVJO
         h//2J/+JcuzwUcohOA40t51Rsozy+MTFdUOVo2vuiimskaCPM3r5jRlsLYaqUsjdXHR4
         sOqHTOrk0VXqigBheV4rLHg0fxt6UkAQ3iJ3tYHL9KI7tRuJSUVndiIjC1Uxr2hoKI6k
         8jXxuHguu6SQkezYaeQ1nUVb4Zf1YvPaCekcS1f87K5FxvScEoLCddf/HwtVA6XS8iRB
         HNtHxGm4Wm/LNE64AQggtl1uEKzbeesnucAL0ydAV3XscRt644AK4sux7qHJWHKZCorK
         I18A==
X-Gm-Message-State: AOJu0YzdPhYkLyPr6C1NE9SxgakuqZuAWBzSSchWGh96PpuAnAhq+auj
	lG5Ky3fKwXUFHT+UI7I3r7/M6Roo3JMU5DdHohqgCkUl63fXZsGj4b/dnm8urquqCQ==
X-Gm-Gg: ASbGncuS2S9weIq2kvUACzcsHYsIyjCaPo/pbhWicLWQD2VlIxTMZpTObLkyTek2YsQ
	+D0CFtwRVAzeEXY+zGh1PM1zunq3Rwbe09L+k+pVodnBv7wxbJ4q/Xsh7z5u/Ctn6HFJ5onYYpq
	v5UwNgcvmCYVNpOjCeqx8Bj2hOd09pT+o85+G5J9HNYm1D/v+5+cdoH6wElNltEOHviV6sJmogE
	l22/XkQ00OWY9aQAsKD/NcY/2CLIJ82rLvQGim3aleBY6PvCgVv988cCIzdNS3HtewiqqnBNDTA
	lzZ5CPgAsI4y06Fu4mBNqw==
X-Google-Smtp-Source: AGHT+IHJ9OXse4dtVnUIniM47I4sjE8neBgEI/7d89xl0XSPiLCpUvOtYoeHha5fARQbxodmuAolDA==
X-Received: by 2002:a5d:4348:0:b0:386:3e3c:ef1 with SMTP id ffacd0b85a97d-38c51e91b5emr7031841f8f.35.1738261404931;
        Thu, 30 Jan 2025 10:23:24 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 13/14] target/arm: Rename CP_ACCESS_TRAP_UNCATEGORIZED to CP_ACCESS_UNDEFINED
Date: Thu, 30 Jan 2025 18:23:08 +0000
Message-Id: <20250130182309.717346-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nDQ7nTL7r6Qe

CP_ACCESS_TRAP_UNCATEGORIZED is technically an accurate description
of what this return value from a cpreg accessfn does, but it's liable
to confusion because it doesn't match how the Arm ARM pseudocode
indicates this case. What it does is an EXCP_UDEF with a zero
("uncategorized") syndrome value, which is what an UNDEFINED instruction
does. The pseudocode uses "UNDEFINED" to show this; rename our
constant to CP_ACCESS_UNDEFINED to make the parallel clearer.

Commit created with
sed -i -e 's/CP_ACCESS_TRAP_UNCATEGORIZED/CP_ACCESS_UNDEFINED/' $(git grep -l CP_ACCESS_TRAP_UNCATEGORIZED)

plus manual editing of the comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        |  5 +++--
 target/arm/helper.c        | 30 +++++++++++++++---------------
 target/arm/tcg/op_helper.c |  6 +++---
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fb3b84baa1e..52377c6eb50 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -337,13 +337,14 @@ typedef enum CPAccessResult {
     CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP_BIT | 3,
 
     /*
-     * Access fails and results in an exception syndrome 0x0 ("uncategorized").
+     * Access fails with UNDEFINED, i.e. an exception syndrome 0x0
+     * ("uncategorized"), which is what an undefined insn produces.
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
      * This trap is always to the usual target EL, never directly to a
      * specified target EL.
      */
-    CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
+    CP_ACCESS_UNDEFINED = (2 << 2),
 } CPAccessResult;
 
 /* Indexes into fgt_read[] */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1e26ec9d06..1fee8fae127 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -285,7 +285,7 @@ static CPAccessResult access_el3_aa32ns(CPUARMState *env,
 {
     if (!is_a64(env) && arm_current_el(env) == 3 &&
         arm_is_secure_below_el3(env)) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return CP_ACCESS_OK;
 }
@@ -310,7 +310,7 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
         return CP_ACCESS_TRAP_EL3;
     }
     /* This will be EL1 NS and EL2 NS, which just UNDEF */
-    return CP_ACCESS_TRAP_UNCATEGORIZED;
+    return CP_ACCESS_UNDEFINED;
 }
 
 /*
@@ -2246,7 +2246,7 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
         if (!isread && ri->state == ARM_CP_STATE_AA32 &&
             arm_is_secure_below_el3(env)) {
             /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
-            return CP_ACCESS_TRAP_UNCATEGORIZED;
+            return CP_ACCESS_UNDEFINED;
         }
         break;
     case 2:
@@ -2255,7 +2255,7 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     if (!isread && el < arm_highest_el(env)) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
 
     return CP_ACCESS_OK;
@@ -2385,7 +2385,7 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     switch (arm_current_el(env)) {
     case 1:
         if (!arm_is_secure(env)) {
-            return CP_ACCESS_TRAP_UNCATEGORIZED;
+            return CP_ACCESS_UNDEFINED;
         }
         if (!(env->cp15.scr_el3 & SCR_ST)) {
             return CP_ACCESS_TRAP_EL3;
@@ -2393,7 +2393,7 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
         return CP_ACCESS_OK;
     case 0:
     case 2:
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     case 3:
         return CP_ACCESS_OK;
     default:
@@ -3304,7 +3304,7 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                 }
                 return CP_ACCESS_TRAP_EL3;
             }
-            return CP_ACCESS_TRAP_UNCATEGORIZED;
+            return CP_ACCESS_UNDEFINED;
         }
     }
     return CP_ACCESS_OK;
@@ -3601,7 +3601,7 @@ static CPAccessResult at_e012_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * scr_write() ensures that the NSE bit is not set otherwise.
      */
     if ((env->cp15.scr_el3 & (SCR_NSE | SCR_NS)) == SCR_NSE) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return CP_ACCESS_OK;
 }
@@ -3611,7 +3611,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     if (arm_current_el(env) == 3 &&
         !(env->cp15.scr_el3 & (SCR_NS | SCR_EEL2))) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return at_e012_access(env, ri, isread);
 }
@@ -4684,7 +4684,7 @@ static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
          * Access to SP_EL0 is undefined if it's being used as
          * the stack pointer.
          */
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return CP_ACCESS_OK;
 }
@@ -5674,7 +5674,7 @@ static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
     if (arm_current_el(env) == 3 || arm_is_secure_below_el3(env)) {
         return CP_ACCESS_OK;
     }
-    return CP_ACCESS_TRAP_UNCATEGORIZED;
+    return CP_ACCESS_UNDEFINED;
 }
 
 static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
@@ -5710,7 +5710,7 @@ static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
     if (isread) {
         return CP_ACCESS_OK;
     }
-    return CP_ACCESS_TRAP_UNCATEGORIZED;
+    return CP_ACCESS_UNDEFINED;
 }
 
 static const ARMCPRegInfo el3_cp_reginfo[] = {
@@ -5798,7 +5798,7 @@ static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
         return CP_ACCESS_OK;
     }
     if (!(arm_hcr_el2_eff(env) & HCR_E2H)) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return CP_ACCESS_OK;
 }
@@ -5896,7 +5896,7 @@ static CPAccessResult el2_e2h_e12_access(CPUARMState *env,
     }
     /* FOO_EL12 aliases only exist when E2H is 1; otherwise they UNDEF */
     if (!(arm_hcr_el2_eff(env) & HCR_E2H)) {
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     if (ri->orig_accessfn) {
         return ri->orig_accessfn(env, ri->opaque, isread);
@@ -6751,7 +6751,7 @@ static CPAccessResult access_lor_other(CPUARMState *env,
 {
     if (arm_is_secure_below_el3(env)) {
         /* UNDEF if SCR_EL3.NS == 0 */
-        return CP_ACCESS_TRAP_UNCATEGORIZED;
+        return CP_ACCESS_UNDEFINED;
     }
     return access_lor_ns(env, ri, isread);
 }
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index fcee11e29ad..2230351a8f4 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -764,7 +764,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
 
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
-        res = CP_ACCESS_TRAP_UNCATEGORIZED;
+        res = CP_ACCESS_UNDEFINED;
         goto fail;
     }
 
@@ -869,8 +869,8 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     case CP_ACCESS_TRAP_EL2:
     case CP_ACCESS_TRAP_EL1:
         break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED:
-        /* CP_ACCESS_TRAP_UNCATEGORIZED is never direct to a specified EL */
+    case CP_ACCESS_UNDEFINED:
+        /* CP_ACCESS_UNDEFINED is never direct to a specified EL */
         if (cpu_isar_feature(aa64_ids, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
-- 
2.34.1
