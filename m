Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp326558wrv;
        Wed, 10 Jul 2019 23:19:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzI9nQjhzr6rZCvEsx3y9SY0JS6KqpTy+hcltNdQGuolKipUNToELjedS0nedXQlOW4z3U
X-Received: by 2002:a05:6402:1612:: with SMTP id f18mr1687405edv.231.1562825963437;
        Wed, 10 Jul 2019 23:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562825963; cv=none;
        d=google.com; s=arc-20160816;
        b=GsIOLJQKMyFW8IXg6QP1X7U1fy9B1QHN+HlGqrbwPWU4OwDJZVO0wmEeG9Usg3SW93
         8Vf2VRFjeik6H+n9tphiDLv7IE/krCVDCbbLX4n882bMbZaokpUQNxZxZpCko4XmxCi5
         TWV1upjQFdoBMDAFwhvVVYm+ghKK8c2WIAjcYsh+YcVRHiOVVI6zsc+3oOwYDrAlfDsG
         uHBYnhrNHY2ouZwLiW9M/kEpmYndELc8gTiqrKATS0/cX+Z7YaIjBTA4VVik32TbPkp9
         w10jH0i799fftT7Bg2iB7Ma744Jj2HJ9MUJaF4Ee1MrjwFbzBLztgUQjvyQDTeFPuNNY
         XgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=u+w9jqjUOyWS+S+N0Y37ZQ9ITK87hLWQpxFw2ZYiokg=;
        b=AuMD1KHSWdJuBRDASBhuRq9Zlrd46HVniDrLJ+XBvLIyCnK0IZDWj9Qt9X6REQfVEj
         EN9XDlAW2PiCrafI8Vc/q6gi1ELuPKbxfq+PVhUh+AsrXY+IVRi0OzawTzk6LKxmSbHy
         7evmd2Kv9fHXFFwq3T4DW/BqmPfWlVnP6v3qJ248gl+mrxdh+8MvwEuY1IOPWPvIYy/n
         0EisG4EcPswAwhlrFxZayJxMdlbGboPJWG/GXX9vV9/HNW/sl1nLoMjlCnPRQjOTF8mr
         KAXMGik9hNYHQLxj+MjepQWBh3slqpPNxKnSrZ6gANKHNDCf8mxErBRLRFKErO//nCyB
         wZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l56si2897061edd.41.2019.07.10.23.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSQM-0005Qg-Gr
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQD-0005NL-Jh
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQC-00008G-Od
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlSQC-00006l-It; Thu, 11 Jul 2019 02:19:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EF933082E44;
 Thu, 11 Jul 2019 06:19:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40D5360600;
 Thu, 11 Jul 2019 06:19:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 11 Jul 2019 08:18:52 +0200
Message-Id: <20190711061857.13086-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 11 Jul 2019 06:19:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 v3 0/5] ARM SMMUv3: Fix spurious
 notification errors and assert with vfio
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
X-TUID: bJFvvTwUl/kY

As of today when a guest is assigned with a host PCI device and
an SMMUv3, VFIO calls memory_region_iommu_replay() default
implementation. This translates the whole address range and
completely stalls the execution. As VFIO/SMMUv3 integration
is not supported yet (it requires SMMUv3 HW nested paging), let's
recognize this situation and simply assert.

Also the series silences some spurious translation configuration
decoding errors (STE out of span or invalid STE) that may happen
on guest IOVA invalidation notifications.

Best Regards

Eric

Eric Auger (5):
  memory: Remove unused memory_region_iommu_replay_all()
  memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  hw/vfio/common: Assert in case of nested mode
  hw/arm/smmuv3: Log a guest error when decoding an invalid STE
  hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations

 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 26 ++++++++++++++++++++------
 hw/vfio/common.c         |  8 ++++++++
 include/exec/memory.h    | 13 ++-----------
 memory.c                 |  9 ---------
 5 files changed, 31 insertions(+), 26 deletions(-)

--=20
2.20.1

