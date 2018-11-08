Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3210369wrw;
        Thu, 8 Nov 2018 02:32:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5fBYg9dUOb5m682Hgv+vMZScqIzwFsATPNe+c8tvaofRilsvQoMqiJ0z3qzqApSWv+LdF2N
X-Received: by 2002:a17:902:7c87:: with SMTP id y7-v6mr4021064pll.232.1541673166713;
        Thu, 08 Nov 2018 02:32:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541673166; cv=none;
        d=google.com; s=arc-20160816;
        b=AMIFjpigCtR4M/kIWYy6SxOdocRcoEBKCqHdysHRhgLqCMICpwguoqbx59BWkqXxRV
         oB4d2bs69cckHpkWDrskK4CxCwsf7uZFxmBlM7I6fZGb0nhr4qBLZ5U1x+Yx/qlYC6qS
         TsH2wnXghvfpIPIrfWZsVRPpXIJawHiZULrv53nTqtPVFVbUhFJh9cQspPuB60rRPyRg
         zOOiKafK4pWrqhQrDSqUuf43leNcUHyW5C3yxgqhrvaLIaLYCtIIVpZxXnpy0/iWdTPn
         jo+BaiFR8lSDxd0B9hmzTSRzrN/R7vb4jTtyDxMpzey/na9YGWHNYdivvYySoxUo51vA
         9l/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=uDkjJTv9HsFC+ExgPkmpdin4Ys/B0jcGALyA7zyALa0=;
        b=OA5He59HUk2DAoN5JK25QS3Z16+4f2HGG3YD5rqgG9/rHVn0+J+N5YrpoCZK/feSsE
         sS8fpkaqGYydR6+gsX6YJ5tgi7mq4xMzzMrJkuMRuVkAP2EKaSmCyVLHYk4T8oxsuyLJ
         4KgqfXf+MsTxw2j4qaJu/1E61HkLubShdrXKsMMbeovfja/jWNa/iO+Dg/DRwSpREjIw
         YC4CYcv9XY/QlpRWiuBMMmrILIGpWrvqOvzfVl3OAnssBnnViNH9kuFA5E0wI9EgDG9a
         q6OgCfNf5aF6KGf6ll1fE2Ah5Y0F1+poDbkGFMOApH53pQtAZcSLXQbFTjCSA/q79b+J
         OFQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a4-v6si4090403pln.67.2018.11.08.02.32.46;
        Thu, 08 Nov 2018 02:32:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbeKHUHe (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 15:07:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:14199 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727064AbeKHUHd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 15:07:33 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 7516DD0562E21;
        Thu,  8 Nov 2018 18:32:40 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:32:32 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <pbonzini@redhat.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <zhengxiang9@huawei.com>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v15 06/10] docs: APEI GHES generation and CPER record description
Date:   Thu, 8 Nov 2018 02:29:45 -0800
Message-ID: <1541672989-15967-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LybEwnOUAKSq

Add APEI/GHES detailed design document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Igor's comments to add a doc
---
 docs/specs/acpi_hest_ghes.txt | 97 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.txt

