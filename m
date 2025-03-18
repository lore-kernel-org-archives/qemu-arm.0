Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694597njb;
        Mon, 17 Mar 2025 21:51:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDhaxmALZbqv5pA42F8AKw6dmaAN7MpG2NLOgve1GbgmqQPWOStsM4jm1tMO6ZxwukBsQoKMOPovYPCQ==@linaro.org
X-Received: by 2002:a17:903:22c1:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-225e0a75be1mr206686035ad.21.1742273497339;
        Mon, 17 Mar 2025 21:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273497; cv=none;
        d=google.com; s=arc-20240605;
        b=Ln5eGhxr7H2FMIekWIjeA1MKar+6Gm2wgrpXyX0ztA9zXfZq6rMD001rNiQ1HqIFVV
         BP79TzT/sUPWsjU8hQSWRwtLxvCCAJ7W3A+5hZUeaBRuZrKg+uwZCdjYZFcYyve2+ORQ
         4+ocX3BH0EuyKmEuauRJbPSaSHlzCeNLhJa9xzv56cB9oEoUpLPGeLU6vXW1SjIwrqrv
         GWp+YFUfKm1KMZGeT6xweKIgGPWH/MPpEwcYBz04vLL7aDQAmsf2+4yO9TtcgJCWhq5c
         fYppy4kJYspfI3wAdJEWdr1boBtTrTtGjZmdKslP4k9k5kJ4ny4JlNr0dBvfFq3J60PA
         qsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vWIezDEnsVaTp50avzaVFN+/54kZx3DW446tGxF6xYk=;
        fh=aqQseRj6GqNW+G89miJNfzV4ozVOdeRCT1uq3nm1PvE=;
        b=PP/Jzhs277qdtuIGLMY+ajewzLQ38v1Ik0kS62li4wkmpLM7SafamBndFmdnJ54po8
         sZWo8YQHL0G4mM2A7kNr6HghT6H8Nf5Uitcm2ulsvPFyRC3APU8gsGoBphAjE9Tl6RyJ
         YEgl0/5Al0KKvbs+cuC4bbmME4AeH+w194vzhJPe36vZg5jlKovGVSHXw5cmdGEb3LCF
         o+5CyGgNRI/3gsedgq/LNJsRqiA26qneMoB0r4xFmz8ni+pe0wNDNJAW26QbKSKkRJyo
         eDEpnNpJ6G7eJNB41Qkzdmg/pC68xA0uoX5WoUOz0AT8bAZ+ThYVp+nn23s9K7EydNSn
         dHXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bflhSWkH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73712bf48d2sor5411072b3a.8.2025.03.17.21.51.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bflhSWkH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273497; x=1742878297; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWIezDEnsVaTp50avzaVFN+/54kZx3DW446tGxF6xYk=;
        b=bflhSWkHjJvaYVPPgIrwLx3FApp8YgFn2Dg1a8TdCVF1PTjBKN2rylw5hPmk53wEaa
         l8uqxQ+7wapvDwQY/LdJPH3SucXkDCvYs/4Lp9hUth3S3aaYruEjRMpEwDnTbgRnY57B
         ERqUiQw+s5n75pJs7fYE1PcvwSIFJ8vIbFdyRP1JfoywExaAeXLG8ghVcCjCw4t6tofE
         0ScuhsE4vI+kdZOk42W/s1uLtFXVzMPkNcp9bb8ARjavwX4MoQSgOaGTgiYMEBgN70mu
         YhlwnH+6TSwC5DtfS+oNWb3816VvfIgwqtlyEz3JV0NgJwezA3s9V0z22I0s59UXbWCi
         LBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273497; x=1742878297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWIezDEnsVaTp50avzaVFN+/54kZx3DW446tGxF6xYk=;
        b=CflDwye9Fsuc+UbYvb72EtRS7LE5VSnvzK3hVNUeSd+h+njROFbe27c89EsCHZlvxF
         hwwyYPS+QmsFj0F3SOxcDLiQV3yJEeZ+UitlfYQFPlVMsvlE9JLNo9ypa3QXCRXUfUVN
         m601qqkF3BZPDv4c69UKA788ONvoIYzSYNdkkavevPpx8FiKY1VEd/6BAJw73c+e4lEC
         LKPzIRgWN7ZyAUZ6M2TERXc1KL94h5/1io6vciHwRI1jKaPDgNQ0qpXjiI5zQng13CBU
         F+QD4eP7JVbdK48sxLmlW8mguEH2V/gZhSOeKnWqAR9OYCMd5AFkmfnoJouX+CaCUSPy
         C3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUWifgAvIiQzSmJH6WoSWJiLGPvNxNsmFyl/DbPhpXBZhQ6jY+bcLSP/FJiHWkXXNuGNB3+ku3wnMY5ig==@linaro.org
X-Gm-Message-State: AOJu0Yw/IKe1NVMFQn8GNvpco/93gZ1ag5mvxsf0sd17ocEpeDhcaQ9m
	xSOdnqKJNdal8mvEW43KSb4tB7PikUT3BXi+H9kEVf0MXf69u3vc8/ON4neOSfO0KQ==
X-Gm-Gg: ASbGnctU4LDnwdKfE7ud6+OrhlVIvPTmBq7qQKfdSykJ80Kq+a299W5i/mWqzSjSxZj
	bdDvo99hra3mjxfgdBaOtGm99WD4zwR+w+byQ6q9s0FMZ1VnarhZY0UqJcllcNLPznQ//nR3IrG
	Z9xCMqwvHhfxe7Ghsv0FzXeMWhqxk6UHitlFUR35Wr0agiKT5bfMR9+SEjGdyUENvN16pgOgFnV
	nnuniJz88LK+tiFQHvHJhyJUQB+vjK1MzIEunOQi8qfDEPvwoaahxiU3GGmBxzsaOqLs62Z7JyL
	kWYTvKjQMfZaSL/uZhMWo5GtwulBOxLwwUEIgZSAMpRQ
X-Google-Smtp-Source: AGHT+IGfVS9r67mKi+C/QhYaIcplE7qOFrPBNlW784RCUzNr+6ZfRfHv2pwT7sOIOfbETdELQgrdAg==
X-Received: by 2002:a05:6a00:3cc1:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-737222535c1mr17970185b3a.0.1742273496888;
        Mon, 17 Mar 2025 21:51:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
Date: Mon, 17 Mar 2025 21:51:16 -0700
Message-Id: <20250318045125.759259-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pc8k1xYhzRLa

Including "cpu.h" from code that is not compiled per target is ambiguous
by definition. Thus we introduce a conditional include, to allow every
architecture to set this, to point to the correct definition.

hw/X or target/X will now include directly "target/X/cpu.h", and
"target/X/cpu.h" will define CPU_INCLUDE to itself.
We already do this change for arm cpu as part of this commit.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 4 ++++
 target/arm/cpu.h       | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 7c6c47c43ed..1a756c0cfb3 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -46,7 +46,11 @@
 
 CPUArchState *cpu_copy(CPUArchState *env);
 
+#ifdef CPU_INCLUDE
+#include CPU_INCLUDE
+#else
 #include "cpu.h"
+#endif
 
 #ifdef CONFIG_USER_ONLY
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8177c6c2e8..7aeb012428c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -31,6 +31,8 @@
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
 
+#define CPU_INCLUDE "target/arm/cpu.h"
+
 #ifdef TARGET_AARCH64
 #define KVM_HAVE_MCE_INJECTION 1
 #endif
-- 
2.39.5
