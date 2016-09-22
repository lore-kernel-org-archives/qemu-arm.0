Received: by 10.80.163.71 with SMTP id 65csp99370edn;
        Thu, 22 Sep 2016 10:49:51 -0700 (PDT)
X-Received: by 10.237.53.29 with SMTP id a29mr3449923qte.4.1474566591441;
        Thu, 22 Sep 2016 10:49:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si1941244qtb.104.2016.09.22.10.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 10:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn886-0003Tp-PW
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 13:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6V1-0001m2-Jh
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 12:05:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6Uv-0003YB-JW
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 12:05:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bn6Uv-0003Y4-DQ; Thu, 22 Sep 2016 12:05:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE2B0C05678C;
	Thu, 22 Sep 2016 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-69.ams2.redhat.com [10.36.7.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8MG5Cxu007476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Sep 2016 12:05:14 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8cy4LxamAXu86DmpGUebpuvaoNdUWCySbbZYzRNjN6Fw@mail.gmail.com>
	<c7f19ade-2d7b-9e09-91a9-e324b3c4efa1@redhat.com>
	<CAFEAcA-i_AJXc_=Voa1x7QkjfXQ1dZCZinhjo8e9XZATBuFeyw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bf66fcbe-c9ca-16e6-1d5b-7d9a765da28c@redhat.com>
Date: Thu, 22 Sep 2016 18:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-i_AJXc_=Voa1x7QkjfXQ1dZCZinhjo8e9XZATBuFeyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 22 Sep 2016 16:05:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 5/8] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: asRo1T1b2pPb

Hi Peter,
On 22/09/2016 17:59, Peter Maydell wrote:
> On 22 September 2016 at 16:53, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 22/09/2016 17:03, Peter Maydell wrote:
>>> Also, I think it would be simpler to just have kvm_its_send_msi() do
>>>
>>>    if (unlikely(!s->translater_gpa_known)) {
>>>        s->gits_translater_gpa = ...;
>>>        s->translater_gpa_known = true;
>>>    }
>> My issue precisely is to get the absolue GPA of the ITS translater.
>> kvm_its_send_msi is called by the region write callback which works on
>> relative address wrt start of the translation region while kvm ioctl
>> uses the absolute GPA. I did not see any other way to retrieve the
>> absolute GPA than using a machine init done notifier.
> 
> I don't understand. There should be no difference between
> (1) calculate gits_translater_gpa in the machine init done notifier
> (2) calculate gits_translater_gpa the first time that we need it,
> ie on first call to kvm_its_send_msi()
> 
> We don't use it anywhere else, do we ?
Oh yes I now understand. Indeed I have all the data needed from
kvm_its_send_msi parameters to compute it there. At the moment we do not
use it anywhere else.

I will proceed that way then.

Thanks

Eric
> 
> thanks
> -- PMM
> 
