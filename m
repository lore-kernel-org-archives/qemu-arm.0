Received: by 10.25.44.15 with SMTP id s15csp2591395lfs;
        Thu, 13 Jul 2017 12:41:28 -0700 (PDT)
X-Received: by 10.55.33.195 with SMTP id f64mr7187909qki.208.1499974888675;
        Thu, 13 Jul 2017 12:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499974888; cv=none;
        d=google.com; s=arc-20160816;
        b=nJMlr1U0Coxecq5cS975+aWu6IetBatHR42lkoQRM0Ph5mSMPFkTD2hFgsDJRDf0RO
         h/vJe8MXCJn6nGzmLT4MtTssSH+x0SZKyV5koMuyUqD8JtjWRTYe7F5YYNmy4BXuwRSe
         Tr7wZsTLQf3KAhsx3STaI/lmYihlzNh/qgqaiOHW8b6RfX1rt0CnbwUJ1TgiNVG56QBV
         gAe9UnuRwg2QRXGBaqcZOPQkYg3LDAmQe35//8ghNyfSHC011aFIJoWpz8qkCIgpIg0J
         48GLqCIFxwKO8YBrRTRrJnma2FVKUp4XPu4U+52KKA+j56Akb/TKnYjNLTFetK0jIgFA
         3tHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=uy5Ozs6jf1wPExhxHB60S8QrrC0d0cHPHQCBcptJPnw=;
        b=IX6uUL1K0nZoNl2LEgcyobFuPg44VJxzf9hskWr+hTO3z6J8KLaMUTKPk67L+Hqi7e
         IBPFm1PEunwajqd1D8Ps5wArol0zb3F7L2gNBMp2kf7Rdk2o7MZjGW4DfTJjL+k33fhN
         jv2eVOCjuE05RUfT7qqoDuHEzpKnElObV8c6ow8KnXUSp4cVfEl4J97JqtmaqhQLcDtx
         +rNR+mQV1+H2d2U/f5qLy1P+YUAPzDafmNzJbXFKlsteQkvRrD2eWC97Su9ONM+pI8ml
         FZy6bXmaNa1zYJHa8XvJIhqPRIOLzm/sDO3rKS6OeCQg1cX/7CzYW6aEM3FQ/4aZzsxu
         psUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q55si5994115qtq.264.2017.07.13.12.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 12:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVjzK-0004uU-1e
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 15:41:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dVjzG-0004uM-DN
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 15:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dVjzB-0008H7-8x
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 15:41:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dVjzA-0008Gi-Vg; Thu, 13 Jul 2017 15:41:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65DA388E60;
	Thu, 13 Jul 2017 19:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 65DA388E60
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 65DA388E60
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-47.phx2.redhat.com
	[10.3.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04C8017C20;
	Thu, 13 Jul 2017 19:41:04 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Dongjiu Geng <gengdongjiu@huawei.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-3-git-send-email-gengdongjiu@huawei.com>
	<20170713201407-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <660d600a-107c-e44a-7322-ae4a74bc5565@redhat.com>
Date: Thu, 13 Jul 2017 21:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713201407-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jul 2017 19:41:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/3] ACPI: Add APEI GHES Table Generation
 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, james.morse@arm.com,
	huangshaoyu@huawei.com, zhaoshenglong@huawei.com,
	imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hxl97ZhF3eio

On 07/13/17 19:32, Michael S. Tsirkin wrote:
> On Wed, Jul 12, 2017 at 10:08:16AM +0800, Dongjiu Geng wrote:

snip

>> etc/acpi/tables                 etc/hardware_errors
>> ================     ==========================================
>>                      +-----------+
>> +--------------+     | address   |         +-> +--------------+
>> |    HEST      +     | registers |         |   | Error Status |
>> + +------------+     | +---------+         |   | Data Block 0 |
>> | | GHES0      | --> | |address0 | --------+   | +------------+
>> | | GHES1      | --> | |address1 | ------+     | |  CPER      |
>> | | GHES2      | --> | |address2 | ----+ |     | |  CPER      |
>> | |  ....      | --> | | ....... |     | |     | |  CPER      |
>> | | GHES10     | --> | |address10| -+  | |     | |  CPER      |
>> +-+------------+     +-+---------+  |  | |     +-+------------+
>>                                     |  | |
>>                                     |  | +---> +--------------+
>>                                     |  |       | Error Status |
>>                                     |  |       | Data Block 1 |
>>                                     |  |       | +------------+
>>                                     |  |       | |  CPER      |
>>                                     |  |       | |  CPER      |
>>                                     |  |       +-+------------+
>>                                     |  |
>>                                     |  +-----> +--------------+
>>                                     |          | Error Status |
>>                                     |          | Data Block 2 |
>>                                     |          | +------------+
>>                                     |          | |  CPER      |
>>                                     |          +-+------------+
>>                                     |            ...........
>>                                     +--------> +--------------+
>>                                                | Error Status |
>>                                                | Data Block 10|
>>                                                | +------------+
>>                                                | |  CPER      |
>>                                                | |  CPER      |
>>                                                | |  CPER      |
>>                                                +-+------------+

