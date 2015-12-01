Received: by 10.182.158.201 with SMTP id ww9csp2394493obb;
        Tue, 1 Dec 2015 07:29:28 -0800 (PST)
X-Received: by 10.140.109.100 with SMTP id k91mr83945651qgf.23.1448983768955;
        Tue, 01 Dec 2015 07:29:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m71si50684355qkl.12.2015.12.01.07.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 07:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3mrw-0007NM-KW
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 10:29:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1a3mru-0007Kz-NU
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 10:29:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1a3mrr-0006Tw-7A
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 10:29:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1a3mrr-0006Tr-1h; Tue, 01 Dec 2015 10:29:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3CD0E6565F;
	Tue,  1 Dec 2015 15:29:22 +0000 (UTC)
Received: from [10.10.59.60] (vpn-59-60.rdu2.redhat.com [10.10.59.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB1FTJAx019926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 Dec 2015 10:29:20 -0500
To: Pavel Fedin <p.fedin@samsung.com>,
	"'Peter Maydell'" <peter.maydell@linaro.org>,
	"'Igor Mammedov'" <imammedo@redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
	<20151201142146.2bcda69f@nial.brq.redhat.com>
	<CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
	<01d201d12c47$5a77dd00$0f679700$@samsung.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <565DBCCF.7050404@redhat.com>
Date: Tue, 1 Dec 2015 09:29:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <01d201d12c47$5a77dd00$0f679700$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: 'G Gregory' <graeme.gregory@linaro.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	"'Huangpeng \(Peter\)'" <peter.huangpeng@huawei.com>,
	'QEMU Developers' <qemu-devel@nongnu.org>,
	'qemu-arm' <qemu-arm@nongnu.org>, 'Shannon Zhao' <shannon.zhao@linaro.org>,
	'Shannon Zhao' <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO
	controller
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
X-TUID: ax4rXGoLOvgj



On 12/01/2015 08:48 AM, Pavel Fedin wrote:
>  Hello!
> 
>>>> ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
>>>> powerdown, hotplug evnets. Add a GPIO controller in machine virt,
>>> s/evnets/events/
>>>
>>>> to support powerdown, maybe can be used for cpu hotplug. And
>>>> here we use pl061.
> 
>  Sorry for late jumping in, but this was the first message Cc'ed to me.
>  With these devices virt machine IMHO goes farther and farther away from its initial goal: be a minimalistic virtual box, which ensures maximum possible compatibility and portability.
>  virt machine already supports poweroff using PSCI interface. Why we need to add more hardware? Can't ACPI deal with PSCI?

PSCI handles the actions initiated from the inside of OS. Examples
include system shutdown and hotplug (still inside OS). From this
perspective PSCI works well. However this communication is
one-direction: there isn't a way to communicate from the outside (e.g.
libvirt) to the guest OS. For instance, "system_powerdown" qmp command
won't work because guest OS can't receive the notification.

>  To tell the truth, i dislike ACPI + EFI thing at all. It looks like cramming PC-oriented firmware into architecture for which it was never meant to be written. Too much overcomplications, we drop already established things and reinvent a (triangular) wheel, but what's the purpose? Is it being done only because vendors want obscure proprietary firmware instead of old good u-boot?
> 
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
> 
