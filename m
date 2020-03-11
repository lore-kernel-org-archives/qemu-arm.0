Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1030367lfc;
        Wed, 11 Mar 2020 10:28:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuifTpXesmEgY+Oy1jcLlHGloZVg4QcJn09tGncciEDleWncNtD5j1K6jimrgqYOAZa0/EF
X-Received: by 2002:aed:2a55:: with SMTP id k21mr3782517qtf.159.1583947717614;
        Wed, 11 Mar 2020 10:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947717; cv=none;
        d=google.com; s=arc-20160816;
        b=FDJXZZMlxQ/HQamkfq67JNi+0M22zVL7x53zY3xcmU8aUT8UFdn3hHbOR7xrRLHz9k
         +Hnmd9ZgCq/F4bmXUWtaLYwQ5/889m32yz8rdKp2IpfAZuhgq8r7YvTx1KenOqBM1STK
         sdBKM1OWhuE1nnBhfjSPkLesryqofKu4bIl2pnxWc07sXLYNipxLuQ3V0b88pYB0Ke2G
         VmZ4AXt8ktjFf859TDvtRu9VS3UP9BTtjOvAG188K3cvIZHkXuDOxcmAcdExjMLfa5pF
         yaGe39rTRSwEojZ+SLp1VgX5wXXLgdsF+xCalkjANYhpYMLrcwAS05612sBJoALt2M+2
         Bm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=pFiqul+UkrQQ3DByAbZpAxkwiDQLtuNRRR2ifAdFrtg=;
        b=Dv4fuz+/NTqHFMUdbY0oC262Cx9QPigBKi0q+i3qhs47fC6sU72O+7bH5xNNVu8lW6
         4fOXmrdvmp5d/h9UbeVtodmO1suSRyOgYiRDT05OVDlC2daZ8Hx/fx+B7k4xphhYSjqO
         6GU2AkruudCPdMNb/cCv4wggsC2HL5HrNdWh5+xcdtPppn2v21pPArDMpNSk1/qYRoxD
         E53KheJ7rpvSRFtHrNg4A1NAkFR3Pkxab5aNL0yCpEEBN4M/keJmAQznVh1yyVPDoEYt
         Nf0kvyqCnYB9sVokBtibY5Uit9ihsvDUjVmgiWGUA3ty21YqB/MRVFCH4QTQBcdGjNdG
         067Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x53si1353842qtb.391.2020.03.11.10.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC59p-00033e-01
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55H-0002U0-Tf
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55G-0004B8-Sl
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:23:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3280 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55E-00043Y-6L; Wed, 11 Mar 2020 13:23:52 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CFA3D2A35C69E15F4093;
 Thu, 12 Mar 2020 01:23:49 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:42 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 08/10] tests: Update ACPI tables list for upcoming arm/virt
 test changes
Date: Wed, 11 Mar 2020 17:20:12 +0000
Message-ID: <20200311172014.33052-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltPNJAUVXPp9

This is in preparation to update test_acpi_virt_tcg_memhp()
with pc-dimm and nvdimm. Update the bios-tables-test-allowed-diff.h
with the affected ACPI tables so that "make check" doesn't fail.

Also add empty files for new tables required for new test.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/data/acpi/virt/NFIT.memhp             | 0
 tests/data/acpi/virt/SSDT.memhp             | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 3 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/virt/NFIT.memhp
 create mode 100644 tests/data/acpi/virt/SSDT.memhp

diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/virt/NFIT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
new file mode 100644
index 0000000000..e69de29bb2
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


