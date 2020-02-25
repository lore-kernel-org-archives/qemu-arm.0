Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1039980lfg;
        Mon, 24 Feb 2020 18:13:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyYM/a55gAjy3TN2PnV+MUoGclSwykp3C8knPQJ8CMAAUqXNOq1u+r/DMUm6cOVXYpQpvy
X-Received: by 2002:ac8:4659:: with SMTP id f25mr47360393qto.273.1582596782300;
        Mon, 24 Feb 2020 18:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582596782; cv=none;
        d=google.com; s=arc-20160816;
        b=xmLeagLiNY3iKBWBqv+QtYcGnVQkQN2zXQqJVlDDlWFhtjMOJxBwq0LYS6WMLA4984
         TlkmkIAG0mBIbFEGta2QAoaWyr+bAKs5m4nA5GdJLVHo/z2leyjaolfzMv/KdpdXL+Gh
         C/DjypLqeNhFQp9rY9uONi6vjnFY04ONvF4ukxhMvazHAU5jBgWQu0y50zVC4aFjaxA0
         vCKmNxkG6EQDbpWr73KQABIim3mZp4ZCYVc6z5XB44tA6MZmuffxFvh6yxmDYCaC14gI
         cjvrnoyG0kJ+GRvHXJgypukG85vVKcZ/XUW85g2Dt9xH1NI7hIqBO97oam/OUj7nfdsf
         SCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Qjpy8gIjoURlxpcsZ1LlPw0NUn5Aq1bz8LxFKykFaVM=;
        b=iXXpdlIRkERiYbJ3mYOwn4LiKnVH6EFnJwXA3vaeqlb+aS9iSggVPnOZl716NAY05Z
         vQ9yUP2X55AEoW79VYOmtLMwEhDMGDRz4Usf3yxuXd9dnHzfk4M+zA5Ih+9kt04wStf4
         XXQdmJLQYDeUM2K603+PM94p7N9iv/b+v0vQpvT70bf72UdB1ydzJIyKlArSvRxs/iS+
         lJdf2Lf3w0EJH/tvkwdtQ86tOrV8/myYSn/Fy8e0Cg/vNfbjqvYLC7o3UgdK2UMQtRrK
         D0U52bvLv9buut1PGZFJhEZ3JIo6ApC6h/pXl87FAlrIq1xb1I9I6VFtnC20FEzRjcDH
         eRCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si7210247qka.10.2020.02.24.18.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6PiX-0002vJ-NB
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgP-0006ut-Fv
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgO-000893-1f
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3247 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgN-00085s-KB; Mon, 24 Feb 2020 21:10:47 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A78BD7B223F2D41E97D7;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:34 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 11/13] timer/exynos4210_mct: Remove redundant statement in
 exynos4210_mct_write()
Date: Tue, 25 Feb 2020 10:09:35 +0800
Message-ID: <20200225020937.25028-12-kuhn.chenqun@huawei.com>
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
X-TUID: LCbsn0oQtYqm

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/timer/exynos4210_mct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea5..570cf7075b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_TCNTB: case L1_TCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_ICNTB: case L1_ICNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] = value &
@@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
-
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_FRCCNTB_WRITE;
-- 
2.23.0


