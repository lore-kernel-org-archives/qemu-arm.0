Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5809666wrm;
        Tue, 15 Oct 2019 07:03:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjYffKrAvIfhrGZmsc1mjwVriXkNS275eLezanI6+88N/m8hIa0sZj5nOzx8d6RIfBvKrB
X-Received: by 2002:a50:ec96:: with SMTP id e22mr33977370edr.109.1571148181639;
        Tue, 15 Oct 2019 07:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571148181; cv=none;
        d=google.com; s=arc-20160816;
        b=lM2iKiWtoTeTyVy4b/TSNzX5TPhecfnEXjtiZMBtMFCd6F3EDxBIkmWW4NhItVqqYa
         k4eSzj8deuNCZ9gCRGORK252Mkapx8zGnCLRcMsalQzx/N0D7ouawtJCDJvvfS4aD0vA
         HVnbqgwFbw8mXXpvxaxNbC0aD3WufOXvynBP6DidH2bmNxza/aFShEy434e5Oj/ZvIwJ
         Mpi8cSL2FiKgt1PxhbOAxax6GeSA4X53+EFB1YKOS3nxBoAv32iVZejON6S/yhQwCrlr
         AOT9N8kPfKjSIf5T5Xz0a5J8O7yWOCZydd5CRusohdCrrU1JCa6WziAk0UkLqA8smnsW
         ctWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=QaqbrGJVqUaOwFGgwlD2b11S+ABmmKbe8PURBf8qZVA=;
        b=IQ0AgTrJiWGm5F3G3hvaHdZQN2AT9PoToU52JbzOzpf98l8SwDZyxFhx7O+VuybkXl
         Velgg57XjWEcEFX4cKNeRDPyaIZrzlPwv7g5EBm7g6KD6HIACeyzWmCrz8lp+2kQ4vs/
         XJLyhLcSjjpfke0SIquxkMg8Mw47BTzqYlwcCe4zC5rs4stYNisMRMQNW0n/u/MeSoOi
         taULFvqNy7BDOUh6kyJiU8lDrwOOTINRtCDky6PE7rnVVPST9Wx3IKjE4ZyAlGoRkIPo
         pKt11MX5LtHXV/klWf9Z/WHDV3n4axK/+JEqm0x1ThYt5D4SvLSsdPjMq1CIl1RAhqtr
         QYhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b47si14176091edc.45.2019.10.15.07.03.01;
        Tue, 15 Oct 2019 07:03:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732424AbfJOODB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 15 Oct 2019 10:03:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3772 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732409AbfJOODA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 15 Oct 2019 10:03:00 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 287C5C64E6D96906CD65;
        Tue, 15 Oct 2019 22:02:57 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Tue, 15 Oct 2019 22:02:47 +0800
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
Subject: [PATCH v19 2/5] docs: APEI GHES generation and CPER record description
Date:   Tue, 15 Oct 2019 22:01:37 +0800
Message-ID: <20191015140140.34748-3-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191015140140.34748-1-zhengxiang9@huawei.com>
References: <20191015140140.34748-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bPJ1fLGRAY82

From: Dongjiu Geng <gengdongjiu@huawei.com>

