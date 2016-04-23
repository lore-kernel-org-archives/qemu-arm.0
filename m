Received: by 10.25.208.194 with SMTP id h185csp1048276lfg;
        Fri, 22 Apr 2016 18:16:01 -0700 (PDT)
X-Received: by 10.140.199.4 with SMTP id u4mr25657618qha.56.1461374161106;
        Fri, 22 Apr 2016 18:16:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m142si4618692qke.49.2016.04.22.18.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 18:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atmAy-0003Pp-I5
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 21:16:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atmAv-0003I7-8A
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 21:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atmAu-0001da-Ct
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 21:15:57 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:3795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atmAp-0001ci-77; Fri, 22 Apr 2016 21:15:52 -0400
Received: from 172.24.1.48 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DJI21744; Sat, 23 Apr 2016 09:09:01 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 23 Apr 2016 09:08:53 +0800
Message-ID: <571ACB24.2010109@huawei.com>
Date: Sat, 23 Apr 2016 09:08:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-6-git-send-email-zhaoshenglong@huawei.com>
	<20160422132605.gjyuda3magcoktyf@hawk.localdomain>
In-Reply-To: <20160422132605.gjyuda3magcoktyf@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571ACB2F.00F2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6486d48a76bfc5cd4f4a14c1ef11719f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-arm] [PATCH v5 5/5] hw/arm/virt-acpi-build: Generate SRAT
 table
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CyospfXQfRS5



On 2016/4/22 21:26, Andrew Jones wrote:
>> +        core->flags = cpu_to_le32(1);
>> > +    }
>> > +    g_free(cpu_node);
>> > +
>> > +    mem_base = guest_info->memmap[VIRT_MEM].base;
>> > +    for (i = 0; i < nb_numa_nodes; ++i) {
>> > +        mem_len = numa_info[i].node_mem;
>> > +        numamem = acpi_data_push(table_data, sizeof *numamem);
>> > +        numamem->type = ACPI_SRAT_MEMORY;
>> > +        numamem->length = sizeof(*numamem);
>> > +        memset(numamem->proximity, 0, 4);
>> > +        numamem->proximity[0] = i;
> This is weird (but I see x86 does it too). The spec says proximity is
> "Integer that represents the proximity domain to which the processor
>  belongs", and its 4 bytes. So why doesn't the structure define it as
> a uint32_t and then we'd just do
> 
>   numamem->proximity = cpu_to_le32(i);
> 
> (adding Igor)
> 
>> > +        numamem->flags = cpu_to_le32(1);
>> > +        numamem->base_addr = cpu_to_le64(mem_base);
>> > +        numamem->range_length = cpu_to_le64(mem_len);
> How about moving acpi_build_srat_memory from hw/i386/acpi-build.c to
> somewhere in hw/acpi and reusing it?
> 
Good point! Will do that.

Thanks,
-- 
Shannon

