Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp252084lfg;
        Thu, 25 Feb 2021 03:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydEPgYWuXmPfws4D1SCSlwyEOKPM1tA9+balinA3YUEUovjx1jXzEbXZcCXzFQflfAaMP0
X-Received: by 2002:a05:6638:260f:: with SMTP id m15mr2590015jat.127.1614251602627;
        Thu, 25 Feb 2021 03:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251602; cv=none;
        d=google.com; s=arc-20160816;
        b=beQrruWjsKS0DQeXv+tniL7VmYKVq73RRBBVcm4auQB4eBcu7LJzgBk3M8YgtwOtSS
         TjUxrKKU5rZnQnUZLOxXHhj6ARVtdV6U0ry8KJKXXKrSXd0uOaeD9ibNdcIrjRj7VQkg
         RLZ2kCaVMk3Fk7PIQn3E4O0Pe/sF0e1r31pJBIzGr3hzghJTefJFuqI0x4GpRsw4Viiv
         7ZHjLg1fhZTix23qkhcas94YTB/g25QAvdE+mq0NWc7hvqv6sHOIpqXWfljjiW7mqvsw
         VPNpqS5oihoLw+6QMO/QlZ2zlcVujG0WyZwqAu7v3MKdc+yDuzel6Zr+eKWyalCbEnfK
         B22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3XW79n4oko0bTx69ai3M57YlS6fR2g+U1yR6dR4hmFk=;
        b=kTcXazasLQJxxfzZUt4Pcm2rvaTwjZuYgfR7vgiYFv657I5ZVGosT11w/HUWGtAw4W
         iDslvFlSmWA679lFRq8SInpoYDywUFzBiLyaizeKR7uVnYNO1HzzYtoAUmuo7g7lU24k
         p7qYhC+/xxRZxwb42oLwTUvQmzzOsD+a1ZrKgYXpdxmWzOPGVA78M7kEzUsDEjDITjKW
         MDTUaWiqupKsgSNyo1o1fZ6g/zCyiNPG8f1rx8p9qwuJOBlgMHNxgKD9kMY5w4wkCecV
         +I32a2cIiRUN76Cpn1ppBniMl7z9lNI9T5a78MJUq2LduasFgVzGY0CIuf/hTbjz+emU
         cNPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SR9BPdBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si2567520jaq.98.2021.02.25.03.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SR9BPdBU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEa9-0002ie-QZ
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKh-00038O-Oc
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKe-0006eV-6n
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XW79n4oko0bTx69ai3M57YlS6fR2g+U1yR6dR4hmFk=;
 b=SR9BPdBUkhygf3pTUT8flMCodJ8/k8PMbE+8Xnid9sHqI8q3vFwTzIh3G6GDdKpGj1VthV
 0rGwGxWb3Gdk56TJY9OlIZXnkubXhpvLiYSeJZfh2u7m664+W9cvqvjkhNvlTbfw/HnZmt
 h326PiMSCiTxyLe8n1Nfdl8RaOn3Fg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-lPzPtDZ2NA6Q-NHgeZjqWA-1; Thu, 25 Feb 2021 05:57:17 -0500
X-MC-Unique: lPzPtDZ2NA6Q-NHgeZjqWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B750801978;
 Thu, 25 Feb 2021 10:57:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443C45D9D7;
 Thu, 25 Feb 2021 10:56:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 22/28] hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA
 invalidation
Date: Thu, 25 Feb 2021 11:52:27 +0100
Message-Id: <20210225105233.650545-23-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qmFzr3T+uIwc

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose and accordingly set the flags to
indicate its presence.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- set flags
---
 hw/arm/smmuv3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ab0e1c5818..d5a935004b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -832,6 +832,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     event.entry.iova = iova;
     event.entry.addr_mask = num_pages * (1 << granule) - 1;
     event.entry.perm = IOMMU_NONE;
+    event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
+    event.entry.arch_id = asid;
 
     memory_region_notify_iommu_one(n, &event);
 }
-- 
2.26.2

