Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006286njk;
        Tue, 28 Jan 2025 02:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTVur7YwL5WXBgOydVBx1uKoZJZ+HHPgmomF3qUFWHadx2kkGpE4ZdtKvLm56gYrLZTrd+ttIBJXlRew==@linaro.org
X-Google-Smtp-Source: AGHT+IFi3RpG2t3E+cxC0fu3j0yX/z+0ZhtmckhN3rgtvdSBaWKDegPAlbPVnpnH9XyUo+/uPRl1
X-Received: by 2002:a05:6214:2301:b0:6dd:d24:3075 with SMTP id 6a1803df08f44-6e23683c370mr36838386d6.17.1738061228081;
        Tue, 28 Jan 2025 02:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061228; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6Ro3hEbFW8biPAXAsDP6hZvy8m01GeOZWDzZPIK8HHI+Nkvp7+i4Hym6W/G8uoVPb
         O2UlCB4LyEUmzhiPQbSSD4AFdH0wxy79qdLWBgFAegVWJx/oFpoY55nEuWHyHmdB8wKw
         4LelEOabbAAMGBitKJLNtE68a8lWOwtFKyYxg68uCYIqZu9gWXa+e1gPDwJ4jfxqzvSl
         Qtf6SWZYAO0FMPcBfx27n2UnezjzLA0OLyMF9JgVzEvEmcf5dKHrSuYoB3emybse+iYG
         h9FkbPSCDEzhb9wDBXzJsS/1K8cs3JMz7N8IqimkOvnG1BVwW+GQHMtBcZ0btcLIHuzP
         1lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ane9GQydmwnJiMFHOBDXlrUGP0wnx1nfccZAfAb02YM=;
        fh=iNu3zBea76qsVm5UohrA32BfuEV6u21xyiqdNBRHJME=;
        b=QlviwMdtVJGu0ILfuEJulYIJyV1gKZpuagehbmAiLDTxypUUB7+YaLrGRukuWlowwS
         IZ9NOblmFunNJ/r/VRaBQR6ngmgfwPO5gCEFIO1g69UjH4qVQaygKUGQ9zRx4O6vQiVs
         EL8+mqHEbn0zAHNUz1ZqOPs5jppuTaqbC/sH86nehPkQk7v3ZaYrBNn4naWlt1gVQmCe
         wg3Ccc4QANTJYanmm3byQcxIC2jvE2GwN7+sDR+7+FGWXKzRIR4tpx2EeM3QXg2XpC8l
         ow7NvQB9P54+hbN8Ge3yZ4TEtm3KMExOa4+3M4kcbp9JEzwhAYAdH/xO2uDD9qrxsSEy
         yy7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cCXCqCJ/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba57a9si116474441cf.556.2025.01.28.02.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:47:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cCXCqCJ/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcj6a-0001Ik-7P; Tue, 28 Jan 2025 05:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj67-0001AG-5F
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj65-0003Yf-C4
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso2720594f8f.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2025 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061129; x=1738665929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ane9GQydmwnJiMFHOBDXlrUGP0wnx1nfccZAfAb02YM=;
 b=cCXCqCJ/e1UWsRMmFPudHZWLExXOMug/UKklTYM9PaabZTSaiUylVkFZPntU5Qp2Zq
 VcIXhuksyMQ3F1A3QIKZ5RhxfEsDX0yCAEMFx4exOzYXu5vk9w87ef2Y/T8BvPyV9ubU
 UAoWtnaX5t0ngM/VS1KEv367waKbcZdGE9bQI0366gouE8oFvTLYMnr/eh0oi+cv5l5Y
 Iwehg7jUrwYqguGfBTSIRQQDFeIAeAfFOHrAGTsmic3eAV4U3LGCKoq13v0rsK5NC8yn
 Y5z1Kg5q7hz2gLVdGoHet3B5H+cUm3syG8Thow/AaXp8UzmOENyImuqdGgXS0cZG6zZr
 aNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061129; x=1738665929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ane9GQydmwnJiMFHOBDXlrUGP0wnx1nfccZAfAb02YM=;
 b=KiVHSopMer39YrojyQF5lMjYGBNT5P8Ivd+JO4swRVIGo963HXW0PBUnVoN6be/PW7
 bV7I6Q8dcFr+lU3iDalickpUt5DfyEasJYhWcv1OdyQFWIaquMijJGSw/XqP+jUV5Z3l
 EfTqGmo3erPRWlOZ39FcJAyKGgzOl8OsQ2IoHluFCyYAw8yQkqfboc4ja1RXqusmwyqk
 nOa/WjCsmffs9es+RLpXXBACjeDevuA2C9xH1WxnakYaLvL4vd2ceQ1jKEvktyoq/CgW
 yNqaHEXUt9L1uWYnu0fgawqc/Z99ct+tgPOcCI+qytx7vYqLg+pkO6ssEKU8bbeKABj1
 rm+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVELrU4D/5RBOeTdgADuwRh4ULnD1BYWcFb+yQdHiOmMYpivG5WA8WTO4LXirNWhOaMdhmZkaU2j/FD@nongnu.org
X-Gm-Message-State: AOJu0YyIxRJ/mMnH+g7vIZuuctAdT8Yb2/r0mOvDSLajJmlzvsAWAH5e
 svZ8n2cQk9efCwhNLGtelp1s1VkHh2kRyxmd35XeGnqi81x+nzHHpVzILc9kMFg=
X-Gm-Gg: ASbGncv2NeiyeUsohzJ698NQcAMiJYkShaw7PCigQ6KpXldebTJcb4tBRXXgbZbskXe
 IwxIRVcNrW0kx1L3zxPqV9OQ/kcRjte/QThBOKSLeb8XTbc0MFpAv/iGoRkcC1QPZ6CDGvZz4WD
 wGvuq1g2iSu6svZlf7HcuUWSh0XDnkMwR++3r9ikqDMZ1561MsXN8hh2pURJpHp0cIdI+0VrkTZ
 P+JKllJ6734XDzw+ua91FH8X7wqqAmB3ZKLmouQ7J/QGDv+HwoTF5oErb8ILTM9/7oo2Mg4GJ0L
 gS1dRiKJz8zOeXhk4YBB
X-Received: by 2002:a05:6000:1f85:b0:38b:e32a:109d with SMTP id
 ffacd0b85a97d-38bf59e1d83mr35900134f8f.34.1738061129221; 
 Tue, 28 Jan 2025 02:45:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/11] hw/sd/omap_mmc: Remove unused coverswitch qemu_irq
Date: Tue, 28 Jan 2025 10:45:15 +0000
Message-Id: <20250128104519.3981448-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /XvX6y2DPzFF

The coverswitch qemu_irq is never connected to anything, and the only thing
we do with it is set it in omap_mmc_reset(). Remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/omap_mmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index dacbea13aad..07d47421bc8 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -35,7 +35,6 @@ typedef struct OMAPMMCState {
     qemu_irq irq;
     qemu_irq dma_tx_gpio;
     qemu_irq dma_rx_gpio;
-    qemu_irq coverswitch;
     MemoryRegion iomem;
     omap_clk clk;
     uint16_t last_cmd;
@@ -325,7 +324,6 @@ static void omap_mmc_reset(OMAPMMCState *host)
     host->transfer = 0;
     host->cdet_wakeup = 0;
     host->cdet_enable = 0;
-    qemu_set_irq(host->coverswitch, host->cdet_state);
     host->clkdiv = 0;
 
     omap_mmc_pseudo_reset(host);
-- 
2.34.1

