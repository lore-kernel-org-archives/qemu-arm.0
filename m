Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp831699ejn;
        Wed, 26 Oct 2022 13:27:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FS81Fzpxd+/m0SWaPwFgjGBxjnYH5ocRhvBqJnJP2fOmw7iqV0sLNSAeZqElpftl5RH/6
X-Received: by 2002:ac8:5c4a:0:b0:39c:f9dd:ee3d with SMTP id j10-20020ac85c4a000000b0039cf9ddee3dmr35985820qtj.443.1666816032331;
        Wed, 26 Oct 2022 13:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666816032; cv=none;
        d=google.com; s=arc-20160816;
        b=BP3rtj2WqnW1Z9w4bDbAGD8WelYLJz/MgphDybpZiDFD1b8cK77ItUMYLshd4eDqgf
         584vtv3D/iK5SBVjpSSwI5ABKNfs5TNkHnbQfknaXPAF5tc0fUdTXzmmFIm+4NyqO1uC
         KOaeJo+yIH0Eq4uuLKRpvf5J5qA1I+awJVWqbWMnQVwAKPf91AqI7coDWjiAaKm/0YRC
         CYiQv0Ac+gu2Xr4eyuhga0ky986eoxKrtG/JXSUSKFt/pTE7bm/a+HGb9WeVXGkb7oah
         76o/ZwXOWMtCkhXecLd2DzrPG9d1OhMm75XH2Qt7o0oohMQtXfAat844IMVGrSvtU/kK
         f/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rm7TXfPfJEnn+bdinfLf47b7tVNRCBtAKZ++jzyT4uk=;
        b=fp56ghyyMg2fvOla+pSR1ztapKasbwgu8TPsOhOkGW/XyOn8B0o+HIRyRwoeyFOKKq
         0XrTrDK9K4PCCmxxellkl4i9ARZfOCccAlHJt9S4FgaD78pdDtTDzC9jGQFuNPmgoWEH
         3qlqhZp+cV0g1suhQGNqpgjFdm9wkgOHDsMbB9cJzoGsSriQpzTjLP6lfw5UdM2KbN/N
         sJiZGX18jaQLpYcl1DvpX04JiWomUauyut1yRAI2jZUEAQl6GjZf/wU1WM6Uct5Wog2n
         2fvA4VS4lHydKoJ3lvS0CP+1yhiSVaXmrsAT0X6DECd3F5ZEqORmixGMTj2SsM6RYNT3
         JBQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5gp+aI0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020ac86155000000b003a2c2ec29e8si3669115qtm.194.2022.10.26.13.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5gp+aI0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqh-0003Zb-2e; Wed, 26 Oct 2022 16:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpg-0001yf-E3
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:17:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpe-0003MB-QK
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:17:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ez6so15168112pjb.1
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rm7TXfPfJEnn+bdinfLf47b7tVNRCBtAKZ++jzyT4uk=;
 b=5gp+aI0BwznbykBgW9/3Mm2xRuNQ1QsojiUb+5uj4SWN4WquJirAHQmonFqpJQm9cR
 KxjbOUbp5GwTLJuQjGPGl161CGZ6isZceNXwEDmWRFOgtS0wJ49ekkgk23795J/yZ/zT
 uVzslhnBtjJzwOYR2nE6QuggqZNTTeBEAN9pRn21nnBzTs5SraYNd+/UJyQX7qtNfwnh
 Iwyv5FeCoVNRo79At0XNwmY9m5LX2Da9vkIDaxT5SnFEzOxcwxsTy/WQNxA+KP+Y2Vxp
 5pABP3Gdgrz7b7sNOEt5tzXto9TcLwcS+IEekbPk/+PBA/JW3+3trmZ2BIHY4LCNWiKA
 wabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rm7TXfPfJEnn+bdinfLf47b7tVNRCBtAKZ++jzyT4uk=;
 b=Hu0ODbS43ZJfxAHoreqhVbLS2R0AKvN/MnH+Lcbjql2zjb8v8dy1DVmAHLnnwRTgyn
 pmYvm1ad71xcCyeGRzG8Wlj+S9877z4dnrTVP+QJXd55MAOJ0kd65dVfIZJYfzXAfQbj
 lBAN6r6EHX3HDhZDyvHtZ3LOgSb546/QR+b99mKOc+36BcHaIFdDRwFCVne1DZ6iHyxe
 9sYkfQ1+g9jyWQ3Yx3bYeo/wIwCDT8TBsFY/JPr3qcsjbag6SlnZyluy+X1h/6rS3r/M
 uwB29IgIr2qnbIfSHY/OtTpK2/RhEUM74aUu2b8J0diMXoFts4i49VaOLNgF3URjrFSZ
 iGHg==
X-Gm-Message-State: ACrzQf3kusiCbYiD5QLY6Q+jtPwoWfO4Gd5zaXgNqo0/MoZ3kSRhTjoF
 kvXwR+WZA7sldQbeWgX6adPgSw==
X-Received: by 2002:a17:90b:3504:b0:213:5b03:639 with SMTP id
 ls4-20020a17090b350400b002135b030639mr4486443pjb.16.1666815417665; 
 Wed, 26 Oct 2022 13:16:57 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:57 -0700 (PDT)
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
Subject: [PATCH v3 15/16] virtio-pci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:26 +0900
Message-Id: <20221026201527.24063-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
X-TUID: JalrKwZIBdMa

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/virtio-pci.c         | 9 ++-------
 include/hw/virtio/virtio-pci.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

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
-- 
2.37.3

