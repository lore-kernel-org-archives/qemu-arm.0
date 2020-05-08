Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2521553lfb;
        Thu, 7 May 2020 19:17:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJTu6Pd5wKFnFYKCQ9Hf/hlQKhW/7PIMhQdXOfgj/VqZKv6hp/pc9YN9XMqCAdCEHZJZuO3
X-Received: by 2002:a05:6402:1fb:: with SMTP id i27mr321362edy.37.1588904274447;
        Thu, 07 May 2020 19:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588904274; cv=none;
        d=google.com; s=arc-20160816;
        b=TINOdW0IjuFPjIeqv453Fwm8LdLpLfNIgOKXEXl590KZAMSnvtUDq0iQ6gQL2RNT7t
         PDK+fkurq2BO+7aQXGSCWMKZpxWMYnAxQ+HN4BXNJDVNbbOkUb4syyZ8tkzArzt4L2hU
         6DBUZB+d/rPzZfqIwEWvdrQc4upn9LaWYY5gy2c6/HN0UdzQaq2NCh6lTu+rddm0YGjC
         kjHc4yR76vG1OdsRMWU4qW7JnjJbyOQiOrRPvg5ZxJYoHja0ze88sc/esQ59quZ2uklo
         27fNRP7dEaC53xVAf7Qpzr3FEqS8c/t8lXcskE4A0g+15nIWm1T4tBlkTpX5QA/mMRi3
         F7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=AhVku77mBnDgck4othfTcHeuj7Housw9VXBWwpmoTws=;
        b=sU7d/SUs/NTraLjvragkQIjbOyc8JxxxzsXrDCi9Fkc34GfgyDNk/LOJIYLFW+99Ie
         xUNiGyCYlcsE1ECDFx/DB0pdKUaNBmYXkaB/vk8F8iuHx83FqVX4S9A6XKws8YTYuRbw
         YmvoFI+ynQnLjL07qp8he85R2M4fATIGd7ZacAFHSxNBYD3T141b0CwxbTLQgXQmrcZ5
         BPCn1enVt6xDJQgwnt0K8W5DjHgSiI81yyvVySxgb8FvjNErEJ7qAOc+efU+1IWzsEYL
         tNvZeuzSz3ccChzS3MWZ4R4nQC2GI/XUU5CYwswNzpdV87J1ywGUhsQw2cFJwCJZ6hEz
         QO4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g24si124136ejb.433.2020.05.07.19.17.54;
        Thu, 07 May 2020 19:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgEHCRx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 22:17:53 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4287 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727072AbgEHCRw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 22:17:52 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3D8C17B3118E35EB2C52;
        Fri,  8 May 2020 10:17:51 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 10:17:42 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH RESEND v26 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Fri, 8 May 2020 10:19:30 +0800
Message-ID: <20200508021930.37955-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508021930.37955-1-gengdongjiu@huawei.com>
References: <20200508021930.37955-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: go3sP7BDMq56

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
index 1f84e3a..9619b90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1516,6 +1516,15 @@ F: tests/qtest/bios-tables-test.c
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
