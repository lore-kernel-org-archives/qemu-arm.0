Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp767956lfb;
        Mon, 11 May 2020 20:03:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwJdrYkJ32Ph2siTQiQS81evk7J0BsqqPT8c3GK2zHJGdk9wrECX5aRJ8dKHiGhwekNmKB
X-Received: by 2002:a17:906:b28a:: with SMTP id q10mr16494800ejz.273.1589252604871;
        Mon, 11 May 2020 20:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589252604; cv=none;
        d=google.com; s=arc-20160816;
        b=BxUkaMSxT8+ddoNk/BrNMsrMudhgLjxMEiD0CTXn7UxH7CjM9+poyam+R+rQfqcmlj
         d8DXQz+hnnBBgn0H90pJiLIFmo3kjaJfh5NekVuYVBAHoWVYZMwB1YBvGAwSDzGmDRs1
         S/Cg7fPPavRdESG8OmcA1A5nQJUi9Mo2+I5fY0p+4yGCiWIZi2jsFVMoCyARG5fbXaeH
         0GA317zaFBbkyD8kh5azquZL8HLOqa6DhJVJ6hW2xlpDlVDZSgAJnu7y7xIMwcSsI3ef
         YE8sOaWUwnLz48pcKnISCZlEZbIaonuyMZQTbKho6/OYx/ygFknMUuF/qlzvU7woLV1q
         qu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=AhVku77mBnDgck4othfTcHeuj7Housw9VXBWwpmoTws=;
        b=B0gPXOlVuwdcmWpq+C100vof9liwfA5amJsSrVw3nqUXDG36TSZVejJ+NqU9yQNb9j
         n3IXLIyug6TNe9Z0NIS0trf2W1WMJ7CFjUXPMEpqMQTKW2XYoyWLwS0RRKPws3o3ULf5
         tUacGgAuPy8/cFlsXdJwQsXLBhmq4fxYJbXxMqcXPJ16Mfwfo0jeoMTlFLVRZx/YghHG
         NtsF8Xxhha94bB7idjL0lHm8INNGriIBY9t8O3mAn9VHM3vLwWHg0YRaW4Gj1g7/xeSj
         MP9JeqbSQPl/Jswxk56RjqnGWLuz2eNzCzdokbcfT8YxgAoGbiF07qoA/8YhHBLqsjy1
         msog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id l23si1677934edj.333.2020.05.11.20.03.24;
        Mon, 11 May 2020 20:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgELDDY (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 11 May 2020 23:03:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57434 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728701AbgELDDX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 May 2020 23:03:23 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id AADE227D394793B9A935;
        Tue, 12 May 2020 11:03:21 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 12 May 2020
 11:03:11 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>, <philmd@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v27 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Tue, 12 May 2020 11:06:09 +0800
Message-ID: <20200512030609.19593-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512030609.19593-1-gengdongjiu@huawei.com>
References: <20200512030609.19593-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Zf7zqC3pwHrj

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
