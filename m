Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2020745lfb;
        Thu, 7 May 2020 07:32:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7UHE1+B801YOP1F+b3fQVgkQRkBMqVSx2wBDdJhik5k61kS5ivEBp3dNVClmKBZ/dfFRo
X-Received: by 2002:ac8:6696:: with SMTP id d22mr7279773qtp.304.1588861978675;
        Thu, 07 May 2020 07:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588861978; cv=none;
        d=google.com; s=arc-20160816;
        b=oTvhVqt6cb7KXMT9uNZMOUCSbyAe6BVGB1CSfKtTSGzZNj2DsYLHAVDCSqyjGvdBpX
         tXrHu8n2LW/9rm83P4dT6gt2Ism8vHWBGg/5ciRon8EVs+5BN/1MLeBLT1IhZ3qCHw1f
         skVbaDVjGhfBaDraqUy0xkL+ff3B5l0PlMZQBA5vrN5Vbd1glHapnlIUlI7uJtksL36R
         d2Upg99Q4J3dn8lbUAU5EZsNZbg1seE9CPP55bcTj/6/czEbn9JK0yBCHuRqMVWDbuGE
         MvXryvD4cEqt3Dmw62F+jLBpAgtc3p1fmSE194tw6cLLNHTki62WmAuksbh0I4BTHy/g
         ZzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IrcAnwiLssCJ0wzxmOTUQjv2M9FlPZvJq8WF21TECq4=;
        b=uSCT/R3IZwei+emOIMkBqMpZ+Vu2JP5doRYDkSXlKhAJlF9+2rqW6d8dr3XZuMWWoS
         0OTYrjIF1EsriuakBdsv1L7yIHOhZge6iYWeYDaJqq5G51NnsbrbQMIypER9lQaCUm6f
         wuOW5rI+ln/d4ajK3+cMERkcjAhiMVjYbiIpPcwWXCx7vk/urQC/PfxPYgAy+aymk/H+
         qxn6Qu5MM2wDt9zCyEShOd4oe2dtaxffyZ7QPX1Qq3Je9gX5L24gQuKUphfZ3OY0L6WH
         QMeHnJ0Tl9YJBhU8A+My07CNir7gqVqmK1oN032QEFRIZzS8tzjqzsD+7JVbBDE1ESbz
         fqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyWz97m2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m35si3212589qvg.163.2020.05.07.07.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 07:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MyWz97m2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWha6-0000Z5-15
	for alex.bennee@linaro.org; Thu, 07 May 2020 10:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZo-0000WJ-3i
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:40 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23327
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZn-0006W2-Cu
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrcAnwiLssCJ0wzxmOTUQjv2M9FlPZvJq8WF21TECq4=;
 b=MyWz97m2ZpxXRiur7Yb8TY3akXj0cyobm/UhiMmaxSgIqoF+q7vocFPolcYY7BQ7ustvxv
 vKZTSewqQUfnGdCx+tt4GAqvmX33Id64pmL563GawDvnYyW2kzGddQrrEF3/d/bjzPV5gc
 lJNdzBzdvcRJOTXtBdMnTFc9wxw7+lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Dnx7kh3ROfKAVR-qvkeR-g-1; Thu, 07 May 2020 10:32:34 -0400
X-MC-Unique: Dnx7kh3ROfKAVR-qvkeR-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A4218FE860;
 Thu,  7 May 2020 14:32:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51AC87055D;
 Thu,  7 May 2020 14:32:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com, armbru@redhat.com
Subject: [PATCH 4/5] virtio-iommu-pci: Add array of Interval properties
Date: Thu,  7 May 2020 16:32:00 +0200
Message-Id: <20200507143201.31080-5-eric.auger@redhat.com>
In-Reply-To: <20200507143201.31080-1-eric.auger@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: hc108L45FnEY

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
=20
 static Property virtio_iommu_pci_properties[] =3D {
     DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
+                      vdev.nb_reserved_regions, vdev.reserved_regions,
+                      qdev_prop_reserved_region, ReservedRegion),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1

