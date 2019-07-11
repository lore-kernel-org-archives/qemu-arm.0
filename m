Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp328075wrv;
        Wed, 10 Jul 2019 23:21:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxht3Q/LvbdWlkvwl65y+mtf+P4Y29ztNUMdfx9iZwzoXLnQf/X39/DGxpB8c+2MUU0RHH2
X-Received: by 2002:a50:d1c6:: with SMTP id i6mr1724844edg.110.1562825987711;
        Wed, 10 Jul 2019 23:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562825987; cv=none;
        d=google.com; s=arc-20160816;
        b=arkVoN/EXhCi6NQZ9vfDzCS9yyEyaNDhp71OgUw5N/mjo32u2P8ljMzJiVxuFyk27t
         O8BS8kdQsDSIj5aSSuzz95G9Gre3V0q3V10W9m+n3YQpuBhea0MWckYBhBI6EYqhDI+g
         jio8J4sexjcKJqDkTk6VUGKn01UZr9evkuQMysqxq2ARbeedSuyHhDhw1imckKwGJ/7E
         /oleRbAOe5ir0nt+kO8ZzVJAdsreIW4EBMIsiQzMoeQtaS7mxrP8Pd3L17X9SwxXrdWD
         RsRrGRmdobOhQGZqESnXdUIw5/5/X2F/g9c04imD1f8c2dF1SSihFFualKdVQY7yTCsl
         a/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7UHD9lY69uSojRgLPxEbyMmPbBmfGY6CrMQdmGctMxI=;
        b=Io+Ycw7RoRAB0VD7cOKLqWMOWYOZpzLK4ret2mvxDRUFZYHMPmh4nQhHAhs0L2tSb1
         yPwQxNTzI+KnSF0ixqsOBXYXuwlYjnBYNh9lNLTciAL+zLEJxjDnTCcJG7qN5fjRSvmz
         aDS9PKHYTtlYmSbOJWPfikFzA8Z5P+FLuth9eDtQ0kl1ZPJtDbaiifSHJSiNRYlGk6CF
         6fxBDZlYNZmM2CTZPS1UqFXnW+gTEHGMMky28eKepIZ8uJJGg6ETlK/qMdl3M0PSjR4W
         fMs8MN0b2uAZJCZh001GGsVb2A42VZRwuos5ahTivrZTIFhSyiAYLPxhOJTv/ZscyPVR
         BSpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ot29si2420189ejb.111.2019.07.10.23.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSQk-0005mm-QQ
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41329)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQF-0005Q1-Jt
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQE-0000Ah-LQ
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlSQE-00009i-Ev; Thu, 11 Jul 2019 02:19:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF328307D9D0;
 Thu, 11 Jul 2019 06:19:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C612E60600;
 Thu, 11 Jul 2019 06:19:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 11 Jul 2019 08:18:53 +0200
Message-Id: <20190711061857.13086-2-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-1-eric.auger@redhat.com>
References: <20190711061857.13086-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 11 Jul 2019 06:19:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 v3 1/5] memory: Remove unused
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
X-TUID: 2aiQyLH4XWU1

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

