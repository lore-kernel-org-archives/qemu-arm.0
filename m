Received: by 10.28.91.67 with SMTP id p64csp865380wmb;
        Mon, 12 Mar 2018 08:02:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuAQlCSxAjkv9BkbF6IcjMzsBCSbCmmfwcFl/p7gUNn54OKDRzOAWmj2/exNXLJoRPwsRFp
X-Received: by 10.129.73.139 with SMTP id w133mr4779575ywa.322.1520866924832;
        Mon, 12 Mar 2018 08:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520866924; cv=none;
        d=google.com; s=arc-20160816;
        b=fUlDKbNj058kOd5Uht7llegb8w+sMkwOVOLwN1aTpL4ZmkdBsDWVHy9wjbka4sjIps
         brqQbqrSUAYogtWV6xeFygd3SNi5RhDjjHqdvOm7q+sbUOFGz51NwtTj325RhlZEiPPT
         jfgEynMSHPtDVBfJRGhot9VWkRv+3/23P97P3oo3tehldkUP1ulmWyx+8y4mxBu6k8q/
         xWfB69OAbTujNFITjNmbJuACk5NxJhRTXChqyCau+XT4v2bCVvHawYnJ3x/C6TWbAcLB
         9gHFUCqKe58b/pN762LbnJPm/Lll7ZLB1zNjF27MrVbq/gGwLNJ6ONCrQXGM7O+y+0YE
         /emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=AZrigKliycnqyafHBvToN+caH11KB/xTUZROgekb5Kw=;
        b=gblTmNTZaFdSiSVkG0cxxjnjRgi9dfmxC6IiWXTxmQd9dZMMs4mwPqCNu9zi1fnqtv
         FhKPpWw8MPM55sBk8rKyILjEIUJn6Odc1jE4sSwx4+0BnoTRiVDjfgvCOW4EOReZ+qpg
         PfkvW0z3Ah5R2XnsSiz2WsLSM4T4W1u23FTKmkzp7Os7fucAl4e33PN5WoBQPK4mh7ah
         DqmU6lGaYE22ee1dAl8jWAFD0zuGbZ9CAMRztEqENGOJtSiCeeFpZC8tKgzdrXHy3OyE
         zmaH3uEuiAwRoZMT+dPkgS1nMQ8zS1ynE3rckN5wUaUctkWYpzERWu76kWYi7Hb9CsEB
         QRBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7-v6si905313ybb.34.2018.03.12.08.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evOxf-0003y6-Rs
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:02:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxN-0003sJ-Mz
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxK-0001p4-Eg
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42976 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1evOxK-0001oW-8k; Mon, 12 Mar 2018 11:01:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA45A4023BB3;
	Mon, 12 Mar 2018 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4FB7C53;
	Mon, 12 Mar 2018 15:01:32 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger.pro@gmail.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
	<a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
	<CAFEAcA-08=3jyf1fpdD6AumJmbL=64iLOpoySVCfot7CXiD4Og@mail.gmail.com>
	<8ecafc78-5ea0-5d83-41d4-0b9b95bcdf21@gmail.com>
	<CAFEAcA9--5Ja9-jNVp7dJEN_y4is25NT9TSQcakDdSkpSV8R9A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5e7e5ae6-16fb-755e-03b4-176f14ee27f5@redhat.com>
Date: Mon, 12 Mar 2018 16:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9--5Ja9-jNVp7dJEN_y4is25NT9TSQcakDdSkpSV8R9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:01:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:01:41 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 10/14] hw/arm/smmuv3: Abort
 on vfio or vhost case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LornvbchiVWh

Hi Peter,

On 12/03/18 12:10, Peter Maydell wrote:
> On 12 March 2018 at 10:53, Eric Auger <eric.auger.pro@gmail.com> wrote:
>> Hi Peter,
>>
>> On 09/03/18 18:59, Peter Maydell wrote:
>>> On 9 March 2018 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
>>>> Hi Peter,
>>>> On 08/03/18 20:06, Peter Maydell wrote:
>>>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>>>> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>>>>> +                                       IOMMUNotifierFlag old,
>>>>>> +                                       IOMMUNotifierFlag new)
>>>>>> +{
>>>>>> +    if (old == IOMMU_NOTIFIER_NONE) {
>>>>>> +        error_setg(&error_fatal,
>>>>>> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
>>>>>> +    }
>>>>>> +}
>>>>>
>>>>> Is this triggerable by the guest, or by the user on the command
>>>>> line, or only by a bug in the board or other QEMU code?
>>>> by the user on the command line.
>>>
>>> OK. Do they get this error immediately on startup, or only later
>>> in execution? (If the latter, is it possible to make the error
>>> happen earlier?)
> 
>> later in execution. We also have to handle the case where such device is
>> hot-plugged. At best if could be done on smmu_find_add_as() by checking
>> the type of attached device but this wouldn't happen much earlier. By
>> the way we will soon support vhost and we will just rule out vfio
>> integration by detecting map notifiers.
> 
> Hmm. error_fatal is a bit unfortunate for a hotplug event -- ideally
> you would want to cause the hotplug to cleanly fail without aborting
> the running QEMU session.

At the moment I suggest I replace the assert by a warn_report saying
vhost/vfio devices will not function properly.

Normally in short term the restriction will only apply to VFIO devices.

Having something more elegant would imply some modifications in the pci
subsystem I think:

pci_init_bus_master
	-> pci_device_iommu_address_space
		->iommu_fn = smmu_find_add_as

pci_init_bus_master is called in pcibus_machine_done and
pci_qdev_realize/do_pci_register_device. But it is a void at the moment.

in smmu_find_add_as I could check whether the device is a VFIO

In case of a VFIO device smmu_find_add_as could return NULL; test this
in pci_init_bus_master and propagate the error upstream?


Thanks

Eric
> 
> thanks
> -- PMM
> 
