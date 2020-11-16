Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3868499lfb;
        Mon, 16 Nov 2020 08:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpVqVOkUkLwDbCXUKrk3iu0/T68J/u+laHnmE6D/muPU5wzQDz6PBWvKp23fuaRsIfKFDp
X-Received: by 2002:a25:9b04:: with SMTP id y4mr18863316ybn.397.1605545965318;
        Mon, 16 Nov 2020 08:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605545965; cv=none;
        d=google.com; s=arc-20160816;
        b=DMpxSwsehO9Mbnn6EbOYcQqHHye2VrvloiwxF/aHPnZNb5XYzUeIMkz+9VYVigNch8
         11gus5D83X9tKKFT0acE5q+2YLFzBge5PWgZzhBl32zZEVNPzE9ptMRybi+lT7i1L6ml
         TAlvIl+xTnjlLJ1J/7l3g8C/c2vsLJ0D43Z3zq+mPr8US0cBfCdDP874W61JwFHJtyM9
         Wom2u+aLkrHhM1MzWnBn+6YjxqN5P6F+8WG0Myp8na998FwbGlUkSnau0PIShr7mP66x
         FQfw/uC3OHSGRJ6xA5uN9ytdcJnoyiSmgnHBraJos4XLG+eCT5JVfZPUS33xUvzWJNGD
         u3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YpKGp2cvSV8RuhJ8Dyj4nZG7xYYU/jxTlXTdw1YDoh0=;
        b=SY21qpSRXLm5Xg1IEs/iBznvCfs4NzOAD5RK3XRHBEJxRB7Q4bd07GcgLcD3md36IG
         FnXGDQtBzToL9M607k7Lzp16fzwChbPUtPe64YPW6QdMjkNKF6W8ZwMVDsuEFNgNA1cu
         O7PB8nUDsY3t6ZG0N9qS/W5JrmaXDfXwVrWIGDkVrtzdjmZ6F5ZWPZ6JaxgL/HGvyovy
         FMiL+8i78FiDBNzBkqRYcJYT8/azmO3AcSnwgg4oCt8UfuRx8queyf7IvPBXefV1iRCp
         Or8qJMx8HM9ISW0qlOw8ndvOUd7HTU8ZSwQJCnf5mfvN4lHA4Hl+knt+LbQu8/1Ka3zU
         QPfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L2Kd1uLL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si22360466ybj.197.2020.11.16.08.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L2Kd1uLL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehqe-0007Ng-PG
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehoy-0005ga-AW
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehow-0007xf-FG
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605545857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpKGp2cvSV8RuhJ8Dyj4nZG7xYYU/jxTlXTdw1YDoh0=;
 b=L2Kd1uLLgSx9DpKIgjLs61xAme9RfaTpM6L7vFs82LOSi8o0kI7OzbbijQvzGmgpD1tEME
 /GjucIyXHEFhtBSFQsOMIGWcKNxykrIpw84WnKemVWzpdbGsZCU4P3ySqNbCiZ4v9PnraF
 ywimK/MzPAieUfcyzGR0zTqhgrdI1Io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-bafT3saSPCGumJWKXxfSsQ-1; Mon, 16 Nov 2020 11:57:35 -0500
X-MC-Unique: bafT3saSPCGumJWKXxfSsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FFF81800D4A;
 Mon, 16 Nov 2020 16:57:33 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-134.ams2.redhat.com
 [10.36.115.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D4F5D9CC;
 Mon, 16 Nov 2020 16:57:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] intel_iommu: Skip page walking on device iotlb
 invalidations
Date: Mon, 16 Nov 2020 17:55:05 +0100
Message-Id: <20201116165506.31315-5-eperezma@redhat.com>
In-Reply-To: <20201116165506.31315-1-eperezma@redhat.com>
References: <20201116165506.31315-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Juan Quintela <quintela@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+rko0S3gGGo

Although they didn't reach the notifier because of the filtering in
memory_region_notify_iommu_one, the vt-d was still splitting huge
memory invalidations in chunks. Skipping it.

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
* TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
* UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
* UDP_STREAM: No change observed (insignificant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index edc3090f91..0cc71e4057 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1478,6 +1478,10 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
+    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+        return 0;
+    }
+
     ret = vtd_dev_to_context_entry(vtd_as->iommu_state,
                                    pci_bus_num(vtd_as->bus),
                                    vtd_as->devfn, &ce);
-- 
2.18.4

