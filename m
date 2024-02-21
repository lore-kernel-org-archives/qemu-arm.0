Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1983346ejb;
        Wed, 21 Feb 2024 07:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWli+1dPRHszDJKwW6Ez/XOgIWN9n/I4giYMMDPsyzv3kGV1/aDFXCYE0j0IWuA6bjczyg6mgOSqI1ac8mEynGLI1D+xAMi
X-Google-Smtp-Source: AGHT+IEDrWWRQ/VWTWrsMbTwq26YYtr2SvrwoWRR66fTheTkNHlOXq1XbUVI+hCKrpooc+FP7J0O
X-Received: by 2002:a05:622a:1352:b0:42e:2b6c:7e13 with SMTP id w18-20020a05622a135200b0042e2b6c7e13mr5430953qtk.54.1708528682453;
        Wed, 21 Feb 2024 07:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528682; cv=none;
        d=google.com; s=arc-20160816;
        b=gUIXuq6RGzijx2xZXYgPnlKlSb3oKRQ0Vp4RXhA95gRi9CtmNH0GfMIdptOkzgPc7i
         cbUhf1ztv2mumTYZT5fTYu9GVW3sNPSN955MWcwdoAJRwsmRrKVNJ66xdmxYpwRYGGmI
         a1bGlk3qdBhi1gPPigc1joECww8efRO6ARqZWC98gJePJ4oQ6L5Fap7rM8GS//8Cadgd
         0VngobFE2w5IFZDQFd5bjGUpqRGQ6TRzlpE4YlyaIzPU6uiGwSekxx7jQSBO5z/YalHJ
         BMDnUeVyBHNtOmo6SJzlDsn8+Kl6bJJDS1hwAvBPRznAJIyru5Vr9T+0iLgV4EpjGVKD
         y5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Eh37bVyGMOfiJqS3j6mud4OH3cm7ieMFo4g7GBocUnU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=F9JwYVI5nD12IqD4BakhY1acChGOQ1qBkWBcvw4RE40YuJgHFoQDzSz+FaKfv1KHKM
         UL0vJhnbt8Ucbqo3KgYPyEKLXK7dvL8Z3pJKK/t9oIwGHhR78SX7EkeTvB7l9gISL4up
         JBRQy234p9r7aiRXyvbFPcUCXOn1FI840cxXB8kMXTSjJG7Pd0ygo7s+m8ErD0PGw7+K
         +wzwN906m+wKQFlOsuaGVfqgcHAVY59/X7aVDCwsq7H21/FrLNioxP7TN3NfwCisTfZI
         KydEGEo00p/aoWIzs5HQHjpi+vBQlJHIA48c12q/CYrUqZvhz6lODgSUaDG+kDKfa3kd
         6sNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020ac858c8000000b0042e1a66b04dsi6118129qta.389.2024.02.21.07.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:18:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoJj-000173-QG; Wed, 21 Feb 2024 10:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJN-0000nB-IA; Wed, 21 Feb 2024 10:15:05 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLx-0004qQ-Nh; Wed, 21 Feb 2024 08:09:39 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TfxQ25M4Nz1h0J9;
 Wed, 21 Feb 2024 21:07:22 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7E163140154;
 Wed, 21 Feb 2024 21:09:31 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:30 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 11/22] target/arm: Set pstate.ALLINT in
 arm_cpu_reset_hold
Date: Wed, 21 Feb 2024 13:08:12 +0000
Message-ID: <20240221130823.677762-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
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
X-TUID: XPvzTTZoeHEq

Set pstate.ALLINT in arm_cpu_reset_hold as daif do it.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 055670343e..e850763158 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -357,6 +357,10 @@ static void arm_cpu_reset_hold(Object *obj)
     }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
 
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        env->allint = PSTATE_ALLINT;
+    }
+
     /* AArch32 has a hard highvec setting of 0xFFFF0000.  If we are currently
      * executing as AArch32 then check if highvecs are enabled and
      * adjust the PC accordingly.
-- 
2.34.1

