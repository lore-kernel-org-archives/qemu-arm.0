Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33B7D3E771
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTP3t-00017C-0Z; Wed, 10 Dec 2025 13:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3q-00014D-LH
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3o-0002SF-BS
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:14 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so876095e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765391831; x=1765996631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CBYAOqR6DQdV0opqI8zQoE/MhBB6IG5uZhpAhusYcwI=;
 b=tGxGUXsi26i5/xor4IJMSHcrq4CzKSVr+RhTQVmhibfTTu50f89rJU8578MprhwW80
 1n9ucV53LWg09ToiKiX0s9c0iegAAv5QGPNLGpzZqCvTJH2lgc53NSNYx4B6rHbpu/OH
 F40QGxhriatJj3W8pNUJq+g0L15T4lhkBIm0tdECpMD2Hydufh4SDdKKmYPyX3K/SBV+
 qMYD0GFLsmhcyTwNtmzKAUMkvuI0MNz4Nw2kftCA6/TED6tXkGynmioBqZMWScTMRd2N
 8hgqlYtVGCL9Cn5236UDg1QhwB00mubZ+mAUUryfNMyfNfXBx97c+S2NfDDrW0RgDLkY
 CKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765391831; x=1765996631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CBYAOqR6DQdV0opqI8zQoE/MhBB6IG5uZhpAhusYcwI=;
 b=dF4DJaszSR9aokjWJlqMLw04HJie+Hntx14fPAoDcDN3QyGAZsBHs1QyfvS6eeIjyM
 BHWCch+Lt1dDzZ+ojEurhAPQidgztWKIx7+ew1MdeKGL+SKwCChKn8Tu61WXz5WNucU7
 XKQshcSfJ28R1nhHmsWSO0eCDqnanYMdUD3oG0hQMU0w4hbG3q4kRd64PVnOqaR+PMOc
 3abRkYSCZDxK5VN4gl5bva617Ba0BdMm/AMEgCEPmn4iYj0t7lneexFhKTTlu48tPG52
 qNqx1DpEZCbiN2OdjQ0kZo5KKPyJruMan0WOIIWR9Rm6YxOqhiDhOLUml5kpyP9C1+y0
 waDA==
X-Gm-Message-State: AOJu0YyCB0oBlb7NjryjdQoPCUDOYLZ262XdLx+ny2gKdcLA1lHqh9ID
 sVe4n3TtaxnYXU8iyaMpHQUnZyCG6qbbrZ21SIal0My8mRe0DKlc2GPsPqEj4WBO+el4kBxtwr4
 c1vEH
X-Gm-Gg: ASbGncvtzzs0XtObVy+842l2VYNuDpNtR9yCSgGU4qpOuu1PNhOjU4IVsHJMxU2UKHJ
 3XfjXrHM8sXhNOhE86wn2EUAE1eYQJC+Kw/MUC0JLQBvHtBcE5Ykhb0jXn7OgVCeEA0MKmEsmEB
 kOu3kmQEtVEVN8bVlmvIgKr4DHrTp5ZWfpzZLa04n0zFbhH+xCEEtoO68flejhYmN35b/eC6yn0
 j8CiGraVOZmXaaeQyBJAlM0SX5PvYJYjkzWGrqONerTRT4Mabi/u7EDSuL+fjjFu1RcQdH5EdFP
 lBtNCSd71Sb32K23dIR13Y2+wbLfhHbDEd34hLXgrPM+fCklKbjaGr7qoU50RLlJqo242Kf2cdt
 xBJ13iLkwY5QNn5vS4NjpJf+eLeG2i3u1kywjW1yzf9fGm8fL4UfTXBytbkPL1/kuyJvzh4hkzC
 ZuJu/ZszQHfx675yqr
X-Google-Smtp-Source: AGHT+IGiNXYDZ4E5NusjbQ22dbl3SmP45MUzcyrZ/T4S8IOo6muLNwTZwxq5yX/EVYMFT3rYYgAdww==
X-Received: by 2002:a05:600c:8210:b0:479:2651:3f9c with SMTP id
 5b1f17b1804b1-47a8377e72fmr34196405e9.14.1765391830632; 
 Wed, 10 Dec 2025 10:37:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a7044csm477702f8f.15.2025.12.10.10.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:37:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.0 6/7] hw/arm/omap1: Remove omap_badwidth_write* calls
