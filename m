Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930534ejc;
        Mon, 31 Oct 2022 05:35:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BGZjmZYX25d9mJtfR+oPERO81PgNL+eT8Spmwr7YnrfRa80MXGfc0d7Qu1WKNmkJ308Kp
X-Received: by 2002:ad4:5deb:0:b0:4bb:837e:5499 with SMTP id jn11-20020ad45deb000000b004bb837e5499mr10734629qvb.106.1667219729245;
        Mon, 31 Oct 2022 05:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219729; cv=none;
        d=google.com; s=arc-20160816;
        b=TlLM4PFLo1TUXguZPlGbe1JiT8dBTDj0wquSPHsSkiEcOyLXlEI3FkXTiYipvLho0n
         6uvY6ELcBsZpbBl6sVMLeumZNuHIy5a+mDclmxxxRhTdU7apUGs8XGljSWI95yQlF4q0
         qPG/w04cFMudVjZ5gWXL4ZjGUt/IAsnLKCEh7W+x39URB81JOC3Dgzz0eyBv+jCTCayc
         bHksesPhjAuO6CZnVMafOs0PpJNnw39uhapMLAWvYZxxlM+L0rEfL44ioBbQha8FxezA
         +f9DhPYgDRDcIDvs0W1J6wYIOEzGdSAPI9rF3T6PXLZvFR/ciZgj4OAudCMCDtSl/XNB
         r6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
        b=hMOuwPFNb7WpkRRV0PrgYvF4f+WmcOyczp2fd4dZVvYSpA1H4F2sHXayZn5D819D0o
         HBxBgSvB6bWajF5O4hM8pr75zPDFhuaEURxwOH+t7lTPmy1fTlQO8F4V/TkQAN6X072l
         KsPh5ZA/e24BLQjy4bNVSYm84Zi4i566+kXwQuh6gkzFwCw8Ovvilz+YTyki4wV92HKP
         2jIkCF2EIhNHK1jxbX9QstW2ogNjXH6l7EATsOLdgkO6XjPezd4yBXlc/RFHNzo3sTHI
         /bp9wBgK8/TvK0AY5cFjP4qG3yxWqwiFAQE8tQvMRhdBSQ40pJ/BaHk08UJp4jDZOirs
         P7jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=YL4bwsZm;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a0562140ca200b004bb68fc0125si3807359qvs.173.2022.10.31.05.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=YL4bwsZm;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0i-0005W1-J0; Mon, 31 Oct 2022 08:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzj-0003NQ-Uh
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzR-0004Oa-Us
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:13 -0400
Received: by mail-pg1-x531.google.com with SMTP id 78so10553567pgb.13
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=YL4bwsZmnxpyPYCtY9tofpKF1/UMhKk2qNGaZNU0jwP2M/YFZDSB5g9+l9dU9w2RrU
 8zenL6waVp7evsxkfyxYAO61bjM2ibikHKEjrp4nVlIJ/Qj7mWtqwbh26IBONMfY/f8G
 Jk/QywsRe6575yubshrU2qzOgJ7q35ifHQ4qWL4yRjWdkvEZTZDg9I7kjDcEpmzcHPDS
 E8VmZmqnIlXSRGYlwCtOdCoYIs7SlGnrTHqyZOhDw91vNfBgfnFT0qG6xbJa6uk+NM54
 BD45TdUm3St24ChtyPtTPKYTDfIbtR7T1GSxAjq+eoYzzsNkroTk80dsAYetKL6WIIu4
 3YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r10TkuBoyEwvau/bgUnLf5IBkvgqqBcYI2/YSx6NHxc=;
 b=0KlOyVcOoFKhJVmwzEu/cKe6qox6Y2EveELR1VPkbRPVXhWjJPYaFHvqIPpRt608qR
 ToxAyU8SOH6gQfw2sIhuk2LNi82hVu4NI5LlcXckbPHlbjCL6zOdTeXSXR//0cX57NHr
 rQ+VWZwMphfJFzgOGoRJFq87O+b5xhBTg67f+VxSLC8qqxS3Et0Xr9fzaQhpSrDw1wTt
 XUBXXDVusri+4BkxFKWmz5BR24yg2uZOGiSALP+LsD2cUdaksu6p/3qTovIBGNxbftWw
 fa93pioLrJLUZXBS12XlN8wwBBBy1tITS9309qJ1aQbCafX5dCwA2mCJqjykr3GoKIdl
 VsSw==
X-Gm-Message-State: ACrzQf3pvGH56SGsrNjbDs4obq+WziWQ6s4QPGJkAF918rLlkn9A6g22
 aPyUu2HSnea5u/KPn6iv8AjqnQ==
X-Received: by 2002:a05:6a00:1d89:b0:56c:a2b:f1c2 with SMTP id
 z9-20020a056a001d8900b0056c0a2bf1c2mr14509734pfw.45.1667219644277; 
 Mon, 31 Oct 2022 05:34:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:03 -0700 (PDT)
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
Subject: [PATCH v6 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:09 +0900
Message-Id: <20221031123319.21532-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x531.google.com
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
X-TUID: Erwd0NXwjmOG

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..ff4e2beea6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7325,17 +7325,9 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
                               PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
 }
 
-static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
+static void nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 {
-    Error *err = NULL;
-    int ret;
-
-    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
-                             PCI_PM_SIZEOF, &err);
-    if (err) {
-        error_report_err(err);
-        return ret;
-    }
+    pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_2);
@@ -7343,8 +7335,6 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
                  PCI_PM_CTRL_NO_SOFT_RESET);
     pci_set_word(pci_dev->wmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_STATE_MASK);
-
-    return 0;
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.38.1

