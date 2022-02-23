X-Received: by 2002:a17:902:d892:b0:14e:e074:7ff7 with SMTP id b18-20020a170902d89200b0014ee0747ff7mr1684865plz.29.1645655521970;
        Wed, 23 Feb 2022 14:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655521; cv=none;
        d=google.com; s=arc-20160816;
        b=uLdm+GnBQm5GuYehYQ9px/2tBn/kt7hG3HgkHeMfFIvrgErgMDtXms0jttI5X/xc8x
         bhuGbUsRPf1Pw3/Q4EMDeW5JfnOCY/Tziu2chXhrE7ONow070A+w7QgwLSDnYjYHgCdz
         w3/YoRmMdQOjpTs5OQ5P0xzCsRz3nEQLKu+U/olFYTquWc8NeZ7jfbm2bjBUyprRUPEf
         16AOq8yNX+3Xfst9ZL54y5xIeG+0ndSFiQe+7WCcJhZNWd701TcanBRi+XWFThKmCEDJ
         A4J+l2rAN3LCmAMfvJv4T7Z9unR54p+vj84Lft1gKZfLDnOX/f48tqsMy8NvRYID/LT7
         jGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=xcBJqu0EIOCxOgYyumf5ayqi/qsAIX+sgRZbsW6LaMbw4hGh1sHFqsoZgYw2oNo9E9
         zUn+aQmbGE1ES7wciDJbvwTXy5A26hAoh6u2ULDVNW2iUhU1LxhgwN2GujNNjHJeR+T4
         OAHoii4MahXi9xdoQ7n/qvEthAY7RoiWKqj3zcQJ8ismTkIorE1Px3dovF5BXJWuv6kb
         c0N9kqK0dJ85/1NzVerSMwizx9N6oZ3xpWM4jIGY80TLiiLJaIMX9S5EPXpH4GYWDupK
         Cr/nnbF1dNgCqK30WjmXrtoCRwfcyA8oTKf6nOXQBejyNRov8AIcdkwr3sFjYGgQdBrR
         5dAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WddS2ivj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n32-20020a17090a5aa300b001bc9f0fff4asor1244551pji.25.2022.02.23.14.32.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:32:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WddS2ivj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=WddS2ivjSWfNCTiD1OOwywbmtXYERS9f9cKw9sBPsqwsdwF13gXFDZQXznIoHcZ6Z6
         VQyCOG8v3AIC8azqObcb5p1dJP4zfkF31qkZiNoGUpICs1dEeyge0k0egcw27mUk+1+G
         ZonCBG9cj/spNu8efQYMwJO0gZAVWYP/+ThksB3Cr9G0xgYPv1QrNAPT7iGieyS+nKsp
         wuHI/Aa+rIX+6PdRKmlm7b/toLTQ2r1sQtyJM2bckxJXM3t4BDGO53Albqq2N5sRin+n
         1F6vAsntLlGT/B78qOj2I3pbAG6husIZN2qPjs23rJMvmvKC4pKBZgyP/cUmjzIvHWL9
         nkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iuG8ohkKwqyyIJ7svsXNRHI3s70BPYfliw43HdSQEsk=;
        b=DeG/8ketBHyOsJVuS7qbURnsRx3lNOrIaqvizsfdJ1x3NQGniLF9rm3VZwXzGSHqeo
         bzsndsOb06/Sjps0EgHAXaXIsGFcmgjJGTUy6ZFlOlokKNUedc4XLPedgV2gt2OWY7Va
         ZUQWh2n7blpxdMdaMAs52mqggIi/HTCQKilbjGWk6A7nxnAbOy7ARlqc7/AqwbVk9Z14
         iQL8MQ2s9VOXr5cg3GijceR6ffcqm5JLsQ7ue0C7+B4hA5mi0uPTP86pfISCrGFtnMkS
         vzeSKWXKewpKc1VALdGqS5/JtyS1CoYZ1IWVb+QFKXRMzwWyeZ73VxUuabOKoqTPCM2K
         KdoA==
X-Gm-Message-State: AOAM53215SLldgo8oewlLbqkYdn7DyJjMVlLHf1oHRRdUbtjc2ecdLuN
	IUffR8ByuDlKWaBxUtRJb1kshmPwu8ww4a1e
X-Google-Smtp-Source: ABdhPJwmGB7nO0T90zWZHjoGI3XAZh3emi1m3aJnIDJp2hxS6HdgwuBWUC4k9XZj+LAFEjQl4fbZrg==
X-Received: by 2002:a17:90a:4043:b0:1bc:450:df68 with SMTP id k3-20020a17090a404300b001bc0450df68mr11308406pjg.120.1645655521450;
        Wed, 23 Feb 2022 14:32:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:32:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 13/17] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Wed, 23 Feb 2022 12:31:33 -1000
Message-Id: <20220223223137.114264-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BuTMOJo+LYIs

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
