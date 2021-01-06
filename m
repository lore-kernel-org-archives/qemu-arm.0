Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp580504lfq;
        Tue, 5 Jan 2021 21:55:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC0eRUzHL5YnsfXjVu52N75Q/2pmNQ3TcrfNeTcV6hHMCMcf7M4JLDAe75Z4CIRsDtPL74
X-Received: by 2002:a25:690c:: with SMTP id e12mr3879312ybc.482.1609912555636;
        Tue, 05 Jan 2021 21:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609912555; cv=none;
        d=google.com; s=arc-20160816;
        b=y5u/q6bbx73i5kVYIz0APT/OmFA24D5ADccJl6wvMg4ICcgjC8PrDhSBKdw1iOJs5j
         M6XHbdJMoXXr2A1N+95NkopCJqJCKkusa9KceqkIpI0J/R8IYAl6pca8UDIORj+0sejf
         VyJ7IaaOhHhcjGVI1/Zyy4q/6bCHGILGeGE86xbxuR9wJJ+S24ubRCzWfgnS5CaDquwX
         JhOUzUuBCmewtUDQNo7FEiNpUYxYWq9e3VTXsriu1u9SyLi6twbCeBn9OweBiHU6URwR
         bexmN1lQrrpSSwcTUDLAYkuR+kjYo7ukos7AKdrhWSTJLkdDWAr08K1Bo5FQSia3XDut
         QNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
        b=BnfoAk5u2F5b8BZLlNRfixLdssPHrsVNBKdBFy0iQApSL/REhrPzCBZyjlVQK3luAY
         4FqCjL25qGZlPjYzY6hUu4iZdRsITD1qFQ8UQOh/GRJTgg1ra2oisbCYHwe7U5/rIIAa
         O2QUyp6whJywATKleuZZphAHWi/sOnUKmuc3tM2PkLC7fvJQm27SidOgwpYfqLetMpBM
         5MLn3hUBnB09snJWo794zqq5sSBF/5BE0nnBLttBQEJWq7zwjuEPeKcxgxNBrZ8KW2zE
         P/i8ET3wyR2uCoQsFvFLcSXfLEq8uoVfLKCxx/BKNGndihB7/fy3EWmVXjA9tWTtFnPF
         3bgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eVrb6lgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si1865845ybr.377.2021.01.05.21.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 21:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eVrb6lgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx1nX-00051X-0q
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 00:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nM-0004wo-FO; Wed, 06 Jan 2021 00:55:44 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nK-0004yK-VT; Wed, 06 Jan 2021 00:55:44 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j1so1027563pld.3;
 Tue, 05 Jan 2021 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
 b=eVrb6lgnNaInpxjmsSVwlQNsZ1o2CtyuAf/BCDootbP+PO2/JTMNeCwjwxLrhF+MZ2
 9qGpEiZFNAkHDYrTiV/uCTenkQfS7xhi8f/NUIIFhWHKyEbMj2NUOvImD1cWKF8Pi9OM
 S8ffDi8cVcUpFbksaW4WAnQuFwTBugVHUtCi4vQqyaq6GsoUbxQnqnSbLYWEXS0tP1SM
 N0j13l6oTrQwKoeZUFyzDPl3km5nLeBX7wY1zPsMefXpKJUIfpqWkAqDHK2f3YDkKjTv
 feCM24AWhvF19W8xI868fIt4ssmkEnJBGXYbCQ7mFkeXWaI2eyx9HjeFD55sZmGuiGg6
 PppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
 b=dx/Tkgp281audj/2mQvecy15IBp+YIfbED1NBcdkvj/w1lYo4Uw277YuvYrYuxyOpF
 qb5GBlteHUpu1ZDf8rd3YtKnLWH1m5UWgUluRhUb1Biul6b397uA6EbV+L4I9SuRVN9b
 ggePiUm+tmWr1JcSmnDfeGpdNKqPzaIIiXYSfxZpYrzuZlOmmH1a3ULatLDvUL4GavP8
 3+1RSgSYlC/6zAei9YJPwfFygCEqMW1Umv3Sj/JfbRZdjz2Lecf6IAkiPeYcVbzEHzGk
 iYWLZ0KMoa6hnsYhMp6FuJhz4Y0UH52dgkNo1JpbPopjOhg/+9piQbLWnD46IC1R1BVq
 K3vQ==
X-Gm-Message-State: AOAM530Qy1FfuYM0FHqfwVm38Oo7dpa+PApYnc2uRzYp6mhNlj5uiCCE
 tYiNrvQBJn+/1Tv5dvLDWVo=
X-Received: by 2002:a17:902:16b:b029:dc:4ca1:f5fc with SMTP id
 98-20020a170902016bb02900dc4ca1f5fcmr2758401plb.26.1609912541328; 
 Tue, 05 Jan 2021 21:55:41 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
Date: Wed,  6 Jan 2021 13:55:20 +0800
Message-Id: <20210106055522.2031-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106055522.2031-1-bmeng.cn@gmail.com>
References: <20210106055522.2031-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgtHeCRhqwhO

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, during which CS
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..85c172e815 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    int i;
 
     DPRINTF("\n");
 
@@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
 
     imx_spi_update_irq(s);
 
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
+
     s->burst_length = 0;
 }
 
-- 
2.25.1

