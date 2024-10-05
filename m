Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147658njb;
        Sat, 5 Oct 2024 13:06:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoERRt7FX/Rn1HQ6GOBmPDHw3Zvcf3mtN/QTuiT6/dBT9nun36Ipq9JiktzOJ4jkI2UF0/31ilrdxJUg==@linaro.org
X-Received: by 2002:a17:902:ce90:b0:20b:a73b:3f5 with SMTP id d9443c01a7336-20bff4a7107mr95368495ad.14.1728158772314;
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158772; cv=none;
        d=google.com; s=arc-20240605;
        b=lk32sJzLw/3HxNaL7gm/0Nx2KQf48v/81BuKbYjK5R1HokJO9BsafhIlqm7oOqFF48
         wWCNtem6lkzts5cSb5qSEKdlB5Jkn8L0clD4A+E+n7vAHgMrNpbp49uHM+vqi9HA67oq
         +LMai4pSMD7NtgrolzrehJkLtNwT1/gZDLtBAIoJxbNC+0SPSqKZek6dcLb0zlMWFUJ+
         4DdPwQz5sQnhFbY78OJKMHRHuvQmfwrx+kwZK9QSPSVUeOkCRWE6fP+62A04MqD25hI7
         4NqGUKtFvR3adrpN/JTi7mkLe7dmTLgUwM8RuPw5gFtq9SE3WZ6mJ+urQPZYH5U7faAu
         GRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        fh=JUwlEmdbhVgUH1y1xsBcp/FRqQ0e/8j2i1veWb7S+ws=;
        b=Xb2nbBqlpKlFR8/U3rAj+rb+BC0Hfc7ALjd5Syf8hWkafBnRFDW5MsEi/GZKKke77A
         KOvYt+uZpW18yjll2LJ+znwmEXzbzaqArOojR1OL+0luFCT/czJvBZXNViX+UV8iVOzF
         +PF0fMESAa5Tbe7ny7bZdw4RB4kX8N/+mKbbwgVQUdg/YpSRLgQlOeqKqeDMm+rx9xba
         GOMafnRsIXCfPwv+AKhWM00acplFwp7nZjpCYRSHsV28fFa8jY3dnuM1oKoGTtw3LhR1
         QtYGttGL3vpS4DFtOglDWBv4H3g2wozmDiJWra86yEmJDRjC2cMOUU00Tu9OmD/iOEi/
         eNsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJYqXpNk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1366ccc4sor11419935ad.4.2024.10.05.13.06.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJYqXpNk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158772; x=1728763572; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=FJYqXpNk6JuNdnzoiLhcgtOPKgvIgpGr710cJLOzT5NqX2hoCwGNYvL7MktDiNyUFe
         Y40wzHAyHo8MiNiq3xZrTQbZ3A+ho0DbC70YzuodFeTfZEMVbfPLc7LZkmD4Vp2DE6Oo
         7BufqsqX/2tCoELRrpaYkTAnU0lL2C2Qx4whMGZ84cMGJTJ2JusBpjfbT/AEyBkXNdKg
         mlc5aKBRvhFjlhmom6AwueHH1o64N2w5ZMG8NCuoaQeeH/I/p70ShkIKTnObajZx1Vff
         MZfIEQHbNlL1hxYXlVMS2NkNWh5DimrWYT4be3MncWX/NVPPpF5vPvmRMIb4DhuTp9mD
         4YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158772; x=1728763572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZFSB9ZUy/VXACo96L3HUXARpyVU9ywq9XNxX+p9inM=;
        b=QMR4iRiiqpiRICQoP8iuRapX3hBCEUxi1XF+le9AGuS19vy9ivG09+ZEjbrvPRWaV+
         noAi47sERmhugbJga9YWnM97mpDZMkeYABwF6iE/D9BkUln0/X3VSpot8WUxUMLJCG8B
         xII3SB/onC6IavK48N3h9fgDcgxZM8UgKpYTGXvmF0mjC+yl+kgGhcvi+ZYRwynKSZ/c
         ikNGhQk3pwN1Il2iex3U2K9bT/6vB60ti14FMxiB3G26aP98g7o5AQoJ5WNVh27jSPMt
         kUExJy3i0vvSlCN0fkR9uiiy+aNYXy+3ID+0yKcgdHpw8pKwjoxr1lIOrBJqtR7cJJpF
         ssPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgzfqgj+ZA6465N7AyvXfJ6bq9aNMpA1ZogKfKDOCqGmukBbrS/TjFBt3K8qFGbx2RSOgaM++uxQuSjg==@linaro.org
X-Gm-Message-State: AOJu0Ywno4jPVBeSkDKKc778t9j04I0LsJQMW68/u39XZmfxP4WOJSUU
	wBLK/8aWoEve9ShrEV1VIrd+7coZRO9vbu/MulI8orrA1srHQ1f+yCcmcSkK6FjMhA==
X-Google-Smtp-Source: AGHT+IEnSEOUIrHMqhl+2wC7MJEt2x3LJD6slbQirH4WqyRvisJVw+9UvtZb97XvweZZ36AVIQ0gZA==
X-Received: by 2002:a17:902:ecca:b0:20b:805d:bfe5 with SMTP id d9443c01a7336-20be19c0fb0mr135947635ad.30.1728158771892;
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 11/21] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Sat,  5 Oct 2024 13:05:50 -0700
Message-ID: <20241005200600.493604-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YJa6MkgOXvfz

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
