Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp42084njc;
        Thu, 10 Apr 2025 14:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaXNHD8xjZicfdb+XysMXzS8OjkqvemRYaFSZGwEGm9HmXmD0aqm+jsrY+5z9h/+eIjG5rMx94am42sQ==@linaro.org
X-Received: by 2002:a05:6a00:2e27:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-73bd12657e3mr381256b3a.16.1744318839791;
        Thu, 10 Apr 2025 14:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744318839; cv=none;
        d=google.com; s=arc-20240605;
        b=dd0pV3fVMtddYy0s8r+5Bcd+S7ajAe5eN5syMj9fPZDWhuoSeIYbjZTPP6QG20FdNW
         UMxkvk4edhxJpsitS84qh5yoAWR7yYm6n2cFkE1x+0gy6tR4WSlBMesJPJYqki2mcJq/
         fOFYggfsC6s8BDgu7e60D+Ws1UqBezaS11mydsULSi0H42meULFXX7XceF9WLKBb8jFD
         9C5BjM5X1IOsTjK9O0AB8NrG1YWmc9tlJ7AFWcWyp+cP4iFthxEpuunGNd//I570B3uE
         j2H1lEC2lmouMlMaWEuE/OCOPO0VCG75hUbCAqc7hAEgo7Kxm30a/qaozqnQS4Aj7ur6
         nZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M9OwVMJQ+nPgoXVT+v3WG48aEZrZJjJFRvNoKJmm5KU=;
        fh=RTHUnwD9TEfrYZIuI1O++0OavyP/e1qNLIvBMFVQi98=;
        b=MqIUEoN1lvq6OtBwyu9rPMeV8tNDWZrX6/NvflCpqBOam5RgL1PKSXsC42XZ8fqIPQ
         4Nc2Si+1QbiusVdqxt2f+qDSJ8lLRJUCkYEK97FWsK9qCBgXOuBoyd6bJGFJvZdhoSdM
         GL+hOzfZeOhCTHtCxJiUvlVL2GShIdr8rUvsmuKmDotXdwnJCWZpvftYvNvUPtez8K4I
         0XbMbnQD/PuFLT3VcbevL7HjTX+ub1ykXpm+mHcpphSHZrqrJRNOpv8/Pq+es1vCAflq
         LxoTC1lZcxhaqr+2ydGik6Z1qMnXveb6n9b1mQXvAGRLMxsXM6BNSvruflnmaxMKdjRl
         BIJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V08Ws6Ip;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bc26bcf31sor1444305b3a.2.2025.04.10.14.00.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V08Ws6Ip;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744318839; x=1744923639; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9OwVMJQ+nPgoXVT+v3WG48aEZrZJjJFRvNoKJmm5KU=;
        b=V08Ws6IpImI1HceY0mJot1SUM1kTR9hou38z0gGMoLflnvUAvIjkYIiskFT9hVMjHP
         /RkY2K5oWoQMLleEvhIzL79mfNFvdqeUK+A7XMOiD8K4s5dyEiX0INdT3W71qKUYkPae
         STVzC2odHBlabS9AlPje6JVc5xkEYyR9PLExLjPswBuTJmXpriig+VSxXUtnYh3+hXFk
         TLYO7bS6SLg4+qowCQjmdT4EgW1wRdmrw5Giu83AG01q7vhk3Pn3LZLfiwvODz+a1PoR
         0moEa5tZA5Auu6uVptXoGSlKSCMPTHYL+kv+DBU8cj6Ld0MFmtg+fvHvLAMd58JW3fxt
         62fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318839; x=1744923639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9OwVMJQ+nPgoXVT+v3WG48aEZrZJjJFRvNoKJmm5KU=;
        b=K8UMZXg3QCYOIAqWhLvc2UE+k1q1+vfS9uffFW6KQNWDgfKWy8CqU8bamtD6llw9U8
         YjLwQZRkp3dW/loG9ucP7h0dMV8HIkSnxDa+/s9KCJ+TNuFJNR1zaE9CNOIrFkpxvk0T
         aur4Um59v/6PSvVNCVYrsTnzGME5BP/D8V2ezWy/JA4maJF+GMGHhcXKMjxB1ydntMKV
         GwWvd2vAgIS1d36RqqXv5SvOaU0yg4ukMVJADTERZnP/aIvpLTc2V09d0oVhSeqr3DNb
         gSaooU/fo7tx10p87qx4jOj8RBOI2rDRd3+z/1QtIChPUNJLPjlXVCDZKRxykkyz8neU
         9OOg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6DC/kG8utwImswEYDVjybOzmtnCHhn34WWi+l/A6zMA1E40JWhYg3EXEg7Lz3a5gvkkBIPTZaOCfug==@linaro.org
