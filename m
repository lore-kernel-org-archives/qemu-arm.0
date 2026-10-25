Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7D606A31A
	for <qemu-arm@archiver.kernel.org>; Sun, 25 Oct 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AmTDQ4dQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKw69-0004Ip-EH; Sun, 25 Oct 2026 07:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKw64-0004Hl-45
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 07:09:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKw62-0006qq-3l
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 07:09:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so5361075e9.1
 for <qemu-arm@nongnu.org>; Sun, 25 Oct 2026 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792926539; x=1793531339; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WoMlfAVsgxjLbhMp/I+SWkPFRmU2OtMZl8vdn0WvOuw=;
 b=AmTDQ4dQze1xlmIVaNeAG9mhs2dcw8XYhvsi9agh5s5cJaVVpLj9ooKoP+PjaBThll
 plB/6MbJa88Hgb5vyng4IitgKsguh1W5jqQoanPmcUsJf8/wcdYmbO+Z5Qfu/bari/cE
 zPmCrpSFIdLS20ho5ttgWbYu01uRCrblEep+r9IbdwCS1YTZJmRDn6lAmvyI7o/VlT0C
 HEL8ci17OuusrPL0dxHEhHEosIk193/YQxv+HdVNjSGh3vQAQ0IfVQn0xA+tSIaZZotA
 welW7ebaekv0aYUCL3KLIYvP3yHStwz8VnAOHevQrQM+TNzFTZ3Fase802+w+/Kj77gu
 MQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792926539; x=1793531339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WoMlfAVsgxjLbhMp/I+SWkPFRmU2OtMZl8vdn0WvOuw=;
 b=NxbjYTP6PwNGZ49fipGOMVY0xyv0GsdtkJyxkZJ7y2ZX5jjEGEc3nIkfA6k4387uDj
 e2dLWKRoAuHem0JO5XqChJCxL7Pf4Toi2lDgCHz5O+95Ckyv5RO5SkKE7gD3F1Wk/UuE
 98AvZ2mhqp7/+8FkOQicLM0LxzInHWvaPrgB81XKUBEYXKKMY2sN6CS3tbf6VOvXXdPA
 8WrbfeNRcv2uokligoTijtLGsV3pgIm9+PgNr+WiMbXbvO1dYMtL9Htjg4+f33rkUWww
 nEPvRXjUS2v4C8VKtYNi5YkzwYFfgiBmIcQWateZj5ArwqtEeeNyEUWZ9Rwzn75xjFUt
 8BxA==
X-Gm-Message-State: AFq9FYLdwtk/Q1Z6W8bJlwrcy+qdglsD2UlAMj9KrumWv3lCAbdrAeeX
 o8OZ8VgedwataUpktAIO1PPt/OxTnL1u4k4qDBUJ6Xutb0piKb2ScYulto7R2UG4K2j/xEDr1pU
 d0TwN5eQ=
X-Gm-Gg: AYBFou3t93HEEY7ypqaheXciyq62rB18pO2H4tYCbp3gvMVSGRYqporydwUNEeX3Fwb
 JcPoSK9tdl/whteG2ANElNv0o/ydr/6wE5qfAuZp4iyiLdfbFTwWdhPOgy842Rv4Wk6j779xPxt
 vUKRsENjjOZHhXAD1OIyZyE7hsprnagl5H2U+KlBt6+M4E64gq+oelNBB0GwCqBIIGRrd4/qkf/
 L3l+XAN6ba9t9qXK+LXhAqalItrI9e1o0sZ0ojSP8CI0lemrVYLFj7zKbaLpIHQI/tb3mPmfTdD
 ptjvJZ+pA1CppN/n2/GhYyR5u65u0PanUv2gfn6XgoiQFJxKgwqwhG3NoH+XrcM6SDCqzNSi8Qt
 +JFRQU6lGf9Oq7zFsC1DUEoyL2hM+i9Z3yM3cuvf9vbxKi/ffw3XZ7NK5TwX/lD5MmXLJV6LaUJ
 DX/bxpu1xkl1GNfHmoEb0fN0y7HzDxm1dQ/vHG8CILWaqvFTSNmbWs/vQ+TmTOUc7+f1hLxF1Fu
 sGIP8qd87S2vQLT2q4OaeI3Q+FziE3JmpvacgnYsxKNr8U9BWfXR9mKLq0JfYKCB+T+cWsWJcVk
 /fEZu8pblPYyQLNYm7u0QVeJz4OX/0p9GHlBfIt+hP8wmFRDAqtl2APFu/bM
