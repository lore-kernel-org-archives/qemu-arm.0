Received: by 10.25.208.194 with SMTP id h185csp1044703lfg;
        Fri, 22 Apr 2016 18:03:02 -0700 (PDT)
X-Received: by 10.55.20.83 with SMTP id e80mr7357671qkh.196.1461373382144;
        Fri, 22 Apr 2016 18:03:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 78si4806603qhz.100.2016.04.22.18.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 18:03:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atlyP-0003sF-OM
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 21:03:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atlxo-0002zR-6K
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 21:02:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atlxn-00070K-GM
	for qemu-devel@nongnu.org; Fri, 22 Apr 2016 21:02:24 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:59519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atlxl-0006wU-0H; Fri, 22 Apr 2016 21:02:21 -0400
Received: from 172.24.1.60 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFW17880; Sat, 23 Apr 2016 09:02:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 23 Apr 2016 09:01:42 +0800
Message-ID: <571AC974.2030601@huawei.com>
Date: Sat, 23 Apr 2016 09:01:40 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
	<1458899181-17896-2-git-send-email-zhaoshenglong@huawei.com>
	<20160422134128.tpb52mpl3mlybqff@hawk.localdomain>
In-Reply-To: <20160422134128.tpb52mpl3mlybqff@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571AC999.00D2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3594ff3c1735c6dd89e1dc31d1034c93
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-devel] [PATCH 1/3] target-arm: kvm64: set guest PMUv3
 feature bit if supported
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
Cc: wei@redhat.com, peter.maydell@linaro.org, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: udVecY+x5ABu



On 2016/4/22 21:41, Andrew Jones wrote:
> On Fri, Mar 25, 2016 at 05:46:19PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Check if kvm supports guest PMUv3. If so, set the corresponding feature
>> > bit for vcpu.
>> > 
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  linux-headers/asm-arm64/kvm.h | 6 ++++++
>> >  linux-headers/linux/kvm.h     | 2 ++
> The above two files should be updated with their own patch and not
> manually. Update with scripts/update-linux-headers.sh
> 
Ok, will use that.

Thanks,
-- 
Shannon

