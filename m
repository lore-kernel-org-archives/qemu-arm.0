Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp443637wrp;
        Wed, 4 Sep 2019 02:02:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+AxaoJ/upnM659BcMbZXvVeg8B4fr7aErlOLVrfcxjTzlrEIWqGzf9s6o564SsoCNMnln
X-Received: by 2002:a37:6dc7:: with SMTP id i190mr39111917qkc.12.1567587776814;
        Wed, 04 Sep 2019 02:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587776; cv=none;
        d=google.com; s=arc-20160816;
        b=FZfnlItR8lwYAEBoJtAQBlqHkgiemNge6CTn7jBBn/eVUu0ZxYnnvPCERLJKEZBxx5
         lBQ5U41faKR94TN6GDJizaa+frk3BCPBMAlWsbN4CdXUclAlOIzhDwzSHrcmkzbIuHqo
         Wj3PMArOBJpM/4PGy5EP+N4E/spFWUtqbAtmN2ZLO1KXEvb3Xme54sw3u/mhfCHRbjdV
         8f08zyjDT28R6yHdV7KfBj9At1FXAlSRLfaQuMGtZLt30dLoBwbmSaoQXrnQOD/ARla2
         fcfSmsXH8I/cZ3i1Hwm0GTSz+bf5Ysd5MjThlxlT8Nn9MMseZWoJEPpluR3zmp0UHOUe
         U5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=gzZP6fj4OMJOhAgrqkQc84hO7+jjCQFROQ+6U8qxrhA=;
        b=l4ZP/IAS1qN8z2/EWoh5K5qrZ1SapDWkEF3Zz4GS7X2FBsY5fUEFcwJ8E6XWPtk5D+
         6WC1UL7595HCLHBwKuhG5g+fRyQAXLYY5JIJvOEcBt3S88lTcmF1KE8574unO4PIgHdN
         iaKXF3i/zE4BbdZcnQA5EsmTgykYzSpw0B8H4gPnuxg3WJnwvojZqcHVN01UfpAr8amg
         qp8WX7sUoDQcl3esXYKBA7o2mJqk9XSU++2yOc4Dsb05wU4NokpoFFhDOMFGDIxMBtJR
         KHfaSX9ttmH5j0bUFnCyGWo57VAoz3zp9U/ad5rdylb+lOWkUzIziLtjwA51UxJO3Eqn
         2dRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si8027316qke.21.2019.09.04.02.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 02:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5RBn-0003je-HJ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 05:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R7E-0007Yd-DJ
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R7D-0007Ig-AG
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2262 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R7C-0007I4-VM; Wed, 04 Sep 2019 04:58:11 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 21A5910B831C766D1A0C;
 Wed,  4 Sep 2019 16:58:09 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:58:00 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:28 +0100
Message-ID: <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v10 10/11] tests: add dummy ACPI tables
 for arm/virt board
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
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDaLlX+ecGFs

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


