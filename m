Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1038544lfg;
        Mon, 24 Feb 2020 18:11:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwDK9SwbfBJxW7kzMzcsvrqaMWIJGNauXN6XoE95LF9I+MpBmHNig+Or1qi1R6dLQkeipzz
X-Received: by 2002:a05:620a:c90:: with SMTP id q16mr51553285qki.412.1582596674074;
        Mon, 24 Feb 2020 18:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582596674; cv=none;
        d=google.com; s=arc-20160816;
        b=f+6uNQAbov4/bKjFUgePB91igI/FCS7mVXkvk5ppEXOL5ZFDFszJZhZcdSNy8/ZH+p
         TKdQODtlxKGF2k4iG/GisjY/P1Ev2BzULMlgK66YniKvi0sn8NjPP6DaHGMxdWuT7LlI
         8XfZ6raNVztoLPGkUWLXenRL2TaMBbk2KxTCvXLYAULiLx6DmfDBMSlFUsuC6jrlYoDD
         t+qd+cpePZDCO2VtDLYEsi0Cx8V4lgaH0lIXv/ueLsti+QlHR3SMWlNCFmz3km0V54K5
         5anLLJ7T4dyAUXF1+Ezf6HkvIQo+/POLc5lFdViOc1u5Uz2TYL1Ahx7/244Rxq0h7Cz3
         itFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=VGpWTy1nVE03RBlNsZmXs0G+qd8dC/0oORZ5FV5gpJ8=;
        b=FFlzZQdU+q7axgf2zKnpEgjXqIGPhKz7z3a2XbUdk8MskrnLtpmMuOey+OdxjydNkf
         6uKut1OjebQrRBggamEUz6Fmhs5TRbSDc4Fj8OTfoSPRPcZWSpCG/wmceSqzzxdst50A
         fTkCT15o7lfAFMmbd4M3qFqxAN5nEvUEqZseVvCUrPcn/qI6b3Sg52YJK7c+FE1CGs6H
         H1D/JbsRZFzKCAniLqZ7oLZan36VxplmA5Gl1R+aCVx6Q79m4XDXTzw+Y6Wg3/C4ACnE
         FqnZc/YE/nF5cYsx8/ojCRWzsJtsyM13OSlOXTzfE76QNnR8htsRlbZK0apMFRUy75cO
         edXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z27si7132418qkj.14.2020.02.24.18.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Pgm-0007YQ-Hx
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgM-0006qn-UG
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgL-00084q-Oe
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3243 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007zR-Bp; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 951B57892CD99F11857F;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:33 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 08/13] display/blizzard: Remove redundant statement in
 blizzard_draw_line16_32()
Date: Tue, 25 Feb 2020 10:09:32 +0800
Message-ID: <20200225020937.25028-9-kuhn.chenqun@huawei.com>
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, zhang.zhanghailiang@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D2C+E8DeJ/Hl

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  hw/display/blizzard.c:940:9: warning: Value stored to 'data' is never read
        data >>= 5;
        ^        ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/display/blizzard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 359e399c2a..62517bdf75 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -937,7 +937,6 @@ static void blizzard_draw_line16_32(uint32_t *dest,
         g = (data & 0x3f) << 2;
         data >>= 6;
         r = (data & 0x1f) << 3;
-        data >>= 5;
         *dest++ = rgb_to_pixel32(r, g, b);
     }
 }
-- 
2.23.0


