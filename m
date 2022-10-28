Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1204370ejn;
        Fri, 28 Oct 2022 05:32:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VKmFy7eiJC6VvX1WBL934mLb2lgM/tDXhg5wCF0MKpxGws+sY6g0SLXFw0rSc9OweOGJ+
X-Received: by 2002:a05:622a:250:b0:3a4:f664:16be with SMTP id c16-20020a05622a025000b003a4f66416bemr8539708qtx.86.1666960370067;
        Fri, 28 Oct 2022 05:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960370; cv=none;
        d=google.com; s=arc-20160816;
        b=UjPUWnPldZ9sgoXglerncNawyj8muFtgdUZWpkThh26LQ3dMQNJcOFHp7snzMjzHaw
         DQI2bDlS+BUmamN7/msHwqq72/aY1KR26fYtJ6/5HVuZjHORPNDonE0+msWzKf59GY40
         SU/ymoOylqkmQ8rJIraL8nFOYD/Xp5xYOn8OxGy5PZOTgJlhupg4vcdqLKWzz8sWmRK0
         SRgsI1rx9u3qNGiXzD/nS1QX3xLP/N+P9/2NArQkyV7V9PpIdRSzl5bWqIK1eqDs2kO0
         7b3TKuKnaIqfPtFZCriyJ3b9a+gkUn+pjIgWYzRm9oOuc9swtJUWN0t75QXT3/ZoiT+v
         zZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
        b=tuwlTZQl6dSmXbcFIN2UceMaPaWiXbyD9dRetRFqRp3UhGxVAfDH3VQ5FzBjwpjZXy
         6+PER+lPJc5JHGWp064+Ivy8IDpOHqgWBAFBtRD+EAz2ely3wjDWkD2x+WTvW1JCodCT
         1Hy6jeBGzKT/UjHpZV6vKIiuozVLkNLe99fPQmGahZAzyT0FoKQUZ/ldj8JLQnGgqRSo
         XaN736KWrZHn6gkrA1d17oxl6drXt5ovRob86OxEpAYeaZe/mYcHXsczwL4F6kbNYOJg
         PKuzdYHmxLJVj2P5UTZ+okts3kdCeoUPozLM7EUrAwmZ5ulNXn6aOoq43noZcne9d2wc
         DS8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=CPrL1cDH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05620a430f00b006b9c33a1e8dsi2668436qko.752.2022.10.28.05.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=CPrL1cDH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOXW-0004yq-8v; Fri, 28 Oct 2022 08:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSr-0003Mn-KX
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSq-0003Sv-12
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id b11so4575561pjp.2
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=CPrL1cDH9Ao9SCvyQRVDaKcXbL8t32WNFQU8XXqh+8rvh6L0kLhXqaQaTFXKGVv0iF
 i6lfvhO6bR3//ndDFjF2Bw/nug88zdLfdR1GKMwayz5cctHQjGWt7c6JMlLLO8MtAQlc
 2moaJO3mc9kq1W+DyzHDJ8VY46IFUtZ+JJfYKH89s9RUYhvHs0io8tLm9yAR5HHNxxL9
 iwwY3FHev0YBbFr+imR0iCdVqs7HYGmZbGWnwUD7+DJkr82Bz5XRVgIn8aV27RWxlyyU
 kLDxxpTR7qBk1e67rXTZN97RSjKbtXzMLVk89fNfwMzsgP6IWz30GjohZ9+yMVlo1Pf6
 bGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=QRbb0pDUX49gRy0oi9eCwEw0DcBDbiJ/dcrWTUE+Qa/h5OuCKkhOgHIghu2szGr1AZ
 YfnXCQy6/bC46tBUhxhrJOpjU+wvTvmc8tLxAHZ4FCzx2tRN/6xa+1tEEUenfUOmY8BJ
 qD+jZy3A0QcDbmYbqrwUjRtMHmI3OsCjaN1MrKrt5SWBMuH0ucolJzsbvjsmJnYib0gt
 VK3vd7yUT1sC21YbrEUljk98Hw85FmErzx6nm3bU9DHKLQUazB1ddBlYg5NWS3xJyaTN
 pLwf6wKsMUCbY4sUfeapVQRHtFB8/A45Mgrxz2Am0Ng0J11lmRsE4e/SUS1SP5v1VjBV
 DH5Q==
X-Gm-Message-State: ACrzQf0E45mVrv+sAY/vyBmbCdeSdyH/RTKgGj7CZEjQqwm8FW9oxsua
 9zxQLjZ3+ERQ7rxG62I1IQVblw==
X-Received: by 2002:a17:90b:4c87:b0:213:5fe0:6700 with SMTP id
 my7-20020a17090b4c8700b002135fe06700mr13557398pjb.128.1666960074609; 
 Fri, 28 Oct 2022 05:27:54 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:54 -0700 (PDT)
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
Subject: [PATCH v5 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Fri, 28 Oct 2022 21:26:26 +0900
Message-Id: <20221028122629.3269-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
X-TUID: kIg7sb7iQA/Y

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

