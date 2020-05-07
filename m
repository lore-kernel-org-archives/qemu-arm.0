Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1976483lfb;
        Thu, 7 May 2020 06:40:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypKMJGJnj63iGLhzNK+kAKYPOwT6BtSqIugQd2Z+KjUQiFw9umRDbh4xHuwb6CTSWa7ix0Fm
X-Received: by 2002:a50:baa6:: with SMTP id x35mr12398839ede.54.1588858828255;
        Thu, 07 May 2020 06:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588858828; cv=none;
        d=google.com; s=arc-20160816;
        b=JPHlAjNy7wBeFO+hdPr2U7QwasKQu8IgzTkUJUInLbRpliZFkaoYygiOLAT9I2jgT+
         kLyYU7xL9e8yWzBN3avwFFaO5ZYRV0NfW1JInt1lWha0tWEb5aywkNDWVegGgdJ5hiR6
         JQqpoq9JjyrGvVe5Ldcij1eAocJnA16GIOYMfS9Lor4YozLsIky9cJgq4Du8LdQd2lhr
         tKY00hI2HCoCY5f98DTCpaoBfFwAzsdVVnt/ymVtorm0nhR3AcGUC784vhTdcn9Yuya3
         N/UqqX5+BlTT7OKhJfW63mzy9vSChJfvBwB+R6AyWKN/0+4yBKiS+tMQRA+KkXO+++vo
         JWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=AhVku77mBnDgck4othfTcHeuj7Housw9VXBWwpmoTws=;
        b=g8+cESgZiF6atFKhe3DxkLIJB/6zsBCR8aAc08qm5d0CTNDak4lUZH8P9/jJ28LZyN
         1gTK5o1cRU+c1JV1AyyRVTAyPOyYiOUspnHusjXH6E1pmXyGSJiYKO6FuwtXJEDfSxsq
         ixlsSR3+f8u1hE0SobBXGbFA5ZWj1p1MYDtXPLHbOfYPj8FwkmpiF9ogFhZbw6L2MQ42
         9oH3IJpGdNAH7KhHKem97AS7BTwPEurOuc0/jNBil5LP11HJpVUeQJQFYs19/lLkW8ib
         yU0JjMs/6AGtGdumn/0nq5vVsqTtjPIqXl0iIWzufmOsQ1ZTYcXUyisFY0XEYmz4GnSI
         sg4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ly26si3110289ejb.190.2020.05.07.06.40.28;
        Thu, 07 May 2020 06:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgEGNk0 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 09:40:26 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:39048 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726565AbgEGNkZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 09:40:25 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CFDA4BC5B75FA7C11E28;
        Thu,  7 May 2020 21:40:22 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 21:40:16 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v26 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Thu, 7 May 2020 21:42:05 +0800
Message-ID: <20200507134205.7559-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507134205.7559-1-gengdongjiu@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: K9AIbkqyahDG

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
