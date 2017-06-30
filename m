Received: by 10.25.227.6 with SMTP id a6csp5638413lfh;
        Fri, 30 Jun 2017 06:45:08 -0700 (PDT)
X-Received: by 10.46.1.147 with SMTP id f19mr6424486lji.10.1498830308044;
        Fri, 30 Jun 2017 06:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498830308; cv=none;
        d=google.com; s=arc-20160816;
        b=E/OaleuGYIscXQ3OocKa6sjLhvrqYKzLiG761NHwY5aDqjzlk6GVIpV5+UnSnbeTLA
         IqnkE4RGGIGuwo8bZL0gYREiOJQd64AmmbH4TOVnyd5u7sA9KOWIH2azrHQEO1RuQQZp
         uFJKyJK89wsThDMgJDknapLraFtaQqET0dFt7WiS0mIPmseepuIWLzmqQsNk9kF+lwbx
         WE8ZPKapNVVcTd7Z0ikisCWJ254JuQfZmBcsZre9/RazpLZ4Q6d6OpncDsaGfixWfR0G
         yA1b+1ZWVmL2NfGzO7G0VqqMfRDHIxESV+Wonpu1WrCvZA7oogYwGhxNYETGSOGNdWD6
         v2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=p5ZUed3+fyuQ5Au5llR9OOBWdlCSo7ZYkk2o3195Oqk=;
        b=AyV1jQMZjkzzx10mJ7/9m3BJrVR6idbjztb6JbmPvkOvgbsJGNw6ro/pXoLlEjWE8O
         XueXm2BiAMpLsAlvtGT/pYc6DqoNX2o6A6F36LZkSyTG/pBsrVVsfRtkgpEt+JjTiO/P
         jWs/ny3uq4HzWItplEUUGZOxRT9rwKBmr7BcBda77Up22E8rgOE1Tv8xGtRpRyar9OVy
         fHlzenqVTBEhYT+EFkiB8cBHFgEJf1U9w/T7f3EQShSc/6WJ6NfRFpT2hJBSXHgBn9NI
         IxUNecDME3lqtXoUSyIm+MIM5L8ua/vHKeueqv53M4afIGYYK1cyhFfid1vreh9QbC9y
         IL5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=XxZhA0Zb;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com. [2a00:1450:4010:c07::244])
        by mx.google.com with ESMTPS id f80si3871771lfi.232.2017.06.30.06.45.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) client-ip=2a00:1450:4010:c07::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=XxZhA0Zb;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x244.google.com with SMTP id g21so10121734lfk.1;
        Fri, 30 Jun 2017 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p5ZUed3+fyuQ5Au5llR9OOBWdlCSo7ZYkk2o3195Oqk=;
        b=XxZhA0ZbSQhsF9P0aOdOPfmh9zrDPPVe6nyHJuOi1L2Zk8I2ETNpB+EDAYRTtH3ms9
         eUlnlv/m5O76FTz55N987Oo95tU2u1iqjOcKY9gUzuVA+9fTdHyrzk4PCgldXSTb/ltP
         N8rY37+ytTiYYgFOC9D+LtmMWWE+OYWoqs1Gm1k04NoW/4kZJcw4hL+1qPCqcqZxsmhR
         oH2GMmvuJdwMr7CS3Biz9q53pWL+LwqbBzRp5I/269No4enDEdPoLEsj6/nm6fgXpagN
         9mnrQjg8H9CLQkmrPGKBq9/FXLU9zIUIzfa9GadyFvCrd4cVTqcAIfd68FK3PILTYncg
         RKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p5ZUed3+fyuQ5Au5llR9OOBWdlCSo7ZYkk2o3195Oqk=;
        b=koMyOWc/Nkddyk1Xm7Rrv5Qg/3y/69WXXGHYjLtTKCyAaqivQ9ZD+ASCWw1JdkxnFQ
         DsJkOJNs/9JBl5vGfyeoWI7co2XEyj7s6Hn/RRpyx8HfPz2bS0xmTlCQEXBnIcmJODkl
         MO7DldO/RbOhcc0d9Fx/8WN42BHoLBLDoCteXnzEOQA+w/dWV1djHHfqw8OKtigClwKZ
         0G63Xc6k/CFhDA9g/mA9cGCoNpckeNrfF5lyDTT9XyKZqWsuwBxDPPR3vO0GShIUlvoe
         T+vVNlNDugCBXVxuzVDN3AeKk64a+kd40wSUhi+fciOtaNhRTtsfcFwQL3XUusiuRo88
         IiyA==
X-Gm-Message-State: AKS2vOxqFngf8y0n8OmMY6HUWQiR0OP5G/3WnWOnlwet7DQod/SZfJlu
	NBoRk7z5rfaWlJyT
X-Received: by 10.46.33.165 with SMTP id h37mr7144061lji.15.1498830307750;
        Fri, 30 Jun 2017 06:45:07 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id 3sm1646621lju.69.2017.06.30.06.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2017 06:45:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 2/2] target-arm: Extend PAR format determination
Date: Fri, 30 Jun 2017 15:45:02 +0200
Message-Id: <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: D/DO8vwlFeNz

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Extend PAR format determination to handle more cases.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/helper.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fd1027e..6a1fffe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2345,12 +2345,40 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     uint32_t fsr;
     bool ret;
     uint64_t par64;
+    bool format64 = false;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
 
     ret = get_phys_addr(env, value, access_type, mmu_idx,
                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
-    if (extended_addresses_enabled(env)) {
+
+    if (is_a64(env)) {
+        format64 = true;
+    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
+        /*
+         * ATS1Cxx:
+         * * TTBCR.EAE determines whether the result is returned using the
+         *   32-bit or the 64-bit PAR format
+         * * Instructions executed in Hyp mode always use the 64bit format
+         *
+         * ATS1S2NSOxx uses the 64bit format if any of the following is true:
+         * * The Non-secure TTBCR.EAE bit is set to 1
+         * * The implementation includes EL2, and the value of HCR.VM is 1
+         *
+         * ATS1Hx always uses the 64bit format (not supported yet).
+         */
+        format64 = regime_using_lpae_format(env, mmu_idx);
+
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+                format64 |= env->cp15.hcr_el2 & HCR_VM;
+            } else {
+                format64 |= arm_current_el(env) == 2;
+            }
+        }
+    }
+
+    if (format64) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
          * Convert it to a 64-bit PAR.
-- 
2.7.4
