Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC6606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ojgki/fu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFoI-0000y7-5N; Fri, 23 Oct 2026 09:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo0-0000lb-9O
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:36 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFnw-0004ou-O5
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:35 -0400
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-93e6eb77f0bso77047985a.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763972; x=1793368772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dyICs8KtURhLh9ERtJL2tsMninZADpeVl6DJ8BnR9IM=;
 b=Ojgki/fugFrdSMLvwr1RMj+CcnUsKCLweD6cf7do2FwVdt9+qpOr2Obod4c2CCwT98
 p1vLWdL4rLJI0j1rQOIkt+90d/RgrwhmbIKzpTT9iaR3AoiQE83d6w/n7MI0ok1pl2Kw
 iJ4UG8LjqsXLMZ5IKiW4MWLrpqZFYQ5JXc6gLrWjNTI8sI+BshzDKFdtH1iN3yRfc45/
 UU+/D2LxTcDAnAhfwsBri9UL+lgEd9ZFdb7OLDFzqoYQh9TTGAMRVcCkkrnRldLsH9PA
 gpBJNZCgBXAf4L26sLcABeUpOAXokDN03lRQPFYY+/SFo71cSnFC2zHt9VEAUPWaHGPU
 pFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763972; x=1793368772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dyICs8KtURhLh9ERtJL2tsMninZADpeVl6DJ8BnR9IM=;
 b=VtAsfrujoBVKNjnX6B8mDZMXOmBxNNFhydKLEMllcl+9XdxT/WtRo0XgwYRodrd8nN
 HQoz1AS/CV/2i4K8IEeQ8THjvSigGEvaiyZWz73ialvWNI5dRyFlbrO5pKCMUQY4Qayw
 et4Ll5BgjysGRDN+VD+DLFQyPkjrUZsHn+f9aaOtJFiQ6qZ5XodSx6lCtLEWEHPpHebK
 6EgVySbws329E0R0w+gSuDjuJM6QD/PhRmbSSg86rmACz2strTUELT7Eno4dkAeSbhN5
 ShYbr/CqH7yfQ7UKOzK1gTLmdfaOHBhts7Sfwn8g9UtKtCFCQutHvngGeQFlSGe1tUbU
 jbeg==
X-Gm-Message-State: AFq9FYKaNJ0KfYya/dVMXQkUAN5dIN9oqaosk5s/H24jt/UVijlKzcRf
 9Rs0aZmRK03MFE6sX4qW7d+Q/I/InBXwjgpaZirtsOS7aTsw97BEkqNnw+ItdU0p
X-Gm-Gg: AYBFou3bM1ELxIJAqyQ2r8+C/2g2Fanjg0Ot7t+e4QUyO557GSVpZ40uNlKAk5d9okF
 lhzm7wQIYbz4uG91wabuL1OL/OGILD7Dnh+jFMhRp+5Hhyh+LfrljveeMsgag2REXDwV/sSHEqa
 4poTTVAwE64LUSSJZ9MzL7wwQngcVfzruJ+H74fZxl+7oJCM3Zgg25j+hB/eFeuT03xnojTxrFB
 sEi76IS967Fda5fJLsIvyKdFGEvOg9N9nvoWwjImwE566P17Vu/cNmknSMdxyqKURG4zvdOPINy
 GiPsG0NjmlerKduH/gaDnxUJp3LUZWkE3GVu9LjHauqbQGfQLj4chuN/D9mczwYwB4KgBqdFgw8
 2yGwDvz/l8S/Kfp5IvV/hzHhfqJlBUqYu7U5WGaU/4b2tt7Gw5X6HZE+aK9PPx7EApIe5wfNYqo
 r7qHSPNF4702d3tub9fJqXxE7QN0ATl27umXSR38hYbyVP9VkKx/JKY4tt2YWSPqpb8VgCF4jNk
 xZ9sZaig/QatdDL74aY0LYy41CNzLhc8dJtCOhorxPB0jG25NFXcGkDdbsR2f0CfocRSa30ZiGf
 7RRbm7bvdKR+IaxEVpugp3MFl6qViAuMbSwxqPnwovVI1EcSrm32
X-Received: by 2002:a05:620a:6882:b0:93f:2aa8:c549 with SMTP id
 af79cd13be357-93f6f782e9amr399864985a.24.1792763971748; 
 Fri, 23 Oct 2026 06:59:31 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:31 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v5 05/16] hw/net/bcm2838_genet: add GENET register structs,
 part 1/4
Date: Fri, 23 Oct 2026 09:59:13 -0400
Message-ID: <20261023135924.64990-7-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Kambalin <serg.oker@gmail.com>

Add the SYS, GR_BRIDGE, EXT, INTRL0, and INTRL1 register block
layouts and the top-level BCM2838GenetRegs/BCM2838GenetState
structs, plus REG32/FIELD accessors for the revision-control and
interrupt-status registers.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/bcm2838_genet.c         | 37 ++++++++++++++++
 include/hw/net/bcm2838_genet.h | 77 +++++++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index a20a9e7c72..7c4b036224 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -15,10 +15,47 @@
 #include "hw/core/irq.h"
 #include "net/checksum.h"
 #include "system/dma.h"
+#include "hw/core/registerfields.h"
 #include "hw/core/resettable.h"
 #include "hw/net/bcm2838_genet.h"
 #include "trace.h"
 
