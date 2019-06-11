Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4417330wrg;
        Tue, 11 Jun 2019 07:29:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhve5Oc1qTdHsMEh7DXFsbcrUVOVycRD+dmJqmtBOdzURkomdqBo4S5XgaldDVKuDbavPt
X-Received: by 2002:a05:620a:13d1:: with SMTP id g17mr5712169qkl.121.1560263393996;
        Tue, 11 Jun 2019 07:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560263393; cv=none;
        d=google.com; s=arc-20160816;
        b=ed/bOTTHeRDR/5AbSW21mgzSTdWBLkgbxc2L9XACHrihO3/hdp55NnxcfksDVPn0tU
         E9l9gxb38LUXto7Sfoo+Ot9Rd94qPvqUNcBiWFBDF4ZgtILLt2XNb0tYpW2E8trRzfOL
         gZom+0UCKIFSWovunKNivVlSw9GTj0bpCr67mcWj1D0mFnJtXJ5blIqVFC1W5A1Cu9mU
         1FL2wYaYBpPKsVQMU8Ny645YhRZtiJnpkUvdWEMWtF0VL4c9kP8tjo+hUtQbno68+Jq1
         BdlXmdnyYe3I6UyBK0Zz0t1rFK84Ht4dB+P2r4F60rczwD4h8pzkrE92vA7c/T7sd5ja
         DNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KSiychSW8ppvJSiatVhxU9L3B3nyk0evwAGOfmP5RJo=;
        b=tubYWyXgjYA1vSQ5UZvmQVmsVdGqPHpfteYnMukBRIGPai6TxNa7WyZc7zk7ih0qUf
         nCA0O7g3gs4ASvTyqGafROgzC9rM6lOWqGZOg4drmeVYg0TCt72fF7nS3oVVdYFG2Jt6
         A2WE7wLFOhvWIF4erjB+3Yc9Au8tHXjHcqKqzwxe7hIg5mdvzqI6CdTKkZOKWBhiizpb
         ly9m7Dc1WdIu4vRckFYNm8SWB1nywIyrxB/SoVfD4J3yLQVSKFFONbza7ai/LLYGhBht
         6es3LSDQOaOb47yIAkLikiJvKVqkEGYsRdS2UPXZeGv7HPQUK7VNwZ9qBdmzUdfAYAqz
         2vJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n38si3185911qvg.219.2019.06.11.07.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 07:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hahmb-0001Up-Go
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 10:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40503)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hahmA-0001RC-GJ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 10:29:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hahm9-0002fU-E2
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 10:29:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hahm9-0002Rq-7f; Tue, 11 Jun 2019 10:29:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A920FC05E76E;
 Tue, 11 Jun 2019 14:28:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8707608CD;
 Tue, 11 Jun 2019 14:28:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 11 Jun 2019 16:28:21 +0200
Message-Id: <20190611142821.3874-3-eric.auger@redhat.com>
In-Reply-To: <20190611142821.3874-1-eric.auger@redhat.com>
References: <20190611142821.3874-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 11 Jun 2019 14:28:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/smmuv3: Implement dummy replay
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
Cc: peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hNIn0y3gR1EF

On ARM we currently do not support VFIO-PCI devices protected
by the IOMMU. Any attempt to run such use case results in this
kind of warning:

"-device vfio-pci,host=3D0004:01:00.0,id=3Dhostdev0,bus=3Dpci.1,addr=3D0x=
0:
warning: SMMUv3 does not support notification on MAP: device vfio-pci
will not function properly".

However this is just a warning and this should not prevent the
guest from booting in a reasonable amount of time. This does not
happen currently.

This is due to the fact the VFIO vfio_listener_region_add() calls
memory_region_iommu_replay(). As the SMMUv3 IOMMUMemoryRegionClass
currently does not implement the replay() callback, the default
memory_region_iommu_replay() implementation is used. This latter
loops on the whole notifier's range (48b address space), translates
each page and call the notifier on the resulting entry. This totally
freezes the guest.

The Intel IOMMU implements the replay() function which only
notifies valid page table entries.

In the looming SMMUv3 nested stage VFIO integration, there will be
no need to replay() anything as there will not be any shadow page
tables: the stage 1 page tables are owned by the guest.

So let's implement a void replay() which satisfies both cases.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e2f07d2864..1f578365ef 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1489,6 +1489,11 @@ static void smmuv3_notify_flag_changed(IOMMUMemory=
Region *iommu,
     }
 }
=20
+static inline void
+smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
+{
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1496,6 +1501,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
=20
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
+    imrc->replay =3D smmuv3_replay;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
--=20
2.20.1

