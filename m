Received: by 10.25.208.194 with SMTP id h185csp1167320lfg;
        Sat, 23 Apr 2016 01:03:53 -0700 (PDT)
X-Received: by 10.55.124.196 with SMTP id x187mr8264412qkc.204.1461398633314;
        Sat, 23 Apr 2016 01:03:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si5386966qgi.22.2016.04.23.01.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 01:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atsXg-0005AQ-Sk
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 04:03:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atsXJ-0004fa-2j
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 04:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atsXF-0001EX-ST
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 04:03:29 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:32561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atsXF-0001EB-BN; Sat, 23 Apr 2016 04:03:25 -0400
Received: from 172.24.1.48 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFW52647; Sat, 23 Apr 2016 16:03:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 23 Apr 2016 16:03:05 +0800
Message-ID: <571B2C2D.1070806@huawei.com>
Date: Sat, 23 Apr 2016 16:02:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
	<20160422124842.uhskszmlsn6v53c5@hawk.localdomain>
	<571ACCDB.20800@huawei.com>
	<20160423074542.xhwqjwfaq74kt7br@hawk.localdomain>
In-Reply-To: <20160423074542.xhwqjwfaq74kt7br@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.571B2C46.003A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3b4a71fd4d4e702c90a3e1d86ffc2f47
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-devel] [PATCH v5 3/5] ARM: Add numa-node-id for /memory
 node
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ui9SNCJHvHd4



On 2016/4/23 15:45, Andrew Jones wrote:
>>>> @@ -456,14 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>> > >>          goto fail;
>>>> > >>      }
>>>> > >>  
>>>> > >> +    mem_len = (nb_numa_nodes > 0) ? numa_info[0].node_mem : binfo->ram_size;
>>>> > >>      rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
>>> > > 
>>> > > So node0's memory node will still be called '/memory' instead of
>>> > > '/memory@addr' like the other nodes? Shouldn't we change it too?
>>> > > 
>> > Previously I deleted the /memory node creation codes in virt.c and
>> > create here, but that will cause other boards booting fail since
>> > load_dtb() is a common function. So to avoid more changes to other
>> > files, I just use current way. So is there any way to change the node
>> > name after it's created in qemu?
> I'm not sure if that's possible, but we could maybe use qemu_fdt_nop_node
> to turn /memory into a NOP node, and then add a new one?
This would be a good solution, I think. I'll update it using
qemu_fdt_nop_node.

Thanks,
-- 
Shannon

