X-Received: by 2002:a17:90b:1b07:b0:1b8:af50:5c0f with SMTP id nu7-20020a17090b1b0700b001b8af505c0fmr11442851pjb.184.1645655519046;
        Wed, 23 Feb 2022 14:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655519; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrS2gSPJUQD7BeW5X8go3JlH0K09DJ2rngl22b7WdxzaoOwPlkYQ68CMq9A0oiGqnc
         rgqMp2bi/m9GqWDDR4kXqepQP7b0bWdGzTZNDJT2esL63D/3i27jLhNMlvlqUL7GpMoP
         rPryCKHGgP07k5mxSkgb7hvVIRs6wpB9e0KJ8yM34naOuvB9LP7Sv/O+xOXZ+2fYwcyA
         oB101W9nMYAu3H0IFvIg1+PwivtI7esd13Ug4hNhknHFkJ0MEfT1CVcDvHMUlqKcdzPJ
         nmxPy+0EJNJ7HRcnQtrKU98rhrmPUzEkcPt7W9S3iJm9nIIjZtTcNBrq4O+Ry/VR7Mln
         7MCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=0QYxlRFA3qp4v7IJIO3lMUYHvhO7CV8GVExXWhoZbgq+aVEDCATa7NItM94Ngj2unG
         kFfoiBjk71nvT3dV61RV+9atrHTStupHT5nm2JPaTppy3VXWSRSEsjspyB81yc4Dxqq3
         KQXlZH4hSKvSrigqmgJiNE1lPhz1P/kmlyZSCoeaA+tiYgjUmnvCnUdCAmoAjRErbY0T
         e3NW+SMyJymWZys/JTkmsUVgOtXJGrOALpYTy2KqIZ/dRYxuJOMb5lmi9i31bW8SbR4+
         liEC/uT+jVYbb3INIakZbklTI/+CEjDG7nXFozqBWjXIOOsaBfuEYrAc35wney24TPwX
         a5qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiY62Skr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q5sor858737plg.90.2022.02.23.14.31.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiY62Skr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=kiY62SkrmyQWbDayOPFjfJYfbitMiww3SYSsE9+fJJtcUdtQ2/ZtABx+iTOLRtu7BA
         SNyzfun3bSubk7/e14xLtbHHMot6XIiqB2ue+Hz0B7HbpVZHuzPCZO8OUyAgeU5o2owh
         RJM8vZxXR20PubDIG6MEadGNoiJrqhXinj577l6Wf03p85OnOMuXgXRjC5CNkuwECs9P
         t2PJGLWPfAf8gb4Rjmcshkn5syu5wcESsuB29jV/PpV2TeddfBoqX80ntGVEgn+Qpkok
         XAAWiL/voPtjociSk4lUotdgyOZddcs4g1aWdKITGWQgwdXnlzq8T4D6+s/CafVjDyPS
         uypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=rmM97/Q9NYnDno/oGBgMcxQKwe1XmSEtO/g+lgxP/XJ7XuXwJYR8IM2GcWpkVnXyEp
         b+j22535sV97Uerb1hJF76AjE/ocTIPCJNw4HwflLNopheAiElx6iQ04bvAFvZlF2kdD
         mGNcgX8+bLF4bG/woqnzqMVJZshfJEfU90jjO4iMwahThpnii+KkDzIVEoEIyBy/FZ3d
         Ukhix4V+4tCqnZOjvshrGpW8sRa4/Z6CVCExOSuFOrg5agOZsSxAHfeqDrcCSsF8Si+U
         4wrKONwBtstlP2hbL/iALVTepDZxc5RoKQGCzsxMFEsC+xc8vYIGb4GmdV3M9cmqc2Z0
         PriQ==
X-Gm-Message-State: AOAM531JKMu93nfvVy8+dYFt/uZ/sx5gJZ3DupGMba6BU5sOTF2nqiLG
	gpPluVt3lejlmTsSMPKCavkeBxx8z8Uz/cTq
X-Google-Smtp-Source: ABdhPJxHVxO3n6VHv8tKKO6vPJ2exXv7sP6qDqb0/aUOV9rT9qlF95ajK+GpOEN5reUMpMqagGrztA==
X-Received: by 2002:a17:902:b94b:b0:14e:f1a8:9b99 with SMTP id h11-20020a170902b94b00b0014ef1a89b99mr1909464pls.28.1645655518546;
        Wed, 23 Feb 2022 14:31:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 11/17] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Wed, 23 Feb 2022 12:31:31 -1000
Message-Id: <20220223223137.114264-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ET8W7nEfShqv

With FEAT_LPA2, rather than introducing translation level 4,
we introduce level -1, below the current level 0.  Extend
arm_fi_to_lfsc to handle these faults.

Assert that this new translation level does not leak into
fault types for which it is not defined, which allows some
masking of fi->level to be removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
