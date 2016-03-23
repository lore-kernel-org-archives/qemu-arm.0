Received: by 10.25.208.211 with SMTP id h202csp158165lfg;
        Wed, 23 Mar 2016 10:14:20 -0700 (PDT)
X-Received: by 10.140.96.9 with SMTP id j9mr3815897qge.10.1458753260513;
        Wed, 23 Mar 2016 10:14:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o74si2864881qki.121.2016.03.23.10.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 10:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aimMN-0001En-TY
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 13:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aimML-0001C2-EM
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 13:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aimMH-0005NL-Ap
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 13:14:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aimMH-0005N9-5H; Wed, 23 Mar 2016 13:14:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 2AF8015555;
	Wed, 23 Mar 2016 17:14:12 +0000 (UTC)
Received: from [10.10.60.142] (vpn-60-142.rdu2.redhat.com [10.10.60.142])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NHEAtA026822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Mar 2016 13:14:11 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56F2CEE2.7060903@redhat.com>
Date: Wed, 23 Mar 2016 12:14:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/2] Add gpio_key and use it for ARM virt
	power button
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x69m4urNo1zl



On 03/23/2016 11:12 AM, Peter Maydell wrote:
> On 17 March 2016 at 13:25, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> There is a problem for power button that it will not work if an early
>> system_powerdown request happens before guest gpio driver loads.
>>
>> Here we add the emulation of gpio_key and use it for ARM virt power
>> button.
> 
> I tweaked the type names to be 'gpio-key' rather than 'gpio_key',
> and added a comment to briefly describe what the device does:
> 
> + * Emulate a (human) keypress -- when the key is triggered by
> + * setting the incoming gpio line, the outbound irq line is
> + * raised for 100ms before being dropped again.
> 
> Applied to target-arm.next, thanks.

I didn't see the patch series until yesterday. So just to make it
complete, I did test it with both DT and ACPI modes. The patch seemed to
work as intended.

Tested-by: Wei Huang <wei@redhat.com>

Thanks,
-Wei


> 
> -- PMM
> 
