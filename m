Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4383090lfq;
        Tue, 29 Sep 2020 01:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHtQFx/N2pOKBd/dfe1HZJr5dFyth1fdwTut9E9ydbvaGgJWf2CIs49xoDPrL5RSeTZzle
X-Received: by 2002:a25:8e05:: with SMTP id p5mr4879782ybl.370.1601369793135;
        Tue, 29 Sep 2020 01:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601369793; cv=none;
        d=google.com; s=arc-20160816;
        b=E7AiCinz8wnAcNCHVyTthHYZN3SpWSMugLwFTraBDXkmCjhtpM6htinSqbOOTINGOU
         zReXF9ahCl+7PnzmEX4SHHe7K6INLgOZZYLcss8SscWohhQEDD84KA/NCgrrfy/6Rbx6
         3fwen+5G1UgP9Fmn6sRNb1iedSop3bU+5SBlAPs0PYteYKRaEKHNTp3yLPHatoD5t5Aq
         yF4Wda3pEm2HHZSxFcDF6crUhDL/Y319qm4scpu8E0FWOTeoCWEIqpK8nd7G7TB0pBe6
         2Jc7W6tASYVIM5L8Hw1X7rB5OGOP0+ND28SrS2ZbH4e7ji/A3ACeFZD/p7I7ZwE1FIfk
         Lksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=u/J84kmOSP7AfNvh9mEFkOHuirkAtr85pDh5FYd6++Y=;
        b=o0UzevAYFO26N5NvWk9qEJUR2uPE6LG9p7/lweDaNymH3uzyLR0Mg7N2v9sgHg+6zO
         TaW+4cy8z+oZXt8vP9SHvY5mGjJF8rs8FPSknf4i+vyLhw1cY3qHEYZgc13wTTZvzNS1
         yJ7i5O5Ln2uBXjopjvh9GezAIaHsDq4FHQVqpr1Ebsoc/tkGMZHuTITFmlaiUjlV6T72
         eVMBJxcjKKHs7OkR8zBv8PWgSDlIK53eHY02l2aHMMIC84zFdoOLG+mbudHY7M+z+RX4
         2FlzyMTwn15KGPabhQnTYkms38mJqDMC91s9SZwu5F36qRGl/n9y+W2I975jUoW89Rne
         bCtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Gj/nEIpa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si3555677ybb.273.2020.09.29.01.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 01:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Gj/nEIpa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNBR2-0000v9-Hl
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 04:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNBQj-0000uh-PF
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 04:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNBQh-0000E9-3N
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 04:56:13 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601369770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u/J84kmOSP7AfNvh9mEFkOHuirkAtr85pDh5FYd6++Y=;
 b=Gj/nEIpaRBhX89GYutyxJJZzrIXTe2nv6nKd3mpE5NkoOswmRJme+FH9KPPCubcaU/zgCA
 LZE3j4r98DmTA3FIC30Z1muY7pC5GTitRJGBEeunFeyZduhDUr4LbsRsMTiVAcQxZF/Mxr
 xj0/3uQUoBapnDmpB2kBqJs+P3eWTAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-4CM3dNo7PcG31xkYascORQ-1; Tue, 29 Sep 2020 04:56:08 -0400
X-MC-Unique: 4CM3dNo7PcG31xkYascORQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C9A9CC02;
 Tue, 29 Sep 2020 08:56:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2BDB3782;
 Tue, 29 Sep 2020 08:55:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [PATCH v2 0/2] NVMe passthrough: Take into account host IOVA reserved
 regions
Date: Tue, 29 Sep 2020 10:55:48 +0200
Message-Id: <20200929085550.30926-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, kwolf@redhat.com, cohuck@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tB+rKacb3TOh

The current IOVA allocator allocates within the [0x10000, 1ULL << 39]
window, without paying attention to the host IOVA reserved regions.
This prevents NVMe passthtrough from working on ARM as the fixed
IOVAs rapidly grow up to the MSI reserved region [0x8000000, 0x8100000]
causing some VFIO MAP DMA failures. This series collects the usable
IOVA regions using VFIO GET_INFO (this requires the host to support
VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) and rework the fixed and
temporary IOVA allocators to avoid those latter.

For the time being we do not change the arbitrary min/max IOVAs.
In theory they could be dynamically determined but the kernel
currently fails to expose some HW limitations described in the ACPI
tables (such as PCI root complex Device Memory Address Size Limit).
See kernel thread related to "[RFC 0/3] iommu: Reserved regions for
IOVAs beyond dma_mask and iommu aperture" for more details:
https://lkml.org/lkml/2020/9/28/1102

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/nvme_resv_v2

This was tested on ARM only.

History:
v1 -> v2:
- remove "util/vfio-helpers: Dynamically compute the min/max IOVA" to
  relax the kernel dependency
- Fix cabapbility enumeration loop
- set s->usable_iova_ranges=NULL to avoid double free
- handle possible u64 wrap

Eric Auger (2):
  util/vfio-helpers: Collect IOVA reserved regions
  util/vfio-helpers: Rework the IOVA allocator to avoid IOVA reserved
    regions

 util/vfio-helpers.c | 129 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 123 insertions(+), 6 deletions(-)

-- 
2.21.3

