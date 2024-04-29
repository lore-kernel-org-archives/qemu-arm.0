Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931672ejb;
        Sun, 28 Apr 2024 20:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoE1Nqm/cuYqtSMHqqLSlKyTLOS7ipm9riJBkuHFTrT7Rb7+H0LvdiKSEmQ3K1apzF1Kpr/egNSNVEpBE0res18PDOH5Xz
X-Received: by 2002:a05:600c:4e93:b0:41b:77c1:82b5 with SMTP id f19-20020a05600c4e9300b0041b77c182b5mr6380529wmq.19.1714361079313;
        Sun, 28 Apr 2024 20:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361079; cv=none;
        d=google.com; s=arc-20160816;
        b=cotVjdkLqU0kJQSIUDN2DwTssLS3vceTOsT0QxWZjSotCmWrmRbGRnc7ntJIWqQBef
         klkRaRqF1byeb27I6Xk6j972YOvKHBacw00HXTjbO/MbaZlnZj4Y8lcK032kDMARYOnr
         QA/uahzdjSWy15vbjNg1LZWa3yca5tZ3CskrOcR2gMdFxDgBdTvWqtVSN1yz74p+KuwZ
         CQHTMN74sMSOB/lmfP1QkX5nXYNONXopBq9wQP6mTOgZMJ1WFRJNUV5uDknYmi7W7g9i
         wjFrKTS+RIK/fGG9/SDmjliRW13o5eVc7KaPABN9Z/Cj2Eh0b7oQWMDW0kXTIU4a8oH1
         ByfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=+2FrCp08msyUMlnVBTobpSr4lQVeOTHH3GZjzw6DLxA=;
        fh=cNl5EiHUO/h7IBujyhNJDP5NT9y/GmzMrbgtl3Qyx/8=;
        b=dn45yI0OypF9gLqmdjkrs+OgM9fg/v6h91gNljnNr2k48DPQySj4k6FB5b7T0o3CKQ
         FW22Fwc5IfgBHSbW1RlkqTEnk1bQssw4PH6wZJ4AiC7gv5KN771PCg5KP5jOi+rJ7dMm
         ORXaXxqGfFuocLCrITZfMkT0KFuW7MMeqF019pDXJcIlFHbuvtQHCzxpO2NA24x/dwIX
         v4Gdfa2T45469VnRSdJJvTmDecYWHgd7QBz1IA2lMjfLT5OUf0qnEGfLsNQd0286T93R
         7Hf1FFtjrbVwCpIi3rcpa8JeszrW/y2j9/1jee8LxQYu0Y1ZJFbNciweS/DRgY/4O5Ud
         cEOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FF1UQjxy;
       spf=pass (google.com: domain of 39hivzggkcxe9359arwrx55x2v.t53r2ve.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39hIvZggKCxE9359Arwrx55x2v.t53r2vE.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <39hIvZggKCxE9359Arwrx55x2v.t53r2vE.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id f13-20020a7bc8cd000000b0041648af1373sor9458397wml.10.2024.04.28.20.24.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of 39hivzggkcxe9359arwrx55x2v.t53r2ve.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FF1UQjxy;
       spf=pass (google.com: domain of 39hivzggkcxe9359arwrx55x2v.t53r2ve.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39hIvZggKCxE9359Arwrx55x2v.t53r2vE.sv44vv2z4r85.58x@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361079; x=1714965879; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2FrCp08msyUMlnVBTobpSr4lQVeOTHH3GZjzw6DLxA=;
        b=FF1UQjxyfYcLWFSKaTYhLe7UnHRdHSa4OwIp8Kg69FJqTAbsMdVLsijz3rqjoGdWrP
         VeUvP38/6ot+xcc31O7VKrchO8Z4tnsMQD4EpJjTdeUSlq8J7uDWd0aZjnDFgMEYXulo
         KvEksp0m15ytuk6i8Tcwwa1Ycv+DRjq1nbxTPzFrGKSccLf5m0VufvCmLFETAYDPR+ZT
         TndAdyXUjqjA1/wZ48hYs30HbBRuCe2ey3rUcw3b7pWhf6C0NDwsyuI2bNNtmm7dE+wD
         ShYJojIQjr6RXk5T4qP/X/hhOVbygl6yEi85x3PIF8GpJepHoy6OYo9czMfBLvAdqvMa
         F74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361079; x=1714965879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2FrCp08msyUMlnVBTobpSr4lQVeOTHH3GZjzw6DLxA=;
        b=qfmJejX8aRvo4Cf5n9U5IP+mcH4yyNMM2uUIJ4sOdqn7mauQy6Xa59Cp3PTiPRpCF0
         2zFOtzWEz9562D1dQqm25j2SeL5zc/pfm7LTRhsPD2E42YCX0UyExgM9K7pmSSdH7iKB
         6Xi5v1gRcGQbF75ALrrEd81UDhJhAErKFrK8MhwZ3WVasmugf6f+xW3UXlu4oIuEUXQg
         5YT6FBaxo6rWsjdsUnAypFK8Gd9P2nqEozC8wZA5CSLV6qoMv1/XCjr9F9bqjEkKD2JQ
         4qMIRioTCtcfvosIeXoOioWhrziruBxRc2JAwjzg+O1EGSf/5bWt0pxYsXfgOXmtF5xb
         MomA==
X-Forwarded-Encrypted: i=1; AJvYcCVSt7YnkAogdAb/QQXpRyJT89yhxoUJYhmIYpEg2HPr6FiA60b8Bc76zem4zHDjVnFmHOjdQcDuoFFRaTbrSgr0E/NgyjQV
X-Gm-Message-State: AOJu0Yxt5pwRpVUhds3Gk/LusQh6U2Pd7SE5Zpti0RkxoqtY/X1G/nnV
	vGKBs+lHGriGyf2PrESrtDSRILo8kXpIN90Q7VJatQCLZ3UHhQx/Tv7baPWE1XkfliI/5xRtj0d
	teCIxSECM/w==
X-Google-Smtp-Source: AGHT+IGoL+lY5+giB5jeMhcbGdrDzJJTUxK+poXpGh4Swf5KRYTGZ6bsPJ4nrEnSfh1GNr4mesXuoscCIcArTw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:3b97:b0:41a:2857:fcb5 with SMTP
 id n23-20020a05600c3b9700b0041a2857fcb5mr32887wms.5.1714361078951; Sun, 28
 Apr 2024 20:24:38 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:47 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-4-smostafa@google.com>
Subject: [RFC PATCH v3 03/18] hw/arm/smmuv3: Fix encoding of CLASS in events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 0CccORZJyitI

The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
class of events faults as:

CLASS: The class of the operation that caused the fault:
- 0b00: CD, CD fetch.
- 0b01: TTD, Stage 1 translation table fetch.
- 0b10: IN, Input address

However, this value was not set and left as 0 which means CD and not
IN (0b10).
While at it, add an enum for class as it would be used for nesting.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 6 ++++++
 hw/arm/smmuv3.c          | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e4dd11e1e6..0f3ecec804 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
     SMMU_TRANS_SUCCESS,
 } SMMUTranslationStatus;
 
+typedef enum SMMUTranslationClass {
+    SMMU_CLASS_CD,
+    SMMU_CLASS_TT,
+    SMMU_CLASS_IN,
+} SMMUTranslationClass;
+
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9dd3ea48e4..1eb5b160d2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -942,7 +942,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             event.type = SMMU_EVT_F_WALK_EABT;
             event.u.f_walk_eabt.addr = addr;
             event.u.f_walk_eabt.rnw = flag & 0x1;
-            event.u.f_walk_eabt.class = 0x1;
+            event.u.f_walk_eabt.class = SMMU_CLASS_TT;
             event.u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
@@ -950,6 +950,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                 event.type = SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr = addr;
                 event.u.f_translation.addr2 = ptw_info.addr;
+                event.u.f_translation.class = SMMU_CLASS_IN;
                 event.u.f_translation.rnw = flag & 0x1;
             }
             break;
@@ -958,6 +959,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                 event.type = SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr = addr;
                 event.u.f_addr_size.addr2 = ptw_info.addr;
+                event.u.f_translation.class = SMMU_CLASS_IN;
                 event.u.f_addr_size.rnw = flag & 0x1;
             }
             break;
@@ -966,6 +968,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                 event.type = SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr = addr;
                 event.u.f_access.addr2 = ptw_info.addr;
+                event.u.f_translation.class = SMMU_CLASS_IN;
                 event.u.f_access.rnw = flag & 0x1;
             }
             break;
@@ -974,6 +977,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.addr2 = ptw_info.addr;
+                event.u.f_translation.class = SMMU_CLASS_IN;
                 event.u.f_permission.rnw = flag & 0x1;
             }
             break;
-- 
2.44.0.769.g3c40516874-goog
