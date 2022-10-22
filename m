Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1733289ejn;
        Fri, 21 Oct 2022 22:47:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NZgYDiY35JMBHtC82K2J+EHcHDt8hVbXQdWOv6Y4Bnw4GQmSZtuQaJvhxs6hbCeY2+XAQ
X-Received: by 2002:a05:620a:4089:b0:6ee:d0ae:46cc with SMTP id f9-20020a05620a408900b006eed0ae46ccmr15608814qko.212.1666417647488;
        Fri, 21 Oct 2022 22:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666417647; cv=none;
        d=google.com; s=arc-20160816;
        b=tdjG4+9hCicQjzDi0H0G9t4ZbrgjuHzBBTZpG1pKw3MM6q9NlSFznHYJLOXMmFrw61
         YgPOcpMQbf4P1mL1mv51vZiPgk3jhToNibkX1Vf7m0rinlxn+i4TAH3ge5C1i0u66mbp
         Jqs5cBDkZ+DzoLVVU3a80KWG61FebBtMl+8mowKGtNWFFuAa1OcF2F5Ar7QocRfM0hnh
         SbnuTqLXhgsr75CxCMpysmTAotYNHwdXsQeM49rmKa/woF4SuvuWJP368vf5uJLkT1fv
         zF/22mXpVdrFc17j+cNS+jiovU4SrEpBLMYbkRrFmfbHWQLgNFhJ26fSBlUMOgpdQEDN
         Wcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Das98gInQlPFFwE5StoSWsLkf3C4gfxzgibTYprDcWo=;
        b=mWCK3PnFA52uhcM8nrAjBmSC/vrDxPkRgmAYRZh+9IkIZ76Q8toXizokwhyKBmYpC3
         1W4/GgfpiUejHj6fnMf5wHHVEcdBAoiV5d6PA/jUFBOyzHuWWnaz81SNFky5K419U0va
         2BaCSU+YjGWUtVwizTruqFmPB0FdX0CdnnXqKiovvotLJ2uvB57LApjiX7yECT/oWcF8
         Y+2ZDC8ykrNAiHKDQoGUnvlMgKgrDevpJ/tptn9ogJ5viTFkWxMPuT4yFc3GqOhiUSN4
         Z4L8/O1sX0sdEiZqsmauYLPCrEISFV1evl6qWE+k3bRsyPYPjIkCg0BfLair5oQGz0xP
         Fpqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=j1Gg7y3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ad45bc1000000b004b3ee7de9d0si12872501qvt.135.2022.10.21.22.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=j1Gg7y3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6K2-0005Gb-VT; Sat, 22 Oct 2022 00:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K1-0005GM-Ow
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K0-0003Gl-9q
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k9so4059809pll.11
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Das98gInQlPFFwE5StoSWsLkf3C4gfxzgibTYprDcWo=;
 b=j1Gg7y3Dm6HLzNofzceZbdnx3gabTYm6Ok4jDEGVHuSh+/Po4lwbg42cGt0YZSaHs/
 +x8S3a6LNM/YYAXxcXiNGyuR1A6FLC6CcPJFFeyiqe+UiNjx/uE7LuXEws/TKsb+/aS7
 ueeLW37uQKrrmTbdDmDSs6kEmxGB9A2CJ11S3RZxJcrm0UFUnB4sl/1/Mdz5Z5aYkE+K
 01umxiBBeHRVV0MTKNUmzgxjyxO5rvux86pvcwqUYfdokUcXjvjqqMDWXsUEsOyox16Q
 WBeBxJlbv1UkqYz4BqAWqQLymo8JivkX37dr09W5fAm5Te8NuO6GDQGf/OsY2qtz1g5X
 4Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Das98gInQlPFFwE5StoSWsLkf3C4gfxzgibTYprDcWo=;
 b=E7EQr8EO0Ky5eVOCCLXpAg6krj4zL7Xb2xGyjjxuINcLMoo3pn42rQXSq0oKZ7RUgG
 Zel8Mvnr9H2OGP4zJYqPp4jlzYhmX18e2+IKqd4kzPgSOEU2p14Xl2CIK0f44q6l9FCx
 lnaPgynsKsfkAIW8KbYBJE1a/qp6PGnCd9JoZf5v52eypBerme/SDWsOXIhvLMsIXosa
 c3OFZeivow5U9JGvFnQeqRnX5o068QcO6aMEXK/4CqFi9fBuU9KJbtW+7o20JkCHIhuu
 aQoNbD3oJgHxBudWWMYcWjuM2PEab23gc32PfbLOKd8rXfVaG4GDg2AdfbGfUWzJgRXa
 GuiA==
X-Gm-Message-State: ACrzQf1kW4CYo0UDteFskPGluVFSIz+M2MZuKdhLLgoeOaJJ4m9+DOgu
 E7kvegz1o/Kwe4flIdaB8oefjw==
X-Received: by 2002:a17:902:8303:b0:182:4ef1:8740 with SMTP id
 bd3-20020a170902830300b001824ef18740mr22439129plb.4.1666413679655; 
 Fri, 21 Oct 2022 21:41:19 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:18 -0700 (PDT)
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
Subject: [PATCH v2 02/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:38 +0900
Message-Id: <20221022044053.81650-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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
X-TUID: AFPG+pXZXKCd

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

