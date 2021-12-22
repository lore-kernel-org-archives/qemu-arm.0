Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp2777918lfb;
        Wed, 22 Dec 2021 08:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw964d/TiW+BWtxGNI5CJkX2ujrfhYlmjYYVx+bCutXzsTTMFQ8buxgrV+/7gcPgvukCNam
X-Received: by 2002:a17:90a:638a:: with SMTP id f10mr2231485pjj.187.1640191831108;
        Wed, 22 Dec 2021 08:50:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640191831; cv=none;
        d=google.com; s=arc-20160816;
        b=OQFsrBoHDvXBDalNAofhnM4FiANeWS23uGr12BSf3IT2PuJ85/itmo8sZqDKXrCck9
         9o9PHVG6WjNYn/5RaGDd5H55KiWE52bs4YvkcvnEznjJHPMfqNo+OLZ3viYI8Bn7MT0F
         2uO48/8vLPVfTjE34KC5pAxM1giX+dUuND9sgEGzowwMFbDJBGDrEj6nkqLy2Z7XjSte
         jfcDgLWaVW9cHx1CdbkPCK499v7TuKm9OjrGdV0oA0aE8kM9LPnq9dKm1xXMFBoVnF1q
         eaibb47DJFHgq0HusoC0C/aeTe/yl09SO/7VbLOLo4TYGVLbZ+udeUJqV9paWAkHDemq
         cjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:from:dkim-signature;
        bh=zLhmjiNW81yce1Sj4R/CiN5IVRZe4Fw0mhmrjXUjf58=;
        b=pE7wFn5cc0pA5Ac9RLIBiMUBh5lZw6l0yVNGLXL5R46uPLld8lhc5ovSoatyyOkne8
         qsl9kzoOTM8nHLQUyMjEKNGwueTi5e+2LZxFUzIsc8GacE2hriGLIy75jYW1iNI1Nwol
         1s/UXKSM0fLYw6TcU518S3SrOFo+rQYbTAV4kAMwCXTmSCHRMdaOBTsaCca7LFkj3OWI
         l3jK2KX/1rkWXBkGJG4Zcx8S9LzV678LY+cAQ8Z66AOvWe3DKkVWF6fzkfVYV88oa0ZE
         qB1w5A7cWans3KZOZAfPw75NGH5iH82b9v/B0Qk2f0FlQAuBOStdFCCx5zpcrcGDUWYB
         fXEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@svin.in header.s=s1 header.b=QE8BOvF1;
       spf=pass (google.com: domain of bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in designates 149.72.131.227 as permitted sender) smtp.mailfrom="bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=svin.in
Return-Path: <bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in>
Received: from wrqvvpzp.outbound-mail.sendgrid.net (wrqvvpzp.outbound-mail.sendgrid.net. [149.72.131.227])
        by mx.google.com with ESMTPS id k4si2146448pls.274.2021.12.22.08.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 08:50:31 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in designates 149.72.131.227 as permitted sender) client-ip=149.72.131.227;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@svin.in header.s=s1 header.b=QE8BOvF1;
       spf=pass (google.com: domain of bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in designates 149.72.131.227 as permitted sender) smtp.mailfrom="bounces+23648303-eab2-alex.bennee=linaro.org@em7421.svin.in";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=svin.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svin.in;
	h=from:subject:in-reply-to:references:mime-version:
	content-transfer-encoding:to:cc:content-type;
	s=s1; bh=zLhmjiNW81yce1Sj4R/CiN5IVRZe4Fw0mhmrjXUjf58=;
	b=QE8BOvF1usHq4Vd1ZxihI/nIdF8CcU/VB5EtbAGLDgbhH9R/3mwrNm73ZZ5k2beFOMHB
	KrcAfnmGmVdZDgpAg6HN17h7XJaoyyRHeGOuu+I10ZW4EZnj4+lPt3sD2jlqjnq7wwIbjt
	eUHDRnSS6q25qaasRWY7Cr+Z6AhcCokAJc+HTYY9LFqqrxvob0g/oklMQRB/Abtl2daTIM
	70YDjqj/WZPgTT/sxbL1yUBwXhIzCj2hG3MB4k74no87ON+plTzdGloS4u7gsEoXfWufO3
	qxzy+Xl0TBz8HNHoJUkX6uthmiF51H2/4brZZRyUz3rlIte5OkxikAjm+OGkZN5w==
Received: by filterdrecv-75ff7b5ffb-wdd5z with SMTP id filterdrecv-75ff7b5ffb-wdd5z-1-61C35756-10
        2021-12-22 16:50:30.396739294 +0000 UTC m=+9657038.498015085
Received: from ne2.svin.in (unknown)
	by geopod-ismtpd-canary-0 (SG)
	with ESMTP
	id hmvWGZicSB2dPyS9f7qH-g
	Wed, 22 Dec 2021 16:50:29.934 +0000 (UTC)
Received: from authenticated-user (ne2.svin.in [152.70.50.15])
	by ne2.svin.in (Postfix) with ESMTPA id 3296017C09C;
	Wed, 22 Dec 2021 16:50:27 +0000 (UTC)
From: Oleg Vasilev <me@svin.in>
Subject: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Date: Wed, 22 Dec 2021 16:50:30 +0000 (UTC)
Message-Id: <20211222164947.634759-2-me@svin.in>
In-Reply-To: <20211222164947.634759-1-me@svin.in>
References: <20211222164947.634759-1-me@svin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: ne2.svin.in;
	auth=pass smtp.auth=admin@svin.in smtp.mailfrom=me@svin.in
X-Spamd-Bar: /
X-SG-EID: 
 =?us-ascii?Q?vuv4bBSMv+s+sLXfbA0TX5eOZYkSPfNDFag09+IwHa3cTVRX1snJTadgqJKv5P?=
 =?us-ascii?Q?2zPXL7uUC6NwItvJ2jYL1lMb1xkBe=2F5F4MFlj6L?=
 =?us-ascii?Q?7JGFHUT+y8kcPndQ1Xap9ZUGSBvijTvkJeouvhH?=
 =?us-ascii?Q?kNieSAp8ysvqfB3ue2n7Rp2L1kYW3C52698tK6x?=
 =?us-ascii?Q?pBAnxM5rHYshgbJaPvjuqQtnXCeSRv1y2NsSVCA?=
 =?us-ascii?Q?sWVp47MSXAu8U8TLI7xVKnLVVSuGbvkuyG1chv?=
To: qemu-devel@nongnu.org
Cc: Oleg Vasilev <vasilev.oleg@huawei.com>, Alex =?iso-8859-1?q?Benn=E9e?=
	<alex.bennee@linaro.org>, qemu-arm@nongnu.org, Oleg Vasilev <me@svin.in>,
	Peter Maydell <peter.maydell@linaro.org>
X-Entity-ID: R60PFX0ZT2z0LR3J/oF4GQ==
Content-Type: text/plain; charset=us-ascii
X-TUID: mUysUlVN9CgC

From: Oleg Vasilev <vasilev.oleg@huawei.com>

Now it is available for other files to use.

CC: qemu-arm@nongnu.org
Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>
Signed-off-by: Oleg Vasilev <me@svin.in>
---
 target/arm/helper.c    | 17 -----------------
 target/arm/internals.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db837d53bd..747c94fd95 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10275,23 +10275,6 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* Convert a possible stage1+2 MMU index into the appropriate
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc..a288fe019b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1132,6 +1132,23 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 void arm_log_exception(int idx);
 
+/* Return the TTBR associated with this translation regime */
+static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                   int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 #endif /* !CONFIG_USER_ONLY */
 
 /*
-- 
2.33.1
