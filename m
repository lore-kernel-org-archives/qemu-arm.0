Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1056514wrs;
        Thu, 22 Aug 2019 10:24:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhIMXh5F3m8KCZqG/pvx4GocWlYVhJOuShRm7DUF8KEAeRJ85nP0DnTDWABJs8AOrr7LWD
X-Received: by 2002:a17:906:9453:: with SMTP id z19mr323459ejx.287.1566494679313;
        Thu, 22 Aug 2019 10:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494679; cv=none;
        d=google.com; s=arc-20160816;
        b=YY+vpnkLjt5pFrHPDQU20IdCINYhdrdniGP/J6O2bgq0AYSUtC96KWKoTGzv4kn6Wo
         riytupypYeD1031M3/aSTWgI+c5RPFGXj+JdX1xHPHH+5gX1UW8pfPZeH4kLdsgWDN8Y
         gI2IF1YwUw6J7VeM7ZV6QS5pAesHqH4KtleLaztDCDX1vM/KtzCel4V9MxhYO5mV5jJx
         i9rPb0JTLNUIbLczyDXrZsnSaYcRRhb3+UWsvDkDnbayIZqKrt+gn30U0C/K9Gb8potO
         sBZB/VleW9VwSrZpBiBE1w2abvX3VcNzyJ6K/ZlJ5b9jTwPUXAZARyJdLumpzhpfqI3r
         b5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=25ogfR16hm6lxFYlLvM/L4KO3XLYhca5kwD7Cmgb69c=;
        b=fWzoBIpI/VxIFIAYuotKOUSB87Bx1n84ppwG8JE9tycYzwFlGcF5G3/UP6bwqauuiI
         VFc6Kya6NrshAPyW5D45sp095L7za5ZarQJPoiUd3KIpGAfhKXravw5nxbQdh4Am2T1S
         Xu8rz3wu34GEb5p/la7s1yeQKatkbGRFC/EwEnhTLhbXWB+G0pOJt7YB4N750dxOJGX4
         HOgZWuY3le+zA2fGCjN1DRFVtbWAZuqmkPDhd6PgsMzBahzWlrFGKdc0hTC99VTxBxzt
         nBFYTgyoImCCeI3RYaM2SkS+36RX+jKEC3+kVL9Fsmmyqzv9+fxqqG/cs0TMZiYjyOQL
         T1mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si101353ejk.387.2019.08.22.10.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qpB-00067Q-SL
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoj-0005cM-Cx
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoh-00030g-Ak
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qoh-0002zz-4G; Thu, 22 Aug 2019 13:24:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 661FC10F23E0;
 Thu, 22 Aug 2019 17:24:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 155DE60605;
 Thu, 22 Aug 2019 17:24:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:46 +0200
Message-Id: <20190822172350.12008-2-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 22 Aug 2019 17:24:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 1/5] memory: Remove unused
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
X-TUID: nmg6ZQZcgLQ4

memory_region_iommu_replay_all is not used. Remove it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 10 ----------
 memory.c              |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index fddc2ff48a..ecca388e69 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1086,16 +1086,6 @@ void memory_region_register_iommu_notifier(MemoryR=
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
index 4aa38eb5b1..489df45758 100644
--- a/memory.c
+++ b/memory.c
@@ -1915,15 +1915,6 @@ void memory_region_iommu_replay(IOMMUMemoryRegion =
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

