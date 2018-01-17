Received: by 10.28.173.206 with SMTP id w197csp5395766wme;
        Wed, 17 Jan 2018 07:26:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBos27HMlDfynTwLDitXUM4WIntTYzJSKM8PiXzP1bKNedCHWMp7jsBrSfjTKTVwQg4AiyN7e
X-Received: by 10.37.134.136 with SMTP id z8mr5776465ybk.158.1516202819333;
        Wed, 17 Jan 2018 07:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516202819; cv=none;
        d=google.com; s=arc-20160816;
        b=C4dDIAVRKlpB2KwiBUv2/DFoTqlBEunbgcLd4jDRqPh/yD5ICZnMPFgMfqQq1u21T+
         +wo65nQ4h7Nbu7BhUgASJ3rf2ch59gQ8pGr7UrHN7xcLIG+tMceF/LRyvbBRNugdrswB
         3N3KC7V/NnQ4/U+AIjccGkJvwPy0QV/9Z31isnTEEbz/9cCm5xkjzvMu2Dr8kiFxJEY8
         9Qwqm59d4h8d3jFhPi7bhhFfTzCJu1U6NqTvB/GoWutEGdwp8o9pVRlF6fGciveMJI5t
         5WJfl5elqdKqcys0o0DpqMIkVTuJivHXRAjGnZR/BJ4fWNHuaxwQJJRGEuEKInSiEl/K
         FUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=OM5yOudjzL9OMTpJl4ODXsu68T7TGxvzX1cMYrDVM8w=;
        b=wvF16hDhrEdja+RukHrz/TqyHhxNtFBsHC/2BiLhM3Cq2TbXRNHzyObbK39hQQCV6i
         gMydkFQ7RSK7TcLiaqKXuWkaJKHmJVjeYHkMMlAllxTiQZyoPSbn/m7p4pMwqFRwscoE
         P1He7Lf4b37H7fSGIyo2oA3NW8qqt8DDFOQtmVCRdnahmVnXxapjkPQ3gB2OVw0aVw1J
         pKr5rnChQ60ruqOAN2OGgPCPnFR5B7I7jsTQtrWKzyj+toLnQzxHYlDOm+lSu0fPc5g1
         pEKGqpPkXWA+vrcMvlK5otCDHQOeIlMQ8frRK8bAE1K8+85r8VOpniIs4eUFgiu4bykx
         lHHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g21si1211366ywk.688.2018.01.17.07.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 07:26:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebpcA-0003fO-O9
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 10:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@zoho.com>) id 1ebpZe-00023d-0B
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 10:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@zoho.com>) id 1ebpZY-0006Rm-2d
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 10:24:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel.apfelbaum@zoho.com>)
	id 1ebpZO-0006G9-Fn; Wed, 17 Jan 2018 10:24:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9131355860;
	Wed, 17 Jan 2018 15:23:49 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4D1189A5;
	Wed, 17 Jan 2018 15:23:06 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Message-ID: <b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
Date: Wed, 17 Jan 2018 17:23:04 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 17 Jan 2018 15:23:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 09/14] pci: Add support for Designware
 IP block
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
Reply-To: marcel@redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kU8ba4Q/+SDa


Hi Peter,

On 16/01/2018 16:34, Peter Maydell wrote:
> On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> =
wrote:
>> Add code needed to get a functional PCI subsytem when using in
>> conjunction with upstream Linux guest (4.13+). Tested to work against
>> "e1000e" (network adapter, using MSI interrupts) as well as
>> "usb-ehci" (USB controller, using legacy PCI interrupts).
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>   default-configs/arm-softmmu.mak  |   2 +
>>   hw/pci-host/Makefile.objs        |   2 +
>>   hw/pci-host/designware.c         | 618 +++++++++++++++++++++++++++++=
++++++++++
>>   include/hw/pci-host/designware.h |  93 ++++++
>>   include/hw/pci/pci_ids.h         |   2 +
>>   5 files changed, 717 insertions(+)
>>   create mode 100644 hw/pci-host/designware.c
>>   create mode 100644 include/hw/pci-host/designware.h
> I'm not familiar enough with our PCI code to be able to review
> this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
> could one of you have a look at whether this seems to be a correct
> implementation of a pcie host controller ?

Sadly PCI Host bridges do not have a standard, each HW vendor
can do pretty much what they want.

That being said, if Andrey can point me to the PCI spec for the Designwar=
e
PCI host bridge and what parts they implemented for it I can have a look,=
 sure.
(I will not be available for a week or so, but right after)

Thanks,
Marcel
> I did notice it seems to be missing device state save/load support.
>
> thanks
> -- PMM
>

