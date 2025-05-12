Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42792njb;
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE3L40QvagRKgEnsDO8dNQOLE1BJY2Wa0pkytLRCYii6fXxHOvcs0E0H58RMOv5ChNfjYnIJyUnqrshQ==@linaro.org
X-Received: by 2002:a17:902:e84d:b0:22e:17ee:aa69 with SMTP id d9443c01a7336-22fc91a8871mr200958565ad.50.1747073132064;
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073132; cv=none;
        d=google.com; s=arc-20240605;
        b=W21i+8V4MI5Ok5Ye29/W24+cfpKtP8kFgDkPSMLgqg7oWXmJMypWIK2TgvxnL7vyWo
         g3L6Wt+HYjPpFVfQJJvWbpC3oH5iKJWwdYy4+WfbQHvqvU9/GQyRtQcOww4m50ENhGSj
         QSGIzdGBmUCTS70lehjc6U50v48GT4BZYEGKr8lWk0jcm0VelvCj6eh6POzCYGpb0Ren
         X+uc5UK0oQWeWi4GKi4/lUtfdp/YSbwJrwg/OZ6dGIcjWvx1ewYYMtAi9Jt1wPtC8I+f
         UmX6ZWr2mfVtidLoVmLHkp9kVEbNcxytt3//GYABhnx9YHzS3WT/DuacTiGNxOth9EY0
         Lihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QH1qfLH+/zCru9XWBwZx/jkW56FRhaJPBlyr85eQl0I=;
        fh=3vdeLm3xedYG/GwY5oBGe+sJwUEg+kVe/nnwyxci4U4=;
        b=ii6tGHexjjHGhzK6dDfybBlDO/94bZ9HLzU1ZEBtOCy6BQjua5QfM925vNoJNTCXVt
         udzIu9fiALgNiX6qgpkoNilU2yCJ7krXjFRDd+OcX8SxpCiV2YIFDbZpLpWEG4ZtWOqW
         JZHlNn9dEx+IxogGw8gHdUITXS/ODpDEqkwiN9D+H1HlECsUhOYhO3KwM19yfgJPI7aH
         fBPznx7LogL2bwRoVx6YSzh1bUqC9g1L+VNsKMnwjcLcA/LblJj23Wblk+Cn90k7omZI
         cQ6LM0FuctAjqbGcohFob/QMpPqhJxmniCqOumby96yagNExAb8sdE7s1yqus3MkzhAT
         QGtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3OLtxhV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc58268a6sor45107385ad.2.2025.05.12.11.05.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3OLtxhV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073131; x=1747677931; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH1qfLH+/zCru9XWBwZx/jkW56FRhaJPBlyr85eQl0I=;
        b=h3OLtxhV/siSbefGW9Ca1aBMD6RLHWliMYCMhYqVYIXeatAE0yX9eSnV/Cz+KhNmsx
         0bm0YvEJMl9MKDXa5dSX+h2bo7vxdjrfzvKRW7wKEE0ZAB4lUO+FzX4B1RmdTIYY2VhY
         NsqDb1RIGIMr/ZX8H5PoeBJKiaB84Y0EPnvnzEsxvdCNKFvJ5KminIIAAuYYUUJ0nV7f
         l4T1iYM0ENefC+BdsTXfFLrSGd6TV+G0UgprvqhOOQGtL6EHw+lKjcLhjr39Y2dBn3Ps
         0rQlzecUvWL0ZCSjZjr0p+84WW1V/BlkKkNR689Bb3yfTfig3L6nkoBncvdjOnDv1RRu
         9TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073131; x=1747677931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH1qfLH+/zCru9XWBwZx/jkW56FRhaJPBlyr85eQl0I=;
        b=Hcqx+lCNYV+QhKdk3tyiuIsbPlNx2CoiYQU3EdQYU8fIuWNLbFMdbVWrcpLOg7kOFM
         NAq+vvii7wVmPD1mJKt/BNU1MctDHhZpOxobH/XISr+O7bsD63X07AQrr9dMyHBxm/hR
         haSxGqShm9qkDa836ULBDHTTcOJ56mu1fT6Gn9INNDvfFeFng1jgiA91a9YN2TBTt1Zr
         6OaHb30a2aBYbJbFj59hykCE2O0NEeg/jZjznttF5KMkkYjPxerSIRodBIwlOQArHH4y
         L/4XYKs/N255SILBCgZky9uMZ8Aphu9R77+SzGCA6ZZiiHCJh9KYT8de3LOG3swj2Qa5
         sSlw==
X-Forwarded-Encrypted: i=1; AJvYcCX7vZGbeUM+n8pg0olxOGEWYiLXoR7qlbHqKM/2orH/TKpNwoId6Al7/slzLkhh7G5+Fz2kOuOTA5zaBQ==@linaro.org
X-Gm-Message-State: AOJu0YzY8eWCqh+5VO5aWfz3zDvLxX3YaNTx7nnbiVZvAXeXqCNebPN4
	Ae2J1dKEZdHkQgaUYP6eIr6DfNosT7niMlAtZHtORvOtVCPCpg6woY1xp1rmIPWoVQ==
X-Gm-Gg: ASbGncuT1yrAqGoS2xtC9a08u8XEdZpOsDHVoiZ6H8NwyrS+Y1K+0x86nShaOJLRKls
	OiLSjFNdXKvyS7ex9Rl/4fUjE5IQ01keLbdFHUZzUaKHFsCiqkHK7UNFEeqGQzi/nlLjYr5s7yJ
	+L+iUkYE+bJJfzaqEUqXb9GzQRkSz6YFEwE7nyjnqzSalHilHItgiKhCqR1KNT9C5jKDGw4Yrbf
	OFesVfOmlR3DV3AL9pkK6e1E2QandyCS+cRUXYlOkq1PfO3a5jRBcCVZWOqPG04pf61RFaazWNu
	l5IWwVgUPEB+KYBg5K+ej4oPZkG6hOi40VXr1zsO0Y1nakg/FCI=
X-Google-Smtp-Source: AGHT+IE3cGskjzjRojgLkr1I7mB9wKn6lFQ8dcZYSyN1P9AGSzZnigX6VHGug8trK7WU8FJVQVXhIg==
X-Received: by 2002:a17:902:c406:b0:22e:7e00:4288 with SMTP id d9443c01a7336-22fc91cb78bmr201982785ad.53.1747073131634;
        Mon, 12 May 2025 11:05:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 22/48] target/arm/helper: remove remaining TARGET_AARCH64
Date: Mon, 12 May 2025 11:04:36 -0700
Message-ID: <20250512180502.2395029-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pwdtvrZ82O1s

They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
we can expose safely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 92a975bbf78..aae8554e8f2 100644
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
