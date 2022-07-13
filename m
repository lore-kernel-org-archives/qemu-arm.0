Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368543lfp;
        Wed, 13 Jul 2022 13:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uClrdKIe3pxqJsBOUPSpvMj4NNDKvuC/tw+p7Nvaxz2rpscMqpWaOKfrRzuBygj9k5cKvZ
X-Received: by 2002:a05:622a:2d3:b0:31e:b00e:ab31 with SMTP id a19-20020a05622a02d300b0031eb00eab31mr5058190qtx.460.1657745186856;
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745186; cv=none;
        d=google.com; s=arc-20160816;
        b=QWJYeQFOv1n73jo7JET2QXlmmsTY6vEbtJnC3hHDNe3nfperMuVOgtvP1GkOzq/Yk/
         W1STW4nrSm4lpZL83mUalT3dofL5Rhgpb/xrdMHRdGXO9FInS6f482gGd68c4SYSx6Za
         jLD5m9lEJ5CtQUrj6l+hXYWglUiF3j8Cicq9zRiWJ/0QiObB51LVI2Gy+ulM5SgVNl0F
         29AjjJVtlHb3NMZQSalIcufwkuhMoc3ZNgjef/Q+xRO15NdJuYYXYFxHC+VYqSfKZSbo
         krT5gKeQI1ZUthpJQ7hw/BNEWJ2VZJPqHoMUjpQ83QfgI514+NEfemja2QHnI0+IRbqM
         fmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7Ym/0UewYsJclqyjgxFRKS32miEpez91YXpV6pQocqg=;
        b=tQw4jGMcTd59JXdIN9scE222th5gy5hAeKM425DoB5H/bsx0WLNEWoDmVDUGiCxEU0
         6eQNMTKGe/rfhkDyXqiDO4HOXt+wrUW5/Y02h4MKdRO29EaJ+zSH8hedBsyo45OvnjSv
         HDVcbCHZVP14prHABrYWrbI8lOUbP1kM+wNAby2gu89rcShm+g4+H9GfGbwvTbD86xn7
         Gw0S0Vn1UyC3A02+AT+KE/sxAO0bJ9qGPplj6WIBkP8S190hFP36e4ozl51gK0zwKRWK
         DFt6exHhjyB9ptOcbnSQZKQWlB+WZ/dSSCyqk0qZU9Q1CL9TxfoGvgSRSwgvSrPFwR85
         +DXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fy25-20020a05622a5a1900b003050f9b59absi8174833qtb.68.2022.07.13.13.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjFZ-0004rv-Fp
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwG-0006Ys-IB; Wed, 13 Jul 2022 13:14:16 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:48444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfw9-00038p-L3; Wed, 13 Jul 2022 13:14:15 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8q-19; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009l1-1y;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 6/7] pci: designware: correct host's class_id
Date: Wed, 13 Jul 2022 17:54:48 +0100
Message-Id: <20220713165449.37433-7-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCkbCqAagx+N

This is a host to pcie bridge, so use PCI_CLASS_BRIDGE_HOST
for the class.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index b5d5b2b8a5..a47ae48071 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -615,7 +615,7 @@ static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_SYNOPSYS;
     k->device_id = 0xABCD;
     k->revision = 0;
-    k->class_id = PCI_CLASS_BRIDGE_PCI;
+    k->class_id = PCI_CLASS_BRIDGE_HOST;
     k->is_bridge = true;
     k->exit = pci_bridge_exitfn;
     k->realize = designware_pcie_root_realize;
-- 
2.35.1