+REG32(GENET_SYS_REV_CTRL,              0)
+FIELD(GENET_SYS_REV_CTRL, GPHY_REV,    0, 16)
+FIELD(GENET_SYS_REV_CTRL, MINOR_REV,   16, 4)
+FIELD(GENET_SYS_REV_CTRL, RSVD_20_23,  20, 4)
+FIELD(GENET_SYS_REV_CTRL, MAJOR_REV,   24, 4)
+FIELD(GENET_SYS_REV_CTRL, RSVD_28_31,  28, 4)
+
+REG32(GENET_INTRL_0,                0)
+FIELD(GENET_INTRL_0, SCB,           0, 1)
+FIELD(GENET_INTRL_0, EPHY,          1, 1)
+FIELD(GENET_INTRL_0, PHY_DET_R,     2, 1)
+FIELD(GENET_INTRL_0, PHY_DET_F,     3, 1)
+FIELD(GENET_INTRL_0, LINK_UP,       4, 1)
+FIELD(GENET_INTRL_0, LINK_DOWN,     5, 1)
+FIELD(GENET_INTRL_0, UMAC,          6, 1)
+FIELD(GENET_INTRL_0, UMAC_TSV,      7, 1)
+FIELD(GENET_INTRL_0, TBUF_UNDERRUN, 8, 1)
+FIELD(GENET_INTRL_0, RBUF_OVERFLOW, 9, 1)
+FIELD(GENET_INTRL_0, HFB_SM,        10, 1)
+FIELD(GENET_INTRL_0, HFB_MM,        11, 1)
+FIELD(GENET_INTRL_0, MPD_R,         12, 1)
+FIELD(GENET_INTRL_0, RXDMA_MBDONE,  13, 1)
+FIELD(GENET_INTRL_0, RXDMA_PDONE,   14, 1)
+FIELD(GENET_INTRL_0, RXDMA_BDONE,   15, 1)
+FIELD(GENET_INTRL_0, TXDMA_MBDONE,  16, 1)
+FIELD(GENET_INTRL_0, TXDMA_PDONE,   17, 1)
+FIELD(GENET_INTRL_0, TXDMA_BDONE,   18, 1)
+FIELD(GENET_INTRL_0, RSVD_19_22,    19, 4)
+FIELD(GENET_INTRL_0, MDIO_DONE,     23, 1)
+FIELD(GENET_INTRL_0, MDIO_ERROR,    24, 1)
+FIELD(GENET_INTRL_0, RSVD_25_31,    25, 4)
+
+REG32(GENET_INTRL_1,              0)
+FIELD(GENET_INTRL_1, TX_INTRS,    0, 16)
+FIELD(GENET_INTRL_1, RX_INTRS,    16, 16)
+
 
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 91cf1773d5..af5e8abd2e 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -19,7 +19,82 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_REV_MINOR         0
 
 typedef struct {
-    uint8_t stub_area[0x10000]; /* temporary stub */
+    uint32_t rev_ctrl;
+    uint32_t port_ctrl;
+    uint32_t rbuf_flush_ctrl;
+    uint32_t tbuf_flush_ctrl;
+    uint32_t reserved_0x10[12];
+} BCM2838GenetRegsSys;
+
+typedef struct {
+    uint32_t reserved_0x0[16];
+} BCM2838GenetRegsGrBridge;
+
+typedef struct {
+    uint32_t pwr_mgmt;
+    uint32_t reserved_0x4[2];
+    uint32_t rgmii_oob_ctrl;
+    uint32_t reserved_0x10[3];
+    uint32_t gphy_ctrl;
+    uint32_t reserved_0x20[24];
+} BCM2838GenetRegsExt;
+
+typedef struct {
+    uint32_t stat;
+    uint32_t set;
+    uint32_t clear;
+    uint32_t mask_status;
+    uint32_t mask_set;
+    uint32_t mask_clear;
+    uint32_t reserved_0x18[10];
+} BCM2838GenetRegsIntrl0;
+
+typedef struct {
+    uint32_t stat;
+    uint32_t set;
+    uint32_t clear;
+    uint32_t mask_status;
+    uint32_t mask_set;
+    uint32_t mask_clear;
+    uint32_t reserved_0x18[10];
+} BCM2838GenetRegsIntrl1;
+
+typedef struct {
+    uint32_t ctrl;
+    uint32_t reserved_0x4[2];
+    uint32_t status;
+    uint32_t reserved_0x10;
+    uint32_t chk_ctrl;
+    uint32_t reserved_0x18[31];
+    uint32_t ovfl_cnt;
+    uint32_t err_cnt;
+    uint32_t energy_ctrl;
+    uint32_t reserved_0xA0[5];
+    uint32_t size_ctrl;
+    uint32_t reserved_0xB8[18];
+} BCM2838GenetRegsRbuf;
+
+typedef struct {
+    uint32_t ctrl;
+    uint32_t reserved_0x4[2];
+    uint32_t bp_mc;
+    uint32_t reserved_0x10;
+    uint32_t energy_ctrl;
+    uint32_t reserved_0x18[58];
+} BCM2838GenetRegsTbuf;
+
+typedef struct {
+    BCM2838GenetRegsSys sys;
+    BCM2838GenetRegsGrBridge gr_bridge;
+    BCM2838GenetRegsExt ext;
+    uint32_t reserved_0x100[64];
+    BCM2838GenetRegsIntrl0 intrl0;
+    BCM2838GenetRegsIntrl1 intrl1;
+    uint32_t reserved_0x280[32];
+    BCM2838GenetRegsRbuf rbuf;
+    uint32_t reserved_0x400[128];
+    BCM2838GenetRegsTbuf tbuf;
+    uint32_t reserved_0x700[64];
 } BCM2838GenetRegs;
 
 struct BCM2838GenetState {
-- 
2.55.0


