Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5807CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIR3r-0002VX-Pj; Sun, 18 Oct 2026 09:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3g-0002KE-Tp
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:17 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3e-0002Hj-Ps
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:16 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93e503815adso116578285a.1
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792330574; x=1792935374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p7WbNU0cpQP7rnZCYZ9mXiCyI9Be0mIvVXNIhPI6SwI=;
 b=K8bybMiMtnVDALsHsfRWGGDEKuO8UA+Qze4N+/oWbbLXKnKi5nZQsI+D2AOLHVsQAN
 BxPtKqNLdfwArSo1Z2H2J2Zj70iCZKE9566z2IkmFG3eZbPI58v7e6an2NEDwECP0cAe
 ziLdLXFGUaszHzfhJkW58JAF3c0DV31YiD3yBSjCmQuHT0D/1fnnUL1b/iQq1qy0c4Kx
 /pB+6YV+k+Y0gM91EqqscecQT2jJ1D572D0UQLff4TrS9PxMitxsLXv9QoJ/aRrDTbgI
 A3UKqTqzEXliFXvTXZwLC4jm5kBT+vJWe98p32U3YuZqQTldJWceV2UtQNf4fyOk/BOW
 82sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792330574; x=1792935374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p7WbNU0cpQP7rnZCYZ9mXiCyI9Be0mIvVXNIhPI6SwI=;
 b=aF/5QCwgV0LiOxflNzeiiYu3mxPtkA8rfZ4Ck7SlR0kfTuEc2VNbjiF3TXILchE90l
 FeyVYKr1n+76oI20oucC5lmoIzOd9Tlx1alxUPop70xk6hFQ2X/uKgVhYnQZSSpME150
 Y+Y7BaRyjzG+pZYmeLM2f0Z9widjK5j+Ie5O5SS+miOieIH7OsGzkISTOMaEbxFbIGsr
 z4/MmN64M0a24j98soXwx7QANM0fRj5wMz6aJ/qU8WYk3LMaeVw+j02XXyIh/CdVa51z
 t0NoUOeDWsu8QlDEU5ozmkymqWYYM6RtpGYDgYYfe36jgzCfg2BXiM4yE04w0pH8jtSE
 tByg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxD+SSPeFWTiTArTeH5JpxJTgp8nVm2MafWHK9N4FwyEVeztsDVcrq6ANNLhmwMUBvycWeHm5R6cA==@nongnu.org
X-Gm-Message-State: AFq9FYLFnzL6BGzchw+b2WPsmpQQKlQIvp9+uI9HnSRVxuOKWfe8/6tX
 TAqzVT6y5hIKGgHiz4/zT8L5si87w4bHmT4TruCgeGJZRPOeUwqi4A07Y72lt5Kr
X-Gm-Gg: AYBFou11kEjE9b+oVoUAKJbk7P4BKgfxBojuDO1b0aMsQVFmP7ntvNlJxw6X+UHRZBd
 Sb6U+bF6JQNJWoLDW6jhOa+d2SAkn80djBqbh14HZQJ6SeIEYLFqxwAVRv1IDGeQhH6NUZ075//
 fftq1yCNl3/LZgBTSY8jxIF6bXonBknKSFVCvKtYcDpjmoLRJoUl5h9HBuWIm7KU5Z5RVYIl4g6
 3XdqNFAhrvTx++cAyVBrPsQe/sdZ0eBggIPYvaKSuuelXRe14GiUMvr6cHQj46wxtAZVxUOU4uV
 ma5zs7zWHXPEgcgS4hWAk72FgsIFhf6y4fPmGHGo0VhefirEhHuLXOMpE4W0ZcihGxH/g36F+AI
 TGazEyuiKnBLg5uqw2KTQdReNhlEkdjA8VzDX3jgdbLN66pAUHNcxvLiEtd8pOp6Gc1BSvAN4OR
 4oOKamfqaJSaZc84VLVYINtxZe+YGTNxW1NKc4dvLBF4SqCY6Jj75Wj+iQFI4q+iNz7mY8z0mVv
 mhQoKkiA45rTickwd2W647ZbC1CbMJHqVBYJYdFT4DhTW1UZqphm1zpvIxzp/9/2MUjK3E=
X-Received: by 2002:a05:620a:288b:b0:93b:d7a0:d9e5 with SMTP id
 af79cd13be357-93f29dc760bmr860548085a.63.1792330573799; 
 Sun, 18 Oct 2026 06:36:13 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:ecfc:9d0d:b95b:11bf])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f2a854bb7sm459056485a.23.2026.10.18.06.36.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 06:36:13 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v4 08/17] hw/net/bcm2838_genet: add GENET register structs,
 part 4/4
Date: Sun, 18 Oct 2026 09:35:54 -0400
Message-ID: <20261018133603.64323-9-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018133603.64323-1-marcelomanzo@gmail.com>
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Sergey Kambalin <serg.oker@gmail.com>

Add the PHY "shadow" register structs (BCM54213PE PHY-specific
clock control, RGMII mode, LED, and expansion-block registers
accessed via the AUX_CTL/EXP_SHD indirection scheme) used by the
MDIO emulation added in a later patch.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/net/bcm2838_genet.h | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index fedfbde066..2c3c62a9dd 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -25,6 +25,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_HFB_FILTER_CNT      48
 #define BCM2838_GENET_HFB_FILTER_SIZE     128
 
+#define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
+#define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
+
+#define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT 256
+#define BCM2838_GENET_PHY_EXP_SHD_REGS_CNT   256
+
 typedef struct {
     uint32_t rev_ctrl;
     uint32_t port_ctrl;
@@ -273,6 +279,32 @@ typedef struct {
     uint16_t rdb_data;
 } BCM2838GenetPhyRegs;
 
+typedef struct {
+    uint16_t reserved_0_2[3];
+    uint16_t clk_ctl;
+    uint16_t scr2;
+    uint16_t scr3;
+    uint16_t reserved_6_9[4];
+    uint16_t apd;
+    uint16_t rgmii_mode;
+    uint16_t reserved_12;
+    uint16_t leds1;
+    uint16_t reserved_14_18[5];
+    uint16_t _100fx_ctrl;
+    uint16_t ssd;
+    uint16_t reserved_21_30[10];
+    uint16_t mode;
+} BCM2838GenetPhyShdRegs;
+
+typedef struct {
+    uint16_t regs[BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE];
+} BCM2838GenetPhyAuxShdRegs;
+
+typedef struct {
+    uint16_t regs[BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT]
+                 [BCM2838_GENET_PHY_EXP_SHD_REGS_CNT];
+} BCM2838GenetPhyExpShdRegs;
+
 struct BCM2838GenetState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -284,6 +316,9 @@ struct BCM2838GenetState {
 
     BCM2838GenetRegs regs;
     BCM2838GenetPhyRegs phy_regs;
+    BCM2838GenetPhyShdRegs phy_shd_regs;
+    BCM2838GenetPhyAuxShdRegs phy_aux_ctl_shd_regs;
+    BCM2838GenetPhyExpShdRegs phy_exp_shd_regs;
 
     qemu_irq irq_default;
     qemu_irq irq_prio;
-- 
2.55.0


