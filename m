Received: by 10.223.159.82 with SMTP id f18csp1393062wrg;
        Mon, 27 Nov 2017 02:44:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYoj6WX9JjXnjibMtw/hcR3HSm5HnrMBHmNoYvNFpAAHWpz2eUR6ismM1r3vOB1P7fBvzhI
X-Received: by 10.101.101.211 with SMTP id y19mr27857720pgv.191.1511779472906;
        Mon, 27 Nov 2017 02:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779472; cv=none;
        d=google.com; s=arc-20160816;
        b=Dcn6JfriCkVElxcxLpvv8RlKUjNny9nbRVI23P3wxrFubrID9mToI/g5SLOSkm1yO+
         YflUg1uaKl8fwavut6lVQ7SPFcnceWoUbsuen41Yzo1qk8QTzk73lrlv2MN4WVsQLJh3
         SqyuibTyzShhKo2JAy69BiFQ3jMpwW5XnaAk1GJLPKZxHULVFxgwMSFuh4HBURfC43BX
         nKvewaH4p7Sw0pRsgy2Lrzm8noSH7Yd+nfx9YDbyvMWmf7+93qnu+bYc1HSameRs4QzH
         GpsjEnnR2jSmKew1WBifXny+DuJNvPa3ishCvLBrcKx98rUpacviYrrF+u3TPw/QPj0Z
         0xVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=mmkP6TCUgg4rGx16PNVWnjwff415ixYCfRWX+i2CZVs=;
        b=uS4WgqdrgNtnLh6UsebvARIVU2AQ61TRZDCNJq3I9Qpg+jlOPs6eezUQh+xAZYWki7
         zoCgsfUesz/2rgYungSjWHQNfxebnJzHGXYPHvZ/SOl5WV/DU0Aw2/QtxddizbdtJy2P
         f1LkKMmcN8NhsPlof33AmbzBKGb8QwqXrxyHkhHME4iMPG0vkOG7Vg7rBtX5QEO1xQYR
         ROTAsH0NYTiIwKk4by+5zX4IFezC4XGAA+T17jQRKKCcUmdfWHBvihX3riOP9fuskfpG
         MPVpW9zGjv9uMl7XF7yZe8E0LjjJGVgNeFreKih4EsgUSJ/yoH9COygsYdOBlHtsNK3B
         5djw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t11si23462099plq.683.2017.11.27.02.44.32;
        Mon, 27 Nov 2017 02:44:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751630AbdK0Kob (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 27 Nov 2017 05:44:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2175 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751423AbdK0Ko3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Nov 2017 05:44:29 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 661929F606B19;
        Mon, 27 Nov 2017 18:44:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.361.1; Mon, 27 Nov 2017 18:44:17 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v13 03/12] docs: APEI GHES generation description
Date:   Tue, 28 Nov 2017 02:49:46 +0800
Message-ID: <1511808595-24158-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: iMJ72++w5fkl

Add APEI/GHES description document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Igor's comments to add a doc
---
 docs/specs/acpi_hest_ghes.txt | 96 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.txt

