Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F77606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WUerliqI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFod-0001PY-Tm; Fri, 23 Oct 2026 10:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo8-0000rd-7g
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:45 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo6-0004rs-30
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:43 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-5361e313e63so8102291cf.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763979; x=1793368779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yLPkHqMTEnND6LbSpKRqY8wxHG2Xd0a1ZaPPhh9CB7Q=;
 b=WUerliqIy7YKeLmCC83d391XvoFaRLw3Jda10qQLzIPSKKmF8byWwlic2gEYtWdKSA
 nMe4blhw76EVSi8fJWJ/N7NhKEBcbbDiY2SO/9v3hQmRWv2pw+sRwPExVFuealhCfxuz
 N+djdXoVSL91EOgyqZHwcsPUaqgmRqH5ETUDNpdYxwYh+sqObbGtBHvHp8wTQ+X/J0cT
 zyTAjlKGW023tBfZnyw3lTz71oqKVdkAk9GyRqtucY3LzrnKSaA6hTG5xUhAkwvgaXNb
 FQneqn1quC5hgpFM1HGrz3uVi6NDHa7Wr5vtWT94VVeG7A/28aG4+uYCGf3rzLoW1iTb
 zZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763979; x=1793368779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yLPkHqMTEnND6LbSpKRqY8wxHG2Xd0a1ZaPPhh9CB7Q=;
 b=SLIt5ZqxMkEL2h/RZL7wAROwZp7eVQriP5WASOgXtzkGjuCvhqBlOUzGz8I7VxGwKy
 H/u2k19E1CK/5QozOEf7M0Ju8Gw7Vs5SKtjfPqDPAeddJ+2+6sY3xRwUpm4zJbxYq51q
 oIKxHKb+vzE6yjmTdzNYmD4Bzavropqeeh1W0Z4hMh6pW8UkrmBZeu3+hjL5CwjZ3yEo
 EyWIzCp5w43uCHIr5EfBaSdFtI5NBvPX95lS3VfHuWASK8+sZdiBGsKTSlVQbXln7/a/
 gg0+wFCME8bpSsWbZgHp4FjVSaiHfceicp6Bs1Ta5Quio4FohlRr2KxV1gbNz236ih97
 2+YA==
X-Gm-Message-State: AFq9FYJCmLzGGLL/Zq1at2BJgA9t5Kpp/Vh6ByU8k+9rd5tGw1DzmRSb
 ZbwBO6SeuS+KP2ofvG6SvtdUYFVP7sHsCHeWPlfsWsK0kInTaaLJ1gyZ
X-Gm-Gg: AYBFou1aR6Um9kE8ygBSGSuWjIrScKUBniBeGYdCS08wDimdRmMVFunGh4YH/IEufVL
 c3OJt3HMLblKBehmmVp7o66gt6aGY74xns+mSZsJ06gftcPIQjexZ7RI3cDkwTUDlyoJEanEk4s
 dkkI5alk55+AaUr8qe1crfydelRHAEd4X230GETwLVWcz8XYo4gxE2/OmmGEgrfLyO8UjnRToiR
 ZDlRgf5CWeEUn7d6FPArDBgm9PK7XloCSxpceFAjVTBDuVe2JhDUGuWilYMh1NOyH1oXMi356c/
 KW2yYeM/+svTKA8Yrjxhzub91kaqjLmbdROHAj5oZFo5jVzNpErRWYsxTGSNZU0/5/9HM4Yjn2c
 ylxr+SFt9OTRrrZmz9WIObNv/U0HGRhrvB3TRXTQP8lnkUEx2y0vbs/7xbv5Di5y18n0hefAoKr
 3fygmYJfd9UW5zATg4iDEPcCqqzrmx27x2C69KCFOIN+Nr2BEzCjOgdkfwQFwqhqH2pEmszejL/
 2BHWy+X/LJ7Dy50Afyy2xJT6l2imqdwY4aO0NfiZpPJA6Dqr2SmOUV69OASdvy2+zyJjAZknKbF
 IjTuu7j4OOuHOOfC54R+eOTV2JQyuOoia4vUbK4EW01QCP1rnV4VZw==
X-Received: by 2002:a05:620a:1712:b0:93f:4f87:4f5e with SMTP id
 af79cd13be357-93f6f9fd235mr427892185a.72.1792763978835; 
 Fri, 23 Oct 2026 06:59:38 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:38 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v5 11/16] hw/net/bcm2838_genet: implement GENET MDIO
Date: Fri, 23 Oct 2026 09:59:19 -0400
Message-ID: <20261023135924.64990-13-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qt1-x836.google.com
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

Implement the MDIO command register handling used to read/write the
BCM54213PE PHY's standard MII registers (BMCR, BMSR, LPA, ...) plus
its vendor "shadow" register blocks reached through the AUX_CTL/
EXP_SHD indirection scheme, and a simple link-state model (PHY
starts down, comes up once BMCR is programmed and autonegotiation
is (re)started).

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

