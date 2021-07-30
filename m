Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp323781lff;
        Fri, 30 Jul 2021 08:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrGc1evcIlKkh4mMFRdmeJPT/fSVL7hg4NHzh5hqzsFJeAU6rvdek9pS0B0Hq/IxT4686P
X-Received: by 2002:ac5:c5a9:: with SMTP id f9mr1980469vkl.3.1627658214404;
        Fri, 30 Jul 2021 08:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627658214; cv=none;
        d=google.com; s=arc-20160816;
        b=wqLPD/U9uavGSBYLL9JrIM9U/JHH5AHs4qis69aBmtgV9rZvweoHVJwxq9eRDOCKCe
         ky9zuml4abxtw5PL4kiQwIR5obnvdEXVql/DYHghIGdStHzH1ZGkGx0FXQE/VeC7XOrl
         y4a6vlYU39ZMFPFEHXmdMsOJ5f7UcEKsdG+ihEbbET1P0lH+FsNUQ99Hfulg+sgddQ1T
         yZypidgScYIJ1NjWU6wqolGwUCuhEAg0Gdm80JpuINfpA99QBoFoiciHi2kNRuQ1Dxoj
         dS6yFf5DgcZSHlMucpaAC7g51VoJt6EcJrJJNwEJ96D22oQiXh9h57bGeMD5++v1PyWf
         ycfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qdsJPOGId78mowOWjxsBg3oGgGP3Tn6FPHFa9MGGUUk=;
        b=b4UFWwyeUZRynnAqnOwzH6cnNX34WAmwlanRDPYbF2/3IFLPfAvc0Smdop8ZZMuNuF
         jH66TWEKipM2VAFW4+B+KCVqtIwjho+OY4Y0SQ53/DhDab4YP49jfIfXttXhycl9uRis
         4AtMwdrtY0ao0jiVv8M2Ixlt/sImqf7nQVFjw1l4UHSKSYGiidNqlyeq12/Bp2+7QnfI
         /f4K9tIxTT5BNQIfBXiUTDlLe6j8ORPS61qoe6J9BV7cEyzYpCoMleVPbh1VJvstNql1
         7giIRr7HZNMXNlBIqD8gChOGlYUFQxaXVFSrd6vPmx/b48UxKcG8nUi83p8pz8Nx6aEA
         /UwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhR2e5Gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si838332vso.58.2021.07.30.08.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 08:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhR2e5Gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9UFp-0004nI-N9
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 11:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFf-0004jq-1v
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFc-0008SK-E9
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h14so11719901wrx.10
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qdsJPOGId78mowOWjxsBg3oGgGP3Tn6FPHFa9MGGUUk=;
 b=PhR2e5GtlUv/4uB7WBnrgj3CZF4WMProYoU/08hwbftn1aYSB/DJT9ltmJaHlRFZJ/
 wZrzYmyKokBvWPJxwPsIx/j2BGtwNnFvJ0nEXulj8yh8iTpjik5BXkcKsDAPvo2M3MKe
 eiIJ5Ivn7Ar029I6d6g8dpBoc3G1SrOM6HdM0MfSq5jzmlWZH8o3L+X60bFyO1JVh0F5
 vZiRPtKD19M+3m6pJNs5T8Mv3a4/81foyeZ7D23yEtnvGT9sc9YDoepnqdXDjXM4Xv+r
 Bsy2pWch56zW9CLYPh5n/v3h7/zheG09L8pr7a0aCCsBJbF0ZbGsOqdQQRPMUXlHI6gl
 oJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdsJPOGId78mowOWjxsBg3oGgGP3Tn6FPHFa9MGGUUk=;
 b=P+Vb6uqAeB7pQs1S6w+2Bbxqaiumm+7AWVAtN+JmZKuwm8LHgemrtxFrg7ydVf46Z8
 +uO2T1S1B1z86oVoeBra8HMBcneJlVdmbulS+Mkn6dGd/bVWWy6NGgfTL16LdKZlhRry
 eGfDstLGVpjaJKqCPmzzOiw7oLQztUjf78KuoHBJ6NFAXIeHg28ddjwrz3XssWFsqXg7
 QBWD7fjFWrkOoMEI/kItFhU1bJNypfZTVjhGHjsQkpk58B+9m8OxyOnrJI0mSL+xjqYs
 T+TY70uxnBWOGEyJG41qF7s8uV/XMsISOH0l9Cd4WRqFKIsUf7d/5zzalPtheCWiVPjM
 m9vg==
X-Gm-Message-State: AOAM530mHvPLsON98l5Yj4S4ZZv94RrHtOTv7jb29in4eCcAfL9SVMv8
 06x2gUwfsZ+jXlcWpHe410/cVD5DKeAtog==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr3599223wrq.322.1627658199180; 
 Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Re-indent sdiv and udiv helpers
Date: Fri, 30 Jul 2021 16:16:35 +0100
Message-Id: <20210730151636.17254-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730151636.17254-1-peter.maydell@linaro.org>
References: <20210730151636.17254-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hNN0i/G7+Y9D

We're about to make a code change to the sdiv and udiv helper
functions, so first fix their indentation and coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf2399..8e9c2a2cf8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9355,17 +9355,20 @@ uint32_t HELPER(uxtb16)(uint32_t x)
 
 int32_t HELPER(sdiv)(int32_t num, int32_t den)
 {
-    if (den == 0)
-      return 0;
-    if (num == INT_MIN && den == -1)
-      return INT_MIN;
+    if (den == 0) {
+        return 0;
+    }
+    if (num == INT_MIN && den == -1) {
+        return INT_MIN;
+    }
     return num / den;
 }
 
 uint32_t HELPER(udiv)(uint32_t num, uint32_t den)
 {
-    if (den == 0)
-      return 0;
+    if (den == 0) {
+        return 0;
+    }
     return num / den;
 }
 
-- 
2.20.1

