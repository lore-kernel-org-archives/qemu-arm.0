Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986339wrv;
        Thu, 11 Jul 2019 10:39:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzF13CUi9KPoktzN0tB7rAVXJyRF5+IiyoT16UvLhwNflhsBo+Y++EQ8kjHB/6G7nM0qfyC
X-Received: by 2002:a17:906:45cb:: with SMTP id z11mr4354178ejq.254.1562866799572;
        Thu, 11 Jul 2019 10:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866799; cv=none;
        d=google.com; s=arc-20160816;
        b=WanwdvU+Olpk/8haDhzcP0ytjfyb7i+nuia610yrlEjglsrERBOSs8+1DRVoN/RIU8
         /uEKyf8IIon+qDv6K9bhJ+BAXHtgb0LLJk4eqHLQvdDbxQhAkQqdZC55amqDkhzYI/Xh
         G0g4venqE3yhlSHodM2F0snQ/4uT2uBHC0cZ/7BxaAPHf2a1w3s1CNQuOTKULiFaXfFY
         4PN59fEcG5Vxy9AQeRm+WvmLWZL8QarGl1E+Ep7j4Yr95NjIKuyaQgrGqhGneqa/Wvof
         YrR2W6MO9IsebgtMZvS5hQiAX35SSMgknrjzrOfJ9TYwDesWwq35MctyojtQSyBo0UJS
         jC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7UHD9lY69uSojRgLPxEbyMmPbBmfGY6CrMQdmGctMxI=;
        b=ji4fgpwcMpnyWXfjwE7yPSQ9UkHJCIjKEIj27HqwzTKkioeeMZxedrvOzLrOERr1Li
         Ue/sxpEekZHYZ5x7u1g2T87Z6BwD5nihwoAtJOf11cFM2tKNHJFzb/NqlWLKRsJCF1rT
         FpO8fK+Dobw5gHyGW61QHiWbCRJzH0vQLRjl6+q4X/6Djtypoyh8pm+8JM7qMacc8clM
         VuRXXTE+3/5GQ+zENAcMo1zv5QlLQFUXBFU1lwest86woH31Y8OE3GNflepUhJ2dAKZH
         X2sctPmVrgyR7/z5ERUrP/7L7hlRTGCi567dgmgcjlUwYdSCIOziEfmxri4aepA2mxZK
         l0fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p48si3982260eda.101.2019.07.11.10.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld30-0007Ty-N2
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37721)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld2v-0007NY-Sf
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:39:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld2u-0003ew-Qb
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:39:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld2u-0003e9-LP; Thu, 11 Jul 2019 13:39:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D010B30833A5;
 Thu, 11 Jul 2019 17:39:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD6360600;
 Thu, 11 Jul 2019 17:39:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:05 +0200
Message-Id: <20190711173933.31203-2-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:39:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 01/29] memory: Remove unused
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 132TQKRM9bqv

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
index 2c5cdffa31..a078cd033f 100644
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
index 480f3d989b..90967b579d 100644
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

