Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0BC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgnCZ-0007MC-KN; Mon, 06 Jul 2026 13:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCH-0007Dy-8L
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:34 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnCF-00045i-2j
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:33:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so25100245e9.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783359207; x=1783964007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kMkmNSdkpmxypOmCNIZ6s6HhJiiuCbTO1iVZOoCp2tM=;
 b=Oi6qxnYlnpWFMffEzqo59RyqnVGAkn5sbBEce9IpVoKxga1m6dqY5KgSLeKx/nCJCO
 Sk0IToeJi3NPBbnsv2PMWXmMXu74ut2MVJjBEG/DjrlRu13o7+05kHCPVdCveLjhJwIG
 nQKzlLPm5iy/uaGqYmBpeLwQR1TjnuDflh9A6F/WZBuPpCWS0rNzfka8KgZeT2llBy0k
 Ouk8kbAzkwMZG44cdaajRfQkrEhwcxVAlUZlGqICXhwJFyCw4pN8TeyxIDGDpagS3T3Q
 lGiO4C8z1SQMbIKmAy1xO0l/BRjd4jI/CvQYnq2QkmL4pdUrzZ8mMPCsVx2mFe1ZxYJt
 w5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783359207; x=1783964007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kMkmNSdkpmxypOmCNIZ6s6HhJiiuCbTO1iVZOoCp2tM=;
 b=ojwHPB/5BSTFcKAOVF+u9KObiZ/OJpLOvHl83ohnCp3sRlve785YqZ4x0CTu5Po1Q6
 QVVArYPhLHWyh6Teb0EKtc2snm04l6es+HZiy+R0vVu1+FWWURNRp9qWCRyg0Sl8FloN
 qeWnA7FPAfbpbde3SgSWcQNYiAxz4Co96bIYaLMlVDUNhGjLZ2lgO07cn2Go/sxnBzG4
 HCZ7hSqJIIg/q2vRK5UkMJ1kV4K2Lp4DQc3+Lby3pdxb+qqonBv2dMbIn9hAxuj/qPhb
 +f7PEPjmiT+wSU5NzT/uVA+h1AmZAKxyXnicU3J3ws6iYaUU8MlXRZw3I5tNjKO4eVQH
 eJ4Q==
X-Gm-Message-State: AOJu0Yz37XyrKPNm+kyMDC5atXhUBYPsJndymZ/w/+yuxHRrXBzDTaw+
 hwzLlSpkfTHBoui1sUb3L6On2gEOwoFqZ+VlkUfsIDTjosPlFoIaI/RqZqlbsa9RszLuN5g/se2
 c6Yw9p1rG+Q==
X-Gm-Gg: AfdE7ckvZlzMWeSkQBrj0bQt87uf8+idzqiUdlDzFkyOerJ9oL5+ihdCXqlGLPKHTzI
 j9HYMWRQT4AwB9pjqZTJzNHfJV4yuc7YjOJhDMz1AfwhY+EoWoUG+Q/z9CB+GUBEjO1ufLEMaue
 u/NaRm7LMwPHq5hL5R7FVe0e09qZSImuTs3lKEzs5szRfidSffhZwqLt0OwD712K3gAj5rz76hm
 DDQFLguTllcyvAjtH665HDdfFClbZjK3wmfBK180XYX4WGa1k8EFkUTcL5jhvMtzaSnxm4fubEI
 xEB19pl7V+HXpEtHbOPxuqJB4DjcJVCFky7FHUBiljQb6DztfhKHyZVoK1+bxiARK8ks/sikyZ5
 qpdNV7JhmVMJJV8m425Onl5ZfHp7JDY7COzuHwrvNd+xY8fIv1YEX21T/JMoSZ0Ff8CQsR1bwR8
 5TwSbA5hi0P4kIF70DPjadWNChUXT6CnJRyEohk0YckNqIsi+fHW5E1A925pVoLvT713R9KM8ho
 4YpRLMBPhLbdD3iBLHJhA==
X-Received: by 2002:a05:600c:37ce:b0:492:4363:e7d6 with SMTP id
 5b1f17b1804b1-493df0777bemr19584785e9.37.1783359207262; 
 Mon, 06 Jul 2026 10:33:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e006b6besm467365e9.2.2026.07.06.10.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 10:33:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/display/exynos4210_fimd: Factor out finding screen
 width/height
Date: Mon,  6 Jul 2026 18:33:22 +0100
Message-ID: <20260706173324.804340-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
References: <20260706173324.804340-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently we hard-code the expressions for getting the global screen
width and height out of the VIDTCON2 register where we need them.
Use functions instead.  Make the global_width variable in
exynos4210_fimd_update() uint32_t for consistency.  (The values are
clamped to well below INT_MAX, so there is no overflow risk here.)


Stable CC because this is a prerequisite for an upcoming bugfix
commit.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 7507e4fd3c..43ad5fa0b4 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1195,15 +1195,25 @@ static void exynos4210_fimd_update_irq(Exynos4210fimdState *s)
     }
 }
 
+static uint32_t exynos4210_fimd_global_width(Exynos4210fimdState *s)
+{
+    return ((s->vidtcon[2] >> FIMD_VIDTCON2_HOR_SHIFT) &
+            FIMD_VIDTCON2_SIZE_MASK) + 1;
+}
+
+static uint32_t exynos4210_fimd_global_height(Exynos4210fimdState *s)
+{
+    return ((s->vidtcon[2] >> FIMD_VIDTCON2_VER_SHIFT) &
+            FIMD_VIDTCON2_SIZE_MASK) + 1;
+}
+
 static void exynos4210_update_resolution(Exynos4210fimdState *s)
 {
     DisplaySurface *surface = qemu_console_surface(s->console);
 
     /* LCD resolution is stored in VIDEO TIME CONTROL REGISTER 2 */
-    uint32_t width = ((s->vidtcon[2] >> FIMD_VIDTCON2_HOR_SHIFT) &
-            FIMD_VIDTCON2_SIZE_MASK) + 1;
-    uint32_t height = ((s->vidtcon[2] >> FIMD_VIDTCON2_VER_SHIFT) &
-            FIMD_VIDTCON2_SIZE_MASK) + 1;
+    uint32_t width = exynos4210_fimd_global_width(s);
+    uint32_t height = exynos4210_fimd_global_height(s);
 
     if (s->ifb == NULL || surface_width(surface) != width ||
             surface_height(surface) != height) {
@@ -1229,14 +1239,14 @@ static bool exynos4210_fimd_update(void *opaque)
     bool blend = false;
     uint8_t *host_fb_addr;
     bool is_dirty = false;
-    int global_width;
+    uint32_t global_width;
 
     if (!s || !s->console || !s->enabled ||
         surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
         return true;
     }
 
-    global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
+    global_width = exynos4210_fimd_global_width(s);
     exynos4210_update_resolution(s);
     surface = qemu_console_surface(s->console);
 
-- 
2.43.0


