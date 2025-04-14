Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2081114njc;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXFnjZNAFZ4Oywure7N+7zITeeFfnK/t5V7JvvxlUVnQ8Bf3uUtv/SSuFQX9lYF3zZRSzHBx72U+Czhg==@linaro.org
X-Received: by 2002:a17:902:cec5:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22bea04195dmr153613525ad.7.1744644637848;
        Mon, 14 Apr 2025 08:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744644637; cv=none;
        d=google.com; s=arc-20240605;
        b=jpLvZsaJ9FJC9egp1T1yAaagvOlA6KuAd6+YO7Wmqcr7B+UyFgJWq3OhOin6+Vk1YO
         vP1XkxgydUZEhnCTeq84bVBulSpkjBa2N/us5jYfvzl/h7+Q8RHxnpnM/gEE3fx8fYa3
         8D5xxIjhtsUPGAqxPhutKd+P90vRBxdZUjCTe6rUeoR0VENK2IDmmK/89q8P3DpcEXoG
         Ck/GFEVC8T8RRq462R1wuXCFdLbiCMngwofmy2kXmwj/P60AMRK7p4p5+35EkChvK8/u
         zLJKh8efwadOopFVj6vyvyQ1+MPXoAbyYomYcUCiJDtdCqNRyNew2Z92MwMxRyRvES+g
         tYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e2gWTr/bEI2XvQEhITW5r3zQts/Uh5xUtEqBuh5AV7s=;
        fh=Bk/MR8U5mcLDepy/YD5Jqu59gbTs1hTRfylT2SRk7rM=;
        b=jjRDPRVVnILg1YdWsow1tE0YtovrM15azTtchpAUW1LhLjsDBBkbTwH0p0kDtlEn81
         sRl5JV7tKCHLTumZFOkUCC3r7zTA2GpvaGkM076KXVC60AlO5RQLWmp6tFyelbWwk/oM
         PhYlXu4MVO8t3cLIm5ryl+2cgJiv1PLLz5KhQzLGZAEcZ0qvPLWtl8TXP0AicXaHKCaM
         5g5xw/h3d3/qsHUY2kVRBdQU6VIeVozOr09CTeoySsJbOKTjHN6+hEaxyOhXR2msT/LR
         AanQ6aLOfTqyoAG2WIY2k5B7MYqKBU2RFaXrnI2HQWrA/PgzJ0gsdPERyPUDNMhOnUAH
         trCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awy0KLfZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7c58d06sor59985105ad.7.2025.04.14.08.30.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Apr 2025 08:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awy0KLfZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744644637; x=1745249437; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2gWTr/bEI2XvQEhITW5r3zQts/Uh5xUtEqBuh5AV7s=;
        b=awy0KLfZmdxRXtBcaZKjFbjStIOepesYMzgQw6Giy1Ymi6T7U8EYfTZtEbpd/LAaK3
         clKXviniN+eME84qD072Cp36SLmQmtAxp96FMVZcERuyQ9OsGpsdFPhbqQWvb2E6kx6N
         RXctEiQoR3vHmCXv1tqTCWbDXyo+teF33a+CBQmgX20Uduoc9N4Jloqa0PhLBKBpbvgp
         j7c85LrMDxfMedczZaibE8BONglZM8LO7AofJ2+no/ROjWIqOao3twmrhC1677YVAeP0
         QF/ufBK7FbcLC1orwazuCHpN8Idvs58nRr/T/Gn2FpFQkdzjDvoxMv4xpMAnd0oKRs5T
         f36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644637; x=1745249437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2gWTr/bEI2XvQEhITW5r3zQts/Uh5xUtEqBuh5AV7s=;
        b=i7wv3U54O9XfMSGJbSxYVfywXbZlTGyouMlnQZwIMZY5JbABvjh7a21Vcma3rzCPTx
         ICIhnjgVbptZIdjCSfzkWB+2lu+4uGAnZjyHP/yZ/fG9Og4iU6AXxxsTPe21LrJGy0Fn
         PbVy2T+sUj86Zm1Q1I52GnZeKDxaDl+BcV8KQiXZqP/K81fBYhAsXMLXytXYO5aaGQCY
         YU+PyPbGqj7/zO9zDt0L5VLGJiyXIA6lg2f9hOFrLoS2412Xe+FZ7cWS67DCjhqdwHeU
         Ts+uYFqnX0r7BXumanfJ46ivJKHJI3+j35o2fhQqaYPvoGpkhc/F7HhONxNx7vhL9K7b
         /KSw==
X-Forwarded-Encrypted: i=1; AJvYcCWqDA6vE7/DUhqmSn8dyVhN9Q0FQWGE3z/VteGwAeM1l+ppJAhtko8YERYyuA70znJZsyw3J4qlJrz17g==@linaro.org
X-Gm-Message-State: AOJu0YxwbjGiF0dB4fKypX5FiE5IQjqtcQVYozyxa9vbaUePKePDEJbn
	o1VKkmK6cRQURi9KMgysEanROdjO7JuTlcl0iAStBPibfYT60TdMxobZw5bpzlianw==
X-Gm-Gg: ASbGncvETfGKDnGhrc7pPYV8frg54+pM/Z6ulP194I3BXu91LIvLEA/AB28I/ioCqSD
	DayP0g8ldRJng2t1MnOHKY70JrnIuF10C6A3bpNHfB4irVMKd+J4HVyC4HYYTy31Ve3zZWzlljb
	09s9Pq54cd35JtcMswNq10fjedk17CYAqJ7fDS0emsuDsQpI2B0tUV7BFItroQEe0uIrTN1s3DE
	EzNzHr5NNUYcFEjKz1bLp0hOD5re8jsZ1Ux00UOYYbIZ9WPh69i2GR8CwvDw/R9JU5GdWszVOJf
	lOEB2PV9e27m1rJBLwSgEAlMi0gSjuRMg7pSi2SA
X-Google-Smtp-Source: AGHT+IFBzpbqLUuWf7TRRgSDfzjiwrvA/CJQ6LLOqQfg0XUvByw/2ca4vhYKmhlUFErMeu2e8MHfxQ==
X-Received: by 2002:a17:903:2a90:b0:223:5187:a886 with SMTP id d9443c01a7336-22bea0c6669mr175815615ad.22.1744644637193;
        Mon, 14 Apr 2025 08:30:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbd5esm100735235ad.248.2025.04.14.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:30:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 1/4] target/arm/ptw: extract arm_mmu_idx_to_security_space
Date: Mon, 14 Apr 2025 08:30:24 -0700
Message-Id: <20250414153027.1486719-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WtkvaSZoBpEs

We'll reuse this function later.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8d4e9e07a94..fdc575ec8c7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3550,13 +3550,9 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
                                memop, result, fi);
 }
 
-bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+static ARMSecuritySpace
+arm_mmu_idx_to_security_space(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
-    S1Translate ptw = {
-        .in_mmu_idx = mmu_idx,
-    };
     ARMSecuritySpace ss;
 
     switch (mmu_idx) {
@@ -3617,7 +3613,18 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
         g_assert_not_reached();
     }
 
-    ptw.in_space = ss;
+    return ss;
+}
+
+bool get_phys_addr(CPUARMState *env, vaddr address,
+                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    S1Translate ptw = {
+        .in_mmu_idx = mmu_idx,
+        .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
+    };
+
     return get_phys_addr_gpc(env, &ptw, address, access_type,
                              memop, result, fi);
 }
-- 
2.39.5