X-Received: by 2002:a05:600c:8b86:b0:4a1:dfaf:f43e with SMTP id
 5b1f17b1804b1-4a35ac38af8mr64839175e9.1.1792926539452; 
 Sun, 25 Oct 2026 04:08:59 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a359f3e00asm210762515e9.0.2026.10.25.04.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 04:08:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH] hw/dma/xlnx_dpdma: Don't allow DMA off end of host buffers
Date: Sun, 25 Oct 2026 11:08:57 +0000
Message-ID: <20261025110857.1973128-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The xlnx_dpdma DMA engine allows the guest to do DMA to host buffers
for audio and graphics data.  These buffers are set up by the xlnx_dp
device, which calls xlnx_dpdma_set_host_data_location() to tell the
DMA engine where they are.  However, this API doesn't provide any way
to say how big the host buffers are, and the DMA engine does not
check whether the guest is trying to write off the end of the buffer.

Add a length argument to xlnx_dpdma_set_host_data_location(), and
bounds check the guest's DMA writes against it.  The DPDMA ISR has
bits for each channel for "descriptor payload is too large", so we
report such overflows there.

Cc: qemu-stable@nongnu.org
Fixes: d3c6369a96a8 ("introduce xlnx-dpdma")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4134
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I couldn't see anywhere else in the tree that wants to use
surface_data_size(), so I've left it as a local function
(especially since we probably want to backport this fix).
We can move it to surface.h later if some other user appears.
---
 include/hw/dma/xlnx_dpdma.h |  5 +++--
 hw/display/xlnx_dp.c        | 30 ++++++++++++++++++++++++------
 hw/dma/xlnx_dpdma.c         | 13 ++++++++++++-
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 7cf67aef6e1..0fc24e23ad3 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -38,6 +38,7 @@ struct XlnxDPDMAState {
     MemoryRegion iomem;
     uint32_t registers[XLNX_DPDMA_REG_ARRAY_SIZE];
     uint8_t *data[6];
+    uint64_t datalen[6];
     bool operation_finished[6];
     qemu_irq irq;
 };
@@ -69,10 +70,10 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
  * @s The DPDMA state.
  * @channel The channel associated to the pointer.
  * @p The buffer where to store the data.
+ * @len: The length of the buffer in bytes.
  */
-/* XXX: add a maximum size arg and send an interrupt in case of overflow. */
 void xlnx_dpdma_set_host_data_location(XlnxDPDMAState *s, uint8_t channel,
-                                       void *p);
+                                       void *p, uint64_t len);
 
 /*
  * xlnx_dpdma_trigger_vsync_irq: Trigger a VSYNC IRQ when the display is
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 98126ef320d..06594980292 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -333,9 +333,11 @@ static inline void xlnx_dp_audio_activate(XlnxDPState *s)
                    & DP_TX_AUD_CTRL) != 0);
     audio_be_set_active_out(s->audio_be, s->amixer_output_stream, activated);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_AUDIO_DMA_CHANNEL(0),
-                                      &s->audio_buffer_0);
+                                      &s->audio_buffer_0,
+                                      sizeof(s->audio_buffer_0));
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_AUDIO_DMA_CHANNEL(1),
-                                      &s->audio_buffer_1);
+                                      &s->audio_buffer_1,
+                                      sizeof(s->audio_buffer_1));
 }
 
 static inline void xlnx_dp_audio_mix_buffer(XlnxDPState *s)
@@ -566,6 +568,18 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
     s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
 }
 
+/*
+ * Return the size of the surface in bytes. Pixman doesn't provide
+ * a helper function/accessor for this, so we must calculate it
+ * from the stride and height. Note that a pixman stride can
+ * potentially be negative, hence the abs().
+ */
+static inline uint64_t surface_data_size(DisplaySurface *s)
+{
+    /* Can't overflow because stride and height are both int */
+    return (uint64_t)abs(surface_stride(s)) * surface_height(s);
+}
+
 static void xlnx_dp_set_dpdma(const Object *obj, const char *name, Object *val,
                               Error **errp)
 {
@@ -580,7 +594,8 @@ static void xlnx_dp_set_dpdma(const Object *obj, const char *name, Object *val,
         DisplaySurface *surface = qemu_console_surface(s->console);
         XlnxDPDMAState *dma = XLNX_DPDMA(val);
         xlnx_dpdma_set_host_data_location(dma, DP_GRAPHIC_DMA_CHANNEL,
-                                          surface_data(surface));
+                                          surface_data(surface),
+                                          surface_data_size(surface));
     }
 }
 
