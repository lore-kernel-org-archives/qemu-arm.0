Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2043134ejc;
        Tue, 1 Nov 2022 10:16:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/4BE4D2TuPro4UvqZ7INXVlqbh2SP8Jhw3k1a9NTcmdihrNCxnfGaZFN9XbaeltauG7n7
X-Received: by 2002:ac8:4e8e:0:b0:39c:d73a:e7c5 with SMTP id 14-20020ac84e8e000000b0039cd73ae7c5mr15621098qtp.105.1667323004299;
        Tue, 01 Nov 2022 10:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667323004; cv=none;
        d=google.com; s=arc-20160816;
        b=QLchqD4nPcyAFrn/ZXcxH6EIiEHYx5jqJvqn4BnzXPtDjegCNvj98UStiTXZ7MBIjY
         KqNKemt8L0WdW2XvgzrG9tyQDJtfxoz0IlKmZoXPCVs5m74zHafuS3KcOMaizzoCFu6b
         VMvB+pLxBklKd8dH5XpKDfzvhvqubnLmAaZyeMMBvf5QjD62USgjtZzh2L84VBn+O+f0
         e2ObPMsAd3lw/96P7RgHlekEnIe+Rz40pSnLB2u57Y7tICb2bOScbBdWVU+dY/QkuFQP
         KNclPsnsWMS1LOQQr9P5jF9uDKT2A6Q0X9ueO0RUyyi6LywJn84Z+0raYAbKsEEJJBCD
         1m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
        b=F+QMJqAf3EEBrnqePGEeiORTd6CJdh6mnJVVSc2sUxRVpsdMMvDXlQEn+7sc8kq+6p
         o5smGTQlO9QgFKecfDhO6mopQSO4WesTXQvkIw7BRNoxcIZVuszKrRaHeftx57G5JPGN
         ze4GOUtRSme5597bEwpeExzdyU0u4RYvpsdAWeJmgwiogwMx+j9zV9ilwVozXnhVtjrj
         GJ/lEz088uk1nGpyDCo0K9ETNCM4cQc5aMheAtGp/zB95ubnyQcZFn58xNUZb3ToMVKR
         8ZDaMjBliFFLem+Ad4xoin2rAn1C+TtJEq0ucn6TMk62tGGKJT/GpI3gMPW+xTsLOpky
         /cnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FTXuGwT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac86e8a000000b003a533886630si2367197qtv.404.2022.11.01.10.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FTXuGwT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opshl-000740-4d; Tue, 01 Nov 2022 10:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshj-00073d-Jr
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshi-0003l1-5k
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id l6so13464799pjj.0
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=FTXuGwT5H/42DnZN5LxaKpuMG0kHwB4MdPiB6c+WKjKZZs2ofmL92o3h2iWOSPfSmP
 Ig0iyOXTrgsKMqCllpyrgeyL6MJmvpzWVD8hsmayOi2sWgdco1dJjNo+aluEDUVc0grC
 cFtZ9oxwa6X8csH9DYOT1Uwu80KeoEezjTDF/+/2t6gw102SwqfS6ancekLeVWXDkhwn
 6V8wbbPv8b3NoKIuY0yJE0f76Lx5hFO3PSlsFYH4dktERoOqJNiwoTvesC5UQvSlygTp
 uwZtVWH6v/gCWirBdzIlgFiOXHeMrqsyIv7YXsrf55MoFJ4FPxdXyVYrufccJapSDa5B
 JOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=6Hev94QZMFCEtnzrNH4S8KBtKPlNNWvuTIIiuxHN5kWyLpZa1VKAL6V/V4YnFvQ5GH
 QRgRsSehPazl1ul2kdj4IYRdOaSRS/LoZOsB21L1wOFoONC0VqkCGdd0VIF7mxllZsgC
 4JIwoj0iPPoerkg6O400+xYwDynfnxxX2f2W/fx49VsAh77sE1Oz+g6jNGyZlXoHkowv
 zLsvqHQdqI5OKMj05Kgeza36FgtdFyLzCz3O6468zQ4Uoq1OCoExrvR5MRNrkWb0rKkO
 QiCFaJGwUpf8onQR8YnIx7bHRQU8BDsfqMQvFIhrxbECjzDDuPRPyGc67RkYJQOfIGvL
 1h9A==
X-Gm-Message-State: ACrzQf2VKG5XLXiERENmxhZoDcBJtSpTj+4I0rXj/1kZRcFMEyv1Zute
 g+sleJQmjME4ND4bbcToEWIH9w==
X-Received: by 2002:a17:902:a707:b0:178:bd1e:e8be with SMTP id
 w7-20020a170902a70700b00178bd1ee8bemr19943174plq.167.1667314644778; 
 Tue, 01 Nov 2022 07:57:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:24 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Tue,  1 Nov 2022 23:55:55 +0900
Message-Id: <20221101145558.3998-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: YQ9c7qBw8ASB

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/pcie_pci_bridge.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 99778e3e24..1b839465e7 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -35,7 +35,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 {
     PCIBridge *br = PCI_BRIDGE(d);
     PCIEPCIBridge *pcie_br = PCIE_PCI_BRIDGE_DEV(d);
-    int rc, pos;
+    int rc;
 
     pci_bridge_initfn(d, TYPE_PCI_BUS);
 
@@ -49,12 +49,8 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 
     pcie_cap_init(d, 0, PCI_EXP_TYPE_PCI_BRIDGE, 0);
 
-    pos = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF, errp);
-    if (pos < 0) {
-        goto pm_error;
-    }
-    d->exp.pm_cap = pos;
-    pci_set_word(d->config + pos + PCI_PM_PMC, 0x3);
+    d->exp.pm_cap = pci_add_capability(d, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
+    pci_set_word(d->config + d->exp.pm_cap + PCI_PM_PMC, 0x3);
 
     pcie_cap_arifwd_init(d);
     pcie_cap_deverr_init(d);
@@ -85,7 +81,6 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
 msi_error:
     pcie_aer_exit(d);
 aer_error:
-pm_error:
     pcie_cap_exit(d);
     shpc_cleanup(d, &pcie_br->shpc_bar);
 error:
-- 
2.38.1

