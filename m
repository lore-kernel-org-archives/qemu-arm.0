Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2435260dyb;
        Mon, 23 Jun 2025 02:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyL7eZnZuk+6E4WCZWjpn/ejSAkW88RS+NW99IimTCpFoadVnIyac/V75CFujAXW7ij6UTm/bzuOLaVA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0Y6RMS2x0PsyCpHBdmsz5wNPZixTVPQDs79iHSBhAU60uTIQsjsY0z6S6XOqTT+4tYXi1
X-Received: by 2002:ac8:5c81:0:b0:47c:fefb:a5a with SMTP id d75a77b69052e-4a77c2f74b4mr184678961cf.11.1750671933688;
        Mon, 23 Jun 2025 02:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750671933; cv=none;
        d=google.com; s=arc-20240605;
        b=hxxU2YTMe+CsaCuQs4W6VhTHrKMV+48QS+fGa8SBqIOLvJy96esmfTPxa2AXFkbpEa
         VAtjZg5AtGwIAmBiIbGGM2udlp0ivpcx/0d0k+Xcw7SEW77gUfhF8UHl+tN0fpLI8rxT
         k63UOvsCDTYx6NiCpPmd3N1UeU/H4vEt1BAtHM4BeFuo3on5FamsSIScNhYyAQ0qQDUM
         jZU4lcJw7Df4MjSrKvGXial4Bbc9JtcQjrRKTG43V+f7mZtUihOcAOzyYp97c0fRoz7N
         Gi41p31otvqKboxPMyHF7jUuU0WrgXCB+61z/y+ekliuRFDYH04+XFkz4MpxxvzQJaWY
         6mUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=7YrLo5o7NWbrGs/h/3T7Ts8IHKBeknmcmujWFVZ/jys=;
        fh=y6a9dndW+0CJHcvYdghYwLzdcwMeXoOVhEZ+ThybITY=;
        b=PYKx64pjpJxWQ+vQ8lBrZ1t1Gsj8g30LQ4iCPXeILDMJ+WoDKJ/F+fiD8LPwDeou5q
         XLhDRLW40yfNxRD2vSGna4xBdlxJYFHk+owb8HKak52XZcXIDJb2LQqkFNf5FXuoi4ol
         y1HkQG+C64sKEY6RhxCl5H04JMJWKt7U8XlCL2idhVJeVTaqrcldunkrgAmGuxpxj//4
         G8avirFaOy7ZGVRBPbu+5rM21xHMxsiG+vnyaLxmJhN3chKjD/rz76fsTipmwi6EEEIO
         mXsnu9WzOSBCpl+G4urlx44b8io5uKquGMyfXqKfok7/de0bkXiS7MKXFe2fc9mT+m8U
         me3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0b60e3si81238391cf.369.2025.06.23.02.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 02:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uTdjj-0007YX-OQ; Mon, 23 Jun 2025 05:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdjP-0006zL-24; Mon, 23 Jun 2025 05:44:54 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdjN-0002jM-8v; Mon, 23 Jun 2025 05:44:50 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQjpC3gJ7z6M51k;
 Mon, 23 Jun 2025 17:44:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 05D03140277;
 Mon, 23 Jun 2025 17:44:46 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Jun 2025 11:44:36 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v5 09/11] bios-tables-test: Allow for smmuv3 test data.
Date: Mon, 23 Jun 2025 10:42:28 +0100
Message-ID: <20250623094230.76084-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1dQWlNmcYA2Z

The tests to be added exercises both legacy(iommu=smmuv3) and new
-device arm-smmuv3,.. cases.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev    | 0
 tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy | 0
 tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | 0
 tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | 0
 tests/qtest/bios-tables-test-allowed-diff.h     | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.smmuv3-dev
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy

diff --git a/tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev b/tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy b/tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/aarch64/virt/IORT.smmuv3-dev b/tests/data/acpi/aarch64/virt/IORT.smmuv3-dev
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy b/tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..2e3e3ccdce 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy",
+"tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev",
+"tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy",
+"tests/data/acpi/aarch64/virt/IORT.smmuv3-dev",
-- 
2.34.1

