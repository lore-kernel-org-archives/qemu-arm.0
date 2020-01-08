Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp614630lff;
        Wed, 8 Jan 2020 03:32:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzqcS22eS9XB+IRTVljj7VbiuQOwUkCqOEzSwTlSWq+LFJGxMzxY7NZUjshmOBu9ajZ2Vgw
X-Received: by 2002:a9d:6a5a:: with SMTP id h26mr3935075otn.103.1578483156985;
        Wed, 08 Jan 2020 03:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578483156; cv=none;
        d=google.com; s=arc-20160816;
        b=YIaZPCYyosfWH/mg0TeN/j1c2UaVl0PybgOIOM8U1p8vXEazZe/KO7EyG898wgklaJ
         RgDegLOp7RIL9Q9syhq8kXsqc/ZUC3HjFos40hlwHo7YtHhtVOHIh/eMeZRHxMhGV74d
         +Mx14wTqdCSyH2u44NpuSntJYUMqOwHtOTevX4E1rBMmfh4B2OSfdwoLfc/+WvaOc49t
         yBFD91PZclLV2dGiwd08SaTcOv3DHQjtppgkkQiYxF2QAQrBwC9uH2E8yW/W0mrT6ipq
         PYi7rm7g1WdHe3LScoVEXVR2JxcUsvIc7E19W0hUOOu1b3Qcao4ne5X2AcytzL46Ty3w
         OB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=S+d6qPk3DuY1yrOr7+9ItFngMHdgqK9nGRjcZ29pMCg=;
        b=nNe90lrTFgIExsB6jnJi1pc9a6mcyF9rh1dU13C9ZTf4frqs9PVb9KyC6gUq02AU8r
         NhbscgI+rJ6BI0vBIBjig+6C0QTlryyHkBXMqYMHd/h4iBG6t3BQEWtZ3vnRoVL8Z0g8
         TCUx32t+1zKqoBkKU+YWh0Kaz7tsxeQgGaLuvHvg5Kcwa/uAkhr4XMlXj2ngb1D93wct
         tYedQozAt7tS99Vu6F4S0dUIUE5aS+NVZCuGPZepZJQqUDJFwMO/odtE/z+kgEB2ywRs
         FaYg6U4t2Q8Gdt+F7wJXjO5vR1X5rRsDcBZQa9FqtZOnb8cgYZdNlGtpdPIeMHrdy/L/
         ecaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a12si1673119oie.87.2020.01.08.03.32.36;
        Wed, 08 Jan 2020 03:32:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgAHLcf (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 8 Jan 2020 06:32:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9126 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726186AbgAHLce (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 8 Jan 2020 06:32:34 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8016C5DFD393B87F7E52;
        Wed,  8 Jan 2020 19:32:32 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 19:32:26 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <gengdongjiu@huawei.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v22 2/9] docs: APEI GHES generation and CPER record description
Date:   Wed, 8 Jan 2020 19:32:16 +0800
Message-ID: <1578483143-14905-3-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: O9LQJ9lTOyrK

Add APEI/GHES detailed design document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 110 ++++++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst          |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.rst

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
new file mode 100644
index 0000000..7a1aa90
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -0,0 +1,110 @@
+APEI tables generating and CPER record
+======================================
+
+..
+   Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
+
+   This work is licensed under the terms of the GNU GPL, version 2 or later.
+   See the COPYING file in the top-level directory.
+
+Design Details
+--------------
+
+::
+
+         etc/acpi/tables                           etc/hardware_errors
+      ====================                   ===============================
+  + +--------------------------+            +----------------------------+
+  | | HEST                     | +--------->|    error_block_address1    |------+
+  | +--------------------------+ |          +----------------------------+      |
+  | | GHES1                    | | +------->|    error_block_address2    |------+-+
+  | +--------------------------+ | |        +----------------------------+      | |
+  | | .................        | | |        |      ..............        |      | |
+  | | error_status_address-----+-+ |        -----------------------------+      | |
+  | | .................        |   |   +--->|    error_block_addressN    |------+-+---+
+  | | read_ack_register--------+-+ |   |    +----------------------------+      | |   |
+  | | read_ack_preserve        | +-+---+--->|     read_ack_register1     |      | |   |
+  | | read_ack_write           |   |   |    +----------------------------+      | |   |
+  + +--------------------------+   | +-+--->|     read_ack_register2     |      | |   |
+  | | GHES2                    |   | | |    +----------------------------+      | |   |
+  + +--------------------------+   | | |    |       .............        |      | |   |
+  | | .................        |   | | |    +----------------------------+      | |   |
+  | | error_status_address-----+---+ | | +->|     read_ack_registerN     |      | |   |
+  | | .................        |     | | |  +----------------------------+      | |   |
+  | | read_ack_register--------+-----+ | |  |Generic Error Status Block 1|<-----+ |   |
+  | | read_ack_preserve        |       | |  |-+------------------------+-+        |   |
+  | | read_ack_write           |       | |  | |          CPER          | |        |   |
+  + +--------------------------|       | |  | |          CPER          | |        |   |
+  | | ...............          |       | |  | |          ....          | |        |   |
+  + +--------------------------+       | |  | |          CPER          | |        |   |
+  | | GHESN                    |       | |  |-+------------------------+-|        |   |
+  + +--------------------------+       | |  |Generic Error Status Block 2|<-------+   |
+  | | .................        |       | |  |-+------------------------+-+            |
+  | | error_status_address-----+-------+ |  | |           CPER         | |            |
+  | | .................        |         |  | |           CPER         | |            |
+  | | read_ack_register--------+---------+  | |           ....         | |            |
+  | | read_ack_preserve        |            | |           CPER         | |            |
+  | | read_ack_write           |            +-+------------------------+-+            |
+  + +--------------------------+            |         ..........         |            |
+                                            |----------------------------+            |
+                                            |Generic Error Status Block N |<----------+
+                                            |-+-------------------------+-+
+                                            | |          CPER           | |
+                                            | |          CPER           | |
+                                            | |          ....           | |
+                                            | |          CPER           | |
+                                            +-+-------------------------+-+
+
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
+    corresponding "read_ack_register" within the "etc/hardware_errors" blob.
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
+(9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
+    "Error Status Data Block", guest memory, and then injects platform specific
+    interrupt (in case of arm/virt machine it's Synchronous External Abort) as a
+    notification which is necessary for notifying the guest.
+
+(10) This notification (in virtual hardware) will be handled by the guest
+     kernel, on receiving notification, guest APEI driver could read the CPER error
+     and take appropriate action.
+
+(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
+     find out "Error Status Data Block" entry corresponding to error source. So supported
+     source_id values should be assigned here and not be changed afterwards to make sure
+     that guest will write error into expected "Error Status Data Block" even if guest was
+     migrated to a newer QEMU.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 984ba44..3019b9c 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -13,3 +13,4 @@ Contents:
    ppc-xive
    ppc-spapr-xive
    acpi_hw_reduced_hotplug
+   acpi_hest_ghes
-- 
1.8.3.1
