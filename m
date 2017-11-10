Received: by 10.223.150.237 with SMTP id u100csp3629231wrb;
        Fri, 10 Nov 2017 03:14:46 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RsbL/9LO4L/59K4hVx0ALYxcWsReEQxW0rly5zFt0MRzbY2hwaiG1diddsskvErxS8jxzP
X-Received: by 10.159.197.70 with SMTP id d6mr3786443plo.8.1510312485989;
        Fri, 10 Nov 2017 03:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312485; cv=none;
        d=google.com; s=arc-20160816;
        b=nsQjhnrYILRLdAeD22j7AVAVPNevknX652wZXeUbfs5ysOSEl1Ymlhwc3ROAMWwWGX
         GvR73xXHqafYahv7knOpE5oP1+sJzqXkUv2Wl/M3BQAkIsyqNjNWYDGHucq33qJsaJXw
         RhH3kUj8xpzZRoDPZAUBP3SiR7D/7VRe0opik+bNY4Q4juxS+rmOJ0fr/FxrRPI9D6rW
         LE28GgCRiEjAzGVz8GTa4tPt89P/dM6JNnXkNm2mLXUOcls23oLmTYcHWxb7buMFfCc6
         abx12KhATiLQ8aQ0ISBzRIKV183XL4QNd9irV3M1fj8Zw4QANyg1QRXvsrI/+qtp13Yj
         rjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=RRJmKWOh+s2S9f+qB4aJZRMDHt8GIJl3s9Th7R0c5PQ=;
        b=pJYMEL+ZcnJ+8VWHcnFbd3ZgZYCKQxzlidC9VFVC0owbsA+SjHuP8zkm/TtmXZGYT7
         dmgp5r8NHDYqTZHUZjotOEgunZUv+kAtlsLFvMptOc5NLR49nugyqS6w5JCCY2EXJdsh
         ZusravqgoD4eGFlzPzxXutpJA6ofymYC1xC3LkPRdn3pjhH49mHsVt6hY2l+SSHCfNiq
         REk7VRk9fExan+iXcdy1LmUsstzJxi3rm9BRJoZLEqmHgiZtPwPOMACu6tuVaYaCjNXF
         VYRTosfszzZNQACJsHFcBgJ+xmBimEbJUDSmyD79QQfxpR84l1TD7sZc7JFMz22nQExF
         lUQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.45;
        Fri, 10 Nov 2017 03:14:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753014AbdKJLOo (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10440 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752724AbdKJLOk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:40 -0500
Received: from 172.30.72.58 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKO46199;
        Fri, 10 Nov 2017 19:14:11 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:01 +0800
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
Subject: [PATCH v12 03/12] docs: APEI GHES generation description
Date:   Sat, 11 Nov 2017 03:19:42 +0800
Message-ID: <1510341591-22817-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090205.5A058A05.00ED,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 26279ccf78a2dcf14c9cb7e77a6eeaf7
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: kNpmDdhKN5XZ

Add APEI/GHES description document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
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
