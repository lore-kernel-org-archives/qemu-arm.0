Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3846305ejb;
        Tue, 19 Sep 2023 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfCDu+/kxd/3PGntGIchWJblR85Y5UaGOAMlLNG30AuuZWUQAWgifmDF0Za22lnxhgXueA
X-Received: by 2002:a1f:c6c5:0:b0:495:cac2:2532 with SMTP id w188-20020a1fc6c5000000b00495cac22532mr899104vkf.8.1695154056944;
        Tue, 19 Sep 2023 13:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695154056; cv=none;
        d=google.com; s=arc-20160816;
        b=DQnFVGYUgDrsXuj0btVlVkHFbCEN45i1mU8wyTAZHMy46daNYfWDo4r9zlI/Ft905O
         l5n1K8tIYuhP/6UCRO8XCLzuYO5FjIUOz9BcVhIQdddooDVTWbpW7n6Fzuoi6DnVARlc
         lMaBmw94jIGCTI0cuMaYnFz/8nf0Qz50i5pDs0Km3T7xvX1oQP9laa2WTFsacAZXkmf0
         b2ZZvNyQFsOQFFsRCl9Gcie9u0nzGEQ39QexpbeOi+uh45Nrxmye5yjXhCSCRi9Pguxk
         Ol3w180JX1TWo6ZPq03ijrYrV6B1mNRj2bfazz3w954BwGu0TjZ5GLjd/mmJDKoNgEOP
         GDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=CHvC5wTahjfuba5l0G0vPMgx/0zA9GANXVfDsJXwy+c=;
        fh=31Pgf1blV3SQPmQ8WOxvGy7Z8ujSo7iGO5C67upv8D4=;
        b=AdSe/6xNx4Pg/kkFXJwLfF8l+RNOweMol78fkKHB4cpeGhXRH/yabEwqDykjminq6+
         O/LJ9OrDAMmCCyTld5jEMxc5PhUFyRtCuIjFkRe34mQnHv0cfAW9W7D1COnQO4zgumu+
         zVv2sV7zSKFLd9irN2VPv4OBQsnver5gLTzV3KOQnVi+PTxieDbHJmFuBtoYbNN/5Sl3
         6p34efefOsYP+CtfDp64AsMkMi1uz5KtUGqKf3Vz2YNjeTnN5dOa4IvFg+1DfMR0Wfuw
         b4REQS4VJBNTxHaA8IZegXr6jrsIoL4lNMP7HTNOhkl9dcAtDaoDbjb0RBvALWwQLwK6
         7yVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MPKVQ8Cg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05622a1a0900b004069486d302si2234267qtb.535.2023.09.19.13.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MPKVQ8Cg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxN-0005fZ-1W; Tue, 19 Sep 2023 16:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GuEJZQwKCDMcPQXWThiTUPcVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--nabihestefan.bounces.google.com>)
 id 1qiezG-0005AZ-DB
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:14 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GuEJZQwKCDMcPQXWThiTUPcVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--nabihestefan.bounces.google.com>)
 id 1qieyt-00011T-Va
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:10 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1bf6e47b5efso48980755ad.2
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146267; x=1695751067; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CHvC5wTahjfuba5l0G0vPMgx/0zA9GANXVfDsJXwy+c=;
 b=MPKVQ8Cg23N6hqks/7lg59ATRupfDcm4FYPH46pdrpTlPjgHbsj0jCJ6s6ZKuhH8hv
 gA+BhKGpC+4+GsSrlhUW/O+25HkpUcbdIt37D/ncfB/TumArl/WAZYuH+vuLg3I1n1yx
 iP8tHUinNmqnjRnOO/pTTQb8Ay8vHWobjOWnDoZg1q0vKYNJoCTrKxHNixvRzKb2Lfn0
 2yGSWO2Q5Qq0vP2BBKFklgLBB9n2xHE8NTQy5F5U+UNQMgFuNz5pMXXk0tYU4oFJWWE6
 osAs0kNdVK4PCgmslv49+wbshf/eOR360X233kSfRnuIMFnVxgjL/9jzDkHN9zS1j+/V
 VH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146267; x=1695751067;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CHvC5wTahjfuba5l0G0vPMgx/0zA9GANXVfDsJXwy+c=;
 b=h5ZQMs2zUCQoRvfuyk63iTRN3BbI94DYV/SNt3N/hOkM0cWQgxqYzIEJPHf9rhOxwx
 MXdxbxNET1XQxMy7cyZiZw4Q+wp2AYsBJqGPdINtq06put7kz395UD94Hu83M8hS3pZd
 zYFRwDMPX/JPPzQ6BikP6pZAY1Z5CsoAQUEZuO/usbJM4oY784mEv3C1hiD0BGQObdBE
 MEmQ90aCVkREHed9y45BcqDRU+PIkXd55BU0DXIed3iVMNTQBXBRJyp0Jin6LBSjyaua
 tyF5CKaAInvcSgz2IMSSjnDMiT8A0BshG8sRHiPCh7FlLrjdfFai+hbg3KPL0e3fVo7N
 duUQ==
