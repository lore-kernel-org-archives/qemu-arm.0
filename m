Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp870769wrm;
        Fri, 11 Oct 2019 06:58:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzK9jElFT6drQpWgg0fF2cGHUulki6+SKVnLtXRQXxAMZglwrp96IWPcDl8FC1bKVgQQwgt
X-Received: by 2002:a0c:f812:: with SMTP id r18mr16016310qvn.242.1570802301345;
        Fri, 11 Oct 2019 06:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802301; cv=none;
        d=google.com; s=arc-20160816;
        b=M6h7vyeM+loPoBeu1/RbPBENnUJSKNBJPrVHB7Ux9OjCwDTGSv90PXDXECgaR+j227
         uaS5UKDuJDcqUwxvETp+7kSvV9ECI26xriXlX0YNGjWZ64+wnefk0XvOt4tcBLWrpzkw
         vzjUJRd8hki4NtDfGs7zSzCjQvlCoSpR77w5ve63FAslP9P7NfIWbpdGqOpl37kVcY85
         UwbG7RD5BlmzmSO2MW8U7ncuOmIscE6XDA3wb8JPsJHCt97uxngAKpHX4RhUeeQK5WtL
         nZJg0JdwI2L/VR1tH5T4dOyOU8p1xZMztu1unq03SMnaLPvQ9rfehogvPz+YxWapQrHH
         iPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FHNQuXQMvSWOnALEsyFOBKvFsuWLGIwZ/NlmLTA2nkE=;
        b=qRmxX8BljY76UlbbNtwgoxZaDKQDgFs7hscipUJz7fkaHYBQxwINfjSnaV7bb7Tudg
         wuSyLo4QX0hwhPFdqwpT9YwVvpXg0kkeAON6N7/kd/PyY3fUYP9f5njXl+RB0mAgPQPj
         YasHua7NFh5+6BnDCkGCSQL7YfCpEhMsNTrUsn7XuFY4bGdgnjfPNnQci+0ldUsyQmEW
         wWp5dR5y70eH9NuXMP2wNEOpuMF0vMDJsH/rsaX36l7ruVQteg+/7V+Icm7ZfZKCEmkH
         OMY9gXEMnE9U5aOsTX/I6PbCafSAQ+Hv7GJftMj40SSNuQ+Pkq/GabSr9w6mSJCxcToq
         Iz4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l3D16d5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n64si9695112qkb.62.2019.10.11.06.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l3D16d5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvQy-0007Rm-9o
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJH-0005xH-Fe
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJG-00043p-37
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:23 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:38671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJF-00043b-VP
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:22 -0400
Received: by mail-yb1-xb41.google.com with SMTP id r68so3116246ybf.5
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FHNQuXQMvSWOnALEsyFOBKvFsuWLGIwZ/NlmLTA2nkE=;
 b=l3D16d5tliriTIa1Q1asTnjvJbPd48z6gi0A2GZ0Xyllj9fruO/FYkwEtpLbVLOXRf
 O128mNJzgxDZXJmrJRLZmypU0hiKnTPCYGjIwJ006uTcm+kyN2JIX8r50uNI4Suei0Xh
 6kO3utwb4N0GY3V8DdD99vKVzcNuvEjX2onthlL8HaqHO3+ZCPVh9ZgEdDqU+up4ylQj
 Pu48uzhRcGdqrgCFmpe2z/zjHkJXaiMqKbNADGPEmYh57JOyU0ZqxJW0Z5m9Xz+suMIY
 bXdopySRoedwvcFZVa1IqTaN3bRJm0YcElPk15W15XAeiMEmCyXy2wc6V1xlP9b1sX2j
 VINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FHNQuXQMvSWOnALEsyFOBKvFsuWLGIwZ/NlmLTA2nkE=;
 b=bVLI/Z3fUR+61JTm5JnQGqf9Nb8mzue6dzZHdrQApnYEyb7XsBqh6RudB7ntO5Pla8
 Sr6pOjSub7ly3v54sHUmorDOJJqZhjlrudSYs6JKWuGdXhs5KwskJYFiNYIg/ZPMbbmm
 2X/Ivub4ONG5ZPpJBFzdG57/iLzAWxcSo+y8cUvA7G9a2/cCIopqZH2jkcG79FLChlD7
 Uy7WWmQbwH8MNvIO5gYfMzXx/KNge6E4qo5x7xa79KZGDT0u0PYavuYhCUGpdvMDcD+f
 rnsRKuni6Lhns2TUqpTVkn3TvjOtAjPbeA2Xs4rMqv1BFfUbUkrq3v+x5jTTlSy5Mx6E
 hCQg==
X-Gm-Message-State: APjAAAW6RJqqhk5W+XiTfbZI7lGNr+8WnsTNVeb8D7vbrjJ3YjQRiQfp
 Im1p80W786cKC9eLg605NzoWAg==
X-Received: by 2002:a25:a091:: with SMTP id y17mr10050872ybh.193.1570801821364; 
 Fri, 11 Oct 2019 06:50:21 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/22] target/arm: Implement the access tag cache flushes
Date: Fri, 11 Oct 2019 09:47:36 -0400
Message-Id: <20191011134744.2477-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rkxKGzojt7RL

Like the regular data cache flushes, these are nops within qemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f435a8d8bd..33bc176e1c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5978,6 +5978,54 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
       .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
+    { .name = "IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
     REGINFO_SENTINEL
 };
 
-- 
2.17.1

