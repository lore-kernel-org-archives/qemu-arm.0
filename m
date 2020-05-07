Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1976430lfb;
        Thu, 7 May 2020 06:40:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypJBdzzLDn5WdN2R2tqwZSOYo5ZVdI+W3/EeYzX/hdKt99nHAW/Y+Wco263pHy79/YIW/SXV
X-Received: by 2002:a17:906:7743:: with SMTP id o3mr12399823ejn.120.1588858825946;
        Thu, 07 May 2020 06:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588858825; cv=none;
        d=google.com; s=arc-20160816;
        b=PfL15Gz6XYS3DMAuw1QXHgvKW2THlfbgs/dID5inSMQUEEbStQdrOP+2BMxwdeZ8Dd
         Ae/KRfg7s24+fsbLcFylbmT7SkUPbzkg05NglkjhycuKWGWHxMrIrNYKqKcBt/y5qona
         JCm81DG9GYxrLqj7MQe0X/NlWELvI0zjGSGqQ8jsIGRCaNRoOKV0akFeVMJTD65mMCXB
         3GfmJl6hQw8smT1lF3l06PU68QKFD+Z5u83K4H9yHTLsOT5Qb0Ei7mmp5W6k8gATjpdi
         JrASITe6iiwjk5SKVrzkZmr7b4JNJZlziwvd84/T0Obbrz1+taCiayKjqjBUnPAa0QB6
         bm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Lahlf/3rn46Y+m4fdTmZH2tDXuX3UcrU9Cik0fkQe98=;
        b=KBGwRgjeWDyi/JgeZ/lRlqlaZATnI/ddcIruHZK4bs+HpyiCEFADPZh+GGWZcw7Sqq
         ZcXZsSqAs9+ezDTOrfKhBvzbvin+q/ywBaKSSQg1t+FhNHAoq3QRgsDD94RM08KPJGlY
         ZUr3EDfwQD+vz2SxJK+pZTAbVrcjOFgnXrfDk3xMUAyQcvJeXOUt7Dd9Yb/zDN9s/4Hn
         hZO+RZfT8N+q8GunHUq9n5VpWy1aDErV0RL8hGDLaiCD6ckomxAVM712gq7EjB6rpnpV
         A9kEOmdAhlpFm+8m4PX2sfvJO/B8miXSm0sOnWnNSApPdIM4ybkVt3e1b+RIKDuNLbv+
         5sgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ly26si3110289ejb.190.2020.05.07.06.40.25;
        Thu, 07 May 2020 06:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgEGNkY (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 09:40:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3896 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgEGNkW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 09:40:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CA87A7D514C73B717BE3;
        Thu,  7 May 2020 21:40:17 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 21:40:11 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v26 03/10] docs: APEI GHES generation and CPER record description
Date:   Thu, 7 May 2020 21:41:58 +0800
Message-ID: <20200507134205.7559-4-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507134205.7559-1-gengdongjiu@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZPvmPWjKhPjQ

Add APEI/GHES detailed design document

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 110 ++++++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst          |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 docs/specs/acpi_hest_ghes.rst

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
new file mode 100644
index 0000000..68f1fbe
--- /dev/null
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -0,0 +1,110 @@
+APEI tables generating and CPER record
+======================================
+
+..
+   Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
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
index de46a8b..426632a 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -14,3 +14,4 @@ Contents:
    ppc-spapr-xive
    acpi_hw_reduced_hotplug
    tpm
+   acpi_hest_ghes
-- 
1.8.3.1
