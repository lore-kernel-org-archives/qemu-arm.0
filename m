Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3904181wri;
        Mon, 4 Nov 2019 04:16:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwd9v6qdM9L40vrkPgxRysJTKYuXs+IN0IeaOMt51rn5Xr0JLtwR5uHGzHHGLnWsCsyKUv1
X-Received: by 2002:a05:6402:883:: with SMTP id e3mr26734054edy.32.1572869800138;
        Mon, 04 Nov 2019 04:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572869800; cv=none;
        d=google.com; s=arc-20160816;
        b=RzVncoGsJrCmcjJK+BGPJLAUYSHGaJG7bsrBrqEI2vJ7EjiFZVveTV65jF9BM5iBAt
         PcquHgqNlmLkwPThzidA4T0uY2pc8rCUT/V130MM0lTOjJP+NmDCZl4oXeJ5hxYIUQBm
         M93ugaqdec4Uqx8ATGqZp+XiROau0fSlnJRlRBXx/Yk6D+mjBLcWkl0PCk16PEvUItzg
         /ySLvCly/8uW+yrqTz7FXFr9dmzFChoXczs+bOnY9jNVHKaEusamnHFeKoiq+D3jXB7O
         5fO0rYExiIgmQjJ9Z9dZHUuu2st2utjvPjWLt5l6yGNp5YxK30bBfxeN3wY7pgrI4RCZ
         bQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2VwIKQyMDgyOw6qxsT9Wez2YpQFq93Rh7po7dHpL9ds=;
        b=n9CDRqKCnDwPYi3DZftikkOoeJ8N354I0LhaVV3GMX1BrSlgZG1x41dZkXEW2yczwt
         RUR1V/fmXYedbS2ANAsQlO8/ccp57GPUoCoIgdNQ3bqhMTmizSwAvK1hnK/K6aiNQcYc
         Oi9ueOXLvqkL3SGnBdqCvmr34s8JKM9VaWXXUGyvjYvfY4CX1BPcVH4R5kjsJg5MYOcX
         VOm83/7IQNF3Ryf3FsX2sXZELJ/pz+UHQULBrPn6tka8AcaG9/yVYW4NYF/SB1W/7UgI
         DmmfH6e/1lSueTa9D5p4nLzrdiy4kiQI9p8NwM7XJ+ZWESG2ZmHeK0J7nTzkkO+uQvnj
         GGmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j13si7513159ede.324.2019.11.04.04.16.40;
        Mon, 04 Nov 2019 04:16:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDMQi (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 4 Nov 2019 07:16:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5260 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728926AbfKDMQh (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 4 Nov 2019 07:16:37 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B4798D099811236B78DF;
        Mon,  4 Nov 2019 20:16:35 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 20:16:27 +0800
From:   Xiang Zheng <zhengxiang9@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>
CC:     <zhengxiang9@huawei.com>, <wanghaibin.wang@huawei.com>
Subject: [PATCH v21 6/6] MAINTAINERS: Add APCI/APEI/GHES entries
Date:   Mon, 4 Nov 2019 20:14:58 +0800
Message-ID: <20191104121458.29208-7-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191104121458.29208-1-zhengxiang9@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wBiG4ML/krja

From: Dongjiu Geng <gengdongjiu@huawei.com>

I and Xiang are willing to review the APEI-related patches and
volunteer as the reviewers for the APEI/GHES part.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 325e67a04e..043f7a928e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1414,6 +1414,15 @@ F: tests/bios-tables-test.c
 F: tests/acpi-utils.[hc]
 F: tests/data/acpi/
 
+ACPI/APEI/GHES
+R: Dongjiu Geng <gengdongjiu@huawei.com>
+R: Xiang Zheng <zhengxiang9@huawei.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/acpi/acpi_ghes.c
+F: include/hw/acpi/acpi_ghes.h
+F: docs/specs/acpi_hest_ghes.rst
+
 ppc4xx
 M: David Gibson <david@gibson.dropbear.id.au>
 L: qemu-ppc@nongnu.org
-- 
2.19.1

