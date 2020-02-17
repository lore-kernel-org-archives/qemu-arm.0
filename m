Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5055541lfp;
        Mon, 17 Feb 2020 05:10:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+YLgKt9Fz632qUEDKu2HxFHzgHcx007/j2yGHUFnI/ldQa9o0cDjqBH1UPugpEqnDFi8l
X-Received: by 2002:a05:6830:13d9:: with SMTP id e25mr11805752otq.134.1581945054246;
        Mon, 17 Feb 2020 05:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581945054; cv=none;
        d=google.com; s=arc-20160816;
        b=IV1ILfYQQyIfjp3KycdOAX+0qqEF3r/8an5coD3W/Rp5UfY8ID6QJ3AG1kDm/GR077
         NRTLcHT9Y9qu+y7MM2++Y+10l9wwOlwL2ZF7kaH8GiniFZXc7khlEwkUHwjIaNc8I55z
         GZcMr+gwgADQgP+85GDYRS4Xi38cO3OR8MLH41ObWWQO0sEUK8y4KM283/UUOBf9vrmo
         WrsOjHU2cSKsYMzT32v8PLKeyGy3Leywkc4lJqfFkwSEnMBN7+hu2YaTvpBIPi6dMZXM
         yOeskpICl4Wn2H08OWzC+j9XTU4xZunLA3KHl0iFJbUvVSAriHy2+XlOGG4JLl0igT0x
         dv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=qVTVkvm/x3TxIbJO1P0x50Rr6BGbIYDIjH5GKyKLQpo=;
        b=QZ1NHaQkPqV2Xpw+iDM8pjNdejFgHsEjtv4nxMalW/PXxx3n5q+oUEkpPBu6J3eXJ9
         FITwqC+jFrUhr/U8HAbfsO0AjZCqQ6nX3mp4uNEodn05U9zfgOjSSfcX1K8Oj0Zf7uaK
         xPYK8AWoxtlTrXpYGPrielCkaP6Jpi1WWO7qRb5vH+geFXdeOpk8HXinIcDeS1Sgstjs
         ys09GU8gOoRuTYh1ICG5mYfB4PjOOFckZCVKnT/+LP/+zxz5VLmqo0QnyJrK4mCXp9aL
         pp8fJyVireJxJmIAn+h3AFENc8ZZmpVGqivSGoWEMzt+HNQe3wk9+gTKMHwub0GA8puc
         YVWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b10si5923172oic.153.2020.02.17.05.10.54;
        Mon, 17 Feb 2020 05:10:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgBQNKt (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 17 Feb 2020 08:10:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10630 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728363AbgBQNKs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:10:48 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 37FE85983A0FAE344E49;
        Mon, 17 Feb 2020 21:10:46 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 21:10:36 +0800
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
Subject: [PATCH v24 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Mon, 17 Feb 2020 21:12:48 +0800
Message-ID: <20200217131248.28273-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217131248.28273-1-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: okEQqxn572np

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
