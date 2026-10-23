Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EC606A324
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnyH3cWc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFoK-00013m-9O; Fri, 23 Oct 2026 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo3-0000pF-Fk
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:39 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo0-0004qO-QF
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:38 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93f3c8958d5so91017985a.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763976; x=1793368776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p7WbNU0cpQP7rnZCYZ9mXiCyI9Be0mIvVXNIhPI6SwI=;
 b=EnyH3cWcLjNLB00ORrKDtv0+J8mssosI0Enl2+RZjVvcO5oTMfheanDC5MnYTKUttF
 wsg1iWKDdPRiq6UVKkp7aWm5fln/KQVdbR8swHPWvWELArtUpqYq748U1fdO/MWHrOyQ
 NNFn14r03tN0SlWD8Fx79lOGvkNFZPo+OUMmol887ryBjwAOFYIDYJ0Fy44YStJWl4WO
 j1Ecql3/Hcyo3oKCY4IbHruOejV0kFKW9UW2z2L8LLeVGeCbqtCRTYj6JaJwg6z5Z4Rs
 pvQZSsKiok6i7dl35ue+zjUqgkmiOzz84BpxDSveHDYUmuiHVMfJR7jM49ZCOvF6ZbCZ
 5y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763976; x=1793368776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p7WbNU0cpQP7rnZCYZ9mXiCyI9Be0mIvVXNIhPI6SwI=;
 b=ej7Ej29TVTLy+gxSGcyWjGeNno3g/m56a9xGsKW3lqH0LYBKSGqNNND49t9lkxmrGG
 +A1WHFdqlqg5SwwCe6qpV8gDmPhwwu20FoNMkyvL/mSGM3OV4ERcbk4Y9J6ymG2zVAS/
 eiVdUGfXwqdmHuNVEBhSM+S/ulcNpkwSlfgsPdiFEeoVpHnhBIDAI9ERaT5xBsBbi2Yg
 9cJqhDhuS0jIuZniaalV2VkF0nw9q5u/rEmDmuS7t8tGxbaiIxXn77lfOfNpK88l6W0n
 8Yjb3FdtRDsTGkhjJEXzrEb1WqS4gF95cf/mUT7YK67b1VrUE+vrvG3bQxUQJSWUwH78
 KlTw==
X-Gm-Message-State: AFq9FYLNvCHVffs6xN5Nym127wSxfqpDh6dXzuDDtZozFkGdgaXpdAEZ
 y0lE9mFHxU0Z1c8bSnVhzm+NZ6u3uTdjq8o3NA3xPnNMjr4XDW/7L4PM
X-Gm-Gg: AYBFou2tg0mGPShFdTM9zvYlO93rty6WoxIXfBqOJADv4qSC+835ZOwUL0wnwtKwQtH
 YHtS5pkgu9iqXieRtNlOKI4gZ4hI8SFIFXgu8e0yRsOgcr8TEiYGyT9XZhCzdvscyjUCgyihd10
 uaWMYwGkBlz69ptRB1RpMXUrqkSBwf7DiIXumZ7Ygx5g7FM1tPLaj9yzYOvBek3Znabtw6KmGbc
 KAGGbOFCJv18TXz5sLyWxWKouf+a0YBwjUACeqowit7n81ttpRrCYpPG2iTZfExXGQJ7pqDTz9N
 TSZ4U6OEbI+s7vB4RQ9a7vCYCtJ9UEByTYxehGMAAEuXrpuXwfzhnHpJLS9lnraF6qQK+WFFGJr
 lvkFoo7l4I9mWu9O0hRV4Gb5ruI53ZL7YtkMPYiucmFDSUD0MRlA9VnlhjkpeunP6JCRgU0vCLl
 MxQ7nWcr680Fx/nEqpZP0YPLKvW2X2h4JiLUkhdY9/eP8Somvsm5ir5iDoyLbO8Ma7OlgijGn90
 KWIJ1m1G4pG6iKkXNmmJUsPH23f8wFw5Z5J9arMduDeGSWJAoJtne6DAsy+P5QLio6JSEF+yUVv
 CNY5ddxCvTtxjfq5Aa1aIjCIUnPULsbVZNH2lZUGhkV0fkUbruIg
X-Received: by 2002:a05:620a:40c3:b0:93f:1f9d:d9f3 with SMTP id
 af79cd13be357-93f6f79bce0mr432954585a.12.1792763975599; 
 Fri, 23 Oct 2026 06:59:35 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:35 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v5 08/16] hw/net/bcm2838_genet: add GENET register structs,
 part 4/4
Date: Fri, 23 Oct 2026 09:59:16 -0400
Message-ID: <20261023135924.64990-10-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
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


