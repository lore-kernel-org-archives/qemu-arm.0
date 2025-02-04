Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183735njb;
        Tue, 4 Feb 2025 04:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWv56a4OEr9tC+jn3UA9Y8cObq5vO9lVVbjE6QqW3OfemphYPBOa32cje4FjxAa4+7JUM50jWGPqfOAhg==@linaro.org
X-Received: by 2002:a05:6000:1f88:b0:38a:4df5:a08 with SMTP id ffacd0b85a97d-38da53da1a7mr2263322f8f.22.1738673419351;
        Tue, 04 Feb 2025 04:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673419; cv=none;
        d=google.com; s=arc-20240605;
        b=i2Tf/WjkYpFM3/YmfWT/9QXIXkwvpE1mKhqnImwGnVUDPoC5VFqIkALz+yV+m+nfgN
         xcrxpY/2f42o8wksGWEhERc/uJzLUATDrWolxfttTt28WYFXCAVA8J0BKIU5+mcxw4ct
         LfcNUh/QaSV/8xi8jXk/040vo8WsSHlKSg+ic5JsuWZa8Jtj9eWrvaobZDsGc8YprM3Z
         slRFLuZ7iMn//MFtU0CbWqTN8Ng6/VF6cxQXiB06jrP9b5dMz5CEYR7/NJDretRWDqXM
         5CL97N3bTSMZbbbnlZ3wdTQryYErRj4ZL3vNtyc6DitW6dlA9WA6Tk9wEIBsn3NjPiT+
         F4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+/BkF7oHf/xZr0+f8qz/0hceFUupsWr4MwchLEbF1vs=;
        fh=o6R6UGj0rQ0CZ1kYaI3+M5dC6xIGtEF0hbWkgjhvp18=;
        b=YqrAW+EeW786I5xEycgUn7BMPKaU/udi8ux3tuPEl1oW4je6G98W2x6/ftDqtFHUrc
         BbpxlvRqwl7iKXm0UAtYm/ZNsSLtR9aJE84H8sbLU4TYIK51Xe4oVvGLVXy3lXKHYtWZ
         L/tHK5r66h3/OShB2sT82WTwgBPB+Lwt6IgEcdkzOpC1AYN15oLn2zmB+wQfNtYmp2gZ
         8wQ9nnGCHtm+qfV6Ujud9VDe1mcRcZknEn215Odw3kYIBxl/NY10NShNg9T3szW8bQso
         P6m3sclvzPzY5J0C4rA1AWxJaPbZ/tx7jTc7fU9K4aOgYD8ngT7W5Wa0Mcf/ReqAfClR
         a4XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQexEsI1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38db15a7653sor56948f8f.3.2025.02.04.04.50.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQexEsI1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673419; x=1739278219; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/BkF7oHf/xZr0+f8qz/0hceFUupsWr4MwchLEbF1vs=;
        b=YQexEsI1x/A6pVP59BWARex8jCzNSdX2ntjcTN0Jfe/jiXd9REttgwh2aWJe9NI+9j
         1/wqhtRD7P4pPkTmDgxfCHh2mfaQ/i9mcE0kWjyyBH7GOIc7rCFQXILqGSBWxPXFbqYW
         Od14NkXarwziuVgJdR/Q90yIU0kk+70RT9EtLxV90WXfkgFVf0rMZjJquOUa5maqBI3D
         cH00z63WHsMOtQiSANEBReewheH8QwDoJeI1xCDV6MgZDUU0mwAy5BnrIqBfuhr/MvRH
         fAzy1tYQTuL0SAH+gCOGekOlrn9BSrPUxyUgUL/DQ7w85SQp5IR9+0nQxmvTCthlodJ9
         OEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673419; x=1739278219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/BkF7oHf/xZr0+f8qz/0hceFUupsWr4MwchLEbF1vs=;
        b=RBVKP8bgnsFkkObfy16FgWp5Ui+9CJhXrnM+TJxvDKAmvv+Fki0Q0osrHluxfd4GM6
         BXw0KsfUGd451JisubLsIZi0oR7nZtcAofNRSzz8RJsKXRtHberGRtTAzqraI8Rp3K/x
         yH71cEJbTh1r8oh08W7n3ncxbpEYcpitjyjSiGAobkQHBiXRHeUiVGe68VJFL0CGfqD7
         mSabgQqdmJc0R8dVQxPzK9LaeW9zGPj8T7k5eWeEU83iJgX4QYz7JjqzBnhT+u1VC0sK
         OTdodaLcvsgyW57WFwKbmUoleMyxdB93Bo3kRE84MrhSOuAhyxHVDcREaM1AIBz4Ht4h
         f3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+NbHWeLFYBnuQ0Qq7KT1oDbIT/sGIhrjdA60FQ1+91i4l88zvKSg58GJn7ZQF639EQC1qeO/hjZz6Zg==@linaro.org
