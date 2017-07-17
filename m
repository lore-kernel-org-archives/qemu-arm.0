Received: by 10.25.44.15 with SMTP id s15csp4137127lfs;
        Sun, 16 Jul 2017 21:43:46 -0700 (PDT)
X-Received: by 10.55.166.207 with SMTP id p198mr24433881qke.132.1500266626782;
        Sun, 16 Jul 2017 21:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500266626; cv=none;
        d=google.com; s=arc-20160816;
        b=KSTklNyn2UGtGz+Tbz1YHwgBbslV9tl70lHdKvyf6w9/P9s5iM1bzL5jLlc9jGyx30
         wZcqYnRo+zjjdzp19mN7piKEB/dXATc0hCamUDZfJJH8cH+2IvNeTIjNoR19ajAqXOCN
         w4Gn9wfmIyEediYMnUvw3AtbQ/5HRVQuwz1C+bYS9ywMf16Vrlrj4Ek84xbYlXtw10et
         DHwkx7R5jG31KN9XbV2eA53ahG9beVr3guwaDqf2VELLXtVK6k9zlHFeql2Man8FLw6M
         IwcCCA5SXSZKyQkaECZHVdSKTzyghUYSPjTC/HCSZGwmOnQfN8NBZROxfMisRNRQln9E
         UBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=5aMkNaqKlVx3LrCatm4kO8sPNYJGqyh0AuJeTgaUwcQ=;
        b=Dim83YlnkTfDOnuia3seu+jSx2i/Z39j08NVBn3L/80x1hfpDEe8bWHtEIDYhrpIZL
         GZDaVaeTocjFvt/yLzX9EBGulR5x0r552dwzeSW03jeytHYyco1EZ0ZXsUVhxwRK0Chl
         N5BGpECFhPRDyr+SYHcxLihjwMCpfnbfmpY51D5TuOka4hMg2me9n36GV+p4CU42Ia7+
         IjTlCGjM8i9NlQTWbJ9o93JVGKKHRNRc/hby+7YgK1hXU0Bp21YragN/Fc9GuxGkGwrh
         oqSvzWb1vsUHMdAVegyl49ir7yHZsxESGnArlC7m56/XMQ30B6vZh+t6YAS8/9fEWXj1
         dPjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10si5244330qtb.138.2017.07.16.21.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxsm-0003U7-3X
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:43:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dWxsh-0003TV-Ib
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dWxse-0001H3-ER
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:43:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dWxsd-0001CC-Qz; Mon, 17 Jul 2017 00:43:36 -0400
Received: from 172.30.72.57 (EHLO DGGEML401-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARF23964; Mon, 17 Jul 2017 12:43:18 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML401-HUB.china.huawei.com
	(10.3.17.32) with Microsoft SMTP Server id 14.3.301.0; Mon, 17 Jul 2017
	12:43:08 +0800
To: Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-3-git-send-email-gengdongjiu@huawei.com>
	<20170713201407-mutt-send-email-mst@kernel.org>
	<660d600a-107c-e44a-7322-ae4a74bc5565@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <eb1be690-8ce7-1cbd-069d-36116eeeff93@huawei.com>
Date: Mon, 17 Jul 2017 12:43:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <660d600a-107c-e44a-7322-ae4a74bc5565@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A010203.596C4068.000A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b76b266d036b88ede6224c5a9b484599
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
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
X-TUID: +C7WY+xXnzwL

Laszlo,
  Thanks for the comments.

On 2017/7/14 3:41, Laszlo Ersek wrote:
snip

> 
> snip
> 
>>> +
>>> +    error_source_table = (AcpiHardwareErrorSourceTable *)(table_data->data
>>> +                        + table_data->len - buffer->len);
>>> +    error_source_table->error_source_count = GHES_ACPI_HEST_NOTIFY_RESERVED;
>>> +    error_source = (AcpiGenericHardwareErrorSource *)
>>> +        ((AcpiHardwareErrorSourceTable *)error_source_table + 1);
>>
>> Concern with all these casts and pointer math is that it is barely readable.
>> We can easily overflow the array and get hard to debug heap corruption
>> errors.
>>
>> What can I suggest?  Just add this to the array in steps. Then you will
>> not need all the math.
>>
>> Or again, you can just add things as you init them using build_append_int_noprefix.
>>
>>
>>> +
>>> +    bios_linker_loader_write_pointer(linker, GHES_DATA_ADDR_FW_CFG_FILE,
>>> +        0, sizeof(uint64_t), GHES_ERRORS_FW_CFG_FILE,
>>> +        GHES_ACPI_HEST_NOTIFY_RESERVED * sizeof(uint64_t));
>>
>> What does this uint64_t refer to? It's repeated everywhere.
>>
>>> +
>>> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>>> +        error_source->type = ACPI_HEST_SOURCE_GENERIC_ERROR;
>>> +        error_source->source_id = cpu_to_le16(i);
>>> +        error_source->related_source_id = 0xffff;
>>> +        error_source->flags = 0;
>>> +        error_source->enabled = 1;
>>> +        /* The number of error status block per Generic Hardware Error Source */
>>
>> number of ... blocks ?
>>
>>> +        error_source->number_of_records = 1;
>>> +        error_source->max_sections_per_record = 1;
>>> +        error_source->max_raw_data_length = GHES_MAX_RAW_DATA_LENGTH;
>>> +        error_source->error_status_address.space_id =
>>> +                                    AML_SYSTEM_MEMORY;
>>> +        error_source->error_status_address.bit_width = 64;
>>> +        error_source->error_status_address.bit_offset = 0;
>>> +        error_source->error_status_address.access_width = 4;
>>> +        error_source->notify.type = i;
>>> +        error_source->notify.length = sizeof(AcpiHestNotify);
>>> +
>>> +        error_source->error_status_block_length = GHES_MAX_RAW_DATA_LENGTH;
>>> +
>>> +        bios_linker_loader_add_pointer(linker,
>>> +            ACPI_BUILD_TABLE_FILE, address_registers_offset + i *
>>> +            sizeof(AcpiGenericHardwareErrorSource), sizeof(uint64_t),
>>> +            GHES_ERRORS_FW_CFG_FILE, i * sizeof(uint64_t));
>>
>> and what's this math for?
>>
>>> +
>>> +        error_source++;
>>> +    }
>>> +
>>> +    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>>> +        bios_linker_loader_add_pointer(linker,
>>> +            GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i, sizeof(uint64_t),
>>> +            GHES_ERRORS_FW_CFG_FILE, GHES_ACPI_HEST_NOTIFY_RESERVED *
>>> +            sizeof(uint64_t) + i * GHES_MAX_RAW_DATA_LENGTH);
>>> +    }
> 
> So basically all this math exists to set up the pointers that are shown
> in the diagram in the commit message. It is a bit tricky because most of
> those pointer fields (all 8-bytes wide) are individually embedded into
> their own containing structures. In the previous version of this patch
> set, I painstakingly verified the math, and pointed out wherever I
> thought updates were necessary.
Laszlo, you are right. it is indeed a bit tricky. Michael also has a concern
about it. I am changing to make it clear

> 
> I agree the math is hard to read, the code is very "dense". My
> suggestion (supporting yours) would be to calculate the fw_cfg blob
> offsets that should be patched in more fine-grained steps, possibly with
> multiple separate increments, using:
> - structure type names,
> - sizeof operators,
> - offsetof macros,
> - and possibly a separate comment for each offset increment.
good suggestion. I will follow that.

> 
> Thanks,
> Laszlo
> 
> .
> 

