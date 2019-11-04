Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3904094wri;
        Mon, 4 Nov 2019 04:16:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYMKNHWecTnjnEdkz3K/bJIxHvNcHCS4MQVq8ubZ050zNm8d3eJ8gHgKI6XsmT/lXNLXYo
X-Received: by 2002:aa7:d7c6:: with SMTP id e6mr27520102eds.79.1572869795344;
        Mon, 04 Nov 2019 04:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572869795; cv=none;
        d=google.com; s=arc-20160816;
        b=QxAVcJWhMI4HEQAf1RimWZWUabl058ILKbu5WUahLybKEaOgHrT+8OgrSrF7J/qWoG
         utdZW9ZVQ0O2G67muL4tyM3aHi2CJ078KmIN7pxHJtEiijmYFJQE+Zwf1dwkC4vYJWh3
         xcErOQxyyIaTE1betoBte2t9CCfNNA8nikqIe1avRgkSZ4WjDPTFbFOSUTfGrlUZZwx4
         nLsxzf5mDQQWgMlS3kex6JS9zQRE1xa3ryAaqvlhwwa72dJLXtjoccw7cQPsxDVnkaei
         fXEMiAiE66T0TDAb7XiKDxHYg8adrvIWyIw+U7zyd2ukagAYXLWGQeIgCPjKRZLwDiyA
         WLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=fZWaCooYqULeG3P3ViAW0WT1PBqZAKMcEEEDexhqfsg=;
        b=vIcTZENy6MpRuZWBmrR82sKfaFDGHCeOZImnCvgWIFXqIaI1vUDfXb+dvtQbfdWNck
         TJrJoHxLdxrDOx3VAUtOqtpdo7ZItc1RvAyVrTP/6dJOUzZx2gu7k82eIJoICpFDiz0H
         Hlyzl89AmDw6uKaKdARsU4+JTe9PwV6NAcTiKF5pEDQ/tdCSab/LHwa3rPlHy4pIqy9d
         PKJgev3fZxbF/M2uAGlOGXoQVbqxdPaagLDFApTc9JkH8kJ1aYSoE1tgs+D1CP4tixJu
         cZFIcZX3AySKY3+1cdNNGloCs1EEXj5mnSdLX4sUW/xx80uM22OCfAL7u2u81AWXslQT
         MoaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j13si7513159ede.324.2019.11.04.04.16.35;
        Mon, 04 Nov 2019 04:16:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfKDMQe (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 4 Nov 2019 07:16:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:5702 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728481AbfKDMQe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 4 Nov 2019 07:16:34 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A0FF2817C3B0AA90D2E1;
        Mon,  4 Nov 2019 20:16:30 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 20:16:22 +0800
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
Subject: [PATCH v21 2/6] docs: APEI GHES generation and CPER record description
Date:   Mon, 4 Nov 2019 20:14:54 +0800
Message-ID: <20191104121458.29208-3-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191104121458.29208-1-zhengxiang9@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7m8feC+y/iU9

From: Dongjiu Geng <gengdongjiu@huawei.com>

Add APEI/GHES detailed design document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 docs/specs/acpi_hest_ghes.rst | 95 +++++++++++++++++++++++++++++++++++
 docs/specs/index.rst          |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.rst

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
new file mode 100644
index 0000000000..348825f9d3
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -0,0 +1,95 @@
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
+     kernel, guest APEI driver will read the CPER which is recorded by QEMU and
+     do the recovery.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 984ba44029..3019b9c976 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -13,3 +13,4 @@ Contents:
    ppc-xive
    ppc-spapr-xive
    acpi_hw_reduced_hotplug
+   acpi_hest_ghes
-- 
2.19.1

