Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1201352ejn;
        Fri, 28 Oct 2022 05:29:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yS8bjzvOv2jIyuS4sUBP4XG1gQ7WQR6ijXic9bhjIPpn1NjqxjtulXu6mR5xpCWSlds+L
X-Received: by 2002:a05:620a:40d3:b0:6ee:b63f:7ac1 with SMTP id g19-20020a05620a40d300b006eeb63f7ac1mr38472059qko.718.1666960147583;
        Fri, 28 Oct 2022 05:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960147; cv=none;
        d=google.com; s=arc-20160816;
        b=FIOKxDTUQTXfsa7D4dBaRKrcH7PkabM48uoozWyl1PtTUUlSe+ND9HXUUdmu8X5tPX
         zkBy5ECdXjGAGRiXAMrxNeMKangjze8020Z10zjzj6O6Sdh/rx3pEsUb2UUXMWqednKm
         r0KcnA6SfYITAcn68HzP2k8z4FMr5kn15VsZD2/N201JyCnJuqTaPIArdAgcRHkGZ/YO
         R5zYjJmZoJJxZBIaEND5zu047Fen53nqoDFYZpXg5S06ddmnFJf06mZ3Il4QAaHf1hvg
         v/e6kyK2Y7u8uTjYVWCv4MIvyqTcXSe7YFPUFlkOpsj4B5hJPmZ4fQXQJB+Qa19JH46P
         sWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
        b=RoV1vgg6I6/FWzYA9buLTAriXcYmz1bFWwzgJPa/+JjsCw1FyUVJ8wGmGxMU/4h079
         aP8SDRuKG09R0zbWX+g5/4vrZljAVYn9lXrm5EkI0y9CH023FHHxN5y2Wp/eWLyZHk5N
         G+XXJczfUIToEI4FnKKTAch8MdRnHf19Z7q845g5yKS/U6r2feZYemMP18ZKUMar8oDf
         bBH81i/t8tCbCWuIoHu+J1R5M5WOL7hDWcqNHEHvXXJ+CJgn8sAN0h8EcZMnOWpowx/6
         moWPonNk+CauvQQY96i399n22psxFKXwauqxZ/iXOzCwxi/y5hlnszwAIAkKLoRi6a44
         acHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=r7iHbvoY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ac866cc000000b003a50e0c4d67si237741qtp.499.2022.10.28.05.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=r7iHbvoY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOTF-0003yG-9E; Fri, 28 Oct 2022 08:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSJ-0002u7-Ln
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSF-0003MY-To
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:21 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b185so4659617pfb.9
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
 b=r7iHbvoYfpgJFY0uS+xt/UWMubLSvJJa5fQaEY5F8lAIKsQfTZFW7B1qvQ3iIaDQoK
 ORsxEWGGDXzgu/qKoZKDcJPDVmy3UXx5sA+i+LGcN+YCg6JBPU+hdwo4jOXcF02Z460g
 h6Oe7fXGCdBZzuMtYaE9g1WuSc80r1oX0MfT4aJhMnqJNCK5a2e/JohAyQIfw/Sc5oC0
 VDsQBn6ufN3nifmcekHFthpRNIFRrBhpFeiW+MPDAtsBMXVDDI933GNryZHTjk8GbVfQ
 zvw8wY0xmpi1Zd9Ojaa/N4zvZ4oNaBTrQ1rpM0GAJ8lfRN1nS1o5PEw0C0W2BImtatDU
 drmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
 b=00Z4MWqE4j0wRebhBldZZKu7L83HWP9rX1rm+c6S/OGoj1PJaYkHD83XZ8G0XFwMm6
 /Uf5YKWfBTlo/lrmQfTjtc3HO4PGaZHevEU73QaB0r80zxkPwWz9Pv7VkIHBvDtiXUH5
 pJizYjnV3eCN2YH7dwhj5+Qtydc0tUAAIwQk8UdhYen5nQFixWiBsCK5RFHLhrFUSFTL
 Eh6iY6Bfz3i/fuoRwRbh5aGB84BmlWHQR3/JYEmYoeoHrknn4VkHIzQnvjqNy8lqxfwT
 q3E9k2XdP4hqf8xXIUl9w+wTDOf+UMSdqpmWzqy1QQVrFIrzO2KD8x5Qxu3RGBIyfj6P
 ZDSg==
X-Gm-Message-State: ACrzQf3bIx6lWmKIcGpd5lIkN9MDFF8Paiyr6aXSzG+Mg/iaKS4/HuXL
 U0OAYBd1lfkQO7R88QudwZbWTQ==
X-Received: by 2002:a63:90c7:0:b0:46e:c7be:16e1 with SMTP id
 a190-20020a6390c7000000b0046ec7be16e1mr11895818pge.296.1666960038281; 
 Fri, 28 Oct 2022 05:27:18 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:17 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:19 +0900
Message-Id: <20221028122629.3269-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CE/1jH7awkeg

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..ff4e2beea6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7325,17 +7325,9 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
                               PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
 }
 
-static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
+static void nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 {
-    Error *err = NULL;
-    int ret;
-
-    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
-                             PCI_PM_SIZEOF, &err);
-    if (err) {
-        error_report_err(err);
-        return ret;
-    }
+    pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_2);
@@ -7343,8 +7335,6 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
                  PCI_PM_CTRL_NO_SOFT_RESET);
     pci_set_word(pci_dev->wmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_STATE_MASK);
-
-    return 0;
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.37.3

