Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FA4606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KB8dW3d+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLSkW-0008VC-VS; Mon, 26 Oct 2026 18:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFy-0001Kp-Ll
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:27 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFv-00077j-GZ
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:26 -0400
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-91c63449320so11199766d6.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793050162; x=1793654962; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O/N1K8D/SpacXzaFnyxWTfnjEcncC7vi42PU2GqoRBg=;
 b=KB8dW3d+IlSLg517BTeOLQFNplMup0+7G8MCef0rQLGpTuce0HyBqPt7QjGGvS88s/
 EhRMpMQhvxL6LUHYOiZ8R/XPNMxiWnoJI2r8Zyflx83U7iMoi6pOASYgvci7SESEIKkt
 jAEflyM0G8eoUO+K3qSZvBHpC6Z/PRuPlVi7x0oFeCzkFfAzkhOygAjZDAzcQNZlbFSh
 i117yuU6biTdOJUJING1gUKlwyi3MqL7+6NV6LbuL+WneWSi/nBL//feQagys9YUz2WM
 khMCWKpamlVnZLhFc/KzyPbMhotxOreZ4sZWwZH0XzDsS2m1eJu7HC3I0yKPGa22f+P3
 p4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793050162; x=1793654962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O/N1K8D/SpacXzaFnyxWTfnjEcncC7vi42PU2GqoRBg=;
 b=cuxkrKQWs1bEhNx1NiGrNHXmnFvB8ujyJgiDimyy+yc7Jra3Iw59Ta4040qT4OCLTk
 awN7x7M8V+EYXm1qQrgRoBIKzDr6sH/xQnwLvK6rJ7wgNBCU+/DnXaZvQo6gTx4IlI+M
 305eVjb3kh8RLrlaJ1zqBeVC2CgN20TTMX8wd43FNwPepXi8XODUJ8ftGeHO1KOn3GXt
 MxBbVTxJuCE9TlaWupQcYZJJW6Q3X0kB+sr1vrwrT7TCP862uN8J59GXWyk6D3CcIItm
 8lWtEqMP4M8dwr0tjQz3q+MJH45u1mOMYL0c5tsPEzt42IXl1XxV5WbHj0kLhfR/5+TW
 +AkA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwCu1gNXzEVIr2QZdpivrHIratug1YyuSIzvJPtV/xrJnz7DqMiHfpIa81wtNjSvR8ip3Fzw2sRNA==@nongnu.org
X-Gm-Message-State: AFq9FYINc8/lhW44Umkb0RsJt0ykzjpdHQ7gsBJcMbgcVHTVoS4WLYuo
 yfqSDwS9ZBiQsxEYahPMzVNE+Xd5bgMsnoZTqpEMHR4slYa8M+2PPAHqx9UHefjt158=
X-Gm-Gg: AYBFou0akRe5PbMA4xulIhVCATNszkX+FyVBg5PtbNxfWBEcGNY6FlFpjUt2JEMri9a
 rEBtOzj3SFSbnaufVQvvjAehznBxmBnJqP2MvGdGCu6SUULtW0x4VL1kyerQl/vbzlk33B8IsiJ
 c3Ml00qUqW0V4+351X1EOQfKwcqvPOnYe1VH8/C+qTPp4APVmiDKGUwEmqokPgBL+zLFiLNV7cm
 nLzR8cGAm3XgRg+42gpVDXVMEi6PP72wz55XXJXuY3rVeaTB8bcXMmBxgOR6+PFvFdoVo1xI2j3
 pdAEvWuzHWFK3PCJ/gZau1BtKWfOGTC9OpuWBAwkNV+J2AjGZH+FUmzzf0RwXIxrDrzNTAEQt2q
 6c/LzFCnjzlabtp6bpbrsJ2K7Wz6MhzHWOnFgdKMToR5nvD05F3/tY65/FKaIbeHw9dQe1k9THC
 V0694/JdSD+BuYUmxT4qwYYAGDnVlYdrYPCraqUgePMz2E4W61s8LO9XLOEvxBwEKgzBDvV84r6
 0G55/S3P9ZOC1WzIyHDS9A1a36zDuO8ZEt4Xw74XB5x1UTkGRVDvkyqBXpT+b7RaprSne8ZtXx3
 rErCCcYbhanrh0o=
X-Received: by 2002:ad4:5ae3:0:b0:91c:1647:41f8 with SMTP id
 6a1803df08f44-91c48eaae20mr135294346d6.45.1793050162566; 
 Mon, 26 Oct 2026 14:29:22 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm85206376d6.29.2026.10.26.14.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:29:22 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 00:28:39 +0300
Subject: [PATCH 3/6] hw/i2c/aspeed: fix buffer transfer in a non-packet
 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v1-3-076cdde514f8@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>, 
 "Timur Maksimov gessingate"@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793050151; l=2922;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=qCtyqmUQnMtbRxbl1P/V7v0HhfAIOI5DaatQrdCnOdA=;
 b=PSlvPIlm5wbMnwvTsVoa8kStERjU+AmCUKy/SFds9FkGc+LiP+lzwp7/opD8dLCllvQbJG8BI
 jYvF/pK2KACBZrYZJeysvP5vEuIbPtNFf7RjuGJTpSrir023QHq3I9C
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=gessingate@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Oct 2026 18:00:54 -0400
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buffer pool first tx byte contains a device address in non-packet mode.

Fixes: 961faf3ddbd8 ("hw/i2c/aspeed: Fix TXBUF transmission start position error")
Signed-off-by: Timur Maksimov gessingate@gmail.com
---
 hw/i2c/aspeed_i2c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 136d4eb859..ec46f6c94c 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -382,7 +382,7 @@ static void aspeed_i2c_bus_recv_dma_pool(AspeedI2CBus *bus)
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, RX_DMA_EN, 0);
 }
 
-static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
+static int aspeed_i2c_bus_send(AspeedI2CBus *bus, bool send_addr)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     int ret = -1;
@@ -391,11 +391,12 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
     uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
+    uint8_t pool_offset = send_addr ? 1 : 0;
     int pool_tx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
                                                 TX_COUNT) + 1;
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
-        for (i = 0; i < pool_tx_count; i++) {
+        for (i = pool_offset; i < pool_tx_count; i++) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
             trace_aspeed_i2c_bus_send("BUF", i + 1, pool_tx_count,
@@ -633,6 +634,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
     uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
+    bool start_cmd = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_START_CMD);
 
     if (!aspeed_i2c_check_sram(bus)) {
         return;
@@ -642,7 +644,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_bus_cmd_dump(bus);
     }
 
-    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_START_CMD)) {
+    if (start_cmd) {
         uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
             I2CD_MSTARTR : I2CD_MSTART;
         uint8_t addr;
@@ -686,7 +688,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_TX_CMD)) {
         aspeed_i2c_set_state(bus, I2CD_MTXD);
-        if (aspeed_i2c_bus_send(bus)) {
+        if (aspeed_i2c_bus_send(bus, start_cmd &&
+                                     !aspeed_i2c_bus_pkt_mode_en(bus))) {
             SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_NAK, 1);
             i2c_end_transfer(bus->bus);
         } else {

-- 
2.53.0


