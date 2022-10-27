Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp157522ejn;
        Wed, 26 Oct 2022 23:39:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rpBIl/ilukOEF2Xg0SOuftHPTQZTihFrN4uXER7KAx8m8JxlbnhE1KOZOUSHSxgDUD9gD
X-Received: by 2002:a37:b502:0:b0:6f7:65f6:a95d with SMTP id e2-20020a37b502000000b006f765f6a95dmr8914984qkf.712.1666852780189;
        Wed, 26 Oct 2022 23:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852780; cv=none;
        d=google.com; s=arc-20160816;
        b=suA3SJcZB5IyJsvGLE+n5VSY28IcTjgKyo449pXV9JOVQwvLzLL4N4a3X41cfzfkUn
         nymmVT5m4PBQ12DSKJh/pWJAKYqNoOGTtxt9iJk8vGjVEn/UUINROQ1GvPCwuwHQ8yjR
         fC1IxjVM8s3d6yG9Ef2ym0UxPT8BIKWA1+Fs6IyliID4cAG6TtkKUZ4ievtv9WsM+UuK
         1ca5ygWyKyDmgRjcFAp6l9y0kXqzNauR+wxlBsmnkRSFMDKYkrPpy3Re/MD2KLPqrSCK
         TR3u29ySFxuhVPgjrd+viw/cedsFSjhJ+Q56WeVDcmiGNaZOGH4iUo7LAitmbVQ0xyfJ
         f6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/9im1Kc9g5XlZqij06cd6/OXySKGlV0zzS1vFEiVRn4=;
        b=LFOiDAftNiTN3gSixeRVjZjM93SQItdshH/evNX7erhLucfm/ry3x78jIZ/V+6KvdN
         hDg2L2i/Z65DBCFgBTpsUMrV0dye97rOkc7PNjp4XpDlBdnRuV83O/IfLIFgWgob1h8F
         PJUEe94VgZ1TU36CS80x9yfquP5LLgmElEkcnjloXuaEsx5PoCH68Kx/i6ftQ5eOCYZx
         aV87x+MwnmHiNGohB0c08X/sK/mW5ZwNj/bARVVTtRbRsKSTcUpE3rZCOHzM31GrxlIu
         CkGQgO4SsOhX2VQVg8KwAgqvXVCeVkkF/ii7j/nv2KtzUogj0QoczHuSh+5rkSc4DL3m
         A3+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=noUpZ8j9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020a05622a028f00b0039ce18eded9si412665qtw.535.2022.10.26.23.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=noUpZ8j9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwXh-0007Y6-Mx; Thu, 27 Oct 2022 02:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWO-0002to-T7
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:47 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWN-0003Az-8r
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:44 -0400
Received: by mail-pf1-x431.google.com with SMTP id d10so575807pfh.6
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9im1Kc9g5XlZqij06cd6/OXySKGlV0zzS1vFEiVRn4=;
 b=noUpZ8j97GqwHMYOvJisw7f1c5RPcmj6X8g75l1ibCCLPrwiNcX4hO4oqSiT2dyYF0
 DDVHpPNWwdTZYDsYEc0fjNh6Ds6meb5j9tvoJVw14KNBPJd30ClxKzLwsvtMcrl2Kxh1
 w9KLfbGe1gpVc5NNXQjTQiqs4ZgNov+dsq+J0JZeNF+Qit3Nt5d5P/8b73hsRvDHVAYf
 96dmrBUEmT/9gh2c8HNlBj9Mq223RcXtDVTBiMA3ManQbqkjVwq90ZMn7KjZGhn3lx8r
 Xxygo0imv4rnJJdUlNvdMfYk5CUhieYqQyicZfcdkuGjRTO00ZIfXBuiuEY7TyRfYc7r
 /Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9im1Kc9g5XlZqij06cd6/OXySKGlV0zzS1vFEiVRn4=;
 b=mE1JS+NOLefhUsiS896L2MIBhR8BGXlBNWLpmVyZ7929DOo6v07xbxOsU6gBql15YC
 5RxP6nQXWQvJpfcWK4rCbtGbj3hpvznkn/p/f7jhpEhvQztvl3Zg5sxaJiX8S49P7Tql
 7E+vYdQerzu2fE9LRoN/aO/VH3PIxh9TXpc2XHgXPK+n4a1bqva2PONGKagIfqrQhfpR
 8lCijHaeHCvqvq0SBFbvuZOK+qPxHrvtDc50NY1ZnxCfw9YcQ1gQsOKKT2nYhbY5dCLl
 MvfuKrG6h894RVCpiLBnhkjhEL+TJwfFzyhe//OSvNTbfvDqyxV8ZOzsuXYTyoo7hozn
 oM/Q==
X-Gm-Message-State: ACrzQf2d2wDjdIg9bBWFPbseIsh6k4d8a/1GBC+nIDWv7aRfAFnbq4V6
 u/fyCOjXfTFFmRAS2PTxzaaCfg==
X-Received: by 2002:a63:ea4a:0:b0:439:4695:c0f8 with SMTP id
 l10-20020a63ea4a000000b004394695c0f8mr40311751pgk.440.1666852660921; 
 Wed, 26 Oct 2022 23:37:40 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:40 -0700 (PDT)
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
Subject: [PATCH v4 05/17] e1000e: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:53 +0900
Message-Id: <20221027063705.4093-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P8QJJDGPOUa+

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
2.37.3

