Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp826709ejn;
        Wed, 26 Oct 2022 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JxKkSg4W9E8om+BWZRUhYi/fbm0dbugblzDUjPP6zGA1KewTJBtM3INSYBevIZNPBvKg/
X-Received: by 2002:ac8:5d49:0:b0:399:c50c:7171 with SMTP id g9-20020ac85d49000000b00399c50c7171mr39352011qtx.564.1666815436773;
        Wed, 26 Oct 2022 13:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815436; cv=none;
        d=google.com; s=arc-20160816;
        b=WtceIZByL/nvJni7PV7lZcGC/hs8EnVfsgOgfyE5QydvY4RYJdbQfG1b4EtBPY6Pm8
         Q2jnZicHKhsoe8K0alF2N3KgWh6ENDYSor4JWNld5hd2bUVUTDWjCkX3EZxXL7LKYC92
         2rwFPtR3/E5580As53If8uFX/FxY0KUI+6r1S+SItHLFHVEElwMB/e1ECAKNKy6bBiXH
         5Om1T2qnq2JeXTQ+FEEcfdxrgdjrtoj5cpr3KYCCWJ1orHjdiu7ZvG53zGXbgTTF62/P
         S5RCYw4X2VX+SuSu560hGh7s4jfkMjVeaPh2cJELl7SmWd2gtWlOaoqzcgWMVhY8F0nS
         2HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=we1LIWDhFOYx+MThE4M8weJq3invtldY/4oKMH6LsVY=;
        b=wyU9jYgNSjH1jrXGgqXvGm7UM6nwCQwIk7T86foH8Fqw0R0Af2+1UzxT9+byPBS7nW
         BMbUs90kDIm19XNTerYaPvHfe2FO0E0kpCXvPTcGKsPDkuwu6zMdzr1oXzg8ZLEnFMp3
         qh68SWr70cUXgBohFO8FTswGkzMXlsjNvhqbww8AvIC0NkoPraQba1Nt0N+y2LNguOCT
         GExBxOSeKXqnf4N+g/OQ+yQCCouHfgZl9CFjEQOyNEPT1FJ63ivwjXempiFBqs2SQ0l4
         VFHQokNpLfP31QyRcFZxGpGJkE2rOMu27aTE+fHt1ANrQju+7H7fP7FbHXndlkkSFIAW
         heXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=JTTpWCrO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020ac841c2000000b0035d42e1ffd3si3853616qtm.84.2022.10.26.13.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=JTTpWCrO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmox-0001We-A7; Wed, 26 Oct 2022 16:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmob-00015p-N1
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoZ-00031x-Ug
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g129so14406156pgc.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=we1LIWDhFOYx+MThE4M8weJq3invtldY/4oKMH6LsVY=;
 b=JTTpWCrOlWSf2rTw75PcFRuSF2CQz3R3SBZVAYOZWO09wznLe8eOxo6qIAcaV7etjQ
 nppZ5l5N7tQ+CwE2YmCFLqn48sfh/M67joHRcPWa6Y9h6YXD0SlwbXZcdhWCF6VoTupD
 YrVuNiwNCWqar19mTBQieaXkMvg1FiJTH/5MaqpC30WswvwJ34Ty8ueX1lj70WLBK3wW
 JConjwkHCpn5AhNMzHLIoe3Hj05TJU1JNR+7Tto/lalrpu4t/jA5GX5Ciqb9z8HOVV52
 7Ekxq3grzCqJNMrbzKpwcCn+MrpAl5QukwkNHVUHrHBTKmLyL+u9Mnv43T1niCiwXhf2
 5q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we1LIWDhFOYx+MThE4M8weJq3invtldY/4oKMH6LsVY=;
 b=yQmVe1MZfST5EK3zBxJx43/LtIJ/aC5dWTjg8IbFqc1mEBnZAMjY/6Imi+PVAtiHpb
 eUymS1IWWCrd4qR8z/rY9GJAdywnXlsrTun9D+/nIIM51qij1YWLZq/7gaXQ5qaePBTg
 UVp92SHd3WFJUEC1yPpzCn9+wNgYf41nkW6qy39P5mWeXsLYn8VfQz5u10HEaEHHXW1z
 I0y9vCrV7zUgEw663ZWLkKOIWaS7zKzj2dKh1hUez+fO7zY3HqnMMClsRmKhQOFgpyoE
 HSs8fFkzqUwTuMf8oywnDGkfZn4yiaLh87chTbGPIH8N084fDFez7YGE9Hp+piKK2atX
 Srlg==
X-Gm-Message-State: ACrzQf1ogfGCj7iWWT2LCqw1lwB3x4NXd5o8cTKmSGqegdOq6dTSWZ7P
 nW7uRN3BiDjHbjR0s6MKdMk0lQ==
X-Received: by 2002:a63:5643:0:b0:44d:b691:1da1 with SMTP id
 g3-20020a635643000000b0044db6911da1mr39846347pgm.450.1666815350621; 
 Wed, 26 Oct 2022 13:15:50 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:15:49 -0700 (PDT)
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
Subject: [PATCH v3 02/16] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:13 +0900
Message-Id: <20221026201527.24063-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: DVPLFLPmcBL6

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/i386/amd_iommu.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..8a88cbea0a 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1539,7 +1539,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
 
 static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
-    int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
@@ -1553,23 +1552,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    s->capab_offset = ret;
+    s->capab_offset = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
+                                         AMDVI_CAPAB_SIZE);
 
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0, AMDVI_CAPAB_REG_SIZE);
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0, AMDVI_CAPAB_REG_SIZE);
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
-- 
2.37.3

