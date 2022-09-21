Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2755633ejy;
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TWltsOP7mDlZ6QU9d+yLXluO4jeUmnFOw1p0vUiuJ2OQbxzmqoDcen/R7hiBjVENtQ4MS
X-Received: by 2002:ac8:5e14:0:b0:35c:bab9:173e with SMTP id h20-20020ac85e14000000b0035cbab9173emr672943qtx.222.1663802073331;
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663802073; cv=none;
        d=google.com; s=arc-20160816;
        b=NmYyCGej4r2FMILWVqq5Oy1CLmOsxlNoK+Gib3ZYIEDJaoHz8uZjUyeNzbmL6AXsRn
         2xPy3Wu2bx8mEvlDibmzScPyK04nKSt5E0D+grjMp0nw5z02BBqmBSBeaGmimTsMB8HM
         uIz3o7ZnbfT2JiEGSg5AjkHja++A/l/zkgYwwduhunRDedrIo8DlqUyDC+c0lORisss2
         wYkeJVHKHPLJmIM68MWp/wey/L3eh731U40JBm+FikGGa+9b9+1A7gzi4zSfUGA9NBR6
         /+hJRyNQzxl5xmiecpvspaikTGWZ8sC71u8wmDwnNsN4EkgOw0bV6oXJpb69J6P1HvSC
         4Eyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cDj/bCcZJ3kvOGEZHuBAu+/jvYP/iDltadLCS0HVfUQ=;
        b=fPa/8ZHvlXpBdrZdfOpAH8igkTgKIer8SfJ7rtqpIQL9yOqHmrTBCj+AK1nzalnz5y
         XVsxZ6WHXoYNjRGx1XZoYyJBcyryCQq/Z1r2/e2pswJTPrU8HmuIUdROwLNZ3XTQH+Mt
         pbQuehr2Kr0Fs0mTmjD5aI9iGwdhgKDUq+Q/x+hsnQFAYOxOJNUwwMa30Lq/UeUq2k3r
         1UQ1Vy5RhGTmHvaoXvL4zvtm+9Gw3fwkvDiSD47TrMtKaG5GUkgj1p1IHiJJ0mu+EXR3
         P5GQm2z8UW1EYVeYyGhfeeDy5xEiYnmaqSGyhLBFqMrBVVnwGzy2ahH1IwiGuYZ9yZb0
         sUGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SoNCio20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a056214076800b004ad62693cb5si2369550qvz.211.2022.09.21.16.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SoNCio20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob8vI-0008LR-RB
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8us-0008KW-8Y
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8uo-0001qg-G6
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cDj/bCcZJ3kvOGEZHuBAu+/jvYP/iDltadLCS0HVfUQ=;
 b=SoNCio20+8iaKsEz+nIu4g1BTEPUKuq/ZiSvHMd+zAebE/FuWlQW1LnuOflcZEuhkYk8Rd
 TlsqlJ6ackpjB+VKAhyF5TlWtgFHyPOtgUR5nTLWNv0qX9p/YjMT3UO6/RY13wXOpB1/Cx
 UxsViAt0fA3cQ8anHuU4Nj/LgT6bRy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-viREKygmMB6J2lTsZQ2T0Q-1; Wed, 21 Sep 2022 19:13:56 -0400
X-MC-Unique: viREKygmMB6J2lTsZQ2T0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE7A1C0BC68;
 Wed, 21 Sep 2022 23:13:56 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF552166B26;
 Wed, 21 Sep 2022 23:13:52 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 0/5] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Thu, 22 Sep 2022 07:13:44 +0800
Message-Id: <20220921231349.274049-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: /1S3S8vipH+p

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

The series intends to improve the address assignment for these
high memory regions.

PATCH[1-3] preparatory work for the improvment
PATCH[4]   improve high memory region address assignment
PATCH[5]   adds 'highmem-compact' to enable or disable the optimization

History
=======
v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
==========
v3:
  * Reorder the patches                                        (Gavin)
  * Add 'highmem-compact' property for backwards compatibility (Eric)
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)

Gavin Shan (5):
  hw/arm/virt: Introduce virt_set_high_memmap() helper
  hw/arm/virt: Rename variable size to region_size in
    virt_set_high_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
  hw/arm/virt: Improve high memory region address assignment
  hw/arm/virt: Add 'highmem-compact' property

 docs/system/arm/virt.rst |   4 ++
 hw/arm/virt.c            | 116 ++++++++++++++++++++++++++++-----------
 include/hw/arm/virt.h    |   2 +
 3 files changed, 89 insertions(+), 33 deletions(-)

-- 
2.23.0