diff --git a/docs/specs/acpi_hest_ghes.txt b/docs/specs/acpi_hest_ghes.txt
new file mode 100644
index 0000000..fbfc787
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.txt
@@ -0,0 +1,97 @@
+APEI tables generating and CPER record
+=============================
+
+Copyright (C) 2017 HuaWei Corporation.
+
+Design Details:
+-------------------
+
+       etc/acpi/tables                                 etc/hardware_errors
+    ====================                      ==========================================
++ +--------------------------+            +-----------------------+
+| | HEST                     |            |    address            |            +--------------+
+| +--------------------------+            |    registers          |            | Error Status |
+| | GHES1                    |            | +---------------------+            | Data Block 1 |
+| +--------------------------+ +--------->| |error_block_address1 |----------->| +------------+
+| | .................        | |          | +---------------------+            | |  CPER      |
+| | error_status_address-----+-+ +------->| |error_block_address2 |--------+   | |  CPER      |
+| | .................        |   |        | +---------------------+        |   | |  ....      |
+| | read_ack_register--------+-+ |        | |    ..............   |        |   | |  CPER      |
+| | read_ack_preserve        | | |        +-----------------------+        |   | +------------+
+| | read_ack_write           | | | +----->| |error_block_addressN |------+ |   | Error Status |
++ +--------------------------+ | | |      | +---------------------+      | |   | Data Block 2 |
+| | GHES2                    | +-+-+----->| |read_ack_register1   |      | +-->| +------------+
++ +--------------------------+   | |      | +---------------------+      |     | |  CPER      |
+| | .................        |   | | +--->| |read_ack_register2   |      |     | |  CPER      |
+| | error_status_address-----+---+ | |    | +---------------------+      |     | |  ....      |
+| | .................        |     | |    | |  .............      |      |     | |  CPER      |
+| | read_ack_register--------+-----+-+    | +---------------------+      |     +-+------------+
+| | read_ack_preserve        |     |   +->| |read_ack_registerN   |      |     | |..........  |
+| | read_ack_write           |     |   |  | +---------------------+      |     | +------------+
++ +--------------------------|     |   |                                 |     | Error Status |
+| | ...............          |     |   |                                 |     | Data Block N |
++ +--------------------------+     |   |                                 +---->| +------------+
+| | GHESN                    |     |   |                                       | |  CPER      |
++ +--------------------------+     |   |                                       | |  CPER      |
+| | .................        |     |   |                                       | |  ....      |
+| | error_status_address-----+-----+   |                                       | |  CPER      |
+| | .................        |         |                                       +-+------------+
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
+    also need to populate this blob. The "etc/hardwre_errors" fw_cfg blob
+    contains one address registers table and one Error Status Data Block
+    table, all of which are pre-allocated.
+
+(3) The address registers table contains N Error Block Address entries
+    and N Read Ack Address entries, the size for each entry is 8-byte.
+    The Error Status Data Block table contains N Error Status Data Block
+    entries, the size for each entry is 4096(0x1000) bytes. The total size
+    for "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
+
+(4) QEMU generates the ACPI linker/loader script for the firmware
+
+(4a) The HEST table is part of "etc/acpi/tables", the firmware already
+    allocates the memory for it, because QEMU already generates an ALLOCATE
+    linker/loader command for it
+
+(4b) QEMU creates another ALLOCATE command for the "etc/hardware_errors"
+    blob. The firmware allocates memory for this blob and downloads it.
+
+(5) QEMU generates N ADD_POINTER commands, which patch address in the
+    "error_status_address" fields of the HEST table with a pointer to the
+    corresponding "address registers" in the downloaded "etc/hardware_errors"
+    blob.
+
+(6) QEMU generates N ADD_POINTER commands, which patch address in the
+    "read_ack_register" fields of the HEST table with a pointer to the
+    corresponding "address registers" in the downloaded "etc/hardware_errors" blob.
+
+(7) QEMU generates N ADD_POINTER commands for the firmware, which patch
+    address in the " error_block_address" fields with a pointer to the
+    respective "Error Status Data Block" in the downloaded "etc/hardware_errors"
+    blob.
+
+(8) QEMU Defines a third and write-only fw_cfg blob which is called
+    "etc/hardware_errors_addr". Through that blob, the firmware can send back
+    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
+    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER commands
+    for the firmware, the firmware will write back the start address of
+    "etc/hardware_errors" blob to fw_cfg file "etc/hardware_errors_addr". Then
+    Qemu will know the Error Status Data Block for every error source. Each of
+    Error Status Data Block has fixed size which is 4096(0x1000).
+
+(9) When QEMU gets SIGBUS from the kernel, QEMU formats the CPER right into
+    guest memory, and then injects whatever interrupt (or assert whatever GPIO line)
+    as a notification which is necessary for notifying the guest.
+
+(10) This notification (in virtual hardware) will be handled by guest kernel,
+    guest APEI driver will read the CPER which is recorded by QEMU and do the
+    recovery.
-- 
1.8.3.1
