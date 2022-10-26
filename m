Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp830360ejn;
        Wed, 26 Oct 2022 13:24:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mS9T+017ijB41xMjsdMW7ybLzCX/kXxdKEnibmfDfPPfN5ZBvw8tJIDgShlvUWfL3HJu7
X-Received: by 2002:a0c:9122:0:b0:4b1:80fc:c405 with SMTP id q31-20020a0c9122000000b004b180fcc405mr38974823qvq.120.1666815882911;
        Wed, 26 Oct 2022 13:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815882; cv=none;
        d=google.com; s=arc-20160816;
        b=0Mi6Q0bhf9+/zbf7v1LkshJ0kyJMwo1if0pz2+m1P67lkBwhMA/1oLxgGJDfPiBC3E
         XcvWY8ZAZXC9eP7wDWkCHwKcpWrNVTvyNA7mFYbohmFBSY8Q2r0O82SbOqRjzeJxvFl4
         Nu304NkFeZumQ+qr5RRBrH333dnMUSgDcva+RQPB17y1VfeeDXSGALdaPSaST9dTugV4
         QOSS81oPOwegn53tLtpj9IiM19eMInI5qXyGA80s95fN1oK23luQ8Q7gMQ1f84zYEcPB
         iyk+09NbvG/0YjoOjrAAXSUp5pwiV0jcnlemmgpbvU3WlZiwDUddWtfwmsTDqDbATFXa
         1y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
        b=tmSmVS3lRR17PBwysmhlpIj2GeWtdB9shnYl2icZ6KIw8V3K8xqoy6RY92w9v/uKyz
         2kltk6utJO6EZ3Swfqfs/DXIwgmDeODgPkd6UMaGTLR1dJl+N9tDdKlqYx1ZdKI3/S9D
         pEmwM+JPRBoE/Cg1q6OLzkmSsNzzJtXDAa26704cB45CprRx2zFPFpFcQmAu6SHYdUZ/
         VCFGvIoX3DeMXZYZIiQZIQ8MJkdKvSj5WNgQ43CsACveEku3wP0rXpVbNBOz35O20QQJ
         jAHtjYUolhdTzGIgDVVVFqBfXgEpaqXz82DloSbqaXSzt4g14j5jMjP/2/DVQ9RMP+fz
         iB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="VgAA/NY+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24-20020ac80098000000b0039a0f1abf65si3880642qtg.558.2022.10.26.13.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="VgAA/NY+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqV-0003P1-1W; Wed, 26 Oct 2022 16:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpb-0001w4-AI
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpV-0003BV-BM
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:52 -0400
Received: by mail-pl1-x629.google.com with SMTP id y4so15300258plb.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=VgAA/NY+9y1DHEPBzNEOX3h+nRKzNQYByy8Me/I2sR823nVLmLnv3kgIVkRi3alZx9
 oi6gkA1bXjsaSS/qU/NUAihD+b3j5/usFn1EOQl4x2cwkiRhL33HeNBRkt3B1k5g1p+d
 e973f/oRC+5QHjqpEw/G62HdjEOXM+2tQBRdmqRMIY7J8GuR2Q3jOdhAT2ZWzVZkjCmy
 GZlSRTiJ/BcJUowue6kpKifBEUIXgebxJJF4aThsjH8AnT+hh3SE3LeXESx/xrVL9ewV
 5bPvO8LYUbDK9WwYW7I1ybLbjlkw6H1wMXIY3gTsm01B+qR/lR78PH4S9XnfMRCcCO8e
 GASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9Hvu5m8f5nzPBzUo9RBA72FD6lUa6YAEOOW8pwxlMM=;
 b=n/si3PswPTqpt4/r8TDCAx7ZwL9TLuK+RaJ/+bYSqXHu0SN4uEhWWEygl2GVBlVXeY
 VCN8idYg0EPVPWjwndeHuCmDUpNlRh6sqzg4cpgl/R2rK/ijculAnffgWT+2Dn7i9QaA
 ymcfZqJ5Pl2i9C5ZfTatqPRzzunr+K9+swHFbaKMAvmjptyElkrN5/v622HRhGnT9uRd
 oi2i+yFuhLv13MXh/CdnbxCmRiE0Ngv7oAoIazuyRdy+ODfzIL/AlNkkdBNIyK/NsEdU
 Ywh8LziGA+bFbtvoO8Gbx8AIh5kPAz8OyxG136TpJdnx6iKjZQxHVlRVw6jtJCCC44g0
 hDZg==
X-Gm-Message-State: ACrzQf2IiHPvb5aC+WoOzxe8fsteyrnsOlV0dISUolSm1QTB1fVMmpYy
 mvDnE/RsZ2Ga4+YoEe3c0HbPig==
X-Received: by 2002:a17:90b:3882:b0:212:f4e9:ceb0 with SMTP id
 mu2-20020a17090b388200b00212f4e9ceb0mr5920316pjb.135.1666815407485; 
 Wed, 26 Oct 2022 13:16:47 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:46 -0700 (PDT)
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
Subject: [PATCH v3 13/16] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Thu, 27 Oct 2022 05:15:24 +0900
Message-Id: <20221026201527.24063-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
X-TUID: Xuh8Ms3gvk62

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

