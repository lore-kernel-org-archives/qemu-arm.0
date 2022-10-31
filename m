Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp932816ejc;
        Mon, 31 Oct 2022 05:38:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ml8PdsuFL6ffqWcCeRB/jYpiNgst0lK6ZnPBxc79ilabnMAXKts3p/X1SM5soX16roUdO
X-Received: by 2002:a0c:a9cf:0:b0:4bb:84ae:5eed with SMTP id c15-20020a0ca9cf000000b004bb84ae5eedmr10663376qvb.62.1667219910888;
        Mon, 31 Oct 2022 05:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219910; cv=none;
        d=google.com; s=arc-20160816;
        b=lXyi0xLSDv84t3LLe13ArBNybORHTfZA3zrVo8Ov5tFTBOo90dIFGP0rFF/quJ82lV
         JVm5dgewD27KBJ1wpXm4tX7nDFgLOwOhsy5tCijMn0gNDZSqkVRuENT45iVqQ1ZA3egB
         kTkrKk0muTXtdf8P+7j1LW2sRrMpPPWWiUrP0KZ7wTyvqFdctodME6B5uYyIWDx19XT8
         Wg+A8x+SMIXn725I1Wa2HlU1Mcjwwq/Mt1JKu15MzNNvz2KPwVW72SnxMFx/i1SDTMdc
         fIlTACU/UuRr+kOsLyCuVYBgmNVULCeMWEavOI/eyqgCxA+LoXC7efQmaFqe7uu+mop5
         hTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
        b=TJORFBeT6Ar+JxZ2fRJCild6YwD6Q94uS3LwTDCDPO/nKgH7pQcyS7sgllKaGWvB1N
         erGMMW0PzqHLlCy3QWJ+KRqAWLB8303klImTAKpXWXaDjRS5CVcM66kLO0W661BA6oyt
         B0N67EKN5SONzBislO+Tw91YajspRRGy3bZ0sxI3KnboiRZyQeoK2/+JqwKP+ItUB2Z+
         GHtiCrrR7dQV5wJShuwyVg5hm1MxB8W/Jzt/O7SU+LzJavbxQ0Dlk46kYANwVo96KYnL
         lZ+wSf1eNbtBa60RpzDp6MtNTwb7kg9GMKcPyYSCdyhEOpNGNzVgrx7DJHLQdXpPUHht
         vXsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=AZjM7NlO;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az14-20020a05620a170e00b006fa32ca491fsi598276qkb.46.2022.10.31.05.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=AZjM7NlO;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0t-0006KZ-4j; Mon, 31 Oct 2022 08:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU04-0003rS-8z
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:47 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU02-0004P3-N7
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso15841408pjc.0
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=AZjM7NlOo7EPDOHogbz96xCiBFDeAuB8YW/vahA4p5CgU+QiX51G8rq95AvKil4abP
 HgFgQ2odOpmT9eJqJTTdy0VzJ+xI6EU7DL+CRp0YOLD/SGj3kRNs42/Uk/mwtk+QZQxe
 jiXJoZ4ene1s/HMn0rWQ4oCvHmgRr/vuUN8wxbqme2Tu6r7fGHsZtcHdLNiWfAWAgVKN
 R+nKJ+n8yupaJwDy3jCox2jy7h2Zq1EjO39VmV1e4ReXjlq6dR6ywnaVKoZvjWxxDAwm
 fGr4lwDe7sA89GiiwcgneZcXVFibBBaT/Nxch+h2CGCxDAmLUjZLTW60s+r2Zs1DUDxy
 Le+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=VBKtHvAM/GZFanURvV0RfgXkxOVfsGTokXzNvDynIEkyD2Y1uNkONWTdLsbeMvegGj
 dn/YSxtnnHYxdZaMiG1zbSvKQcjUSsBRiYYbI8cXSLJ1bgKdKNgcoESJwYY7oiCa9qiV
 +S5Gq0j3fTuYX0TA/Qm37jBzOnfGL02ZfOCcEe06ctQ5zjymDoZqsD6nmxIvSrju5mYb
 H4WHpfvx5gHV5i9cm9tBZJ2ykQr6Trcfa/yqS7MClUr5YJo1/sAYVqfkOzy9100N30E/
 IPS7rqi357iWxhbhzz4eMl23KRy5gP3wBd+mOrfrWZPiYW8wEzTYPPmeKbzJLwvPDURR
 33Ow==
X-Gm-Message-State: ACrzQf2AWERhsqrs5H4rFeVlsn2HT+w+bNpvnKAeje1jPeqSlcZYdYAm
 FLvUVz2RQHNmzDicZ/cMf4Rg5w==
X-Received: by 2002:a17:90b:4c46:b0:213:d3e3:ba44 with SMTP id
 np6-20020a17090b4c4600b00213d3e3ba44mr7183833pjb.18.1667219682119; 
 Mon, 31 Oct 2022 05:34:42 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:41 -0700 (PDT)
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
Subject: [PATCH v6 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Mon, 31 Oct 2022 21:33:16 +0900
Message-Id: <20221031123319.21532-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: T7Sv3VjV6H+u

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

