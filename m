Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006583njk;
        Tue, 28 Jan 2025 02:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJR272ZC3j9YGsM5XCGKyKbJ7Vv5KSK6vKciStGq8vgvatzuw/2LRBHcK8+YxIxJXnmAxOkPqk4A5ykw==@linaro.org
X-Google-Smtp-Source: AGHT+IGmF6LwNGN5EG8Q39Xta2vHjbHcpPgKKRUBnQCV/ssSEXTFgpIINlj9g2tYyHCjTD1hrJ8H
X-Received: by 2002:a05:6214:202d:b0:6d8:ab7e:e54f with SMTP id 6a1803df08f44-6e1b224cf60mr717319676d6.34.1738061270895;
        Tue, 28 Jan 2025 02:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061270; cv=none;
        d=google.com; s=arc-20240605;
        b=B88nsSEdUgBEh1oDG9+qmAn6wMc2tZpNHUCB9TYiQsP9BeDF05O/Tqp9mFsuRaN//d
         dihjCh482tpsR4bljmze31/AZi55tQMXkQYZR+0gqCJfVlcFaOcc63Ta7XqfrDYKc/WM
         xw6S/L9qlwxAZ+MCsfKnJfEjFwzTZulrsn43QJzFKcOru3Sh0IcmgQywvyVqREKE19Ng
         yMQuJZ+N2lrDaovuh+l13sKnGrv+bgHpSY3aV6VaJlkRRfI1Uz68tglGTCZkUPVDr+wF
         Xdj2LsCMkW4l9PYEeK+p+AX4cC3MoT4YfPvRTMDQehEJ5XLchGogMF+nLXJ2J9TIoWAd
         gsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FhOuLd7arurLv4UbtgWbigCBbLZ+aw4LgTQlp527aNE=;
        fh=+G2pS+eHXkXmiTvBmAfp3MHxpcQy3FOKsTHIyiZ8RcE=;
        b=aHaAYfzhVors+nmdfsCifVmYkpu2R59OFSLuzMoPWmuTJwiZKHddDEKdfdj1+mJMly
         tFIK5gPPVExl6+wk7o6xj7e3k4/Qh0XxAACr/UOcuEtuNlyNhmUa7f/Gxri6PVlRV6ST
         XOSOViYpFooECJf+90SABDAUP1uBelzXNfoxMCc7JosXzvywDu3BOmJWPGkndAGSU2FM
         58AyXuDpugUCvbVr1uPyt/ns9dWrfNAN1KgxESgWJgtCpBuShfivNXAQUBNOkiJXnb+T
         j+iujUNNYssldK5YB0TG+HkqASUGflQ8LVAkuOYOChL4mg1LvuRcw3pSTL8FsVRRvgaS
         vKZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNR6j+jE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df61c7si120780196d6.236.2025.01.28.02.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNR6j+jE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcj6b-0001Ja-0Z; Tue, 28 Jan 2025 05:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj65-0001A6-SF
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj61-0003XX-Kr
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so56008185e9.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061127; x=1738665927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhOuLd7arurLv4UbtgWbigCBbLZ+aw4LgTQlp527aNE=;
 b=QNR6j+jEMTAB3Ey+Ulztu9arK5Px/zlCCaMFuRL4dOc26EC3/1IY3CmfM7Hx+1m+qX
 8sJoCqLIRnGNvzobko0OnmxLYyLtkpIgPZtv6hR3KSn96+8IG8WBIL6ABvbXwwWVanty
 VnG7jbCA19jTeiLIpUnkQ+Q31bSHn14kQIHgryBeXZWlzbhuO3IUiMlNIi0Nv9wXRW9Y
 JUb0uH3jh1e0Unryi1kPavNEIlTxXEzbnkGBCPllJgyXuVwcVoa9UUFKmlRvktWVSsEG
 BGoUqxDW27cppTqOA7n8GFXT4vvwm4taNfoZJkx7X7LKU99+5Y99XI+NJyae6JwbpQqU
 ZckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061127; x=1738665927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhOuLd7arurLv4UbtgWbigCBbLZ+aw4LgTQlp527aNE=;
 b=haris+aavy+En1/X9MmgCGJiMHBzE6J3OujrdlnqsltrdZHeXXzF+n4z+SkhuLNLs/
 /u1Oe0e6YNe4thpi8f6+wxbNuhKTtCLw4oD7BtuhS2JE7Re9cqQxEizRSRMmhA6EWjH7
 YDNTFP3223+wxeZ7X9A+n++7IU/YouOIjeFKBEv2oVjUYmLmCLxUAefh7Nwi9k13vOQA
 ruBUOXl2m87rRDdh4gzCHE7k+flrSxofoVjwlwcNeJkxJah6I2lZ7Ieaf25h59xwKzzr
 nZzO6vuL8yMdA+bFbEW1mjzUplnvynkPb0g/PDqKOb/1q4EGWLuuKpDBGB/A8jBJJSmD
 7lNQ==
