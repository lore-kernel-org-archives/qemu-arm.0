Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047812njb;
        Sat, 5 Oct 2024 08:26:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJubDCiGku3ibX2LU/W+UJ46kqmII1AYR2M09EWcHfb3eroi8gAZeQ+OwPDU00a3Hek8XhXWKUREiVyA==@linaro.org
X-Received: by 2002:a17:902:f686:b0:20b:81bb:4a97 with SMTP id d9443c01a7336-20bfeb4c711mr76110645ad.29.1728141962003;
        Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141961; cv=none;
        d=google.com; s=arc-20240605;
        b=YYLbSRMwkYW0EeZP71bNmuyY5GNwF+LMHydbR9ioShMaxn0ruSCGMYhHN+6+6KScmR
         vZp+NOwubXfBcPG3pBiz1Y4C1fcW72o1DVm9ZcSieC4Ja1K6F/LuH+ePrjjAzpOBrOUp
         zdTwxARjiuGF6nVi2W8CA2zDKcB4OzMmQS4ldDcQWbbxNo4Gfvbxiux15wdVKb56Ia3t
         MpIcR1YiorY3gPnyqIBm2k3uZ1YZlJGNRYZNTaD051SYhwNNVVkQNzzHn6R5y7QeYYlo
         2g6z6MnHSnMgpgKCMBKCiDFG/qD3EruzI6fZ7laH38aa3WEGqyutVWbxYL6VQzIIjUOE
         C0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        fh=NcpPMaPgZV1wkVrjfWf3I534YSKBP08ds7ThqxBd3xE=;
        b=CkGWOAIUmcXrv4ibHLyqy2pVYgKl8OyAVR22j30AJ4CARwNeek3wF3sTagl++XQlg2
         CvRUG1CxQ9XuEdHYE1KgoS1GPLMvJq64BvgSuW86B9JdX/WxgXUep7+zISMxt+j0pDZB
         0ToR3m3fzwg68AQqKGfqiaruyG+1qxwbN65GkLAAHsZn18tnPolFXALEBNfnX0F7Vc+6
         EypH8pAdE9WmO9atq+0vuD2bFm3Mm7wJICmsvbzd4kTsAqdINzjZcx0TtAtgDMHpFO6q
         I+BXBtOc4/WNoqwoB8oz5xjy+MvRFqLD/nIqTZAh9VkkCT2xHtEJQ7ELqJdJJd73ubzx
         +R4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcnjP2sQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c139552c8sor10631315ad.14.2024.10.05.08.26.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tcnjP2sQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141961; x=1728746761; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=tcnjP2sQMMTg1VKNf9Q1NF2gmlqLd4SDyY/r7eoIG3j1k6CBX0B1AE2udGKhvyPmzE
         GAbyprygBXCfC2iEtqcWfvJ7yElOcWaJqJUmOKWXzvDtyjo0zA8KxUUSjlMADmXgVhYm
         n+J6Ik6DVVR0eeBv3et8+y7AsawX7Fv1ijVANNqDrUdxZ+//cbthIPAOQTT50m9r7G+d
         1VGFIzhzFHR78Aa5APPlTyXU21EQ8HaDrPxKFh+6zXSC3rcCoL5x6EoxLPvFLS7rtdhf
         vWFNtCFzKJvaln+bZs0EwIl09SjlIXilW2HhSx2s9LqmNHdE70ARJI81QlFF3Uq4kzBa
         KQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141961; x=1728746761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=Na49EO/sgej71XGJ9feofy21d7Z4ZaiQjGF0eVZVVJ0JiWTOgzPENaGpSkHGpT6N9p
         h7fMlehQ4RZkjO8Ts7HekPED2KH6Wd4CBv168nPCTA+KPsTbqEiL6nNHFywqNa+DuQcl
         PPtt2Xkn4XN0HA8T+ruhyemeFD7AkTvoH2B46YQW3CjF6JnGQSsIihKK4BGB+xQLPdFA
         LuZsguFiN0kCf3VTK3frfBH3MdhvogrNYg3qVjvpK1zljh6f2U2oAitubOckdqcFO5mR
         0cAxst5Pj/9OtwEzV37CWg4Nw6IzLszJ0KGmdYikuHvomBd8QT8q8lJ/+ZNpQcyo7ypP
         ZAWw==
X-Forwarded-Encrypted: i=1; AJvYcCUwyHn2+0WhGCZ7hTIzuUaAcVL5Lx95hYPPIqfyR9/6lbMRtDOz5S41HAzncsY6nl6HVjBKjuvXTmb3og==@linaro.org
X-Gm-Message-State: AOJu0Yy4pkb/kKNq7FfLlbMBHEZv9OrScvg9ZlOx1e99T7DbuTVIp+wF
	krEtJDGZzoWXARBf4RVL3+I/IP2mCWi2sbRN+qUGc0OhJArPWMQPRURw3jiNXFY5eQ==
X-Google-Smtp-Source: AGHT+IG91WPfsC5D7LXHeMJAPorkuse9kNn6CykSYZIeBAI70lXeJDkn5eW9lfVj7aitw+VRpPphGg==
X-Received: by 2002:a17:902:e887:b0:20b:8036:f77f with SMTP id d9443c01a7336-20bff1a9178mr88727005ad.46.1728141961604;
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 09/20] target/hppa: Perform access rights before protection id check
Date: Sat,  5 Oct 2024 08:25:40 -0700
Message-ID: <20241005152551.307923-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EHv53XBrfuXE

In Chapter 5, Interruptions, the group 3 exceptions lists
"Data memory access rights trap" in priority order ahead of
"Data memory protection ID trap".

Swap these checks in hppa_get_physical_address.

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
