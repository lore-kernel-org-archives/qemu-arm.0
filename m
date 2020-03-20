Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1125416lfe;
        Fri, 20 Mar 2020 10:00:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt848MffelpPPK1EvJ9BFwge4tvMlah0ZoOzGNAcYEPM6MzNwaVP84d+2+qijtG1DlsGzwR
X-Received: by 2002:a37:664d:: with SMTP id a74mr8706543qkc.256.1584723613532;
        Fri, 20 Mar 2020 10:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723613; cv=none;
        d=google.com; s=arc-20160816;
        b=WIJ6EFJjNo9q7d02Qre/Nzl1evyYtR4ccak6x9QJVTSH2lWFCH5u8jqwfHFQGeu/6u
         k8yRtrAknWEicfJOv7UDNtgXzKVfhxQrIxSsuPz/XFSt2ReOG/g32pEZ9KMI3hZ1tmOS
         piiA5cudh2OpynVuhBheGlEqH+37kNR6TsH2Te/Fl9g4wM+c8GEE/FQYz+xuplnHfJ8Y
         sf5GLZGXPBlTL58tx/fCwN4182+Ezfjaysv68CjBx65ELaDHH+LMK3lgjqg/qV9/rjFB
         hT/uWQErqU3cjCSU+7gdtmTG8yKwG20V2aPSj26eOoS1DaWTf5q8qlV0R1MGw7HMwocb
         ouNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WL0ZvBoB0+XeBxLRP2xltK9U+qv+Rol4ZQFL6ezhHPc=;
        b=lBDhbjHaA0NxggJskfTqj7Gp2eIoYzvUKT32G1g58n1p4UdKy8ga5y+dD665SdLfLG
         nK5jLSFuXzpBY+yEZc71S26lDWYxdzcIOqJ04bGH6c2LKdExbq6dMllHYGnBQ4foFLkm
         LiR8hVr5dXQgjisRlee/XtTBVpSxt0f/6UVlqfNZtCOGg9kk0JUhMnj2DJHaKJ8mGyi+
         601a6HMQJo5jrIIq3GUlCDa+sXVhss+LhKqUrBJG9uQk82I3Cf1M84bqWi4oEOEUQC9q
         BVhpuCrhVOlmyUOHff5qxthG9C7zrGCdS0AToQnnIXMxJ9DFzSjzS4+wD0GS4y8zwvoZ
         LGBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gfPTA4NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si4023721qkj.196.2020.03.20.10.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gfPTA4NU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL0G-0003ti-Q2
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFKzx-0003Zb-FE
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFKzw-0004Pc-Gp
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:50907)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFKzw-0004PN-Dc
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WL0ZvBoB0+XeBxLRP2xltK9U+qv+Rol4ZQFL6ezhHPc=;
 b=gfPTA4NUel/YKaWx23b9cpEKJFRqUvJ6+AbtZdq3B8B5c8t2TuJ5vuHmSzethVIcMJXyHP
 MQ2iiB3icI1jaZGD4OEs5LdS8gahlaD/PG1BhGTFaq2x1gg/mi8Bh7/TkAQcYvlrrHsqQ6
 EMtc7p9l4H4zvvLVklPosTcWj2FDN3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-uswLVvt5Od6fSxHijmEw1Q-1; Fri, 20 Mar 2020 12:59:50 -0400
X-MC-Unique: uswLVvt5Od6fSxHijmEw1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 375FB108E442;
 Fri, 20 Mar 2020 16:59:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A8719757;
 Fri, 20 Mar 2020 16:59:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 04/24] memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory
 region attribute
Date: Fri, 20 Mar 2020 17:58:20 +0100
Message-Id: <20200320165840.30057-5-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bMSMzlO/WcbY

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLATE
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b9d2f0a437..f2c773163f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -215,6 +215,7 @@ typedef struct MemoryRegionClass {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
=20
 /**
--=20
2.20.1

