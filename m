Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10115619lff;
        Fri, 17 Jan 2020 09:49:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKIGR7h+2Pa+cqF25h7ot+P7g39w1aPMjx46cTQir1kxcfRGZX0QGvlze4pddiMJbCeqaB
X-Received: by 2002:ae9:e901:: with SMTP id x1mr36945407qkf.117.1579283362377;
        Fri, 17 Jan 2020 09:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579283362; cv=none;
        d=google.com; s=arc-20160816;
        b=JfG9Kxo3a7qlGbdVvSakakYIioAwIAG4QFOvoalsVQEZ3ChWtLk5NxREi36hW8wDRC
         7nk8cUuDixSar1PP1fB7Uh1EmZdnYYm1Q5YR4OJoXWVtnczx3WoU8fQQdbGFK0mt/1Fe
         HxIa+vTGAlfVLsbBSaiseF++UMeRb8NVxLuQrC30vZJ7QOE1Nl1Xsr00SXXVj7UDBeEf
         0SShoaSLrcbKLlAiSa/TODbJHJTjPY8tIvhX45fS25lX8Y2o9oaWAzWryXYKwfCbNY7Q
         2+yNLz3ByKViXlHbaXuDhqTzbl5Ko7yydUw00YMbb6FpX3GLLRS+wQdkVjH7r1qhdPi+
         IQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=CY1kSJsdUIlx2KqncdHsa930Tu3O6KEWkoSKcE5dot0=;
        b=CW664kcKyorAYc/mVsNsbAp/+4bIjfLhTG64A2Ql6GErRjg3v4QShmwG2Jjs9CXuLK
         n1ubKDfqu5ZBE0mku22R/xwmtEr+2AWRPrfQzLyCkNbLbvu2hxUrhGUYjrh2uY4Wo6AS
         0VIJF5v+SRoug+0KbBLarEPykXAReLTMHyqEndrkwSre9+zJ+ujHn3HUCZFQM78g2AtK
         FLgvi/ibA0iOY4n3DoX8F7kC1eJaD8zELN5QAQjsq7HCJEACqDPYioG/avYwsdE5otAt
         5MdwuUcjml3mUreGRfzibFdFW96Wp5iw8fRYEJ6ZL5GWMBNDc6FUY+Z3tA2n8HDhiEDz
         zmDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si15421848qkm.174.2020.01.17.09.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32877 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isVkH-0004WM-C4
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViE-0002Vn-OB
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViD-0007tM-JY
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:47:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2685 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVi9-0007mm-MN; Fri, 17 Jan 2020 12:47:09 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C5B45D4814A9FEF4AEFA;
 Sat, 18 Jan 2020 01:47:06 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 18 Jan 2020 01:46:57 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v2 6/7] tests: Update ACPI tables list for upcoming arm/virt
 test changes
Date: Fri, 17 Jan 2020 17:45:21 +0000
Message-ID: <20200117174522.22044-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DfW0edo7LDZP

This is in preparation to update test_acpi_virt_tcg_memhp()
with pc-dimm and nvdimm. Update the bios-tables-test-allowed-diff.h
with the affected ACPI tables so that "make check" doesn't fail.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index eb8bae1407..862c49e675 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
 "tests/data/acpi/pc/SSDT.dimmpxm",
 "tests/data/acpi/q35/SSDT.dimmpxm",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/SSDT.memhp",
+"tests/data/acpi/virt/NFIT.memhp",
-- 
2.17.1


