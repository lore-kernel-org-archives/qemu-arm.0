Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209900lfo;
        Tue, 1 Mar 2022 14:00:23 -0800 (PST)
X-Received: by 2002:a63:d642:0:b0:378:a4c2:7b94 with SMTP id d2-20020a63d642000000b00378a4c27b94mr10406873pgj.218.1646172023588;
        Tue, 01 Mar 2022 14:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172023; cv=none;
        d=google.com; s=arc-20160816;
        b=DYKVG7iZ5qdCCEEeYC7LS3pv19NgSR0UjlG/xlkrXbFfeoOIY4JegW/EDM3u+jG1sd
         XHMsbMpT3iM3h9rFz2KMTy1Sq7wxaD1lGTDKGWJGHbUYPVKDURaRBqPWQNnM5U4OHrpF
         61STrmS798XJGewtl6EjAFqWca8QFIKGQ1Z91o/C6kj87cnqAWm2esaEy6KMLqVLjVnh
         CkVm8ItkvTAjNM4dGm3rSuTeuluwpQC3KDH7TNtlpHYwgeo2DUVJwlJumDbdJsOC1yxH
         iXGgTcRJEV0a2psfpQanwarfXYHtOqlDkf3pJKW80ztJXGVH3/RkBk3C4WHgnPe2xTA4
         Z91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=Wa45Aza1GUtg++87LqCU4mIjjf7mlZ9aDV6WcbhjwzFxdKRuvf21VKZi2wgCw1swOX
         vVdtaV+soXd5rFqk8WDvczQKhwJeTUWHKSamuvV/3C7SYNKoR7hK0kkDXyCGTvhIDdgm
         oLGMzZEYyQrAmCoVN7u9plYsLgOWQhO1SFaczeN+0DjYGpPi4Ly7vxb/aj50umiPNMkA
         4ZUg6lG+S8VTgfLdVow557EUfzi7EH3loh/AErElFBwu5ir+LbWRQVf84+3vk4CHvdt/
         NqxD/x3OsP2weCcWxpk7SFPZWkpPKdyhpNMUkslYr7ZgW+ZSJRVv/XVrLC0tlkuLKDqw
         NV9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6vhctFG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o1-20020a1709026b0100b0014fe92899f9sor7368006plk.169.2022.03.01.14.00.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v6vhctFG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=v6vhctFGtQ9+UuTVknMXPWTTC4GFlxgV3M6vlHVEU/BYRvyePLI+kh8gjOG3ssREou
         xGKIwLKegECDh3fqaNNJ9iNWIchFv9H5qJtgE82VNlL9UsBRp867UZGfb8aarEz1hDbs
         2nWXGx43oqz53sQdyrF/AX9Ar66/YUvRcDTxGzZjcOK0fL/ij/iiT5aLL605pK98RQ8Q
         bJL1Snj0/4hkQRAiW0U+CS0cK7Cl6I7TmttvfkxzR1MTH3rcsykpWlIw7yhIf0z9KGqt
         HhRahD9ThmgunpeEXKtV6vaL+j0JlSgfslCeasi9GjAfLAOPH6NuMVWE/9TE01GN1j4K
         COWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=jc7oOyeoEyeCO8wu4va806SnS4j/qknj8E+8+dLJtf+RWKcwy1UCs336Yi7LSgTOmo
         yGkmfknfTEDTXR2/gVSWDSQjcgdgcs0h72fvUnK17zd8JU35aAHTjGwxIo2xT5CFdXQ8
         tQvLW+IwrzN+Yw5WE6wdpUlQ4erdecBGsJSQOxT/UNnoWrxe8VoRzP0PiLYqSlKmFE+C
         tDq2FvXnBcy30HewcbrBOTIc9KrfkcWEvlTicIMKoGRBoW6JNE5a3t8/bynD9QLh8Lch
         6w/+4B+svIf8N4Wj4ZrhUxuPhU7R1L8khVg1zP2IR5nAL17Yyj8S8RouOpxnYBF2r7Ho
         ymAQ==
X-Gm-Message-State: AOAM533pKNuUAtb5RLIrVojYRWiTcMxFpxMXgIxbERjXEfyXdwNkeO1H
	l4fsfSeXtc2demdwQ3dEgsMkg0re
X-Google-Smtp-Source: ABdhPJx63VH1HkkCCGZSNnq+d5LdDpI55pWB7Us0oU6YEXNa7dgpWE8Q68A0y4b/I61qb2cfHoG4CA==
X-Received: by 2002:a17:902:cacb:b0:14f:ef7f:b0c4 with SMTP id y11-20020a170902cacb00b0014fef7fb0c4mr26480658pld.135.1646172023148;
        Tue, 01 Mar 2022 14:00:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 13/18] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Tue,  1 Mar 2022 11:59:53 -1000
Message-Id: <20220301215958.157011-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZuYd3Z7c1D3b

The shift of the BaseADDR field depends on the translation
granule in use.

Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31c2a716f2..e455397fb5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4538,10 +4538,11 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     ret.length = (num + 1) << (exponent + page_shift);
 
     if (regime_has_2_ranges(mmuidx)) {
-        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = sextract64(value, 0, 37);
     } else {
-        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37);
     }
+    ret.base <<= page_shift;
 
     return ret;
 }
-- 
2.25.1
