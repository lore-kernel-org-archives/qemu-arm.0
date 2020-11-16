Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3951608lfb;
        Mon, 16 Nov 2020 10:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkpWdrc4envmyMgQSDiIPzO1VUfLJ0wz0rV20mWt81KZu/qHuSvcj7I2REdGL2y+2JZjL3
X-Received: by 2002:a25:c782:: with SMTP id w124mr11465461ybe.267.1605552447617;
        Mon, 16 Nov 2020 10:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605552447; cv=none;
        d=google.com; s=arc-20160816;
        b=zAa70XtCqtNvbK5NyWvZYur6vlS0dpRVv6jVvBe6YMPUGpWSggNjdAhVpuDQB4dpKW
         +1hEPWjHTy0C+uUtyy9xjNlrEC/wY19BIhbuMHQDPB4uom1+n4c3HFMaKAavESbuNYgw
         HPQE9kMJOSJi1P1ef8ghhtSw4boYMlRp2PXLHYSzXyX8hn5VHm4DXhj2QkJy+fs5lBhW
         RUmYrUtB5JrAAv9OqrFXwSJaStQJhGNcH4U1lMINcJ+eJwsGTF6CfLH6kp1n5y0qeodk
         v9Bgd/bRgDm2E1pX1Uo/Ovw/AhE2wlVx6wDXNjOTjSYIn3mw2BDQ7/09mknl+TVZqz5S
         KzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OcBBIrFYo2jb5PRoCbbCMLpaw2ICPZqc+4M/2AvIapA=;
        b=SQLa0Il4/x6x4qXs50vfWzi12ab9qBMn/uWCZBIa+u8TIjhK8YiUWA4xmXDJldVPa3
         /ZL0mAuF3uHpuEIEKiBHu/Gc9wNU7fyEOWnYVJqLa0bmsS2zuIkQQc7T07hnt1Gt7TyX
         ABQ8PRdOTBYi5bpqK6BixXmsGnNNH/n0hDwaDNNtFJMrFefsyBspzS78Hid1HZGPjH3+
         qBOeW3DXsZb6KX9xZXysPRJNPO2cjT7/jh0O2kLSaOcFL172GFD+b9BJfpLE6Ox7FZ/n
         v0oShYGV6D35Oi3u/0WCfTIdw9xq4A5hQeiuII/PeZdAhASbTeuYv7iHyNeOYZ7DGMir
         2rhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I74KEG9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si18831092ybf.319.2020.11.16.10.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:47:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I74KEG9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejXD-0000CD-0n
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4w-0002tw-2J
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4t-0001uZ-0f
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcBBIrFYo2jb5PRoCbbCMLpaw2ICPZqc+4M/2AvIapA=;
 b=I74KEG9FLVaJYFQ7KQ57jQ7n/GAJbvgIlFdGpE8FkpLkbXvqj8cQJcQ0AZGPYgELTpwscO
 jUpHiYEhkXjGSZ8XJBs3fLd5fMDE6ddjGA1S40fJumQBj9UUe0aDbAXW0D4wCRt/xkI45H
 Arn3XpEVBLSGvtpvW893cbIocugIfOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-0VoztgE3MDuvfOa2nxIS-w-1; Mon, 16 Nov 2020 13:18:08 -0500
X-MC-Unique: 0VoztgE3MDuvfOa2nxIS-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB4A1084D6E;
 Mon, 16 Nov 2020 18:18:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A60E5C1CF;
 Mon, 16 Nov 2020 18:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 24/26] hw/arm/smmuv3: Allow MAP notifiers
Date: Mon, 16 Nov 2020 19:13:47 +0100
Message-Id: <20201116181349.11908-25-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KsusbJXamjoR

We now have all bricks to support nested paging. This
uses MAP notifiers to map the MSIs. So let's allow MAP
notifiers to be registered.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 5488c9e925..fd69898c08 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1540,14 +1540,6 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     SMMUv3State *s3 = sdev->smmu;
     SMMUState *s = &(s3->smmu_state);
 
-    if (new & IOMMU_NOTIFIER_MAP) {
-        error_setg(errp,
-                   "device %02x.%02x.%x requires iommu MAP notifier which is "
-                   "not currently supported", pci_bus_num(sdev->bus),
-                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
-        return -EINVAL;
-    }
-
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         QLIST_INSERT_HEAD(&s->devices_with_notifiers, sdev, next);
-- 
2.21.3

