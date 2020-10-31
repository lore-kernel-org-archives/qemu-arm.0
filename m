Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2120115lfa;
        Fri, 30 Oct 2020 20:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPbTIJsbN1UR7WDw9LrXmMegtT71MOI0w8KgxAJVQ0M48b17lie6IThV1oNIA9EWOJXRsd
X-Received: by 2002:a0c:b98f:: with SMTP id v15mr10745045qvf.51.1604115385698;
        Fri, 30 Oct 2020 20:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604115385; cv=none;
        d=google.com; s=arc-20160816;
        b=xGvolzDmY5XFf6W+d114seaTAw9BDkdZWEHxtXOBQ0yXiIawnakYvEqd3Bh7GhR13X
         3gl2kBeNZAFOFivibJPH/mIRuqhJXLZ9zzoGG/Qnzw5FpjEeK4uvi3HVi5XkHOklweBC
         z11z/qoLpskw2SyBtwWTVYYyCokzldDsXNB+l4vmZqjTVX/GqiJQvRXO6GreXmjmfsz7
         40M7rQac7/T+QHNPsidwZJ3GMrhLN+HoM4j91JWAte/C7sFRz46dg6cqEOApmsAKQUbG
         0sDwu9hP6BJhBkfi5dVhef6rVmPCB3VGaWK22MdvJ59tMTtBsuwWu7IdnhzvpbNnowe3
         etmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:mime-version:user-agent:from:date:message-id;
        bh=TJ0dbTEYYwbZ0KWibHwSVvAkHsh2ElXKisS5lyag5J0=;
        b=RuckYdBkM5nCKLnFzxPneepcBdmrYOJJrDJ0jEoruhweE2j+fdFMzuraRzTaMQcFKp
         6tBek+Jow4gqwQOkLwUOkcWtLC7PtrUj4peovWHHgmv+vi0klwde5oYbyb8bGflLsTo3
         Qp+Z0BGJ7ZzkWBHGBCGwD7iJ+20mX2ud2ArLr+0XPiau6UlYVYVvFLyJrY8WghHifNN5
         s5Ehj7QzdtNxTJ61+OFoFDBapVlbACyasrU66BMObERuGvXLmPDMit+paDRkoToAUvQ8
         3m8Erd5GkRxL+JNDd5GYGNu59L0YTuaUL8el83dYcDN1+HBhx3EXgccGiBbgkmLvz4fl
         ifIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si4854946qvy.5.2020.10.30.20.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 20:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYhgn-0006sG-6K
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 23:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYhgO-0006rR-Ho; Fri, 30 Oct 2020 23:36:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYhgL-00046d-Lm; Fri, 30 Oct 2020 23:36:00 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CNPw50qLpzhcVL;
 Sat, 31 Oct 2020 11:35:49 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 11:35:38 +0800
Message-ID: <5F9CDB8A.9000001@huawei.com>
Date: Sat, 31 Oct 2020 11:35:38 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH V2] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 23:35:49
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, zhengchuan@huawei.com,
 qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEqDaFgMEKxl

In omap_lcd_interrupts(), the pointer omap_lcd is dereferinced before
being check if it is valid, which may lead to NULL pointer dereference.
So move the assignment to surface after checking that the omap_lcd is valid
and move surface_bits_per_pixel(surface) to after the surface assignment.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 hw/display/omap_lcdc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index fa4a381db6..58e659c94f 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -78,14 +78,18 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
 static void omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
-    DisplaySurface *surface = qemu_console_surface(omap_lcd->con);
+    DisplaySurface *surface;
     draw_line_func draw_line;
     int size, height, first, last;
     int width, linesize, step, bpp, frame_offset;
     hwaddr frame_base;

-    if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable ||
-        !surface_bits_per_pixel(surface)) {
+    if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable) {
+        return;
+    }
+
+    surface = qemu_console_surface(omap_lcd->con);
+    if (!surface_bits_per_pixel(surface)) {
         return;
     }

-- 
2.19.1
