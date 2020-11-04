Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5570667lfa;
        Wed, 4 Nov 2020 02:23:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUPJbJzNeUOW/vG7vgrgbhdx7efVIuC/PPlpbrNuPulMw1Zc7u+IEidoc2gnDRWsuHxcrh
X-Received: by 2002:a25:d701:: with SMTP id o1mr33796753ybg.453.1604485414973;
        Wed, 04 Nov 2020 02:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604485414; cv=none;
        d=google.com; s=arc-20160816;
        b=GVI2fzkothb3hRDR/O7e1BWqV/5KzgRcOKry5fN8//V+ff8AIFTy8EeNzT7tIzNrjN
         7tDtdnvA43V97+WZeLyzBK11q1uFuq18JDGIgIvqmry774dCmHJEWaQFDUrCmbMrfhZn
         04ZbJZTQ48zs4/n1eQGjKVjFBMzaDt1ytk81F5WZtZq8CeDeieos5nU7aCUO+BseSGaC
         1p2LzMAFlPk2xigxkO+9/jOfzsCLPDsR95kk/31/mjkLqrh9SLhnFPATa8KkeLNfDpAL
         z3+sLtA8juqnXNIll/9jdyijLwkoKOjbaJdViAUOg3qXdz2He+aAGnF3Rh3HB4UVDIdU
         tgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:mime-version:user-agent:from:date:message-id;
        bh=LQgJfHkhpND8xb7tE1Rzp8oXApRPWA8xYWBn9kUc8mI=;
        b=slUBnHpI5rcQF5UL9zaLzm1OjxJEg3/qaj5A7371WbyvufcOWPkQUh9LChr7ed6ZA6
         87UhctE50zGuS6fodAbDORVa+EYTlNgSIFwlY2ur+hkmBquFk7Rzk4gHQSBLivd83lCk
         T9b0f99QiFCJOPxJgrdCEqGttosG2dEVe1ivXn/AEBSKxdRC06USz2Vmjk7LqLk4Z2ry
         nDA/yA1k2xPzdFSJiCqqU7ytXMYyUy+0Adr3Ki8ivRzrMaCUWhy46l4kK4/rZ2gwuqxJ
         eJs4ArySHb3TaErqitRZwaG9Xn1GlTzm4gZPqthvCl5/JigSuybY242gw4D3FOc1Lo2J
         3L5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si2056163ybs.138.2020.11.04.02.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 02:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaFx0-0003aP-B3
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 05:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kaFwV-0003YN-Td; Wed, 04 Nov 2020 05:23:03 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kaFwU-0002HK-5U; Wed, 04 Nov 2020 05:23:03 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CR2ls5FBLzkZZ8;
 Wed,  4 Nov 2020 18:22:49 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 18:22:45 +0800
Message-ID: <5FA280F5.8060902@huawei.com>
Date: Wed, 4 Nov 2020 18:22:45 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>,
 <jcd@tribudubois.net>, <peter.chubb@nicta.com.au>
Subject: [PATCH] ssi: Fix bad printf format specifiers
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 05:21:16
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CAgY9zS7dRFl

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/ssi/imx_spi.c    | 2 +-
 hw/ssi/xilinx_spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7f703d8328..d8885ae454 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -53,7 +53,7 @@ static const char *imx_spi_reg_name(uint32_t reg)
     case ECSPI_MSGDATA:
         return  "ECSPI_MSGDATA";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fec8817d94..49ff275593 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -142,7 +142,7 @@ static void xlx_spi_update_irq(XilinxSPI *s)
        irq chain unless things really changed.  */
     if (pending != s->irqline) {
         s->irqline = pending;
-        DB_PRINT("irq_change of state %d ISR:%x IER:%X\n",
+        DB_PRINT("irq_change of state %u ISR:%x IER:%X\n",
                     pending, s->regs[R_IPISR], s->regs[R_IPIER]);
         qemu_set_irq(s->irq, pending);
     }
-- 
2.19.1
