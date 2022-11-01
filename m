Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1435167ejc;
        Mon, 31 Oct 2022 18:06:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bcx13fCINK/tzGa/LMM6QxJHdV9MxbeZCB2hBRbj7ES+a9gdbMX7vFGXJ5VSKA+dWSRVK
X-Received: by 2002:ac8:7215:0:b0:3a5:2615:56aa with SMTP id a21-20020ac87215000000b003a5261556aamr6552809qtp.450.1667264781581;
        Mon, 31 Oct 2022 18:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264781; cv=none;
        d=google.com; s=arc-20160816;
        b=rbVSDMt0ARWz2nmN60kTqX1z0nyE88YKxy1SgFoCwA+pGlnKFdBNPmqZM391nMFY6L
         JGtlEkn1UKtGM1KbjgkYTGH8SOKwq+mo1fp9Vov9lTbiRXZkc8kKLtxKYsEhMbcs9C0N
         nGUXbbXyfNNVtVpovhdXBrSzj2ud7dqSot1OHNgz/SO/lLlYqxQB+auU9QHbFMuzV0Hn
         jaxYQFVNFuPq3B/sTxa1RIv/LJwUHvtLyIZqVxZ0gfbY4pF4KrZppxh8q0/0y0vDD9i1
         1QjOd1MYX2rRChXv5qgTx+3neFxUROFeyDkbX5x9HmyxR/JxYMsCfg7/AzF5drnvrinv
         kYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
        b=wGLxiVM6at2IfNgaw6ei0YJ70UYjdqpqnU9MXFPI+kztQXaTR7KK6NOkXzoAOt7O1s
         KtB93mQXKcpKwOnh9nJdUSYjfgBxQSGw8jHmMATDIyC/WqArOh++6EwsbuGe5qqVTSAI
         BK6bfzMDhiLt3EcakrLz6gFXcsHkIsZe0xjDcEoGbkGCt6wt1tA9A5KpeDuwXXeMjkyv
         nyRox8QPYkLnygXnMA0ym63DNi2904Yic8jtX1GOXHab5qbpagU0JAfrSHyz2ufOiagp
         N/BPgM1sbgzuMNrVGOTGZr01xgjf9patkhmkx51nHL/CfP+r2MSAbxMznmE4RITguT+W
         Bc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=iOsDSIAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs15-20020a056214226f00b004b9365b2ab8si5116770qvb.250.2022.10.31.18.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=iOsDSIAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfeZ-0006Dv-N9; Mon, 31 Oct 2022 21:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdn-0004qu-2s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:33 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdf-0006Yv-DP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id i3so12124040pfc.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=iOsDSIAZ/NPorQWE2wDozuwolZFjqJJey6XQYLdigEnXldOi4qHV85REsuYL+zGrHU
 tt14Bv99kWsRvvVvAxx7zwgsYPmOnp6JFMnn6ajoEDy9VQ6rjW3nqvH6WlzOjrnp7w+z
 XnFoTXaNRtFEDe8SnmDCElCYAtvDEZRjGHSD5bdZYf8yS/NdpVxV9EmpaGcpESdwZFxn
 OsoygyQu9a1o6FFONLu85hsJRSBDtjbQv8/l7T9T+QroVsihmrp+C3gFPLStQKLLWkvT
 6/hejZvydhYUfE+omcMb0aEe885Sbri3aaYN0x1yArnlkaZ5b7EudWUqf7B/wDU/3mLn
 G2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnM99KyqX7P48Yqolo9mjrgei37okMKuMCflMKIVI0w=;
 b=nx2YG8+kCX4CMSfKYamg7USFAepMCZ7glZn3o7PILZRC3ITcAk+hyIgbnVKfiTh4dI
 QaSK0QD7CWfGO0HoIuAx+6b1t3O1V+wgCLCGxphHTtQp2u9lbCOagOg6hZ8zSZYBx0JU
 S12K1ESbtoWz7p5QUZr1jLDovCQYOMotAbg6S1RRMMwknMYz00ceiNxPXSIWVwBoN+p/
 x50Tsui+VMrn2w+Qx8PozTvhHapRzwsDAYtKV51SH7wshEsNx9dtjoflJGI5lUDpnMz8
 8RowYK03o2EdrucvDLFucINbvLYRO+nk9doMwtp81wrLYYjYxpMQvG02N27PBF5+iz12
 6R6g==
X-Gm-Message-State: ACrzQf3jYD4KB7jv854B0BTg7rPawV5eUNmAvm7LCieFw8WeH+HmX5Y+
 KaH3g7MULzy8UZTYOHS8Exa+jiDaFF3KudvG
X-Received: by 2002:a05:6a00:d72:b0:56c:3c45:6953 with SMTP id
 n50-20020a056a000d7200b0056c3c456953mr17214543pfv.54.1667264419788; 
 Mon, 31 Oct 2022 18:00:19 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:19 -0700 (PDT)
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
Subject: [PATCH v7 14/17] hw/pci-bridge/pcie_pci_bridge: Omit errp for
 pci_add_capability
Date: Tue,  1 Nov 2022 09:58:56 +0900
Message-Id: <20221101005859.4198-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
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
X-TUID: zcJP4SW7uC8I

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

