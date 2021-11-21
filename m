Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5347493lfk;
        Sun, 21 Nov 2021 04:30:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwggy78zZ7jlpl8u8bxUhjO6XtuutJoCRCanaDLy677BlVcU4bDe6G2qKeetdyfPu0KlQpK
X-Received: by 2002:a05:6122:2227:: with SMTP id bb39mr46393400vkb.9.1637497843657;
        Sun, 21 Nov 2021 04:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497843; cv=none;
        d=google.com; s=arc-20160816;
        b=mryI7So1kjyvxT7qhVK4wTfMt817tRWPU+RFSXb9TjLWE5yUZCiGcehL3ZU6IRo2zV
         UgDeOJu0o1ZW2PNiT1cnTp3b4csjd5uhfL1RJ1yPOJfzlDRaxGgFxpafzFu5H4Smcl+G
         5UbaU6NzKESL5cUXy3AryzITpCXNHWpBKq2+Ct0tYldX3lBIwLtFSd8bTQmYoJgJd/n5
         4LgJpZVXpuVxJRGQSQ4c2O4Mpxj28hAhU5/1eKzSWZnJk56zGwrqHYPXtJB8eHMSeL3K
         7Bksyf7/O1o92V3Fjki2ZqLzsWf/OmPYxuEn0fRy72Bu3yyXgQsTEj6Z/R5rjCYnhMw2
         GBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=l2Gl63zK7TUz6Y0yltRx0/q+8BC3zmIZ3TdRYlmPLEM=;
        b=MV5Rtc2FYk+x/F23/os9GJuhbz6A7cd50WJrPUPYnYKgJ0yOIF7oQ7CiDtVeMquTi2
         F4BbOFjUF8SjhxfKJPYOBx4riOfVe0pZAHkjlrVEqzeH6nsILooPYs2947t62EfYUs+c
         3x2KOt6f/2CdmLGdLv5aw7cbvI2qFrMbSXQDJu/TObs7N85IJl4XtXlGJpvD3l1eHwpF
         qebaxukjd9/uD+edsZdfvXEv0C0Xu0t4LdrGC7NOOKqagKulf/EWsywckbMHauAV53zt
         Yrc/DMiMx4A2DjDRXPU6ipf5vcMRC/UW2aYu/4aMe3+0hBfZvycVnv2fyZNXB4pDcIVu
         Tprg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si20542031vsv.16.2021.11.21.04.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1molzX-0007SJ-1F
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluN-0003pH-4W; Sun, 21 Nov 2021 07:25:23 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluJ-0005md-4l; Sun, 21 Nov 2021 07:25:22 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxqH62FBkzcb0j;
 Sun, 21 Nov 2021 20:20:18 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:15 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 08/10] tests/acpi/bios-tables-test: Allow changes to
 virt/PPTT file
Date: Sun, 21 Nov 2021 20:25:00 +0800
Message-ID: <20211121122502.9844-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: OoGNY1a1jOXN

List test/data/acpi/virt/PPTT as the expected files allowed to
be changed in tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cb143a55a6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
-- 
2.19.1

