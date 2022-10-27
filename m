Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp159548ejn;
        Wed, 26 Oct 2022 23:43:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SN1eG9XhzpiDkqQ76hOWVkmJu62UtJnspjq0VlaQRZCslL96Ci25bjC9vwCrLaR0II0MA
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr34076166qkh.723.1666853039464;
        Wed, 26 Oct 2022 23:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666853039; cv=none;
        d=google.com; s=arc-20160816;
        b=h2DzO4r40OGymsnGON0r0q4eUa/VE6CmUGUT78QITnXYsUMsiweFI4lkKPpC0e1MvB
         L6KwQ25LW+s0bVyinavqZlPp6A/22yWH6xla0TKV5S3mMO9B5zaL8YHDjThsvAU7NIF/
         o5xpTCQ/lGSWg4O/GfoNZKDhpYUEjjzcWsi6zzr+d4LOFiYhjD5EzNRbP2gBzApJm/j6
         GmWYvGbKSoIB8IaJw4QFeR68N8mqNbbkrmivuXSeaVv/l0v7pOp+AowU2R7JPSQegjgB
         v54FIqZJxFtEi6s9VVZ60X6PHLFsCX6SQR1YqHISkGfsz49hl1WsitMT7+p8ak9D0/Ry
         6U0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
        b=DZ8E4OOXLvH88au9EY3filt3521gjZv9keUD3jCEn2MNo8mb1Pq/cN12xaGHeU14+T
         BMQi39/jhV55OCZu8CKyI1dKdyjCPTSaJ0o20YIK1KqiZtH3xgyEPoLrQYMbcaRFfUGr
         B/xw+8klnok4ZoJdZ+d/OkDPrJYndkc8XHdTjRjmJp1zRbifwFT9YZz+SB7wnYaD+TiN
         gW9FKX0x2ML70rUXSv0rG3fcp3/xrtI6IqU7+y0ToSgEKnv9ecKRrolRwuowmpq15rex
         mZlT6ASAx4zsuQ7lJs+LuEiW1aQetpraVvC5834wMvROrzeKY0IpdTn7/wneL9rLaG2e
         2zzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=hiL31Ob4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020a379403000000b006eebbea1eeesi413514qkd.332.2022.10.26.23.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=hiL31Ob4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwaA-0007CP-9d; Thu, 27 Oct 2022 02:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwXB-0005cn-3j
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX7-0003RK-Tw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:32 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m6so624977pfb.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=hiL31Ob4l9g6zwzI1djIpAG1tRlzGFCK8jwREZqOcjzxt2GjBrUZ2qWxr59E3kt9d+
 69S0d+mICtZ1uLnNwxmil1hKx5Uuu8WqMNSg5tW5I2HUiWu/4SDspmk+Ub+qi045WF5m
 z0RFnbZn2plCV4SfmZt8FlN8xsufWXeB7Ai3rQYmVpGqnTdoSHkZFA/CpRRa4yu/TLLk
 9dSCt7xexz3zW/ECAh4/Xk/yrW4ytvrp/IwQWpoBtSOLKsbl2gSoPEc37bmOuf4x56NA
 4zoJFzW3rUNl1Zc6EKrPotUCQY8NEcluphYO1YHxyAEKMxs6g9Gv8D8ZDwjfPj7ObZFY
 8xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=WryCYoUh901e0fTecrj59SHxYZZk/C/uGxsu3P7D1OGC5gLORHOLwo/MXGZzW2XJ5P
 AwjDkm0b4B8xlJ6V9KlIbiQVW/z/m0+DNn+B5LKpvq1p+Z+GA9kwntqqjAyf28KD4Ljg
 gAuytlz8THeRGl12cY9sxqBktg5kJg5oe3ti+A13MzTaj8O6ZLAEghQb11xRX9yq3wTb
 bcjhUFBk6038+nElppDaobHvx/MzJx4JwDPvohhUXcvW0IN1dpN+62nZ4/3Lbnt9L2IU
 NOCzq4wblr/pNpfoexGxMJPZRwEklsDLMN37pD/sCwDmr1aMYXKklgF4scKPRFGaVYYB
 wWzg==
X-Gm-Message-State: ACrzQf1chsXKUP4Fg/xYehByaBm/dQpZAp+HjL14p4iGF7hNp5I465Fc
 8I40bgTo5w+x7XgVWrdheb3vig==
X-Received: by 2002:a63:1e05:0:b0:451:31d0:8c0f with SMTP id
 e5-20020a631e05000000b0045131d08c0fmr40669884pge.227.1666852707640; 
 Wed, 26 Oct 2022 23:38:27 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:27 -0700 (PDT)
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
Subject: [PATCH v4 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Thu, 27 Oct 2022 15:37:02 +0900
Message-Id: <20221027063705.4093-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DhpNC6BJIJ6t

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
2.37.3