Add APEI/GHES detailed design document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 docs/specs/acpi_hest_ghes.rst | 94 +++++++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst          |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.rst

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
new file mode 100644
index 0000000..905b6d1
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -0,0 +1,94 @@
+APEI tables generating and CPER record
+======================================
+
+Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
+
+This work is licensed under the terms of the GNU GPL, version 2 or later.
+See the COPYING file in the top-level directory.
+
+Design Details
+--------------
+
+::
+
+         etc/acpi/tables                                 etc/hardware_errors
+      ====================                      ==========================================
+  + +--------------------------+            +-----------------------+
+  | | HEST                     |            |    address            |            +--------------+
+  | +--------------------------+            |    registers          |            | Error Status |
+  | | GHES1                    |            | +---------------------+            | Data Block 1 |
+  | +--------------------------+ +--------->| |error_block_address1 |----------->| +------------+
+  | | .................        | |          | +---------------------+            | |  CPER      |
+  | | error_status_address-----+-+ +------->| |error_block_address2 |--------+   | |  CPER      |
+  | | .................        |   |        | +---------------------+        |   | |  ....      |
+  | | read_ack_register--------+-+ |        | |    ..............   |        |   | |  CPER      |
+  | | read_ack_preserve        | | |        +-----------------------+        |   | +------------+
+  | | read_ack_write           | | | +----->| |error_block_addressN |------+ |   | Error Status |
+  + +--------------------------+ | | |      | +---------------------+      | |   | Data Block 2 |
+  | | GHES2                    | +-+-+----->| |read_ack_register1   |      | +-->| +------------+
+  + +--------------------------+   | |      | +---------------------+      |     | |  CPER      |
+  | | .................        |   | | +--->| |read_ack_register2   |      |     | |  CPER      |
+  | | error_status_address-----+---+ | |    | +---------------------+      |     | |  ....      |
+  | | .................        |     | |    | |  .............      |      |     | |  CPER      |
+  | | read_ack_register--------+-----+-+    | +---------------------+      |     +-+------------+
+  | | read_ack_preserve        |     |   +->| |read_ack_registerN   |      |     | |..........  |
+  | | read_ack_write           |     |   |  | +---------------------+      |     | +------------+
+  + +--------------------------|     |   |                                 |     | Error Status |
+  | | ...............          |     |   |                                 |     | Data Block N |
+  + +--------------------------+     |   |                                 +---->| +------------+
+  | | GHESN                    |     |   |                                       | |  CPER      |
+  + +--------------------------+     |   |                                       | |  CPER      |
+  | | .................        |     |   |                                       | |  ....      |
+  | | error_status_address-----+-----+   |                                       | |  CPER      |
+  | | .................        |         |                                       +-+------------+
+  | | read_ack_register--------+---------+
+  | | read_ack_preserve        |
+  | | read_ack_write           |
+  + +--------------------------+
+
+(1) QEMU generates the ACPI HEST table. This table goes in the current
+    "etc/acpi/tables" fw_cfg blob. Each error source has different
+    notification types.
+
+(2) A new fw_cfg blob called "etc/hardware_errors" is introduced. QEMU
+    also needs to populate this blob. The "etc/hardware_errors" fw_cfg blob
+    contains an address registers table and an Error Status Data Block table.
+
+(3) The address registers table contains N Error Block Address entries
+    and N Read Ack Register entries. The size for each entry is 8-byte.
+    The Error Status Data Block table contains N Error Status Data Block
+    entries. The size for each entry is 4096(0x1000) bytes. The total size
+    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
+    N is the number of the kinds of hardware error sources.
+
+(4) QEMU generates the ACPI linker/loader script for the firmware. The
+    firmware pre-allocates memory for "etc/acpi/tables", "etc/hardware_errors"
+    and copies blob contents there.
+
+(5) QEMU generates N ADD_POINTER commands, which patch addresses in the
+    "error_status_address" fields of the HEST table with a pointer to the
+    corresponding "address registers" in the "etc/hardware_errors" blob.
+
+(6) QEMU generates N ADD_POINTER commands, which patch addresses in the
+    "read_ack_register" fields of the HEST table with a pointer to the
+    corresponding "address registers" in the "etc/hardware_errors" blob.
+
+(7) QEMU generates N ADD_POINTER commands for the firmware, which patch
+    addresses in the "error_block_address" fields with a pointer to the
+    respective "Error Status Data Block" in the "etc/hardware_errors" blob.
+
+(8) QEMU defines a third and write-only fw_cfg blob which is called
+    "etc/hardware_errors_addr". Through that blob, the firmware can send back
+    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
+    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
+    for the firmware. The firmware will write back the start address of
+    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
+
+(9) When QEMU gets a SIGBUS from the kernel, QEMU formats the CPER right into
+    guest memory, and then injects platform specific interrupt (in case of
+    arm/virt machine it's Synchronous External Abort) as a notification which
+    is necessary for notifying the guest.
+
+(10) This notification (in virtual hardware) will be handled by the guest
+    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
+    do the recovery.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 40adb97..8dbc48a 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -12,3 +12,4 @@ Contents:
 
    ppc-xive
    ppc-spapr-xive
+   acpi_hest_ghes
-- 
1.8.3.1

