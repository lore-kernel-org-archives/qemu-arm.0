Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp478722wrp;
        Fri, 13 Sep 2019 01:36:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0KhbHLesvYkFNi214I1FR/Y6TMi5AGAGvYeaEuRUxWYvoyOMeohYEyBpsUX11LSqCroT2
X-Received: by 2002:a17:906:4e12:: with SMTP id z18mr38885038eju.187.1568363809020;
        Fri, 13 Sep 2019 01:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568363809; cv=none;
        d=google.com; s=arc-20160816;
        b=Kufy2gDpFAOW13sKixuPxIaWJVcwxy1cRY9C+qFShYgUMOkXKbN04HcjV+TafluiK4
         +nKQkbOdHgXkoVChBtcqd2vo43QhT+j9fhQyVSYaNZupnOrIw/wxbXs8QgL+2z2RxzSH
         Kp/9M7vAWlwKvKEUH7SEpM5ozJqhZTPA4WkKvUF+svKxoAjYSjzfhpqZchK+Yd/2d4GV
         V56TUx8Vu0NDX1Gp1U5aHFbmOn9jCxFDF2LSQclBh57cyGp5e/ZFuaVl9Eoe1X64teyI
         UrWhMTVt2a7x5cz175kga4rP9tmXU0p1AjfHDMpiVYNHZ+iORqyJ7bS4+Xw77bzy6xtP
         Iwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=3JQ3wNrlFKAof/IpW9V5FjgbCM1RNzzYwbIkZTcrg6U=;
        b=TT0q5ltJ0xsVKcqqLWuadJxfWcxV1+8YCMjCjFT2onH+9/PGGhSuw8fcrg8cWF8GYW
         SklG2M8ClwZtPMx84hPS4xgzAUZOpDJqEGiIE6zBCqNKy+yK9EN2QaY1bxwFX4QMlBPp
         vqsWFCCf9qSF66Qt89Fr6SRqmSBxSUUDB0eYszjdCa9oUJuCXhs3u2eyS6wRf96OEqtk
         /xl1WjH68UYkaDxBhP+bILArOiY7UfWCrEjyVCSsEHFKTfSYsOR4lyKku1S0zm43AWns
         AstcXL8turWD1el8MnBc6QfgNEkDVlmVufilyXwVeD9DAYsHuqBkNK7RaP0qwXwIfhml
         Ir0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si14217844edi.145.2019.09.13.01.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h4R-0005EZ-MN
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4H-0005BK-MC
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4E-0007tE-SL
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4E-0007sU-NI; Fri, 13 Sep 2019 04:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 45A701DA4;
 Fri, 13 Sep 2019 08:36:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C60360E3E;
 Fri, 13 Sep 2019 08:36:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:09 +0200
Message-Id: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 13 Sep 2019 08:36:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 0/6] Allow
 memory_region_register_iommu_notifier() to fail
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
X-TUID: kDHqj/xTajo6

This series allows the memory_region_register_iommu_notifier()
to fail. As of now, when a MAP notifier is attempted to be
registered along with SMMUv3, Intel iommu without caching mode
or AMD IOMMU, we exit in the IOMMU MR notify_flag_changed()
callback. In case of VFIO assigned device hotplug, this could be
handled more nicely directly within the VFIO code, simply rejecting
the hotplug without exiting. This is what the series achieves
by handling the memory_region_register_iommu_notifier() returned
value.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0_register_iommu_notifier_fail_v=
1

History:

Follow-up of "VFIO/SMMUv3: Fail on VFIO/HW nested paging detection"
https://patchew.org/QEMU/20190829090141.21821-1-eric.auger@redhat.com/

Eric Auger (6):
  memory: allow memory_region_register_iommu_notifier() to fail
  vfio/common: Handle memory_region_register_iommu_notifier() failure
  exec: assert on memory_region_register_iommu_notifier() failure
  vhost: assert on memory_region_register_iommu_notifier() failure
  intel_iommu: Let vtd_iommu_notify_flag_changed() fail
  amd_iommu: Let amdvi_iommu_notify_flag_changed() fail

 exec.c                |  3 ++-
 hw/arm/smmuv3.c       |  8 +++++---
 hw/i386/amd_iommu.c   |  9 +++++----
 hw/i386/intel_iommu.c |  9 +++++----
 hw/ppc/spapr_iommu.c  |  7 ++++---
 hw/vfio/common.c      |  8 ++++++--
 hw/virtio/vhost.c     |  2 +-
 include/exec/memory.h | 18 +++++++++++++-----
 memory.c              | 28 ++++++++++++++++++----------
 9 files changed, 59 insertions(+), 33 deletions(-)

--=20
2.20.1

