Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp718437lfc;
        Tue, 9 Feb 2021 13:34:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNKMKLv/5duGEvp4DdL2U616Wj7WkttZxI0bmlsZ09crX0Trwt7KKg65vXvdRgGfsdoQMZ
X-Received: by 2002:a25:b749:: with SMTP id e9mr21381753ybm.457.1612906445882;
        Tue, 09 Feb 2021 13:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612906445; cv=none;
        d=google.com; s=arc-20160816;
        b=nCHyyQrhYgLEc/1PBNV1pLxAzDb2HX6C3rnLHWkYYVOf8uBQ+wBCQKJYYsWPTnUqFc
         Wdr3hDhoiUK8D6i4pmoiuQqmw6Skq3jsH/B592qiQNXxgm9jW46AUpsYtxV+p8bfZCgK
         KEDgXO/vTDa5XZjBMOfHDPWV+CiKh0WRIUNhTERWjAe1gd2YOoqXUcHY4LUwXx/ar/kS
         DwEuXmntavysF/AsFTVx/M4PgRSbDgWm7L6y/VbrXhrHRpSimxM2rGwcB0Y8RXMHvWq3
         neWR5rwp0A++129HkhKUH//5SOaW4xV/w0D7nk8sTx+S+dH5TyqvXdgDS1p561zm0dTl
         S1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eP1V1Yt8BFynZ/3tam4pB4MEw6iwQK4rh87kUZHLrmU=;
        b=HYV+BmPKdAqIjwCRriMcCaX3DzvSJ7ftibBWSxSi01H8S7jyIkORdSpjFH2KkTFpFY
         muSgIEg/j+lGDPjkvtS2Jf8LJE6ovEHBFbOcmrc026VA+cNUqWeN1s7Il3AfwZRL7KCx
         abovUtl7wxjoIWggWfZIUtrsbRLlqMugOoTKO37BYEtjY638XkDHPryltbKJ1izalFFI
         Tc4XP0jKwU6Y61RVNJytAtfHW63egbXbVWvZC0LRp5hKzQ6BiCrhoPYBSJwrypRTVfXX
         iPhjGbmdFl1jDFRmNLJs76iaZLH5awiPQSDk8xCBKAy1hOR7REEQLxpZgO/+R/zQ39E4
         lUPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ASbbjtNi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si23205ybi.151.2021.02.09.13.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 13:34:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ASbbjtNi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9ae5-0007n4-AP
	for alex.bennee@linaro.org; Tue, 09 Feb 2021 16:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adH-0007lR-5Z
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adE-0003QL-2V
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612906390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eP1V1Yt8BFynZ/3tam4pB4MEw6iwQK4rh87kUZHLrmU=;
 b=ASbbjtNi/2qw/0cvaFLwpSQwUnCwRkan83IfkKOmlBKMX/RCd01ufsf86mQnfR03qs7G+p
 jh9NrqMM2EibASTYLEvsRJc4t72Fmgf00NGB7ZBQjHQxSG3trinPpcM41KdMvenmop1UD8
 u9fXW9I+1kEfLLCNDuPVkqQGKCmcwqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-pD5dNaWbNnKd9yQlo28jkQ-1; Tue, 09 Feb 2021 16:33:06 -0500
X-MC-Unique: pD5dNaWbNnKd9yQlo28jkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E2C107ACE4;
 Tue,  9 Feb 2021 21:33:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B3C5D745;
 Tue,  9 Feb 2021 21:32:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
Subject: [PATCH 0/2] Additional vIOMMU fixes related to UNMAP notifiers
Date: Tue,  9 Feb 2021 22:32:31 +0100
Message-Id: <20210209213233.40985-1-eric.auger@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DrfxMRwSsfO3

958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb
support") fixed part of the UNMAP related regressions introduced by
b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
IOMMUTLBNotificationType").

However the case of the spapr_iommu was not addressed. It should be
identical to the others. Also 958ec334bca3 introduced a regresion
on the VIRTIO-IOMMU/VFIO integration.

spapr_iommu is not tested.

Best Regards

Eric

Eric Auger (2):
  vfio: Do not register any IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
  spapr_iommu: Fix vhost integration regression

 hw/ppc/spapr_iommu.c | 5 +++++
 hw/vfio/common.c     | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.26.2

