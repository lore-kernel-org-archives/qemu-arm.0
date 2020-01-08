Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp614779lff;
        Wed, 8 Jan 2020 03:32:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqYoyNmqd5MwDcpmZ3LK9lVD01Ge0m/fQeSO1sUDAafqjrD1lNo4K9zYleDkiIXlNWYIHh
X-Received: by 2002:a9d:560f:: with SMTP id e15mr3717103oti.301.1578483165875;
        Wed, 08 Jan 2020 03:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578483165; cv=none;
        d=google.com; s=arc-20160816;
        b=TArdytZtEOj8ixb8gfp12AKakAGQloMRwxmXtKt0z/anjPmQtHprZ4LkFZYBzvXFTo
         7z4f6ov8zlHSuJs9H9VHx5bHXSPlfpuKPAp5TET/z5yBdxa495VbxGgOaC3eTLBjp7YN
         Es7KhqpdEenqytZFMTnRovHJUO6zejlOZf4lbNHAianFcGx9L/Fxupmp+hNmZdIO94ed
         wL6bKCp8S6wmQpscYAjfe3Nw2scHsou8/8+jXwXNfbO2ihBPdVCXKl2eLegWvqjuq21d
         KevvIcUd3c6pfc+/HiywaGo9iMR6xbr7/h10OUz1QLmc7PaXnDJ+J50WxfNgl6erWUVo
         uy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=fQ548H0z3ogr2LdbHmczcvvPvscJDfw8kl2ZZic8w9A=;
        b=DNj8Xq5soqQlZcZ9OMJPYvde2Kfu+7BNaM9kQZrdk55BKk3txlxEXIiGnDARKQ9G96
         1D6hA0IOW6MgRQpuappfAQA1NXOblkj/irm9NQa3SBll428nlLB3PT9AJNWv7/1nW+YI
         EeISH/Te9sCSs+ooqdVPhMJ57rM6sGIHZGwdAUmy9bfl+8R9/UujY4DRfiOVjwxYBIV8
         dHKJsmlQ2x6bTRMUx3L+sXXLcDhj+zeMHzqUaEHy3LgaeuO3vYjfNOinyc/1pdQaHSNU
         9yY67vyrT1hnqZaSAh8wZ9KstVJOSeI+ShQqG/M1uFUcBUDe5g1pvSt+VRzOX40TWWoI
         knug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a12si1673119oie.87.2020.01.08.03.32.45;
        Wed, 08 Jan 2020 03:32:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgAHLcp (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 8 Jan 2020 06:32:45 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9133 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727206AbgAHLco (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 8 Jan 2020 06:32:44 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id AAFB23071A6A1679EE8B;
        Wed,  8 Jan 2020 19:32:42 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 19:32:32 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <gengdongjiu@huawei.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
Date:   Wed, 8 Jan 2020 19:32:23 +0800
Message-ID: <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9z24Qq9cVAjj

I and Xiang are willing to review the APEI-related patches and
volunteer as the reviewers for the HEST/GHES part.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 387879a..5af70a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
 F: tests/acpi-utils.[hc]
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
