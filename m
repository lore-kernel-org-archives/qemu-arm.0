Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp466296lfu;
        Sat, 30 Apr 2022 22:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpTwD5Jex8qzr08mrQWbIE9WcsGm4aGpKIEVJHqS96IheGxSqdVEODYl43Y8pBXpkuT6Me
X-Received: by 2002:ad4:5967:0:b0:456:4bb4:dccb with SMTP id eq7-20020ad45967000000b004564bb4dccbmr5160745qvb.23.1651384609570;
        Sat, 30 Apr 2022 22:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384609; cv=none;
        d=google.com; s=arc-20160816;
        b=DAZG1FDgNfbPoTAz75szLpLe9qHwPVIwWSI2DveWOmlYO1eCyPaD7o/yZ47wgwYR6D
         e+CCwJU65Lru+ZEjqr08msAbqLG/2UBfwR6jtSRgWfevOOBMTvbjI9kkgmtUvhDmkTtp
         7S0WG5iVAPZmDvjDGg993o4kKt1yt1Cx6CPFyH9fI41hXYcVBR7A+JHRcMjhEtqdeJsC
         RjSAiLs44fClA2X3AqztAKFcI+EEInBVAkPdt8dvhQZr1l3ft6AEPj06Tn7oQv7O6p+y
         xowrZDtKWZYUORQhI0eLHSwwDbGONTHg9qIcAdJ917Vl/3vwH+l7rOcDtIJJdxAsFUwO
         bY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l24vNO9OZYnbJW/GHWCEkkxLEwARIGf3x7c7vn+v7Fw=;
        b=uZpuzM5HxPGVjgcHmZRtk5rb9N9GZX90ceaHV4Q3iY3ZVslHhdnc3/2CEyKAPhinBH
         Dz6blB52D3isELB9lIBz7zvY9qVFNfihP7LKYubFsViyT9q3sYau2ysyrTU44Z0TuhE2
         apFSjZKXaRa9UtuUrWNU+obP4U28xr/aX8V1pDSiieeqJaPAPngU945csH35gVjQngP3
         1k2ZDeu8enn0uScMoFQ8e1zsm6JioJQbGu7QvZjiChirkeICtv2zEssRe6JowA3radmR
         D97yg4jFhYc7GFwESLNUMBNhLI3STvBTd8tQQ9PidZitLEI5w3+DG+E9ZrOBgIg7iRYh
         TrRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ISbG847T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s72-20020a37454b000000b0069fbcf84722si2098336qka.187.2022.04.30.22.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 22:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ISbG847T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2Zd-0002ZW-2f
	for alex.bennee@linaro.org; Sun, 01 May 2022 01:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tg-0006r9-Ms
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:44 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Te-0001Fd-Jq
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:40 -0400
Received: by mail-pg1-x535.google.com with SMTP id q12so9472850pgj.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l24vNO9OZYnbJW/GHWCEkkxLEwARIGf3x7c7vn+v7Fw=;
 b=ISbG847TZ1rPqQENG/Qv7gHm/A4fVxCK5MmpYFB1xIJ8hPU7K69IlHdaF9mikgY2x6
 Eqzm732cAhyLMy7Rrr31TdI91E7waB7t2jEP4/cv7iW7oUx9XCfT3x4bj/zoFx+oRPbl
 FqAGEgwvhNS2O6ViuRxEWG0Jk0WYCDwNGt/UvFrvKxzOoYhJ4bXbmyREgeCa33enadvt
 anqbnevNwqES3cqy8t+Ecfq6V2j6mXMZqSSu5ZDyjeHRZhFevpkTuUi03wBH9OIaOMF8
 bz3llUVIwiNyyQ0vUqtrCH1ki67eVPxwn3noExbIA3pNXz+YocdcdfBC21Dr4/ep+qPv
 vfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l24vNO9OZYnbJW/GHWCEkkxLEwARIGf3x7c7vn+v7Fw=;
 b=Ov41L5QRql0Qr9Fh76IexcaT1Fa4QRkcRo5OZ9x/prp8ujF/kQAUesLJ5t3qn+XlXn
 n7MSa51/kwkrvObziZin4WBeQb6u+wUaxPScK3w0Stt5Uwgt3/didxNb6uQKRRl9RGX0
 fbyqy0XwHK52LVQ1+h7Qra7mVUBDr8Oky0Wx0DtFjuMYjS4fXF3H2kFj4khvCW3Rh7ML
 QnUoIfz+vxPmFq+kHoJK988IzN/rOkVSHkDx2Zmy2MXrrjPTvOHxU6yrO6K01fIDAyjn
 u9BVd6jKhBlRlC6sDAwlSVpigAaHoDi78/og9pGQteD49+0tkmFeKWPPEz5/padlMGm0
 jpRQ==
