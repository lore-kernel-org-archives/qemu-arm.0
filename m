Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94365njb;
        Wed, 7 May 2025 16:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4CUQtWUQZL76Lp/EzC2drTYI/7G1S0eA6EUCQGQa8x1Y03cGDYGhKPr1dIUnlM6yuwSyIFNG6CxUYOw==@linaro.org
X-Received: by 2002:a17:903:990:b0:22e:39f8:61fa with SMTP id d9443c01a7336-22e5ece3f6emr86423975ad.34.1746661383849;
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661383; cv=none;
        d=google.com; s=arc-20240605;
        b=FO70Bhj1Uf2ftzrfQO0SA/QJqBqa0WR3XKFWS9LejbAXTbnfxzUZAEB2vHdZX62pJE
         Xrx/NKGV7gluuhug51HDfnzBN4s8LWq7z07ZbYOhj6ge4U2DQraT0sutvkP9JQkuvMbZ
         Isafa+7jYRaA7u4BR8u1ONUlBiVBbEJWqMJXGnxo/9BzhToEH0btI512BR1Gpy1BxsG0
         SMYy7k1/46F7uwZpu3gTG241ZpC34uZw7rq5eriO+myA5tvL8+MwQq98spa79ChIs0BK
         DatBAj/4pz+6lDLtI5W4VDAq1wUILxg7ZXxNA35n9DzQAMG9uQC4w8F2XqLOWAKOgQgn
         d50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzs2UwtIJQNFywCbX3keywjm1hoL8ZwFtVh1FsE0O+o=;
        fh=N/Jfn0kVlZqze5r3xfe7GeYtDo+LnntP/1BvlFnZhMg=;
        b=d0dxqLDSnJD2q4pqru1fpku7wZGaYpfygQ87sziPPsbZ7eGQ3xPSFr3RrZrB8w7DPm
         CtwS0hBBTZsZ9/3ovJTOe4nmGqIcDXKWHyFVqQx4H+vSPJVU3H3M1xkK5SJHW4Z2gwP+
         CHcanW4xyD1QuAGxpChM4Y8wyXiDL39e9eNQTGB46G+rPTysJezOUqaiD7XDT93hTk5w
         Jv2++hSlW1tLHIU4G0+G5PzIw9+g9l0P/biQ0IPK1wIIAbK2PTcpEyoyIhm8/J/FbxB8
         t3Fy6MRshkYE3M25s/cGq34AIMIDAeNOVEsXB8NR4MPRZ7EBnxjCu0SuXr4BwEJIueST
         LsdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t+/Q7/DP";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fa1b55c99sor1680425ad.6.2025.05.07.16.43.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t+/Q7/DP";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661383; x=1747266183; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzs2UwtIJQNFywCbX3keywjm1hoL8ZwFtVh1FsE0O+o=;
        b=t+/Q7/DPN2lcl1lCrzw3dmI5roxb1hIsPfo59e2VlhQbzSYW2P7kEsPnVHmBEhMZeN
         uLI3S/gdWjPWHMrvsjlU0qbDVAfXAJbAshXxjqNu+cniI5sDzaGkJD7FPsGRk3SWj4P7
         HMveH93DtvxZHxpfgM5JKy3dVQUZpMLipiJR9C6wkQB4YSQY69UDZDrSZbr8W0Xzm20J
         JK1gtrwGXWmcNe83Tu0nMUZyu31GpuieA0CZQbet3Z1e4hGjE2TjFlY9vNjKe1q3Pni6
         ARW8bFN40zxGkiynr9eR1nVRgTV3Qc9uSwDh23nVLmv76mCN5uOitVAZ1lfBAk3EW6Zr
         CWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661383; x=1747266183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzs2UwtIJQNFywCbX3keywjm1hoL8ZwFtVh1FsE0O+o=;
        b=BK4unOJn7UlMBpoYaNNru45By486rvDv6pJVB+sBcoFv2op7SFIxA1nE88HnVSM/ZN
         XtIx+0uXvdY/q9lN2YtAxwnt4QG9AL6CYXU7DayuFV4B5IZLZQoVY09XI15opON4RuCz
         /fEr/uGaRdeRIhQBAE1ylX61amaXiCXeEMkDJXkUGPHcHBzLvpbqp+LeSxTxLTd8fnPC
         +NV6rlQ/TlIvX4lfA5tQXrYiIIqNag6vXDrAHuVHCZQBZP7v7hgQoaLvTAzKp2eqQ1sV
         6H29MYfvSol6aHXsnDLpFC+P9LTujcKMkRpAeJIAnR9k1RbuRQj3QzYMzfFl2WF0wuTD
         HwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpIDDEwTTqHUsd/sq35/JIHkYvhHvVqYq/5UMxFiPZ8figDJy8rqTvl3wXrRgLce402i7IL8nl5H8/MA==@linaro.org
X-Gm-Message-State: AOJu0YzpKzzldO90piWdplYET69ddjqTrCde/TnElXoZjWvEAlA1QTnr
	dtIe0t0Cb7LZaMjL+NqPVlpvVWCG1hVp/kcy+lwpMAhdL7sQvsHvOPrIKxMzGHy+uw==
X-Gm-Gg: ASbGncvqdjscP0sew/20NzAK1hNlPtMkMccga7KkIGK9U4hFcPzW+Ni1i0/T9T1cbHf
	sBIDp8hfkOV9r/Oakg30gt3BD3B87fwomCdBLHMSblpl1q8Dp3nrA0JXlAfjw0JxzADFOgeg4ZY
	NzxEHKXgziQ6WpJx9Ply0wh8TwSXSVo4DdOQSoAspAkd2KxbGYzLojhwpnAX7BtvrPFUbqzSyD3
	E2wlotUQ9bJ0DgM7J959O+N13/QrxDZg5nQ0tvf5NdHoS6HssXfzEaSd8psrNzLLfFhZWlD01IY
	a/z/6QcKnytQa/jkAHIStUk3JpGPzhYwtooaTFpT
X-Google-Smtp-Source: AGHT+IEBA0reiSqxw/k61eFRA3NP84FfIPAPz1InObOyyt1+kBS+UY/gwjXbg6ZmBzPN1LbTd/0qqQ==
X-Received: by 2002:a17:903:32ce:b0:226:3781:379d with SMTP id d9443c01a7336-22e5ece3fb5mr76592015ad.33.1746661383483;
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 23/49] target/arm/helper: remove remaining TARGET_AARCH64
Date: Wed,  7 May 2025 16:42:14 -0700
Message-ID: <20250507234241.957746-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Hl5MQj5IwA5n

They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
we can expose safely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18ac8192331..e3ca4f5187d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -29,6 +29,7 @@
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
 #include "accel/tcg/probe.h"
+#include "accel/tcg/getpc.h"
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
@@ -6565,9 +6566,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
-#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
-#endif
     }
 }
 
@@ -10625,9 +10624,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
-#endif
     }
 
     if (cur_el < new_el) {
@@ -11418,7 +11415,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-#ifdef TARGET_AARCH64
 /*
  * The manual says that when SVE is enabled and VQ is widened the
  * implementation is allowed to zero the previously inaccessible
@@ -11530,12 +11526,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
-#endif
     }
 }
-#endif
 
 #ifndef CONFIG_USER_ONLY
 ARMSecuritySpace arm_security_space(CPUARMState *env)
-- 
2.47.2
