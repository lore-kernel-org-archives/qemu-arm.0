Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1700650ejn;
        Fri, 21 Oct 2022 21:51:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GsFxVvMDyQJ1RFXxsPP8xCj2ozYFDyOtdgMxodbPu7pzvYtubwVtpkg4fQH6RbK4WVTiy
X-Received: by 2002:a05:620a:4611:b0:6ee:9e55:9d30 with SMTP id br17-20020a05620a461100b006ee9e559d30mr15631016qkb.210.1666414275017;
        Fri, 21 Oct 2022 21:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666414275; cv=none;
        d=google.com; s=arc-20160816;
        b=cEUm/77Xhw4je1LrLPpb7yBSLJ3B1wREFqmYYu9ERWvd2TALvZ+VTcS+cRkoNSY/CR
         /NreKN1W3eHqyTIbojtFQ3r+qeLk6/3GTYBDqSsQFX5IeN59coELIVYPTw6r4f86tsCz
         yaOe9wmRmEq//9I1bMRknIy4xXT3RmH+/ptpa61TvNUL0XkTyK+kwd4CAUeI9sk9FDSF
         nizv1WzeLQNFqVPkdLFp9O15YRo3SlivOS9zBqxdK23U2u9SAiyKitIZ7IKjVqzbnLFE
         LKkr5jpcrQ6bTEAaVT+6HDtlbgISQkG2udccQuVwPTWw7cMTGyuZMEXaIUmJNI6Ln038
         0ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JFjzWYhe7Y9NH2JbRDxlfUse/MZ6HITQ4JnxKzHTw9M=;
        b=gcldB+87iNGbSVtObriWPYHtLrWDyoV9oPK+yBwQnnknS9sXxtCVmyqjX4VQtoA/bR
         iUj21OTbKjzsNpH6O9zdMV57Qxztk173bxwey2ezVngeGYasFpB/IE5pXLiFATJ83AlO
         s2a10JiKckRmocroV8p3Qu6rT3MOxy0iUOCTUYnmsGEAEMsSfV3HFeXhycitKK4TdIdw
         8uD3Nv5Gbm6c/gK8aDS6NYsGN1gvpjjzjCLQz/7LUkTP9ygi3celEfNLhhojoiv+cNLX
         xdsSAqcgsMRQ6xhrlvCmGebufdIL6lwJCPRpTnlx2AGdu3IlhsCnOs90+fYZxcKU9F99
         CWYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=NaDRBl4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac87e84000000b0039d135de6bdsi3963474qtj.577.2022.10.21.21.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 21:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=NaDRBl4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6KR-0005Rc-L0; Sat, 22 Oct 2022 00:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KN-0005QD-PC
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KL-0003kD-Ru
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g62so421882pfb.10
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFjzWYhe7Y9NH2JbRDxlfUse/MZ6HITQ4JnxKzHTw9M=;
 b=NaDRBl4vPYQ7I8NYlPtUz83hd6CeNQz0xDJvU1nphvIYqnSPsHbBhDkTxgAIsIVeeU
 6Inxyo5yigV3zuukLrs7jtetxlCLRki6zNtbqtvS8Hjtxn+jtJMI6K6MXC4YDFqdgL7H
 8CYPQzARRXstPBZkdTIXGAVTW5N/9QCNGkyQHdH6jbeyZYBzb7RlitXA0vdWy/f1H1eJ
 rMp7L7a4QtZKCn03rQ+SNmUHUuo1LfuAOSWcg1cmhdSsxfyvHeCcGcD/ZHGzmlh/ejdQ
 lWqryIQphHbhijE4PrA6CXb3nEHUzlYAdxyE1OZVfFbdFRVlWBc9M8ME+d8U3lhaVEDF
 TV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFjzWYhe7Y9NH2JbRDxlfUse/MZ6HITQ4JnxKzHTw9M=;
 b=3AbvgDI+dpjRc6L2QeSxhWCMv/8/4OL787hOl3eY9cL0QB9kFwUItUb3152JX7Aeym
 nEYvifru1AencuDeADyE3pReUTCtkyKqFa3hUF7PhKs+nyzshUH75FunJClM3B7RAv0r
 eWqzjSzy/PQQwEJfwqVAqWfkQB006mBQSGCMIJn+BwynnOt2YrTTdO0EtJuibQidm0Fz
 fSLTSbaV2nEP5Odfk0tmJtsYFRA86P8Z4NVC6gS0fHYhxs9czdqmAGlxeoiN9SyMy0YN
 wHQQBOG8ZSEQVQUJXLpCn+5Y0sB3fPvpDpDcZYnZhvBKVzNDEQmdJdnhU7sa6eX426Hr
 JpGA==
X-Gm-Message-State: ACrzQf1W0rmPSQj9JTXEL65y94lr0xRHVJCXeDDOe9clo9Y4GSUs/cNc
 g2WlbjuGS6cuiFFC6HWNDFBYXw==
X-Received: by 2002:a05:6a00:228f:b0:566:6ecd:29d9 with SMTP id
 f15-20020a056a00228f00b005666ecd29d9mr23062031pfe.62.1666413700686; 
 Fri, 21 Oct 2022 21:41:40 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:40 -0700 (PDT)
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
Subject: [PATCH v2 06/17] hw/nvme: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:42 +0900
Message-Id: <20221022044053.81650-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wMeu6pvVnZ3z

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
2.37.3

