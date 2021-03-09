Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930574lfg;
        Tue, 9 Mar 2021 07:53:09 -0800 (PST)
X-Received: by 2002:a54:4883:: with SMTP id r3mr2060745oic.147.1615305189325;
        Tue, 09 Mar 2021 07:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305189; cv=none;
        d=google.com; s=arc-20160816;
        b=bkC2Ev7srS3k0DNVTgIcK5fHXtJUmgM4NO14J3R3XWlckX6xTyabrowXF6BbCSu/3N
         FSqUzGkGt764rzQ7AwsdAXQujg4BOfbcBcNEslqb9GRRc4x2fTrqTOrWkYNB5iyyQSCY
         ZAwMcXoWZoTQEwtFWH/B/9RMRhVqZtfgTbIc7ws8zt1ZuCgRowHneEB3N4Ztz+ugrHhm
         OZZXdFlZoDNQ1v4ezKGPZnGWvDgRJ9gmPJ28u6QYyTSECEB8tvk+4U3D9x/Tsnb1YpHa
         sEOuebSx+GdsYT75amf1sBu4cIApQTlO/5gzw5IZ4OQhmDYfvRxkDhCwbJlDGS0GTRct
         LGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1hAPjphDb7JdVH1DtHKU8lsgpgDqsKcv7jopV79CjZI=;
        b=vBi5YmXPPxpViqdYaD84PDVjjunXFumpd0c1+ICy8i3fUqi5WV08fw6prWGiCYMVOi
         njDxxEaqMeZpMT1tmyEjt5kZ0V75ua2UHsrYTjXCQGPcLaqNFYMXrrj0g9pbeDEdqaeb
         8hhsD3h98OETE+MYlEp3m9pntKFJYv2c9SznhPJG3RwSa20KCFu1ev00NUCO/vi52Rlb
         GtZDiwsB+RV7nm/RzjsjyLKx55XhYxqYqF0DCwu0NxWCGVqm/h0z76Y4AnwM97a2ObmK
         A4vlxPxLy2srGQpISaJmtT7yq/wNTZt4sZ31/KIYxWKv7GfQ0aMoHGoemSBTclhQ69ym
         DEiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCmZkqmX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e127sor4033305oif.159.2021.03.09.07.53.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eCmZkqmX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1hAPjphDb7JdVH1DtHKU8lsgpgDqsKcv7jopV79CjZI=;
        b=eCmZkqmXhq0JQRYodrXdKzTsrDv4ke+pHdvpD0Rm6GmmCBJ22XF+M/l5v+3wZ/9M/n
         3EoQAuuIjhSSK9dZB1le6ZhKt8PYH4ctL3IAFAxr8j86QrgtUe/ZvWlnWRIc+SxjoMgF
         py5ZegefUN57h/AR9BIlK0vj1BujA6s3fj1p8j1nxTKSYyzu/A0BB8lkrveeFNq2zfvK
         Tf0JqrrTg0Pl8iqSJGBMYzHXYMdy4IvKWmIKWyiMrVmkwCbzLblTu2Zh4eZwNJIvDXKU
         kek1L7y047NThnmZ2iURiJTguKJt2ZOMJI1xOg4cKldRqzV3UVMroYe/rKQFsVlOlXl5
         WENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1hAPjphDb7JdVH1DtHKU8lsgpgDqsKcv7jopV79CjZI=;
        b=jyGeivREwKFbXQnH+tGIz+YmteQAQe4AHZzY6oaZXrTdV/3C4YVblZ1mMw7O56CHiO
         PTLbjly8ev6vKV8vjBAyxAew6rn9ZrtFCs1jZAV9zqmnkIF0wmshOilCTMmuNuHPff9Q
         aVrXrAphHj1WoyFTVeMdp30Vf7p5AQB0yY5PEQYrsnivOExd+rhaAwB4qrR2nxnyHnsz
         V107eFnXhVkRfkpsa8HRhsHd8eM2ACzAzApp2rqIEfYTy0AWRDP6RGYOlYOB3Ekf38jQ
         4He0JEgPPVauKGKvf5IrVDmuHsDwCOGY4JzKIiHIc8In8UCXhDqVMqwdCe4FL0RTSfa/
         SV1A==
X-Gm-Message-State: AOAM5320MSB1cTlTKa9FfMFVBx/JOYX4kFvDJUaw9Fzys3JrXzQEoCPP
	lWGaUUMLkFXwbpWUw+NYEAC3meyJ
X-Google-Smtp-Source: ABdhPJxirUUwwYaCdTJLEPWLQkAkR9dTv/SFxI0l/bSIhQDvAowMiEidhv73YyD39NrbW1knZx3n/g==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr3475624oib.40.1615305189002;
        Tue, 09 Mar 2021 07:53:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: [PATCH v4 1/8] target/arm: Fix sve_uzp_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:52:58 -0800
Message-Id: <20210309155305.11301-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Xt/JkNCEgVFI

Missed out on compressing the second half of a predicate
with length vl % 512 > 256.

Adjust all of the x + (y << s) to x | (y << s) as a
general style fix.  Drop the extract64 because the input
uint64_t are known to be already zero-extended from the
current size of the predicate.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd5..11c9397dbb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1939,7 +1939,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     if (oprsz <= 8) {
         l = compress_bits(n[0] >> odd, esz);
         h = compress_bits(m[0] >> odd, esz);
-        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
+        d[0] = l | (h << (4 * oprsz));
     } else {
         ARMPredicateReg tmp_m;
         intptr_t oprsz_16 = oprsz / 16;
@@ -1953,23 +1953,35 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
             h = n[2 * i + 1];
             l = compress_bits(l >> odd, esz);
             h = compress_bits(h >> odd, esz);
-            d[i] = l + (h << 32);
+            d[i] = l | (h << 32);
         }
 
-        /* For VL which is not a power of 2, the results from M do not
-           align nicely with the uint64_t for D.  Put the aligned results
-           from M into TMP_M and then copy it into place afterward.  */
+        /*
+         * For VL which is not a multiple of 512, the results from M do not
+         * align nicely with the uint64_t for D.  Put the aligned results
+         * from M into TMP_M and then copy it into place afterward.
+         */
         if (oprsz & 15) {
-            d[i] = compress_bits(n[2 * i] >> odd, esz);
+            int final_shift = (oprsz & 15) * 2;
+
+            l = n[2 * i + 0];
+            h = n[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            d[i] = l | (h << final_shift);
 
             for (i = 0; i < oprsz_16; i++) {
                 l = m[2 * i + 0];
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                tmp_m.p[i] = l + (h << 32);
+                tmp_m.p[i] = l | (h << 32);
             }
-            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
+            l = m[2 * i + 0];
+            h = m[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            tmp_m.p[i] = l | (h << final_shift);
 
             swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
         } else {
@@ -1978,7 +1990,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                d[oprsz_16 + i] = l + (h << 32);
+                d[oprsz_16 + i] = l | (h << 32);
             }
         }
     }
-- 
2.25.1
