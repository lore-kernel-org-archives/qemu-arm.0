Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1433049ejc;
        Mon, 31 Oct 2022 18:03:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DzIlyFYb1IaT35NxFkt4iMROIdwJPCTTuROwUUa5dCU/5703CcE76iA3bKnfr4nhd48bk
X-Received: by 2002:a05:620a:271f:b0:6d4:56aa:4385 with SMTP id b31-20020a05620a271f00b006d456aa4385mr11516635qkp.175.1667264608761;
        Mon, 31 Oct 2022 18:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264608; cv=none;
        d=google.com; s=arc-20160816;
        b=RK13n+R3/DzexX6jX5S61tCNaGtPQHuztS7oiVdVrouB+9xPEHvxWAkT7mZCS5Si6h
         2jxCDS9lPGMmiPxiFflyVD4X8NlELhPboa8fKdACeU2JyfBPU2EhU3yBAxWEuUMQXrYX
         t7DK2YGgMTRRoFQzrDTVNxpZczBD2+kpv8NS61y1yUO929lHR+Za20HFgGlBC03oyB9D
         BHy7ydRzajer6lcXgIdM+Sxt4m6WF3jruWDD6Da9ne+XjhKS5HQoSu0Sn4vcA1TDle0U
         6y2vKFjaIe6hz1ix3V1fDU2j0M8mxtMxBZqO0855oj7A3H4ksKeUpJz7ntAJBb9Rjn56
         UGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
        b=a4+51pwOnD8F5jjW7Su9N13AhoU4HJn5iwzSfztADbSVRGiRlbTXBB7JCRLTTZxao+
         wdLtb9SIhJrKJR4L/IWQKksVlaPAYFYqVzCqlgfuHHo79s2JzuWzXgNqEHIfpQ/RT1Rf
         x9MFxD3MUwHk52FvHagk/R6BFnnW/OT+cyBn4Lqoy6yEigLLS+lDHqAZPMEhXTYyHVb2
         UdY4d5+gwITMp5XaLRmgCzeUUDvTwZb7/Kf5D1ZHkWBnuTDmIgWoKDxOzlX0x/BvPkna
         jveBR+TQcYMw1DrSUmPAWhvTcyj8AiCFOoNyxKTfvuRvqtljlvaPe8nDSl+Exvpk6bet
         UTQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=0q4okmsU;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a05620a249500b006bdf01b164csi5289187qkn.42.2022.10.31.18.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=0q4okmsU;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfdK-0004c5-PJ; Mon, 31 Oct 2022 21:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfd6-0004P6-DP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfd3-0005wm-Io
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 20:59:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so17445815pjc.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 17:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=0q4okmsU8objBLDM4s21b4ZX1OwJaVSOXamrUEaPOvhz8AlOppaIl9UU32adXVebc0
 onDEToOliTaq7cEbkEcazumkXYIC18eYSCvJy+qIv6c3Zech9Uju1LjcgGzSa+jSoWb1
 eNclF3ItRumc8zMiNL5lG84GkZgvtla5m8/0zG1sR8KeyUCAbrSuwl9vPChq5bjrgj7Q
 ttzkETHrGl8RrsxFGbObr6AC3Un5f8w/CIo2mW+uWWMTzbVqAWUbtREwjZfUUWM/fyOQ
 gBJdJykDSNjf8XgyoIqAgiRBTv1yEIHhePo2TOoA3SpgBAtcTJuipiToK/KtCfjmNc7t
 dLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=8J8LVkIKhmhHey9nUN/ASAih8eg7UNJVtDDqIwZO94ErOYlsLsp6QO/V+MJ4GAv+9F
 MTeMbJqEP57HKUWkStH9FGEyGLoGxHU3LAHDSUFgN8DEpCR4pPHWxjWbW/Wx5JFlVxLI
 FzJIBueapIxFahcpyt7RXAzBHfGyi50wp68PbPbqFB//pqZx4AGQ3aOo9vncz/ap3Tn/
 Y8N0mvtsFvxdPRejlY8cZnjlYq+GUBmJbWhGstL6bWJjIiAwltVDFWAX/YB1X+GhTznk
 IHls0B9dS/dbKOMI0eYmLMKcLFdOR582UIGtGJaHS5Egt5MyWDcq+8k4O81OpQxeAaVK
 6Cmg==
X-Gm-Message-State: ACrzQf29dblkn5lMcGcf8mTooKBDfnQQUgmAX96/bkVJliezuZZtiW9T
 7ngv2FZ/5R52QJfHXUMcbwajlN8XhwBzmqCJ
X-Received: by 2002:a17:902:900a:b0:178:77c7:aa28 with SMTP id
 a10-20020a170902900a00b0017877c7aa28mr16592571plp.3.1667264384071; 
 Mon, 31 Oct 2022 17:59:44 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:43 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v7 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:49 +0900
Message-Id: <20221101005859.4198-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: b+xRk7kEsRXT

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
2.38.1

