Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087133lfc;
        Thu, 12 Mar 2020 12:42:26 -0700 (PDT)
X-Received: by 2002:a17:90b:19c3:: with SMTP id nm3mr5965305pjb.149.1584042146727;
        Thu, 12 Mar 2020 12:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042146; cv=none;
        d=google.com; s=arc-20160816;
        b=qA5F6J0UdByqtcbYnlgxMonDNq2ZJHRcNWeezT7QvFmbIK0aXd37g0dEbgV4fi68R3
         BqBPS+dVnCKXe83aQ4YDNgiE9rreJjdfOn5a7qQki/gruAK96hbFzeNL3BdZBEmGXmbp
         UYOWpck032DUo2K4brJ3B6lywEqQVFVeWVOmIG/RszybMuuT1oCyUSn8uusLmDUfc3CT
         ARXRQt1MjJzlRb9Wp+u2+sa6na/oX8MjZkilR6o47fYNpCJfS7S9piTHxTNotT0hF2jQ
         0ofw3i3dWjGwLens+wmdyMYnI7DFl1fWxGuFUlL+vFYVbA1X+qxGK+Fwg/zPhjXEWK1Z
         IREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TuDXY8WtYwDto50sdZbxkvATe/WJ3RvHtYzcjTWxYkY=;
        b=ulsJPOD1JvXNV7LdoRc69pzFbxgn/lmf8K96eJR2lvmtyLJZpklSOi1AICRc00eQ1B
         tbPHmMNoK0zO40ONUc0gr5CUP0n5pxKZnBTIJxGUVtnanvOCuJtLyarpTuCZyOLoG47L
         XnCgHjiFnITcKxCZ2OWuaxh/KMKUyJ4Qn3JFS9bpyX2WCzqwsg6tvpAo/s6+3/90XtZm
         ah38dOCtWbzDD8LlW3wX4kzrcddvH28QHN13H1fFPa0ml+HR1iq/DPsY9jQ6O8XfeoR8
         Ok/FyaWUVvzGv1CpFikzugyL/TwfVxnUqRtZbunkqboZsGgYVFZcELQNvrSb5c9Kp0Nc
         UbZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnCf108v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x17sor7127330pfn.39.2020.03.12.12.42.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnCf108v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TuDXY8WtYwDto50sdZbxkvATe/WJ3RvHtYzcjTWxYkY=;
        b=GnCf108vR5bX8LMMRe1xZP8IiaNC8+YrInhj2riL7OZFyjXFPfrfryeFWlC0GsQc1P
         5JAY/4xxvd9L4+u5JnLzwCbSVlgaerxGns9CPOccrHpgKCOQocBGhLJGB6oMrq08SkgE
         Hq46ASe9vFeYP05uo3U6MRSGSA/MIxKNAKMOpuP7zC+GAQcWTkTXW8PrU2f1LR0Xvm13
         g2MOxIoQiXt6M0aYECg6h/3iyFGNuDlwaqrIe0WB/qlGkTRRH7b1vrZ/rM0bs9z8wjUp
         gzyKX8Aj2NVGwweA/86iDBiooG/N6hG0s6kV1RGpfARoFlAwLTs65OYJTa4YXsnLqBOZ
         De9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TuDXY8WtYwDto50sdZbxkvATe/WJ3RvHtYzcjTWxYkY=;
        b=MpkxMPrfiwgGdPOM7S5y5yp7oQgCluMOtpwiTeQuHR6Ix+hsTJkK5Ljce5/7GfJkuc
         62nIoLLFKirhecxpwgOBetC53Tcl0dooIAqVSpxoYe7OT5hj9XBBe2kAx5ZepErl9voA
         Bg/31U1HOlO5IzQD0qLlV0nt/2garT41Y8cN/KApsERCtlOKpl0AeOlG/aCIvyGnJw7w
         yQilIo2l9pnQT2KemRB/o0fMVLwfBzQt7UcfUhEuR3B/nHiGpUfZmrkRlogcNS4PprgZ
         6LWy4Cey6qT5pyuHsIORLF8AKnBYqVGB9D+9vgSLPA0RyRJ1tnyCbgwvk/TSJEtyKTow
         I70w==
X-Gm-Message-State: ANhLgQ1VlZvskX+DWOWkjw52ub8t5Q0eGRP71hjjgDPSN8T4PhBLSZ9M
	IdUWGnj9OrIKTozWHPF9+9YGEHoI
X-Google-Smtp-Source: ADFU+vuyfDBSYoUSBeivLQs/b/kvfaEicA7KvhH4xr0pFuTl5AhHpT0OFxnWyPjrQrUV7Ll1/oCcBQ==
X-Received: by 2002:a62:750c:: with SMTP id q12mr7435234pfc.304.1584042146229;
        Thu, 12 Mar 2020 12:42:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 04/42] target/arm: Add support for MTE to HCR_EL2 and SCR_EL3
Date: Thu, 12 Mar 2020 12:41:41 -0700
Message-Id: <20200312194219.24406-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NRKWCrKX0Joz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 97272502ce..b9267ddbc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1976,6 +1976,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= SCR_API | SCR_APK;
         }
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            valid_mask |= SCR_ATA;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -5238,6 +5241,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= HCR_API | HCR_APK;
         }
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            valid_mask |= HCR_ATA | HCR_TID5;
+        }
     }
 
     /* Clear RES0 bits.  */
-- 
2.20.1
