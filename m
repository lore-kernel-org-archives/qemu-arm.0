Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1730042ejn;
        Fri, 21 Oct 2022 22:40:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AVOnVxr8i54b1D9IO13+xbxpzV8Octu82AmYYbC0I7jak8Rko22rXs2kttfdWrKggAoQ3
X-Received: by 2002:a05:622a:170d:b0:39c:efea:d9d5 with SMTP id h13-20020a05622a170d00b0039cefead9d5mr19398072qtk.597.1666417212980;
        Fri, 21 Oct 2022 22:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666417212; cv=none;
        d=google.com; s=arc-20160816;
        b=0rCIjouLA/eCHIDNIXM+T3c3fSk6a8WXK7F896SJgfdd0UZ2WSEejX/bc3shAWupT+
         RUBHP8BCBvTDnFVPfaH7ia01sqIxAsNDVZQxkkPd3Y8G5VvlaLj6pZ1CwY7ggM0XofYx
         E5DzxwpnpPg4A21o8K3IM8rSTwoflyuLQ50v1kkzQi1esysY0n0Ij9y5lv1N+ChfNMNl
         nM6iGQIC+AeJLaF+NW4ylrOj2OV6NqDNYb7PBcnpckJjmd9Z23CgxE4fUINh9GzvfQ5A
         jyhOtaODOjUHnHQ8PdfcDRDzZwLu5OPoXpb+JF63AmakUQ0hBTUg//QuDbki3xvxEFLo
         d2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SbAX8umKvR/G7QIptphEmCjplY3oI9MYCnJ19Wzju+Q=;
        b=ro2ESJnzEdlxhUHJF3U+Bw/CHCqQk/sBlseHpd1JcffVbPVF/HzNLmWOhAKFZYF8OX
         nwVagFpGMBRxJ+E6b2yz4K1dLKgcJJaClQGaGz5zJtCPDSM/FHNiEeuWYCYMdWfmCdDe
         UhD0cZ8Kl0DReQU8v5tILyFtYFr0VyNciJgR3Drq9lt23EZrEz0nJU9QOZbel5o5Fs3O
         RK6xllFoXw4T/LZjMXET3qhAO+FyQ1alFk0uQBrhPKzLisJDoYCVrf1Q0deRgB7TLnIS
         KS74oJrjPOs0Zm5LvxIvAGHFTNmDTEeC8ilVHovmi7XjUDoonHaGA1nCiMur9bNRR0TT
         Cf7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=OkADUB1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a056214224500b004af965d97aasi13813617qvc.325.2022.10.21.22.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=OkADUB1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6L6-0005gm-JF; Sat, 22 Oct 2022 00:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ky-0005fQ-3n
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:20 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kw-0003vD-9M
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:19 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h185so4240451pgc.10
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbAX8umKvR/G7QIptphEmCjplY3oI9MYCnJ19Wzju+Q=;
 b=OkADUB1IrY2MCxnyWd3KYKjUorrXuCoDabxeVUw5gMC6JRjgrdoKA8HTReCuL6B7s1
 N4qvMQm0KlgPdtgRgFCbGTvBa58XsA/pJesYXyrdGJrr+mxHGMhiIBMAf5RBXN165tGo
 YE/rPu8Ln2dUFiEm5sN4pTVGTdIKbCfXSuvjUXPyYKR/3wPLGZ4fKCiVAhVrZjuVkOWE
 ap9WY3XZAJajk7k703VHAFIzoD7pODILLc/orrpphsS4Ev6wYqt+Jybq2exTM0x6hk17
 HySltwWjgBK/dajsv+WqiwaSzXjmhu8FT3pLAYDhJIyOb48OREsgiWVQlmnga3Pk061u
 m4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbAX8umKvR/G7QIptphEmCjplY3oI9MYCnJ19Wzju+Q=;
 b=jBGJtOBrxRkXir5Wv1HQfwpNChni2aO+PB9ZrGfcOriqPUlGkpusqz43mcvA4RIuOV
 0jhRcB3YxdDlcgZX0edWErEjTbaMkSXIUhbP1VBjvApkYyjftJ5ZIwG7EjKV4VUjCemR
 9G14CN8PWwUPqzC43dBmhQjTbt80JRYKr9BaZ8kipRPQsaQeQ+NWQ4HBvnPEfZrMCfKK
 3w6j0/KL3yyljs2qiQWXcTtWFKlsrzA6yan59uZXNCL9SpnhDyo7moQ3+BR5u9vg+EB8
 geaeqjKbXqh8agIUzLIsAUZfLG4rpEfgwyjDWQGe5Kx9ons+O3awItEcz8WfkVLIlaMU
 zyLw==
X-Gm-Message-State: ACrzQf1EpbMardbFZevYEBHyqVQ/B/EpJ6lCGLeqm3YRLejlLbnK7UPs
 /3KU5h3J5eWIeTrVCoiWAWQjGw==
X-Received: by 2002:a63:91c7:0:b0:460:156c:ded7 with SMTP id
 l190-20020a6391c7000000b00460156cded7mr19221692pge.298.1666413737034; 
 Fri, 21 Oct 2022 21:42:17 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:16 -0700 (PDT)
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
Subject: [PATCH v2 13/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Sat, 22 Oct 2022 13:40:49 +0900
Message-Id: <20221022044053.81650-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
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
X-TUID: JIxzraLlXF9j

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

