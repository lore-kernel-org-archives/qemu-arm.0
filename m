Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047829njb;
        Sat, 5 Oct 2024 08:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKmqUbhRJQ8bX9e/8XhAcD8FMRuPU/WOiZ08oeNiXiA5zmze9R2IgkyA0s2q9L4XcTyof5IXBKKB4IIA==@linaro.org
X-Received: by 2002:a17:902:c942:b0:20b:c026:6a0d with SMTP id d9443c01a7336-20bff1a880cmr83702735ad.38.1728141963968;
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141963; cv=none;
        d=google.com; s=arc-20240605;
        b=jI8TOuXd980MwpRwgaNLOhvufXUMZDpr10vWxpIDdDxc1uPwfmR7DdVQHPkimL7gKH
         P45XFPXw5FCdgLEn6b9BzPzYBu9Ja5xxLPCsvOReyf3Z9zGsDZGlORpTT8ieZNv9TdGD
         lRKQmdFj9rbjAA5uu4hsza4fkT8t69kBJLXdJMBZnkej9YVMRrv7N30ittxPnFPXmCO4
         sKmaKHZ46P9+zlxCZ+3rLflBmFGvTDtXwz+ScpiuoCWHNf/UakbX9yAXKZCcKgdbMh7A
         RmR/dPXhxzgQGepGthYM158Gkz3WryZRGtGbns095k9pisJ+ljD1hCxzHBMIlGC6VE1G
         dlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        fh=Oa+25zconiyqQDTtk0tOJRE6VRnkePHOxAiwd3l7HNE=;
        b=XrnhDoyWAflbBWs4fj8KrGNiPWNIVyziYbAHULNKFgdPpUmJ2r8XsgTxbLnORkU5NO
         ZRRqjhN0NwnL/j3TNJemlZyMPMPfDSuZvybP50MssDlTVdUdg7A7mnN3kQm/jE6s09Gs
         Bg4JzvDcd4KtBvRqL03zr/dErPZ9ye5AE/ww1PxFq2dWXMrNavTyRUTqPAGD7ip2FHHO
         fiiGrXbe/vdGVTEWpp1BPdSPe2ynoctakmjHGW8IpJ9DV1RHXPE69Uu5OFQflVNghIJ+
         5iStKGELsoTMnMSMP1t5Q1RujbOeW2SRfzqJwZH9859ZX+TtegZ3qKIZ7Um6rf7gHf7K
         AvKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKdmO7gf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c139a2e0bsor11598285ad.20.2024.10.05.08.26.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKdmO7gf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141963; x=1728746763; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=SKdmO7gfR49feVim5r1CvPndFuBe2XvA2p5ulbilZ4vvbHtMFoweCqusRC/ZaP0XyX
         sPbCe/CF5TsyT5F4xowLdAGLi2/7XXWH3MfFWmkg4gX5cbi5iSo1eyYn7Iw8n5k212Mk
         cKuUp2lFkaNc7DoZ+74x0TEuX9T0caoHm7FOxuLy0hwFs/QtDoeYgc3fwvMDryoDOcaG
         bIZsqD7k3tkbqFbt9rAswMUTMXY5K+3ipEXoCRjv26Clhd6mzvKxfXH6JK31wR6mmXvd
         H9YWIg5dwW4G8roq2drKvf2PTu+7YNlMQovhYByv9NUToIVL+yL1T6fRB456tgdAmRI7
         WTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141963; x=1728746763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=uohsXMw3tZ0IatfL6t3xLf86i1o8qN5goRq2WTPbpnS55fNGAY8hkn+EPBIGhPDLx4
         1FmOJDYJ/5Hwpq48NkIMIFKGfFzERr6DhH0FmWnZS3NK3UKIMTLm6wqQSt1P8kv1+ZvY
         JzrB+dZExyZrekB5BQmf9qesww9CveaMG+BjMc0/PTzr+IL73EDVbrAJoGcxGMT9CWRI
         BWZfSWsU/a+plEI+ue1/gpmo2Bpyp6QnYJybNCv9YLX0XK7byUCsS0cDsNfuN5r8HBJH
         roaFnRcm3suOVIaQc5UaHFyboWR/4KZJgBwN1B2Xy1zRWCsj70Jt/7NudOhGX+v8gzGl
         tA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4+1/+nakX6ZaJbjsAb/G99dlRGBXovinIsa5iWQH2tpr3c4F/8HtWxiLLQMqEldzLunXBQ+rWnEFaNQ==@linaro.org
X-Gm-Message-State: AOJu0YyDny2VGhD1OuqE6j3Vz+h7eidNgBDGuUhL7bTZqGe1ql1v0sAo
	XFwB6SKHlaMCGldVUIkhQkDES8XsY+t/E3NzChFuMjUwSEWWOJoysyrgGGlyOE4GPA==
X-Google-Smtp-Source: AGHT+IHoHMOdQJhz/hk6oo5QEC16Z8Yklqh5lMZB6Txlb+2L2pMHFtFjRuBs6OrzX6SPGfE0OUkqtQ==
X-Received: by 2002:a17:902:f788:b0:20b:8ed8:9c74 with SMTP id d9443c01a7336-20bff1cb9d3mr97600185ad.49.1728141963574;
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 11/20] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Sat,  5 Oct 2024 08:25:42 -0700
Message-ID: <20241005152551.307923-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Hf2Hw2zZulS0

In Chapter 5, Interruptions, the group 3 exceptions lists
"Unaligned data reference trap" has higher priority than
"Data memory break trap".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f71cedd7a9..d38054da8a 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -221,7 +221,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             g_assert_not_reached();
         }
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        goto egress;
+        goto egress_align;
     }
 
     /* Find a valid tlb entry that matches the virtual address.  */
@@ -323,6 +323,11 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         }
     }
 
+ egress_align:
+    if (addr & ((1u << memop_alignment_bits(mop)) - 1)) {
+        ret = EXCP_UNALIGN;
+    }
+
  egress:
     *pphys = phys;
     *pprot = prot;
-- 
2.43.0
