Received: by 10.25.208.211 with SMTP id h202csp1869547lfg;
        Tue, 23 Feb 2016 10:35:05 -0800 (PST)
X-Received: by 10.140.105.198 with SMTP id c64mr43630527qgf.94.1456252505036;
        Tue, 23 Feb 2016 10:35:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si24137858qgh.33.2016.02.23.10.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 10:35:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYHnc-0003eX-9E
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 13:35:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aYHnZ-0003Zk-8z
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 13:35:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aYHnV-0001Wa-CR
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 13:35:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aYHnP-0001Ui-Qa; Tue, 23 Feb 2016 13:34:57 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 492B46436A;
	Tue, 23 Feb 2016 18:34:51 +0000 (UTC)
Received: from [10.10.57.6] (vpn-57-6.rdu2.redhat.com [10.10.57.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1NIYn05010477
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Feb 2016 13:34:50 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
	<CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56CCA649.8090906@redhat.com>
Date: Tue, 23 Feb 2016 12:34:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 23 Feb 2016 18:34:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC 0/2] Versioning ARM virt machine types
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
X-TUID: 3eGmxkk+6RQ8



On 02/22/2016 04:14 PM, Peter Maydell wrote:
> On 22 February 2016 at 21:06, Wei Huang <wei@redhat.com> wrote:
>> We start to see more features been added to ARM virtual machine models.
>> For the purpose of backward compatibility (e.g. migration), it is time
>> to consider versioning machine types for ARM VMs. As a beginning step, this
>> patchset defines an abstract machine type for ARM VMs. The current
>> "virt" machine is re-written based on this new machine type accordingly.
>> These patches have been verified by booting existing VMs.
>>
>> Note that I am seeking inputs from the community by putting RFC in the
>> subject line. Please let me know your opinions. I will send out V1
>> afterwards.
> 
> My view here is the same as it has been in the past regarding
> adding versioned machine types for 'virt': are you (in this case
> Redhat) willing to stand behind it, in the sense of taking on
> the maintenance burden of adding new machine versions, reviewing
> new code contributions for issues that require changes to make sure
> that the old versions stay looking like the old machine, testing
> that old versions look right, testing cross version migration,
> and so on?

I understand your concerns. Currently our in-house tree already carries
versioned ARM machine types, which mirror both QEMU 2.4 and QEMU 2.5.
Thus someone (including myself) from Red Hat shouldn't have any problem
of maintaining/testing it because we are already doing it downstream.
x86 and ppc have a similar situation.

> 
> We need versioned machine types at *some* point; my intent here
> is to provide sufficient pushback to ensure that we don't give
> ourselves the maintenance headache until we truly need it...
> 

mach-virt based products are coming soon, so versioning is just around
the corner. The advantage of introducing it upstream early is that the
upper layers in the stack have a chance to integrate, and the QEMU
downstreams don't need to diverge in how they add versioning support
themselves. This benefits not only Red Hat but also other companies.

Thanks,
-Wei

> thanks
> -- PMM
> 
