Received: by 10.223.134.117 with SMTP id 50csp5137253wrw;
        Wed, 27 Dec 2017 21:28:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBos0tIg/WNlj9PeKQDFtEIwAhEGVNu14C63xfjhNQPnGLU8gfp8k6wv8d+Qo7OJpL/8yXbdf
X-Received: by 10.84.198.67 with SMTP id o61mr29833234pld.261.1514438893844;
        Wed, 27 Dec 2017 21:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438893; cv=none;
        d=google.com; s=arc-20160816;
        b=P01zBA5tMEeKQhIxC0NGkIMIpn1SEQVjhR2Uc1iBzuiCvCH517/Z4TDMB867fpZ4mm
         qvNHn7btZHfjUj5B/Cozp0aWtHsLXgytxZwzT5IJaVORGlr0MfzUXRC7p5BU9pnaChrs
         WTFt7G/YV55gFpAWvyXKWgZN2DSvIhsoZisaLBIf6oYkfcyiumol4YtyR/rgF/MUSowV
         Ldc9i3+nX0H/dCpu/mvMBgC3r7a6xgGCu49qYhekAF1E9miNQdBZ42u2j29FEf3MaLeT
         6tMe6qP75ifbE9RDYkOX8aqXrSlBqve85VldKg1HOpUJWyZjqWPw61DB8cMYFLUMMsyw
         r9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=uDkjJTv9HsFC+ExgPkmpdin4Ys/B0jcGALyA7zyALa0=;
        b=J7nsWuNDzlDuqvQWuJyMADN+PvagNsoezQLjl8MDD+d3n62PQRzQOLHdVNYRTXMpj4
         9iQkqcAIsOLMrTx3DkUvBN59EPkJziSOY6RLINSOh8Y92jp7zl1vTB6JZ0aEGF+w5p49
         NYxoX+g5fFDiZ7wHXdLRxOk7qo65897PMjiQEPtdlRYspfpJIAsYt+ef0+VgavyiLt7M
         DPMJxoMaAcGcIJ+uSsQLGDnx2JM7i7WOXZ1QrXngTfxDr+FfUt8p6zdx3PDuJI/xCFPi
         fVaBDr7EGBfC78j/45faOBrCxdr1vIZmgnv7tfkfPcrUm5gHAOBKTsjtVpYpR5ozyiLL
         Oy8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.13;
        Wed, 27 Dec 2017 21:28:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751391AbdL1F2J (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:28:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3184 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751359AbdL1F1w (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:52 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3E2B083F97D76;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:30 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 3/9] docs: APEI GHES generation and CPER record description
Date:   Thu, 28 Dec 2017 13:54:12 +0800
Message-ID: <1514440458-10515-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: D0WquIoH0R4C

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