While carrying this forward, fix the autonegotiation-restart handling
in bcm2838_genet_mdio_cmd(): the guest PHY driver sets BMCR.ANRESTART
and polls BMCR until it reads back as cleared, but the result of
FIELD_DP16() (which returns a new value rather than modifying its
argument) was discarded, so the bit never cleared and the guest
spun forever at boot.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/bcm2838_genet.c         | 138 ++++++++++++++++++++++++++++++++-
 include/hw/net/bcm2838_genet.h |   3 +-
 2 files changed, 138 insertions(+), 3 deletions(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index c0aa5eda70..6aa40c6d1f 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -216,6 +216,7 @@ FIELD(GENET_PHY_STAT_1000, LOCALRXOK, 13, 1)
 FIELD(GENET_PHY_STAT_1000, MSRES,     14, 1)
 FIELD(GENET_PHY_STAT_1000, MSFAIL,    15, 1)
 
+/* There are two data representations for PHY_AUX_CTRL register */
 REG16(GENET_PHY_AUX_CTRL_0,              0)
 FIELD(GENET_PHY_AUX_CTRL_0, REG_ID_MASK, 0, 3)
 FIELD(GENET_PHY_AUX_CTRL_0, RSVD_3,      3, 1)
@@ -272,6 +273,135 @@ static void bcm2838_genet_set_irq_prio(BCM2838GenetState *s)
     qemu_set_irq(s->irq_prio, level);
 }
 
