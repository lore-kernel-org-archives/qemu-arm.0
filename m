Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp419296lfm;
        Wed, 24 Jun 2020 06:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfoWplXTJ4efPzaCoyLTmPGV4b3EKHSJ5KnfS9O6Rp2ahtdGWIHzUIOgXbY/KPeBfPyaiu
X-Received: by 2002:a25:61d3:: with SMTP id v202mr48321799ybb.457.1593005248967;
        Wed, 24 Jun 2020 06:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593005248; cv=none;
        d=google.com; s=arc-20160816;
        b=I1bqhwYZxbL9nbq9VUmDM6+Li68DfEOlW76sM/ztEJ2/72o1ibCUlbrkBEpqje4xkt
         AV6UNJedb4o+hslI4NMTUoe/JOGegp6hPKeBXHzFUyf1EVwSIHK15tpwFw1N9yat8exx
         pU6anzc+N58p6W8dR4IZhMVQP+Jd62wHjeOE1CJIfB0SaJqN+yEPSo79wb7oFGIipPXu
         Hb0jl+TKg1+dwqD858IJzVo6JCSj+qltX+sWin3j1OPs+XVxaNf4fQSo4+nAP4E+Rrsr
         j+9zz/JcvOamaIGJVGVKz92TgsCZH4jqGEJux7x1565aGhhsBAcWNV6kUx0S0bbRv/YE
         NLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EEJC5V3lK/VQAM8iH0Zn+wfUIgAwt0asMzG0ygzjCmQ=;
        b=aJkDWEZFlQjHV8cvMVf5RTq/tZuYYRLuvlwJBB5z7WMWiKJv9S6o89/5U0mfbV+nW3
         bjL1e6bnq0Rp1bsn+KSTLQ3uXp7Neoe5lbqS1ZyUdjDP5aYnU4fyU+EHcpiqU21eQRvR
         52eDVeqKIKnLPVKBXDCUZ3OIMVXtSDUamjHmkvhDAPtUl2EGaORWwORpGiaOL//mC8my
         Rm0oOZM0cJrYhoMsf5YFZU56nU8GIHKFjNmaZzQTU6FNkKJXECLP5X/0Dq2/BJ0wyvej
         r5ZYFx8+vtPIyd9eMbAHFwNSX0nVg3USO7erD0siQ4HT1iCUms+ag6ECOK6agbAEo3aT
         V9WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uqv8Mysi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si19121860ybq.160.2020.06.24.06.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 06:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uqv8Mysi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo5R2-0007lO-AH
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 09:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo5Qs-0007ju-PX
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:27:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42085
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo5Qc-0001p1-FH
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 09:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593005221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEJC5V3lK/VQAM8iH0Zn+wfUIgAwt0asMzG0ygzjCmQ=;
 b=Uqv8Mysix2WI9bS7ymL3RddzfBT1T5CG1embfC6P4xnwHSuIIXYijJ1XzUkEM0cigCfMQD
 BqhEBez4wYpNF2WWCtZyqwAEjM1IDEhHO65cCCqo1CliBZVAJCCXPiCTyg8b/wgyjsTOrc
 KjbII0Q3ZPNMm0XpmiYOTwHwgofDh9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ewigfKSKPZWFU_XPLYyxlw-1; Wed, 24 Jun 2020 09:27:00 -0400
X-MC-Unique: ewigfKSKPZWFU_XPLYyxlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE6F800C60;
 Wed, 24 Jun 2020 13:26:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4132100239F;
 Wed, 24 Jun 2020 13:26:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v5 4/5] virtio-iommu-pci: Add array of Interval properties
Date: Wed, 24 Jun 2020 15:26:24 +0200
Message-Id: <20200624132625.27453-5-eric.auger@redhat.com>
In-Reply-To: <20200624132625.27453-1-eric.auger@redhat.com>
References: <20200624132625.27453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UyyFD21xHnGJ

The machine may need to pass reserved regions to the
virtio-iommu-pci device (such as the MSI window on x86
or the MSI doorbells on ARM).

So let's add an array of Interval properties.

Note: if some reserved regions are already set by the
machine code - which should be the case in general -,
the length of the property array is already set and
prevents the end-user from modifying them. For example,
attempting to use:

-device virtio-iommu-pci,\
 len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1

would result in the following error message:

-device virtio-iommu-pci,len-reserved-regions=1,len-reserved-regions=1,
 reserved-regions[0]=0xfee00000:0xfeefffff:1: array size property
 len-reserved-regions may not be set more than once

Otherwise, for example, adding two reserved regions is achieved
using the following options:

-device virtio-iommu-pci,addr=0xa,len-reserved-regions=2,\
 reserved-regions[0]=0xfee00000:0xfeefffff:1,\
 reserved-regions[1]=0x1000000:100ffff:1

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v3 -> v4:
- added examples in the commit message as suggested by Markus
- added Jean's R-b
---
 hw/virtio/virtio-iommu-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 632533abaf..d0746fa93c 100644
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

