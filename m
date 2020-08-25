Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3345108lfy;
        Tue, 25 Aug 2020 04:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynAxrBuBkE/MRxxpQhM6E5m6lZL7gqLHetbA2oE7s1XP6SAzrXtLk1dY+w+PJeWm63hYrj
X-Received: by 2002:a25:5094:: with SMTP id e142mr12964867ybb.99.1598354793088;
        Tue, 25 Aug 2020 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598354793; cv=none;
        d=google.com; s=arc-20160816;
        b=SrePOiIzVl2EmJXE31jLzRgtA9BoDo5Uc/xEPNfPmeOarm3e952RsbKrrljHLxBV1K
         jBygdDKwu0583nv0GGsmzz99bReABIFEQhSiwCYIWiPd/aEv5X0TCGicOGwjxYSNdF8o
         l/fX80A9zYicZi9GBNTvEww3fdyeWM5M/tVNW93nbqyY4+TZDjWh+Ah3WKrZIz5W0XNk
         bRUhXYifhQVrx+VDkKrYSTf+8Jskpj0Oyewz7iW/lCa1UThLTew+DbPxzhoh8ie+Ya1c
         aqP7awRSfaIRhhVYzJOf3Ovp1/WETu0NZUYlB4epWcj2QIbK+ouY6FKJexHfjOxDrdBs
         nylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qmeUfAFkoMOvX5urtyY8LioTIVWXQc5HNDD2nevyL+4=;
        b=ZUiVOC6un4eFGQDwwEumIxgWHBgEtuARf9thoum44f4I22rgPC+wLqMFiFMhVXZU6h
         s5AoVu+iykshpMhK0bhzY6z7KCp6oCwk8G80cCTr87b4pX76hheRN6cTTzRHeOyXY+H2
         O2xIvPHl/ODR6PO8h+XPuX9ahuNtU6VOq/Bpu0dfouIy7NuMNKawlQ0KlBjM3U40cERh
         sYg9Gj4hpcZ+iufP773uz+YZo+UfEyhd6IKUtZld+eMLDanDCkztGGCXOOQltQRVR73f
         eeNuzB9++ZDmsWFhYcCHIWVknt+iIGAhVUaLe7u22XfN5gUX7RlQugRPD9//SFpyfony
         WHUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si17778698ybt.235.2020.08.25.04.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAX60-0000ZA-FD
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5q-0000Vq-2s; Tue, 25 Aug 2020 07:26:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40248 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5k-0006eR-FU; Tue, 25 Aug 2020 07:26:21 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F0D982BDE2BAB82EB41A;
 Tue, 25 Aug 2020 19:26:03 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:25:57 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 02/10] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
Date: Tue, 25 Aug 2020 19:24:39 +0800
Message-ID: <20200825112447.126308-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: A6ZHlP3DxBEB

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

