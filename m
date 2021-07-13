Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp599640lfc;
        Tue, 13 Jul 2021 06:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWgHB/zcnYdhMWEr64r42sp5Nf0sx4fviAOkVpBJ1cV/8jPMDiQaGcGrmnDqy0lsyfHX/j
X-Received: by 2002:a67:441:: with SMTP id 62mr6139167vse.20.1626183854514;
        Tue, 13 Jul 2021 06:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183854; cv=none;
        d=google.com; s=arc-20160816;
        b=NR6r2jl+OaqWCay81HctwhKvATw0Pwxe/SSAqdh1HXV31pQsjr1q2xcAYA98FKkm+Y
         8Ir90Ia1FpPtJxEv2EOpkuiGUsX0tiRT3SQMLvmY706BaOSeMpY7Qm9a/D8GUUkVvKBB
         5uHoqsumBYWfYFX+dZmGetVMV+OI3yxnhUsMY0p1Xj4YevfiAVhF/2WM9OsxRfYvpchU
         KWfVlpZO/sNpBcT9UTbTGri8REcTFWWKtikYvtXTZN7So/UHLBKBr+UXv7iXpybcWGA2
         byv3T7TK5GJbGLQaL7bUhjmJVHjNr7/sZMh+Q8RflkqA09xn+jCT6kgqQ+Jrc+Y5SCLQ
         YXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YEUxhatg18yYkk6DxfXs5vGtqzQve7WvoaIOOBTMxb4=;
        b=FUud7+vEzHQDpVEuQGGCDGWT1ZxJfBSGX1g8ycJAHu6skMGjuulR0AwfpTzA/2NjEJ
         F8vCDx9Bu5V8wKZNwRyOz6sve9YiICe1UN14wGatnaCKCAogNTpFe4fOkaXR/8oT+0q8
         CYKmpXyRh4X/Ct65BMYXpGmVNmR/LRCy9UgnKCNOGaCWtiHlBKKiaYxYif7G29M38W4b
         Fyes4435zYKuMyq+t3Yc/JMnaXIWIiYbzPdDWswCxMmU81ZJapywF4N9VeZOHsHOCGQk
         udFt4XS+UZb1oHj9ua60P59+D4EtduEdQdTg7gNKftRxe1hwces+WliZ/mhvsRMnrCZm
         Ok0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uF7x+HyA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d69si15920051vsc.397.2021.07.13.06.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uF7x+HyA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Ihp-0002Lb-PY
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbX-0008UB-10
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0003e0-Te
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1661778wmc.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YEUxhatg18yYkk6DxfXs5vGtqzQve7WvoaIOOBTMxb4=;
 b=uF7x+HyAWZqUjVXr3ZVV4UL8sKwCdvSPBhUzU5f3hW0o/QtHeeTV1G45D21K501ZG4
 F4eKkKOfOy+/TYU7TIvHG82nFUMmMj90gqnR2+ADW+B2/LlUEJ8yQoa9o+9nHUM7vm3y
 WOIFqrhU1Z5D8U6R52+Oj1DVxey0cmqh9DWOhk7oftypf7JW/gobSp6YAqiNQnuXvyNh
 Xl13mZ6gtoxgsiOJSMHTXGuREck2u9Havtt28fX7cNXPWmMOG2DQhXIcOhUDYGOcj/ns
 uqf66HMeFO6oH30Ic9v3tckVmsXDa78JI1/mt08X3GknOeYyarg4axVZhzfnAHxFnhY5
 v1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEUxhatg18yYkk6DxfXs5vGtqzQve7WvoaIOOBTMxb4=;
 b=SyyhPWBFIh34BmZm/CrMBT91Tcaf4q7c3NNBOba8G9/m63m0sXHMvbRpYUAGE4oiAT
 Xb1PIDc/ELuLdAIyU62WaGhv0q2aBzGZRhO4Ccf2fUMfdlHtxT1fufiwQpCjLbRHYLMK
 d0/r+rZ6wIee0+TvhsXpX/Lt4wnRH08JpGUX4ar1KHlKLOm5kNNvBhyBQgKaDgwoNAHo
 iVCQmyAn+8bBkh/x0tlSIWg0USsOSH4Z7JkOr1lPg+iwJlxdyqoHu+c1n9EUFyHvXYcD
 qox6RaOR2d/TZ1FQqtT4heHiQzhnMICZcMMSlJlP/+eXq7Q1jyPrWMOR3AuvQZ7JAYYT
 FuYQ==
X-Gm-Message-State: AOAM532uOxcU9qvLixVFM1nezEVtWxpdRGSo/uaZpODdxlBCvoorPeUK
 LOdraVYVpN8AC2uLrZES4/gWKZTpFDfYNeb9
X-Received: by 2002:a1c:f616:: with SMTP id w22mr5044718wmc.131.1626183456535; 
 Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/34] target/arm: Fix VLDRB/H/W for predicated
 elements
Date: Tue, 13 Jul 2021 14:37:02 +0100
Message-Id: <20210713133726.26842-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFTSqKupdyzG

For vector loads, predicated elements are zeroed, instead of
retaining their previous values (as happens for most data
processing operations). This means we need to distinguish
"beat not executed due to ECI" (don't touch destination
element) from "beat executed but predicated out" (zero
destination element).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b0cbfda3cce..f78228f70c1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -153,12 +153,13 @@ static void mve_advance_vpt(CPUARMState *env)
     env->v7m.vpr = vpr;
 }
 
-
+/* For loads, predicated lanes are zeroed instead of keeping their old values */
 #define DO_VLDR(OP, MSIZE, LDTYPE, ESIZE, TYPE)                         \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
     {                                                                   \
         TYPE *d = vd;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
@@ -166,8 +167,9 @@ static void mve_advance_vpt(CPUARMState *env)
          * then take an exception.                                      \
          */                                                             \
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
-            if (mask & (1 << b)) {                                      \
-                d[H##ESIZE(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC()); \
+            if (eci_mask & (1 << b)) {                                  \
+                d[H##ESIZE(e)] = (mask & (1 << b)) ?                    \
+                    cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;     \
             }                                                           \
             addr += MSIZE;                                              \
         }                                                               \
-- 
2.20.1

