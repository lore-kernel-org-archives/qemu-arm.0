Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2081117njc;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwnqnjPJ6gDd3Hs0DvmwwKehQjwGVYC9FW9T02lEXPU8cA/UA19StBorahO6FRMrmtdBhh4elxfKlSuQ==@linaro.org
X-Received: by 2002:a17:90b:280b:b0:306:b78a:e22d with SMTP id 98e67ed59e1d1-30823646ad3mr19070828a91.20.1744644638137;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744644638; cv=none;
        d=google.com; s=arc-20240605;
        b=Jtx1y+0JF4R8le+L727It/AxBdRxCXEo7gbIs88kai3Sn3BJHIkzexAlqZYa4hcwZf
         Pq97Q5u6kOlJ0YDSaGy5xNPcUJu7iOqOGVkR3H/9zh9KYoZaCwDrbzjgCN4JCKXRTTC6
         oHtiqt+t6AbOE6WsFh2o+XNR9bmbAaVP2kvUahQW2z8Oz4Ql1bg2HJuo/JbErzRzsXw3
         YyQLoIULNJF06ZaYLyRTs+0hMPgLMhhWJEBbq17ba98MeQcrkxn8Be4woCdzErAXo3uI
         bM+0XaR4+ReLRl9yoqD6+O7tkO07TcgSsw3g30T9pEJvZPVZg76+hZcgTbo5Fo6Z/zJO
         d7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4SqoqmvVYlXEDRZUedwlOctIZe+hPz1e3t31K5AGbao=;
        fh=u5I6LA0PwHowCEnxXS96WoYLgjtiTKJbBD9Jkywx8jA=;
        b=gJKh02UJtUL6KOcIK+4DEnhM7OccW7GJy9w4PUf44VtmK9+/thtwBhnATF3qWr19hc
         troIwDaDx0IQ1hI4RDUN6vGPffuTKg83RJA/oNQWRAFVIYqQZfPQQnpNEG8XA99mBmAk
         l2CWw9iDF2j/3Glcv8uH6maKcKG5psJSR4zlXhTVdr+fotxSkzaEN7VGm0G+lCTnT6gj
         3MRts8gQsZ1VDB6HsLmmAO6QyCB3z0CiAaSTCDEKNIkSr23+94/+D+PqHdBuT2A/6Ww2
         aK1w/lq+ea3+nKzJXT9c7BiHDQoSqCsL5RMLk1oXUj8gQLby4kulpZT0lfu5xriZAfxB
         +46w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsl5Vizt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be10de431sor56421065ad.9.2025.04.14.08.30.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsl5Vizt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744644638; x=1745249438; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4SqoqmvVYlXEDRZUedwlOctIZe+hPz1e3t31K5AGbao=;
        b=nsl5ViztTDKgtGLF9lx+zna/mSwI+0axfEF19OLYXL9dIB0//bXH4CdjML8a/X3cgr
         lsUaJ77rVHkCTgIDuEMJlY1IHlRC5/dOoTAmjq9uLS4kPysZF9uq/2Gj5gDSy8iICV5o
         G/BR4c7zy8yx59vHiwxDteumMYCOajpjfu2TQMcesCr66aNCoqogSi/7pe/98mGhl9B9
         E4ORswvFn0L0aAfdwsVgB4zeYSj6B4pV3aW6Y4S/64NxRCTO46yl3x2W7zWmpJe+nI7t
         0kXxob3agoqt7pML29SkaMsWCDz4DFAqXqnIS23iwrmn4CuBNGPaNj/7UjJRXCuwOcSY
         QyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644638; x=1745249438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SqoqmvVYlXEDRZUedwlOctIZe+hPz1e3t31K5AGbao=;
        b=f1aEPjrXBcK8+bZ+x748fBIE6K3kRrIO5c+t4qp8NJfcy42xfBzHlboyk6MnL8uTPF
         1GnMCOiPlAqQxS5qviuKUVk/nAQ53wN+dn32HWYxrwVU5KnSnIQMTiKEPkPdhfHXXJIc
         p913qOaMRJneoDJ6JSkG5/XfVkEjTH3HnM+GyZtNyUtzeqQakqw1YQqk70N8ELpEAlJa
         eJsseyj2D0zieVCEdu5fSTR0biF20MhqJHYlFGnBNURHjmSq9p6tmQsmkMbrLfhb1kHX
         HIHIYed24AKCvzgs3HaLGfNPOVEo1zs/aBrrqNIcAYNkNyCTQgr+ikFPmbvTLb7ijzqo
         cq0A==
