Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659035ejh;
        Sun, 7 Apr 2024 01:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI6/Lh6HNw52QE+CxzKOp6F1DC63Mv/i1qstmMOGjswkXw1UcUS4//dc5ktnE59q/qNc1iPVNMpWSpQJCZoy4glg/XbDcV
X-Google-Smtp-Source: AGHT+IGHTH2IkN0vOEp29Om/rdaW63IhwL+WSlKKQFBeSQJZx0iDfZexq86XvtvQQq6TplZLJ1sb
X-Received: by 2002:a05:622a:1450:b0:434:4beb:36e3 with SMTP id v16-20020a05622a145000b004344beb36e3mr7678798qtx.12.1712478025541;
        Sun, 07 Apr 2024 01:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478025; cv=none;
        d=google.com; s=arc-20160816;
        b=gAbAGIMbRwV9iq/2OvBABtxWoDanXwyPtqMgJ4/E3oDO1qCSvZ6imusIPn4ZeZRzuY
         VHe9h7HMxY1CIo4cAg3Xu/8RE5orkRNJyTNfUXikgZVubEU+DW7zyz3Kd39eI/Q4CXkM
         xjAlmOkPDLTtGlNpE+QH5yWlluyIPGMCDe9yFGDJ+KKUTpe1nDlEb+Aiog3t9A25Q1AQ
         FeVgwfJvpFio+izRG2YSZDUucaj9SnBr/RMO73grN5UUsqicLvzwEyGFkVZFaQJP4dQY
         X/IxpsQ9wBDQPnfETR2dKOHF8oRdzyAh5MfJit8m9D3u7EGGq86zdcvp6OdJUgK9WhIS
         cfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WUn6gCpYr5t88MgbuG/X+FyuDwh6C4SjA5U8Pto0ltc=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=kYXwIpDhDJh+QTAyXg+bmHkCmG0AJXER4LiNQxnErJvFxdy9bQRkL2gb4n8HUhLPzc
         aBO/DVyKuwVCD64573zwUHP/n5YXpzRjhstVIoNt4QnzTrHPPc6sEZ0RhAFLDUu2V5Bo
         h6Gqqfn4MK4tm11pOes2marhockX0ZzFwcSz3UAZn0yNa7lqBGnkdFQ6rxeoGTDDrExT
         x5Rg6Vp2VkaYj2ncpRMATT3xrIfzy8CYGrMezD/MqFmAp8xHtlKItdIOyAqCVVPERmQa
         3QCdAyCdvurztYq5+q9IS0QNy5lnixhkSMHpH/5IjziRqz0NlwX73W4YQ+AqQo7kduxV
         TOfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt10-20020a05620a478a00b0078d5d0b8472si2376249qkb.700.2024.04.07.01.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:20:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNl6-0004KH-UD; Sun, 07 Apr 2024 04:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl2-0004I7-D3; Sun, 07 Apr 2024 04:20:09 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkz-000232-JH; Sun, 07 Apr 2024 04:20:06 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VC4p92VVGz1QCVb;
 Sun,  7 Apr 2024 16:17:21 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 91B12140154;
 Sun,  7 Apr 2024 16:20:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:59 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 09/24] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Sun, 7 Apr 2024 08:17:18 +0000
Message-ID: <20240407081733.3231820-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6Mta6TDG6fub

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
v9:
- Not check SCTLR_NMI in arm_cpu_do_interrupt_aarch64().
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e7eefd7e5..65f2ddfa56 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11729,6 +11729,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