+static void bcm2838_genet_phy_aux_ctl_write(BCM2838GenetState *s,
+                                            uint16_t value)
+{
+    uint16_t reg_id = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_ID);
+    uint16_t reg_id_mask = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_ID_MASK);
+    uint16_t misc_wren = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, MISC_WREN);
+    uint16_t reg_data = FIELD_EX16(value, GENET_PHY_AUX_CTRL_0, REG_DATA);
+    uint16_t reg_data12 = FIELD_EX16(value, GENET_PHY_AUX_CTRL_1, REG_DATA);
+
+    uint16_t *phy_aux_ctl_shd_reg_id =
+        &s->phy_aux_ctl_shd_regs.regs[reg_id];
+    uint16_t *phy_aux_ctl_shd_reg_id_mask =
+        &s->phy_aux_ctl_shd_regs.regs[reg_id_mask];
+
+    if (reg_id_mask == BCM2838_GENET_PHY_AUX_CTL_MISC) {
+        if (reg_id == BCM2838_GENET_PHY_AUX_CTL_MISC) {
+            if (misc_wren == 0) {
+                /* write for subsequent read (8-bit from AUX_CTL_MISC) */
+                FIELD_DP16(value, GENET_PHY_AUX_CTRL_0, REG_DATA,
+                          *phy_aux_ctl_shd_reg_id);
+            } else {
+                /* write the 8-bit REG_DATA field to AUX_CTL_MISC */
+                *phy_aux_ctl_shd_reg_id_mask = reg_data;
+            }
+        } else {
+            /* write for subsequent read (12-bit) */
+            FIELD_DP16(value, GENET_PHY_AUX_CTRL_1, REG_DATA,
+                      *phy_aux_ctl_shd_reg_id);
+        }
+    } else {
+        /* write 12 bits */
+        *phy_aux_ctl_shd_reg_id_mask = reg_data12;
+    }
+
+    s->phy_regs.aux_ctl = value;
+}
+
+static void bcm2838_genet_phy_shadow_write(BCM2838GenetState *s,
+                                           uint16_t value)
+{
+    uint16_t reg_id = FIELD_EX16(value, GENET_PHY_SHADOW, REG_ID);
+    uint16_t wr = FIELD_EX16(value, GENET_PHY_SHADOW, WR);
+    uint16_t reg_data = FIELD_EX16(value, GENET_PHY_SHADOW, REG_DATA);
+
+    uint16_t *phy_shd_reg = (uint16_t *)&s->phy_shd_regs + reg_id;
+
+    if (wr == 0) {
+        FIELD_DP16(value, GENET_PHY_SHADOW, REG_DATA, *phy_shd_reg);
+    } else {
+        *phy_shd_reg = reg_data;
+    }
+
+    s->phy_regs.shd = value;
+}
+
+static void bcm2838_genet_phy_exp_shadow_write(BCM2838GenetState *s,
+                                               uint16_t value)
+{
+    /*
+     * TODO Stub implementation without side effect,
+     * just storing registers values
+     */
+    uint16_t reg_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                 GENET_PHY_EXP_SEL, REG_ID);
+    uint16_t block_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                   GENET_PHY_EXP_SEL, BLOCK_ID);
+
+    assert(block_id < ARRAY_SIZE(s->phy_exp_shd_regs.regs));
+    assert(reg_id < ARRAY_SIZE(s->phy_exp_shd_regs.regs[0]));
+    s->phy_exp_shd_regs.regs[block_id][reg_id] = value;
+}
+
+static uint16_t bcm2838_genet_phy_exp_shadow_read(BCM2838GenetState *s)
+{
+    uint16_t reg_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                 GENET_PHY_EXP_SEL, REG_ID);
+    uint16_t block_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                   GENET_PHY_EXP_SEL, BLOCK_ID);
+
+    assert(block_id < ARRAY_SIZE(s->phy_exp_shd_regs.regs));
+    assert(reg_id < ARRAY_SIZE(s->phy_exp_shd_regs.regs[0]));
+    return s->phy_exp_shd_regs.regs[block_id][reg_id];
+}
+
+static uint64_t bcm2838_genet_mdio_cmd(BCM2838GenetState *s, uint64_t cmd)
+{
+    uint32_t phy_reg_id = FIELD_EX32(cmd, GENET_UMAC_MDIO_CMD, REG_ID);
+    uint32_t phy_reg_data = FIELD_EX32(cmd, GENET_UMAC_MDIO_CMD, REG_DATA);
+    uint32_t start_busy = FIELD_EX32(cmd, GENET_UMAC_MDIO_CMD, START_BUSY);
+    uint32_t rd = FIELD_EX32(cmd, GENET_UMAC_MDIO_CMD, RD);
+    uint32_t wr = FIELD_EX32(cmd, GENET_UMAC_MDIO_CMD, WR);
+    uint16_t *phy_reg = (uint16_t *)&s->phy_regs + phy_reg_id;
+
+    uint16_t anrestart = FIELD_EX16(phy_reg_data, GENET_PHY_BMCR, ANRESTART);
+
+    if (start_busy != 0) {
+        cmd = FIELD_DP32(cmd, GENET_UMAC_MDIO_CMD, START_BUSY, 0);
+
+        if (rd != 0) {
+            if (phy_reg_id == BCM2838_GENET_EXP_DATA) {
+                cmd = FIELD_DP32(cmd, GENET_UMAC_MDIO_CMD, REG_DATA,
+                                 bcm2838_genet_phy_exp_shadow_read(s));
+            } else {
+                cmd = FIELD_DP32(cmd, GENET_UMAC_MDIO_CMD, REG_DATA, *phy_reg);
+            }
+        } else if (wr != 0) {
+            if (phy_reg_id == BCM2838_GENET_PHY_AUX_CTL) {
+                bcm2838_genet_phy_aux_ctl_write(s, phy_reg_data);
+            } else if (phy_reg_id == BCM2838_GENET_PHY_SHD) {
+                bcm2838_genet_phy_shadow_write(s, phy_reg_data);
+            } else if (phy_reg_id == BCM2838_GENET_EXP_DATA) {
+                bcm2838_genet_phy_exp_shadow_write(s, phy_reg_data);
+            } else {
+                if (phy_reg_id == BCM2838_GENET_PHY_BMCR) {
+                    /* Initiate auto-negotiation once it has been restarted */
+                    if (anrestart == 1) {
+                        phy_reg_data = FIELD_DP16(phy_reg_data,
+                                                  GENET_PHY_BMCR,
+                                                  ANRESTART, 0);
+                    }
+                }
+                *phy_reg = phy_reg_data;
+            }
+        }
+    }
+
+    return cmd;
+}
+
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint64_t value = ~0;
@@ -364,10 +494,13 @@ static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs.rdma.status = (~value) & GENET_DMA_ENABLE_MASK;
         break;
     case BCM2838_GENET_UMAC_MDIO_CMD:
+        value = bcm2838_genet_mdio_cmd(s, value);
+        s->regs.intrl0.stat = FIELD_DP32(s->regs.intrl0.stat,
+                                         GENET_INTRL_0, MDIO_DONE, 1);
+        break;
     case BCM2838_GENET_TDMA_REGS
         ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
-        qemu_log_mask(LOG_UNIMP,
-            "UMAC MDIO and TDMA aren't implemented yet");
+        qemu_log_mask(LOG_UNIMP, "TDMA isn't implemented yet");
         break;
     default:
         break;
@@ -463,6 +596,7 @@ static void bcm2838_genet_reset(Object *obj, ResetType type)
 
     trace_bcm2838_genet_reset("done");
 
+    bcm2838_genet_set_qemu_mac(s);
     bcm2838_genet_phy_reset(s);
 }
 
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index ee240213aa..94ac457c04 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -103,7 +103,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_EXP_DATA          BCM2838_GENET_PHY_REG(exp_data)
 #define BCM2838_GENET_EXP_SEL           BCM2838_GENET_PHY_REG(exp_ctrl)
 
-#define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
+#define BCM2838_GENET_PHY_AUX_CTL_AUXCTL    0x0
+#define BCM2838_GENET_PHY_AUX_CTL_MISC      0x7
 #define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
 
 #define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT 256
-- 
2.55.0


