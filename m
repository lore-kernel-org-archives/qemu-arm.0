Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2371596ejb;
        Sun, 3 Dec 2023 15:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTR4w7bTsjnTDWQwVxAQL7886cadIf9M9G5/m8QikM04oiXrQqyEG3qRKYYZuqQ5u6YsY+
X-Received: by 2002:ad4:56e3:0:b0:67a:a793:dc14 with SMTP id cr3-20020ad456e3000000b0067aa793dc14mr3599853qvb.41.1701647303522;
        Sun, 03 Dec 2023 15:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647303; cv=none;
        d=google.com; s=arc-20160816;
        b=FLgyiWHf8Lv7nMXO5m6uAybr4q18oDcncfWlYAtbCzWiGBzxrQcNhhJT27m+MMYkVB
         7yhY7UNBnawqsCTA+sx/88ZFGlN/bjgn1m1uQyKSlg4M/PwblWEL8sumJj1F7p7QHrsy
         TSaVJyvN3PUYmiHqA/bmYRqXaVizgU1nLjN6S32BkZsxdPTPSYKXz2ejRg8ydTJiVOLm
         6nC+QJ0O0a10sU7nAsGZszq+nXhqZSOmEj7QzU/BprI+K5VuPaNgbp8P2Q6SKDsNSpGW
         WA6SvL33VUm0i9YR0uUGrgOtGlnlpmdh1wa0ZN1h+NU/iiKAur9ny6g8jUs2/kDOo1Ct
         8PNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v0plx2CSfyD/hqodRTCcCQxsf1hkYu3FpLFu5vV8rvY=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=GYBt00k9/HPC2O4MfjVGSA39kBVnay8VSmGmmR64UizqU0fhwgTbRD+MPJfb1ABtsG
         I8tSnjG95gEAaDqjXEN8OnRLsd08SdF8VLJO3HaEh3sqtgMIT4tA6CwTebFtO05JX5rL
         4kDedf63KTBrruY7HI9Wk3ZlX1mEf7VGwV9keuCdKK2crEqNkjiDPi/go8JdKNXAqFil
         QHZD48NZNIHqOARl/w50NfJYXAgLwUDD+Abn94lyxkgLrXanngDluqrfg8VS07ytzAtJ
         xFOH5EiqMvq26n6gtU6G2SZOqJVW1aTNhRoMUnE1gyAxg4Thi4yzTg8YghAnSkZLMQ75
         sM4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="gfj2Nrb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd14-20020ad4580e000000b0067ab410ab8asi3343365qvb.241.2023.12.03.15.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:48:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="gfj2Nrb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w7z-00009o-6V; Sun, 03 Dec 2023 18:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w78-0007Ui-Js; Sun, 03 Dec 2023 18:43:07 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6t-0002oX-9Z; Sun, 03 Dec 2023 18:43:04 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d2d0661a8dso43897187b3.2; 
 Sun, 03 Dec 2023 15:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646968; x=1702251768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0plx2CSfyD/hqodRTCcCQxsf1hkYu3FpLFu5vV8rvY=;
 b=gfj2Nrb/CVGb1zGCsG9Dq5NIxFySNNrOs9ZAitgUd96XStsb2HaYF4zhozHbQ+2tW1
 LaIRVIdnhUkgKRYaSYr+Zkf815yH39CS67gAO0pi/QLKGPDFMXQFb/88oeuI7z5ub8CG
 QBQG3iNDc1Afy7L7THtshHf7XllRSTW/AKIBhmSr0tdF4wYCYmXVq5fqQS5WFfEbrjYV
 TcvsooNwQ7W/FF+jVotllhBLKe+uc+G8o/NBG+POoOR79thbeMQij4q8aiXGL1E3CR6p
 Laq9I3wvIPao6Boz5qN3xeZCB2mxYl/iLo9mRgXfXCW1pA6GsbOd2Fk/j3ueH5EfnHdL
 hYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646968; x=1702251768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0plx2CSfyD/hqodRTCcCQxsf1hkYu3FpLFu5vV8rvY=;
 b=W6o58KSN3d4r4mWXRoNhO0fDiKJnDg9VSsVG852FeSLvQPmxhyEQbQDgk88UCFWlWq
 k8VPBUFo/qJfxdUl6G+YaFcqdi59izLI8V9e/oOi/7SKLPRImWdJ57GLMBkeVsF4L0kJ
 L4P2PnPeocEwEu3oJAIPNw0N7a+jegND0+eG8w4tDgWa1b/OxXnH4E2eYzVLX+zykAYa
 K/XBCouXNCe7Dwu7kluwEY97YLis5/AcBaFk8Ps+Bs2jt8M2k0JmYaIcElZXJCGrYHzJ
 QcK60sw4XUlrbWnHx7Vnc2NAxg8dj3rrvTwsFc1hvAeABR/OvgpGyIhUkbXfbBC7N5SK
 OiKA==
