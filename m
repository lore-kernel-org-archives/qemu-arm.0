Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1991473ejb;
        Wed, 21 Feb 2024 07:31:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIHM01gobpk918cTLcK0CVi+FzLvmIz9IafPhSUWC292fcGWlC2PMZlCQoJjB68Pjefmd4cBIsoSBodvH1t5QVK9PIR1oj
X-Google-Smtp-Source: AGHT+IFt3Yu/ajkvtpNBO086josbTvsA9fzegWX43AYXTNG1FoGcvm8/HZYrMWzAE3nud/S4jXh8
X-Received: by 2002:a05:6808:1296:b0:3c0:4653:6e9e with SMTP id a22-20020a056808129600b003c046536e9emr21652860oiw.6.1708529500973;
        Wed, 21 Feb 2024 07:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529500; cv=none;
        d=google.com; s=arc-20160816;
        b=Xyv/Qy/j7WhRkfmkDKUDsd25Z1cwzxLcRMbl1/h7RqWrIDF3K+nHn3vbnO2sgYwjqf
         +bebA9g17MIC9clQJJjyLsoIanzYX/rTcLz7VKIjb5kHfpJ3lwAN4VGBO4My4drK5rXA
         MMAdS+U0hI5jTbhywPLqYNlsjVgKOFJGIUgW9f+QL5ZehawNXF5jSUoDvEuC+ErJuVFy
         DaXLlMe2Gfs5WqdN/5aem7YigIrx1Y46mvAJQFytz9uR+Dzp/Da+DWu7UsC2jOJwlONb
         wK2KQlRl1Jtfs6Untr1kGTW602gl/ZjKZh9Hykc7CZqOo3oR0j3Zie971jGhB6ha7gbr
         WFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4kLYOKX/JKI5MtQUg2lTaD4oLfba6rvoiqvCV8V7KD8=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=tJcYJoSaX4huLYBEqDB91fp6spvSYj2X5ayhvN0o1BP5pOTQdoP2hKWtyLqQZsG/oG
         l25oTNhuWvXopUWM40Gurk4AS4J8yS/Nof82cFd3nD9ezVN/Zu4ezULQtexfjHITRqJ5
         QGjP2wSRtqeP5DfeXz8mfwUOHid1U4JuveTlXDJCSLivcQzCxmoppsO7ePZDfyuqNcND
         t6Bu+JmgyO/xXrrx4GGqhCiFhvmnVGknxCXsof2o22v9OkHFcAPSOl99on05fJmerIYm
         bocVPrcd+Q95bHcEO8dZVXg+kGvmGx9brC7or4FkuQzaU/ZxHxbahBjsooBlZ9legmFg
         x1Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t37-20020a05622a182500b0042df052451bsi11395038qtc.172.2024.02.21.07.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoW1-0005S9-II; Wed, 21 Feb 2024 10:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoNX-0007qA-Jc; Wed, 21 Feb 2024 10:19:30 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLx-0004rK-Pb; Wed, 21 Feb 2024 08:09:40 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TfxRs5bJrzLqBy;
 Wed, 21 Feb 2024 21:08:57 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id CEC7E1404DB;
 Wed, 21 Feb 2024 21:09:33 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:33 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 14/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Wed, 21 Feb 2024 13:08:15 +0000
Message-ID: <20240221130823.677762-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8GRt2TP9d+Ad

The NMI exception trap entry behave like IRQ or FIQ which depends on
the NMI interrupt type.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 952ea7c02a..ac5f998e32 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11466,6 +11466,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_VFIQ:
         addr += 0x100;
         break;
+    case EXCP_NMI:
+        if (env->nmi_is_irq) {
+            addr += 0x80;
+        } else {
+            addr += 0x100;
+        }
+        break;
     case EXCP_VSERR:
         addr += 0x180;
         /* Construct the SError syndrome from IDS and ISS fields. */
-- 
2.34.1

