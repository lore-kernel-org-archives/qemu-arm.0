Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D7D3E771
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTP3q-00014K-Nl; Wed, 10 Dec 2025 13:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3p-00012w-7U
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3m-0002Rn-Tq
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fa4737049so23194f8f.3
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765391829; x=1765996629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZNi2Z4/gvQscPF42VGqB/Ys1+1b9Ayka2budxzuzvwc=;
 b=W3Mins6RLdDcHGikkGit+cj1DeHndBrZYS8c2Pzec/NGsm/PCP0PQIJiqubx8mA1if
 pzmjWsOJBQxcNNitbe9ulPvyGGsetZL2uut/sNUmNOZ+PG/0aFSvRsI9J/KlU4ZWGi5c
 ZSRdOoWYz2vyidPNMmShrZY4m82ng75obeKUcoBJznx1yw74vVe3p9wyxIPZDwYkuDko
 GHw/ow0lGAsTz1HMI5LPxWRtx0YpnTHsP7URM0v8xL0G2UHAX1JK7SRdjOOIXFl84frb
 Iw0DluQFPWwBkC/FEdO93QtDHTWV2VJRUPR+5oG4yfDCjVgxhiNRiZpEIjq4MZ7MZ1Vb
 7khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765391829; x=1765996629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZNi2Z4/gvQscPF42VGqB/Ys1+1b9Ayka2budxzuzvwc=;
 b=RjEliwZW48U+SWmvCUMl3YXeSfQlKIBkb2QjDrtaDTY4KeSsZtr5Z09WbxFWfsbdL2
 ML/GeoYMMHZ2VY5QVwbMZmlw+VV29bNUX0IgnWXZc+A8jk3E8GcwhZZZ2RdQOGexyFGM
 ECpE+GIPvCgKcXH7Abb/GrXS9IqVRNKf6ewDdi9Pz17NGQDL3rrvo1FXNiPPkIYUGReV
 OmMgZf6IH360g4jsQGwkd6OQNACZJShZX7RswWCuceKyHXD8l2iCCUAhH+odM7D9LbZc
 IFqA9W0qFWYPBDfhF0uwUKwDdQjuGAzBP8EYwmwkDM9FFsPTjaDXaI/Tj7YGp0OFfWUg
 PsnQ==
X-Gm-Message-State: AOJu0YzE7rxllpwxVppQMQ8Zr+l6QLQSz8OjU7zWddZRom02aP4fgeiV
 p24jwjRTOi0BLj659tgAu8KD/Ev/CKZo4F+QBc1HA0p7VsS6NcK1E+msHOigILj01ItF+XDc+xN
 iwq2Q
X-Gm-Gg: AY/fxX79WrxlZzlQvyO+5nshsetuYlXn0UOoMnYU+iYObAV07yows9bEuJ76d1cxv3n
 26lcbkFgkOet1mu9YazvIdXJ/9y24Vo8PtDlFaQg3d0HbWWWp4vXCxiPzFLmO9C8A6HYCs8R70n
 gwKnzwjXXH7GSSg4fnsGfr3rrYDPvKUiH3m++WN4Z4UPiL3NZrtvEaboY1My1obpPrVM6+WqW9E
 M95fSNm/zvxjwxREd89ZNQMHMKfKpz/ScebBlFJM+R/73IKqcxOlgqme3NJojl7XXTx7gG+4Tz1
 hB53W7QRwWyg8lM6USdxGBfkOLLhKeTpkKGGuBJCpm0nTePUljRlpO4lauYu/2fv8uaXop9ai0g
 3P6jCwmA7AyMoryAv+UAwd2umDgHnV0E9yfgrovS/gIs2guutHVDclT2LD1B1+yB6BBzfH3xUSB
 tno6t8x2sDZPubfpVF
X-Google-Smtp-Source: AGHT+IGtVjchF08HaTnFV0xRV/UeOIwfw3gpot5GT5ocYup5d0UFslziKABN+CtH/NDpZ/RxVVqQZQ==
X-Received: by 2002:a05:6000:220b:b0:42f:9ff2:9086 with SMTP id
 ffacd0b85a97d-42fa3b0674dmr3572827f8f.48.1765391829480; 
 Wed, 10 Dec 2025 10:37:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a7044csm477702f8f.15.2025.12.10.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:37:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.0 5/7] hw/arm/omap1: Remove omap_badwidth_read* calls
