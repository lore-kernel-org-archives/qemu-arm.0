Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2020461lfb;
        Thu, 7 May 2020 07:32:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypIV0N+H0EXzerxKmv5g2Rnuv9jFNtERYk0reqLaVFbalw39yYx0UEWI9C5Z9fjAYXj9xvNY
X-Received: by 2002:a37:c08:: with SMTP id 8mr14720706qkm.47.1588861959962;
        Thu, 07 May 2020 07:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588861959; cv=none;
        d=google.com; s=arc-20160816;
        b=G/BxRYWGwOiATyzNqos445Ihbhqez4LK3quV9A5P3Q8nUupEMztYuhABmKyFIwiTOo
         7/EcH3yIE5seEYyHuxF6uT/ywrz/JNGGjGFb8hTRJPNVyJ1WGewGs9wZjF5PXvbvHHf9
         ZwdRtLN9xGxFqhoetrwjyXen3e7Howllbq2V+5UAWBFvtIiIU0WV7mRPLSzV7HjdMk+c
         GwfNsBNTfLYwxt5RxTqNJaGIEqt3mttVcWTREyKr6gK6qPv6mkRu1ijeSKMty0ICJaHm
         oq5Bstfy011UJk31usz4k4a/ugAcvugUoy8tg1LpscTDj6SGbvIYaVCNK/lJJoL9TtZb
         nP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=kJBIOjg1/vpKO3dXS6/GfKGaHw8J1OOw7+Moht2OEPE=;
        b=iBEPfhasSD1jUAUoZKoJgY8flayt9gqW84LJfNYd9L8zhlOZnYMnBhz9ID8/EcjDPD
         8bVl1UBNDY48S7xkVTZh5WAgmuMCbVDYiarEiyrS9nJ7uFiL1F2OOzAu7W1q9h85jQfI
         y3p4Fx3gd/bF9CftXD4AVv2F5th8aReYuMaA0OX1EWyfs3ujUHf6RWbDBu+P9V+Qd5am
         dYSQd3cClqP4kAELb1cDHXH/lsbq+EI4neJaea2UscFvQbr4JsR7ehPZSYtR8aEg4fkF
         g6liS8oU4UP8gXQi62p3BLzpPOGIrCHaqfEYyQCB0xjYmkR4Ub5r8U2FjpdRPMRuRPak
         bcJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Se9k//S0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id n4si2967090qkg.96.2020.05.07.07.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 07:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Se9k//S0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWhZn-0000Ce-Ct
	for alex.bennee@linaro.org; Thu, 07 May 2020 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZb-0000C7-9u
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25231
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZY-0006GG-Dj
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kJBIOjg1/vpKO3dXS6/GfKGaHw8J1OOw7+Moht2OEPE=;
 b=Se9k//S0utlNNGGUhqJB2SXce0yRNmZrF/jaReEaztWMMUgSXfOlkkc9OtR82vTMUwSGgy
 Q5AbfzC9yurX5YLd0CqukVXfb+43nmH6MvJ91UGz870UHal42uoy3E/Ssl6iDbiFj2isGD
 CSZjgmmBR1yJMKdsgL07wnvK11qTwCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Lm2wdatrN8ey0lwBs9uTUQ-1; Thu, 07 May 2020 10:32:16 -0400
X-MC-Unique: Lm2wdatrN8ey0lwBs9uTUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98D6A0BD9;
 Thu,  7 May 2020 14:32:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 418B7707BA;
 Thu,  7 May 2020 14:32:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com, armbru@redhat.com
Subject: [PATCH 0/5] VIRTIO-IOMMU probe request support and MSI bypass on ARM
Date: Thu,  7 May 2020 16:31:56 +0200
Message-Id: <20200507143201.31080-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOfeHOJqA5EB

By default the virtio-iommu translates MSI transactions. This
behavior is inherited from ARM SMMU. However the virt machine
code knows where the MSI doorbells are so we can easily
declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
setting the guest iommu subsystem will not need to map MSIs.
This setup will simplify VFIO integration.

In this series, the ITS doorbell is declared as an MSI region to
be bypassed by the VIRTIO-IOMMU.

This paves the way to the x86 integration where the MSI region
[0xFEE00000,0xFEEFFFFF] will be exposed by q35 machine. However
this is not part of this series.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v1

History:
- Most of those patches were respinned from
  [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
  except the last one which is new


Eric Auger (5):
  qdev: Introduce DEFINE_PROP_RESERVED_REGION
  virtio-iommu: Implement RESV_MEM probe request
  virtio-iommu: Handle reserved regions in the translation process
  virtio-iommu-pci: Add array of Interval properties
  hw/arm/virt: Let the virtio-iommu bypass MSIs

 include/exec/memory.h            |   6 ++
 include/hw/qdev-properties.h     |   3 +
 include/hw/virtio/virtio-iommu.h |   2 +
 include/qemu/typedefs.h          |   1 +
 hw/arm/virt.c                    |   5 ++
 hw/core/qdev-properties.c        |  89 +++++++++++++++++++++++++
 hw/virtio/virtio-iommu-pci.c     |   3 +
 hw/virtio/virtio-iommu.c         | 109 ++++++++++++++++++++++++++++++-
 hw/virtio/trace-events           |   1 +
 9 files changed, 217 insertions(+), 2 deletions(-)

--=20
2.20.1

