Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4651234ejq;
        Fri, 12 May 2023 02:09:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4s5k4uM49O2hnNtE080FW/vtCKGtLsu8AzgIe2Ds6Oae8K6Z/A3WjHBu6dl79Sz07sa2ft
X-Received: by 2002:a05:6214:1bc5:b0:61b:7e5a:ec00 with SMTP id m5-20020a0562141bc500b0061b7e5aec00mr40730609qvc.37.1683882568175;
        Fri, 12 May 2023 02:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683882568; cv=none;
        d=google.com; s=arc-20160816;
        b=tdSgq5aJ8JK/+pYpk+VGJ1z2iwvolDVsS59dNDieZwFx6TIRqP/mHNJ5CYrEBbFfxV
         n+ATYAqz2ohdLItIeuuYJGHkzhXHpVyVe7MBhrhmUGkd7P2OeQ/DFMu1Ogph+09bMJJ0
         jvwKLToTADrbnyO40iezrOp30RdLJpnS+GL+ncwwcdbEqcJkwU28DnTjoa/B3/c/HOST
         X2jbrq+za53s4k705m/m73r8p2bzYKIPOJK0ESvRlq6ejZU/U4c4oDejkb+PHQeL8r8b
         O/wvzVxURijP8WLsb4DHSu1EB/HGvA3LT9gVCEtq+aYEgbgHKyrXGnGKBibEIDBCDdUw
         3zQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=TKk5Hitw/Hyj8U4HWgkZn1Ywyg3wXfeP5y22XUgS4E4=;
        b=T36kOOzQ1eayIYV+qRDeM/s2LOKFEx2IGzQbEDGcpvWaabKCH/HkwcrloQeNRKkc8N
         FrC4Z5M/LhYEBVgvNDYbwIVuBd6KmYmcNYQ5G8hIcPyjM94AVCQkGbeULZZ2UMDA2u5Y
         fhsyB3aah8hTLlE78o6qrdhQp/na3eUFr+/V7UpUz9K6Kz4EdY21uKSqn8oyLyxy4PSn
         dYRU7tT4mOEhUIR9q+JF36PL5ykzFU3419BEqdINIhiSTln3Xp4E4OTw+J+PZSfbTUQQ
         sGtlpu+QpPS8kid2ahs6E3WCJiwbcWbDhi/Rx83Po2bXeD76+rRjYwCViQMmEGiNhfd0
         OAqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp10-20020ad45f8a000000b0056eb4187816si1657754qvb.221.2023.05.12.02.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 02:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOlZ-0001vY-1Q; Fri, 12 May 2023 05:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxOlU-0001ur-Vm; Fri, 12 May 2023 05:08:40 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxOlF-00016R-5R; Fri, 12 May 2023 05:08:40 -0400
X-UUID: fc41cbe72f17487ba46bf498eebecf95-20230512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:7fc97de6-0594-49d7-b6fd-bb75101263cf, IP:10,
 URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:21
X-CID-INFO: VERSION:1.1.22, REQID:7fc97de6-0594-49d7-b6fd-bb75101263cf, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:21
X-CID-META: VersionHash:120426c, CLOUDID:f2a4f73a-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230512170809A5N0KE0H,BulkQuantity:0,Recheck:0,SF:24|17|19|43|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fc41cbe72f17487ba46bf498eebecf95-20230512
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1852617730; Fri, 12 May 2023 17:08:06 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 5CBBEE0084A4;
 Fri, 12 May 2023 17:08:06 +0800 (CST)
X-ns-mid: postfix-645E01F6-154027667
Received: from zdzh5-QiTianM428-A376.. (unknown [172.20.12.253])
 by mail.kylinos.cn (NSMail) with ESMTPA id E572EE0084A4;
 Fri, 12 May 2023 17:08:04 +0800 (CST)
From: Hao Zeng <zenghao@kylinos.cn>
To: pbonzini@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Zeng <zenghao@kylinos.cn>
Subject: [PATCH] hw/arm: enable qxl for aarch64
Date: Fri, 12 May 2023 17:08:03 +0800
Message-Id: <20230512090803.1170154-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_TEMPERROR=0.01,
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
X-TUID: /TTweYcOSBEU

Qemu does not support qxl graphics cards in arm, it is recommended to ena=
ble

Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..0305a4f4f3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,7 +32,7 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-
+    select QXL
 config CHEETAH
     bool
     default y if TCG && ARM
--=20
2.37.2

