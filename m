Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4524015lfp;
        Sun, 16 Feb 2020 17:25:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9uEpamRo1tts0Mhxi90RClFZdct4uUvA9e9oZHMfOdqq+0I7bD93dtiBrq7vtbtztWmuP
X-Received: by 2002:a9d:2c2:: with SMTP id 60mr10486616otl.208.1581902735867;
        Sun, 16 Feb 2020 17:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581902735; cv=none;
        d=google.com; s=arc-20160816;
        b=trICrTYwYDWpfmwrOUJ5kXmwCFdRO1HO0SehncjR1Fl2WpfqyPS9tIi8jVSjSfODz7
         efE+XA2xkFcPC1FcDCJhe8BWHum9jnRrp2cCZHsdeYAVmzu3JgGvUDxoiUkK3B8viR+3
         pyQ6U/QdsAwTaJ6qcXAEpaQiTTTPBsIBR6Fbzp8GXiW6o+QDlf2lYOHPs/h8iIer/uS0
         FYiOdFmsM+IftIwD8GnsEQe4hf3fN6gnVZg9ZIss5zTPT8GkA52tp2JJ0ysvOU1r4rCS
         HSg3tXUzsbecaF91bJ/NmVJ6hzv7klgLj8CBhIuZUpCaYHZENSch6CMqkHtaUMzC6CRU
         zSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=qVTVkvm/x3TxIbJO1P0x50Rr6BGbIYDIjH5GKyKLQpo=;
        b=nW8bRieIY/TdVjy8U2piDf4fX6W70JnmUqUWoJQ3x8ueyv13PW6dVnK/aZXZkDFyko
         uXCmxCmK8Q4480k0V3nMM+C+jO69qwR8w9BhGIl2MlhPmZP3W3kv0hlZk5RR1SQ7wzqL
         nUicuNhL8PwaWtM3xdBkKYkO/ii+NG4FM3eYDEpieuQyeNDp8whXUuc9cHLyWjffE0P2
         KrWX8XuL3fjtE2QX8c325rye9yNoSKYxL9HPliC3j1tAWPSBAp+mI7mspAf/20lajmAp
         xDhjq1sTSW5VA+u8oDYpkxPIE1iqIy3snijzNjZhnXW+WqdvCKj2hbm6BNIQ6yABCwow
         AuUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z14si5843662oth.15.2020.02.16.17.25.35;
        Sun, 16 Feb 2020 17:25:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgBQBZe (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 20:25:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37904 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726786AbgBQBZe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 20:25:34 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0C6711041FEC9D0C88D0;
        Mon, 17 Feb 2020 09:25:33 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 09:25:24 +0800
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
Subject: [PATCH RESEND v23 10/10] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Mon, 17 Feb 2020 09:27:37 +0800
Message-ID: <20200217012737.30231-11-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217012737.30231-1-gengdongjiu@huawei.com>
References: <20200217012737.30231-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qSp/VWGqgQJb

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
