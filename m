Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396920njc;
        Mon, 24 Mar 2025 21:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRsg7kk3l42vmM9JuFiAXymW3RzH3A7Xy4UuWfj2/AqRmbaHTpVc0QBxcG3jRhrP8Zp43JunFPH1ghmw==@linaro.org
X-Received: by 2002:a17:90b:2f4d:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-3030fefe11cmr20760718a91.23.1742878765139;
        Mon, 24 Mar 2025 21:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878765; cv=none;
        d=google.com; s=arc-20240605;
        b=MoQYwCEvYx5eUptbm3Eag1vnfT1LpQvxfLEW7bVNp3stnunQm8/bUzVvJMWRZsM6i3
         kAutyDVDBwkdbKUTED2JaI+RmEPzYbO7Uy+FqjSRxXQK1VJWWzUwnXZ7fa6ovp7hE4Wg
         9jbuqeMzEYlgd2d3WUe6nHEFNTwpgI0PIVrfVWmkVQ1flYULyPAIICb5EAwisq+Zlphh
         vflSxVXaWKk1sZTkwJCurt+ScPSiSVgrF9QFA3nWp4XdshXSslireMdB0GA6veIXQece
         hNtguWPHH/LLJIDQU/7CZ3EXrJ4/R97E2i5I7URr0mthaZbnnJr/7pgWkUhPAIYJqIgX
         Lagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MN4UgqEwiL4w4rQY8ucWfe1J0m6eYAX694euQp2wpb4=;
        fh=Z7DabI5zyEPVmjoltI6owEv7FO+RaNt2LS9A2/C06hE=;
        b=N4Y8ReJhuwCzRRgujW1r6kCJ7Ff9co+vJa5F0UsKcOEs9nxdqELLOrR9JQWzLma4um
         NLxnsdv4MyvtSn8k5yHxpzsQZ2L0d1GtQG82raE9E8LHokdLR7y57tObdOAoaVRjEoTr
         aajPAM2pu+vBOrJeKdoTPddEIJllZXU6Q8VW18UZ1ewuQa/UIA8gM+wf/jUO9y7B/2Bq
         yDAh8RXe7PiAb/+FYsps4pilQgthgw9Rh+3JXe4rrr9oOGIvkmed/hZrfkNZ4F3XqE06
         IXafWfHaUoBxYkB1G4hJhEhRPSCFI1MEX5cqqcNxmGKfp1KYdFg4v4H6Q7BKFAzVaP3q
         eOVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KXf6VHhm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5c69efsor7612772a91.2.2025.03.24.21.59.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KXf6VHhm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878765; x=1743483565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN4UgqEwiL4w4rQY8ucWfe1J0m6eYAX694euQp2wpb4=;
        b=KXf6VHhmUrffkg0NWoo5IR9Qdtpo5XX2Ps5m0Wqq5eE2SietNYTq5lEp7NloQOdQVW
         Um1wMMD1GcmIHfirvCLfaZ8uhLfgQQRTqXg7Y/LRySrGTA3+WTOQRwPaKy/xajxxDQSu
         RpEn/bS3jfUQez+Air2BWDvsGUk+3VHglS6c5c5Jw5bAX/vkACUMVNbho643SnLITThT
         J1PikN9oHrFacj9QhF9HL7YkzgI+2aTYVXo2Dssq4/jxJ3O0Tufc/li6hiKAO+q3LEsA
         gKBYwkFqFxWO6DnzrV1wpJQi5y3eiTekKEHKcEV5mNvRCgrzuLDlHeHsYAPLsanGhvfX
         5Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878765; x=1743483565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MN4UgqEwiL4w4rQY8ucWfe1J0m6eYAX694euQp2wpb4=;
        b=MQqeVozAATA/5heWNYzURHfICf7Yaxri6uAFwEGXQG6elcmIZO75TTpZzS0alRwISI
         tjqS33N6kUlaFHZb1D0ufw77sWqRJ/wFGWZ4KSuSMFTI4gHeXyD4gepErruLz0gCq4aI
         fqwN99Z7sS/HVv5mlpYajfNXvVT75s+VLXxvzhpm3VqiKfK0ldKS3OkFhGX6WLBmYQ+r
         armNvhLpad0TJY56yRhqnTD0m8gBwYcX2q1CihIkBVLGlI/OP5eN1h2k8996H9sLTv37
         Awjj0w4gUWXFB1R7ycBrIaWOIF0ETWZbDsJ4dL3tXJbsrmZPlp2cRWDict/5GXKhfjuP
         imTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDDX1uQsIhsxn3b7slZxTlzoSsL6qRH2YKR253PCizAz6Rc/UyM2Iveq5y3hI5OAIwKKP+cxplXX1vAw==@linaro.org
X-Gm-Message-State: AOJu0YxzIVVtnoloavssyQiP4GW3zI9WTrETi5CQrb8lpeG8W2Y0MdDM
	jugvmZV0IMWZREfPYQEIjoJW0+D4HyAhlDPFHV2rZjHF4BL0PzqHTOTzPRMTUzgmMw==
X-Gm-Gg: ASbGncsoOVc3TwQfyvEJL4b6rVm10drDZ0cNN/OCivedrlcwSWJ4XB6KwpO+aaAUHhc
	3BIPVGd4+/0/El4Mc7TiRwLg9fn7I95zrp1Zezm/Y+NxpWqx6lrcjC1EOBxyqYV0Mga0VZMlgbk
	kiySMDWQua2q/qzzZWrwZlfaLmdDp1cR6fj8JvPN4iKRQSpA//wI53pamBE3vDViOjGOnLZsCK7
	rRY0dT+CMoDcucOX0g7zbsQjm8H4yDuppyIWbwsRQZBT+c7U3VS1Ix3br5zUdtqkozWq6H6VyTX
	F7IDxC2J9YmW7jvY2q89CEW6/+QVYWDFKl7D2u8V8D0e
X-Google-Smtp-Source: AGHT+IEhdiwVNCAUxVqAXEujnJe80rlTseAWcro62yNqBId6GD4J1Z8w34u8f/q5GRpM3AW3E012lQ==
X-Received: by 2002:a17:90b:4a08:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-3030feabaf5mr19365794a91.21.1742878764496;
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 03/29] include/exec/cpu-all: move compile time check for CPUArchState to cpu-target.c
Date: Mon, 24 Mar 2025 21:58:48 -0700
Message-Id: <20250325045915.994760-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NvaxtpPmoF+h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 4 ----
 cpu-target.c           | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 74017a5ce7c..b1067259e6b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -34,8 +34,4 @@
 
 #include "cpu.h"
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 #endif /* CPU_ALL_H */
diff --git a/cpu-target.c b/cpu-target.c
index 519b0f89005..587f24b34e5 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -29,6 +29,10 @@
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 
+/* Validate correct placement of CPUArchState. */
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
+
 char *cpu_model_from_type(const char *typename)
 {
     const char *suffix = "-" CPU_RESOLVING_TYPE;
-- 
2.39.5
