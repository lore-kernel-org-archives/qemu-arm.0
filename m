Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1948461ejc;
        Tue, 1 Nov 2022 08:13:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4cecRt/opTR+ktai+aOVMysi3V0oiW5TWGGg1VeQz6SRmp38u5JvjvaSEyiR11/UxtwNjn
X-Received: by 2002:ab0:390f:0:b0:3af:3c62:bea2 with SMTP id b15-20020ab0390f000000b003af3c62bea2mr6017265uaw.21.1667315625638;
        Tue, 01 Nov 2022 08:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667315625; cv=none;
        d=google.com; s=arc-20160816;
        b=NlU8oHp3LImga9Ok3g5ix3a+PJMoexX4RwbPkw8A8Tf9c9NffG+ISoRUzMLPvpAiyV
         f62q/vfmEeM+Wa2DiNKktab/iAFO9d9lTppNQvcRwYYUp7hePW7b6pgSgDaWQnf46ZXN
         BkykEp8mKnE/Y4752mjnqEDn16JZhooCHiuji0pD0NKfBkOtYuUQZGj+XPnN/3WtVOGe
         NeNr5+0HFwExHVeFEu+NXKtm6a/PGhA2SL3WxblUN2Rf8TXo0Y9iYcx+4/nGSHcp/j0K
         lxwsPy25byd1ulwMClZFjMv8YAFEPtAaPlCJfocMtV0y5vHUT7/JxRdJQzKmhemhD0pR
         5ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wCgz4NQO2Y5lVAJjZuzF7ik8Rehy8kyoDvHvk3Kdkhs=;
        b=HnsHfw0aNylAQxpBjU99FqnjWsdiJGHeflUD6AJYvm+hjZyZeN5QL5RnyWnGZPx9Hh
         TIOkYLft6KuJuZZS7geQXxii//ia+E3bfkuxQqlIOjqYbKVwAmo09TcFMFszS2pvartm
         +tHfqMHxmJewRZLqxllAms2T5UJnJmuqJHHl2/mZwsD+uMmPS0eEiYsWoJwGlg9RcKrK
         66Z9q2Qg8bSkoSNp83sNttaLtCoWqE+Z70J4PvyxLvv1L2p+XDSIjUbO23dVVAz7aMqa
         HH7uqXLSuLtNbAkgwtmvmT1RXEjjii3gVmBzDjqGDb8Vyk6WpHA8b7QwjP6RJlPjK6s7
         5mMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vGSzJ1k5;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a9f374e000000b004068aaa9f04si2568801uae.114.2022.11.01.08.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 08:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vGSzJ1k5;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opshv-00076J-IM; Tue, 01 Nov 2022 10:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshu-00075u-NN
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:38 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsht-0003rv-48
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id p21so9925461plr.7
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCgz4NQO2Y5lVAJjZuzF7ik8Rehy8kyoDvHvk3Kdkhs=;
 b=vGSzJ1k56ovh9pD/ycLDasWSfCHua0of8ccxnkUQdckdC6qGF2GKgYr3l+uN476NgQ
 dhY6EqKMEUbjdHF8dKhXVV0B5+DJJ3wtKPRikiSA1OL9E5rQyWRTcBuyx54ly6HXzMZH
 MxnBX7lLjv+WQ0humwuten+Gm3SOyNUK8GFMiq749ZxQdAPs2AbLiF9m4Vj0bks+ERKi
 F+EvBoO4NungB04+ZyHMA1mAxOrjc2XLxQ59OazliiZL/8d1pdnMJvlkK4cCsd9zO6Ut
 LztAbaQUCtJHsoSxgdt7tGmbCOPO9lhRHObKPPV2wcW20ldmu243SvwihE0N5ZNKVApu
 gkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCgz4NQO2Y5lVAJjZuzF7ik8Rehy8kyoDvHvk3Kdkhs=;
 b=K2+qbd+6TI9/7JizNs/JTK+Sw+fqix6lKfCfpbcuXrjgZe4JkOVSNz+YL2yp/vvtVM
 XimDZguQe1S70beMRKD0KIBCTuB4Gg3H2Tg500cZOe2UYvtoL5/0pj/m+Bd0cM+b0mrm
 RX4r2IMOFRj35k7CsgH+wSVxdJYsGkmEM+vf8NkQ3AeCq6xWuimVXceH86AnGnCXuu/v
 QZuyj4MB8GVdEsitW6vjgBgWkDoYbFN3Xmt+u1lsL3lyZZ+9oHM+jFlQPBcFVExYpfd+
 V9RznqAtUplbYjIhmcjE0Cnceb+FS47Od/bLFYqbzuc98OQZv7XtpHWKqWLZtiYyT7oI
 KVcA==
X-Gm-Message-State: ACrzQf1LMpxPhMwSwLqnmChcjzHTINFIa3PrWB+0wK+TNwbFto9uSxqj
 kedevwDnEH6dA2JHDEQP+7l+PA==
X-Received: by 2002:a17:902:d38d:b0:186:9fc5:6c13 with SMTP id
 e13-20020a170902d38d00b001869fc56c13mr19942767pld.73.1667314655766; 
 Tue, 01 Nov 2022 07:57:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:35 -0700 (PDT)
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
Subject: [PATCH v9 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:57 +0900
Message-Id: <20221101145558.3998-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: k4TPrOggUjMJ

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/virtio/virtio-pci.h | 2 +-
 hw/virtio/virtio-pci.c         | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c37bdc77ea..b393ff01be 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1154,8 +1154,7 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     PCIDevice *dev = &proxy->pci_dev;
     int offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1864,11 +1863,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
         pcie_endpoint_cap_init(pci_dev, 0);
 
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
 
         pci_dev->exp.pm_cap = pos;
 
-- 
2.38.1

