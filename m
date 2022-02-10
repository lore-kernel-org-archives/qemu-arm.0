Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287856lfk;
        Wed, 9 Feb 2022 20:05:03 -0800 (PST)
X-Received: by 2002:a17:902:eccc:: with SMTP id a12mr5658625plh.140.1644465903721;
        Wed, 09 Feb 2022 20:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465903; cv=none;
        d=google.com; s=arc-20160816;
        b=E0JbwnNMSO7PJ+THRh/q0qPkZ8s8T2gxNoneLPBo6rhjmzZTPqVrp0MbLR5ZoVYSgG
         HUVjmU85amNr37wF1MgQ65aa17D38HGq3/+xhCSA8AHr3Bi1kJ5PRpb/yrPXHsqvvzcK
         qvM7nsfthlmjj9fEbg1Q6kt6KWsvn7iG1OXtbEZUuggpAfs7qno2bhOn9ZJfVHfUhhd4
         uWelFcT49JBUCeYUf6j3lvO/9gl9+Q84qJcqIu6olbZM3VEjSQ2oPs8nT4ja5nz3yLX4
         KHnh6dfRlLygDVzh0Qj2rAZwF5VYi0tehW8hmDUauvt3ba+EZ9+1253frVE1TK+5ssie
         OWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aZMJ4LHirkyrTFUMYXP3OGnbkdQ4YiqE1mw9fVX5Eu8=;
        b=aBpsf2Cqfji/na97cJOO6gKgInlT1X+tTRNWlXny6phfgtM0JokWaPnBWEJV1K+jhC
         9NRmDzkHMWzKoNqgY8Fwy9pCvqT0HzVU0NBPDCpgRHlO2nJ//q3czZ06XrY3iUmlay3w
         bONa3HlYMrXYcCg5sbzZTohPeDfSMH5U+9ETWPueGkQUH2q1GLwxkndgIB59HDYRvoSQ
         kZEm9p8pWzxdZlKaZr5wZM/LwCTeIOe3fYaXDJMbgPcstE1UePGVeT9RWuQSoOxlBfLO
         m59ksuIKzSekPNlQaSqsNRlx2L1DTyLtplVnf1YUh+LzNzorvAKum1/Oh5AS2pRzHurV
         ktFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFiizMju;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b128sor9489575pfb.19.2022.02.09.20.05.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFiizMju;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZMJ4LHirkyrTFUMYXP3OGnbkdQ4YiqE1mw9fVX5Eu8=;
        b=dFiizMjuyAOlvpLu5BMIdCQJsiTAzJkRTbwCTyy3hUVEIrv4mlOyx434t0mPJEcMwj
         fFdfhVuEa8L57O6vmsO+0w53JIqIGp9TfXymIm+LXTydF4L3U7+1iHCOjF/Ry8HYwj94
         bi10uJLjD7DxPDNRtr1zNDlTPbY08CtnCh6WtcFmj05FoWhcnC4sPoEpwoii3dge5QlL
         lxWG2QoNKKYnLPvN4WvIkijNXtRH8t6F4riu3QLwnuaYVcnrQD+/FFVIBnQHx5cSxMtE
         evDS/i3tysK1Wd4spYyEzZw5CIPeBcBrFotJsiLqFSdCRLyoEJ2uhrqZwjkFujtQWS1Z
         Z9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZMJ4LHirkyrTFUMYXP3OGnbkdQ4YiqE1mw9fVX5Eu8=;
        b=c1AXMo2825/ZMSaE6rnlinkP+aWeYSX7dufKuPgS3ditXBrU7cu5+G9Z5JX99uWDxV
         DApFZIYT450uEmaoDRpHNxLWmsoQ+JBrfdyDCZRp4bF4qy83DVIRz9VAKtro1fnfYQRs
         5Aet3LFJ44+b+Yi/uXAEXCcJHhnPtMZC7t9Own7UkfEgY+UdnCILFc93F7tAhvp+6ETO
         OvmFmsvC70fmFaU/siGe8ed4Pvv8/YPNkKutGSRNyhC7OPxgOeR5MDJOIO7oNDruv3DE
         YedzU4N+AqHbPcaiQ0ma7dSPyvxRp2T/yJk10n6s7+DbHpUZ218qA/d3Oh5qIjsJkBgj
         tckg==
X-Gm-Message-State: AOAM530WTbuP9Yp33VmnimmXokTNzN2nulR+s2A/TW2+zwd5ytHFYciJ
	hwLLwBlL7BZJjmO7MiwgBng97UGJ
X-Google-Smtp-Source: ABdhPJxy0s3Ze8bTt8IOrs4J51aKpB5h/1mWWKMzCc3721UNkxernbxQU6A+2BljfDSDl0pafEhRgg==
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr4607661pgb.491.1644465903236;
        Wed, 09 Feb 2022 20:05:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 11/15] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Thu, 10 Feb 2022 15:04:19 +1100
Message-Id: <20220210040423.95120-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tWH5H8LKU2wd

With FEAT_LPA2, rather than introducing translation level 4,
we introduce level -1, below the current level 0.  Extend
arm_fi_to_lfsc to handle these faults.

Assert that this new translation level does not leak into
faults types for which it is not defined, which allows some
masking of fi->level to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3d3d41ba2b..00af41d792 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -462,28 +462,51 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_None:
         return 0;
     case ARMFault_AddressSize:
-        fsc = fi->level & 3;
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101001;
+        } else {
+            fsc = fi->level;
+        }
         break;
     case ARMFault_AccessFlag:
-        fsc = (fi->level & 3) | (0x2 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001000 | fi->level;
         break;
     case ARMFault_Permission:
-        fsc = (fi->level & 3) | (0x3 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001100 | fi->level;
         break;
     case ARMFault_Translation:
-        fsc = (fi->level & 3) | (0x1 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101011;
+        } else {
+            fsc = 0b000100 | fi->level;
+        }
         break;
     case ARMFault_SyncExternal:
         fsc = 0x10 | (fi->ea << 12);
         break;
     case ARMFault_SyncExternalOnWalk:
-        fsc = (fi->level & 3) | (0x5 << 2) | (fi->ea << 12);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b010011;
+        } else {
+            fsc = 0b010100 | fi->level;
+        }
+        fsc |= fi->ea << 12;
         break;
     case ARMFault_SyncParity:
         fsc = 0x18;
         break;
     case ARMFault_SyncParityOnWalk:
-        fsc = (fi->level & 3) | (0x7 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b011011;
+        } else {
+            fsc = 0b011100 | fi->level;
+        }
         break;
     case ARMFault_AsyncParity:
         fsc = 0x19;
-- 
2.25.1