X-Gm-Message-State: AOJu0Ywx1QEtlu8pDheN6HMXr3s9g8EWFEYwqkhr077yzyswJkZ2PhcP
	4bSTjY9oRtIj6HOORuUtwkfCj45CcxoQs4lr/IvUWcMvtYlCiRZSUO8sJ2gXa0SJdw==
X-Gm-Gg: ASbGncsSqvaAF8SkTWDPFeWH806F/lgGH7OK2nqzuAp8xX+HpRV+5PWs70ysiayj7a/
	Z7CT56KKsAb4hQ8tRoU/yonK17ZAqhCJaWu4It/VMevarNeN1T59geqCTayu9vy/2iLjTILepr8
	6PfWAIRd4ajPYYLGypVPV/Ywn2WG1KFY+1bKy0uXkwFa9jtolD5xFter8+Pb1TcUsQ0px1gQlmD
	m50WwAwIL4wd9Lc1rOT26+DmLJQpbTUa+n+5T6D2B/YW+PVRhfoXNs2ZN7bUltPQwvgfaR1XE1p
	7OGiv8a32B16Lq7hDHQxHyGZxeDmlGD/BzP0oTvR
X-Google-Smtp-Source: AGHT+IE2yp1m6sBCLp+wVAJ0VFY7M3tuLn6xaXJpPkEtHMIenwsxdNR9U7U4c12ls+Lzhnd5joWPeQ==
X-Received: by 2002:a05:6a00:2284:b0:736:34ca:dee2 with SMTP id d2e1a72fcca58-73bd119993dmr361114b3a.4.1744318839065;
        Thu, 10 Apr 2025 14:00:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm12431b3a.90.2025.04.10.14.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:00:38 -0700 (PDT)
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
Subject: [PATCH 4/4] target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug
Date: Thu, 10 Apr 2025 14:00:22 -0700
Message-Id: <20250410210022.809905-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ru+hRrwvnc91

It was reported that QEMU monitor command gva2gpa was reporting unmapped
memory for a valid access (qemu-system-aarch64), during a copy from
kernel to user space (__arch_copy_to_user symbol in Linux) [1].
This was affecting cpu_memory_rw_debug also, which
is used in numerous places in our codebase. After investigating, the
problem was specific to arm_cpu_get_phys_page_attrs_debug.

When performing user access from a privileged space, we need to do a
second lookup for user mmu idx, following what get_a64_user_mem_index is
doing at translation time.

[1] https://lists.nongnu.org/archive/html/qemu-discuss/2025-04/msg00013.html

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6ea39ee5755..5b8d84d44df 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3655,5 +3655,25 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
 
-    return arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+    hwaddr res = arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+
+    if (res != -1) {
+        return res;
+    }
+
+    /*
+     * Memory may be accessible for an "unprivileged load/store" variant.
+     * In this case, get_a64_user_mem_index function generates an op using an
+     * unprivileged mmu idx, so we need to try with it.
+     */
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E10_0);
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E20_0);
+    default:
+        return -1;
+    }
 }
-- 
2.39.5