X-Forwarded-Encrypted: i=1; AJvYcCV1FXkUP3BscMR8G2Qi0ZtNFTrLryJfdYBp8vEYkLZLMKfhEZzKWIUV4bKm82anU4KUUexyi3G3z/1+dg==@linaro.org
X-Gm-Message-State: AOJu0YxQLsa9bFqv01Xf/MfImHBcf5fGQB/asod+d/5aw5ml3aCLVKvh
	qsasbyLoVYL1qDzhbISGT4zTZ72BMfJxgYKUqUDfasxsys1yffxxqU8xg1jk4xZn0A==
X-Gm-Gg: ASbGncvL/U+IFreMaGQKxuEt6Q+SwNOQgGtvGYaRRXwfHhU6NFi9jBLCScCl6dJtkrN
	erhSsQvJuNFoOJjKk8TaxAWRqqFzTGVh5jaBdAbcti5+6wUQK7Eu+LOa4zYQJivMlFyWpGKLiLK
	YTeGq3kWP+jtbIHA3r3LIVrdjFvO3nQDE9mK1dqNxYzn/LjBv4Ogf6ElIseFwvpHBxDVG60z3TZ
	RYwp2YTuLpu2PJeyHCEoIu/w1w/PxXCGJMym0E7dXrM12EUAOrxuZ/r4VOeRtTlHJn+jNf/n2tZ
	ztzLd9adNOf7BlrE2F3YGMNtAkv7sblt9EF5jPeWDTVHuBRA46A=
X-Google-Smtp-Source: AGHT+IE+WThX3iTgzLGFWycKu9s66OhSD+U0uZaflp9uYDQ89fxzN5FXdyPxmZmpAd91a7//Qj6vQQ==
X-Received: by 2002:a17:902:e886:b0:220:e362:9b1a with SMTP id d9443c01a7336-22bea4bccb2mr190376515ad.25.1744644636183;
        Mon, 14 Apr 2025 08:30:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbd5esm100735235ad.248.2025.04.14.08.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:30:35 -0700 (PDT)
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
Subject: [PATCH v2 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
Date: Mon, 14 Apr 2025 08:30:23 -0700
Message-Id: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: OKV89gLBYHMy

It was reported that QEMU monitor command gva2gpa was reporting unmapped
memory for a valid access (qemu-system-aarch64), during a copy from
kernel to user space (__arch_copy_to_user symbol in Linux) [1].
This was affecting cpu_memory_rw_debug also, which
is used in numerous places in our codebase. After investigating, the
problem was specific to arm_cpu_get_phys_page_attrs_debug.

[1] https://lists.nongnu.org/archive/html/qemu-discuss/2025-04/msg00013.html

When performing user access from a privileged space, we need to do a
second lookup for user mmu idx, following what get_a64_user_mem_index is
doing at translation time.

This series first extract some functions, and then perform the second lookup
expected using extracted functions.

Besides running all QEMU tests, it was explicitely checked that during a linux
boot sequence, accesses now report a valid physical address inconditionnally
using this (non sent) patch:

--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -997,9 +997,7 @@ static inline void tlb_set_compare(CPUTLBEntryFull *full, CPUTLBEntry *ent,
     if (enable) {
         address |= flags & TLB_FLAGS_MASK;
         flags &= TLB_SLOW_FLAGS_MASK;
-        if (flags) {
             address |= TLB_FORCE_SLOW;
-        }
     } else {
         address = -1;
         flags = 0;
@@ -1658,6 +1656,10 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
         tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
     }

+    vaddr page = addr & TARGET_PAGE_MASK;
+    hwaddr physaddr = cpu_get_phys_page_debug(cpu, page);
+    g_assert(physaddr != -1);
+
     full = &cpu->neg.tlb.d[mmu_idx].fulltlb[index];
     flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
     flags |= full->slow_flags[access_type];

v2:
- fix style in first commit (philmd)

Pierrick Bouvier (4):
  target/arm/ptw: extract arm_mmu_idx_to_security_space
  target/arm/ptw: get current security_space for current mmu_idx
  target/arm/ptw: extract arm_cpu_get_phys_page
  target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug

 target/arm/ptw.c | 65 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 17 deletions(-)

-- 
2.39.5
