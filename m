Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp42036njc;
        Thu, 10 Apr 2025 14:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYcIz41DmPrQ8G9/IfF3sCIZTjMxgoymXymuHrnOYluyFtgYYyB5RT+h6yFekM3uCfmDM+QaHHU+VlOg==@linaro.org
X-Received: by 2002:a17:902:e884:b0:224:1935:fb91 with SMTP id d9443c01a7336-22bea4bcff1mr3509665ad.27.1744318835737;
        Thu, 10 Apr 2025 14:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744318835; cv=none;
        d=google.com; s=arc-20240605;
        b=MnsQdLCi+99sWnZZgnOmPinT4DYi+1cxIYMs8ybbxai8NKTJCY98qN9hovZp21pPri
         Oj3UeTrA4IZIlG6khredXevR2AQ8URlQdk9ildmqZbPXaYxVZS7DxRLf4H3Y6s3f/A5z
         M2Agvj3d1P826ljwEzTtyTXet3KrnMTCZ0y+vqs7ybgKZFFG0GzNArLC1jlshHliRHYX
         VsO1XLfGROrIMVUvzWwhJYfBhhukDRK5sr31OfjSOsYqrXYrA06ZwzFM8W/qblFI3lJh
         FB9nzOaJ3EM4QgGOIYQnDUG+L234aSDDpB7hlhnore1CKSitx8w9Qm+31l8Vv/gdFXKe
         rA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Crgd4oJW950tiGNM6qh+Yr/oflVQVrvIxSMd9pKsNKo=;
        fh=gtv1Wecnl5HxdQh7J4caUF7TMlWxOfsq9Vr9F5eGTns=;
        b=lHU3/bOvAyoNwV3hePOcDCyMrSJIS5t8bNZrw+WbhUA6tW+HKV8H5hesplqU/6tu7N
         /UoGCtHPRLv2uMO1QCodPg3cNuygTgYIe9k9l+lZyoA6/fiAARkU7pI33iDQ6Q+9MnO0
         0AkpQN2vyMBuntck62YoisH9WeFAUSLCEzD9RIHP3zUPGF9BMXMQo2y/5Sfcwft6v1Kt
         e7KLEl93fN7BpA5H1NSMAQw2Oy2IZgZT1j94ahLB4ppjqrei1XzIZ5hbsR5JATIiaJyq
         ECtvrawTS/oClBjaY+xtbWccB1ON1JDqxCI9ZAbvkH/5vdY/C9db1jxZeldvaMDAUycT
         z8NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMZKeWtP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b899f3sor28529495ad.8.2025.04.10.14.00.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMZKeWtP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744318835; x=1744923635; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Crgd4oJW950tiGNM6qh+Yr/oflVQVrvIxSMd9pKsNKo=;
        b=vMZKeWtP6JNmLcTDkdnewRXRnVuPHlcOBohMNtnFCkLx2v8BtTQxpAf9YHEJU0H4ma
         gO1uf01UsqXSAm1pLj3cps2KLg/x0WMk1K1W+xN7p1ZJa9+Su8zO8I1EUr6dr6kdOR6r
         3EYz8yig/Kdj7gXmOybjc/NVlD+zhulUnzv8bo4qFUsmmwRzN12mp67KpruxYW22L3Ua
         rqMcA+KRcfCOvIrrUzorPdhX2UeCE611DH04nJqlfTInTH4km1hRV2eRUwPLBTm2Lop4
         apojJ4T/+OLCJEcsl32TrPDHASmKEPsEA6IqPmdwI7lmSg72yiX9qqaMH1oNFPTxTghb
         +vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318835; x=1744923635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Crgd4oJW950tiGNM6qh+Yr/oflVQVrvIxSMd9pKsNKo=;
        b=YsJovBvETY8BfeZQSmOxGfHos6vJlFvCp7WV8BkpyBLGrjAlJNy0xRwmkLHKDwnFHQ
         MYI2MhV3pWGX9zSK/QIgeiI4yIfkOdru/FSS+D6hyun03u53ylP/Jm1qJLQzRbztL617
         hBlbcog11O7YkcyfMCpqHndjjRbx46LWC+NaG+l8ZxMTcjymvchFnmov0I4FoQ9/u2Zp
         dTrna6BhU0v1Pp8kJNGxyDXoARzLk1579bl6wldkgU5IPslO3uFtIXdWAV9gijTQM7FZ
         pH2MrTuFAUHO6y/mKdvk4sm3dRpPSKPXk/X0ZepOm9vbsgNt5g9IEsjCaZwKonRjwVQm
         2cKg==
X-Forwarded-Encrypted: i=1; AJvYcCW10nB/UAs/TKcHqY/eqkG0KMMxAtx9JZJtshpbqV8E0LJqmz8XIOe2NcEBaw6AR+sBhuaz2UcMKEJobg==@linaro.org
X-Gm-Message-State: AOJu0Yy9lDIn0wuQY2LCLfjMiiNC6VuVc1G761Jb9m+j5PSXy8xtNoOw
	Oy+hj+zaf1NiN8UAMyiSPlBckjYg4xLS3aW6wAjK3r5FRcQwoWQWd6Lw3Zec7VJyow==
X-Gm-Gg: ASbGncvlWZnrveGcf/8owpxkmkiyEc/8KAjl4ds3jcsDrRIFViybsF5O02hM/xEp5X2
	36ZjnMazxTGZcWrSKDIoksj83D1O0BcXZHmm8kekoBgR6CJP8aAZ/iY9TqFlbmw4mLkAR4i53us
	0lYXFXl3o7EBbpJeot1H73Jv49JjKIIOeaZ3piigSWxY0vCHDA0mQ1G3NClf5DDpmnzmQpFaTh4
	nj1rKWf1roIK03T8R1LwNdB++UhkxlrVcP6xLHC/lLYbinNmuwkGQlOBLsU8vnry1OgwlV2GLVj
	4JAxO/dGLYmlBkIO4f7nODL+//XsEq6o1NivNAXN
X-Google-Smtp-Source: AGHT+IHimRX9HA5HKHfBTzf3Kyyl80jp2tp137GOOhu4Q2Osxefxa80FYYbOjVJ346zWo8FY1vD98g==
X-Received: by 2002:a17:902:e84e:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22bea4abb22mr2916755ad.21.1744318835308;
        Thu, 10 Apr 2025 14:00:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f82a3sm12431b3a.90.2025.04.10.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:00:34 -0700 (PDT)
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
Subject: [PATCH 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
Date: Thu, 10 Apr 2025 14:00:18 -0700
Message-Id: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ks9P1WgG2X7W

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

Pierrick Bouvier (4):
  target/arm/ptw: extract arm_mmu_idx_to_security_space
  target/arm/ptw: get current security_space for current mmu_idx
  target/arm/ptw: extract arm_cpu_get_phys_page
  target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug

 target/arm/ptw.c | 65 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 17 deletions(-)

-- 
2.39.5