Date: Wed, 10 Dec 2025 18:36:59 +0000
Message-ID: <20251210183700.3446237-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183700.3446237-1-peter.maydell@linaro.org>
References: <20251210183700.3446237-1-peter.maydell@linaro.org>
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

Complete the conversion started in the previous commit by
changing all the omap_badwidth_write* calls to open-coded
log-and-ignore behaviour.

We can delete a FIXME comment about an infinite loop, because that
only looped infinitely back before 2011 when the device was still
using absolute physical addresses.  Now that we are simply logging
the error we can clearly see that there's no loop.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c | 64 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index a187672897e..cfa4e1f677c 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -234,7 +234,8 @@ static void omap_mpu_timer_write(void *opaque, hwaddr addr,
     struct omap_mpu_timer_s *s = opaque;
 
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -343,7 +344,8 @@ static void omap_wd_timer_write(void *opaque, hwaddr addr,
     struct omap_watchdog_timer_s *s = opaque;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -471,7 +473,8 @@ static void omap_os_timer_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -618,7 +621,8 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
     uint16_t diff;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -893,7 +897,8 @@ static void omap_pin_cfg_write(void *opaque, hwaddr addr,
     uint32_t diff;
 
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1051,7 +1056,8 @@ static void omap_id_write(void *opaque, hwaddr addr,
                           uint64_t value, unsigned size)
 {
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1123,7 +1129,8 @@ static void omap_mpui_write(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1220,7 +1227,8 @@ static void omap_tipb_bridge_write(void *opaque, hwaddr addr,
     struct omap_tipb_bridge_s *s = opaque;
 
     if (size < 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1331,7 +1339,8 @@ static void omap_tcmi_write(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1429,7 +1438,8 @@ static void omap_dpll_write(void *opaque, hwaddr addr,
     int div, mult;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1702,7 +1712,8 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
     };
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -1832,7 +1843,8 @@ static void omap_clkdsp_write(void *opaque, hwaddr addr,
     uint16_t diff;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -2042,7 +2054,8 @@ static void omap_mpuio_write(void *opaque, hwaddr addr,
     int ln;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -2267,7 +2280,8 @@ static void omap_uwire_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -2396,7 +2410,8 @@ static void omap_pwl_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        omap_badwidth_write8(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -2493,7 +2508,8 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        omap_badwidth_write8(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -2690,7 +2706,8 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
     time_t ti[2];
 
     if (size != 1) {
-        omap_badwidth_write8(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -3418,7 +3435,8 @@ static void omap_mcbsp_writew(void *opaque, hwaddr addr,
         return;
     }
 
-    omap_badwidth_write16(opaque, addr, value);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                  " with bad width %d\n", __func__, addr, 4);
 }
 
 static void omap_mcbsp_write(void *opaque, hwaddr addr,
@@ -3432,7 +3450,8 @@ static void omap_mcbsp_write(void *opaque, hwaddr addr,
         omap_mcbsp_writew(opaque, addr, value);
         break;
     default:
-        omap_badwidth_write16(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
     }
 }
 
@@ -3606,7 +3625,8 @@ static void omap_lpg_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        omap_badwidth_write8(opaque, addr, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
         return;
     }
 
@@ -3680,8 +3700,8 @@ static uint64_t omap_mpui_io_read(void *opaque, hwaddr addr,
 static void omap_mpui_io_write(void *opaque, hwaddr addr,
                                uint64_t value, unsigned size)
 {
-    /* FIXME: infinite loop */
-    omap_badwidth_write16(opaque, addr, value);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: write at offset 0x%" HWADDR_PRIx
+                  " with bad width %d\n", __func__, addr, size);
 }
 
 static const MemoryRegionOps omap_mpui_io_ops = {
-- 
2.43.0


