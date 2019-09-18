Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6481837wrp;
        Wed, 18 Sep 2019 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzXbCjCjpLzYE2s/AEAneVVXUZSBuPje09rimavNm6bntX99+UBX5rD3AZQdiXKokSvAsW
X-Received: by 2002:ac8:329d:: with SMTP id z29mr4175901qta.112.1568812770945;
        Wed, 18 Sep 2019 06:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812770; cv=none;
        d=google.com; s=arc-20160816;
        b=GoPQjSFvPwSuNFhhCIhVHac09rdhzMo3D2M/tpZMImXZAFLJ5BHW67Yi6Azo6RN5mG
         Mevzvj7yWW26vDFeDS84K1O0qriq+jJJrFQsek0KRe0UY436DN89TRu44Br4oA/4YKt0
         6q2ieun4iZUaR12CnwdBykVVOxcX1Q+eZb87EKsKuUTc+hZE+Qab8Tpr4wvhz8QARL/Z
         mdU6GJxpt0D83KP8bJBD6j5ZdygofLtKtNAr+I6wDNLKHGH4O4qK1SrCVoi0py0ndMNh
         h0oGCWB9DGccxYUBLQC8qduzXK5smxirbZ9B1aYufcbWeIUxWePzeOeES8lfZbJqhooO
         i6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Opv04VDlwUkkyYVmCPG1+HnIiaWRHZRaxrEOYnJdmFo=;
        b=G0Pl+xxAyLaA1c1IDfx9GZlILHSY2d7EZspQurwiTr/seG4FckGp6IuS8O0IUV+vxG
         FyKZdZMBGIgYeKVHdN3ejVJGqtONBlJdi/CkUWexacKR0B9AicYLLU00slAuhtVG1WL0
         IJ8d+Z55yOA65arF9Ex++AaZuTrffp4bqXEMZpNRKEI/SwoofllOl7n50zeAKKdZ+UgK
         GyQnVF7REuYardqYxkuCARbrSZFzyELNj5WVsx/nvnqeqEd37+qjqOOGM43y5sUvvYqw
         ztHU5ufIaQXOuiC4J+msiDDqbU5q0F7ZLoEd7yUvn5RxE7hCcuOvq9790EbHN8WNsPPR
         N5pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si4037471qte.192.2019.09.18.06.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZrk-00062A-Bb
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhN-0004k7-0S
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhJ-0003aw-3d
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:44 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43854 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhI-0003Yx-OK; Wed, 18 Sep 2019 09:08:41 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 296FD86B58D0B5171D67;
 Wed, 18 Sep 2019 21:08:38 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:08:27 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:32 +0100
Message-ID: <20190918130633.4872-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v11 10/11] tests: Update ACPI tables list
 for upcoming arm/virt tests
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F8uE4k5sXiEv

This is in preparation to add numamem and memhp tests to
arm/virt platform. The bios-tables-test-allowed-diff.h
is updated with a list of expected ACPI tables that needs to be
present in tests/data/acpi/virt folder.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v10 --> v11

As per Michael's suggestion updated bios-tables-test-allowed-diff.h
instead of adding expected files directly.
---
 tests/bios-tables-test-allowed-diff.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test-allowed-diff.h
index 7b4adbc822..3776dd2f3d 100644
--- a/tests/bios-tables-test-allowed-diff.h
+++ b/tests/bios-tables-test-allowed-diff.h
@@ -1,2 +1,17 @@
 /* List of comma-separated changed AML files to ignore */
 "tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/APIC.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/GTDT.numamem",
+"tests/data/acpi/virt/MCFG.memhp",
+"tests/data/acpi/virt/MCFG.numamem",
+"tests/data/acpi/virt/SLIT.memhp",
+"tests/data/acpi/virt/SPCR.memhp",
+"tests/data/acpi/virt/SPCR.numamem",
+"tests/data/acpi/virt/SRAT.memhp",
+"tests/data/acpi/virt/SRAT.numamem",
-- 
2.17.1


