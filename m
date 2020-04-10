Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp567627lfm;
        Fri, 10 Apr 2020 04:45:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypLlB/677IahGb2uv6+IFX9NftXPVpMecb1Tbu/GX4QoidqAg5LHQZp2445TPjP9QoqoxpoM
X-Received: by 2002:a0c:8444:: with SMTP id l62mr4819687qva.239.1586519138295;
        Fri, 10 Apr 2020 04:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586519138; cv=none;
        d=google.com; s=arc-20160816;
        b=FEwYSEkTWbD28leZcne6l88C+2PCNNhwbezxz29lM1NHV4Xnd5kz0T5e4GUYNJ+4Yk
         9HZ/cCPjDmGKI2M1l1JiPeLQYyKJJcoM9bbJFH6u9iWcWdlu9f0bcyAtpuo6tNUoytW5
         WNcjWK+4/BYyM8DKaOT3vXFuukJ7amSDj3rp2tMt6u0RghCfedbHIEWXZsRo8O0d/Run
         rIlbDG1xjX25CQy16yXasEtXjtBO40n7ArQRGDMWnBSAiB39ckJ4ztFNAFI7k0hmyVcq
         wSePF4TzxskVcHUCIFjVD7RsWb1BgaxWwMVZGDaNg1oHakwwDmq4goh/P+IE899EfeZr
         8uPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=0fuqGCR7nV26EX8FaiM600muKop/NN+8uA5EbAtkqpc=;
        b=EqhOb6H/DEsMXagRoqquYdlZV9keLIbO9wT7jLxvvzmk0kTW1kxnkBkMlhQtUgU0M6
         FjrV7sHo6zMg5rCyapLwalYg4I+5OJjihfqSnV3DHo48JtF5qd/x9pBxuYir9HSl1zN3
         I0ROg1rs7EfC/bJtAOkyz+gKdaUiGsqCxrrNS4UqdoyntCExUtsgbVG4NygoJBuSmQU/
         7loVWIF96u/CdA/w0OsEPdZ3Y1FfuF20thO5T0UZjbD8oPfjpxcViDuH7KC6qtr58Q4K
         pugcp7xP0yB1XllU6Pf+Ddy2wZe+yTwzKndTYMHHZR5A5omCjKFzyHNycZ+vl3HGEcSg
         wt+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w7si879148qvf.49.2020.04.10.04.45.38;
        Fri, 10 Apr 2020 04:45:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgDJLpg (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 10 Apr 2020 07:45:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12711 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726678AbgDJLpf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Apr 2020 07:45:35 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6C68F348331F95AD90BC;
        Fri, 10 Apr 2020 19:45:32 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:45:24 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v25 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Fri, 10 Apr 2020 19:46:39 +0800
Message-ID: <20200410114639.32844-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200410114639.32844-1-gengdongjiu@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qOPVeb3A5ti0

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
index 7cb53ec..70726f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1511,6 +1511,15 @@ F: tests/qtest/bios-tables-test.c
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
