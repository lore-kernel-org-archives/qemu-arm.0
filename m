Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2332409wrp;
        Sun, 22 Sep 2019 23:56:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWIeHXTj2UHi6IUNLrZEgKyyRK3AZ9MbZt1YPcRlnw1/B0hD9r/mn6BZnEhiBFbQ1Dr3+p
X-Received: by 2002:ac8:1e1a:: with SMTP id n26mr15920415qtl.357.1569221785288;
        Sun, 22 Sep 2019 23:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569221785; cv=none;
        d=google.com; s=arc-20160816;
        b=P6Rw6PmkdwweYAHAoFrAEx99Pq4U2F0k1IfJByhersUy4iyiJUVMr6eTpWDGjbD1rJ
         v1Vumn73bdTtLr5qqbyRgP06qwKYjGflflrWBo0cbSMcGVYP/V6is/I4eHYHLHROVqQs
         bC8aurUOVR/ze44QdXiVfbCFAkzfEcmupcnXZV5h4F9HRa3hs6DVNHD6FE+uFVo67/Uf
         nXUcvuMW0ws6Wnm4deLZl9PUZdTEyGuLayBciPPn4xHAC96PO4viJPvMSGlFxEAe2wGh
         ZLT0U/UFhij6UC0k/sfwd4xnSUF3LAa7R7cxUkEXg6P7NASVABpx7cenoSG51F+D63ay
         ZiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=sn8O50B6Yo6ONDkJFpc4Sl5gNUNWb7U8Ypz2Lcq5uJ4=;
        b=zGc0WRgZZf4Ouq41Hsu2VqVZRVO1P/MoC7jqFeHZHXQ/Y1FQ5MH8UuZrPygVYoGD3t
         GlAun2XS5yEme3MxXb4QIbr9qNBO1O1I0SuXZ+2BD5zcEpH2c9uGfcLy8K6H6hNyDznz
         ESeNSP/XdVbJbf6R6bHkHoSrsWcCLCtWqBUOW0wAXDRd9JMjxfj8Hc/hv/ahrIspwebx
         TqvH8PGv6K2qiZSHRYZ2ynk1/qM0Y2/cqx+nEhxDUdkZ8L0+XFi1ZKcPqbgzbM7G/7XS
         uz4vJya9F5l6ENzkCeM4lhjyDEgdkTbzlNtVPUDHx5oFO6yOuSFAUUUzNiWFNVqj237K
         8qAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x47si7847302qvh.216.2019.09.22.23.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 23:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCIGl-0006CF-UQ
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCIGa-0006C3-Lp
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 02:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCIGY-0006no-1T
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 02:56:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCIGX-0006nE-Rw; Mon, 23 Sep 2019 02:56:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 73507C049E32;
 Mon, 23 Sep 2019 06:56:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59CD25D713;
 Mon, 23 Sep 2019 06:55:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com, aik@ozlabs.ru,
 david@gibson.dropbear.id.au
Subject: [PATCH v3 0/2] Allow memory_region_register_iommu_notifier() to fail
Date: Mon, 23 Sep 2019 08:55:50 +0200
Message-Id: <20190923065552.10602-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 23 Sep 2019 06:56:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: 3ew4blCFOyHw

This series allows the memory_region_register_iommu_notifier()
to fail. As of now, when a MAP notifier is attempted to be
registered along with SMMUv3 or AMD IOMMU, we exit in the IOMMU
MR notify_flag_changed() callback.

In case of VFIO assigned device hotplug, this could be handled
more nicely directly within the VFIO code, simply rejecting
the hotplug without exiting. This is what the series achieves
by handling the memory_region_register_iommu_notifier() returned
value and Error object.

To propagate errors collected during vfio_listener_region_add()
we now store the error handle inside the VFIO container instead
of a returned value.

The message now is:
(QEMU) device_add id=3Dhot0 driver=3Dvfio-pci host=3D0000:89:00.0 bus=3Dp=
cie.1
{"error": {"class": "GenericError", "desc": "vfio 0000:89:00.0: failed
to setup container for group 2: memory listener initialization failed:
Region smmuv3-iommu-memory-region-0-6: device 01.00.0 requires iommu MAP
notifier which is not currently supported"}}

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0_register_iommu_notifier_fail_v=
3

History:

v2 -> v3:
- also pass an Error handle (suggested by Peter)
- VFIO container error becomes and Error handle

v1 -> v2:
- Intel IOMMU now handles the problem differently with machine init done
  notifier and machine hotplug allowed hook.
- use assert(!ret)
- message rewording in SMMUv3

Follow-up of "VFIO/SMMUv3: Fail on VFIO/HW nested paging detection"
https://patchew.org/QEMU/20190829090141.21821-1-eric.auger@redhat.com/

Eric Auger (2):
  vfio: Turn the container error into an Error handle
  memory: allow memory_region_register_iommu_notifier() to fail

 exec.c                        | 10 ++++--
 hw/arm/smmuv3.c               | 18 +++++-----
 hw/i386/amd_iommu.c           | 17 +++++----
 hw/i386/intel_iommu.c         |  8 +++--
 hw/ppc/spapr_iommu.c          |  8 +++--
 hw/vfio/common.c              | 67 +++++++++++++++++++++--------------
 hw/vfio/spapr.c               |  4 ++-
 hw/virtio/vhost.c             |  9 +++--
 include/exec/memory.h         | 21 ++++++++---
 include/hw/vfio/vfio-common.h |  2 +-
 memory.c                      | 31 ++++++++++------
 11 files changed, 126 insertions(+), 69 deletions(-)

--=20
2.20.1

