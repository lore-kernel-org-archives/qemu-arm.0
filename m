Received: by 10.28.91.67 with SMTP id p64csp3712743wmb;
        Tue, 20 Mar 2018 04:37:38 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtR4urJvuFzFHbLQ9V+4ETBor3Uh6GFlbAv3dZxJnvtkOj1CUrWwxNoZama5VDBWSwNTdwy
X-Received: by 10.55.167.23 with SMTP id q23mr7935008qke.329.1521545858134;
        Tue, 20 Mar 2018 04:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521545858; cv=none;
        d=google.com; s=arc-20160816;
        b=A7rXKDxtt39vJQgXNjK10mVdIIPiaiv0FyXNTQiBMwKDrgtDfSaBaEbkgSzmUOGgb4
         EXooJV5IIl0FjxpS0oKl6Qa4vCfdYgpyBt+w10z5sKmPvVqSrFyTE9nUKNSHEr8dqK/t
         2IxZ6T/QZurciJhtmOHYe8bv2uaoCJHSReR/tdGoEssNZop2bdv2wy5+zoaZE7Vv9nrx
         Nl0YiKTiIUu3f/KTJkHrZHQzOjNgzYN3vhIU9OD+yPxlCjcs1vWFLBD/5aDNrdx7k4CW
         z+TX6zdPC76ZaYBN5zq6S5ovQ5tqiQqtI9u+qJfIZ5/+TClMHDeW3P7OQZ0Y1Ox0qrDK
         thUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=YQd8sn4SvAq8CEJr//yPcALnXwxm5k5+scN3kzgSIVs=;
        b=WgH7uWMZ1POk3bHvXXiExsxDrwj6DZMlDzd1Z0oFLBBWdEnIt0xi68ilzalnh4uID4
         X9gWUZUeyFa0pdEc1EciT9QBbCk3S9EQwzgwf0tcum5AGcYAUmo0HaubcA2P8HgmzLeu
         jDJbmEfJ5rtdONa7dhTRGf9ggaP/M6E72u+OQPzBvbr8T+QDPVsCwW47HY/Jk1LSlgzX
         hpDh2mjZqoVDMIEK6o/bb7d4captXjT+YYpuJ8aDN/2cJxQ2kCPoGkIs4OZusAtrUigh
         Rp7ATmz6m7Pmu7aioaWAmO+UIbW/49mpRwJ6WMKVqwrkLtr4UDwgodEL+jNqUHRDQQC3
         8yjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x48si1801153qtc.355.2018.03.20.04.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 04:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyFaD-0005TR-MY
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 07:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyFa1-0005SE-G9
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyFZy-0008Al-Tw
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:37:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2093 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyFZy-00083C-Gv; Tue, 20 Mar 2018 07:37:22 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2A4A81A69D3C0;
	Tue, 20 Mar 2018 19:37:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Tue, 20 Mar 2018
	19:36:58 +0800
Message-ID: <5AB0F254.3050503@huawei.com>
Date: Tue, 20 Mar 2018 19:36:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
In-Reply-To: <CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAMEC/SP3sGI



On 2018/3/20 19:22, Peter Maydell wrote:
> On 20 March 2018 at 07:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>> accordingly. This will overlap the GICR registers value and leave the
>> last GIC_INTERNAL irq's registers out of update.
>>
>> Fix this by skipping the registers banked by GICR.
>>
> 
> I'm still not entirely sure what the underlying problem
> you're trying to fix is...
> 
> Do we fail to correctly migrate a VM without this change?
> Does the code work on some host CPU/GIC implementations but
> not others? Is this just improving efficiency by avoiding
> doing some unnecessary work?
> 
When we reboot a VM and before entering uefi or guest kernel, we expect
all these registers staying at the initial state. But currently these
registers of the last 32 irqs are not reset. For example, the PRIORITY
of irq from 32 to 255 is 0 but the PRIORITY of irq from 256 to 287 is
0xa0(Linux kernel set the PRIORITY to 0xa0 by default).

When migrating a VM, since we don't save and restore the registers of
the last 32 irq, so the PRIORITY is 0 while we expecting 0xa0.
And also it will overlap the PRIORITY of SGIs and PPIs.

We don't fail to migrate a vm since currently we don't use the last 32
irqs in virt machine. But the bug is still there.

Thanks,
-- 
Shannon

