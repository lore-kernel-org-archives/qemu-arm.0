Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp908448ejc;
        Mon, 22 Aug 2022 06:24:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4FYN7/s/2UF6vom3rBEaTe8elfKiOz3NzULXlRCjUAVznrViPgxTcC+2yVwbFaYtoq6Iyn
X-Received: by 2002:ac8:7f44:0:b0:344:5693:a913 with SMTP id g4-20020ac87f44000000b003445693a913mr15349123qtk.454.1661174690264;
        Mon, 22 Aug 2022 06:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174690; cv=none;
        d=google.com; s=arc-20160816;
        b=bYprni5druwszG7YIvWiJ7xGWQurnKgf0skNKh4AZ0uH62EIXddpvV3M/bLEy9F9rd
         RSuC4NRCF/qm9Q/XxN3MQ8fRXh1+tgqIUV+wx68VX/z1bw1uPGPpciwWOCCP5z8kIfr4
         ebJwPFw+V254BNlvYHmsyENyYKkqZ+prduzhSs/MIaZ/nOCgQQhvlUEOJVa/kXUJnfTZ
         OvIJQlIIWydDeOBsjdBvKXKTyYcuvthWgQgDC/j8YbOBLdvgcWw2MUQzog5kpuTxdRhj
         YBqua35QrtQE2LZaYcJMfezimuIHGeMzFrLrVQPXjypbgIt6SlBc+FH6T7150kl1Jl+J
         R63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6yc2QQJRiauV/rnVG5qIFbv8E5zW00rmH8bNkLiSwRQ=;
        b=WlzfuU5tP079zVmYey9yRfn0raxTCAeBQ0Uzw86ubUpT/YYx+mK5I4gumd71dLiITZ
         2Ltffs5HgPgvcvBGuN8hlT6Q3/RfHFHbWFUqhAEx4RWY4C+U+YCLVnkpokWD2RaOJ9zN
         mgJp/jcFBoqCoCfyznkIjgyWuDKC5WJHVdDJvAQPRqiJjERGV6DADqB0z6zPPIDSXdNH
         SrN+WWFqyv5JsE418ADerCzVsSWtkNZ5lcA42IYjRea34Ds6E+FelGdN6kzbpRW1gm7f
         x60mIC2EnJtn3AUVCuBKE0spUD6mGTyt99hca1nlmeNT9cLxR0SzdoZ7jHzV9uR73TqB
         Owwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MxIIKoA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140d0d00b004921aaf0c5esi4243910qvh.571.2022.08.22.06.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MxIIKoA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7Q9-0007WF-L5
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PV-00061C-HX
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:09 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PS-0001f4-Uh
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bq11so6629135wrb.12
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6yc2QQJRiauV/rnVG5qIFbv8E5zW00rmH8bNkLiSwRQ=;
 b=MxIIKoA/j+fJRx+GtFl6JLVbi7+dfJsozau6SY54wFuUAT7u5HeCEVv4A1TFwPtJ5R
 p+aLiodJyPvQxzOgtfK24idpeopiJVlUHlerP5M0tDkHEaXzXAYXHG/oRqKTk8wWvEhO
 7RU6XCij5i6OFlg0WDxu6sdEvdau3OpdPozzsK1OnfgNj5az8V05shoKom5d70/At2f7
 hX7l1+CVE1kKvj/QXSv3E7WiCVQcWiBrPbchTEagnNsIFfWBw+7+cYxq8M4Eqz+7NCyl
 B3KxviNsmC+ljhSFpIn7clmXVvhHeZTJVmx/wI4yxh/kBfIqcaxK8yblJYBCcrOcnCl7
 fHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6yc2QQJRiauV/rnVG5qIFbv8E5zW00rmH8bNkLiSwRQ=;
 b=twC6t5Ywy5ta9bMvqHf8PjwmKJqVlWIx3m//hY7JpD91bCUI3J79qLRYPsxvXZZfSG
 3mlf/BwfGMvoCWcOaHMOxdwVNc3Vl/A3UnwI4o9KR1dDVZrPOjjwSwECrx9zj+Yqsds/
 ddAT9y0mg0u3wHpsh6YayY8Q3DAmqJzArwLSoZ+hvm+EPpKsYs7RKb1JYB+QlvDRK0DX
 whio+bF8J7+g0eMUk+3oMuWMCnkWm+DFTQdKHs2AlAnWYpsfCT+n3QSyWUjYyGYtb2fm
 W4HG3b/0oBxBdHIgbeac4UexC4p1nssApGCDxdUqwgv4iJ5xvqgkEWLEquvIz+qM1ucY
 AYwQ==
X-Gm-Message-State: ACgBeo13xIkOaKJAv/tMjh2jIb60FGyab3dMhS8eJleId+I3GFxRpsP9
 XxORd4a6ClOyuLs02+lHjyYhGzSOkIj02Q==
X-Received: by 2002:adf:fe04:0:b0:225:1c8e:9027 with SMTP id
 n4-20020adffe04000000b002251c8e9027mr10608630wrr.155.1661174645742; 
 Mon, 22 Aug 2022 06:24:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Date: Mon, 22 Aug 2022 14:23:53 +0100
Message-Id: <20220822132358.3524971-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WUrkU7LNMffZ

The logic in pmu_counter_enabled() for handling the 'prohibit event
counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
that assumes that EL2 is never Secure.  This used to be true, but the
architecture now permits Secure EL2, and QEMU can emulate this.

Refactor the prohibit logic so that we effectively OR together
the various prohibit bits when they apply, rather than trying to
construct an if-else ladder where any particular state of the CPU
ends up in exactly one branch of the ladder.

This fixes the Secure EL2 case and also is a better structure for
adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
I opted not to use bitwise |= for boolean operations.
---
 target/arm/helper.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f2bf1c52eb2..7d4127a1573 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     uint64_t filter;
     bool e, p, u, nsk, nsu, nsh, m;
-    bool enabled, prohibited, filtered;
+    bool enabled, prohibited = false, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
     uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
@@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
-    if (!secure) {
-        if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = mdcr_el2 & MDCR_HPMD;
-        } else {
-            prohibited = false;
-        }
-    } else {
-        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
-           !(env->cp15.mdcr_el3 & MDCR_SPME);
+    /* Is event counting prohibited? */
+    if (el == 2 && (counter < hpmn || counter == 31)) {
+        prohibited = mdcr_el2 & MDCR_HPMD;
+    }
+    if (secure) {
+        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
     if (prohibited && counter == 31) {
-- 
2.25.1

