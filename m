Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp469938lfi;
        Fri, 3 Apr 2020 03:20:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKvVVKxqeKPDnVEBWKzQw3EzkXOsaxYshQeaWKNEAFKlL/Z8j++TaGZQNNw4ardyX59lu7q
X-Received: by 2002:a37:9b56:: with SMTP id d83mr7467134qke.461.1585909200034;
        Fri, 03 Apr 2020 03:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585909200; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd/sVZcUOBguolefWj/8t4iGllKHYfDu13Fag2KirxqIwizl8iwKlFfwk+64sc17YI
         +7HcYX49RzH3tnXvskgyhtRmR2kuhvbqGROvUAyp7weYeaiGX4GtJ3iSdokB3Y+7oGoa
         K1rFxVW/Q2f8vXiwXyzPdg/skpbXEpdYCJ1aJc9axfAk0YUZbr9ot0VAfYVLZstsOct7
         7o/OXilaqZDpl6b6ydVdeUu6Pz2MIA1MCJQkeaZc+bjyk58C++JgNkigycvfo+z8TWNm
         IvH6P3kJLza6mdNkT259gzV0VdDsRgoSJOAo4MCOox08aYjNoT5bREQOzj8QtFfxNMKv
         OEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=BDo6/NpvcZe1m9Q45SOapiH2+35sMq4bzkU/dXELtnA=;
        b=gS2H32M3I+++T8BMO1Xg4248tTzaZxjq5fxziE+GL7W5gKZgfefkM2mcp8j1MVTlBN
         0dqI2AH9m4P1zwjMX5+YBqgj5VFHsm28zcAxKebRIL64CoJdld6C5j/dUzvIUyNlooB8
         b5bxjeymkFGQmDyidpn1xHQzduWKTDM1ssDDDMH9EZJosNWE6vFRyAP6Q6CQqjwKshgI
         4nUOrgR7l0lSD+5nrjppXdQrTcqBVJzjrpbmLxDMjJ2OYLrewvPQP9zM09WLfZzmUgWT
         jZLTxhcj7/VKmMbkeMTvT6l//nsL7/1tJ/3f9lUbSWqj2EJiyna2ifWlKX5maAOqvX+o
         q+qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si495184qte.361.2020.04.03.03.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 03:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKJQd-0003NH-Eu
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 06:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQR-0003My-Ku
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQQ-0001oX-IY
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50348 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQQ-0001kE-7H; Fri, 03 Apr 2020 06:19:46 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5DAAF1C7CDC4ED513491;
 Fri,  3 Apr 2020 18:19:39 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.24.31) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 18:19:28 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 v2 0/3] acpi: Fixes for inconsistency in ACPI MR size
 during migration
Date: Fri, 3 Apr 2020 11:18:24 +0100
Message-ID: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.24.31]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, dgilbert@redhat.com, xuwei5@hisilicon.com, linuxarm@huawei.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yK5G06OPqST7

This is to fix few issues discovered while adding NVDIMM hot-add
support to arm/virt. These were previously part of [1] and since
the fixes are generic in nature and might be an issue in x86 as
well, they are being treated separately now.

1. https://patchwork.kernel.org/patch/11432371/

v1 --> V2
 - patch #2, Addressed comments from Dave and MST

Updates from [1]:
 -Added R-by and A-by tags.
 -Edited commit log for patch#2
 -Updated patch#3 as per David's comment

David Hildenbrand (1):
  exec: Fix for qemu_ram_resize() callback

Shameer Kolothum (2):
  acpi: Use macro for table-loader file name
  fw_cfg: Migrate ACPI table mr sizes separately

 exec.c                      | 16 ++++++-
 hw/arm/virt-acpi-build.c    |  2 +-
 hw/core/machine.c           |  1 +
 hw/i386/acpi-build.c        |  2 +-
 hw/nvram/fw_cfg.c           | 91 ++++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h |  1 +
 include/hw/nvram/fw_cfg.h   |  6 +++
 7 files changed, 114 insertions(+), 5 deletions(-)

-- 
2.17.1


