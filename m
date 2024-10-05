Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047821njb;
        Sat, 5 Oct 2024 08:26:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9Z0Jhuj66elonAilMvr6Zp/mrwrjZY0fn0zVAfFgINEBtfi5KlNkPx2iiKn98MHKx8DB8oFUqu6aXlw==@linaro.org
X-Received: by 2002:a17:903:228a:b0:20b:78de:c62c with SMTP id d9443c01a7336-20bfe29281amr96284455ad.39.1728141963141;
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141963; cv=none;
        d=google.com; s=arc-20240605;
        b=B9DsEWQG1Jg48KfKS9WYquJQ5qPtQajs4zODD3eAnRPTPI467lg1e0fcUGv39eHW2O
         eu2y1ibZwXJXNoknhLBYPb/ZAVZBX9YByesDezKJZp0Ubcq5Gfl0U3R3Cqib1MMNOHqg
         m8UG91vZWZAMkUjJo3TouXfb4f/ydwTsf326MhAvGd+IhZh26T435z98gqofPWGW8phe
         diRb8OwTtjsfDO4H63duyANTtKQp76k5qFoX8dcqAf816lm3feGMPWn0at7j9Iz7HIm0
         6ArxNPgxlzR1rpg17jR1Tp9r7dNV/+dx4XEZrhU7sEMO+5n+RmgJSHd4Cj/5xY8b4rKI
         vC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        fh=LL4wNCksn/ZxZgolfwq8QgHveKXaGV4i4G7RCc2AgVA=;
        b=UJWTJuLE8EcKp89+R1WHvn/K4sSXTB8z6vu6IZ+8xiESqoZq4OQnGB+dAzn4U16BPa
         JE3NXX0TWqhHHN+0P31LXetC3umsxRZzZul+D3fjSJveoaktpR5gdxeITLGur8AJulFg
         brv8Eak3LKX0pjJFtxRXnkm9EYJEZSsAK8lPxsO5WhcGztgV3ljOMLqeolx/4aDPyyJv
         9O/cidi1Wyl9WzhhkEu3A0sCZ7q+VD7IcUEXlAm3BFD+1MpeV4Nh3vD/EfXxKkLIyfi4
         igCZdIu+L9vQUR6E/coJN5bzjl9b6QJ2/LBX9i5rmIcPd+lALrv6DPvzzeAGUkQhWQWo
         uwJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boW6mjut;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1393be94sor10170485ad.19.2024.10.05.08.26.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boW6mjut;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141963; x=1728746763; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=boW6mjut4w5AaCkpLTr3pChsjC+X8motYp9pr2ouluD4//6XuyyRq/2zNS+cmakaGt
         9OOqHIsszF3pkafZLB6nECX+m3unOUvpBeLYTEYWZPhX2bjrPL0/C+8s07vIE9xZ4rft
         3NaPfe/D3hWpJQrva3/drT6Ifi7YWkHj8aPMoasiH2LC7tOr8LlSFAKcDrkJ7/yzYp/b
         2MrSC/Atgg6oTdwLCmfYqkkRSCllj5cC0jmBc2vWSIAERV6o7h/B1UsPcZyrWgjh33Nx
         p56gOZ/NyaRWhaYI1eZV2pIwL6EilNahKzxZdrTYIf23cXmpshP4AntWF07rHLXKCHwn
         21KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141963; x=1728746763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=r6KXGtrqv6paTFM7CuBlvo3nKe3bsGwkDVkvrsq5vh3e7heX81bM9Ogm2/hnLb0s2Z
         v9ifaSrXcgJbeznNsYdc5sFKhyjkKsQoEMUVRAtmKj03nw2g3o2EEzL9lNp/vCeU3dOY
         uMK2Be1TXBD+gLpOnpxeFOc1BhXy1irex0FrLj85M8hOS8QGwP73kRc5hh12F6FERUVM
         QH2BbUcgvUi5R8zBTbOgTmMKbWlufTs4Sx9mx8sxUt5xdb7ANaR577Q2rvZ85tZgux0S
         7NArV8mIBJuONtJAfVS2Hno+MyKi3O8FtNThGSdAENrv60T1J+1yJIIQcXgF55QnQEpG
         cutA==
X-Forwarded-Encrypted: i=1; AJvYcCXBXAoiyYfanzdcBsLcHO0mD1WAJUItWAxPBgU7z+8btA4XoLVfaSRUkeIz24m9IC2nw8R1PmMwtHzutw==@linaro.org
X-Gm-Message-State: AOJu0YwFVpr5wqHbZJMlgebe5nB2PFqY1ijGhciL48jQZkY3UIsdzlF0
	cxP5LrFYSjBPt3sjYYUX7n4I/d8wej3d6QrEi+yIZuY/cnP/vW+L8hahAjs9obae8A==
X-Google-Smtp-Source: AGHT+IHBX41nPwo6covULM+vMbiWEGGIhbj1kTBPJ81VMsZIIlt+W/XQXaPT0SdsNmz4Xr77GlztTw==
X-Received: by 2002:a17:902:d2cf:b0:20b:502f:8c2e with SMTP id d9443c01a7336-20bfee333acmr92469555ad.51.1728141962599;
        Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 10/20] target/hppa: Fix priority of T, D, and B page faults
Date: Sat,  5 Oct 2024 08:25:41 -0700
Message-ID: <20241005152551.307923-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kwmrQbJsI6q3

Drop the 'else' so that ret is overridden with the
highest priority fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f027c494e2..f71cedd7a9 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -288,7 +288,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
     }
 
     /*
-     * In priority order, check for conditions which raise faults.
+     * In reverse priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
      * so that the resulting PROT will force a re-check of the
      * architectural TLB entry for the next access.
@@ -299,13 +299,15 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             /* The T bit is set -- Page Reference Fault.  */
             ret = EXCP_PAGE_REF;
         }
-    } else if (!ent->d) {
+    }
+    if (unlikely(!ent->d)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /* The D bit is not set -- TLB Dirty Bit Fault.  */
             ret = EXCP_TLB_DIRTY;
         }
-    } else if (unlikely(ent->b)) {
+    }
+    if (unlikely(ent->b)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /*
-- 
2.43.0
