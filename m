Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2021062lfb;
        Thu, 7 May 2020 07:33:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypJnQJWRl9rIEU8Th+1ujTYt2xocgDRDjtSHaZkhoXn7kYQTeYsYT9lvcGbIBQVxiUANtbM8
X-Received: by 2002:a37:a2d3:: with SMTP id l202mr14788400qke.94.1588862000079;
        Thu, 07 May 2020 07:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588862000; cv=none;
        d=google.com; s=arc-20160816;
        b=0UgLFvWHESXYHBSm0gHY7eNkoy4g3Z4M9DC90KE7FtLslZVAO8OfjneI0PD4uNyrpF
         ouAcRFsAMLkYA7GleYQmeInJj/RTf8ii+UPtOGCUgDUDuu3TuUu/O3yb3oYpNyFiK4v0
         x/orZGoJ7WBN/5EuyJaKQeCPU8w740a162vftylmQfWTYxI+zpT/BEmYl1fTtfeOvJD4
         AvpDyBXCBePpd/+0ZFwlOZJPzjPLaq9KG7UC9nLxJJv1FEIbsE+Zcptg9qGWBGimngx0
         Vr2iNDAy+DAJhpjsMHYx+8jI6r9Iw5//TLhI1cYd5YDiiV4eLoQyItVlkeqxfwKnrCkz
         013g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dC1vT8dt9LW/27Vku2CwU7FmTQyZcHt3xOQtVefn2R0=;
        b=BMtdumpgrYn0+0Odd/FzRMwE4q+GyfNt0eBjMCssOj4FTsBiw+1bDbMfO9f+N0Kw79
         r/qBG2lNv6VH+W9TXcWAGIsgB/YHaVHgoLQkMgxH9wbwPeQ0GOphIvETC/3/UtLY5GJ3
         joexwrhs1tjNr9XdCfge20Z+xbLhifH5HP3hKhObdXwA3yjVjeen+PeBQnzY4ls2dg++
         b/mr01ekBDTvqP816TIKA5DhPiozqlSOJ48fngJKeKFXB/x/9ve9r/mvFAYYbnWSat62
         px33U8UdVZPFVPnGj5tSv8UIbADeND8RKmNWd5n7sgnHHr/4tPMys1agxn9A/s1a3Dh4
         gnLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foZWEx90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id y190si3110333qkb.74.2020.05.07.07.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 07:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foZWEx90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWhaR-00014k-DI
	for alex.bennee@linaro.org; Thu, 07 May 2020 10:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZs-0000jp-Nk
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZr-0006gk-EK
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dC1vT8dt9LW/27Vku2CwU7FmTQyZcHt3xOQtVefn2R0=;
 b=foZWEx90PM7N9w2DIfjatCDYy+uiwbXAtRVrHTu5em9JyBqF7L2jmenv0u5CcoR88X0Q1s
 ABss95NSOlsxxrpQV908jHDgLKfW06/QJ2HwPWsiN4Tf+y62MFRk3mf8mlB8YbPWxYtVTZ
 3hQeenDx4+icDUOoX3fGYntRTJ+OY0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-jHpqjUd9NPew0Jew_Hg4Hw-1; Thu, 07 May 2020 10:32:37 -0400
X-MC-Unique: jHpqjUd9NPew0Jew_Hg4Hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17BEA872FE2;
 Thu,  7 May 2020 14:32:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE14D7055D;
 Thu,  7 May 2020 14:32:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com, armbru@redhat.com
Subject: [PATCH 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
Date: Thu,  7 May 2020 16:32:01 +0200
Message-Id: <20200507143201.31080-6-eric.auger@redhat.com>
In-Reply-To: <20200507143201.31080-1-eric.auger@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 8mUmJlqQvl6i

At the moment the virtio-iommu translates MSI transactions.
This behavior is inherited from ARM SMMU. The virt machine
code knows where the guest MSI doorbells are so we can easily
declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
setting the guest will not map MSIs through the IOMMU and those
transactions will be simply bypassed. The ITS does MSI translation
anyway.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 171e6908ec..6a041e97a5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2138,6 +2138,11 @@ static void virt_machine_device_pre_plug_cb(HotplugH=
andler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+        qdev_prop_set_string(dev, "reserved-regions[0]",
+                             "0x8090000, 0x809FFFF, 1");
     }
 }
=20
--=20
2.20.1

