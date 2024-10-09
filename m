Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532101njl;
        Tue, 8 Oct 2024 17:05:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGRTpitJshQ+ON+RbnXlDxRhUOS/aOo+mp99Gz1BBtqHil5v1o3MQzuPHALVRAamktlAPZHCMItWCwVQ==@linaro.org
X-Received: by 2002:a17:903:41cf:b0:20b:af36:ea5 with SMTP id d9443c01a7336-20c6376e592mr8438155ad.18.1728432313028;
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432313; cv=none;
        d=google.com; s=arc-20240605;
        b=hQSuK4yhn6mhsSDbfO4PERPgRpN5244U0a6fTaMDUWEmfFZ+/4ixYfSrtm9Kice28M
         ok4DtmxKevUKpidoT7ZzLg2lb0+tJENOSJe8zQWxDwBzpY6nZyE5Aem6pZ0zaOYArvm4
         CuaKiTjDHeyUmh6MzG9rDnmi/vrTRCtu63dkprHa/8mqRF4Ycrby3+26VUolxVZzl10N
         wkblvQGWVJFdvZMlTwGyNSExjywARi7lYmSaojkAoJazFew5ESG2hyRnVNKnykIZtUeo
         pyW9HqsfBJgnXpcAbacd+vgVQC2bmdcAkPht3E4zOKIU4XAtRWZtcWljGVrRr2S2VyT5
         9YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oOELs1GBJLtlq8nQGFT7BbF8Y02om3aScvqBsVkX7+Q=;
        fh=8+Ij/xiRfBxIOSkv69xOx+Mz/tv8tuVGGYBQMXFfrwo=;
        b=k+LQs4FZRKOvntP6eyzIXYMoCi2c+4O3V6sn2kbXpEHNvW+LnI3+8oxMrs1v0tDQu+
         zAde659FzksiGwWI3l3O3uJQtmwLZ//T7lFSnm4S4lS26wap1qaHkOkzNHp5E7yGOdJo
         3YTpHb8ueOgHzJZGX6CwhBPgZCy9FumevAXnnj9hPozRY728P+s2dayWx+p6yL6FcJ5J
         4oj/dSORmfwfMQs9F041rS0aCf7kWI6Bny6xGdwN4B+LGsN2TNBBW/r+RGSIT2ba+/JM
         zAHdIrdqv1BdYnaNqBqlRyJ3LimRTvPxANHfua4X3bo146SNVGBbYoWCd8SD5ZGCHi9d
         5Pyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAap8amP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b1ac0sor48341785ad.7.2024.10.08.17.05.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAap8amP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432312; x=1729037112; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOELs1GBJLtlq8nQGFT7BbF8Y02om3aScvqBsVkX7+Q=;
        b=cAap8amP9GSVw600rXWLabXf8YscE8BdZ1hDUH3wR6XEF3JPHlO4Yyw2N0LoyGwzty
         nJ+BW4QhmbStXp9B+3OW1GduVzb0yyWUghBqZYjChE8NFf0u2MUYEtBHogQ/1WOnrPV+
         3eyWmn1s4jJNHEZY4MHjk7joLVFh0/mqXaOxsinJT78TKrTj+l9yFOmLfZo64flUowAk
         sRXTmtuhdVXFNNMSb7HylcVIVtCmt75J1pezgm4jmdp41YPMnSrxGWwXHn6NmNCt/eD8
         pfpiFNqW+8ifh2sRSqoA55oj6Q9MkPSSlexnTi5XTR5+HPfiIHPRImpD5LYlFhrg3Kqp
         nTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432312; x=1729037112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOELs1GBJLtlq8nQGFT7BbF8Y02om3aScvqBsVkX7+Q=;
        b=HoWDGyqrYktMJMRzCi+g3gag4RA6S2H6bjPkYGBFEu6y3/C2iugwtQJMsHUqS6VWU1
         cyynwF5N+GbV6zw2kvbHp2U+7imrtVcjsmiq/lrBXwgmhf8bEeRS6k7TGhLrozdesq16
         uvlBnN7/6TrV8v5u1idhF4XPESBmjXgsp79i77UJ8IcBuxgY3m5aA2A6GWzoaxrLOQ6z
         8v0q5QualXUHi79KhwfACcvao9v5I4deK/nizuqzCTgp1IqVLqxWnoMlW5GZKZ9o7IIh
         GDlge6O/CPe1HMm4M62DUFxQat97jTIV/OJi4tIFYF9TLFsiSiiRyVF0sNhNLaGaw0Cg
         d1qw==
X-Forwarded-Encrypted: i=1; AJvYcCVIeLieWS3KX/AS73kXIqHlPoAosbt5pCltLbA/U9wjzi/isl1WAIaFbv7Xu/1oPh1UHxfVAlCMGGbnbQ==@linaro.org
X-Gm-Message-State: AOJu0YyU/v8eeWbTJz/zXDoW1jHrpMU2cMAGM+59GgCg+wSc/Vf0yhbj
	e+l0LUIXpP1/4O9IZx1X7OcfJ3hiMC+8y7B1wmPlCGsrI0gm2xpRrYJbs21q9PxDlA==
X-Google-Smtp-Source: AGHT+IGdLlh7lpqvQhrMnt+h4KRJVDHjJLBqhH4OV1XyMKMzeUf8I/qGPJ2X48D5Sn4234GTGJ8pPw==
X-Received: by 2002:a17:902:ce91:b0:20b:54e5:e822 with SMTP id d9443c01a7336-20c6377b24fmr8881225ad.21.1728432312463;
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 18/20] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Tue,  8 Oct 2024 17:04:51 -0700
Message-ID: <20241009000453.315652-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pmwAfbQ/kMs4

Determine cache attributes, and thence Device vs Normal memory,
earlier in the function.  We have an existing regime_is_stage2
if block into which this can be slotted.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 238b2c92a9..0a1a820362 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2029,8 +2029,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             xn = extract64(attrs, 53, 2);
             result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
+
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 2, 4);
+        /*
+         * Security state does not really affect HCR_EL2.FWB;
+         * we only need to filter FWB for aa32 or other FEAT.
+         */
+        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
+                                     result->cacheattrs.attrs);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
+        uint8_t attrindx;
+        uint64_t mair;
+
         switch (out_space) {
         case ARMSS_Root:
             /*
@@ -2102,6 +2114,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
                                     result->f.attrs.space, out_space);
+
+        /* Index into MAIR registers for cache attributes */
+        attrindx = extract32(attrs, 2, 3);
+        mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+        assert(attrindx <= 7);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
+        }
+        device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
     if (!(result->f.prot & (1 << access_type))) {
@@ -2131,30 +2156,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    if (regime_is_stage2(mmu_idx)) {
-        result->cacheattrs.is_s2_format = true;
-        result->cacheattrs.attrs = extract32(attrs, 2, 4);
-        /*
-         * Security state does not really affect HCR_EL2.FWB;
-         * we only need to filter FWB for aa32 or other FEAT.
-         */
-        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
-                                     result->cacheattrs.attrs);
-    } else {
-        /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 2, 3);
-        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-        assert(attrindx <= 7);
-        result->cacheattrs.is_s2_format = false;
-        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
-
-        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
-        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
-        }
-        device = S1_attrs_are_device(result->cacheattrs.attrs);
-    }
-
     /*
      * Enable alignment checks on Device memory.
      *
-- 
2.43.0