X-Gm-Message-State: AOAM533G/Y+c71sq1dcpINXj6hRolltzhLbQf+e3Cxzp1RrMY+GO0wX2
 8jRB2MBIluvLbYNsNTqk+wO8UxJrgR9+zw==
X-Received: by 2002:a05:6a00:114e:b0:4c8:55f7:faad with SMTP id
 b14-20020a056a00114e00b004c855f7faadmr6009567pfm.86.1651384237229; 
 Sat, 30 Apr 2022 22:50:37 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/45] target/arm: Change cpreg access permissions to enum
Date: Sat, 30 Apr 2022 22:49:49 -0700
Message-Id: <20220501055028.646596-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4KqYucdve0hX

Create a typedef as well, and use it in ARMCPRegInfo.
This won't be perfect for debugging, but it'll nicely
display the most common cases.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 44 +++++++++++++++++++++++---------------------
 target/arm/helper.c |  2 +-
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ff3817decb..858c5da57d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -154,31 +154,33 @@ enum {
  * described with these bits, then use a laxer set of restrictions, and
  * do the more restrictive/complex check inside a helper function.
  */
-#define PL3_R 0x80
-#define PL3_W 0x40
-#define PL2_R (0x20 | PL3_R)
-#define PL2_W (0x10 | PL3_W)
-#define PL1_R (0x08 | PL2_R)
-#define PL1_W (0x04 | PL2_W)
-#define PL0_R (0x02 | PL1_R)
-#define PL0_W (0x01 | PL1_W)
+typedef enum {
+    PL3_R = 0x80,
+    PL3_W = 0x40,
+    PL2_R = 0x20 | PL3_R,
+    PL2_W = 0x10 | PL3_W,
+    PL1_R = 0x08 | PL2_R,
+    PL1_W = 0x04 | PL2_W,
+    PL0_R = 0x02 | PL1_R,
+    PL0_W = 0x01 | PL1_W,
 
-/*
- * For user-mode some registers are accessible to EL0 via a kernel
- * trap-and-emulate ABI. In this case we define the read permissions
- * as actually being PL0_R. However some bits of any given register
- * may still be masked.
- */
+    /*
+     * For user-mode some registers are accessible to EL0 via a kernel
+     * trap-and-emulate ABI. In this case we define the read permissions
+     * as actually being PL0_R. However some bits of any given register
+     * may still be masked.
+     */
 #ifdef CONFIG_USER_ONLY
-#define PL0U_R PL0_R
+    PL0U_R = PL0_R,
 #else
-#define PL0U_R PL1_R
+    PL0U_R = PL1_R,
 #endif
 
-#define PL3_RW (PL3_R | PL3_W)
-#define PL2_RW (PL2_R | PL2_W)
-#define PL1_RW (PL1_R | PL1_W)
-#define PL0_RW (PL0_R | PL0_W)
+    PL3_RW = PL3_R | PL3_W,
+    PL2_RW = PL2_R | PL2_W,
+    PL1_RW = PL1_R | PL1_W,
+    PL0_RW = PL0_R | PL0_W,
+} CPAccessRights;
 
 typedef enum CPAccessResult {
     /* Access is permitted */
@@ -262,7 +264,7 @@ struct ARMCPRegInfo {
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
-    int access;
+    CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
     int secure;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 06f8864c77..a19e04bb0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8711,7 +8711,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * to encompass the generic architectural permission check.
      */
     if (r->state != ARM_CP_STATE_AA32) {
-        int mask = 0;
+        CPAccessRights mask;
         switch (r->opc1) {
         case 0:
             /* min_EL EL1, but some accessible to EL0 via kernel ABI */
-- 
2.34.1

