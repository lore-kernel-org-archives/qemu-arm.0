Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp484655lfj;
        Thu, 12 May 2022 08:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2m57Py31Bo/GnOwCgTw5ui30RcARu1CXpebm7+OOet3t9p3GOKV3hc7G/Eic+wMfeVmbS
X-Received: by 2002:a05:622a:490:b0:2f3:ea09:d651 with SMTP id p16-20020a05622a049000b002f3ea09d651mr247979qtx.384.1652368589950;
        Thu, 12 May 2022 08:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652368589; cv=none;
        d=google.com; s=arc-20160816;
        b=VPc6pt7Mx0OkGdup3/EqTSFGQAM+Spq1JTTJ5OjTXNWCYX1vfB69KQAXP1ygP/LEze
         fOwzCJ7oPlR7kREkW0BL/ZYGgchnjmW3E2y+Ma1cqWkOHBmLw8cVe4M2cLv1W9EB7oPb
         RyGMCoMUuR+seov+Y5CD4Wuift/c/N5Wtsh9Q5AyZOwNv3m0XlRFG4bAB5LqB/EM969M
         YkxI47cPvoIH4vJ0DwJQVQa/B/hu/6FdQD9KyxS3cwG0SLqwJTAYFjo+uW2RJXENVa6t
         1lQwuXcYW4Pt3Zw6eoDzM7e6U5RpDTf/7rbo71GFEYh7yXQSkCUgA8CsH7wRImqIJNRv
         ERBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qE4yOzJamRiNUzm9C/hagb28tJI7r6AdPYfxPud1WCI=;
        b=tRn308tIngVsbdylOjmDONgUMk8LgTNt6Rfe7cPNlSKepatM4zXnCIRWtodD1f/oOU
         5D6bKsul5WoOCzKbiBuAo9r5ur4XOTBhH8lolMj/fc40hzkfwM5kfLbcrvgIcleljeiF
         SDSGLj4RRPtI5dzqZ9qGkF6C4FE+CkRgKyTbOzwE4Nm3WwkTtEECg6kI21Jr/piR4OGa
         Csw1qiu+TW+JdGrAEod30Ahbz0AKArIpiptyWDn2fZxLMV+jOYZp5EArR9QIPMvEl02K
         6BdY8zIvVyJjjPl/tzYj08kwXMj0/G6BhCFDhxbvUEVDxwSuL2/0iBz+owj+PyvUjot4
         RuyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCJTjJ+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp15-20020ad45f8f000000b00456383bf9ffsi4195328qvb.32.2022.05.12.08.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 08:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCJTjJ+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npAYH-0004qJ-FW
	for alex.bennee@linaro.org; Thu, 12 May 2022 11:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWy-00034H-14
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWw-0000Om-2Y
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k2so7728164wrd.5
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qE4yOzJamRiNUzm9C/hagb28tJI7r6AdPYfxPud1WCI=;
 b=TCJTjJ+HQk5LulQYxQeZWkRKVgjsIpq9ffhAOI0oEhbj78fv5zbCFWe3erljUhl33x
 SJZIhaAl5LfFfi67T4ahUqGvDVUKDNB7MycwrE8eq8tkBNJAet4V0IJzMF4YKnokZHJc
 56ukUQ+wl+jqrqqsOUDmMQwjxnttwcnq4I1hWI4jj/cZwC2UnvaBJ4W+a/1wr6Fcs2wl
 iQ0Vy8YhIYdvA2WwZKG6tkhpB15u2o04JNyXcKwUNcFBTNitGvHqg6Y/4xfeNc//qc3U
 czI6q2pJQzVFjUMcywC8PTHbb8W2Far2gntY9lW5qhiURI2q2M8i4Rj1yR24wOBbBZlc
 A0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qE4yOzJamRiNUzm9C/hagb28tJI7r6AdPYfxPud1WCI=;
 b=Jz/erwsoGNpN+wIKnQVDEJ6nx1byDihfzsBl1oRhzn9mnsHHwxnTROTcasKugpanQ0
 4VZP5FywOcKZHbQL5BOn0PmTyWxrco40aYwfZ15ZkVZnQNwI8kJv3EY2ksS91iuEYCVR
 Ff31SO8NU1aB80Q8dftUDMnlywR0DSEGuIL2mPKb7XjAgtKDZfOIncdqVEuPVWmyRRgH
 VmG+FzoHTwOs8jDJnORyuJPzqBaoukASKnLeVxMssU5jjCHhprOG0GU2vToP+5a45vQp
 +hRpcTOHzxI22NZtw5QP8hk5eonUbadh8sT6RE+GTEuomBKHboyr+5aYG1T7pFQ3prWI
 xayA==
X-Gm-Message-State: AOAM532a1Giq9G8D+r818bD021k+o3MqRv/rLvmzDAByhRaXBNf+1SJj
 CAj7mTyMbkYnA+V3p20UnhCT6s/CZ8BPQQ==
X-Received: by 2002:a5d:58e5:0:b0:20a:e022:3f8c with SMTP id
 f5-20020a5d58e5000000b0020ae0223f8cmr100042wrd.667.1652368504702; 
 Thu, 12 May 2022 08:15:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/6] hw/intc/arm_gicv3: Provide ich_num_aprs()
Date: Thu, 12 May 2022 16:14:57 +0100
Message-Id: <20220512151457.3899052-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: /eefrsKskjZd

We previously open-coded the expression for the number of virtual APR
registers and the assertion that it was not going to cause us to
overflow the cs->ich_apr[] array.  Factor this out into a new
ich_num_aprs() function, for consistency with the icc_num_aprs()
function we just added for the physical APR handling.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 66e06b787c7..8867e2e496f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -49,6 +49,14 @@ static inline int icv_min_vbpr(GICv3CPUState *cs)
     return 7 - cs->vprebits;
 }
 
+static inline int ich_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of virtual APR registers (1, 2, or 4) */
+    int aprmax = 1 << (cs->vprebits - 5);
+    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    return aprmax;
+}
+
 /* Simple accessor functions for LR fields */
 static uint32_t ich_lr_vintid(uint64_t lr)
 {
@@ -145,9 +153,7 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
      * in the ICH Active Priority Registers.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint32_t apr = cs->ich_apr[GICV3_G0][i] |
@@ -1333,9 +1339,7 @@ static int icv_drop_prio(GICv3CPUState *cs)
      * 32 bits are actually relevant.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
-
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    int aprmax = ich_num_aprs(cs);
 
     for (i = 0; i < aprmax; i++) {
         uint64_t *papr0 = &cs->ich_apr[GICV3_G0][i];
-- 
2.25.1

