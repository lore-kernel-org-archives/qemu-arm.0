Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4730037lfa;
        Tue, 3 Nov 2020 03:51:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3aMA9fZfqWEuPX0tCeouvMzqNxA8ATL1ExEEjGNhpfRaoW3apUZjOrIuhnOzAwG0YQfna
X-Received: by 2002:a5e:9244:: with SMTP id z4mr13930644iop.53.1604404314248;
        Tue, 03 Nov 2020 03:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604404314; cv=none;
        d=google.com; s=arc-20160816;
        b=UtlTWI5Sb2J1Mt5uu7LqBXg9Kyex2Vp0gYBvyqB43P2tIqdVGFzPw4oVBBrUQbyjb2
         ErUDOnsRLaf9uU9Ua/mbhCxEWQ/JCGUYmFTVSMEIhb0JxaqPON7IIZCD1h3izBx7ZTwG
         3pGnKj4wRgFId37T5hgXLHQgvP0y324csN54xqiBJ+IsRIHgG/hb4pWsjhSp7Z3Uh5tS
         BBiIgLN5Xtb3xnVSb/+WvWtvq7r99tHkd3sCgNZOv3uEGg2RqQXDJcaI3KzmbUV+nlHs
         stnLOjhHpPJ/cNhLgz+i/ej5Olq2lBo/tK9oewUP2qGUkefUhPhKjGXrNFftbJCR4Haq
         s1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nki9gEF8Ul29WN14ASCHJ8nXzOjpSekpT5V7VaK2ZIA=;
        b=MmwG2gfbeSxbek1jJ1CvyIQYze67mUNulcXgMfhKPjatSqhcagoBSB+2p0HC5DJ7iu
         2CSDvpiC6sTXr8sErKgyMEQsiCgdYVEk1mRqpGKZTYKYYSJmk/memeepjpFZzwVVkQHO
         QmPwfpAC0VyQGAx4vwBdvWtUC/UxG/IcGDAG5/ltia9DyYFfzZUUjy146ZqejTnUcdYh
         a9YRWVgPixU+qOGvjrHpqw+2Pm8x7ogZCOGKZv5LQCFmvCukjHVY45LkP/nkrpJ2fxQ/
         bxKwejq/5CEv4wwTevLoV0wESlOdMsIqGXhMKEOVwSd1iIh1Di0XXM3OL8utINi1ZnRX
         bHSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si11844093jaj.112.2020.11.03.03.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 03:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZuqv-0004yH-Ij
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 06:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZump-0000hR-2W; Tue, 03 Nov 2020 06:47:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZumm-0005X7-Ru; Tue, 03 Nov 2020 06:47:38 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQSgy07C6zLt5r;
 Tue,  3 Nov 2020 19:47:26 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 19:47:20 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 3/3] target/arm: add space before the open parenthesis '('
Date: Tue, 3 Nov 2020 19:45:29 +0800
Message-ID: <20201103114529.638233-3-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
In-Reply-To: <20201103114529.638233-1-zhangxinhao1@huawei.com>
References: <20201103114529.638233-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 06:47:30
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ydok3x+jJc9z

Fix code style. Space required before the open parenthesis '('.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 38371db540..efa3b59d04 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9094,7 +9094,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             - Hardware watchpoints.
            Hardware breakpoints have already been handled and skip this code.
          */
-        switch(dc->base.is_jmp) {
+        switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
-- 
2.29.0-rc1

