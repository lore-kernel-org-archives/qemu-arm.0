Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp351316lfb;
        Fri, 8 May 2020 10:36:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIwPGNYF/8NfelQpDSs138JMs63dSxWWxteMSCPYLd9nTXVkX+bKoiHU4MFo1lQa6d1kiW
X-Received: by 2002:ac8:4e0d:: with SMTP id c13mr4367083qtw.0.1588959417430;
        Fri, 08 May 2020 10:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588959417; cv=none;
        d=google.com; s=arc-20160816;
        b=AX5sy/8Hny85QPhKsy5UBLCplUZkC3nxVt0+w86+QbUX/OJ8rMMYhLbI/yWKFY4bRb
         iJRtIVUaLBOaggWTBvU8Hflpj8MYBrMfARv5KtqAqSEbpYnvi/ZnzvQaR9JI9veZiJZ4
         lxOHuWjEoU3H6u4Evu47ixhoOx2QPt13HjrIS/18KUrvkXdFd9Im1jBc1+BBoTSjcY6C
         dIWh37fq9Xqil8VHZnXektr2QLcBFX2re16gSKc7gonim8+dwXrQZr1GAioTv+tNXzNa
         Y4n/igBMbgmN4ISlG8m/i9pwjqTvAnJ8FY3heODpfl4WHURIrNRkpXaVSN92Dgf7rwoA
         uNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WCTTBivJXDHLFnK3lN4w62tWJmBEn8J2JUhNXMMZ4lA=;
        b=0EinWuQpDdJbcYN19JpmqnePAEDUOPKoEAHuh/GuGfPS74KqUS/qfo0rk1e/snGgyI
         dK4oGp6uflaXx6DPbgBKTWnqIMhQfY+dJ/0RktV+CHb3OTgOkzsEckdhZQKHOcr+zf13
         HoneTshENEhIMy9EO/giho1+1HQUbZ83BhJsO+/epC/7Mb14m9US254rESiN8ZJIEwAF
         hu+XcOArnMjgOSC3kvybsgLwxx0e0qrsvNcQTn3foqfMmEBgbqVbDisItti/f/wUAkV1
         mKXDVpdVwf8tFPls9uPnzOs6frKuylVQxbBb/KnMOM8PFYi8hP0INw+5xIZ2/AI17bf/
         mDSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBILwCMh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si1317657qkn.281.2020.05.08.10.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 10:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBILwCMh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX6vg-0006F4-Ts
	for alex.bennee@linaro.org; Fri, 08 May 2020 13:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX6qX-0008RT-IN
 for qemu-devel@nongnu.org; Fri, 08 May 2020 13:31:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41791
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jX6qW-0007l9-Pa
 for qemu-devel@nongnu.org; Fri, 08 May 2020 13:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588959095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCTTBivJXDHLFnK3lN4w62tWJmBEn8J2JUhNXMMZ4lA=;
 b=VBILwCMhW3Oo3ybEW3tvmkbcf+tm5ltoW8NrLB7mIRHAEA1E1Ml/6fkYG9OJfE82PoTupm
 GyPZMoCxikAYlFr9dUh/rDtrhD4TwuVUYdPi2idHMVn5kcCFXvCDzD/8fxZbsmNJzPOlNi
 xFqBBJw754qm9uOKMXtG8vH9LGKNcmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-fqKl9rmOOXugj7Tl8qyUQg-1; Fri, 08 May 2020 13:31:34 -0400
X-MC-Unique: fqKl9rmOOXugj7Tl8qyUQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39A8D19200C0;
 Fri,  8 May 2020 17:31:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B960F60BE1;
 Fri,  8 May 2020 17:31:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, bbhushan2@marvell.com, peterx@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 4/5] virtio-iommu-pci: Add array of Interval properties
Date: Fri,  8 May 2020 19:30:56 +0200
Message-Id: <20200508173057.32215-5-eric.auger@redhat.com>
In-Reply-To: <20200508173057.32215-1-eric.auger@redhat.com>
References: <20200508173057.32215-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HhUGxLhU3nfG

The machine may need to pass reserved regions to the
virtio-iommu-pci device (such as the MSI window on x86).
So let's add an array of Interval properties.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v12 -> v12:
- added Jean's R-b
---
 hw/virtio/virtio-iommu-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 3dfbf55b47..44ae9ebc11 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -33,6 +33,9 @@ struct VirtIOIOMMUPCI {
 
 static Property virtio_iommu_pci_properties[] = {
     DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
+                      vdev.nb_reserved_regions, vdev.reserved_regions,
+                      qdev_prop_reserved_region, ReservedRegion),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