diff --git a/docs/specs/acpi_hest_ghes.txt b/docs/specs/acpi_hest_ghes.txt
new file mode 100644
index 0000000..df28757
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.txt
@@ -0,0 +1,96 @@
+Generating APEI tables and record CPER
+=============================
+
+Copyright (C) 2017 HuaWei Corporation.
+
+Design Details:
+-------------------
+
+       etc/acpi/tables                               etc/hardware_errors
+    ====================                    ==========================================
++ +--------------------------+            +------------------+
+| | HEST                     |            |    address       |              +--------------+
+| +--------------------------+            |    registers     |              | Error Status |
+| | GHES1                    |            | +----------------+              | Data Block 1 |
+| +--------------------------+ +--------->| |status_address1 |------------->| +------------+
+| | .................        | |          | +----------------+              | |  CPER      |
+| | error_status_address-----+-+ +------->| |status_address2 |----------+   | |  CPER      |
+| | .................        |   |        | +----------------+          |   | |  ....      |
+| | read_ack_register--------+-+ |        |  .............   |          |   | |  CPER      |
+| | read_ack_preserve        | | |        +------------------+          |   | +------------+
+| | read_ack_write           | | | +----->| |status_addressN |--------+ |   | Error Status |
++ +--------------------------+ | | |      | +----------------+        | |   | Data Block 2 |
+| | GHES2                    | +-+-+----->| | ack_value1     |        | +-->| +------------+
++ +--------------------------+   | |      | +----------------+        |     | |  CPER      |
+| | .................        |   | | +--->| | ack_value2     |        |     | |  CPER      |
+| | error_status_address-----+---+ | |    | +----------------+        |     | |  ....      |
+| | .................        |     | |    | |  ............. |        |     | |  CPER      |
+| | read_ack_register--------+-----+-+    | +----------------+        |     +-+------------+
+| | read_ack_preserve        |     |   +->| | ack_valueN     |        |     | |..........  |
+| | read_ack_write           |     |   |  | +----------------+        |     | +------------+
++ +--------------------------|     |   |                              |     | Error Status |
+| | ...............          |     |   |                              |     | Data Block N |
++ +--------------------------+     |   |                              +---->| +------------+
+| | GHESN                    |     |   |                                    | |  CPER      |
++ +--------------------------+     |   |                                    | |  CPER      |
+| | .................        |     |   |                                    | |  ....      |
+| | error_status_address-----+-----+   |                                    | |  CPER      |
+| | .................        |         |                                    +-+------------+
+| | read_ack_register--------+---------+
+| | read_ack_preserve        |
+| | read_ack_write           |
++ +--------------------------+
+
+(1) QEMU generates the ACPI HEST table. This table goes in the current
+    "etc/acpi/tables" fw_cfg blob. Each error source has different
+    notification type.
+
+(2) A new fw_cfg blob called "etc/hardware_errors" is introduced. QEMU
+    also need to populate this blob. The "etc/hardwre_errors" fw_cfg blob contains
+    one address registers table and one Error Status Data Block table, all
+    of which are pre-allocated.
+
+(3) The address registers table contains N Error Status Address entries
+    and N Read Ack Address entries, the size for each entry is 8-byte. The
+    Error Status Data Block table contains N Error Status Data Block entry,
+    the size for each entry is 0x1000(4096) bytes. The total size for
+    "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes
+
+(4) QEMU generates the ACPI linker/loader script for the firmware
+
+(4a) The HEST table is part of "etc/acpi/tables", which the firmware
+    already allocates memory for it and downloads, because QEMU already
+    generates an ALLOCATE linker/loader command for it.
+
+(4b) QEMU creates another ALLOCATE command for the "etc/hardware_errors"
+    blob. The firmware allocates memory for this blob,
+    and downloads it.
+
+(5) QEMU generates, N ADD_POINTER commands, which patch address in the
+    "Error Status Address" fields of the HEST table with a pointer to the
+    corresponding address registers in the downloaded "etc/hardware_errors" blob.
+
+(6) QEMU generates N ADD_POINTER commands for the firmware, pointing the
+    address registers (located in guest memory, in the downloaded
+    "etc/hardware_errors" blob) to the respective Error Status Data Blocks.
+
+(7) QEMU Defines a third, write-only fw_cfg blob, called "etc/hardware_errors_addr".
+    Through that blob, the firmware can send back the guest-side allocation addresses
+    to QEMU. The "etc/hardware_errors_addr" blob contains a 8-byte entry. QEMU generates
+    a single WRITE_POINTER commands for the firmware, the firmware will write the start
+    address of status address register back to fw_cfg file "etc/hardware_errors_addr".
+    Then Qemu will know the Error Status Data Block for every error source. Each of Error
+    Status Data Block has fixed size which is 0x1000.
+
+(8) When QEMU gets SIGBUS from the kernel, QEMU format the CPER right into guest
+    memory, and then inject whatever interrupt (or assert whatever GPIO line) which is
+    necessary for notifying the guest.
+
+(9) This notification (in virtual hardware) can either be handled by the
+    guest kernel stand-alone, or else the guest kernel can invoke an ACPI
+    event handler method with it. The ACPI event handler method could
+    invoke the specific guest kernel driver for error handling via a
+    Notify() operation.
+
+For the above design, it would leave the firmware alone after OS boot and firmware no need
+to care about HEST, GHES, CPER.
-- 
1.8.3.1
