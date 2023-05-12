Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4660532ejq;
        Fri, 12 May 2023 02:31:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UTXkbgee4F8lbpkOP+nExpnN78UOi4awkqJYuT4LMsFRXjQBtp7OY850JMYsKpZBOqxRY
X-Received: by 2002:ac8:57cb:0:b0:3f4:e9af:85a3 with SMTP id w11-20020ac857cb000000b003f4e9af85a3mr8444643qta.62.1683883913734;
        Fri, 12 May 2023 02:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683883913; cv=none;
        d=google.com; s=arc-20160816;
        b=SALZXaJzcMHucF09U2wpbOi7f7Cczb/AbzGIYdtYTPQbqZeYnrbh0eTcQoD6hifJEP
         cGeAe6oGtzDFxRSuL5/Mw4sdIhWBQqWNUx8l7pnSgHcwlFO2uTg8wNkR5bSctsihyjfm
         WlB8iU6eUg15pIXeojN4BuCAMuO7C8fqm+mtg56RXWKo24KPU7NQFbELm1l7lOR5E4+b
         M2i0zibNw6s+kuZLJAbnXv4iKLRQgr48dRYO+P4yloohs1qBQiby1+qlHbFwlGYVWLBO
         sLAlcQdUV0QOvzdHeXXyuGMzA5TknKKHAzM3My3Dr4yVTx+nV3pKCx1KmD9ocAyNC1XN
         nDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=ueToc05L3VtQ2ldy5tkM4q3Wgijpv9qFG46/dHJfIw0=;
        b=v2YDyx+74mYPJq5mgg/ErOTXBw53TPXu2AYbhg8I0x7w5A97rEnclHGh2hTllGuHgZ
         hvkE1iJQwNrP2De9Wt5CobD7uSaQp9QqnFNwSPqaK6RnLKeBvP4K9s8bxA1ba3/tUhMF
         62hrRBeIzOGUgA16sCCRkGR5WsOtvE6k0AACBaDDm2WEDXbcI5aGCFN1ie+aWa3r5NXd
         QjjAuoWTvGjxRPHJ+iTKMiSeGwSqZDfFdh+zj8ECsOOGeFD0YRm8fzD2YjLEQWM6Uawl
         HGB1Y9/FLyx9//ZXuvReYZWJlVBiJPOn2YNXl3suqZnosVzcdv4f/kjRdL7Au2Q5Cr87
         0zXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020ae9e905000000b0075533d216c1si5207466qkf.57.2023.05.12.02.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 02:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxP7a-0006nP-S9; Fri, 12 May 2023 05:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxP7V-0006io-PI; Fri, 12 May 2023 05:31:26 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxP7S-0006YE-O3; Fri, 12 May 2023 05:31:25 -0400
X-UUID: e288b10992cb4de7a799da77a14ab584-20230512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:44b1e119-3b1a-41f9-9a88-54a68985f91c, IP:10,
 URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:21
X-CID-INFO: VERSION:1.1.22, REQID:44b1e119-3b1a-41f9-9a88-54a68985f91c, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:21
X-CID-META: VersionHash:120426c, CLOUDID:3d7cf83a-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230512173112RBIG3N3X,BulkQuantity:0,Recheck:0,SF:19|43|24|17|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e288b10992cb4de7a799da77a14ab584-20230512
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 506198866; Fri, 12 May 2023 17:31:11 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id DABA9E0084A4;
 Fri, 12 May 2023 17:31:10 +0800 (CST)
X-ns-mid: postfix-645E075E-67668141
Received: from zdzh5-QiTianM428-A376.. (unknown [172.20.12.253])
 by mail.kylinos.cn (NSMail) with ESMTPA id 5AB8DE0084A4;
 Fri, 12 May 2023 17:31:10 +0800 (CST)
From: Hao Zeng <zenghao@kylinos.cn>
To: pbonzini@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Zeng <zenghao@kylinos.cn>
Subject: [PATCH V2] hw/arm: enable qxl for aarch64
Date: Fri, 12 May 2023 17:31:08 +0800
Message-Id: <20230512093108.1180726-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vVb9P7B/2eu1

Qemu does not support qxl graphics cards in arm, it is recommended to ena=
ble

Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..d0bedf9347 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,6 +32,7 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select QXL
=20
 config CHEETAH
     bool
--=20
2.37.2