X-Gm-Message-State: AOJu0YxqpSDUAWqZQdLEAZT+/J3fcfW5p3MsGKEyIPisvzIHGcqNRvpT
	x2CjwAdL3JJv+/xM1o7wYXhFdDJJVx5gsAVO2Gylpf7Ml2xdprUtLHUSztu230u1Kw==
X-Gm-Gg: ASbGnctj+NyThIX61YLRJ/Ve+XeUWaCdYvxmNZ4iHKsFIAlMm7Vj2DVlMCl2qb7kV3l
	PhEa3IuaXZJojuw5ttmpaU3QwSOVCTL/Z5rgZC+APWsXpbp8PbxePBwAmTMoESnrKGTH/xHo+FW
	KoHpWCdq1M9dLpTM1LnFl5lBJ6DkCg1UZrY3Mr+u7BnPmFlFNae7XE6J4M4S7E0y6G0R6J7MI4L
	YonzdKkQHPSnfHxtYnhWBjPMTpy2dBGOucvXbU2Ngl5rgt7JiUMKN0W25KWkbK/oiA6Lad6Wlhn
	0eSSQnzFwb40YJIfluLzdA==
X-Google-Smtp-Source: AGHT+IFPtxEvx565bOiiwHo/qxME4TNBFj6Fwm855XBGv0XfOM+j12lnOJeHgG+QZfljwrZKb8/htQ==
X-Received: by 2002:a5d:64a8:0:b0:38b:d807:f3be with SMTP id ffacd0b85a97d-38da5386429mr2278587f8f.3.1738673418819;
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 7/9] target/arm: document the architectural names of our GTIMERs
Date: Tue,  4 Feb 2025 12:50:07 +0000
Message-Id: <20250204125009.2281315-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9eyi0yvJHJj+

From: Alex Bennée <alex.bennee@linaro.org>

As we are about to add more physical and virtual timers lets make it
clear what each timer does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[PMM: Add timer register name prefix to each comment]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gtimer.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
index 0e89b8e58d0..d49c63cbf87 100644
--- a/target/arm/gtimer.h
+++ b/target/arm/gtimer.h
@@ -10,11 +10,11 @@
 #define TARGET_ARM_GTIMER_H
 
 enum {
-    GTIMER_PHYS     = 0,
-    GTIMER_VIRT     = 1,
-    GTIMER_HYP      = 2,
-    GTIMER_SEC      = 3,
-    GTIMER_HYPVIRT  = 4,
+    GTIMER_PHYS     = 0, /* CNTP_* ; EL1 physical timer */
+    GTIMER_VIRT     = 1, /* CNTV_* ; EL1 virtual timer */
+    GTIMER_HYP      = 2, /* CNTHP_* ; EL2 physical timer */
+    GTIMER_SEC      = 3, /* CNTPS_* ; EL3 physical timer */
+    GTIMER_HYPVIRT  = 4, /* CNTHV_* ; EL2 virtual timer ; only if FEAT_VHE */
     GTIMER_S_EL2_PHYS = 5, /* CNTHPS_* ; only if FEAT_SEL2 */
     GTIMER_S_EL2_VIRT = 6, /* CNTHVS_* ; only if FEAT_SEL2 */
 #define NUM_GTIMERS   7
-- 
2.34.1
