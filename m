Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp5484677lfc;
        Tue, 26 Nov 2019 17:38:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJiVr5StxFbXB1XR4QpMUQKn7DMAdRRn2AGvqqIalxDA67AGlH0ZNobvRDNb4A8TOIPYA3
X-Received: by 2002:a17:906:e289:: with SMTP id gg9mr46094459ejb.71.1574818695698;
        Tue, 26 Nov 2019 17:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574818695; cv=none;
        d=google.com; s=arc-20160816;
        b=NXPqN5sRgbE83AlBQKobvPuTsTpT8gE6opwH0G17mAXIWEJXMoBQzXTfNb3wcZPt/S
         34Hn0W+/LFAKo+lNSrKjgmx3ysi1v3MxnRft4kABByQyxuN2ft9HbPUl8+ylxtKBmh8/
         Zfs4AcsXnQFHa6UvvB1ky2yuzBi2b+Zt2gHncPK7I1t1+Ttv6u8v4ITwMZO7oVA0lQCM
         97kWjc+jeMFcRkT4U4eotfNSNRf08U4yopSDE0nDecCkeR6kwDo4hpgGj6+nLNbhjoMX
         t4TDhDC1720AHzZGsp19vkSOsa7HGfrVFV/3Wyn+AGNzwWzdU4qko8hqgNMV9pu/Qx3M
         QI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from;
        bh=/G7z6DiNIlXSDN573YDVWRgNT8q/A/r1pnb0b5tLQMg=;
        b=zVPfBS4VGC1JV41O6vNCA3Hm2Ik5kdLce5IR3+I6LKnJ/B5jWh01hMn2znBzssERoR
         7vah9bsjsF2dhLECE6tFIBW7aFfpt6MXhX0Ma0uUXEzm05BRE4qT9Y6pU9DMl8I4E/hn
         vE88B5Ms5/AX5wNWOlZX0vhCF11ty4rvS5vUxeNJa1iCeJKvB+2UAK4WhSjm9YTYm2Wl
         gHW8mmNrTjnWPcoQDtVeJGS8/Co2awNkEVLZ5zb+wiZHOhz/B/nxK9FJgFo9xLQb8/1S
         /4+RnNSQhqZCVMFqE7TbtU0XNkSKc0gIYHy92JibhFsMPzSWNRs6V5+6LGEldp0S3Wse
         9XTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f6si8747778edq.325.2019.11.26.17.38.15;
        Tue, 26 Nov 2019 17:38:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfK0BiO (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 26 Nov 2019 20:38:14 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58782 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726094AbfK0BiO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 26 Nov 2019 20:38:14 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4F42ECA742D128B964E0;
        Wed, 27 Nov 2019 09:38:09 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 09:37:59 +0800
From:   Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [RESEND PATCH v21 2/6] docs: APEI GHES generation and CPER record
 description
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>, <wanghaibin.wang@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-3-zhengxiang9@huawei.com>
 <20191115104458.200a6231@redhat.com>
Message-ID: <05d2ba81-501f-bd7e-8da4-73e413169688@huawei.com>
Date:   Wed, 27 Nov 2019 09:37:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191115104458.200a6231@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rMKTAXzfCgQX

Hi Igor,

Thanks for your review!
Since the series of patches are going to be merged, we will address your comments by follow up patches.

On 2019/11/15 17:44, Igor Mammedov wrote:
> On Mon, 11 Nov 2019 09:40:44 +0800
> Xiang Zheng <zhengxiang9@huawei.com> wrote:
> 
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> Add APEI/GHES detailed design document
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  docs/specs/acpi_hest_ghes.rst | 95 +++++++++++++++++++++++++++++++++++
>>  docs/specs/index.rst          |  1 +
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 docs/specs/acpi_hest_ghes.rst
>>
>> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
>> new file mode 100644
>> index 0000000000..348825f9d3
>> --- /dev/null
>> +++ b/docs/specs/acpi_hest_ghes.rst
>> @@ -0,0 +1,95 @@
>> +APEI tables generating and CPER record
>> +======================================
>> +
>> +..
>> +   Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
>> +
>> +   This work is licensed under the terms of the GNU GPL, version 2 or later.
>> +   See the COPYING file in the top-level directory.
>> +
>> +Design Details
>> +--------------
>> +
>> +::
>> +
>> +         etc/acpi/tables                                 etc/hardware_errors
>> +      ====================                      ==========================================
>> +  + +--------------------------+            +-----------------------+
>> +  | | HEST                     |            |    address            |            +--------------+
>> +  | +--------------------------+            |    registers          |            | Error Status |
>> +  | | GHES1                    |            | +---------------------+            | Data Block 1 |
>> +  | +--------------------------+ +--------->| |error_block_address1 |----------->| +------------+
>> +  | | .................        | |          | +---------------------+            | |  CPER      |
>> +  | | error_status_address-----+-+ +------->| |error_block_address2 |--------+   | |  CPER      |
>> +  | | .................        |   |        | +---------------------+        |   | |  ....      |
>> +  | | read_ack_register--------+-+ |        | |    ..............   |        |   | |  CPER      |
>> +  | | read_ack_preserve        | | |        +-----------------------+        |   | +------------+
>> +  | | read_ack_write           | | | +----->| |error_block_addressN |------+ |   | Error Status |
>> +  + +--------------------------+ | | |      | +---------------------+      | |   | Data Block 2 |
>> +  | | GHES2                    | +-+-+----->| |read_ack_register1   |      | +-->| +------------+
>> +  + +--------------------------+   | |      | +---------------------+      |     | |  CPER      |
>> +  | | .................        |   | | +--->| |read_ack_register2   |      |     | |  CPER      |
>> +  | | error_status_address-----+---+ | |    | +---------------------+      |     | |  ....      |
>> +  | | .................        |     | |    | |  .............      |      |     | |  CPER      |
>> +  | | read_ack_register--------+-----+-+    | +---------------------+      |     +-+------------+
>> +  | | read_ack_preserve        |     |   +->| |read_ack_registerN   |      |     | |..........  |
>> +  | | read_ack_write           |     |   |  | +---------------------+      |     | +------------+
>> +  + +--------------------------|     |   |                                 |     | Error Status |
>> +  | | ...............          |     |   |                                 |     | Data Block N |
>> +  + +--------------------------+     |   |                                 +---->| +------------+
>> +  | | GHESN                    |     |   |                                       | |  CPER      |
>> +  + +--------------------------+     |   |                                       | |  CPER      |
>> +  | | .................        |     |   |                                       | |  ....      |
>> +  | | error_status_address-----+-----+   |                                       | |  CPER      |
>> +  | | .................        |         |                                       +-+------------+
>> +  | | read_ack_register--------+---------+
>> +  | | read_ack_preserve        |
>> +  | | read_ack_write           |
>> +  + +--------------------------+
> 
> I'd merge "Error Status Data Block" with "address registers", so it would be
> clear that "Error Status Data Block" is located after "read_ack_registerN"

Yes, this image doesn't demonstrate this point. We will make some changes on
this image.

> 
>> +
>> +(1) QEMU generates the ACPI HEST table. This table goes in the current
>> +    "etc/acpi/tables" fw_cfg blob. Each error source has different
>> +    notification types.
>> +
>> +(2) A new fw_cfg blob called "etc/hardware_errors" is introduced. QEMU
>> +    also needs to populate this blob. The "etc/hardware_errors" fw_cfg blob
>> +    contains an address registers table and an Error Status Data Block table.
>> +
>> +(3) The address registers table contains N Error Block Address entries
>> +    and N Read Ack Register entries. The size for each entry is 8-byte.
>> +    The Error Status Data Block table contains N Error Status Data Block
>> +    entries. The size for each entry is 4096(0x1000) bytes. The total size
>> +    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
>> +    N is the number of the kinds of hardware error sources.
>> +
>> +(4) QEMU generates the ACPI linker/loader script for the firmware. The
>> +    firmware pre-allocates memory for "etc/acpi/tables", "etc/hardware_errors"
>> +    and copies blob contents there.
>> +
>> +(5) QEMU generates N ADD_POINTER commands, which patch addresses in the
>> +    "error_status_address" fields of the HEST table with a pointer to the
>> +    corresponding "address registers" in the "etc/hardware_errors" blob.
>> +
>> +(6) QEMU generates N ADD_POINTER commands, which patch addresses in the
>> +    "read_ack_register" fields of the HEST table with a pointer to the
>> +    corresponding "address registers" in the "etc/hardware_errors" blob.
> 
> s/"address registers" in/"read_ack_register" within/

OK.

> 
>> +
>> +(7) QEMU generates N ADD_POINTER commands for the firmware, which patch
>> +    addresses in the "error_block_address" fields with a pointer to the
>> +    respective "Error Status Data Block" in the "etc/hardware_errors" blob.
>> +
>> +(8) QEMU defines a third and write-only fw_cfg blob which is called
>> +    "etc/hardware_errors_addr". Through that blob, the firmware can send back
>> +    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
>> +    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
>> +    for the firmware. The firmware will write back the start address of
>> +    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
>> +
> 
>> +(9) When QEMU gets a SIGBUS from the kernel, QEMU formats the CPER right into
>> +    guest memory, 
> 
> s/
> QEMU formats the CPER right into guest memory
> /
> QEMU writes CPER into corresponding "Error Status Data Block"
> /
> 

OK.

>> and then injects platform specific interrupt (in case of
>> +    arm/virt machine it's Synchronous External Abort) as a notification which
>> +    is necessary for notifying the guest.
> 
> 
>> +
>> +(10) This notification (in virtual hardware) will be handled by the guest
>> +     kernel, guest APEI driver will read the CPER which is recorded by QEMU and
>> +     do the recovery.
> Maybe better would be to say:
> "
> On receiving notification, guest APEI driver cold read the CPER error
> and take appropriate action
> "

OK.

> 
> 
> also in HEST patches there is implicit ABI, which probably should be documented here.
> More specifically kvm_arch_on_sigbus_vcpu() error injection
> uses source_id as index in "etc/hardware_errors" to find out "Error Status Data Block"
> entry corresponding to error source. So supported source_id values should be assigned
> here and not be changed afterwards to make sure that guest will write error into
> expected "Error Status Data Block" even if guest was migrated to a newer QEMU.
> 

OK, I will add the descriptions of the implicit ABI.

-- 

Thanks,
Xiang
