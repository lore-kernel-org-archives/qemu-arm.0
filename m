Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475683ejf;
        Fri, 23 Feb 2024 02:36:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9CM09CuPL+LAGU3GFxZ7sOAHKV2HCbf8HdJ2iA0Gkrj0hNLgvC4xsaXmMSPsfZGyD9/Wbqbm5yMwf5nC5CsDP5ES/RHUc
X-Google-Smtp-Source: AGHT+IEZlH/Ov1jisVk1Uy95HD3hfo99uQaonvilfGe1U40mS9UQeGMMH1xaZijN322gHHpkQt7B
X-Received: by 2002:a25:d842:0:b0:dce:fd56:b213 with SMTP id p63-20020a25d842000000b00dcefd56b213mr1663311ybg.7.1708684561092;
        Fri, 23 Feb 2024 02:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684561; cv=none;
        d=google.com; s=arc-20160816;
        b=ctWm3tY7BRBYWfD1+1JMdxb7IT2se1JcdK5pEwwYc4TDsf6dhR3p57OhMryVK2x8rX
         nJFkKkB9V+S5UJNPqRpKKHdeJoru3zUbdVF19UyWVJFriQ7ka4EyPFY4aIrW+sWaz0XB
         XmoDm9yq1YaDOOXLo9IcZyk6VSqGZ10IvVGqXG91aSXez2da17U4qIrjI3ilxa3vi2TN
         nPElDf8CRBIOoY7rIQJ2oqgw4qHK5iDem00gZ2p73lqFHgtknoHMsdebCOksAjmqQPEl
         WhNv9xlEXr2WnrgCoU9NK4WVaZpMSkkX+nkBjhFMEnP+zjUr9kYRiglIqYdVoK1p6b5A
         z+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ouaxo9uBGlvlL39L4FTZyd6NyY4EVVhSxp2Lq90HH94=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=h6AZA+4KiSiGYm2m6AYbTwdxe+mpYOaop7EtzJazROfT23WGW6Yoz3uzWz57nzI1Ux
         FCHGnIJLPRDtThlPKp6Bw02UnTAqbO1Id4F0OXYaCzWZpMYzmakKEY+faiel3pQSHdh7
         3sNOp9Mrt3WeXfxQplKGMZL2umm1XGtZ6wvnwSf29xRqo007xQmd6C5pmFG7W84Kx7cN
         myX+Kys4gMcsTHdk5R8KkNxlMZzYPnpfZE9Lxf0mHfqcsO2rmcUpHkv9jml6rpPdlSHe
         OuyfgkCzUXJ2SuG5HKk7E9PxfxCePrXsHeBV0X2Y8YrGaKqwPq9Uept+JIcvOj3g+ONH
         ecVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05620a29d300b00787317ae356si679218qkp.466.2024.02.23.02.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdSst-0003ns-WB; Fri, 23 Feb 2024 05:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsT-0003bW-JN; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001we-Ou; Fri, 23 Feb 2024 05:34:01 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Th5pC3Gc3z1FLGW;
 Fri, 23 Feb 2024 18:28:51 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 530761400CC;
 Fri, 23 Feb 2024 18:33:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 12/21] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Fri, 23 Feb 2024 10:32:12 +0000
Message-ID: <20240223103221.1142518-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N4AjPcpp8RSN

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0a69638651..1a5e992d26 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11452,6 +11452,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
-- 
2.34.1

