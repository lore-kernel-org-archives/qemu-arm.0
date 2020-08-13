Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp276944lfy;
        Thu, 13 Aug 2020 00:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ8EfjjnTeZjDmGfZlehRWqBg07vvZop3Xj3N7nSoV93tPW9I6qMvawFtx3+ttcGwFISmL
X-Received: by 2002:a25:b88b:: with SMTP id w11mr4932922ybj.129.1597304351650;
        Thu, 13 Aug 2020 00:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597304351; cv=none;
        d=google.com; s=arc-20160816;
        b=E0iazQCy9KXrQguTczom/5D14aex6iseMr3LAZ2GTIOXqFmK3wnoDmy6cuvA++sswf
         1ENpu9pTpjuSEEOJwHIkAWeU7GNkcAoFoWNS3n4fAtlN+oQjQ4JTnl3nnoJ1boqx2aLV
         e1oJIL4yx+G4+ISkb6GTliiitOUbzwmr6nDePwqzppz+K75KOfJ5GGAIu30vGowfJaJ2
         ZtzM1IknbBcSOGdEgZ+FzBMF9Un5WTf9kJOZOwXK/OlCvp3JoMxg9FaAGOU+zQlIqE9v
         F5NTl9K6393cbx5tDvWGFhdP/T7sqMBry8Y8ltNKVPEf1HAUK1wmU8AZ/+8ynsLfZQth
         hSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qmeUfAFkoMOvX5urtyY8LioTIVWXQc5HNDD2nevyL+4=;
        b=sWY2nKDzzDxxGSlNVgiJeM1q1tTKHf3amKmIST1+vOQcxZb3IwlEn3ZNN76ekANCTb
         DYhYuBorlAeLzqclJ++4iS9xSqof7rdeEtU1GwkMpKaGbhJZiVqtqTe+WTEnvjWXsfiL
         RWn2fACN/aSIQ6Pxiw83L+UmQ1dVts4fYgaswAWg6sl6Ifv8Dg2GRjbqizwkjTDpQhl5
         Mrs1IZC6twe3InazUNel1HbzO6Uh07bD8WaH7dB9bmoF2acl7xlRdqRYXKG7JrkSEyS5
         gjGoZp6j2CU///GrkF+0EU/pKM78qgbNkN0CQQtTl0kFuDF7zkECKoh1kChVwWxi4ol9
         bqog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si4221955ybc.473.2020.08.13.00.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 00:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k67pO-0000KL-W1
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 03:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p3-0008Gj-V9; Thu, 13 Aug 2020 03:38:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4234 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p1-0001mb-4U; Thu, 13 Aug 2020 03:38:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EA1FDE48838369881333;
 Thu, 13 Aug 2020 15:38:36 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
 15:38:27 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 02/11] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
Date: Thu, 13 Aug 2020 15:37:03 +0800
Message-ID: <20200813073712.4001404-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:38:37
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
X-TUID: apflPw3N17Y4

Clang static code analyzer show warning:
hw/arm/omap1.c:1760:15: warning: Value stored to 'cpu' during its
initialization is never read
    CPUState *cpu = CPU(s->cpu);
              ^~~   ~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/arm/omap1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6ba0df6b6d..02c0f66431 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -1774,7 +1774,6 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
         return s->clkm.dsp_rstct2;
 
     case 0x18:	/* DSP_SYSST */
-        cpu = CPU(s->cpu);
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
                 (cpu->halted << 6);      /* Quite useless... */
     }
-- 
2.23.0