X-Gm-Message-State: AOJu0YzXy/x3G6TeeGw90eoVvRwzipxZTUuKaRO66+4nNi5rlxUQ57To
 SKbFRxTtQeZrAbo/TiDzKYaIJ3b7+Gx2DbXlB/g=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a17:902:d502:b0:1c4:27a7:4e3b with
 SMTP id b2-20020a170902d50200b001c427a74e3bmr2703plg.7.1695146266968; Tue, 19
 Sep 2023 10:57:46 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:15 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-5-nabihestefan@google.com>
Subject: [PATCH 04/14] hw/net: Add NPCM8XX PCS Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3GuEJZQwKCDMcPQXWThiTUPcVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--nabihestefan.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:13 -0400
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
X-TUID: 9vix1dqinCQ1

From: Hao Wu <wuhaotsh@google.com>

The PCS exists in NPCM8XX's GMAC1 and is used to control the SGMII
PHY. This implementation contains all the default registers and
the soft reset feature that are required to load the Linux kernel
driver. Further features have not been implemented yet.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/net/npcm_pcs.c         | 409 ++++++++++++++++++++++++++++++++++++++
 include/hw/net/npcm_pcs.h |  42 ++++
 2 files changed, 451 insertions(+)
 create mode 100644 hw/net/npcm_pcs.c
 create mode 100644 include/hw/net/npcm_pcs.h

