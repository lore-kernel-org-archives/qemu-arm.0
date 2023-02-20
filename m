Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2106122ejb;
        Mon, 20 Feb 2023 01:25:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8yIYmEE945wRWOqdUPpPRKP6CA+eFXvw5pHQhqPfCVIXgdU6Fxw6D6qmVYQg4ISEHl4b5i
X-Received: by 2002:a05:622a:1818:b0:3b8:588c:40e9 with SMTP id t24-20020a05622a181800b003b8588c40e9mr15264237qtc.19.1676885109445;
        Mon, 20 Feb 2023 01:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676885109; cv=none;
        d=google.com; s=arc-20160816;
        b=Hp4+ClWognzNMIphf8cooV2Cg62GZK9xK5MHZt+kOyqg4IrFg2x8EX90/srgjRUTUj
         epPfPDkZyWRImiBwjOv6V+SpdNp+gXIm8vT0On5TYVvWMuzceADT42VAVJgnm0rZT7rc
         ulPGb4bP217X916yGwGsZ0AO7PZcE88eRpABe1D8/Ogyn6szP3+JMJVNVTIY410GdiDH
         BTAgLpaPUCQ+jki+rYgKmzDpmDiQ6imnlBg4nSxqODTUvRnAB/EXF6iZa0vK09fb7oOC
         N5RjAJPS3WfFiADwkZyqQbemo4S3iqkNlHUiyNnrWZbjMnVfMytocqbUsODAoVbhZeSG
         ltJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
        b=zXX3BY6gys8UJNsCcBuNE7WTnALlAf0XG1alhqGhd7osOtaXEoqI6Xf5j1I+Jj1Ht+
         A7u+emKNwpgKywqAGf+UITFRRRnEy5Q+e7uiV2OFNdq17MU6B87tNV0greqHrsJPS6Xi
         txSd71LtXit0fMH5+GQDDbdrjckTbpGsNe8CxtQiWBt/v8xQQJsnYF0DcEAcAL9GvwWa
         eSsD6T2/BlTcKoO+l7UZfvJl1sALp4kvSG7zyPMXng2vWLlwts8Z9t7WTti5I7dLdtyc
         PAPppGtYbUbXBTICR+0glpmpQBpO77FMNSSO5qM5ow6Y9EU3PYFtKg3f3XRWZbNts5ro
         HVJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMKuljpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30-20020ac8459e000000b003b860983963si216398qtn.207.2023.02.20.01.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:25:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMKuljpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Hl-0000GW-6A; Mon, 20 Feb 2023 04:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gt-00079p-Kx
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:44 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gs-0003nx-1H
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id p8so470815wrt.12
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=iMKuljpnZBJ7a/EDsmZR4NisF1RKjfx4bI6aAVBclwO6/ZEGdJ2XasXkRfdhlE3Tmi
 TWWM4iXx96COyPQZLyTeMeVj5R35MlqIgPGc3S68NtjLqUrEiCk0/A5af9w+51UWlHwl
 jO45PJK99CbH5QdiMz3GDKxHXMlyFOg+hzK6rk+O3FOlOR3hLbz3h6SX0oh1aygo8HE7
 cLhFpqSypDd8KPG38NXtCtvm5fIJ2eOqcRC8BLltwCHokiaTaqH5cMxPLTtJqWEYXeIN
 Vf1MRk57fSsr5wxDGKPwJc6/6pjM+TfxrPx05v+P/rg5PoxhQMOG5/73ryeOmze3gXG7
 s2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4M2DzovwtGl/lACfMl2//Pyf/dMcjW1q/+QzA0NgGAA=;
 b=fvdAgrAxPON6uKBxhxOyfkoftLVeFlPeytafl1SQAQEh9rySYW1nLeRT8XBm4b5fNd
 xe3G/DJ3ZnVYk4y6BkOtQ6JO5a+Gekkfnw1JJO3Wgo1x5l1ZCLIio9d0+vN0VwYwJiqL
 m3dlU9pe90I2PREorSoDo1GDaLa+x4dQdV3tOphHRP5rKLuz8fsRZs2IOmWclA991UT4
 EXHTWwMFLL6FHD8yUdU1BIOVIeP997gFLDHP2QtSqbZE+Igqr/FHYMI4b1/Z7YT06/zo
 GEUcpZ3Th3Yv6A9UVq61bfDht1usvmilp0wqogvDb4eFyuz9XY52zP7k+RKrO4p9jhLC
 rbwg==
X-Gm-Message-State: AO0yUKWIrmyq91i+i3iSw0V2VtuKovsAAvRD9IMN2+HQkqFDTtC4MmKX
 aFFtse8plxtI+0Ta8ajqvk9sXA==
X-Received: by 2002:adf:e255:0:b0:2c5:52ef:61c5 with SMTP id
 bl21-20020adfe255000000b002c552ef61c5mr137090wrb.41.1676884541203; 
 Mon, 20 Feb 2023 01:15:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b002c563b124basm1028706wrp.103.2023.02.20.01.15.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 20/24] hw/ide/pci: Unexport bmdma_active_if()
Date: Mon, 20 Feb 2023 10:13:54 +0100
Message-Id: <20230220091358.17038-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ppOn0ffX6yLG

From: Bernhard Beschow <shentey@gmail.com>

The function is only used inside ide/pci.c, so doesn't need to be exported.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/pci.c         | 6 ++++++
 include/hw/ide/pci.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 2ddcb49b27..fc9224bbc9 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static IDEState *bmdma_active_if(BMDMAState *bmdma)
+{
+    assert(bmdma->bus->retry_unit != (uint8_t)-1);
+    return bmdma->bus->ifs + bmdma->bus->retry_unit;
+}
+
 static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
                             BlockCompletionFunc *dma_cb)
 {
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 2a6284acac..7b5e3f6e1c 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -55,12 +55,6 @@ struct PCIIDEState {
     MemoryRegion data_bar[2];
 };
 
-static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
-{
-    assert(bmdma->bus->retry_unit != (uint8_t)-1);
-    return bmdma->bus->ifs + bmdma->bus->retry_unit;
-}
-
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
-- 
2.38.1

