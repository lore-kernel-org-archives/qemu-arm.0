Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4687858lfp;
        Mon, 3 Feb 2020 17:47:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxM70XohU6EFfH92o+4Va9y8Aiih+HXGubS3G6LLJCl7BQcxsbMISibFz2B9Efu/ZhMAQr
X-Received: by 2002:a0c:e790:: with SMTP id x16mr25017218qvn.18.1580780843644;
        Mon, 03 Feb 2020 17:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780843; cv=none;
        d=google.com; s=arc-20160816;
        b=D3OwdQ8nHzLzVYga2AFFAkfUYcww38BrLYr5HiEBThsO0N4oHZ+QMGKZuittjyWC7i
         OAKfJyEHOzeAph1WB7b534HO35BGGHEnNhkxQZYNWvcAkq6jEkzipPXuGP7rYBgNBh4g
         c1Rhzyv8hMi+X384BZqCk9XtQwkcXefTeIVb3EqF+gAHW9NkaJZGDX2DwRafyk5YPEYB
         PHhypggDCqF5DbA6vNS52jIgyih4bxuQ/++JOCBAs8m8An3HriliwIhkxOGQeY6iZgtI
         mzL/CzEShwzm+824zmUoURGzOf4uxbrT7StawEtb8sfwkmOKE7+kFh5wXjjjscNC32MR
         tSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=OT2C9PUGr07RascEJqyQqzRuElmKHzKlVRQ6fdLc0gQ=;
        b=AfMswnYKDWqvTGHK/C4BooD7pg51JvbGA3evdRk7hIivFQ4IAQ1qsbR/02xo6TreE0
         gnVMInF9YAc6TPWAFWwuNj3O9PvXsIk2w12ZEpHMdQDZVRMjJENj99ZsxGR//cvFVFKK
         jNabLYkdbYPwo4yPFADDLadTnLfx8ecjRx7D6oun2ZYI+BVcqXdRAa5isi2zhML0dzEd
         ek/TqVJi+BreBULozd2XiDauff19ZNAIX4Q3tAO5aRpgN+dilaklhfsU44xwuMegiOKk
         GV6FocuUe1tcZkD0j9GpEL9/mcOAm5htvkS+GvI/YKTpSvI2EkyIeRQwiyj0MHyxB65E
         EctA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p35si12480225qtf.231.2020.02.03.17.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynJD-00009V-0t
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIU-0007kw-HS
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIK-0008G6-E4
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:31 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:56540 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIK-0008BL-41; Mon, 03 Feb 2020 20:46:28 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 75492DA1B537395610A4;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:15 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/7] bios-tables-test: prepare to change ARM virt ACPI DSDT
Date: Tue, 4 Feb 2020 09:43:19 +0800
Message-ID: <20200204014325.16279-2-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
References: <20200204014325.16279-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +JxwTz/cSGcE

We are going to change ARM virt ACPI DSDT table, which will cause make
check to fail, so temporarily add related golden masters to ignore
list.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

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

