Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2060971lff;
        Mon, 14 Jun 2021 08:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkgOD18N9sJWJHUcirKNLMv+oImb+UY2KwFuOdMi8whF1bAar1b7cebKHUG1uykWTqCp/D
X-Received: by 2002:a05:6402:2790:: with SMTP id b16mr17670468ede.115.1623683615985;
        Mon, 14 Jun 2021 08:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683615; cv=none;
        d=google.com; s=arc-20160816;
        b=SoUCBikHv9EUFRWZ/dOX6MKpxAfZG/RhItabgA46XZ1SnyzbfokGNzSN2TCAf9lVGR
         JPO1V9fSGRxqA1jFSf+xfO6GmjKRHfs8IZE/tXRnVqzPHFjyN4B4k5xVVpA9MfoCfTjy
         xegOCObYFKleWPA3LdfLCED/cUH2s8287Ewmwc0zBE6Nd4bMW8qePwIoc5D+f42ii5C9
         FwwDf9KfNlw4U4ZQ4JZFtt7gQsP5G7RD5JIb2nmBNeRJh246s7Tv7DMRMN5Bc3QcDZ0i
         DLRw3DNQfyYWtqO84/2Z4jJyFQY5os0Bga1PkaMnAA46fZjhd+1nKs0uBy5zeVZ6RPA/
         A8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZYZmZ6K4YIcfkUOlRx3KM4viUKJePuISMqyhbUGc/bw=;
        b=VoXKge8TZcJeDxXOrhk/3eaeHG76S3mTVkoJUZklDo2um2R7SNazPfEiJt7o1c+NNS
         dF049FPwlgnUxfen1K/ai/hsH9Iq7phwPwp1fWNRtJe5+22B+eZ1s08SlWkwcg9JqbCm
         74aTS+DzEfPescmgj77u3bbFiCsRYcMNPrBiRqPx3Fz49hlG5BEQQ0riHbrvL3EBK5Dn
         8kdzI7kajRfAeRvAyGuQQU1xupROJ9oB0/cm6ynO0nKBU493YeOQA0/HHUA4gf7E92sZ
         TxVTnk0jxEZ9EXCm42Rey6ESi9O58dbgIohMqkKuQxmONsKNySydPdP34/IeNStSHEQ9
         TPfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9HGlxlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si13009884edj.366.2021.06.14.08.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9HGlxlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoHP-0006BX-1d
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEQ-0000Ws-Iy
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEG-0000B3-8W
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so14910412wri.4
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYZmZ6K4YIcfkUOlRx3KM4viUKJePuISMqyhbUGc/bw=;
 b=Q9HGlxlcL6SjoifneaV4+jmr6l6FpWsMiJV8fbSCPEc6qot98DGWhIWsfBwhYwg2Gs
 MHq7UPxySFi5D6gcsYnuLpO8SBrqmQdd8Y0GmgV4jBRouxanLo+1RF6fwnyJF2adUp1Y
 W1jRQ/aeaVyOyjmtkkRchAixgWq1D3iwy9/4qsRYY8tu9iLyI22iuW69WjOQWvGBbxUl
 OMYhieHDLbvdZerwnBRkl/ZPXZyg5XwfA4KzoTyre3mZvI0JBN3Q5MujRXGrlM+QDtaS
 6IDeDMw5dnK2B+R4tcDb7EzoWijow8ReOv54sUdX/KDvNDJKAY9sSf4TA/rieP6qmZnK
 HGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZYZmZ6K4YIcfkUOlRx3KM4viUKJePuISMqyhbUGc/bw=;
 b=UHDJBPJlBQpvfiYpHHc/ziCGAo2tIkNfUEN1nLntb62PQ/PcdIsmfyGrQdxw3VivFU
 F0WCDEZm1waSFcciK8CKvUblKvdxqnEk/iJhuQ/59ryVoTX9Ll45YYMNxMTvmo9Ej65J
 ssUeLfKkR//1OAzIKe7U9pjL4ocSYMBKU35sbgOPbRHCLgFpM6Ff+GHzgQchW5fYdfWo
 tW3NVMiK+Eonh7tzC5+L28rPFhPe6b460mEWXz/4PBFwR5GNZBZOekPikJEOO+ihylpo
 wG47zG6sVW1euFYaRbIWSJiApaE5hXal/oATPnPAqvzCRXSf6p57q/EOemZt9GXCEOPp
 6OkA==
X-Gm-Message-State: AOAM5337fIeLHNZQVZvVTljOQWd96hzS1E2cASAqDY5etDv/btoTp6dX
 qUxUtlq4SLPzaP4wESZupJfv9Mo3IKDQhQ==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr19258475wrn.157.1623683418105; 
 Mon, 14 Jun 2021 08:10:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/57] target/arm: Implement MVE DLSTP
Date: Mon, 14 Jun 2021 16:09:18 +0100
Message-Id: <20210614151007.4545-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kDk6UAwAE87T

Implement the MVE DLSTP insn; this is like the existing DLS
insn, except that it must do an FPU access check and it
sets LTPSIZE to the value specified in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/t32.decode  |  9 ++++++---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 6906829265f..1b75db50658 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -671,14 +671,17 @@ BL               1111 0. .......... 11.1 ............         @branch24
     # LE and WLS immediate
     %lob_imm 1:10 11:1 !function=times_2
 
-    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
+    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001 size=4
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
     {
       LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
       # This is WLSTP
       WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
     }
-
-    LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
+    {
+      LCTP       1111 0 0000 000     1111 1110 0000 0000 0001
+      # This is DLSTP
+      DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
+    }
   ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 78878e9b194..1ad0e61fac6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8114,13 +8114,32 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
         return false;
     }
     if (a->rn == 13 || a->rn == 15) {
-        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        /*
+         * For DLSTP rn == 15 is a related encoding (LCTP); the
+         * other cases caught by this condition are all
+         * CONSTRAINED UNPREDICTABLE: we choose to UNDEF
+         */
         return false;
     }
 
-    /* Not a while loop, no tail predication: just set LR to the count */
+    if (a->size != 4) {
+        /* DLSTP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        if (!vfp_access_check(s)) {
+            return true;
+        }
+    }
+
+    /* Not a while loop: set LR to the count, and set LTPSIZE for DLSTP */
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
+    if (a->size != 4) {
+        /* DLSTP: set FPSCR.LTPSIZE */
+        tmp = tcg_const_i32(a->size);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
     return true;
 }
 
-- 
2.20.1

