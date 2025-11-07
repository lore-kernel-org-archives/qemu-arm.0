Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22BFCCF9F8
	for <qemu-arm@archiver.kernel.org>; Fri,  7 Nov 2025 14:39:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vHNcX-0000YM-Uf; Fri, 07 Nov 2025 09:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHNcV-0000Xr-VZ
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 09:39:19 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHNcU-0001vU-3D
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 09:39:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so5835245e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Nov 2025 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762526355; x=1763131155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VnOoY3GS9fZhgYAsHIoSmdYJhCdMuYARnS13WjC3+QA=;
 b=u9s9fCN+UCjFoOB6enH9HTaD1lCwHdzYN8uvVfn17i7MxhPl161mci33a+pvxc/AAm
 kmo7mOHI+9YkrdqdSHW4zklVCpHkYXz34H9lOdzbmlApJhGS1FYhwLDfD00oEZZHy5yK
 cvCdK4JYqDJmh7MNsjdMC5Li4F/H9hRi4ykp8XF+s2e00lInLvZo3aUL9s0OPFL5KE9N
 TiElRySV2P+7V3gqFTFX0dwBwuhhFzq2j8C3bggFPz6+cdgXmKmYAOwbIm+JfxxLRZXa
 Q5A0nvyFArb3++4hWUnAjblg2wckvga7AC/Nc/OrCKGJ/3xi/AXArYxWlgq6zy0E+IcW
 RBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762526355; x=1763131155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnOoY3GS9fZhgYAsHIoSmdYJhCdMuYARnS13WjC3+QA=;
 b=bbezYK10fr3750Y+whsRGLBHSKswUBrV6RPNfCOf2uv0JijOcwJeVuyn8rhPnJ4E3m
 tLD7GuRA8mUyqxUGPNZvj4af7M2iKfn/7QX1lHSVDwcNFwtybe99w5Ek7cNLqqOwp3yR
 uqhCSi5sd24htt89rgNGsce8hdmG/fTEaLDD/dpXuzmKZRoVgPFZ6KALh1R1RVOPjEV5
 o64QEvlRQUMpfQ1K5Wy2lRuzuzTNs1XtvptrhvZD3ccTW1zHUuTMtitBGAZl+CYHqmSM
 WpmyqbaHnDR/r6wu6uylrlK9kL/tmhXrYVD82OSHB8ugLxFu2x4nUThNPUk3OoPkUhv0
 FrYA==
X-Gm-Message-State: AOJu0Yw9hm+F9wmWtZWGRF4MFkbNINvTui3RQSZCxZUD00bQgCSsnrcY
 Eo6MhEkHoWhvaWrms+J733yUJOWGXHtjyCIiGH+Rso0HTSqqp6pIzVs5FTGKlC+8FJO28T2nna5
 f1Mdc
X-Gm-Gg: ASbGncvYC6yVW2PDAvPKuEAvvXC7QbcIWxb0TMIyp8skPo3Mn5QLZQurIm3WZeVoy6q
 aHvq6kjR0dXMlkzge3JhjFZHSh8bPMpIJmazK24NWcnZ7CxlPWZp0YsWymw6D49ol8nreewKBsY
 I/Ay9zOr0vRVUPeC6C+5HBVoZTq+RoL4lAe7UeRAIXg1qjUGk7GbhBH0K5WSYL5xqwUvzKpumno
 SwY1yxS088JRRdbpnrtnf75TfaYK+Hyf8ugEH9jYWYbI9BPsRBpXjQ6dvuB8kTrEnCMYLiu9OE6
 5ioO16AKSZNXM2+n1wMUx7xVHvZmq84HhHqNlG/7fmx6wH7ebz8gV75W5N4wEuhWNojHbSRzFiA
 TwL8LkXvj7ObmDAGOA53o18Wuzil5JbTd7iFVBu1t1EU/eT1I2zEvLpqBWZe8LagzBnNoDySZdC
 dLZeVglQ==
X-Google-Smtp-Source: AGHT+IHQpcK4t2r//EVnveuBQ0T3b2j+yA0t8l53Gs3DqQItfFdHqRX36K7vH1e6ExvfySCAL7FAww==
X-Received: by 2002:a05:600c:154b:b0:46e:3b58:1b40 with SMTP id
 5b1f17b1804b1-4776dc117a4mr21847005e9.4.1762526355397; 
 Fri, 07 Nov 2025 06:39:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776bcfd2e5sm52744815e9.13.2025.11.07.06.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 06:39:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [PATCH] hw/display/exynos4210_fimd: Account for zero length in
 fimd_update_memory_section()
Date: Fri,  7 Nov 2025 14:39:13 +0000
Message-ID: <20251107143913.1341358-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

In fimd_update_memory_section() we attempt ot find and map part of
the RAM MR which backs the framebuffer, based on guest-configurable
size and start address.

If the guest configures framebuffer settings which result in a
zero-sized framebuffer, we hit an assertion(), because
memory_region_find() will return a NULL mem_section.mr.

Explicitly check for the zero-size case and treat this as a
guest error.

Because we now have a code path which can reach error_return without
calling memory_region_find to set w->mem_section, we must NULL out
w->mem_section.mr after the unref of the old MR, so that error_return
does not incorrectly double-unref the old MR.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1407
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index c61e0280a7c..eec874d0b1d 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1147,6 +1147,13 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
     if (w->mem_section.mr) {
         memory_region_set_log(w->mem_section.mr, false, DIRTY_MEMORY_VGA);
         memory_region_unref(w->mem_section.mr);
+        w->mem_section.mr = NULL;
+    }
+
+    if (w->fb_len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "FIMD: Guest config means framebuffer is zero length\n");
+        goto error_return;
     }
 
     w->mem_section = memory_region_find(s->fbmem, fb_start_addr, w->fb_len);
-- 
2.43.0


