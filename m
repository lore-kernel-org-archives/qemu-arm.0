Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26ECCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIm28-000187-W6; Tue, 11 Nov 2025 05:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIm1P-0000qd-M6
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:54:48 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIm1M-00054t-Ef
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:54:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b70bee93dc4so554464566b.3
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762858482; x=1763463282; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y957JedXXz51HxEYpkd5rXFo9PIx1RfbJT3kt9mmiO4=;
 b=wjx4iNfRLnrSYKVPtaZoR99U7NFD6a1cKo8SRchfxA6n/TbWuj1nUzhfYBogcS5HJf
 7q4NjoIUEowGkHfN9In5QVYk1LhxhiheL/17ZEPQIESNeDYGkuAxV4K4KUt+enS7fo/1
 KX6Ga8sU3OBLujWDhVdhKsTVbue76WYyVrGP2GK/4NqFj89HPYlNqVZ3Xb25h8d4lVM5
 V19JJsp+pjuOSgju0ej0EOf2f0IPHnAdXo2p7CVcmdjoN1L8KL7KnpnLMKOXiWU2lNmB
 roG0H/0Pe2UI/hdqMigHEy27EY614JaNRw7LqtY+MoAVcxwrbBFJ6liO6rz39CAvw53/
 kfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762858482; x=1763463282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y957JedXXz51HxEYpkd5rXFo9PIx1RfbJT3kt9mmiO4=;
 b=MCuwrzI3+ysVUs3+fGRZM5uaYbV55hWqGG1hqmjNShTfeuergFSEsR1rPM+a9N6NQS
 LkM9ZHF91egtB7FMroku+v4UyJYG1AzOnrUZdD4NOxYqyKcnaCfgVp7uZ3pu2CXdeAiI
 Dw2WP093VFPcOTGCGjBxbfD1UrgcRPyiuorMXv6ntsPHCL8ktrv5dSWK+rBRIF5o60v1
 Od+Dw9HybGAkUBuQ3PCz8J8BJO0xjclahx6gf4s9pTLXtQwu+GTqk1olkjrvHn34oFUC
 dDYiwPzlGYrAPb3flREK9Alvdu7HtliiDy1xtCaBV9lRxt9L0v2QSXk7kSfQnFIY3gDw
 rtVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFCT/MCvn4y6VDUccdIvbnPYBfA1ronvtxK20h5Ypkpl3XPG+V7N+UGU03kAK+dRHnhjY55JxCAw==@nongnu.org
X-Gm-Message-State: AOJu0Yzdii8rCwwZKl4odI4aWyCAD/pl/DbB60wPXZCz867/0NbvzJFQ
 qDYtCtNLoV+fkgu22h/gqvgxTkcdhfHlUJXNo8sRZGLl7r86ZECzHFGGNU4CRi7bbPE=
X-Gm-Gg: ASbGncu2xx1qsbOZhejHofSE2YG7p6aObCvbr44IYUdtPEaDmgslf1pcNgoKUPAQzL9
 SxmkCe88oMHS0e+ZffEtDaRLMBE8duXy50XFN1k7L929PqslURQYBwcnQqNxzic2k8KChTVappC
 EicxytmrX0tHva85Iw8mt+gA4p8DrXjs36EwSCgKrKzkrYc09527GuqEFTFCOSgSp8GdoKGbKDG
 FYAelq3svMzmY01Bquw+qoA2+To24TDxLn+3MC5Rj5kaiN/bK3ELAHBj7GmZp5tWTaTDADxdfvu
 4cobhXneDZgRH1tWBeFa/L3Ge0cFOlQO1/jsPV3eNyqfw2dtRHYf6cZ2DdR5bnLG1XL+WKjJq3i
 qwFxCUI/2F1VvDDs2h+RRsdw63XjLuONPTjZHiBVubIv0Lv6kbsayqlRNTuwPRcSQgt7bSbUIEm
 w9/Ro65V3vPzA=
