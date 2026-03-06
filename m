Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE2BFCB61C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 15:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXHr-000180-4Q; Fri, 06 Mar 2026 10:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXHp-00013d-7i
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:40:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXHn-0000y2-H2
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:40:20 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso4101753f8f.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 07:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772811618; x=1773416418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GdtUZgYJO/AkZ54kOEVmR9jlUu/MzOeYTvNR+pXLkow=;
 b=QiMPnfP84n11YEFWZ3qONNrtKjhqt7ksKbnu6SGRMhCr7i4mvEXcWEZB+Nc3Ay7gms
 uyWlONrudX/8BH9nfPd4EFcZKY1LlESeE8rCaF9p2G3LDdq06CoAKR1e0Cqt22xTclUA
 lnoV+rM6YxzwnwYq+dZwERa1ohHaSEEytKOmo4WkUWeCbnM5ihaHqLoqR4DTXKBiO76G
 kr3mDAzP2ckI4BRbhLks3bOudcecUJWcH7Gzf79miAeN0kEJAZ8OdbWd+ENCUbZRSYl0
 UUwwrheh/Vx5XCPxHE+xy36j/C5DhklhcLdE56JANTOY95wnFppAR+y8ycQOclhqV43d
 casA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772811618; x=1773416418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdtUZgYJO/AkZ54kOEVmR9jlUu/MzOeYTvNR+pXLkow=;
 b=ww7yVh968w+ppHWsfBUAi7EkwTg1l2CJDSM4YBRL4Ext4s3xIeSssL7es9kTn+V81n
 G8poMZlLsHXVW39zjhO6i2F2zckcv0lQIz5HqWyIBsoqEelgoNhsyWmv2g0GRSLnO23+
 qp6Xfwn2Y9DprtmoQpwKaHB7WvbawjBVb2nqXoUevHQUUq/RdvdxwEtcdtte/eN8Oml3
 7Uv3/9+uhfMzXRRfwarekw4IgFrErlHOv4xrdb5Vbj8IvjljqNDyC96/x8LkrPH8Mejr
 vlKoaaK8Sf6iOlP8D/6fJXW4Q5oZuowobTBo2jDSgFtNCeYSj+VDmTznyipw+ng4CEXx
 6ToA==
X-Gm-Message-State: AOJu0YxGtGu598Dj9MSnwcaL/b4liCYYPMTH3Xe7hesdxP3aPMhQ0lYr
 aLAdCbvLpYQQRI9/C3wsOVW8ILBl2VNbzSH8IPqB10qR87Y7OLXjemOMYZYYc290fLhPrJQY/Sw
 BFO6d
X-Gm-Gg: ATEYQzxvFxvNhdy13rWasnlF1jAGUIF2Vn9SvhM3rzn2Dq+T6phssrka4QHz+PwZHor
 6jgxzgQCnnRxLG3rJrE/cIRqQ5vOIr/9ifXeVgl0gwPvJ7dXpHUQI2nccbcRJ3Fo8SvlsfXqPQb
 qa5YaC31FFv32haDaqvcGFnO9gcGi/PrVyPu7kdKohslKW7uVNjzaqcA6A8MEW2S9hnad5u7CYy
 KBzrR7/SSIthNLyQUKyfW69to5Hme0lFyMRDHu2yuBKAXy7SbUJs27CNTU6Iszq4q+cpEb8YghW
 Fc9FIz4dHZK447o+j01M+6H0ZhWxs2OenCkPA0TrCUQv15iqFHKf5bOcmzrTOJCdlFDo7EJE49b
 rRVLoDUH5WpoZW84ByK/sWVxfhKNpIxddLQENfOv+sTscvbqgZVi8a7+/XrRCkhLvdU8E0cUcOv
 ddN0cs8+Z2jX3cZJlhmayYnJIJV5TZdkSMqxrqZkJs+Oox30oscL15VkD/ZM9jE73wOFcn9iP+h
 9MsMnKdFbjI3PbeMTnyw3FfHy1gzjM=
X-Received: by 2002:a05:600c:4ec9:b0:483:7783:5373 with SMTP id
 5b1f17b1804b1-4852697a0d8mr39970575e9.23.1772811617839; 
 Fri, 06 Mar 2026 07:40:17 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852470c258sm17921205e9.30.2026.03.06.07.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:40:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/npcm_gmac: Catch accesses off the end of the register
 array
Date: Fri,  6 Mar 2026 15:40:16 +0000
Message-ID: <20260306154016.2194091-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In the npcm_gmac device, we create the iomem MemoryRegion with
a size of 8KB, but NPCM_GMAC_NR_REGS is only 0x1060 / 4. This
means there's a range of offsets that the guest can access
that don't have gmac->regs[] entries. We weren't catching this,
so the guest could get us to index off the end of the regs array.

Catch and log these invalid accesses.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3316
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/npcm_gmac.c         | 14 ++++++++++++++
 include/hw/net/npcm_gmac.h |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 123fb92ca4..d9902d9ab5 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -700,6 +700,13 @@ static uint64_t npcm_gmac_read(void *opaque, hwaddr offset, unsigned size)
     NPCMGMACState *gmac = opaque;
     uint32_t v = 0;
 
+    if (offset >= NPCM_GMAC_REG_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid register offset: 0x%04" HWADDR_PRIx"\n",
+                      DEVICE(gmac)->canonical_path, offset);
+        return v;
+    }
+
     switch (offset) {
     /* Write only registers */
     case A_NPCM_DMA_XMT_POLL_DEMAND:
@@ -724,6 +731,13 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
 
     trace_npcm_gmac_reg_write(DEVICE(gmac)->canonical_path, offset, v);
 
+    if (offset >= NPCM_GMAC_REG_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid register offset: 0x%04" HWADDR_PRIx"\n",
+                      DEVICE(gmac)->canonical_path, offset);
+        return;
+    }
+
     switch (offset) {
     /* Read only registers */
     case A_NPCM_GMAC_VERSION:
diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
index d4fe49ada5..23b9841a80 100644
--- a/include/hw/net/npcm_gmac.h
+++ b/include/hw/net/npcm_gmac.h
@@ -24,7 +24,8 @@
 #include "hw/core/sysbus.h"
 #include "net/net.h"
 
-#define NPCM_GMAC_NR_REGS (0x1060 / sizeof(uint32_t))
+#define NPCM_GMAC_REG_SIZE 0x1060
+#define NPCM_GMAC_NR_REGS (NPCM_GMAC_REG_SIZE / sizeof(uint32_t))
 
 #define NPCM_GMAC_MAX_PHYS 32
 #define NPCM_GMAC_MAX_PHY_REGS 32
-- 
2.43.0