@@ -644,9 +659,11 @@ static void xlnx_dp_recreate_surface(XlnxDPState *s)
         }
 
         xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
-                                            surface_data(s->g_plane.surface));
+                                          surface_data(s->g_plane.surface),
+                                          surface_data_size(s->g_plane.surface));
         xlnx_dpdma_set_host_data_location(s->dpdma, DP_VIDEO_DMA_CHANNEL,
-                                            surface_data(s->v_plane.surface));
+                                          surface_data(s->v_plane.surface),
+                                          surface_data_size(s->v_plane.surface));
     }
 }
 
@@ -1396,7 +1413,8 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     s->console = qemu_graphic_console_create(dev, 0, &xlnx_dp_gfx_ops, s);
     surface = qemu_console_surface(s->console);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
-                                      surface_data(surface));
+                                      surface_data(surface),
+                                      surface_data_size(surface));
 
     as.freq = 44100;
     as.nchannels = 2;
diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 32f56036a4c..9d8e7593698 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -589,6 +589,7 @@ static void xlnx_dpdma_reset(DeviceState *dev)
 
     for (i = 0; i < 6; i++) {
         s->data[i] = NULL;
+        s->datalen[i] = 0;
         s->operation_finished[i] = true;
     }
 }
@@ -760,6 +761,14 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             int64_t transfer_len = xlnx_dpdma_desc_get_transfer_size(&desc);
             uint32_t line_size = xlnx_dpdma_desc_get_line_size(&desc);
             uint32_t line_stride = xlnx_dpdma_desc_get_line_stride(&desc);
+
+            if (transfer_len > s->datalen[channel]) {
+                s->registers[DPDMA_ISR] |= ((1 << 18) << channel);
+                xlnx_dpdma_update_irq(s);
+                DPRINTF("Descriptor payload too large..\n");
+                goto update_descriptor;
+            }
+
             if (xlnx_dpdma_desc_is_contiguous(&desc)) {
                 source_addr[0] = xlnx_dpdma_desc_get_source_address(&desc, 0);
                 while (transfer_len != 0) {
@@ -809,6 +818,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             }
         }
 
+    update_descriptor:
         if (xlnx_dpdma_desc_update_enabled(&desc)) {
             /* The descriptor need to be updated when it's completed. */
             DPRINTF("update the descriptor with the done flag set.\n");
@@ -831,7 +841,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
 }
 
 void xlnx_dpdma_set_host_data_location(XlnxDPDMAState *s, uint8_t channel,
-                                         void *p)
+                                       void *p, uint64_t len)
 {
     if (!s) {
         qemu_log_mask(LOG_UNIMP, "DPDMA client not attached to valid DPDMA"
@@ -841,6 +851,7 @@ void xlnx_dpdma_set_host_data_location(XlnxDPDMAState *s, uint8_t channel,
 
     assert(channel <= 5);
     s->data[channel] = p;
+    s->datalen[channel] = len;
 }
 
 void xlnx_dpdma_trigger_vsync_irq(XlnxDPDMAState *s)
-- 
2.43.0