X-Gm-Message-State: AOJu0Yx2H1rYvTSCW1PVfuDFgiHEpG6J0TbLAX26GUISgiyye7m0kkbQ
 QXyRPSAy5b58BFlzv+I7wK4teMe09pR+2g==
X-Received: by 2002:a81:c807:0:b0:5d7:1940:b39a with SMTP id
 n7-20020a81c807000000b005d71940b39amr2815592ywi.102.1701646968718; 
 Sun, 03 Dec 2023 15:42:48 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:48 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 29/45] Implement GENET MDIO
Date: Sun,  3 Dec 2023 17:41:57 -0600
Message-Id: <20231203234213.1366214-30-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7MGzsYiGoJkg

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/net/bcm2838_genet.c         | 126 ++++++++++++++++++++++++++++++++-
 include/hw/net/bcm2838_genet.h |   3 +-
 2 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 56ff6a6f39..1fae3ecbc2 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -213,6 +213,7 @@ FIELD(GENET_PHY_STAT_1000, LOCALRXOK, 13, 1)
 FIELD(GENET_PHY_STAT_1000, MSRES,     14, 1)
 FIELD(GENET_PHY_STAT_1000, MSFAIL,    15, 1)
 
+/* There are two data representations for PHY_AUX_CTRL register */
 REG16(GENET_PHY_AUX_CTRL_0,              0)
 FIELD(GENET_PHY_AUX_CTRL_0, REG_ID_MASK, 0, 3)
 FIELD(GENET_PHY_AUX_CTRL_0, RSVD_3,      3, 1)
@@ -269,6 +270,123 @@ static void bcm2838_genet_set_irq_prio(BCM2838GenetState *s)
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
+    uint16_t *phy_aux_ctl_shd_reg_id = (uint16_t *)&s->phy_aux_ctl_shd_regs + reg_id;
+    uint16_t *phy_aux_ctl_shd_reg_id_mask = (uint16_t *)&s->phy_aux_ctl_shd_regs + reg_id_mask;
+
+    if (reg_id_mask == BCM2838_GENET_PHY_AUX_CTL_MISC) {
+        if (reg_id == BCM2838_GENET_PHY_AUX_CTL_MISC) {
+            if (misc_wren == 0) {
+                /* write for subsequent read (8-bit from AUX_CTL_MISC) */
+                FIELD_DP16(value, GENET_PHY_AUX_CTRL_0, REG_DATA, *phy_aux_ctl_shd_reg_id);
+            } else {
+                /* write 8 bits to AUX_CTL_MISC */
+                *phy_aux_ctl_shd_reg_id_mask = reg_data;
+            }
+        } else {
+            /* write for subsequent read (12-bit) */
+            FIELD_DP16(value, GENET_PHY_AUX_CTRL_1, REG_DATA, *phy_aux_ctl_shd_reg_id);
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
+    /* TODO Stub implementation without side effect,
+            just storing registers values */
+    uint16_t reg_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                 GENET_PHY_EXP_SEL, REG_ID);
+    uint16_t block_id = FIELD_EX16(s->phy_regs.exp_ctrl,
+                                   GENET_PHY_EXP_SEL, BLOCK_ID);
+
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
+                        FIELD_DP16(phy_reg_data, GENET_PHY_BMCR, ANRESTART, 0);
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
@@ -353,10 +471,13 @@ static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
             trace_bcm2838_genet_mac_address(ncs->info_str);
             break;
         case BCM2838_GENET_UMAC_MDIO_CMD:
+            value = bcm2838_genet_mdio_cmd(s, value);
+            s->regs.intrl0.stat = FIELD_DP32(s->regs.intrl0.stat,
+                                             GENET_INTRL_0, MDIO_DONE, 1);
+            break;
         case BCM2838_GENET_TDMA_REGS
             ... BCM2838_GENET_TDMA_REGS + sizeof(BCM2838GenetRegsTdma) - 1:
-            qemu_log_mask(LOG_UNIMP,
-                "UMAC MDIO and TDMA aren't implemented yet");
+            qemu_log_mask(LOG_UNIMP, "TDMA isn't implemented yet");
             break;
         default:
             break;
@@ -452,6 +573,7 @@ static void bcm2838_genet_reset(DeviceState *d)
 
     trace_bcm2838_genet_reset("done");
 
+    bcm2838_genet_set_qemu_mac(s);
     bcm2838_genet_phy_reset(s);
 }
 
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index b9d6d35cce..7a483bd265 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -101,7 +101,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_EXP_DATA          BCM2838_GENET_PHY_REG(exp_data)
 #define BCM2838_GENET_EXP_SEL           BCM2838_GENET_PHY_REG(exp_ctrl)
 
-#define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
+#define BCM2838_GENET_PHY_AUX_CTL_AUXCTL    0x0
+#define BCM2838_GENET_PHY_AUX_CTL_MISC      0x7
 #define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
 
 #define BCM2838_GENET_PHY_EXP_SHD_BLOCKS_CNT 256
-- 
2.34.1

