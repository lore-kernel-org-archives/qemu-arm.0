Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183648njb;
        Tue, 4 Feb 2025 04:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnIID//BpclH7xOPRGPCRMSR8ksMxJacXfaUJU6Yx8KMbR7BU75ILa7DC1swOfsBHDcdg0n6RFvZd6GQ==@linaro.org
X-Received: by 2002:a05:600c:5119:b0:438:a432:7c44 with SMTP id 5b1f17b1804b1-438dc40b281mr199572555e9.21.1738673413686;
        Tue, 04 Feb 2025 04:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673413; cv=none;
        d=google.com; s=arc-20240605;
        b=gnZ7L+1cp7M+RXjvpu69D+Wr00bBVqTPJ1xkeQSTirwidIw1bkmhlfyYGLWLKutAhH
         t+xp5l2MFpa7Bqq1+FDFRp5BTlSfEw4Kj37lORKaMc0DX8mzTqhfxRkc22oKF+h9GQgd
         pWrV0HfOFe4K0k2QDyS+73vZt//p5vYBzoJlcFLi/wnHq8bLiEoY4ju7JHQJ/5WvlAfg
         MIx7MF37Rc3Q5eV4hdRQ6m7qTU1j0Vi0XKRCaV2NXi5jlZBB3HmZhHcEBU18BWzAfOON
         HwowydvAf9F7OfhFLmIm8SPwnjOplwfCGTagvXWTq8hqslni2wqupTwSKU1wPkgbrniI
         y6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5cl2nmICirpIXVtF8Zl43t73+3pCHJ4PZJWOB63ih4s=;
        fh=z55lqGEeMA9BkX77bQGEq9fre9+Z4/PGTu08aN4Kgqc=;
        b=GvsTrPL0ywn27WgKzAZqYSHlIQoHzSuXA4DhxEClJD5MsnPvA11y96CpLaZpyqSAGF
         q8WZCg9sxBFBKaaFm1ueXE4BjxG3iwknCcNZNutlB0UAx9dzdeEFT6oEO7sCjaiv6HS7
         jqIj7shcSEcZyI4vVUK9Tw7hc/LKJ8NKKrOmNTjaMkAKxsTZYPq04P7ujPBQt19RUUKJ
         L1rttonqel2oqcDYkw0kUPqozIMtiYKXsvhKAE1OSjxeUPk+cacKvS3bsUkfZweJjLwi
         i+hZiltiwp/167xU7lSJKt8zIxcjtQC4PspR6WNRGyRGMLgBvcvGIfPJAC20F0PNBU47
         F4rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GKdw/SwE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c2272besor4188582f8f.9.2025.02.04.04.50.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GKdw/SwE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673413; x=1739278213; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cl2nmICirpIXVtF8Zl43t73+3pCHJ4PZJWOB63ih4s=;
        b=GKdw/SwEnFwjGG1Dsgt8sx/gHOWBLMmW2Pn5DFhZ6Qv1XAKa/i/J6qoFT/xTJmnH7n
         OkYaoP94diywUu8pHwpbAEbNS+/6A07u2NyAh5ZEZfi97B0zlKqf0ZBhrqrMGenlpFfK
         0JjonIeAKB+G7qlsoRoHeK7YmV1RFvH3qsMBUhzCbTidC7RMJ/ERhDLqg0N5IKfPr+gL
         l6aD0F6S7Jvlu5DJ8B5Ad8F2iSzcxnUAocko57lGn0lgbtDa1yoONwgWv80s6leGM8wq
         tKSp4dgVLPG/oSCnpFRGiFU0PBj/+C7LRWihhJym6blOhqFgOHkXK6MVM6Kn0mDqE/ny
         RdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673413; x=1739278213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cl2nmICirpIXVtF8Zl43t73+3pCHJ4PZJWOB63ih4s=;
        b=aBpuGYum2sTrOuywaRtMDI21IL8zFAf6eLOqFN9iwMFhdhMqWr81P7OhOnhQQCPDx6
         TV6oAyY4eetikilAu0bUnK4Jq8osSjNhLiOqAiIxLR+5Ki9p7hXdQEB/iMxfAU04xFkN
         XTDW6dCoKgEbzfk8i5GROwvoXsyVXGaIMVy6d06xARVOf0/Wjl/88sJRvZXrUPEwRcvr
         M2YyBF/rBpfuZNSHGK+Y4hJBW0UU5eCAAAyvaREA7PNgIUQKuenGkuO3pp0E42rxp7WV
         icYIz8qMney1l1F8kRX5ZlPxO/H2vfZ2EQIwCuGqpKU1qOHDx4SUbAyzJf/SBVrY7xkn
         ev9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKabIYNMYwmqS9DuczHNLyQNgMOfA7p9DKZzBsD5P4kFsNaFdJBRfMYJ3SsLmjmL0lmBhNt1DVuaBk5g==@linaro.org
