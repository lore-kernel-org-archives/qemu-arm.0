Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp42064njc;
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKAFqSdC8peDoSpfrhfKBx0/vJg+Vk/EfotozY4ikzvdn8QQB63Cs3qJLeKnKnjtFXJ3G+EG9h2qFTnA==@linaro.org
X-Received: by 2002:a05:6a00:4608:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73bd11aa506mr359405b3a.1.1744318837615;
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744318837; cv=none;
        d=google.com; s=arc-20240605;
        b=XSQt9A3uwKGM936hYbpY+9sbPFEYR0VKSWIFudYOtMB7dlRmlmSXUrszbWu9K/875Q
         rNq5cnL4yc+PBgS2ZLeSjz4jvPNOO27iBoo4QV7LzFezD/hshcaf7/C8D9PSTOAne9FM
         S/Ex6tu7Fhn3xoP6+K1/gQbg1YhLBqNN2ykG+7RR4HWpeX/lpKMXOb7A0nfs1vpACsLP
         tHYuTud8jbfZXMMXMUn9OA7ynxUBtS70A2yS13dQ03sv1aGYqXXvLJDRs4jLSp/ixEB9
         NsOoTrqQtW09VG3wxMuFwDza4RXQCAHhe/zbBb2/ub7znMH0oEXHMfopFegkFckm2dCQ
         s4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3O+ATcLarMi7TZZVeImu0PwvfcFGKqqf7QjA5Mk9PLE=;
        fh=wqvW8Hwj7nDTofhnpUTXAorzC9OJyJQvGSkrkw1ndxc=;
        b=P8Tvgj8lI0otDQYMwCoWSk++x7Yq7HveFlDItes24zjT7Xvb/nFcwC2a2VvvErSolA
         ov36mXFRUUwFPWlZWSerH9AHAFF9qgImNPaKV6aA696WGx7hpxSLkzhMDK3e5XJVlyB1
         ZOlCTw+OIY65iE5DVmc1Uvn3JQN5EwASF4oeryOx1p073QKRl6w4tae3hzuq53KvlZXV
         Xrz1QhxCoaXB9+VIOH8dOFrXsjxe/LgcgwIHV6zH29vYaCr7tVXXOR62ahQcvCPSGzzo
         sgDD/xUp+XPof5B5+Eyz1lWX70b00mr1+38kZ1Siz/k+5/NkacOxS6eGu9fUdBA4XlHu
         ALNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wsXTCstY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e6a3easor2508377b3a.10.2025.04.10.14.00.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wsXTCstY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744318837; x=1744923637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O+ATcLarMi7TZZVeImu0PwvfcFGKqqf7QjA5Mk9PLE=;
        b=wsXTCstYv8HiSwFWzq5P5i+qLJGTb39Hk8zJ50r53dvSzGuOiK/0Bf2kVYBYnBY46J
         T0RUpIpMr/NLUYaAQmys0sFueDjLhJSG6d/KV7TvE7Z9wOkLLF5C7zExtAhpCm44TiEw
         ATjOhhJmEoOTZ4WFXc0W9h+2aE95PXXUgi55D/pHyaWVjkWyvx4pAvTrm2iPo5xQpJic
         lFGZc1svCD+7D9kpxX+BaTn0hjGy2fDidFzXeYyNc4zPwft9KqsEk8KJnFrD+zfqR9Gr
         BfnYmBER3W4KzWRogyFgq+Q+irX8/Z4IWIxS6gVrSEB7vuMF+NqAR31kTEtkzmAqAcBw
         FBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318837; x=1744923637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O+ATcLarMi7TZZVeImu0PwvfcFGKqqf7QjA5Mk9PLE=;
        b=Usy1JB+Lo0zwSa31MtXBFjKNZSEMydpblzmccN2fMWbk7KrppLaL5bV8F2wwprzM6Y
         e+M+zy/tzoiufWQK1YAo0tx2DdhpCU8ZplCvPfApmfZdcRf6+MXVDGgLgZ7lI72MEBtc
         TOyGiZxesClFWv58lx3nZJG5Cc02W9YG2YLxhOODX4pTrSa95s4r5d+fgaer5JQ1V0Az
         WrxPm/qcFfkYf9gEXINQMAo7O0Pcz3dW0xnf3Yj5pP+FI2ic9YNfin+xg8iBoDdv3uh2
         UgCVflm9rmKsbM2f24OZWC9HZwVNbIBowdRkjfWUhNlPiqlTe5d3tZf89df6FbdeTVU3
         In+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfpLthlz9UfoYpZxi04Ve4OTrz0BfluVghxt7uh5I4qvg5UgzLcVwipXzI0s0+1VzX7I/VNYN1BlMaKA==@linaro.org
X-Gm-Message-State: AOJu0YztgQX40Uy2qPPVZulbWi2mT7AWsA20LjJ+eOZmmPtCy4oqFb+k
	+o3EuBi+2D7yIewk6Z55UDINfddEUuHmv2XWiRtjhP+/tQ5eiQ3f+xEa+RT8FEZ6uw==
X-Gm-Gg: ASbGncsHY3rdjZlIJ8qQMa7nBRif0b6KEzuiaLq1khuAeYtB9lOMQxG+HUBA9wpb4FZ
	AnJubjuaKblpEsV0FlpOfaGbMKJcMK95UcN7i9C37pes5QXjIzzkghau+RC4GQ1qhsD176sbh+G
	NSxbEe7kRvUy/HO/Zv6Mon6bUr9DmfvFGtM/GYtvEoFtjLhexYLuWVUG0YTrq+Y1xrNMfLk95Bh
	xDop3QZLu+InifWaToXBor9+LSRJoMoKDbzYc+jR1RhHBBc2TMdqedBhGyjxLPoGbVVAd6DjN6X
	yUiqyWhEAp6cyQhNwKEpydKgHMHuYoKbzPTN4yYE
X-Google-Smtp-Source: AGHT+IHYmNsR4rzKKdqHaVRrwg0X9ECfGeohZSUpsRRprGst6uEADC8CnJXXG71yiK/pVkD2wl2tgA==
X-Received: by 2002:a05:6a00:4644:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-73bd12b1315mr371116b3a.23.1744318836380;
        Thu, 10 Apr 2025 14:00:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm12431b3a.90.2025.04.10.14.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:00:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/4] target/arm/ptw: extract arm_mmu_idx_to_security_space
Date: Thu, 10 Apr 2025 14:00:19 -0700
Message-Id: <20250410210022.809905-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: a9WxNKq1jY1J

We'll reuse this function later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8d4e9e07a94..5e196cfa955 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3550,13 +3550,9 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
                                memop, result, fi);
 }
 
-bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+static ARMSecuritySpace arm_mmu_idx_to_security_space
+(CPUARMState *env, ARMMMUIdx mmu_idx)
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
