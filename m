Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181877njb;
        Thu, 30 Jan 2025 10:23:21 -0800 (PST)
X-Received: by 2002:a05:600c:1d1e:b0:436:ed33:1535 with SMTP id 5b1f17b1804b1-438dc3bf129mr75549885e9.12.1738261401486;
        Thu, 30 Jan 2025 10:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261401; cv=none;
        d=google.com; s=arc-20240605;
        b=bHgVLGF19O9WQL4iKTbxXq468+5Az+JRWT/FPhDiNcHpxypV36xR559+kJlTHdcqkV
         dD2sF3DX4H9rlg5ZJApqO0hY35KgG1oj6ZXe8QDi31HvE2pR4A8Doiz1OX+SHkx8x7Pa
         /kL9R3pvaxRVM8NtKAgHZccydb0blk0nFmJ3k6GjajpuPiKwlMFTzUPZOZKT8QMejL0e
         Z4EuqsLk4KhCpzunG77CssnyGoZjptc92nt+y9te8+Q+NO/FbSaCITcoV/qIIIeujq81
         qLpPSEMtBXxFFjm/rjFmrUtNMnQB/0ZyytRM/3TEpJQ43khOSNpHFv9xxVtqy6MZhFOX
         2f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yzUgHg6nqtrTZvIz3ixC5Nt4RQVPQXOj6ckfC4T6pic=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=BMcWZHvI/fdGkJmRHk4hU1cPe6z0omM0z9+53Ibb4JUGM1vMkjbdMydm6yHGThlQFc
         WWgHWMDzOXp7/0Z+rq5xxQTpMEVzijUfhmb2pycy24fYxAj2N8W+pqvU6tJbuOKA59pD
         jFMORa0ROff1Xxjdki56XLsHyUz0b0sznosmJaYMCVIhjLWZreKoXIKkhxYaoKngnKRg
         MtvSo/7dNYArJtnGaRmbUKYfyP4Oahd68Ym6s1MEUdEq/+6c2pgRqrpyiuTpZplC4GKm
         DggMTgDpCYYh8zhX/0HY7qeHkh87TlZrZqABXOzuSRzphaq70bkzFAicU075AVtqgONi
         iWlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5aFdAnT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2450228sor8978405e9.7.2025.01.30.10.23.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5aFdAnT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261401; x=1738866201; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzUgHg6nqtrTZvIz3ixC5Nt4RQVPQXOj6ckfC4T6pic=;
        b=a5aFdAnT71/QMeUscsYUEklwANbes+D5LK6wxp/t3Vbm74dc0rED1FOdo3o3aB7jr5
         CvP7edBsmwPHrbc1KBSbN9yEMS/asAavy4LV4mMIVV74+vHXnHReh3ycGZSTzw/SE1n3
         5YoelaVOM+k69NVhUQ1ChQnOZIg8Wud3HA4Aw9gWpOwumAvAICZZ4ygw1tQowoko26om
         1xeHwO4yM4YStiGO5z8Gf8xSB1A2cjpl1FH8Xq8+zBbZwcXTd1t0qnsb2i9y7VFCazkv
         BiduoC6ycZYCczkff/v4QGJRvjb8Ir97fBPfL8+8YHlLMD2Ao+p6tfN8nsK86lusc45g
         A4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261401; x=1738866201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzUgHg6nqtrTZvIz3ixC5Nt4RQVPQXOj6ckfC4T6pic=;
        b=FCVrshMu9iTTc5fcsMBWJzHAwl0J+42/rYB0NUvfo7/73Dx5EkGqOcF6dl/9l2+dtK
         o1E8VHUAbkQ0UrRcpUtIvkjYqViiRntGFX7goWMQ40OK7tQUlSvLYU160XKyFJ8F5gLc
         9xSvScswNSJVxjAsHZLE89MhX2wPabcu0gmedddpixHjXNjoSTkOpNfXi+IaLXfW6C/t
         msTguo/sRWje++wJzpX9U8V9uCzoN5qKcgX/Vebhyov+B4zPMfU/mUKHD20Yty1tfoON
         PgNZmH7333SRU1Y06OUSMJd1fWlZN0mw3tqo/RnY1lPF1DvyaDflJexQAiyyvjIubp+b
         KpBg==
