Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1038401lfg;
        Mon, 24 Feb 2020 18:11:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwboDDyaN/gPhPktx+PwpFSGr0S2r1vs4gUJiIMSkfgX6e0xeYE3D48WCKfhl4BDxJKeiVF
X-Received: by 2002:a37:5c86:: with SMTP id q128mr39876197qkb.293.1582596661958;
        Mon, 24 Feb 2020 18:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582596661; cv=none;
        d=google.com; s=arc-20160816;
        b=sDUheWu95uhiwzF5nDSq2tqe4Q7bDD24+IQsaLwYyWd/j7Ogs8Usem4pAkSxm/Z+JD
         RP939ek2sPd1Fi5BJGLGuXUyQ4sasZkRnjle8DHSCJEhYO+AaX1/LpWVqoRsvkX3Qy/g
         LFesGtxYic91QnKkFMYP+cYDndK4A8s57e5x5FgPOAk0vaL7tQL1RTM9cxiGoE+sQqFS
         j8skHTZTPOu4GH7xwZGXUkuenP2Lie2F2YJFch3GoQs1bsN8OBHijJYbuIlP+Y1YhbZT
         1Sy5ahPUKopR230oKjUgDhFlxeSO6xJ9dsEtC/dS0+3eJ3K4R54Cw7fXTNcEn2DITS43
         LgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=akYpCofzNjTDFlaIutoBzWFiJsDxzBGez9aVe7dASRw=;
        b=OWwGkAGWQmvuz08YAxMZGmLx3cCFtLXuA9tJUH4Nmg27yVGzGuf3CxT3tBgodZTibR
         ++DQu9xGcMQRE5qvmDvk73TmqUnvDH8gcwEumA3grsjJzfJpHW8aZzXQgsKMHT6cOlCM
         WbjYl50GLU+NN6hd0WcmIyXsWa/NlnQektA5noWq3wNh9Qy72Mxrjhy+nucLw/4oQuNM
         VlzGKxo4rHdPZgiKUCsCdHLy+dm0sFwbZPweAQOwqcAU/RWFIGtZBTDvCFTmGOuaB7Cm
         hYPcVY7gWFRsvSjL8XiK2FQfVxYQVs9gAAKevoNz/DlPl4t0cEgycyNzeWFtPxk5580M
         kYjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si6517396qtm.144.2020.02.24.18.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Pgb-0006xT-AM
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgN-0006rL-E7
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgL-000857-Qn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3246 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007zV-D8; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A2C5BDFDBD7D69E87A5D;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:32 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 07/13] display/exynos4210_fimd: Remove redundant statement in
 exynos4210_fimd_update()
Date: Tue, 25 Feb 2020 10:09:31 +0800
Message-ID: <20200225020937.25028-8-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pG/djw+rmpP

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/display/exynos4210_fimd.c:1313:17: warning: Value stored to 'is_dirty' is never read
                is_dirty = false;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/display/exynos4210_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index c1071ecd46..05d3265b76 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1310,7 +1310,6 @@ static void exynos4210_fimd_update(void *opaque)
                 }
                 host_fb_addr += inc_size;
                 fb_line_addr += inc_size;
-                is_dirty = false;
             }
             g_free(snap);
             blend = true;
-- 
2.23.0


