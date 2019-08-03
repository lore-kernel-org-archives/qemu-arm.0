Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201215wrv;
        Sat, 3 Aug 2019 11:48:42 -0700 (PDT)
X-Received: by 2002:aa7:86cc:: with SMTP id h12mr58761103pfo.2.1564858121955;
        Sat, 03 Aug 2019 11:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858121; cv=none;
        d=google.com; s=arc-20160816;
        b=KGqnAGTT1YDyN9VZsdaq+9w7AEkYbTq/LFwfEJTWh95JvsI7vVyBq6l9OhhUtgpKP9
         WsO6yQaMosSksGzl8uk7QDd9TLyk3VHwDEDDaiwCFeQ9qecMjl2J5DhsE6hYRPM11b/f
         zPzETyEVOJUdGrxmldpZb2+wSPqU9TBq4wGf/9f/8iaOhIwvR4E8DPH6Yzi8vopAcY32
         Q9qIF1NcXralZp2tXjosmnNysAjBqXJ1hfsv+2X2o1Jq31rboKrll5wO+26t7JUesqC2
         i8dnaA/+4TTapZfRHmbvuspI1eMoEjY6H1FKI6OkF0h2jgRu0oyfK6bydM+qzRh3QvGi
         qtFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=Ei1EJDOm2/MCfjvRsEeHF+k+WwSChqj6RWaPHvaV14GhplhUKd6mo7ljrAvS/GOMsS
         ALQhKy8uokh3wWBJ5zPQNy4fu8ddRURJ75fubY6VzjBkjnzJ/zHiTeXykEoD8kco2TZ7
         D8LV7Z/kBuSnZqrkeMuu1RIJEy4b9vZ5jpf3KHOa6JQKaFGsoWhPL7lNenczZKD9bA0U
         8ldIg7weAlPyHZ7LCGMlQKTa/SzZIby2TePScqtGxkZ3s15MTUj4jsjHXcmjY/sCYPF3
         4lP7xhaJFUXRgRirpmFSIAp2xOO4lyJtQEBliW8vLgcMgbGh/8sB8yIIYHwDHBdR25+t
         r6Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q2KjR7sz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u18sor60356949pfm.33.2019.08.03.11.48.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q2KjR7sz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=Q2KjR7szqQzFJBEH2NX0Shzd0whUpZj611QA5mIAYhzgpKlRBh5ODsGM5FpzlG4XYN
         E60p6k7knFLoG/3l6e6jb7NjxMSe0Uv8+wqgGre6LtOAO8f9GbaDAC+QVVD/ZN5iyITN
         lGdwQcy388XZhoO0jJnjvMrs8PgL8MKY8f2zAiABXU4jRRFArYBaW2DC9HbECCXS3boA
         MVFaJlKA0Jjiem7h2Fc2fVhhL4udB+lpnGcgR8fnzJZy8uhg7VgTozjHaTNGGsA68nb+
         pNMQWGe5juX6arF/6MAQUZs+Ue9hikLMS6b4/+dUo5QLrj218JfX5gH9w7La9BbmqPbo
         yNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=kHo7nbv4SEU2VNC6L86YeZdv5YbeOfLyPmCkk+8LdBwYtSuDgj+WU4ScCXo2aKbzEB
         dANJz84EnQnlVQXXC+QmrTOa/qnCCutxiV7KXkUsbArqu9XViwbXYxWASo+liQxgeb3/
         JZwVgy4mJ+2JcrIRUhSpjP4phehprdKuFFImpVFqQ/TNUPAt3qcSKzxolAxGkjbycgmX
         GpeSR6kCnZLItuvbPjpSW0KCcNgcUufcVVkntJCImoDR6YnT5sUjTJDqCPtswZRmAE2b
         cWwkWtKiREgMbVWHYmvjeSqsSNy8INySOG3d33ccuZyCwK0n72b098pR3LkpF3Hnq2GU
         c4YQ==
X-Gm-Message-State: APjAAAWU2fIxkMYin8qxn0D2EHu4X06IySFHoRQzFAcx/2h1dGMYL0dS
	Umb06eEsp1Nla/c+oyY80QkUknzW
X-Google-Smtp-Source: APXvYqwcpUfQm+lN0lAiyTvKZ+LKiZdqq8LkPAnYLxLczAXe8PepUtoBWVyUkepumSba4RRwsKQ6zg==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr65823645pfe.236.1564858121535;
        Sat, 03 Aug 2019 11:48:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 33/34] target/arm: check TGE and E2H flags for EL0 pauth traps
Date: Sat,  3 Aug 2019 11:47:59 -0700
Message-Id: <20190803184800.8221-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LW++nwekmdw7

From: Alex Bennée <alex.bennee@linaro.org>

According to ARM ARM we should only trap from EL0
when TCG or E2H are 0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/pauth_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 42c9141bb7..9fa002068e 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -371,7 +371,9 @@ static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
     if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         bool trap = !(hcr & HCR_API);
-        /* FIXME: ARMv8.1-VHE: trap only applies to EL1&0 regime.  */
+        if (el < 1) {
+            trap &= !(hcr & HCR_TGE) | !(hcr & HCR_E2H);
+        }
         /* FIXME: ARMv8.3-NV: HCR_NV trap takes precedence for ERETA[AB].  */
         if (trap) {
             pauth_trap(env, 2, ra);
-- 
2.17.1
