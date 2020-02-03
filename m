Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3334535lfp;
        Sun, 2 Feb 2020 16:18:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqy13XcoJHoDOb1uvXxAUJVu+u/GrrJoJi8dZXnDfNCF6eDDlA5397YY8t5g5evAVasawTPO
X-Received: by 2002:a05:620a:98c:: with SMTP id x12mr22166310qkx.100.1580689113376;
        Sun, 02 Feb 2020 16:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689113; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6TInIUFfXodGTZ+7RHCYVAnjqeR4nuHfMKtnivUlY/CeYGvb2/BHojJOPFtrV1tHk
         DulM2zbMRr78Q9nK+w3LFGQhXw9zBTTAhMlgynvIrwpjFOiRQuM9PPrdsawFfd06ymaB
         pgBOF9A/W9XrXCnRnMfnS/9Vcj1kRGpHSSP47ev/YQxaJfVna3pxUDaypSNvhOvan0KZ
         rNKE4oIWnnBOw6PK9UgXQKyT7hzkNVWyXdkdtX+U0Pd37V92IuQ4uhb4ZIDkVPJ3DOw0
         FibG+EHuBh7i4DS3WMHjGqTYugqj4TtbD6NOMBHiygL/6UfbfMx1f31CGnQoorn1vKmX
         LWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aJvtFm/asnFyhXXXBHEULRITn355fcIJ9ruZ6maBi9I=;
        b=rx9hv+t9XZXyJqUfBMOZUhESUjY03R66mVFUIXdBIpM0lwjVmjcbj1RisUJThR6SYj
         C+Uvpf59HNKQK8lhbwnbOkj/fZxyAIaLDSTvJIQSU2nRbc1/oOsLxUwOkQFRYFWnHfEF
         jAVSWLSft1AL87fpQK1queov2lZmrA+j5R5OF1T+UI4MywJZ76WpWozqHRIvX0Axsho5
         bJuheVRO+/IXFnTZpdOjtw/6O/0ut208M3TKCoIVISYyZHDW+ipUPS20tWVLzMzfEhZ+
         zLGdKOeIp339L0yOC3PQMXEp+gpWUOwZ8rM8RPc0+nIoIwfO8xdRdzw7vkJMm+iv1RPt
         PfyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si11300899qkm.5.2020.02.02.16.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:18:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPRg-0000fL-QG
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQS-0006lf-1J
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQQ-00047I-Ui
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 19:17:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2690 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQO-000419-Hl; Sun, 02 Feb 2020 19:17:12 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5961495E92C981BD13A2;
 Mon,  3 Feb 2020 08:17:09 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:00 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/7] bios-tables-test: prepare to change ARM virt ACPI DSDT
Date: Mon, 3 Feb 2020 08:14:59 +0800
Message-ID: <20200203001505.52573-2-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PYrYpUDMtrSa

We are going to change ARM virt ACPI DSDT table, which will cause make
check to fail, so temporarily add related golden masters to ignore
list.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
index dfb8523c8b..32a401ae35 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.numamem",
--=20
2.19.1

