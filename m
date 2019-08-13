Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp36670wrs;
        Tue, 13 Aug 2019 14:14:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZPzNpQvadVhCLBGihUq1bg32/s5UV9Y5DpK1R7RC2AZctIwcFpxPRBHOpddXYY4gvzKu9
X-Received: by 2002:aa7:c490:: with SMTP id m16mr44419191edq.156.1565730876533;
        Tue, 13 Aug 2019 14:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730876; cv=none;
        d=google.com; s=arc-20160816;
        b=UB6tXcj5wCzcDD/HM3roTMbKQyifz81YKWCoWgGCp/6gHm0WzlooXXxuVQy24uFiny
         DNfX+yUwM9q9i30xl3paJ39a/X/yc8Dv+Oq07RZX/J6/wPPF7Wnids6HhZgKmyhCuHtK
         sS6Xyjz2DjqIzdi1i19HoO8Q3/qSzSX7tBL/LuKhzgl63hxbXdYTe2i36XXhhtyTT8ui
         5KsCy0j6mvp74zZUnZ+ZG+2zK4YpYVCassjR0QLepGzMSRodZj8kCMY2MWPJfmh4ITdx
         z6D09sbYdLlxRJTT5iyIwuzXyE5pE8sffdo5s7WqwSJrCllImofsnvakp326fIH1hkoD
         1clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=gzZP6fj4OMJOhAgrqkQc84hO7+jjCQFROQ+6U8qxrhA=;
        b=NSHhFmxblTLe1SISKFuP0Phej4SpeinMeEoIZza7Pd53AChpfAz8owqLUVbPGuynNL
         vfb/ojr1XPaeR3C7r/4Bn0OLacncott4vqiAYWmKwYm9HY/WSUr6Kl+xxefzGflmF6OJ
         5WVfKnJXGtFyu4/q5Xiq0xk0TosII9zpwm+onPczih9K1S1gkD3ln8eeuT6Q3y8UyGDG
         GQ8I5R9RAojMmINpwTsg2Escqp/HLqc8ZxK+rZSDExlN+qAcG1BSUGHCf4wFqtTQadJH
         R3ibFRgrVINWJzLHepsJF29VEao1NdaMZJTGiw8p09wyyB7TCVban9YeSBc4gnBoaEIg
         Nffw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b52si46025543ede.326.2019.08.13.14.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe7n-0000CD-J0
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1R-0005GZ-Gq
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1P-0001fF-2W
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:08:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:32894 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1J-0001Y5-Uw; Tue, 13 Aug 2019 17:07:54 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F15B9C2BA4CDCEF09560;
 Wed, 14 Aug 2019 05:07:51 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:43 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:38 +0100
Message-ID: <20190813210539.31164-12-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH-for-4.2 v9 11/12] tests: add dummy ACPI tables
 for arm/virt board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1741m9zyiCqX

This patch is in preparation for adding numamem and memhp tests
to arm/virt board so that 'make check' is happy. This may not
be required once the scripts are run and new tables are
generated with ".numamem" and ".memhp" extensions.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
I am not sure this is the right way to do this. But without this, when
the numamem and memhp tests are added, you will get,

Looking for expected file 'tests/data/acpi/virt/SRAT.numamem'
Looking for expected file 'tests/data/acpi/virt/SRAT'
**
ERROR:tests/bios-tables-test.c:327:load_expected_aml: assertion failed: (exp_sdt.aml_file)

---
 tests/data/acpi/virt/SLIT | Bin 0 -> 48 bytes
 tests/data/acpi/virt/SRAT | Bin 0 -> 224 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/virt/SLIT
 create mode 100644 tests/data/acpi/virt/SRAT

diff --git a/tests/data/acpi/virt/SLIT b/tests/data/acpi/virt/SLIT
new file mode 100644
index 0000000000000000000000000000000000000000..74ec3b4b461ffecca36d8537975c202a5f011185
GIT binary patch
literal 48
scmWIc@eDCwU|?X>aq@Te2v%^42yhMtiZKGkKx`1r1jHb~B`V4V0NaKK0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/SRAT b/tests/data/acpi/virt/SRAT
new file mode 100644
index 0000000000000000000000000000000000000000..119922f4973f621602047d1dc160519f810922a3
GIT binary patch
literal 224
zcmWFzatwLEz`(%x)yd!4BUr&HBEUHqD8>jB1F=Cg2*ZH@DxXmUMHZ-x3$7Gd2B8jU
X02q8=hbcr=2NT6lGiu<Mhsgo}c|r;S

literal 0
HcmV?d00001

-- 
2.17.1