X-Gm-Message-State: AOJu0YxGbdmoc+q1ne/gaOt7vNFjXlqnJEdcQ5gAowy4GCEuqvn7jYOT
 wsb25k+UPwT1IvQrljnagjAuLyH4dpMT8MkwoI340EOKaoOxVZRRqZ+YDsLS3nmia29Rihj2Svf
 2
X-Gm-Gg: ASbGncunbdVxamJiHMv/Yxhyra7fLHCqwiDrMDsalCEpSLtkC//atOh+njX7rqOCWrO
 rNjobQEomF8o/WDSWl8nDYuLZid8PzLExuErrhcYGH17u2aWr/BuwDY0r59mTa6Mdnnh0KIlFSi
 hcomWrJ+95dqZxxflofX+4dOiAR7YaFY5g/5czE9BzwpYw++1q8YbAvX5HL4PvBHs95oilnxVEh
 S9xjhg3tcHXCbxIrrz2P/6RYcus9lecbHV5eEnOakJ+6txDQNfSLHzGZHtOdawJue9W6yBdRhIM
 is65IDYQmlxe0uBgMQ/5
X-Received: by 2002:a5d:64c2:0:b0:385:df73:2f18 with SMTP id
 ffacd0b85a97d-38bf59ed533mr51002112f8f.51.1738061127029; 
 Tue, 28 Jan 2025 02:45:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 05/11] hw/sd/omap_mmc: Use similar API for "wire up omap_clk"
 to other OMAP devices
Date: Tue, 28 Jan 2025 10:45:13 +0000
Message-Id: <20250128104519.3981448-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: jihHKHhH8FNJ

The approach we've settled on for handling the omap_clk wiring for
OMAP devices converted to QDev is to have a function omap_foo_set_clk()
whose implementation just sets the field directly in the device's
state struct. (See the "TODO" comment near the top of omap.h.)
Make omap_mmc do the same.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h | 3 +++
 hw/sd/omap_mmc.c      | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index d20c55a8957..7cb87ea89cd 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -535,6 +535,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(OMAPMMCState, OMAP_MMC)
 DeviceState *omap_mmc_init(hwaddr base,
                            MemoryRegion *sysmem,
                            qemu_irq irq, qemu_irq dma[], omap_clk clk);
+/* TODO: clock framework (see above) */
+void omap_mmc_set_clk(DeviceState *dev, omap_clk clk);
+
 
 /* omap_i2c.c */
 I2CBus *omap_i2c_bus(DeviceState *omap_i2c);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 46fdeac1121..fcec2899afb 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -583,6 +583,13 @@ static const MemoryRegionOps omap_mmc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+void omap_mmc_set_clk(DeviceState *dev, omap_clk clk)
+{
+    OMAPMMCState *s = OMAP_MMC(dev);
+
+    s->clk = clk;
+}
+
 DeviceState *omap_mmc_init(hwaddr base,
                            MemoryRegion *sysmem,
                            qemu_irq irq, qemu_irq dma[], omap_clk clk)
@@ -594,7 +601,7 @@ DeviceState *omap_mmc_init(hwaddr base,
     s = OMAP_MMC(dev);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-    s->clk = clk;
+    omap_mmc_set_clk(dev, clk);
 
     memory_region_add_subregion(sysmem, base,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(s), 0));
-- 
2.34.1