X-Gm-Message-State: AOJu0YyBj4fHj8jjGBNXnXcWt6jJ4id6hdQ9Q4dkR8b7sv+bKF3etide
	Hz/wYRYuCUMnHtP3x0PSy+kbaYtQ8MK09FvNXNu4vsv96BwlbvMrb+a6RURZJC+Cpn46swmoq2V
	WRYg=
X-Gm-Gg: ASbGncuZmg4zlU08rvu7VkdOl1mAqUUNCMFXr+6z7ojP5wylHGVIFa6bdKS7gcVgasi
	4E0/iVkczpJ3DftmNI+G2chzSTRi7idW9vGrfi8UIB5Qm/0jps4+rYHugH4n5qkue8B2NY4tsrY
	Ic+DC2805wlgU/a0i5Utb/90vlB17Dp40zIhk0r28YOCtbiz72Zs58aCG0TvDmz/1Uu0xvddmgY
	3gJ+5vdgsHeAFAufFXxeOULkLY8CBtegDtv79X/iZNJQo9Ia7X6qYs5U/H39OoQHMFHquQIPobm
	LXtuwvxa2dAmBlPwJiBXCw==
X-Google-Smtp-Source: AGHT+IE8KcPPbbX+/lcvomWZbLlt2xTmnRV4Djr3ywWNrv8azlYXfRd8F3odOCzEuERXlxchvO0xXQ==
X-Received: by 2002:a5d:64a1:0:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38c51967de4mr6882576f8f.20.1738261400830;
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/14] target/arm: Support CP_ACCESS_TRAP_EL1 as a CPAccessResult
Date: Thu, 30 Jan 2025 18:23:04 +0000
Message-Id: <20250130182309.717346-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6z/1k8OUe+4R

In the CPAccessResult enum, the CP_ACCESS_TRAP* values indicate the
equivalent of the pseudocode AArch64.SystemAccessTrap(..., 0x18),
causing a trap to a specified exception level with a syndrome value
giving information about the failing instructions.  In the
pseudocode, such traps are always taken to a specified target EL.  We
support that for target EL of 2 or 3 via CP_ACCESS_TRAP_EL2 and
CP_ACCESS_TRAP_EL3, but the only way to take the access trap to EL1
currently is to use CP_ACCESS_TRAP, which takes the trap to the
"usual target EL" (EL1 if in EL0, otherwise to the current EL).

Add CP_ACCESS_TRAP_EL1 so that access functions can follow the
pseudocode more closely.

(Note that for the common case in the pseudocode of "trap to
EL2 if HCR_EL2.TGE is set, otherwise trap to EL1", we handle
this in raise_exception(), so access functions don't need to
special case it and can use CP_ACCESS_TRAP_EL1.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        | 1 +
 target/arm/tcg/op_helper.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1759d9defbe..fbf5798069d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -331,6 +331,7 @@ typedef enum CPAccessResult {
      * 0xc or 0x18).
      */
     CP_ACCESS_TRAP = (1 << 2),
+    CP_ACCESS_TRAP_EL1 = CP_ACCESS_TRAP | 1,
     CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP | 2,
     CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP | 3,
 
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 1ba727e8e9f..c427118655d 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -781,7 +781,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * the other trap takes priority. So we take the "check HSTR_EL2" path
      * for all of those cases.)
      */
-    if (res != CP_ACCESS_OK && ((res & CP_ACCESS_EL_MASK) == 0) &&
+    if (res != CP_ACCESS_OK && ((res & CP_ACCESS_EL_MASK) < 2) &&
         arm_current_el(env) == 0) {
         goto fail;
     }
@@ -887,6 +887,9 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     case 0:
         target_el = exception_target_el(env);
         break;
+    case 1:
+        assert(arm_current_el(env) < 2);
+        break;
     case 2:
         assert(arm_current_el(env) != 3);
         assert(arm_is_el2_enabled(env));
@@ -895,7 +898,6 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         assert(arm_feature(env, ARM_FEATURE_EL3));
         break;
     default:
-        /* No "direct" traps to EL1 */
         g_assert_not_reached();
     }
 
-- 
2.34.1
