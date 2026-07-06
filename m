Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5815C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgnCP-0007Fy-2q; Mon, 06 Jul 2026 13:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCI-0007E8-Es
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:34 -0400
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCF-00046C-Id
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:34 -0400
Received: by mail-wm2-x01.google.com with SMTP id
 5b1f17b1804b1-493b567a019so5406485e9.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783359210; x=1783964010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pybcs5s0EJoZh0aRLv5GD/xzxrXejiSNkABytqAQThk=;
 b=pHs90fLrDAUlNQf8H/A88LkFz/ZJl0ZnSGEx5Ckma3XxnzN9syvTQQ0vDDW/IiVWTH
 1COjk9aZLNy+6AsipDPH5cL5OZBYpLHW6yPeVvC8dds+h5AsmVXh6exbBkAj2KbIqMoi
 SuIlFJ79jCR3UKvy2RMDQNubNHyyQmJst2V7G7wptRaBJb/Fv0YA4uRjK1PUEVeKUd7o
 H11e80Ca0sFkBcnp4FWOz0dEavkqBXVuCQoX2SCLewARUGh+LQ++xM/Ms+x5eZA7LVIJ
 ZT87CSVKBYUvYxmgmpTYy3ISx57zc3OeWytmJ6W/AivD1oCYpTk2mZzzp9LSMu1llmDQ
 jyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783359210; x=1783964010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pybcs5s0EJoZh0aRLv5GD/xzxrXejiSNkABytqAQThk=;
 b=rXhnt59NKyQxQJOwE5fp3QOFs6p1y+aYFKfqUgGTGm4rLCfSBNOT/dB8dGgQEbT+vJ
 s7jgQBxmhMJAPvss9sg1mgvemEVg25sd9JjBBnGUBYaiifp398rbND2ow6GHxNu4MSz9
 evGjv4B8PWdsYJv2vW3z/vCR/skOdEE+i5YBmsB/dzBS5/wPaXiWP0NPfFqGxQirkr7W
 q/ALBkCLteDReK5fk/fSInhaP7JWU/cXvfL1EpeoxDpWbauOGvvfJRYTTj8tKqUvEv7t
 yXOEi3fv9mHhDxTw63qqc+Ndva48CQA3XJ0KniKcY1cgaa1gCZ6+TiAKWFKPHNhLnFCL
 4lpQ==
X-Gm-Message-State: AOJu0Yx+zvpGAOTky2nQNB8NAs5w8UhP+5IuXdRkSZZ8sst2RfDRc8Kj
 aHXLBm7XfR+lQ2kDvcHKIJyRlBE7PTl3VMeqGyfhdDyv0qalBV/OfI+z8P1YFvLeZT8IsM4YTpl
 Xq5pxhWEbo+Kj
X-Gm-Gg: AfdE7cm2P08Jx4QOu3RdkZWYo16hCt/S6jua0XZG80yaOz8G8DIH9IiIlezYZ4K0RI6
 UFMOSd9GYcrglMjqn2qzV47FT8YBq7G75lcS5ROyo7IDj/Q9JSDqm8focklEgu7+Zl99XCUwLJz
 ZgW44ppazVgZPiAXigamVE2b/fBpxy5AQI4RZxnOmGE/Vtditu+OI8TZVudtmM8MwEDwTW7K9Ji
 X2X9fH35y0DGK9xHqK0EvLsb6JAgDCi6RoE3WMlWIjEzB8f1SidyOcwJ/+rqkHstqcNnEg7hA0q
 zgdNaZgfhkskuaEW18QY4AUHOwMHoNbppO2ptKbUEVLiD+Pqmr/S6DkI7txr1ZnH5gIs1ANToG/
 h+dwgg5C8pzHdB0D4BZRV62XpP1LcVOPhrz2fR4RRo+MTi4LrWJVsArJK+77rBS7YNxw0987b2N
 KgL3+ew8EESWhL9SagBv78Z26FUATUjxaYMx0iCrz3/TSsgN0oSBsvuX5M1uljkfP7w7pGseZvC
 Z1sagoN8w/3yVUATpY3Pg==
X-Received: by 2002:a05:600c:3f14:b0:493:ad1b:b38d with SMTP id
 5b1f17b1804b1-493df0a0891mr16650575e9.37.1783359209871; 
 Mon, 06 Jul 2026 10:33:29 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e006b6besm467365e9.2.2026.07.06.10.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 10:33:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/display/exynos4210_fimd: Clamp windows to screen size
Date: Mon,  6 Jul 2026 18:33:24 +0100
Message-ID: <20260706173324.804340-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
References: <20260706173324.804340-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::1;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x01.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In exynos4210_fimd_update(), we iterate through the enabled windows,
blitting them to the screen. We assume here that the guest has not
programmed the window's coordinates to be outside the overall LCD
screen resulation, but we never check this. This can result in the
guest being able to cause us to access outside our allocated
framebuffer backing memory.

Since all the coordinates here are unsigned, they can't be off
the left/top side of the screen, only the bottom/right. If
the top left corner of the window is out of bounds, the whole
window is invisible and we can skip it. If the bottom right
corner is out of bounds, we clamp it to the screen size so that
we only draw the visible part.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3795
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 52f2285cf5..6c062a28c0 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1237,7 +1237,7 @@ static bool exynos4210_fimd_update(void *opaque)
     bool blend = false;
     uint8_t *host_fb_addr;
     bool is_dirty = false;
-    uint32_t global_width;
+    uint32_t global_width, global_height;
     uint32_t window_width;
 
     if (!s || !s->console || !s->enabled ||
@@ -1246,16 +1246,28 @@ static bool exynos4210_fimd_update(void *opaque)
     }
 
     global_width = exynos4210_fimd_global_width(s);
+    global_height = exynos4210_fimd_global_height(s);
     exynos4210_update_resolution(s);
     surface = qemu_console_surface(s->console);
 
     for (i = 0; i < NUM_OF_WINDOWS; i++) {
         w = &s->window[i];
         if ((w->wincon & FIMD_WINCON_ENWIN) && w->host_fb_addr) {
-            scrn_height = w->rightbot_y - w->lefttop_y + 1;
+            uint32_t rightbot_x, rightbot_y;
+
+            if (w->lefttop_x >= global_width ||
+                w->lefttop_y >= global_height) {
+                /* Guest has put the window entirely offscreen: ignore */
+                continue;
+            }
+
+            /* Clamp right corner coords to be within the screen */
+            rightbot_x = MIN(w->rightbot_x, global_width - 1);
+            rightbot_y = MIN(w->rightbot_y, global_height - 1);
+            scrn_height = rightbot_y - w->lefttop_y + 1;
             scrn_width = w->virtpage_width;
             /* Number of bytes to actually draw */
-            window_width = w->rightbot_x - w->lefttop_x + 1;
+            window_width = rightbot_x - w->lefttop_x + 1;
             /* Total width of virtual screen page in bytes */
             inc_size = scrn_width + w->virtpage_offsize;
             host_fb_addr = w->host_fb_addr;
-- 
2.43.0


