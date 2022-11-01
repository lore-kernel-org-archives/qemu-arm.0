Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2040998ejc;
        Tue, 1 Nov 2022 10:13:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tkDt7rjEcwEiVmwpcFy8clg3CAT6fEnSaLm9TT3BJezDpFfGgsGKWsdbJU9Mm2h3Fec/n
X-Received: by 2002:a05:620a:f04:b0:6cf:c030:a1c2 with SMTP id v4-20020a05620a0f0400b006cfc030a1c2mr13775738qkl.312.1667322828459;
        Tue, 01 Nov 2022 10:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322828; cv=none;
        d=google.com; s=arc-20160816;
        b=WdF2ll3LtzaQVvK9pWs0GPuDpgJKSajMF5/PrNbiFNrZklY5l6b00ANdx1WFykomWV
         FuqJkFyL9laWxpFS+neyFCqiB93/KoNX8ihp95cPwMwYAw24MHvvyrGig+u8D/0zKa7M
         UObBrGDbp7ZMJpcxF2l3MuHDLx3H9s9YU1lCbsSkpZoxuMljpob+KpXqW+ZzgmtvZwJL
         4BieOHZjEshXEcJBcbSOZg0NvKmbexWA6MZsKxJFK+1IZCK6ktAaq34h9GLqmbgVQ0LL
         7d5XhOrqD+pm2+GC/l51LPF4m4QDMr7+rHGF7uJH1vnrm4HDUf7GjAQsUAheEgFMZw6k
         1HyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
        b=0CcFoBTShu8jbVnu3Am1SSI7J+LMvRdnhhgrKaC8m1la1dpJPja3tbCzPX1K733/gc
         fL1h/slZUK7Ru1A3TrI0mrVhsa1QUa48RIiy4zCZzmBugSWQkhqwqtwEXtCiN7svi9EZ
         gOaRZczz+jxK9mDrvgopczVEFR4yKtgfAacOknGt0S4BWeg9T/ACwy3Wg9A1PVvL8DZo
         zDwHUNcBT69q1zW4OlEPxv2SuWLNMkUoQwY9Q4NxN50rzFpAN3vjprBUGZs19nE3tPCQ
         0uGSnth1sTQAdKrqdXoBcdXTVK+MaTUfiMwSNy2A+lXeb8NBrt1HMmd+3+NSReOFZE5i
         5nKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=p9FQa8xm;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do39-20020a05620a2b2700b006eed7f274easi6547353qkb.359.2022.11.01.10.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=p9FQa8xm;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsgm-0006pp-PG; Tue, 01 Nov 2022 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgl-0006pa-8P
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:27 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgj-0003JY-5y
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:56:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id 20so13644331pgc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=p9FQa8xmic5mtd5S+I4xq9r8efA3amIHknEr1I0skje9GfsBAEYP1fUH+/R7fPus1c
 w9hfUhA6uBs2eFr7clpIkGFAQAbqSES8eGesc3PfibZU6zT2B2h8nLrP0aBaGLN5nKMb
 QRivOT0sRtGqAphfFJRgtZmC49+GShgi9MPXR0Ai9gKag2HwFbVRwP8+Y90EO1/WPKww
 E0DM3EYxxu1D3BVAimhHXEXy8ZkXvrS7ArgGRodLQCNMY9mVU2wd5wUFwVcZcma0WkZ/
 MtQ5AtrJZKPtyjroUqQgP70RZkcU5sEE+ANqw/9FxEi/7I3324KT/GIFEoXehJTF6IVZ
 c4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=VkoGNqAORxXwKoevvwL6RVZW1xzIYCEAQvEGT+vH5eAKwwUChMHoOBbnxNooibEKUP
 YJB4VBP4Ntia8YHZAnl4JCbPXSC/Am1etsiYLGQL6fCvrCKMc8SazJ9Hb453TYtvBXhV
 VqdQg30h08ru3Nbt63L/AbJXRGOuddDVz9nJ3DTMN5dIvgepH+BeF39z5MMxHJCCqWBe
 LskhHM7sngPdfgqolZ06/fRI/W87iaFrOOhHhySkzsnVa/E0AAcx2MRhbaBrKSi1gElc
 XBQP2UlK6/mgaJnDI0jNcTbsX6+mk2OZwtyYptQ4vZqz0NDrfwoIznfmZGlUCm6hn/C3
 gTGQ==
X-Gm-Message-State: ACrzQf1Kuip+9+GQoj6dM5qvV4h8TD7CiS3/FkC0BlKsZ+kZcI2as/DV
 jc/wPn9RiXlir6fgzQj2hTzoKYuKOgfuofNi
X-Received: by 2002:a05:6a00:14d2:b0:56c:b1c5:c5da with SMTP id
 w18-20020a056a0014d200b0056cb1c5c5damr20581093pfu.2.1667314583255; 
 Tue, 01 Nov 2022 07:56:23 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:22 -0700 (PDT)
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
Subject: [PATCH v9 03/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:44 +0900
Message-Id: <20221101145558.3998-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
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
X-TUID: DNBAHfGYdiOc

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
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
2.38.1

