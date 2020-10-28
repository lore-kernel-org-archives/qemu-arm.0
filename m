Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp135849lfa;
        Tue, 27 Oct 2020 21:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwddUuU+pwy4sv4MIgMJvED3zrD0Y6rFsMn3m57vkwStHRifCCZXRLfPE8usTWKdB8ZWHGH
X-Received: by 2002:a37:e0e:: with SMTP id 14mr5501828qko.455.1603858961024;
        Tue, 27 Oct 2020 21:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603858961; cv=none;
        d=google.com; s=arc-20160816;
        b=HyHJ7UOcrhuVOdEsMmLo7XY6XmPsjwSffhBQ+2Ipw82UCMsR9nmHblTHYsOP+Bt1nT
         o8FSh8vIT6+Sy5aWpVCL7NIXCBX2+eB0U5ILz6lRjPuCXkuAC0/mplT+WVAZQgTJbXyv
         +NQO+yRpGdbuP5/BIeP32URrHlIQ5CeHLlL/PFgCs65Uz+QH9YWCekwkszHBUPH55x0n
         f5WWcA/e6R4lvPQER0TA7sGYMpI7yFIwYEEEyPb0vPTPMZxoFhCV3J0W6T9RK0UbHC4N
         M1rZJ7nc9xWce7fZDio71QqbQOIc8V8O9XlMoURz78amvV86g4pb5sQc1NlKPBdT3GYe
         Nz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iJ19WOixeyToGv4q8r6mviloAXq0ecBl+9C25Nrpi90=;
        b=A2boc9zA0ZqLA/NA+M6NuIvG4zKNvomPrJOuPzhwmloWt6Feq21v7ECNXzp9kVmWPc
         PZqSXHFIYilCXdVtGmst3J5WxxXufUgtiRrL0KFw3lKs8F0cF4FOC5B6yVxKTKanpW0d
         HIv6mjoX+gdtKiBdJAFxg2doKeU9AcnSOCI84tB+wm3mDl1LVzpEI3mfsy9KhJ9G3vsS
         4Hn2/9KU9fkG9zcWCvhjL1ty58p9MK7Skf3i+46eakhn9lll0C1yVZIbs9Zq1qjtR7jp
         lME6u6RAJk2YN/sRmqZuD44K1J2JHIy5nQtcfqD6TaFLddI+tVJHyToCCSUb01B8TvM2
         gHQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si2295254qkn.270.2020.10.27.21.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 21:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXcyu-00059u-FH
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 00:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcvX-0001hy-05; Wed, 28 Oct 2020 00:19:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcvU-0007aI-El; Wed, 28 Oct 2020 00:19:10 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CLb1R3ZNDzkXyB;
 Wed, 28 Oct 2020 12:19:07 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 28 Oct 2020
 12:18:56 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 2/9] hw/intc/arm_gicv3_kvm: silence the compiler warnings
Date: Wed, 28 Oct 2020 12:18:12 +0800
Message-ID: <20201028041819.2169003-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 00:18:54
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-arm@nongnu.org, ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l93RhL7HMpjS

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_put’:
hw/intc/arm_gicv3_kvm.c:484:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:485:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:495:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:496:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:498:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:499:9: note: here
         default:
         ^~~~~~~

hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_get’:
hw/intc/arm_gicv3_kvm.c:634:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:635:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:637:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:638:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:648:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:649:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:651:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:652:9: note: here
         default:
         ^~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/intc/arm_gicv3_kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 187eb054e0..d040a5d1e9 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -478,9 +478,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP0R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G0][2];
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G0][1];
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G0][0];
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, true);
@@ -492,9 +494,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP1R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G1NS][2];
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G1NS][1];
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G1NS][0];
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, true);
@@ -631,9 +635,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G0][3] = reg64;
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][0] = reg64;
@@ -645,9 +651,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G1NS][3] = reg64;
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][0] = reg64;
-- 
2.27.0

