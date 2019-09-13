Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp480536wrp;
        Fri, 13 Sep 2019 01:39:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwF7SSGdOmMq6i9j2HK0/77k8Tkq80KmlKIFIHmnZqXM9g9+EJt1E8bIg58DnlrK8f2sIa8
X-Received: by 2002:a17:906:3087:: with SMTP id 7mr6001543ejv.212.1568363967013;
        Fri, 13 Sep 2019 01:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568363967; cv=none;
        d=google.com; s=arc-20160816;
        b=M7HF0+vvsf16xTxm8G4STfh+Vxx7DivoSIPacyTKBb19O/GUcUXphYIIfa+tKH4ea3
         ncXIoa/sDbxqk5G9NZVqAAZb6OugLeE1QMzsoppgS/4c/rSKyJX1RlsfmKLqnw/I6iSk
         DFCoIBkDyzar3CtERtFJfhkkiEK7UkUrcMJvomx13rOwMGXRIrqe0U14zPx1luA7xruk
         5LFChrf6qODjV5ftoCCOdmA4yYsCnQxU+a5unZ+Qsa0af0QDxfmxe94/5bb+H7u3udWO
         XMjLAyUTV5vv5ZRSSH0slYFMul+vQa/n2TuICexwLfb59l1cX3QhkX3JqF9NGPPLLA/K
         Q8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=17+6090PQIPDr6ZvOhE7jTG5x63df14ldFloFN3eCvQ=;
        b=jbRjBGU+rgmhn8RC7davHJ0Lr1vCT/5n8N2//sXLuD5Gdu2pC/f0TXKYXsrmEj2QGa
         Z89LNxX1mZtStcoytv/VUNBr9vcx8YWG8JEQVnqAT34AHJFD4IyMeIDPOSedg27H3Rds
         7zy4lwWo4+6RhNXtkvrhyHZwGAl5uuoyOJ7jmANsCtvjcpOAe3Mt8IT6ce6zSf0AHboq
         UKfPrHoeJGbVOG0Ek+95AAzeiqYRf4uBraWTy3AGkUjTATP9yz0TkpFCK8AQNozXnN1b
         4X0vecaAik47waOapqRMQOweZCDl0SfyJtVbrcAnVeBIIsG4muawFLdYj6lUIqYTlVgC
         mk4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si16079433eda.129.2019.09.13.01.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h6z-0008PH-JC
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4W-0005Yp-6O
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4V-00087q-7T
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4V-00087H-2p; Fri, 13 Sep 2019 04:36:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6275730860BF;
 Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B35260F80;
 Fri, 13 Sep 2019 08:36:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:11 +0200
Message-Id: <20190913083615.14719-3-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 2/6] vfio/common: Handle
 memory_region_register_iommu_notifier() failure
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
X-TUID: XX4APF6OG8WS

Now memory_region_register_iommu_notifier() is allowed to fail,
let's handle the returned value in vfio_listener_region_add().

This will allow to remove the error handling (exit) in the
IOMMUs that implement a notify_flag_changed() that sometimes
cannot accept the MAP flag.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d8..d57d72cfb9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -630,9 +630,13 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
-        memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        ret =3D memory_region_register_iommu_notifier(section->mr, &giom=
mu->n);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
         return;
--=20
2.20.1

