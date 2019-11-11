Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp726248wrr;
        Sun, 10 Nov 2019 17:44:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdafBKheJQZqnLQFmnDClSsVmQkRsta9dYC92uAh3etnWOQNU1VEOVvIlxD4GtGXH5HmYQ
X-Received: by 2002:aa7:cad0:: with SMTP id l16mr23791963edt.82.1573436673915;
        Sun, 10 Nov 2019 17:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573436673; cv=none;
        d=google.com; s=arc-20160816;
        b=KjuN+zW80BVCJoAGEolSVqi0OnLVklfe8UJI7BCadD/s4mSz5IPckX5JPRoApxuby6
         HK/8/xsfchCpXVqi6qnuC8htZ4lONC62xuislwcI6RwEUjiBap0PcuibY6t5zv6TLw7K
         B2PQxOHGcRVITIFZyQoDvPyzFqBu7HhLmaQEu2KsMgiE+IhuiQ+xxACEqJhml/Okb9w0
         8KC+i/i3H61zKENfdprjUECHuXPiEaDtNd5zCeNzVDIagz1R+lgOPxzdagSJOhmcplrp
         LjIQxcx22o6mslA4D7OsEccJexdJN92fvwqeSQr6aKMG9LDKRD7uNj0hRiG3EESr1irO
         8NEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2VwIKQyMDgyOw6qxsT9Wez2YpQFq93Rh7po7dHpL9ds=;
        b=DvfCF5rVNZJlRkQ5UIFGcLyb8EVLNgvpw3LJe/HjdShogkZKF8brMgBcPmUtYGZf6X
         3KOPKviTve3A9UiexlE2aaeQ2YP6xhl1CJsnAPudjVLI1xpaIU85OHm7RUpQMu8sqV9J
         8tkBApPA0wAKcNrZpvLfNhbAVK7umIFoZtosPxdaK8KdPPtHyIM5CUDqzGHFgsBXTTu9
         9vLTvNWOR4YPmFtzakeia+uBuIjU8G2MbYlpDJU8eWy0ebgYhA+avnx1+dWeXPWmj3dZ
         yx8hgBRUlx9YNuChH3GfJvCKzXapWLyUTSIeFvg+017p5ALiUzbmKZjtIpQ6wlOmCBag
         lemA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id uz25si8556637ejb.43.2019.11.10.17.44.33;
        Sun, 10 Nov 2019 17:44:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfKKBo2 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 10 Nov 2019 20:44:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6177 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726789AbfKKBo1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 10 Nov 2019 20:44:27 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0D7E8820CD7FDC4E85F3;
        Mon, 11 Nov 2019 09:44:26 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 11 Nov 2019 09:44:20 +0800
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
Subject: [RESEND PATCH v21 6/6] MAINTAINERS: Add APCI/APEI/GHES entries
Date:   Mon, 11 Nov 2019 09:40:48 +0800
Message-ID: <20191111014048.21296-7-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191111014048.21296-1-zhengxiang9@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: NqxcR9FW5cz/

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

