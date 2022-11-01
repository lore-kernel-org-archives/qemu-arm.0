Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1949447ejc;
        Tue, 1 Nov 2022 08:14:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FawTOQgkbl/sF8NnlLg3PrlfoixB+1dJ6ulCZUNW0RcXBmFToZX2+1P9RP6F7vIowR82s
X-Received: by 2002:a05:622a:4246:b0:3a5:27ef:46ee with SMTP id cq6-20020a05622a424600b003a527ef46eemr7409968qtb.49.1667315689768;
        Tue, 01 Nov 2022 08:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667315689; cv=none;
        d=google.com; s=arc-20160816;
        b=oziHxBvhKgol+RoySlAGckZ9s4gHquJJvVqrylWQZwagLn8RTR+gC+DU8EJGW4StJN
         RUr+hfKPlS7yjYLjGRV2pm5etlgJtgTnJxZTfBJHIKgQQGeCG3JuqEDtvNpHq0L3nS/Y
         R0oar+4CkzOO8TX1HKaopNwQwcCEK4UmueD0RkIT15imjRUl+s4yk/uDYO4597k158r5
         p4/fTJAttlIqlEkikS2UWN98+g/+LEsms5SWyzBcD5A7f9PRWCQYskbzrPL+Eq3mI/D9
         c2UcHZlEXPpDhay0hAYVQ88UFJ6kBsPSmvoM142ayBif3S0suqco26Y0Hdgy6jnejzjt
         YadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
        b=KeGV0iaZU+Oqs6SY0EJCuLIsJFZlN32wqMIRuypBTbmKxfIBiboTSybUKDxxmv5gGj
         RVXjsfxgMH1ZQhrRMZQUOagVMYswyvFJWyZ8xwWD/YB7Vbs99tjct7RaXadEIutPQN+e
         VHYqyBenP8iZ4ptetEBcHrWA1PAdtNUy+jtWZ6rz73UHJJwbrT2wXcgmzcXXLZc1wriV
         jIe3ogXnQi/05IggJcLR0baMKYLSEAGM5yoOB6vZOZgLp7UzjQxgZQn3/cs3XagrgO94
         vUb+p5Avc0m0R9/8S6Zlt+qlwRMn1pQ1Ek0aQHBX5nV99Y4avq5fJ7U+zdi/Dcm11gJh
         cRIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gqCUXh9W;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm26-20020a05622a251a00b003a4ee89117esi6178947qtb.274.2022.11.01.08.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 08:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gqCUXh9W;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprnT-00067C-At; Tue, 01 Nov 2022 09:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnQ-00066F-Ub
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:17 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnO-0004e0-Hj
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id c2so13617995plz.11
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=gqCUXh9WH1PgFdB7Kpa9JkjgpTKGzAslWot+Mpop1Wc7dMc8on563mp2lWtAiWcdzw
 be/Q9/pAdeEijPNx8bzCuwwsb5FVjj9vu5FbUQmkqu9pMKbaZqU4HuUZv/x/AfrV3Gq5
 QofD637ncA+yoxaoGZDsPBomX7yzlE+Sl4u/tfTDqk5uvlhnjKaRIGpG3aerkWWQ9Fzq
 bqAwato8ghCrANghto+VnyXMOEaHwmczI59pJnPon4QluvoeEuEHmsX4sH3hUilh3B0v
 H4zuIjl2GWhxZeC4rEk6u7fzwnZci1zQ7tLGOKh6wSYf2V0gTscYIGFqcHRvpKZe8VEN
 LSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=shLwWDan5yXOISiV9x9yC1mEnbvk9IrLlphHJgn4NWgvpC05P5ZuRquaGjkTun8XFb
 6p2MC/Fz3cizuKXhpWRB8IzRstHPFA5oUjf493HUcDATT9MtviX971nyUpDjspOX11ld
 lk9t3dRaZfiMqg0I8iTOUukRUQ8MycdlwKdQSLtMZgASuXifTnTMNtibbXOFQeVG3Jr7
 +DtvYbwFj3QIRG1aWgL1hte7mtAU/zOT6SRNwN68stVV3EGldDCpq9nytFSgbQ8xZpAw
 lq7jpPS2jJYIedC4479A1CT/0FgWLelbRsEsvFIMGO8rcvKMyoJHq3AVX/XSf+Ki90us
 ftbA==
X-Gm-Message-State: ACrzQf3vrDm797cPODfiKbNYmthSwNfXWLXx6Mb7UgiXbq8veqmFWZ7G
 eioP63q83PTYFVac7Yhyn1b5eQ==
X-Received: by 2002:a17:902:d512:b0:181:f1f4:fcb4 with SMTP id
 b18-20020a170902d51200b00181f1f4fcb4mr19933757plg.102.1667311153360; 
 Tue, 01 Nov 2022 06:59:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:12 -0700 (PDT)
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
Subject: [PATCH v8 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Tue,  1 Nov 2022 22:57:46 +0900
Message-Id: <20221101135749.4477-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: jKZE5svE7Fx7

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

