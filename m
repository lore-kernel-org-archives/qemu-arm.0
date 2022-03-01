Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209870lfo;
        Tue, 1 Mar 2022 14:00:20 -0800 (PST)
X-Received: by 2002:a05:6a00:23c6:b0:4cf:1e1e:ff4f with SMTP id g6-20020a056a0023c600b004cf1e1eff4fmr29419558pfc.80.1646172020592;
        Tue, 01 Mar 2022 14:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172020; cv=none;
        d=google.com; s=arc-20160816;
        b=TDr3jtUTeUm/Bh7ijQhPDXMKwEoBBB8nHKaxnghxXLpc8p4B4cI8KaLrilOgR9eh+i
         RLguplabg1H7gxnPfk9OlQcGehJDGKzPcfu+TFI1zTvevRULNfMG//fYxG+HWO6lRBMx
         L+OhsoWrJfXHdjm9Bi5Qd3v7+4i4+Y0QGI+xVyxhrGDCDETDZibS9/6bV6GdO2IZnY8R
         djd7iDCjhigk7TLK/ZDC20xrCd7EBYrKvUFj6YvbluUgwhY8AnwYMkEj7slMMW8SEhht
         7z7SR5l00EPPBFQKJGAY0Z/rk5EN+Pptwp0yLvCIV0A0xd9f7Y4cFJWQ62OQeYxPGU+n
         Vr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=xW6RKPm+poDl2Tvh+WCfXSJ3ITQcyYoPSfepjK2lipUynrJcuAKFy6YkVRteIt8lLs
         vtZjqqplx1Ugmvwk3IysLr5OUX9vfPEaBpQPr4INxftP3WJv+8K6NWROD77Wcsy36SiQ
         mypRx3Urm/dARNNuCVcI3LqqvWJxppg9sgeOBvxcUuuWUYNidAjz3gdRnIqyWvDXDCEp
         aUz1oJjnv0k7AlPJemWI/1HOtgOYxKZgGR1xQnKk86dIBu1qQRW/AKJJBXVDGRlInj9k
         C4/k/VAZnFnCleYPs7kufs0hD+uGs6k7Cby2KkKetNrTLi4rn8FUEvhWAHAHC3kknaYU
         ciNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eae7XyHX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y7-20020a056a001c8700b004f423ab7d77sor2512912pfw.16.2022.03.01.14.00.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eae7XyHX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=eae7XyHXBL9mKPwMEeDJvp2ibsiKf2ZNiUp90oXmnM4cwMTIo8y6XgGqjz+TsXrIym
         zlLeh5/D7eVCXXHYhL70zq5126nT/rQdpXoRazhAa2YxjDniT/0LOSQ6lQk+jtNOvb2t
         7yGSVPwc9ebB3oKqEMGpUXAhFIyaIbWeLhVpoGxDjx8TjowyK/eeZ93h7YGi3GtnIZP1
         D8WZmsXhgnFROtPO1vHOPdKeD5XJc+ClOuedH0wpV+MRchzaiGZfmBgUCF9/2NhmrSBR
         iTHJOQ6dtE+3jLK5276NHpS9d/Pv+PcinCtQcUDpAFSeD4I/xm40azQjq1UbmwjXpQLR
         9b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
        b=cVMGWTq4O61QQuFqyQH3XYatM1d4k9X6ipO4DTSwx4ZsWVql+zsGLQhJMaCyTbDN0+
         CTAU35j71jdRDL1BIiptFY73FqcaCQfaPcqDthxXMtfS2tpdntDG0MMw01Dy3SMfEufu
         aGUDpaDLu+j72vZuehN7eUwRLQjm2d7UBm2g5BHkYA9Bpi+5V0VlLbN/MR7aRhr//JVc
         48e2stf8k3Hkg/xQhfVXSqg4V3++CK0BYbFJ0aGdYMk5Az7PdXBsZk6kRuHVcak/tYle
         h5G/YK4aq35oS9JmR08k3Z7RHrlYXla4wRrPOtZJ9Qk3yVaPc8VrE6LmD2In95P8MsHf
         FHsw==
X-Gm-Message-State: AOAM533SvKsIkRw8XyhBPujNA6iQ7+Qi8eTB990aVuBygw+koLpIhHdd
	QPj4dVkc9+Iua7LDj0L240FNZuty
X-Google-Smtp-Source: ABdhPJwLniKbATL9r/QdTvrer38MfKczOjcSqJqAE2eJ6RSxsq9pMj1nEJ6w+Sp9gMX/myTT5xpBtA==
X-Received: by 2002:a05:6a00:1354:b0:4c9:1e96:d15c with SMTP id k20-20020a056a00135400b004c91e96d15cmr29714068pfu.30.1646172020158;
        Tue, 01 Mar 2022 14:00:20 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 11/18] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Tue,  1 Mar 2022 11:59:51 -1000
Message-Id: <20220301215958.157011-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GU6j6H9At/tl

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
