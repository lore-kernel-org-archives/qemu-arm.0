Received: by 10.223.159.82 with SMTP id f18csp507121wrg;
        Tue, 21 Nov 2017 02:32:03 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZcriX3dCSyMX0+ShVWwxLvAh8qJPpNbokwjFZjnbSNCFyrSUyZowzN2m/5w7QmxB6FC9BB
X-Received: by 10.99.106.137 with SMTP id f131mr16785934pgc.334.1511260323809;
        Tue, 21 Nov 2017 02:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260323; cv=none;
        d=google.com; s=arc-20160816;
        b=WJWOmL+gfXGo4WxnX6s7yWiNBYb5bDoQunMha6v1+hZCaIwN5by9U6E8H6fU53h0yT
         3nSPjxqkRIFE0GOOdQBCb+rM0CrtbFzLh6DBXqSa6tPeWdedb7KGsllxv43d4014iwdv
         zHLDfeT2Crd/1KF6JCc12EFWwvDLWYfOSZ2Gv2TJzyd5KfJc9m24aq9J38Hh5f4U68DM
         rpnkcZiPb2yoi14x+/u5q1e1jfDX6fEiM3etVva48UuLAUfcLF3mx2YeBWiGitHtZddA
         55BdOennwmq6zZ+0qiBfso21/UZNfsKshV5/p7knx8k4iP5FDjUaXFQ++HW/jrAYfZ6p
         2QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=1kn51pANK+LvdHP2u+8+/lq1ATrIepY2j+D5yasDamc=;
        b=xK3zHk+mvU/VGvgvP49sJ45MEJWgxazrOH9kNhBlXZACOahwyYL/qDI/p5s30h0Ov1
         1IUiwt0zJ6YOape6dN/FD0UZHcgqmgHxXWERrGWeabEPBYVV/0nAwivKZPMzDhDh+2BU
         ezRyjz/js0ogJ8apaUyldfTYwpmoalcRA3qB3milqlh8QjwThONCLXBm2wqUyyA4404d
         W+tOnNzqYp6C50AS9v5iriOSVnFrBdtfS6ZCpG+YvekinYc1V+jhrTlmHgUJPX3gG3P4
         G+PDnzUDsgXGfqPFu3Sszab4aQcIqdeilTNOnV+VGR4YKhY3DHRFlwYfRQBQyalG3P+I
         6VHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.03;
        Tue, 21 Nov 2017 02:32:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752023AbdKUKbz (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:31:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10964 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbdKUKbw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:52 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39780;
        Tue, 21 Nov 2017 18:31:41 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:32 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 03/12] docs: APEI GHES generation description
Date:   Wed, 22 Nov 2017 02:37:05 +0800
Message-ID: <1511289434-1551-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.5A14008E.0119,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 06cbcd1f3a8248c462940eb722398f91
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tkUI5IJobzQs

Add APEI/GHES description document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Igor's comments to add a doc
---
 docs/specs/acpi_hest_ghes.txt | 98 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.txt

diff --git a/docs/specs/acpi_hest_ghes.txt b/docs/specs/acpi_hest_ghes.txt
new file mode 100644
index 0000000..816d7b9
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.txt
@@ -0,0 +1,98 @@
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
+    address of Error Status Data Block0 back to fw_cfg file "etc/hardware_errors_addr".
+    Then Qemu will know the start address of Error Status Data Block0. For error source K
+    (0 <= K < 2), its address offset is K * 0x1000, because each of Error Status Data Block
+    has fixed size which is 0x1000. Using this way, QEMU will know the address of each
+    Error Status Data Block.
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
