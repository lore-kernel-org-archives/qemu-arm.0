Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1992609ejb;
        Wed, 21 Feb 2024 07:33:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXe0QhfT1WDzY4Zh6+oZf6A24nVYDTtb6PnfRG+YNoeQoFXQyjd3T6xpazicoar8IxGT5tjHahXy63dCZQKmL2oF1VYrXC
X-Google-Smtp-Source: AGHT+IFdAKGBRG5dDAEUVTaA2uCaQXAQ7XADknJoEOUnVGNylDEL+iiZiiO6op0hgyKMBvZVgQ6X
X-Received: by 2002:a0c:f310:0:b0:68f:327e:ddfc with SMTP id j16-20020a0cf310000000b0068f327eddfcmr15545846qvl.19.1708529611704;
        Wed, 21 Feb 2024 07:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529611; cv=none;
        d=google.com; s=arc-20160816;
        b=lztCC1f/1mtzUHt5/RoJjOtJctvdJXMzKQfCiK//7OSaRYRixdbX/Ve0Ssg03tnrDo
         6ZZf4G2v7gEw7sJ7aQaeV2QzBETvu7jo/b5MetS1vG57nphOhQ9Aq1IKiLZvohBTjDWg
         S+/ue1vQJ/eIPJQPOQ4MfDReHd+s0/qEvCp9pFavdFKtQxWeZbrnnZBL9ot3fhgHSCWo
         R/rJDbTKHdzQ6dQ+uQnClFTEYbgbI9WqgPutEFceTnUZR5buq3QULOMkqieh1IPtuEnJ
         BZDUQ11MWrAL/8LJlZdgo4XRPzQA5pIUXTAhqqCTsf+x1b9iYSs9PG5BMlUjiuwJ4Ryx
         xODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=IskkynCOJzcRLoOtLEUTfZkdGRpCDG2N93RrYWmZnHk=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=AxBKEewCF+f8dFstHMdF1ZlxLH612UftAJm+IntRK6+4GK1N7P8LGD9pJvGi4De/eH
         dvvyB8fWWh9Wd/FyGpm/ay0iyq8FP3rUlcYmhvKe4p7qPsJR9GhcEnI6dkCF56BYjaYI
         itAwm6UDu4ZX1KZNbG86eN0xsMFik16mzMvtrskWD2HeJNRlebHjie+BU2nz1pY1cesE
         qIov0HOjSE+OZCk6vHaZyVnJ1Yy441WsG4NzcJKjVlobucNGLkbn5aOrGhMzDXVSH8F/
         rj9qBMDGNjha9lXloTbI8LDpUEsUMPSFx4ypvuuQrpi+ZJL8k8lX8NRYTbl5b9Z2gj8X
         3Ccg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05621419e800b0068fa448f568si1434953qvc.206.2024.02.21.07.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:33:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoaw-0002WO-8C; Wed, 21 Feb 2024 10:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoYk-0006N7-Bi; Wed, 21 Feb 2024 10:31:00 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmM0-0004qL-Hg; Wed, 21 Feb 2024 08:09:43 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TfxQZ6qlQzsWyn;
 Wed, 21 Feb 2024 21:07:50 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A097B1404DB;
 Wed, 21 Feb 2024 21:09:30 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:30 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 10/22] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Wed, 21 Feb 2024 13:08:11 +0000
Message-ID: <20240221130823.677762-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: ceYx+bBrUYIp

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 62c8e5d611..952ea7c02a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11540,6 +11540,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu) &&
+        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
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

