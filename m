Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147650njb;
        Sat, 5 Oct 2024 13:06:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTyQ9JyPJ6o/tPTts3oQRCMD2HJUkEkNdjJNa87KSBNPySERHN/Ys32w5MObYt+8qURL7DJJVaeUg23g==@linaro.org
X-Received: by 2002:a17:902:f54c:b0:20b:8ed8:9c96 with SMTP id d9443c01a7336-20bff1a8aa9mr85658555ad.39.1728158771317;
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158771; cv=none;
        d=google.com; s=arc-20240605;
        b=ME1o7KvRW9ZZjuxdn7tIYMLFzdwZ3c54eXEQdHP6jlMKt6npTgPGj1AMxfuJxCURaM
         UNm8hJhLKKvc7OEmm1ceRlxRuXe5OLFrVJl/pz8nqpKYpLvvIFOxgngHGZYUCmnYJ3WG
         6ccCanLqT6f9qEbjtLuJknaiFG0PZMi06l2iA2Qs2pUOJJiIxepz2+QMUwPGxBjRD++g
         a8J+HmUWlZZLxAyWdRp0PFf6FLPaPQZNje/sag7t0uSlVzl1g0jKQwKN69CZZknovP3k
         cRitsqIBLOz+xTg/xLOby5Q0URwuJ0/9vtzwoRMsS8ZDQpLbajRNAmoEicJeD8j5OPMC
         z9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        fh=vjfxZBqsbE6P7j5TbAFyxnLjCzLtcKltch+GUAJHI/Q=;
        b=DinlAJYyAcCgwWlHMiu1O1VzUnq00Rx4fxZw0T4RXYyUmkg32R2Kwbv5rTY4xQ1IIz
         EMMB3NopylfaCM1BaPy0VyyeLjzB0RjbZex7F++N4obFIobgOxyT0HlhRu017oTdW6Ia
         JpX8Ym7ItmNM5IZNviyh/u4y1yEAuGw6Z7GGewoC1sdPZX2o+ZKs+fNlzZ3zKxXw4Dc4
         taP9XwMAW6kOMXIrJix0mXQyIB+Chhbm+NqKbrPSaBf3zbPk6Dz9isy7Ch9/mdTldFiR
         l53i0aqsnaeiatr6Xfams314PR11E03N2r1wCxla/LRfJmK050Ol4GdzLNxOYouh/ra0
         Bh8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeVtAnQ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13955583sor12126875ad.15.2024.10.05.13.06.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeVtAnQ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158771; x=1728763571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=WeVtAnQ04+Xa2VEY9c/e+DkqbD0nyHgo51zWc4H9QuhkLL67v8M5nDWdFxkTEIoF3m
         0rrL1qBOyY5EAowQe6Lbrg2sThtl1qBzolEh9Oqdcjx1ammiTdjh96KMm7WI52phIPFG
         YDcxFR0SgGAByh6JiLWgSj40nAXoz1V8xBcKMl9gHvWATMAXgGq2V9dug3y7WOeLUM9G
         DFU1PkHEdMvDC0z7b+uuodS1otByUOlt0o/fD7Vv/gLjA/HbbX4tNZ6tunZxuIB2onRV
         OJtg17Jg8iSBXhSkuPQWHtrMeZYT73WYp+alKWll3LBfv8w9LkK2ZLmxuWDgnU2B1GeW
         F1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158771; x=1728763571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=posPbKSzdb+ffX+WhfgYFaW0pAyKjx4IZlbzVQLaTuc=;
        b=Q2j0DptCXgd4p3tgv5Z/qSOEBybjUE0VX4B9ozYPkgygWg5N1SZZ2qvUkMR0szPi92
         bBP53ZvnWQLo2YE42DLX1CYvp5zr9t9DtlxviCQukjG8MpW7qWjP/LPq7AeVbrfy0cro
         qyZrbGyHi4inj+QVS0lfXgIdXJTU3bcj5PIFcoz1eIXvfdLR+jbDpdXp1e3Z+9SNq6Q1
         Xm/xAQsUooDmm2ykSbkrz27YAp1h1KnCFHxz225EYNz9TKxJIk2wyFXrQRTy64hfvOr7
         MF9v6MCmQpY4cGokayoBjMRXsyrrtbCBaJLf3uUBV9+K2uTpgOTaV1YhvRI2TYx/DZQC
         jm5A==
X-Forwarded-Encrypted: i=1; AJvYcCWYvhRcmOmxWGSEORpc6Xn1u2QPrDAEi6Qgy1BNpgYxZJ2+5ZmQSnA32ugHsP9vUpqvTP8TWOH50sVRCQ==@linaro.org
X-Gm-Message-State: AOJu0YxkHYN58aRmbMIW+xRFiJjaFvZ7Ju+fUOQk6SQTvEWvATz6VCxz
	FtrfJPxIcvhuvbrLysYnh+l7QCkC/gzxCCmewtfuaYeNLaDIRhtBhlbIzTY10luRUg==
X-Google-Smtp-Source: AGHT+IFkbH5I/ZaJe+I4v335+XuhQ/F/ef46EsJUG+t30A/nnryOiFz1aTLseUaZK0R77t/l8tl9fg==
X-Received: by 2002:a17:902:da91:b0:20b:7c00:5e50 with SMTP id d9443c01a7336-20bfe022a33mr98058335ad.12.1728158770895;
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 10/21] target/hppa: Fix priority of T, D, and B page faults
Date: Sat,  5 Oct 2024 13:05:49 -0700
Message-ID: <20241005200600.493604-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tLXIayOdukCj

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
