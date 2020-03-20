Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1125888lfe;
        Fri, 20 Mar 2020 10:00:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfuLSrOJ2ARX9rUupkUX55DW9j86mbP43fyrb4min8Qo4eMUINYhSJRQHNnsaW6ll8AxSy
X-Received: by 2002:a05:6214:b08:: with SMTP id u8mr9171249qvj.54.1584723632778;
        Fri, 20 Mar 2020 10:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723632; cv=none;
        d=google.com; s=arc-20160816;
        b=Ds1uRi2E0Jk2+5qQCNcXu6hMKRbgvzYZ74fjnwbEDl+4WE2V25avi6xI3KSFu+jnbB
         GcU5tJ5wGT7y//WeEscwNjlhSWWgATAuqT7nOOIhr0Hle37zg9qDIKRacTdToG+mPnFr
         0jZO+fk7fBWNQ/gYY/u22e/NyS1BECIxyuv5isDRUI+vKsH0W3lYW5pn9xDWRUvjjOvQ
         Ibi/qNcTNp5EiAKOWsguEcCzCBsXPeswkM/owfwrpUMtU66W0zbJfyAZNoIxGWMckaqm
         mRCrOFDZLih4XLUY5JcBUtfqOHPI5j40wwFuqC9yPK91r4q+QRslFCxtKdzD34qpzz7v
         YiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l6Iye2O0XeOvISQpSx0b3JOnod6GRILdsZET6zD1a4o=;
        b=zDEElSo3HMrk1BkMzPR6MOAwKpFeNEbbPzet3kr+hgScczOA9PKzINtXTL0+cJenfY
         7cdq/fNKSxeKN3CIN0E+4oCD0/I3bwxdaSymF8X3NQLDQl7xHpGrAwVmNJq2HsYyHYnc
         PJfVDDhk5X55xmEpJMALrAZSazBjRyQGeydO7s6/wtVppvpCYVI/UhD39I8yBGcGr6C3
         k2RoeAxEqoxynLgZPyfcG+2ofuZ82ov13oYXdqtkyRGUs89Zvhep8X4OkojWIpTYI6Px
         C2/yE25cJb0ZxmEzpOZ8UfjR8IwLLNnmzuALIDKTiJjHr9Waxq4Cb3sANuw4GZf6r7vC
         wkyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hk4m9aVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68si3965304qkm.291.2020.03.20.10.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hk4m9aVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL0a-0004P6-0t
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0O-0004Lu-2b
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0M-0004tm-S0
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58153)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL0M-0004sw-OV
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Iye2O0XeOvISQpSx0b3JOnod6GRILdsZET6zD1a4o=;
 b=hk4m9aVIYRRM8qqDmPJz8EN3CORP3fRaFHVZ2atoTkMVzsjki6B39rFRST3Sub3VTTJITp
 VZxJ50UvmPlDGaYjTuQqjeL554zKLFIB9Dlt3gnqiidL67FGDB9hT45buX04r2vZiBL7uz
 H5hYX42H1LNtGjJHzh2mU0beC5Az5Cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-51cwJ6uuMnCoWoNlHftSUg-1; Fri, 20 Mar 2020 13:00:14 -0400
X-MC-Unique: 51cwJ6uuMnCoWoNlHftSUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E9DDDB25;
 Fri, 20 Mar 2020 17:00:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28BAF19757;
 Fri, 20 Mar 2020 17:00:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 06/24] memory: Add arch_id and leaf fields in IOTLBEntry
Date: Fri, 20 Mar 2020 17:58:22 +0100
Message-Id: <20200320165840.30057-7-eric.auger@redhat.com>
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
X-TUID: UCYRwuVNWAWw

TLB entries are usually tagged with some ids such as the asid
or pasid. When propagating an invalidation command from the
guest to the host, we need to pass this id.

Also we add a leaf field which indicates, in case of invalidation
notification, whether only cache entries for the last level of
translation are required to be invalidated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 141a5dc197..d61311aeba 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -71,12 +71,30 @@ typedef enum {
=20
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : =
0))
=20
+/**
+ * IOMMUTLBEntry - IOMMU TLB entry
+ *
+ * Structure used when performing a translation or when notifying MAP or
+ * UNMAP (invalidation) events
+ *
+ * @target_as: target address space
+ * @iova: IO virtual address (input)
+ * @translated_addr: translated address (output)
+ * @addr_mask: address mask (0xfff means 4K binding), must be multiple of =
2
+ * @perm: permission flag of the mapping (NONE encodes no mapping or
+ * invalidation notification)
+ * @arch_id: architecture specific ID tagging the TLB
+ * @leaf: when @perm is NONE, indicates whether only caches for the last
+ * level of translation need to be invalidated.
+ */
 struct IOMMUTLBEntry {
     AddressSpace    *target_as;
     hwaddr           iova;
     hwaddr           translated_addr;
-    hwaddr           addr_mask;  /* 0xfff =3D 4k translation */
+    hwaddr           addr_mask;
     IOMMUAccessFlags perm;
+    uint32_t         arch_id;
+    bool             leaf;
 };
=20
 /*
--=20
2.20.1

