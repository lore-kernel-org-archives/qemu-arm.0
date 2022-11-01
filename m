Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1430516ejc;
        Mon, 31 Oct 2022 18:00:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XJLNOM7J2JUh1nZfNum/ZXNRU8qT/8HCxfnMItevvQRCiiVC5s/4Phb/vaFetSjpXne2Y
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr13553463qvb.34.1667264416881;
        Mon, 31 Oct 2022 18:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264416; cv=none;
        d=google.com; s=arc-20160816;
        b=BCoYsRpPPaANTmR/sNC/LWgZAkvACsWYOVZF0z5H3MRh4diJg5NVRwu3pmFJcgWQjt
         t0806ajb5+rdgD95Z8sRE0DZV9M0oK3lBmeOJ0cpLq3YLruoYeP+m9p0hwQqJK5PY+oG
         ri0f8NAvh3sOkUyE5uEYkXIRusdajAxiE4eXBwYspqQ3cE3XLCxjCZpTrUMn6dE15X/5
         pr4NFOkmkuHAT3BrqPQ3ec9HCTqmXvjVyYwQQXlfCRWKd78o3Ciod50XGG+RHr6mcKBr
         jnf96bTdmF/A2gtf1BgXwXS4OqzY2fqo/CjD14ossm6MUhycGFj997S1NhCGcojKFerq
         ++Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
        b=Trh3s9MxmV38GXBGtiFPwZudkaX6xglqzVo5muhTJDNYFzybYUO6MA8KM0NGaPj70p
         y79JcBdNkSYB3xJRM0goOURDvE/OeLYLRQkUBHUpk2grkMN9TGFnPXQvZx7UTJe2w2KE
         4Z/L0L+2GB8gnMaZRWILliU6PL2et0jVQ92rc8e9HEbTPGkp03/XawY3sNxH2ZX96Dms
         C2MIuSsfI+q490D4uWJg/zw2nCePNiKiPWcYIUhWDb5WuJYJLA/EwOEm80YoRNBv3q32
         qiJu42q3k/DcbFNgcF8goWx9HAO9Z9ZqeOZdG4sWmKT+DKdovZN9yxyAb5TC2KTFaw64
         Hk8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=QK6XEkQe;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420a600b004bb5a7084d1si4872242qvd.283.2022.10.31.18.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=QK6XEkQe;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfd5-0004NL-Fz; Mon, 31 Oct 2022 20:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcv-0004M4-IA
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcu-0005hy-0j
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id d24so12225889pls.4
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 17:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=QK6XEkQeerSyByLHe9KG40tpCpw2IVl+9z0AXUGhKeFpw8bQh7Nsr6Q67CG1B1IkvQ
 g0q6Fzl2LTuCTATMJmbdbpa3qR+oRW8y1LoqAUtWtZmzs1rzeOARrnkuVn/e4gSTDlyt
 855GIUfY4ZL3J5gAFdUh2gpWJpR1z/1N3p8M5Nd6eEzvlYbgOnsXYKppBuedRl+S64l1
 o+lGAaoTFPD3I9X/ap67p1YzTM8B4Gpi74nXm3bGi9PhYyq2FopeRpkEbtUu8TXxRHvr
 uDdryPEE9L0QxU+CqoKbwQq96Ods3s56ls8JFExbMOye4bnUl4tUnFc89gBnUxN1CgR1
 WuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=WYpvG11AikaAi7pruAzy3Ubq0q6vgDdPW7QPTcMNJZry5BDdDAtmeQq3WP5ZsFvRFl
 GCWTKIsOR7+1Bxpm0jfgIk/llbs2PQa/3ZthGYBdSRPlWOOnbx7nLjTYMtYnWyZQM7fY
 f/4zYwtVIrMtslGC3gVzrZTBoywH8nKPxf21yisKuawfKDhIc3GPImBjEmi1CTrx2Y1v
 GAzr9oD+tnlnAaqUsi0ez8fe+dokIxNPfGgydK8Ng6q5sXd6yf+BEsT1tKRHk2xTcpMI
 LJjFjHMxHFPh7R7VA1Ae09pqCgQdOxlV5SgSvRZ0YC51ckDRlNtWdFkNlyCPKUgR3E3O
 Ihvg==
X-Gm-Message-State: ACrzQf3lfFoxBlPGf9Hubqml0Ik44odOUADgPPmcNeub8GciKzO0O1Zn
 4ceQ1dFLNNp9n1H+M4mXXae7QA==
X-Received: by 2002:a17:90a:1097:b0:213:d7d3:ab8 with SMTP id
 c23-20020a17090a109700b00213d7d30ab8mr9681883pja.91.1667264374134; 
 Mon, 31 Oct 2022 17:59:34 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:33 -0700 (PDT)
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
Subject: [PATCH v7 05/17] e1000e: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:47 +0900
Message-Id: <20221101005859.4198-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
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
X-TUID: V//DmWwGBktd

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ac96f7665a..e433b8f9a5 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -377,17 +377,10 @@ e1000e_gen_dsn(uint8_t *mac)
            (uint64_t)(mac[0])  << 56;
 }
 
-static int
+static void
 e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 {
-    Error *local_err = NULL;
-    int ret = pci_add_capability(pdev, PCI_CAP_ID_PM, offset,
-                                 PCI_PM_SIZEOF, &local_err);
-
-    if (local_err) {
-        error_report_err(local_err);
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pdev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_1 |
@@ -400,8 +393,6 @@ e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 
     pci_set_word(pdev->w1cmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_PME_STATUS);
-
-    return ret;
 }
 
 static void e1000e_write_config(PCIDevice *pci_dev, uint32_t address,
@@ -480,10 +471,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
         trace_e1000e_msi_init_fail(ret);
     }
 
-    if (e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                                  PCI_PM_CAP_DSI) < 0) {
-        hw_error("Failed to initialize PM capability");
-    }
+    e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset, PCI_PM_CAP_DSI);
 
     if (pcie_aer_init(pci_dev, PCI_ERR_VER, e1000e_aer_offset,
                       PCI_ERR_SIZEOF, NULL) < 0) {
-- 
2.38.1

