Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp742618lfc;
        Fri, 22 Nov 2019 10:52:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0iYwN10l2WMTMsKy6afXNB9AidZ0BcrxQUddKOyPUUCjQneS/ScNfyeOvlTgOvZHe83zm
X-Received: by 2002:a50:b6f8:: with SMTP id f53mr2973338ede.29.1574448774775;
        Fri, 22 Nov 2019 10:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574448774; cv=none;
        d=google.com; s=arc-20160816;
        b=VrgkC0BDrOfa0Vk2uRgicGjzGPbcjSTULoEesYN4xkvXSQuKBaesp/+fjyzGIPNaco
         dZAcAHQb062V12dPNg8rXue/mziLLyUjENbhkQttYqrRKLtFgXwtJWHKWxG5AX4ENylK
         Upitb0VlAkMNodazYN9hmCK5nkUmAIuv/2qizkqflTEw+lyOw9YvRolBi4fsy2LKcTWw
         t2ttoUFIYAqfE7Qgg3DgMyy/sluFqm97lBgJ7s9jZFKmtKWZM8dQdVhSPrPwbIc5xvuA
         rgWcsesyk2ZZ7AfmErJFEVwnwYEoEQy0B8EKitZ/dFPhkUeOQeOywMkKEKIro236IjjH
         QHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FhRwI/WfLYzUQvZHwKeIbcL5ij+ifra/E2ARLgqQG1Y=;
        b=ph3o7NIY1MEAdUDRTux5S+F1fzMz5xbDeX+5h7CapTjFsgh3DRRihygZe8AVxSKjmU
         ldkYKvteeQXSJPUwxiKaM5oBfxCS7uyGzEpZjvzjZMFPAQgEOnpnd8PVaIkDHSvcxLql
         xyU7qEg0Z2a4BWu6ZnbB6CI7S9crX8nmKIdOKWCP2euZ1UfxqVhcsnfysuyrnMSrf3yF
         OrC38kvKyc3FxX2PsWDtJfBuncP55l1gpgUt2eY/lUlcm1HUyCM/TUMIPDGb4Yzdg5xF
         wZUQ+1QB2fXCgIXmSo517T/0zF9GLA2D0muaFO1oysEo0IOqMwzaN0xmm+6fBMr+qBXS
         8Tqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="R4EI2U/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oj24si1653475ejb.177.2019.11.22.10.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:52:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="R4EI2U/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYE33-0007Kj-Pp
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDii-00019w-UZ
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDih-0000Yq-Ve
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49656
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDih-0000Xs-SN
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhRwI/WfLYzUQvZHwKeIbcL5ij+ifra/E2ARLgqQG1Y=;
 b=R4EI2U/fi7CDekkE4i1U4Cerw8IxyPMWyUvHjR+3z6KgdSVRAeLW7XW5ObAPksWI58h79i
 +GvWCGDfJy4vHV0YFX8nta0+Hn9eH/2BdHIRL4/l2bfWcum+OF5TE7c7VL7BWPbR32dG4Q
 FcX0o/KJAGeuRv+Apbrz0qIQdWM7WQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-fnO2wUozNTiU70nlouFa9Q-1; Fri, 22 Nov 2019 13:31:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3E58024C0;
 Fri, 22 Nov 2019 18:31:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E55A6E71C;
 Fri, 22 Nov 2019 18:31:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 15/20] virtio-iommu-pci: Add array of Interval
 properties
Date: Fri, 22 Nov 2019 19:29:38 +0100
Message-Id: <20191122182943.4656-16-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fnO2wUozNTiU70nlouFa9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: kevin.tian@intel.com, peterx@redhat.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayOLnPk4malQ

The machine may need to pass reserved regions to the
virtio-iommu-pci device (such as the MSI window on x86).
So let's add an array of Interval properties.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 4cfae1f9df..280230b31e 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -31,6 +31,9 @@ struct VirtIOIOMMUPCI {
=20
 static Property virtio_iommu_pci_properties[] =3D {
     DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
+                      vdev.nb_reserved_regions, vdev.reserved_regions,
+                      qdev_prop_interval, Interval),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1

