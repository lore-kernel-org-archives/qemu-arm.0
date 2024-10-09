Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532017njl;
        Tue, 8 Oct 2024 17:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2ZE1k8MiPysZuPhdaZqFFhtQt3bf1s2AOOPxKrAO+5I9z2QfNSkTQEi8A4HJUDsVvjTaMJoOUxhyXNw==@linaro.org
X-Received: by 2002:a17:902:d4d0:b0:206:adc8:2dcb with SMTP id d9443c01a7336-20c6373aa92mr9861415ad.25.1728432303859;
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432303; cv=none;
        d=google.com; s=arc-20240605;
        b=h9bLyLCfbc79zm7wsE54RmW1/rL2SD6XL5oxbYzy4ZfA3w0/QH+1CNB5zOS2jeOG86
         16DSHFbwxUaF1lcM05ZmEEFZkLAKJzhFjMtP7yTh2DE5/ZG0u0BP9FzxdjXRojl2Xy0v
         HMOtYDF7vMrzio7OdUG0JFetgO1Kutl0BU5jpXLg4xI1uxmWgQ2mL75nu6iEFtCCeVbI
         TWPiDH5fXAjGr+Bh3FL9PigR1QkMTxl604eMkP23BHoc5N8M4n+Rc3RxCY04rpu4Tfrh
         D+VeCWtczhByDmzksWG9tHvog8/gQqYKnxhbNx+8S9K0nx2TpH+S6ZilaDbEfL3Y/3bI
         e3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jvwlrMz3Fk2P5q43/JWG8Wh7xLnVWB9wP6XAmMUyGN8=;
        fh=mRAqvoVWjM+4kQu/MRIlAJAF97uuu8slrKE9ShfPT7k=;
        b=UTbDfXciK6sV+Mc8804t/iiomKWLUTdcppBNqCuUVfSgKlP05kebAtppUEHFVvclPw
         6AfBM2pEMLDg0SbJHjcH+Meif88xgHB0BUWHC/PBqAEzxue2Ddwf5Na+X1goBwRXY/jZ
         3m5T3Tvl09JXfJQcaK2P9hjJE6I8iZQyjCVTybkGM7A74m3aQGX3vFv7QA+m51Ffq0Pb
         cZd13TlfzDlfurES2RfN0xk0aqnlrNfAq2q+xo/jeLpG0fWA+t+d8g/fYobIy0UD3hTA
         y3ipT68n9ni7d1hOwS0PpMFdZsXYMS1xuqWvckWZy4GvhqJZEePZD69Vw9SnkOyGYYEL
         vxMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRKljg0k;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d1bafsor65528245ad.7.2024.10.08.17.05.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRKljg0k;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432303; x=1729037103; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvwlrMz3Fk2P5q43/JWG8Wh7xLnVWB9wP6XAmMUyGN8=;
        b=SRKljg0kCe048HrYsh5sFWIfOHc0KbLwJMxO+eqqZmfXcLiMDcs4ilr8CWq/8WcjW9
         FVQ+ETCYLPol8ilw+nuO+7TtYp+J4kG8ZDbTCAhEyKvIEEwH/ew5YQQjjWswgrm/T+fJ
         QC7eynaxb5W0dy7C1c1FfBYJxdEO2qAZM88Y1vAtwXTmEY++Q0XDnc6IgoN7ru1DUoyh
         4uOWcW7qPvGuNWzCQjR3RUpIqSvD2UHWk/hFLrulIbkbi9ict3g37J4Dr7hnukB808mh
         KhQ6A5kG8e9L0UrZYmHUIcmtotPhQi03g1BmqWMrxpMkzuPKFx7rsbc8J3a5bhHvYGId
         3Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432303; x=1729037103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvwlrMz3Fk2P5q43/JWG8Wh7xLnVWB9wP6XAmMUyGN8=;
        b=W20/f2FEyeJYhiLsRAGJ7HRwss+S1rv7CSm4fPKG6WSYeZbh/dvAoK5gysbL+0D/1K
         iN/3saN1QTJZUNZFwzu5lozl7eCFknHrA+0MyqN9rIY53XLFmgLa75y3gC9hvA9YW3cw
         DsuKNWo9bXi0bAoyN9KXDpk9QU0Ah/42k8pzRlQFvxOmhUAE6gdgJNZon/nrimEt1m8w
         qe1Tnz2T+1ozsBg1Brm7vf18f/f8IaYOgmx+8huaWwpvs2TnG9hzmO1bzY+v4dqGBSJg
         pRDJXjUtWQ4j5qjMAN9q886MJ/QZG3ES6ihFGvc/n70ORsEyLdTdBfwcnhTreRZJukOU
         xdew==
X-Forwarded-Encrypted: i=1; AJvYcCUZQ0wR3NTu2nXegpxFQC6fAjm/aKSdFQNxNa9xNKP4V98Ykl+JYnSKbUycslXAXkJLDVqHlarN1w33fQ==@linaro.org
X-Gm-Message-State: AOJu0YwpahxK6Yh+0qiQHIIR3NmYkKT0DC4TQ02ELwzKY5jPNOgKXYFB
	oOgntma1MSwIbzK1tSaUEXvet1FfqC7nWd2mziOmnFQwDWjW5JhXjmCOlNLh8YCK5rR5tyIiNw1
	qMnw=
X-Google-Smtp-Source: AGHT+IEQN3Rl72pcmgLCTKgbIcOtLba1v+GzwtpoC9AF0fnEDdxLNrxqZqv2s5T7uD+5Iv4bbg/olQ==
X-Received: by 2002:a17:903:2289:b0:20c:5263:247a with SMTP id d9443c01a7336-20c637809c9mr15713945ad.38.1728432303433;
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 08/20] target/hppa: Perform access rights before protection id check
Date: Tue,  8 Oct 2024 17:04:41 -0700
Message-ID: <20241009000453.315652-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Fo1P4o5W2lb5

In Chapter 5, Interruptions, the group 3 exceptions lists
"Data memory access rights trap" in priority order ahead of
"Data memory protection ID trap".

Swap these checks in hppa_get_physical_address.

Reviewed-by: Helge Deller <deller@gmx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index a386c80fa4..f027c494e2 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -267,6 +267,12 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         goto egress;
     }
 
+    if (unlikely(!(prot & type))) {
+        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
+        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
+        goto egress;
+    }
+
     /* access_id == 0 means public page and no check is performed */
     if (ent->access_id && MMU_IDX_TO_P(mmu_idx)) {
         int access_prot = (hppa_is_pa20(env)
@@ -281,12 +287,6 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         prot &= access_prot;
     }
 
-    if (unlikely(!(prot & type))) {
-        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
-        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
-        goto egress;
-    }
-
     /*
      * In priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
-- 
2.43.0