snip

>> +
>> +    error_source_table = (AcpiHardwareErrorSourceTable *)(table_data->data
>> +                        + table_data->len - buffer->len);
>> +    error_source_table->error_source_count = GHES_ACPI_HEST_NOTIFY_RESERVED;
>> +    error_source = (AcpiGenericHardwareErrorSource *)
>> +        ((AcpiHardwareErrorSourceTable *)error_source_table + 1);
> 
> Concern with all these casts and pointer math is that it is barely readable.
> We can easily overflow the array and get hard to debug heap corruption
> errors.
> 
> What can I suggest?  Just add this to the array in steps. Then you will
> not need all the math.
> 
> Or again, you can just add things as you init them using build_append_int_noprefix.
> 
> 
>> +
>> +    bios_linker_loader_write_pointer(linker, GHES_DATA_ADDR_FW_CFG_FILE,
>> +        0, sizeof(uint64_t), GHES_ERRORS_FW_CFG_FILE,
>> +        GHES_ACPI_HEST_NOTIFY_RESERVED * sizeof(uint64_t));
> 
> What does this uint64_t refer to? It's repeated everywhere.
> 
>> +
>> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>> +        error_source->type = ACPI_HEST_SOURCE_GENERIC_ERROR;
>> +        error_source->source_id = cpu_to_le16(i);
>> +        error_source->related_source_id = 0xffff;
>> +        error_source->flags = 0;
>> +        error_source->enabled = 1;
>> +        /* The number of error status block per Generic Hardware Error Source */
> 
> number of ... blocks ?
> 
>> +        error_source->number_of_records = 1;
>> +        error_source->max_sections_per_record = 1;
>> +        error_source->max_raw_data_length = GHES_MAX_RAW_DATA_LENGTH;
>> +        error_source->error_status_address.space_id =
>> +                                    AML_SYSTEM_MEMORY;
>> +        error_source->error_status_address.bit_width = 64;
>> +        error_source->error_status_address.bit_offset = 0;
>> +        error_source->error_status_address.access_width = 4;
>> +        error_source->notify.type = i;
>> +        error_source->notify.length = sizeof(AcpiHestNotify);
>> +
>> +        error_source->error_status_block_length = GHES_MAX_RAW_DATA_LENGTH;
>> +
>> +        bios_linker_loader_add_pointer(linker,
>> +            ACPI_BUILD_TABLE_FILE, address_registers_offset + i *
>> +            sizeof(AcpiGenericHardwareErrorSource), sizeof(uint64_t),
>> +            GHES_ERRORS_FW_CFG_FILE, i * sizeof(uint64_t));
> 
> and what's this math for?
> 
>> +
>> +        error_source++;
>> +    }
>> +
>> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>> +        bios_linker_loader_add_pointer(linker,
>> +            GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i, sizeof(uint64_t),
>> +            GHES_ERRORS_FW_CFG_FILE, GHES_ACPI_HEST_NOTIFY_RESERVED *
>> +            sizeof(uint64_t) + i * GHES_MAX_RAW_DATA_LENGTH);
>> +    }

So basically all this math exists to set up the pointers that are shown
in the diagram in the commit message. It is a bit tricky because most of
those pointer fields (all 8-bytes wide) are individually embedded into
their own containing structures. In the previous version of this patch
set, I painstakingly verified the math, and pointed out wherever I
thought updates were necessary.

I agree the math is hard to read, the code is very "dense". My
suggestion (supporting yours) would be to calculate the fw_cfg blob
offsets that should be patched in more fine-grained steps, possibly with
multiple separate increments, using:
- structure type names,
- sizeof operators,
- offsetof macros,
- and possibly a separate comment for each offset increment.

Thanks,
Laszlo