Date: Wed, 10 Dec 2025 18:36:58 +0000
Message-ID: <20251210183700.3446237-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183700.3446237-1-peter.maydell@linaro.org>
References: <20251210183700.3446237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The omap_badwidth_read* and omap_badwidth_write* functions are
used by various OMAP devices when the guest makes an access
to registers with an invalid width; they do two things:
 - log a GUEST_ERROR for the access
 - call cpu_physical_memory_read() or cpu_physical_memory_write()
   with the offset they are passed in

The first of these produces an unhelpful log message because the
function name that is printed is that of the omap-badwidth_*
function, not that of the read or write function of the device that
called it; this means you can't tell what device is involved.

The second is wrong because the offset is an offset into the device
but we use it as an absolute physical address, so we will access
whatever is at low memory.  That happens to be the boot ROM, so we
will ignore a write and return random garbage on a read.  This bug
has been present since 2011, when we did the conversions to the
MemoryRegion APIs, which involved changing all devices from working
with absolute physical addresses to working with offsets within their
MemoryRegions.  We must have missed updating these functions.

Replace the uses of the omap_badwidth_read* functions in omap1.c with
an open-coded call to qemu_log_mask() and RAZ/WI behaviour.
We do just the reads here because there are a lot of callsites in
omap1.c; the writes will be done in the next commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c | 80 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 74458fb7c69..a187672897e 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -208,7 +208,9 @@ static uint64_t omap_mpu_timer_read(void *opaque, hwaddr addr,
     struct omap_mpu_timer_s *s = opaque;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -314,7 +316,9 @@ static uint64_t omap_wd_timer_read(void *opaque, hwaddr addr,
     struct omap_watchdog_timer_s *s = opaque;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -438,7 +442,9 @@ static uint64_t omap_os_timer_read(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -539,7 +545,9 @@ static uint64_t omap_ulpd_pm_read(void *opaque, hwaddr addr,
     uint16_t ret;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -771,7 +779,9 @@ static uint64_t omap_pin_cfg_read(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -994,7 +1004,9 @@ static uint64_t omap_id_read(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1076,7 +1088,9 @@ static uint64_t omap_mpui_read(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1174,7 +1188,9 @@ static uint64_t omap_tipb_bridge_read(void *opaque, hwaddr addr,
     struct omap_tipb_bridge_s *s = opaque;
 
     if (size < 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1276,7 +1292,9 @@ static uint64_t omap_tcmi_read(void *opaque, hwaddr addr,
     uint32_t ret;
 
     if (size != 4) {
-        return omap_badwidth_read32(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1390,7 +1408,9 @@ static uint64_t omap_dpll_read(void *opaque, hwaddr addr,
     struct dpll_ctl_s *s = opaque;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     if (addr == 0x00)   /* CTL_REG */
@@ -1470,7 +1490,9 @@ static uint64_t omap_clkm_read(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = opaque;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1763,7 +1785,9 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
     CPUState *cpu = CPU(s->cpu);
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (addr) {
@@ -1955,7 +1979,9 @@ static uint64_t omap_mpuio_read(void *opaque, hwaddr addr,
     uint16_t ret;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -2205,7 +2231,9 @@ static uint64_t omap_uwire_read(void *opaque, hwaddr addr, unsigned size)
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -2346,7 +2374,9 @@ static uint64_t omap_pwl_read(void *opaque, hwaddr addr, unsigned size)
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_read8(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -2439,7 +2469,9 @@ static uint64_t omap_pwt_read(void *opaque, hwaddr addr, unsigned size)
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_read8(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -2573,7 +2605,9 @@ static uint64_t omap_rtc_read(void *opaque, hwaddr addr, unsigned size)
     uint8_t i;
 
     if (size != 1) {
-        return omap_badwidth_read8(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -3117,7 +3151,9 @@ static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
     uint16_t ret;
 
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -3546,7 +3582,9 @@ static uint64_t omap_lpg_read(void *opaque, hwaddr addr, unsigned size)
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_read8(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     switch (offset) {
@@ -3627,7 +3665,9 @@ static uint64_t omap_mpui_io_read(void *opaque, hwaddr addr,
                                   unsigned size)
 {
     if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read at offset 0x%" HWADDR_PRIx
+                      " with bad width %d\n", __func__, addr, size);
+        return 0;
     }
 
     if (addr == OMAP_MPUI_BASE) /* CMR */
-- 
2.43.0


