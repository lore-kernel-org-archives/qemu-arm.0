Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1173606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zp1DFivu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLnDz-0002tN-BV; Tue, 27 Oct 2026 15:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDm-0002nu-MB
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDk-0004rC-Tj
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so170123f8f.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793130751; x=1793735551; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=enQmUqIFc3QsIH9yIFJ0VOwxm84Y3MS6STEm1BxWL4Q=;
 b=zp1DFivu5BzgllZ00JvUOVqmsHtvV1MX6T8Eh8Qs419kr9IqCrLmBtIjQI5xLfKAJL
 1FtzdS7oWm4hTnZoKs7aLFBLa+Es9x1S+j5CrIWyPRKvZ7/9uds1vrhOFuX8c0B/iWAb
 PpmmDhWM/n2Qk4YPa+FkaI+MMg8ukI0afznDS977ZSU78PozBQN2BPdExOpINg7+/p1I
 H1ijy+GJ1fP6v7kaIJllMFJAwz3q/lNB8bivm1p7FMgpD5m0A02TdvI48jzU/+Gj5zfu
 k/JIkj++GZXxggvcbWCY8jCLXqKk0pgcAowWfUWXNbNE0QffD1bJ/tMgxsoEsBU2Zi5K
 n5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130751; x=1793735551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=enQmUqIFc3QsIH9yIFJ0VOwxm84Y3MS6STEm1BxWL4Q=;
 b=hx9epi8lSreL7vpdhdL9oa2WB1Aos9SoqexMx/84qyZxsubpqSX//PnT08YnW7C4xW
 NOpSibYiP1hVPN3sFW+m/P5ptsIKcAhuk1A2sZ+9ZN/QiuCmdQPPUR9+29kK8IwPfEic
 +TlvXZjx9bYFogUZnk19xjZgd3tzJxqG4pOHto1tkZU8AhqidN1fDuesXpLEyvPFtQbm
 1KPyUmcPaaDSnMtlre4Tlv0FUv4BL1l2dBDU7/EUx9SdxkgSGDDjoVNSj8c2stgbuGi/
 3X76X20a56oG9pWeY+hVUaXHxmmH2uXeEiNK+OuMT77TYxS4lTdQhK26+GOTupfSz1+9
 VM3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPNOhSipDcOZsoVaTOw5At/guW1UKc8Jt4W9Cgg3eDApXXE5HKhrDoIqWh7A1c6tx1PyyRaUP6gw==@nongnu.org
X-Gm-Message-State: AFq9FYJWwXeKh2XPpaz5KZimtwn62EaoT10kh6HywsMUsxTjYWQ/47wM
 aAuL8uX04YRutChg3UAEsWO9LpXESUBRoCrLR+EnvvLfwcPY0NVkCqON
X-Gm-Gg: AYBFou0JQDpAeZbEVM83JHr45hgXUb8KdwAgy7yXJEWsLxN7onHYiTJOMghAWAUs11B
 KB5qZgc/Eg5Kpssz52gjHmWY47gpsDH4Aem6DMZPTsAOv+I5E3rmcLvQsy0+aRVr9y3z/Ije6kx
 WVXBqcpnmpH5rM9+57aXj1SLScQzX1zRIa3jxqQCbNl9JBKzdawR65Ow7wVhKNeTN1pxTq9N6Ke
 EO3CO6+BYfokd9+I0gUcXPD30O5ZY3giH5pSwsXfDiyuQgVBHSrx8ARWSJixZEqs4WUY+X3CP15
 f2epy14pgwA7U/eVnjpzBDd+Cgpav44kZSJNEWFQK2MmNO1LrI9k2TZlkoDUQSS0YFKNFrw2J1S
 wMwI//OHz+j/KPQ2++Alm+oN26/3v7UgmhL1Mtje0vAsfNUzYRaSFNibxikmR4tu/2ZQX6q0NHb
 hY6rCb3w0Is1LvFxHvXNMYawVlDPe9aVd34UnDDibvq7mKNu5X6tqSJF6wChFfyxKbdb5Ht/PCx
 AuTKjTvNboAUBuICjkwSKFE50w3TRHvgWaF5o10jjHmouY0ZEssrtMhZsO9YjGEW7Hkoq16yLeY
 1psGT7mmBoM8xQSO
X-Received: by 2002:a5d:5d0c:0:b0:48c:7f18:c85e with SMTP id
 ffacd0b85a97d-48e5d5ae02bmr888042f8f.45.1793130751411; 
 Tue, 27 Oct 2026 12:52:31 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb846sm24746368f8f.25.2026.10.27.12.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 12:52:30 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 22:50:45 +0300
Subject: [PATCH v2 4/6] hw/i2c/aspeed: fix buffer transfer in non-packet mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v2-4-07deed1dff60@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793130744; l=2973;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=38OiWIU47ufhP8zBeW4HQfXHxUXt8nl/xj5DLwxw/94=;
 b=2omdn7PZiaYTKx2rMzSHmbCact2D46+5i90WmSyCB3kOwBUYlSz3fXfgUzWp6+fp+OPR3sz/+
 +0o8+ppcLmcAidcdTsz0FJ3zFCN3TCA3wbfRCx2d2Q84/387R83XA40
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=gessingate@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In non-packet mode, the first byte of the tx buffer pool contains a device address,
so avoid sending it as a data byte.

Fixes: 961faf3ddbd8 ("hw/i2c/aspeed: Fix TXBUF transmission start position error")
Signed-off-by: Timur Maksimov <gessingate@gmail.com>
---
 hw/i2c/aspeed_i2c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index ff6ef6d23a..510758fb7a 100644
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


