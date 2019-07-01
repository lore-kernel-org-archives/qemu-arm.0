Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2448614wru;
        Mon, 1 Jul 2019 02:34:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyd0/QzO5PEDL7aOZDE/NkBq1KA87Rcexwn8hcOhXjHe0oNIvTRr7wE4LUHsPGNHMOGeK5j
X-Received: by 2002:a17:906:27c7:: with SMTP id k7mr22024793ejc.91.1561973692836;
        Mon, 01 Jul 2019 02:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973692; cv=none;
        d=google.com; s=arc-20160816;
        b=rRFvuIl44v+yG8SRYfKzocld8q9THVj3yBs5dZjVw+iXCHkCg7Hv4MaXPan3YuRneg
         Ibb0JBvStep+sazUZ4HSOyfNCwFjNWtt9aqY3FeOJEdzV05QPSKeIwqP8EcrwmZrUZq+
         xo/WsHK+fsYQ+g89xUjYDlLy8nH1qnOiID4AXbGqXiXi3j3/xe6mBs/l4vWRM+/A2PV/
         0kbl6Ql3oAcPmrQFKtrKR5eQ592asywsaAalEEgNJYuLjOnMri2uXJknb1bsobF6bhVH
         5Qj6yMCaQZlloQO6SLV0+LBLX07/XyYCjY+hT/qdrDBosGNiB/bHP40rMHZyc6U97nQl
         nOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=a50gmTwY3zYIWC2TI0XStvw5EJOAArWfQGbdmD8aGoc=;
        b=koCfHBGuXZA4Mz0uSoeB98b9qLblz+ZCP1+B+FPYdfUiR6eFqC0JiRz4wkjNFVlqs6
         6in9zBuTPqEOHVouGWrq/MTKAg3RfFLWx9JDWvAh3OGkUcfpk/Nt1kCK5UDMe4zIpRfQ
         ivgOjKnuEzQtZXi43Gg0PlbTNk3I5CBgdcyfy2V6XKvE4lxAyRFDFBgXfuX/ZS4+8wlX
         dUjh2DkMVW4qimXIavTAh9/4u/tnB35Rtd8tc/bVvvvYH5IrDHkmUQcMrqvaWhXFuH48
         l6knKlQptV+udsM8BUQ6zV3VB59jFOd/CyYqsP+nkKw+Mi4klVX5xuScu67EmfFj6Bja
         Lclg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30si8928813edf.183.2019.07.01.02.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsi3-00030u-57
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49579)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsef-0002JP-EM
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsee-0000Ls-98
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48760)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsec-00009Y-7p; Mon, 01 Jul 2019 05:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA51A30832CE;
 Mon,  1 Jul 2019 09:30:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2D05BA4D;
 Mon,  1 Jul 2019 09:30:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:29 +0200
Message-Id: <20190701093034.18873-2-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 01 Jul 2019 09:30:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/6] memory: Remove unused
 memory_region_iommu_replay_all()
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
X-TUID: HlL9Bu+7OgBe

memory_region_iommu_replay_all is not used. Remove it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 10 ----------
 memory.c              |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e6140e8a04..bdd76653a8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1076,16 +1076,6 @@ void memory_region_register_iommu_notifier(MemoryR=
egion *mr,
  */
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifi=
er *n);
=20
-/**
- * memory_region_iommu_replay_all: replay existing IOMMU translations
- * to all the notifiers registered.
- *
- * Note: this is not related to record-and-replay functionality.
- *
- * @iommu_mr: the memory region to observe
- */
-void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr);
-
 /**
  * memory_region_unregister_iommu_notifier: unregister a notifier for
  * changes to IOMMU translation entries.
diff --git a/memory.c b/memory.c
index 0a089a73ae..290a1493ef 100644
--- a/memory.c
+++ b/memory.c
@@ -1910,15 +1910,6 @@ void memory_region_iommu_replay(IOMMUMemoryRegion =
*iommu_mr, IOMMUNotifier *n)
     }
 }
=20
-void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr)
-{
-    IOMMUNotifier *notifier;
-
-    IOMMU_NOTIFIER_FOREACH(notifier, iommu_mr) {
-        memory_region_iommu_replay(iommu_mr, notifier);
-    }
-}
-
 void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
                                              IOMMUNotifier *n)
 {
--=20
2.20.1