X-Google-Smtp-Source: AGHT+IExVkWNHtM5qz3czOCTtjdDS2GyVLjr75WTKyeK8FvEBPdu6wOYT8qFzu8efTqZevIQtgJmaA==
X-Received: by 2002:a17:907:1c1d:b0:b72:b433:1bb2 with SMTP id
 a640c23a62f3a-b72e028b170mr1031959966b.7.1762858482159; 
 Tue, 11 Nov 2025 02:54:42 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bdf21sm1311057266b.59.2025.11.11.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:54:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7DFF15F871;
 Tue, 11 Nov 2025 10:54:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [RFC PATCH] hw/dma: don't allow weird transfer lengths for bcm2835
Date: Tue, 11 Nov 2025 10:54:29 +0000
Message-ID: <20251111105429.3993300-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The datasheet doesn't explicitly say that TXFR_LEN has to be word
aligned but the fact there is a DMA_D_WIDTH flag to select between 32
bit and 128 bit strongly implies that is how it works. The downstream
rpi kernel also goes to efforts to not write sub-4 byte lengths so
lets:

  - fail when mis-programmed and report GUEST_ERROR
  - catch setting D_WIDTH for 128 bit and report UNIMP
  - add comments that the DEBUG register isn't a straight write

This includes the test case from the reported bug which is of unknown
provenience but isn't particularly novel.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3201
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/dma/bcm2835_dma.c           | 19 +++++++++++++++++++
 tests/qtest/bcm2835-dma-test.c | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index a2771ddcb52..e03247796cf 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -86,6 +86,19 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
         }
         xlen_td = xlen;
 
+        if (ch->ti & BCM2708_DMA_D_WIDTH) {
+            qemu_log_mask(LOG_UNIMP, "%s: 128bit transfers not yet supported", __func__);
+            ch->cs |= BCM2708_DMA_ERR;
+            break;
+        }
+
+        /* datasheet implies 32bit or 128bit transfers only */
+        if (xlen & 0x3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: bad transfer size\n", __func__);
+            ch->cs |= BCM2708_DMA_ERR;
+            break;
+        }
+
         while (ylen != 0) {
             /* Normal transfer mode */
             while (xlen != 0) {
@@ -229,6 +242,12 @@ static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,
         ch->conblk_ad = value;
         break;
     case BCM2708_DMA_DEBUG:
+        /* this needs masking
+         * 31:29 - WAZRI
+         * 28:04 - RO
+         *    03 - WAZRI
+         * 00:02 - W1CLR
+         */
         ch->debug = value;
         break;
     default:
diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
index 18901b76d21..4b100480f25 100644
--- a/tests/qtest/bcm2835-dma-test.c
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -105,12 +105,34 @@ static void bcm2835_dma_test_interrupts(void)
     bcm2835_dma_test_interrupt(14, 11);
 }
 
+static void test_cve_underflow_txfr_len_1(void)
+{
+    uint64_t dma_base = RASPI3_DMA_BASE; // 0x3f007000
+    uint32_t cb_addr = 0x1000;
+    uint32_t src_addr = 0x2000;
+    uint32_t dst_addr = 0x3000;
+    /* Prepare DMA Control Block with VULNERABLE configuration */
+    writel(cb_addr + 0, BCM2708_DMA_S_INC | BCM2708_DMA_D_INC); /* TI */
+    writel(cb_addr + 4, src_addr); /* source address */
+    writel(cb_addr + 8, dst_addr); /* destination address */
+    writel(cb_addr + 12, 1); /* ⚠️ txfr_len = 1 (TRIGGER!) */
+    writel(cb_addr + 16, 0); /* stride */
+    writel(cb_addr + 20, 0); /* next CB = NULL */
+    /* Set control block address */
+    writel(dma_base + BCM2708_DMA_ADDR, cb_addr);
+    /* Trigger DMA - this will cause the vulnerability */
+    writel(dma_base + BCM2708_DMA_CS, BCM2708_DMA_ACTIVE);
+    /* Without the fix, QEMU process will hang at 100% CPU */
+}
+
 int main(int argc, char **argv)
 {
     int ret;
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/bcm2835/dma/test_interrupts",
                    bcm2835_dma_test_interrupts);
+    qtest_add_func("/bcm2835/dma/test_underflow_txfr",
+                   test_cve_underflow_txfr_len_1);
     qtest_start("-machine raspi3b");
     ret = g_test_run();
     qtest_end();
-- 
2.47.3