X-Gm-Message-State: AOJu0YxTe4wa98q6xFqAosQwpL/9gbyVGt3AwgkAB+Sdg36zf3bcuaPF
	w9+QKUuuq335tMqVet1jeegAaOLAcTaVpQFBAQjo82hERDGWXPV7s6MaHfSaZnECHg==
X-Gm-Gg: ASbGncurmfrg+4LaV/xlfu1Ir26p/JDZfiIEld+o1MioxUbZokgYtyXHcyI8GCHfvzJ
	OAF/i165TK5AWKtHAbiQQNNN9H3HRupKIXF2oImhxfssynFlymhlmhpO9PG9TNQ0dCgyjMxskYV
	uAtP08DPplzVTt5vpFFO8bo9LGOAgSfL79W7LZ5wTcrICsxtQZSFxOKb3W1bWTguA+x3LEJ1SdH
	sqtr2HGxC348tW9yrJDozwT5BKh4X1bASHnVOeDFlzB22ENeMS82PIvbT7DxuW7bONHfDlFSFBc
	SrORS8ugOjWeK2OJYRS6Ug==
X-Google-Smtp-Source: AGHT+IGNOP9780Zm3sXo3On9fKjhQUBV6/nFYl3NSUhLd17mMupuDNqsLTtIcFXUHBXL/9AK0iYzSA==
X-Received: by 2002:a05:6000:50c:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38c52097153mr17445706f8f.38.1738673413147;
        Tue, 04 Feb 2025 04:50:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/9] target/arm: Apply correct timer offset when calculating deadlines
Date: Tue,  4 Feb 2025 12:50:01 +0000
Message-Id: <20250204125009.2281315-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3CoqbLuotj18

When we are calculating timer deadlines, the correct definition of
whether or not to apply an offset to the physical count is described
in the Arm ARM DDI4087 rev L.a section D12.2.4.1.  This is different
from when the offset should be applied for a direct read of the
counter sysreg.

We got this right for the EL1 physical timer and for the EL1 virtual
timer, but got all the rest wrong: they should be using a zero offset
always.

Factor the offset calculation out into a function that has a comment
documenting exactly which offset it is calculating and which gets the
HYP, SEC, and HYPVIRT cases right.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1fee8fae127..049362a5500 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2460,6 +2460,32 @@ static uint64_t gt_phys_cnt_offset(CPUARMState *env)
     return gt_phys_raw_cnt_offset(env);
 }
 
+static uint64_t gt_indirect_access_timer_offset(CPUARMState *env, int timeridx)
+{
+    /*
+     * Return the timer offset to use for indirect accesses to the timer.
+     * This is the Offset value as defined in D12.2.4.1 "Operation of the
+     * CompareValue views of the timers".
+     *
+     * The condition here is not always the same as the condition for
+     * whether to apply an offset register when doing a direct read of
+     * the counter sysreg; those conditions are described in the
+     * access pseudocode for each counter register.
+     */
+    switch (timeridx) {
+    case GTIMER_PHYS:
+        return gt_phys_raw_cnt_offset(env);
+    case GTIMER_VIRT:
+        return env->cp15.cntvoff_el2;
+    case GTIMER_HYP:
+    case GTIMER_SEC:
+    case GTIMER_HYPVIRT:
+        return 0;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 {
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
@@ -2469,8 +2495,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
          * Timer enabled: calculate and set current ISTATUS, irq, and
          * reset timer to when ISTATUS next has to change
          */
-        uint64_t offset = timeridx == GTIMER_VIRT ?
-            cpu->env.cp15.cntvoff_el2 : gt_phys_raw_cnt_offset(&cpu->env);
+        uint64_t offset = gt_indirect_access_timer_offset(&cpu->env, timeridx);
         uint64_t count = gt_get_countervalue(&cpu->env);
         /* Note that this must be unsigned 64 bit arithmetic: */
         int istatus = count - offset >= gt->cval;
-- 
2.34.1
