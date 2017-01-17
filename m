Received: by 10.25.205.13 with SMTP id d13csp277563lfg;
        Mon, 16 Jan 2017 17:22:02 -0800 (PST)
X-Received: by 10.55.69.68 with SMTP id s65mr36762066qka.72.1484616122146;
        Mon, 16 Jan 2017 17:22:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f37si15405989qte.335.2017.01.16.17.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 17:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTITH-0007yQ-FE
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 20:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cTITC-0007yJ-Mg
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 20:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cTIT8-0005px-P7
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 20:21:54 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:26891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cTIT8-0005p5-Df; Mon, 16 Jan 2017 20:21:50 -0500
Received: from 172.24.1.60 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id COE00999; Tue, 17 Jan 2017 09:21:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 17 Jan 2017 09:21:30 +0800
Message-ID: <587D7196.8080209@huawei.com>
Date: Tue, 17 Jan 2017 09:21:26 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1484477462-14088-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_pKX-v6q2uE-5+mWXYyEfooYCUFu4kVEL1N_DS5yjA2A@mail.gmail.com>
In-Reply-To: <CAFEAcA_pKX-v6q2uE-5+mWXYyEfooYCUFu4kVEL1N_DS5yjA2A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [PATCH] arm: virt: Fix the segmentation fault when
 specifying an unsupported CPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fjQR50ISZmHr



On 2017/1/17 1:27, Peter Maydell wrote:
> On 15 January 2017 at 10:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> For example, using -cpu generic will cause qemu segmentation fault.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/arm/virt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 7a03f84..4b301c2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -175,7 +175,7 @@ static bool cpuname_valid(const char *cpu)
>>      int i;
>>
>>      for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
>> -        if (strcmp(cpu, valid_cpus[i]) == 0) {
>> +        if (valid_cpus[i] != NULL && strcmp(cpu, valid_cpus[i]) == 0) {
>>              return true;
>>          }
>>      }
> 
> A better fix is to just remove the NULL entry from the
> valid_cpus[] array. We already have one "stop when we
> run out of entries" condition (the ARRAY_SIZE check),
> we don't need two...
> 
Right. Will send the update one.

Thanks,
-- 
Shannon

