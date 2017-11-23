Received: by 10.223.159.82 with SMTP id f18csp836933wrg;
        Thu, 23 Nov 2017 06:56:43 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ144CG7VTQRcYTRNktxn6wnTgKLgSmJ9bD9cLZiJ251xT0uZV1CbxyIAbSqi88GtrFKuMG
X-Received: by 10.129.97.138 with SMTP id v132mr9885855ywb.469.1511449003124;
        Thu, 23 Nov 2017 06:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511449003; cv=none;
        d=google.com; s=arc-20160816;
        b=g9DyTSdKiFJ18tBvThWStnv3bSzGzGhuwkoefwy47f5PVnfN/cZ8yulZRWHl+WmT05
         suVOZq6Y5rjtSbE8B8RXUkOnsa7oYY+0BIRW61CRP/DXX8NNgxVnNVnhUaxO+wpdv+kq
         cVmRE8Auy/kA7mlTIdY3vZDVkFsk8FAaxPVgB/QFSL5BGFc+EIOQwoipR5jkRp0/XZ+f
         aUAThvjaRxwdMeRyHVl62HwbqgAcUL4hoNm8nS70ygwiVjVyHY0w37qz+aXHjDPvytfj
         DMVCEB/zFNUyiFk0Q+k9FQRizAXzF1WRKd+c5xGNQ4+0pGVKfJJkqkLA+TIZOJksGeS0
         2ZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Klgw8l+bc9tmtUb0rQhF8BkrjpTTT/4xhXlO4qjLOqY=;
        b=iQMe3MA20B1RQnzqGBWHfBkwgLHa7FS2AoUscS2VOZRGk7hth/8YBX7p7KIIcgMDcx
         F3O/OJ+9GD5f4qFOQonK48q635Vh6lvHxjpiqKdohrD+wBo9DhXxA9wjnWkLFlOGC8w5
         dO22C92sRe9MCyQT7lC76z+NHV1OXR7zDZ/etG8D6ywByWC+gWZRSWbF+nLGbKxCdl5s
         C6DLpt3qJSb1wxfInlrhRYHLihRpZwjiJvz6IU5WKGbpZht6PH7+zMmdgoLtQZnF7DDz
         +F0wqLBfgeZ1mBR/I/0ph6ipZ0/4o9bxMoQ5UEaWn1Wi3EOP+KP9DKhRl/s0UMYfdw8L
         BZeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q196si4011651ywg.689.2017.11.23.06.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 06:56:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHsvi-0001qa-KE
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 09:56:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvZ-0001qT-9i
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvW-0007P1-2Q
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHsvV-0007NG-Rv; Thu, 23 Nov 2017 09:56:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B6BF61BB4;
	Thu, 23 Nov 2017 14:56:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB255D6A5;
	Thu, 23 Nov 2017 14:56:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Thu, 23 Nov 2017 15:56:11 +0100
Message-Id: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 23 Nov 2017 14:56:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 0/4] vITS Reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wb+OzFZ1Yf6S

At the moment the ITS is not properly reset. On System reset or
reboot, previous ITS register values and caches are left
unchanged. Some of the registers might point to some guest RAM
tables which are not valid anymore. This leads to state
inconsistencies that are detected by the kernel save/restore
code. And eventually this may cause qemu abort.

This series adds vITS reset modality:
- the 2 first patches bring a minimalist reset through individual
  register writes. However, with kernel versions < 4.15, this reset
  is not complete (vITS caches are not voided).
- With kernel versions >= 4.15 we can rely on a new ITS KVM device
  reset IOTCL. The last 2 patches introduce the full reset.

Patches 1-2 have all kernel dependencies resolved.
Patches 3-4' dependencies were pulled for v4.15-rc0 but as the tag is
not set, the kernel header update still is partial.

Best Regards

Eric

The series is available at:
https://github.com/eauger/qemu/tree/2.11.0-rc2-its-reset-v3

History:
v2 -> v3:
- don't call post_load on reset (no iidr check anymore)

v1 -> v2:
- Clarify why abort should be removed for save. Leave abort
  for restore.
- Adopt the same reset infra as vgic
- introduce "hw/intc/arm_gicv3_its: Implement a minimalist reset"
  which perform individual register writes. This is sufficient to
  fix the issues without ioctl


Eric Auger (4):
  hw/intc/arm_gicv3_its: Don't call post_load on reset
  hw/intc/arm_gicv3_its: Implement a minimalist reset
  linux-headers: Partial header update for ITS reset
  hw/intc/arm_gicv3_its: Implement full reset

 hw/intc/arm_gicv3_its_common.c |  2 --
 hw/intc/arm_gicv3_its_kvm.c    | 52 ++++++++++++++++++++++++++++++++++++++----
 linux-headers/asm-arm/kvm.h    |  1 +
 linux-headers/asm-arm64/kvm.h  |  1 +
 4 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.5.5