diff --git a/hw/net/npcm_pcs.c b/hw/net/npcm_pcs.c
new file mode 100644
index 0000000000..efe5f68d9c
--- /dev/null
+++ b/hw/net/npcm_pcs.c
@@ -0,0 +1,409 @@
+/*
+ * Nuvoton NPCM8xx PCS Module
+ *
+ * Copyright 2022 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+/*
+ * Disclaimer:
+ * Currently we only implemented the default values of the registers and
+ * the soft reset feature. These are required to boot up the GMAC module
+ * in Linux kernel for NPCM845 boards. Other functionalities are not modeled.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/hwaddr.h"
+#include "hw/registerfields.h"
+#include "hw/net/npcm_pcs.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+#define NPCM_PCS_IND_AC_BA      0x1fe
+#define NPCM_PCS_IND_SR_CTL     0x1e00
+#define NPCM_PCS_IND_SR_MII     0x1f00
+#define NPCM_PCS_IND_SR_TIM     0x1f07
+#define NPCM_PCS_IND_VR_MII     0x1f80
+
+REG16(NPCM_PCS_SR_CTL_ID1, 0x08)
+REG16(NPCM_PCS_SR_CTL_ID2, 0x0a)
+REG16(NPCM_PCS_SR_CTL_STS, 0x10)
+
+REG16(NPCM_PCS_SR_MII_CTRL, 0x00)
+REG16(NPCM_PCS_SR_MII_STS, 0x02)
+REG16(NPCM_PCS_SR_MII_DEV_ID1, 0x04)
+REG16(NPCM_PCS_SR_MII_DEV_ID2, 0x06)
+REG16(NPCM_PCS_SR_MII_AN_ADV, 0x08)
+REG16(NPCM_PCS_SR_MII_LP_BABL, 0x0a)
+REG16(NPCM_PCS_SR_MII_AN_EXPN, 0x0c)
+REG16(NPCM_PCS_SR_MII_EXT_STS, 0x1e)
+
+REG16(NPCM_PCS_SR_TIM_SYNC_ABL, 0x10)
+REG16(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_LWR, 0x12)
+REG16(NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_UPR, 0x14)
+REG16(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_LWR, 0x16)
+REG16(NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_UPR, 0x18)
+REG16(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_LWR, 0x1a)
+REG16(NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_UPR, 0x1c)
+REG16(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_LWR, 0x1e)
+REG16(NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_UPR, 0x20)
+
+REG16(NPCM_PCS_VR_MII_MMD_DIG_CTRL1, 0x000)
+REG16(NPCM_PCS_VR_MII_AN_CTRL, 0x002)
+REG16(NPCM_PCS_VR_MII_AN_INTR_STS, 0x004)
+REG16(NPCM_PCS_VR_MII_TC, 0x006)
+REG16(NPCM_PCS_VR_MII_DBG_CTRL, 0x00a)
+REG16(NPCM_PCS_VR_MII_EEE_MCTRL0, 0x00c)
+REG16(NPCM_PCS_VR_MII_EEE_TXTIMER, 0x010)
+REG16(NPCM_PCS_VR_MII_EEE_RXTIMER, 0x012)
+REG16(NPCM_PCS_VR_MII_LINK_TIMER_CTRL, 0x014)
+REG16(NPCM_PCS_VR_MII_EEE_MCTRL1, 0x016)
+REG16(NPCM_PCS_VR_MII_DIG_STS, 0x020)
+REG16(NPCM_PCS_VR_MII_ICG_ERRCNT1, 0x022)
+REG16(NPCM_PCS_VR_MII_MISC_STS, 0x030)
+REG16(NPCM_PCS_VR_MII_RX_LSTS, 0x040)
+REG16(NPCM_PCS_VR_MII_MP_TX_BSTCTRL0, 0x070)
+REG16(NPCM_PCS_VR_MII_MP_TX_LVLCTRL0, 0x074)
+REG16(NPCM_PCS_VR_MII_MP_TX_GENCTRL0, 0x07a)
+REG16(NPCM_PCS_VR_MII_MP_TX_GENCTRL1, 0x07c)
+REG16(NPCM_PCS_VR_MII_MP_TX_STS, 0x090)
+REG16(NPCM_PCS_VR_MII_MP_RX_GENCTRL0, 0x0b0)
+REG16(NPCM_PCS_VR_MII_MP_RX_GENCTRL1, 0x0b2)
+REG16(NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0, 0x0ba)
+REG16(NPCM_PCS_VR_MII_MP_MPLL_CTRL0, 0x0f0)
+REG16(NPCM_PCS_VR_MII_MP_MPLL_CTRL1, 0x0f2)
+REG16(NPCM_PCS_VR_MII_MP_MPLL_STS, 0x110)
+REG16(NPCM_PCS_VR_MII_MP_MISC_CTRL2, 0x126)
+REG16(NPCM_PCS_VR_MII_MP_LVL_CTRL, 0x130)
+REG16(NPCM_PCS_VR_MII_MP_MISC_CTRL0, 0x132)
+REG16(NPCM_PCS_VR_MII_MP_MISC_CTRL1, 0x134)
+REG16(NPCM_PCS_VR_MII_DIG_CTRL2, 0x1c2)
+REG16(NPCM_PCS_VR_MII_DIG_ERRCNT_SEL, 0x1c4)
+
+/* Register Fields */
+#define NPCM_PCS_SR_MII_CTRL_RST            BIT(15)
+
+static const uint16_t npcm_pcs_sr_ctl_cold_reset_values[NPCM_PCS_NR_SR_CTLS] = {
+    [R_NPCM_PCS_SR_CTL_ID1]                 = 0x699e,
+    [R_NPCM_PCS_SR_CTL_STS]                 = 0x8000,
+};
+
+static const uint16_t npcm_pcs_sr_mii_cold_reset_values[NPCM_PCS_NR_SR_MIIS] = {
+    [R_NPCM_PCS_SR_MII_CTRL]                = 0x1140,
+    [R_NPCM_PCS_SR_MII_STS]                 = 0x0109,
+    [R_NPCM_PCS_SR_MII_DEV_ID1]             = 0x699e,
+    [R_NPCM_PCS_SR_MII_DEV_ID2]             = 0xced0,
+    [R_NPCM_PCS_SR_MII_AN_ADV]              = 0x0020,
+    [R_NPCM_PCS_SR_MII_EXT_STS]             = 0xc000,
+};
+
+static const uint16_t npcm_pcs_sr_tim_cold_reset_values[NPCM_PCS_NR_SR_TIMS] = {
+    [R_NPCM_PCS_SR_TIM_SYNC_ABL]            = 0x0003,
+    [R_NPCM_PCS_SR_TIM_SYNC_TX_MAX_DLY_LWR] = 0x0038,
+    [R_NPCM_PCS_SR_TIM_SYNC_TX_MIN_DLY_LWR] = 0x0038,
+    [R_NPCM_PCS_SR_TIM_SYNC_RX_MAX_DLY_LWR] = 0x0058,
+    [R_NPCM_PCS_SR_TIM_SYNC_RX_MIN_DLY_LWR] = 0x0048,
+};
+
+static const uint16_t npcm_pcs_vr_mii_cold_reset_values[NPCM_PCS_NR_VR_MIIS] = {
+    [R_NPCM_PCS_VR_MII_MMD_DIG_CTRL1]         = 0x2400,
+    [R_NPCM_PCS_VR_MII_AN_INTR_STS]           = 0x000a,
+    [R_NPCM_PCS_VR_MII_EEE_MCTRL0]            = 0x899c,
+    [R_NPCM_PCS_VR_MII_DIG_STS]               = 0x0010,
+    [R_NPCM_PCS_VR_MII_MP_TX_BSTCTRL0]        = 0x000a,
+    [R_NPCM_PCS_VR_MII_MP_TX_LVLCTRL0]        = 0x007f,
+    [R_NPCM_PCS_VR_MII_MP_TX_GENCTRL0]        = 0x0001,
+    [R_NPCM_PCS_VR_MII_MP_RX_GENCTRL0]        = 0x0100,
+    [R_NPCM_PCS_VR_MII_MP_RX_GENCTRL1]        = 0x1100,
+    [R_NPCM_PCS_VR_MII_MP_RX_LOS_CTRL0]       = 0x000e,
+    [R_NPCM_PCS_VR_MII_MP_MPLL_CTRL0]         = 0x0100,
+    [R_NPCM_PCS_VR_MII_MP_MPLL_CTRL1]         = 0x0032,
+    [R_NPCM_PCS_VR_MII_MP_MPLL_STS]           = 0x0001,
+    [R_NPCM_PCS_VR_MII_MP_LVL_CTRL]           = 0x0019,
+};
+
+static void npcm_pcs_soft_reset(NPCMPCSState *s)
+{
+    memcpy(s->sr_ctl, npcm_pcs_sr_ctl_cold_reset_values,
+           NPCM_PCS_NR_SR_CTLS * sizeof(uint16_t));
+    memcpy(s->sr_mii, npcm_pcs_sr_mii_cold_reset_values,
+           NPCM_PCS_NR_SR_MIIS * sizeof(uint16_t));
+    memcpy(s->sr_tim, npcm_pcs_sr_tim_cold_reset_values,
+           NPCM_PCS_NR_SR_TIMS * sizeof(uint16_t));
+    memcpy(s->vr_mii, npcm_pcs_vr_mii_cold_reset_values,
+           NPCM_PCS_NR_VR_MIIS * sizeof(uint16_t));
+}
+
+static uint16_t npcm_pcs_read_sr_ctl(NPCMPCSState *s, hwaddr offset)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_CTLS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_CTL read offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return 0;
+    }
+
+    return s->sr_ctl[regno];
+}
+
+static uint16_t npcm_pcs_read_sr_mii(NPCMPCSState *s, hwaddr offset)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_MIIS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_MII read offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return 0;
+    }
+
+    return s->sr_mii[regno];
+}
+
+static uint16_t npcm_pcs_read_sr_tim(NPCMPCSState *s, hwaddr offset)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_TIMS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_TIM read offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return 0;
+    }
+
+    return s->sr_tim[regno];
+}
+
+static uint16_t npcm_pcs_read_vr_mii(NPCMPCSState *s, hwaddr offset)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_VR_MIIS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VR_MII read offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return 0;
+    }
+
+    return s->vr_mii[regno];
+}
+
+static void npcm_pcs_write_sr_ctl(NPCMPCSState *s, hwaddr offset, uint16_t v)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_CTLS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_CTL write offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return;
+    }
+
+    s->sr_ctl[regno] = v;
+}
+
+static void npcm_pcs_write_sr_mii(NPCMPCSState *s, hwaddr offset, uint16_t v)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_MIIS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_MII write offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return;
+    }
+
+    s->sr_mii[regno] = v;
+
+    if ((offset == A_NPCM_PCS_SR_MII_CTRL) && (v & NPCM_PCS_SR_MII_CTRL_RST)) {
+        /* Trigger a soft reset */
+        npcm_pcs_soft_reset(s);
+    }
+}
+
+static void npcm_pcs_write_sr_tim(NPCMPCSState *s, hwaddr offset, uint16_t v)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_SR_TIMS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SR_TIM write offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return;
+    }
+
+    s->sr_tim[regno] = v;
+}
+
+static void npcm_pcs_write_vr_mii(NPCMPCSState *s, hwaddr offset, uint16_t v)
+{
+    hwaddr regno = offset / sizeof(uint16_t);
+
+    if (regno >= NPCM_PCS_NR_VR_MIIS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VR_MII write offset 0x%04" HWADDR_PRIx
+                      " is out of range.",
+                      DEVICE(s)->canonical_path, offset);
+        return;
+    }
+
+    s->vr_mii[regno] = v;
+}
+
+static uint64_t npcm_pcs_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCMPCSState *s = opaque;
+    uint16_t v = 0;
+
+    if (offset == NPCM_PCS_IND_AC_BA) {
+        v = s->indirect_access_base;
+    } else {
+        switch (s->indirect_access_base) {
+        case NPCM_PCS_IND_SR_CTL:
+            v = npcm_pcs_read_sr_ctl(s, offset);
+            break;
+
+        case NPCM_PCS_IND_SR_MII:
+            v = npcm_pcs_read_sr_mii(s, offset);
+            break;
+
+        case NPCM_PCS_IND_SR_TIM:
+            v = npcm_pcs_read_sr_tim(s, offset);
+            break;
+
+        case NPCM_PCS_IND_VR_MII:
+            v = npcm_pcs_read_vr_mii(s, offset);
+            break;
+
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Read with invalid indirect address base: 0x%02"
+                          PRIx16 "\n", DEVICE(s)->canonical_path,
+                          s->indirect_access_base);
+        }
+    }
+
+    trace_npcm_pcs_reg_read(DEVICE(s)->canonical_path, s->indirect_access_base,
+                            offset, v);
+    return v;
+}
+
+static void npcm_pcs_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    NPCMPCSState *s = opaque;
+
+    trace_npcm_pcs_reg_write(DEVICE(s)->canonical_path, s->indirect_access_base,
+                             offset, v);
+    if (offset == NPCM_PCS_IND_AC_BA) {
+        s->indirect_access_base = v;
+    } else {
+        switch (s->indirect_access_base) {
+        case NPCM_PCS_IND_SR_CTL:
+            npcm_pcs_write_sr_ctl(s, offset, v);
+            break;
+
+        case NPCM_PCS_IND_SR_MII:
+            npcm_pcs_write_sr_mii(s, offset, v);
+            break;
+
+        case NPCM_PCS_IND_SR_TIM:
+            npcm_pcs_write_sr_tim(s, offset, v);
+            break;
+
+        case NPCM_PCS_IND_VR_MII:
+            npcm_pcs_write_vr_mii(s, offset, v);
+            break;
+
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Write with invalid indirect address base: 0x%02"
+                          PRIx16 "\n", DEVICE(s)->canonical_path,
+                          s->indirect_access_base);
+        }
+    }
+}
+
+static void npcm_pcs_reset(DeviceState *dev)
+{
+    NPCMPCSState *s = NPCM_PCS(dev);
+
+    npcm_pcs_soft_reset(s);
+}
+
+static const struct MemoryRegionOps npcm_pcs_ops = {
+    .read = npcm_pcs_read,
+    .write = npcm_pcs_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 2,
+        .max_access_size = 2,
+        .unaligned = false,
+    },
+};
+
+static void npcm_pcs_realize(DeviceState *dev, Error **errp)
+{
+    NPCMPCSState *pcs = NPCM_PCS(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&pcs->iomem, OBJECT(pcs), &npcm_pcs_ops, pcs,
+                          TYPE_NPCM_PCS, 8 * KiB);
+    sysbus_init_mmio(sbd, &pcs->iomem);
+}
+
+static const VMStateDescription vmstate_npcm_pcs = {
+    .name = TYPE_NPCM_PCS,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(indirect_access_base, NPCMPCSState),
+        VMSTATE_UINT16_ARRAY(sr_ctl, NPCMPCSState, NPCM_PCS_NR_SR_CTLS),
+        VMSTATE_UINT16_ARRAY(sr_mii, NPCMPCSState, NPCM_PCS_NR_SR_MIIS),
+        VMSTATE_UINT16_ARRAY(sr_tim, NPCMPCSState, NPCM_PCS_NR_SR_TIMS),
+        VMSTATE_UINT16_ARRAY(vr_mii, NPCMPCSState, NPCM_PCS_NR_VR_MIIS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm_pcs_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->desc = "NPCM PCS Controller";
+    dc->realize = npcm_pcs_realize;
+    dc->reset = npcm_pcs_reset;
+    dc->vmsd = &vmstate_npcm_pcs;
+}
+
+static const TypeInfo npcm_pcs_types[] = {
+    {
+        .name = TYPE_NPCM_PCS,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(NPCMPCSState),
+        .class_init = npcm_pcs_class_init,
+    },
+};
+DEFINE_TYPES(npcm_pcs_types)
diff --git a/include/hw/net/npcm_pcs.h b/include/hw/net/npcm_pcs.h
new file mode 100644
index 0000000000..bd4f71bf3c
--- /dev/null
+++ b/include/hw/net/npcm_pcs.h
@@ -0,0 +1,42 @@
+/*
+ * Nuvoton NPCM8xx PCS Module
+ *
+ * Copyright 2022 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef NPCM_PCS_H
+#define NPCM_PCS_H
+
+#include "hw/sysbus.h"
+
+#define NPCM_PCS_NR_SR_CTLS     (0x12 / sizeof(uint16_t))
+#define NPCM_PCS_NR_SR_MIIS     (0x20 / sizeof(uint16_t))
+#define NPCM_PCS_NR_SR_TIMS     (0x22 / sizeof(uint16_t))
+#define NPCM_PCS_NR_VR_MIIS     (0x1c6 / sizeof(uint16_t))
+
+typedef struct NPCMPCSState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint16_t indirect_access_base;
+    uint16_t sr_ctl[NPCM_PCS_NR_SR_CTLS];
+    uint16_t sr_mii[NPCM_PCS_NR_SR_MIIS];
+    uint16_t sr_tim[NPCM_PCS_NR_SR_TIMS];
+    uint16_t vr_mii[NPCM_PCS_NR_VR_MIIS];
+} NPCMPCSState;
+
+#define TYPE_NPCM_PCS "npcm-pcs"
+OBJECT_DECLARE_SIMPLE_TYPE(NPCMPCSState, NPCM_PCS)
+
+#endif /* NPCM_PCS_H */
-- 
2.42.0.459.ge4e396fd5e-goog

