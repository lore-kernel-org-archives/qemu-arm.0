Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5070718lfm;
        Tue, 21 Apr 2020 06:06:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypK4BHmkui1FZEKpZFQ7hGplzgjkvBImECtsDGcqmeipl0rTfonil+cft94SVLmQI0uJ60IL
X-Received: by 2002:a37:87c1:: with SMTP id j184mr20382784qkd.425.1587474368405;
        Tue, 21 Apr 2020 06:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587474368; cv=none;
        d=google.com; s=arc-20160816;
        b=k1R/h5Lmu6DKlo4rU7TMQvRRtkW1PF20fwnh1HPbBfqu5D9lXO9QSP8s/Ev1vdgstZ
         /tngtd9IjLEUL1gVm1fYMllVdaEGj6za8UOFpBLVnF5Apj/M7UVz5pawa1y1fzDLDp57
         xL+NWbc2Y681bAVm/MxvKQpR1ehF7xbsoGfaRzB0hLjmQaFeoNZqXm6AhGGhGoXa9mr5
         jwb2SjFJcqVrArYhzRUBlvDodGB54p/auO++Gw9ewU9QpCCpcMl12jH5LLvevWQA7U1c
         FtHy3MwKcgyLmUsUFZGt5L9nGzroQ7unCzWEvvwY8Jx0+iUe04CUTgyoSWlvkb/tV9S7
         WUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=pFiqul+UkrQQ3DByAbZpAxkwiDQLtuNRRR2ifAdFrtg=;
        b=zXE/dprtxPCizrLjpSFQYbptYbsdWLWP9WjJrbej35HPmg0/JhITN3p/cTvrwbTsTZ
         Ozc2wI0ynavS6jCjS7gs/zu14TYbDqcc5prLcfFNqXKs0fEYnyTff4MQIXX3Oq+TPVvC
         zOtS2FMHD5jfQHCGycBwDERK3EB910laAPwqa84P60Zt7qff+GJPie6a8erh0Pm0JOFn
         f+ShE+bhATT2+Sb2IKC923iF5IysR4JoVxH5sC7YJPxlRD/jouVV9zQzUWwA1/y94kY4
         pJsD5DD7bZpN9OYpMvwqqBzQlNE5aSLndXRZRjU6F29+nuzz+sSnkJFML2GfwV0KFUuW
         8NEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19si1271456qvf.127.2020.04.21.06.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsbH-00052D-RQ
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXn-0008FR-RV
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 09:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXl-0002Yi-UG
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 09:02:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3676 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXe-0002HT-M7; Tue, 21 Apr 2020 09:02:23 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7AF0B68FC3DBDB0C3C18;
 Tue, 21 Apr 2020 21:02:19 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.91.160) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 21:02:09 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v4 5/7] tests: Update ACPI tables list for upcoming arm/virt
 test changes
Date: Tue, 21 Apr 2020 13:59:32 +0100
Message-ID: <20200421125934.14952-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.91.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 09:01:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
 prime.zeng@hisilicon.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GafZ5LMBwcfL

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


