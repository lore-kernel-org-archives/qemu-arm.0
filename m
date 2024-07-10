Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp506185njb;
        Wed, 10 Jul 2024 10:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1jl/c/4XuN1g4+nEwWvTIbgUTPSm7B61QwnuL75a4GBMkqjDH5gAJwCZqBxnNDQp3L4iG1wpNejU4jMfLtQFXnErVRBOf
X-Google-Smtp-Source: AGHT+IHlSN6lFGpoEgFb/kpXLjYBa+w3rq6zE/8NWof0dgUzD7j8iATpF0+IqkJJOkELMRWnlXr7
X-Received: by 2002:a05:620a:985:b0:79e:fd21:c352 with SMTP id af79cd13be357-7a1469cf60fmr61018485a.19.1720632940844;
        Wed, 10 Jul 2024 10:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720632940; cv=none;
        d=google.com; s=arc-20160816;
        b=WlInT8zSJ59215kyf7+UOU1gPD6P8ZvQmfSNNaKcpmLYCOLEyhrcl/2nCB7IM8rxg5
         NgXRCcfQrQwXYshmmynD21h9aVK2QVpVPYc95xaGksw9Kbg/kSDJBP5c66pZuRbth3Oo
         a2pITMF1xJEF7CjCStyqPn5LpdIS8rbYmrUlK9i2/7+/c9C/g8mOnLZgypdPLaSUtHwq
         I46kEfmZSJOXdOUaymxGwp7f/Fa+nkuEn+ZqWOEbUXkVQV/5lgUnYeP4eJIiElh0YQ53
         YGYOUMUxcscO94me1aNgJ5RHSLo6+s/yhKA38aS4oJpY2+g0tm4NaxSgPrZtDTvW25Vf
         csOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=mwagZqSCpedYb+WqMmDTr5Fxxg7AlmwoZwYNHZ85Sr8=;
        fh=JUheaOjOSqTLW/EiG+V3hkK3/QF0uCT5G8az9TpE/D0=;
        b=t99GdmJyB5w6y3H8P5EJSETFL6j2tVpgsxgFovCnVh7RsAedyJC9upLB0XBsdD55ua
         6PcjSWjwx1z8K8cPnCUBqrPLWSNfQPnAhSxcSsHWJ8YQu1AmhJdOQS6boRWPCuyQNuYb
         bV21ib5E+PxLMBEM08FjItMcFDB9AiakMohXWTDEjeJ82SjVFVyOACA1cP9Qk5nv0hyv
         XEEJ5kIC08vxIYE6UjKz3uS9+VuMqrO160QVMm68jg070CgaCPJErhQJOQ5ukLCEN6P0
         EETlKF8WwBWkoshm3AoE34oMBbzcSZ/HgBcCBEGbcc4PoUPEMtI+AwfkRA2o3ymhlhQg
         Yb+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d87f9si512423685a.563.2024.07.10.10.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 10:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRbE7-0008Iw-Vq; Wed, 10 Jul 2024 13:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sRbE6-0008Hs-82; Wed, 10 Jul 2024 13:35:34 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sRbDy-0007FJ-Ji; Wed, 10 Jul 2024 13:35:33 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id EED10261989;
 Wed, 10 Jul 2024 19:35:20 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id qd8wG7v7voex; Wed, 10 Jul 2024 19:35:19 +0200 (CEST)
Received: from applejack.lan (83.8.74.165.ipv4.supernova.orange.pl
 [83.8.74.165])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 44644260662;
 Wed, 10 Jul 2024 19:35:18 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] target/arm: calculate cache sizes properly
Date: Wed, 10 Jul 2024 19:35:12 +0200
Message-ID: <20240710173512.424547-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BXuQHEQLgbtG

Neoverse-V1 TRM says that NumSets are [27:13] not :32 like in code.

With this fix all cores which use make_ccsidr64() function have proper
size of cpu caches.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 target/arm/tcg/cpu64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fe232eb306..98144e1d20 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -50,7 +50,7 @@ static uint64_t make_ccsidr64(unsigned assoc, unsigned linesize,
     sets = cachesize / (assoc * linesize);
     assert(cachesize % (assoc * linesize) == 0);
 
-    return ((uint64_t)(sets - 1) << 32)
+    return ((uint64_t)(sets - 1) << 13)
          | ((assoc - 1) << 3)
          | (lg_linesize - 4);
 }
-- 
2.45.2

