Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1769254wrp;
        Thu, 19 Sep 2019 18:45:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeucGfbJMRO8CqzVGOtV2SssAsVQKw1/EurXPYsK+ThcleFFhbpnia8fMMi53x5Mpaml+1
X-Received: by 2002:a17:906:b30b:: with SMTP id n11mr6252539ejz.35.1568943952939;
        Thu, 19 Sep 2019 18:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568943952; cv=none;
        d=google.com; s=arc-20160816;
        b=U5fSEXuiTy/dHtNTNQm6wGLj+iaR/aI8JZV8EQKmJtuqSaoS+gAKyf9bFdYQWnb+Tg
         TJa4jRKQOjMVg6bYhL/V57ytKeYLFMMgq3SY65OL8VvIqKZ/8oty6ePNLY2tDk1Ebz6I
         XSJIdH8sq8Vsy0PW/jVyzSDSezwn5jRlsJNguiZPhlgiPNeYqGY3Lgo6r3qNpFOnx0mJ
         v+Q751Vda2UGktK3Ic29Laf3D898a6w7/uQ+LID2qLWSvIGsmaYDrA7dLuThO5FgcdfK
         SKnbVeOa22DUsoijnW6UoRRpraJctdlAnzY5+VqO4eUsXRZqqhnsMucGpa9U1gU4V8r2
         ZK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=ivL29Sl2LFr45frnpaZUaYmdsTOjbA70YwKuUmTnDYo=;
        b=HYl9xKpHhqqqdJ2T0qw3IRnlHUctoDV8mobXZptiz3JAdEt/SaPIc/oYC2fmIUd3XH
         i2+N5gNUKA8VZTAnjPzeKul7fVAa7obbbvmsw6PCWYPz/H8TvlsuFXw7c9hNk8DDnqPB
         PaoVvM73MdaFvHAQlTW6/UIqB7YQu78XzWM8OGhGzUfax6n/68AQ5iDosgOZu1sRE4wh
         7V7SVo2karIQexEc3NlJMt+ws2tVeBxPh/T8WmxVffZDaZvBNOIVn2xhli+ryjWL/tgd
         /qj/sgRfDntw+hMPP+7mmMbmpVOrjslLdOrGRdw7s+Qg4uxEQHEGv8UlwmoBaID8+JZQ
         AZTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d35si345576ede.440.2019.09.19.18.45.52;
        Thu, 19 Sep 2019 18:45:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394642AbfITBpt (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 19 Sep 2019 21:45:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41618 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729760AbfITBpt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 19 Sep 2019 21:45:49 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 171465FE99D9A574D1B7;
        Fri, 20 Sep 2019 09:45:47 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Sep 2019
 09:45:36 +0800
Subject: Re: [PATCH v18 2/6] docs: APEI GHES generation and CPER record
 description
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-3-zhengxiang9@huawei.com>
 <CAFEAcA_MGiatTVCEbnoy5D7S_j9H1DyPkqWMb8uBKL_oycyVDg@mail.gmail.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <8235139e-0b72-1e9c-23d0-2d87afcce5a0@huawei.com>
Date:   Fri, 20 Sep 2019 09:45:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MGiatTVCEbnoy5D7S_j9H1DyPkqWMb8uBKL_oycyVDg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: duN7Xw4/eIA9

Hi Peter, thanks for your review!

On 2019/9/19 21:25, Peter Maydell wrote:
> On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> Add APEI/GHES detailed design document
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  docs/specs/acpi_hest_ghes.txt | 88 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>  create mode 100644 docs/specs/acpi_hest_ghes.txt
> 
> Hi; new documentation in docs/specs should be in rst format and
> listed in the contents page for the manual at docs/specs/index.rst,
> please. Conversion from plain text should hopefully be fairly
> straightforward.
> 

Got it!

> 
> I've also provided some minor typo/grammar fixes below.
> 
Thanks, I will fix them soon.

> 
>> diff --git a/docs/specs/acpi_hest_ghes.txt b/docs/specs/acpi_hest_ghes.txt
>> new file mode 100644
>> index 0000000000..690d4b2bd0
>> --- /dev/null
>> +++ b/docs/specs/acpi_hest_ghes.txt
>> @@ -0,0 +1,88 @@
>> +APEI tables generating and CPER record
>> +=============================
>> +
>> +Copyright (C) 2019 Huawei Corporation.
>> +
>> +Design Details:
>> +-------------------
>> +
>> +       etc/acpi/tables                                 etc/hardware_errors
>> +    ====================                      ==========================================
>> ++ +--------------------------+            +-----------------------+
>> +| | HEST                     |            |    address            |            +--------------+
>> +| +--------------------------+            |    registers          |            | Error Status |
>> +| | GHES1                    |            | +---------------------+            | Data Block 1 |
>> +| +--------------------------+ +--------->| |error_block_address1 |----------->| +------------+
>> +| | .................        | |          | +---------------------+            | |  CPER      |
>> +| | error_status_address-----+-+ +------->| |error_block_address2 |--------+   | |  CPER      |
>> +| | .................        |   |        | +---------------------+        |   | |  ....      |
>> +| | read_ack_register--------+-+ |        | |    ..............   |        |   | |  CPER      |
>> +| | read_ack_preserve        | | |        +-----------------------+        |   | +------------+
>> +| | read_ack_write           | | | +----->| |error_block_addressN |------+ |   | Error Status |
>> ++ +--------------------------+ | | |      | +---------------------+      | |   | Data Block 2 |
>> +| | GHES2                    | +-+-+----->| |read_ack_register1   |      | +-->| +------------+
>> ++ +--------------------------+   | |      | +---------------------+      |     | |  CPER      |
>> +| | .................        |   | | +--->| |read_ack_register2   |      |     | |  CPER      |
>> +| | error_status_address-----+---+ | |    | +---------------------+      |     | |  ....      |
>> +| | .................        |     | |    | |  .............      |      |     | |  CPER      |
>> +| | read_ack_register--------+-----+-+    | +---------------------+      |     +-+------------+
>> +| | read_ack_preserve        |     |   +->| |read_ack_registerN   |      |     | |..........  |
>> +| | read_ack_write           |     |   |  | +---------------------+      |     | +------------+
>> ++ +--------------------------|     |   |                                 |     | Error Status |
>> +| | ...............          |     |   |                                 |     | Data Block N |
>> ++ +--------------------------+     |   |                                 +---->| +------------+
>> +| | GHESN                    |     |   |                                       | |  CPER      |
>> ++ +--------------------------+     |   |                                       | |  CPER      |
>> +| | .................        |     |   |                                       | |  ....      |
>> +| | error_status_address-----+-----+   |                                       | |  CPER      |
>> +| | .................        |         |                                       +-+------------+
>> +| | read_ack_register--------+---------+
>> +| | read_ack_preserve        |
>> +| | read_ack_write           |
>> ++ +--------------------------+
>> +
>> +(1) QEMU generates the ACPI HEST table. This table goes in the current
>> +    "etc/acpi/tables" fw_cfg blob. Each error source has different
>> +    notification types.
>> +
>> +(2) A new fw_cfg blob called "etc/hardware_errors" is introduced. QEMU
>> +    also need to populate this blob. The "etc/hardwre_errors" fw_cfg blob
> 
> "needs". "hardware_errors".
> 
>> +    contains an address registers table and an Error Status Data Block table.
>> +
>> +(3) The address registers table contains N Error Block Address entries
>> +    and N Read Ack Register entries, the size for each entry is 8-byte.
> 
> ". The size".
> 
>> +    The Error Status Data Block table contains N Error Status Data Block
>> +    entries, the size for each entry is 4096(0x1000) bytes. The total size
> 
> 
> ". The size"
> 
>> +    for "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
> 
> "for the"
> 
>> +    N is the kinds of hardware error sources.
> 
> Not sure what you had in mind here. Possibly either "N is the number of kinds of
> hardware error sources" or "N is the number of hardware error sources" ?

Yes, I mean "N is the number of kinds of hardware error sources".

> 
>> +
>> +(4) QEMU generates the ACPI linker/loader script for the firmware, the
> 
> ". The"
> 
>> +    firmware pre-allocates memory for "etc/acpi/tables", "etc/hardware_errors"
>> +    and copies blobs content there.
> 
> "blob contents"
> 
>> +
>> +(5) QEMU generates N ADD_POINTER commands, which patch address in the
> 
> "addresses"
> 
>> +    "error_status_address" fields of the HEST table with a pointer to the
>> +    corresponding "address registers" in "etc/hardware_errors" blob.
> 
> "in the"
> 
>> +
>> +(6) QEMU generates N ADD_POINTER commands, which patch address in the
> 
> "addresses"
> 
>> +    "read_ack_register" fields of the HEST table with a pointer to the
>> +    corresponding "address registers" in "etc/hardware_errors" blob.
> 
> "in the"
> 
>> +
>> +(7) QEMU generates N ADD_POINTER commands for the firmware, which patch
>> +    address in the " error_block_address" fields with a pointer to the
> 
> "addresses". Stray extra space after open-quote.
> 
>> +    respective "Error Status Data Block" in "etc/hardware_errors" blob.
> 
> "in the"
> 
>> +
>> +(8) QEMU defines a third and write-only fw_cfg blob which is called
>> +    "etc/hardware_errors_addr". Through that blob, the firmware can send back
>> +    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
>> +    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER commands
> 
> "command"
> 
>> +    for the firmware, the firmware will write back the start address of
> 
> ". The"
> 
>> +    "etc/hardware_errors" blob to fw_cfg file "etc/hardware_errors_addr".
> 
> "to the fw_cfg file"
> 
>> +
>> +(9) When QEMU gets SIGBUS from the kernel, QEMU formats the CPER right into
> 
> "a SIGBUS"
> 
>> +    guest memory, and then injects whatever interrupt (or assert whatever GPIO
> 
> "or asserts"
> 
>> +    line) as a notification which is necessary for notifying the guest.
>> +
>> +(10) This notification (in virtual hardware) will be handled by guest kernel,
> 
> "the guest kernel"
> 
>> +    guest APEI driver will read the CPER which is recorded by QEMU and do the
> 
> "and the guest APEI driver"
> 
>> +    recovery.
> 
> thanks
> -- PMM
> 
> .
> 

-- 

Thanks,
Xiang
