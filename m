Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp276857lfy;
        Thu, 13 Aug 2020 00:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyDQPYxKFWoP/rtUd6do0XEf+61XvFQGcMnyMHRIDYYHk4lcJK2mshFlfzE2TClJGcgy5R
X-Received: by 2002:a25:4c8:: with SMTP id 191mr4595452ybe.170.1597304342582;
        Thu, 13 Aug 2020 00:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597304342; cv=none;
        d=google.com; s=arc-20160816;
        b=g4T+KjrEqXLhFLxibTj5JauD4s7u7Vfoid+n8DYizrqkhsWaXwM/KiU1hcaghf6QYS
         iXF3RIt2IG51IoBHSK5/dF9GG5s5BpbuyGtXkbCDVz9Hq95mIS3tM/p655GsV6AOwXoU
         aBTdU3ciS9ifqcePdBHaDU3m+OrBxSODIR2Izi3L766oHC+8Jj9xa3bfWCJmaz1BV40j
         y6tjjr6jKe8QBZwIvGN/8mOMYUbw0iUXXGeBueR3/7BzX/ZQa4pepTgZnB0tADyinQyD
         VZ+3WPxoYqZ3ipsmRogsiK0ACBcGGE+ySmyig+amMxgKp4hc2ON3THbsOcMcvXxPNs9y
         cXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u6T0uLWiLZAGFG8y7fqfJDxKgaukFimKcfPW0IdJszo=;
        b=dGiD1wsfgY06NhrEY5/wOneuURV1nNyCDXbaPBtQ+A3v67FYdGNGIyacoD83J3As5q
         vndJBiCcRdspqVHEEmzG29MtKrL9jN2VxQ/bfyzulfxg4gZh08aEjjjjEg8SW8BT0QPl
         58vj+DL1kOrw1X4hN39g+M3lwytlgPLwUfK+v1wsCT32eSYusWLgjuBzkji5jN+F6kJx
         Z/G0uN/r4VcpN7smQudHkOHNDGIfQGg1WApEOJTJ5/D1SKyrS+uM0+x4aI0GQBU3HUJh
         tOaK4wCcIiYYFa8883KckKnpcJQ+L9RrOZskZJYXTlnK8lbxyME6wj9TPvyI4Y5sAlEI
         RtUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si5718069ybt.308.2020.08.13.00.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 00:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k67pF-0008KO-UL
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 03:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p5-0008H6-7B; Thu, 13 Aug 2020 03:38:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33696 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p2-0001n1-RQ; Thu, 13 Aug 2020 03:38:50 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 383BAAF3AFFD708CEE8A;
 Thu, 13 Aug 2020 15:38:42 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
 15:38:32 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 04/11] target/arm/translate-a64:Remove redundant statement in
 disas_simd_two_reg_misc_fp16()
Date: Thu, 13 Aug 2020 15:37:05 +0800
Message-ID: <20200813073712.4001404-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:38:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 pannengyuan@huawei.com, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gM2tKmnozj4

Clang static code analyzer show warning:
target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
    rd = extract32(insn, 0, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~
target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
    rn = extract32(insn, 5, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/translate-a64.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c83bb85e4e..47cce160d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(opcode, 5, 1, a);
     fpop = deposit32(fpop, 6, 1, u);
 
-    rd = extract32(insn, 0, 5);
-    rn = extract32(insn, 5, 5);
-
     switch (fpop) {
     case 0x1d: /* SCVTF */
     case 0x5d: /* UCVTF */
-- 
2.23.0

