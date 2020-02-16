Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3917712lfp;
        Sun, 16 Feb 2020 02:22:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9hjq4eK9LyFVqKOh++z+rfJtNX8VAeGhz5rk5yggB/36jqrW2xnLAEphC/hRnocli3to2
X-Received: by 2002:a05:6830:18f6:: with SMTP id d22mr8310784otf.59.1581848534413;
        Sun, 16 Feb 2020 02:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581848534; cv=none;
        d=google.com; s=arc-20160816;
        b=0V6qJXcgowQfBia6O78aXWU8niP4Cg0VnG56RqRo0LGSG6r8XqG7Uxm+iND1YG/ORD
         ATDWkU5SZZh6J5jN6KfDpZcyIbA9d1Znr0QjhmmQKJMtN00h+BTUvqf1n4rJvLzvu+Ms
         2fL+FXXP2zV3SClLDiRBDcRPaM+hzXV6i1HUDLk9sXxSS/4CDJDE3gagKWq9zz8FS6mV
         orUr8CNQtSpw6vD7nuJTjszfdDWIgdv5BBOxIv05t4YyrqwGAMd2jPw3TJouJqXhHTuy
         pKxSYw87z0HQUafqSVky8RYAxteg15GLNTfH6ahxoARaEekto/jQ0uAzVu+g16FiILfw
         TDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=qVTVkvm/x3TxIbJO1P0x50Rr6BGbIYDIjH5GKyKLQpo=;
        b=o6ykGFN9N65hQKgju+cCRGbAZ2XXi8NX4+aW6Itmq/9+vdoYCnrHroI5FT97RdqBid
         2ws+LK1tuySMzjUbJ1s2GzqJJrhy6REXKawIheh9EMjUBrNWdUudJxff0kMGJCmnkksO
         brjkPeNOUFdNVDg3YyuMn1ryNI8DL6M2qfVMwKBj7uIndOP6UtzGGeovYsJl1hz4zC/e
         kTnCRtQ+fYm8ynGlUvWhugGTmXuprq++eALuHFckdGaSscXmmKcdcOv8FzeE0yq9BhOi
         RbBLhNH2hKx98eCv0aZ4YY+opwvDzUWknyTQKMLIy6Z2f2Ns/2O/d5SRoJ+2oZWRtpE4
         Y/pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z18si5546068otq.121.2020.02.16.02.22.14;
        Sun, 16 Feb 2020 02:22:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgBPKWL (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 05:22:11 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59240 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727822AbgBPKWK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 05:22:10 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A046D649C33483768618;
        Sun, 16 Feb 2020 18:22:07 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sun, 16 Feb 2020
 18:21:54 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH v23 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Sun, 16 Feb 2020 18:24:08 +0800
Message-ID: <20200216102408.22987-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200216102408.22987-1-gengdongjiu@huawei.com>
References: <20200216102408.22987-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 0NRFCkOYCl6W

I and Xiang are willing to review the APEI-related patches and
volunteer as the reviewers for the HEST/GHES part.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c7717df..0748475 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1446,6 +1446,15 @@ F: tests/qtest/bios-tables-test.c
 F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
 
+ACPI/HEST/GHES
+R: Dongjiu Geng <gengdongjiu@huawei.com>
+R: Xiang Zheng <zhengxiang9@huawei.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/acpi/ghes.c
+F: include/hw/acpi/ghes.h
+F: docs/specs/acpi_hest_ghes.rst
+
 ppc4xx
 M: David Gibson <david@gibson.dropbear.id.au>
 L: qemu-ppc@nongnu.org
-- 
1.8.3.1
