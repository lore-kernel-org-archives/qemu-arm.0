Received: by 10.25.77.65 with SMTP id a62csp237674lfb;
        Wed, 1 Feb 2017 00:29:41 -0800 (PST)
X-Received: by 10.55.165.142 with SMTP id o136mr1434635qke.113.1485937781791;
        Wed, 01 Feb 2017 00:29:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si13951018qta.308.2017.02.01.00.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Feb 2017 00:29:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYqIP-0005X8-A9
	for alex.bennee@linaro.org; Wed, 01 Feb 2017 03:29:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cYqIJ-0005Ww-HN
	for qemu-arm@nongnu.org; Wed, 01 Feb 2017 03:29:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cYqIF-0006oB-E1
	for qemu-arm@nongnu.org; Wed, 01 Feb 2017 03:29:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cYqIF-0006lE-3z; Wed, 01 Feb 2017 03:29:31 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C91E61E73;
	Wed,  1 Feb 2017 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v118TQqv027112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Feb 2017 03:29:28 -0500
To: Thomas Huth <thuth@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1485880595-16376-1-git-send-email-thuth@redhat.com>
	<20170131103044.66316989@t450s.home>
	<5f0bafdc-6bb8-d936-e38c-5be92c46efc6@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d2491c49-f124-7939-64bc-dc5547c2b53b@redhat.com>
Date: Wed, 1 Feb 2017 09:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5f0bafdc-6bb8-d936-e38c-5be92c46efc6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Feb 2017 08:29:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/vfio: Add CONFIG switches for
 calxeda-xgmac and amd-xgbe
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lYX7zTuDNFbb

Hi Thomas,

On 31/01/2017 19:51, Thomas Huth wrote:
> On 31.01.2017 18:30, Alex Williamson wrote:
>> On Tue, 31 Jan 2017 17:36:35 +0100
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> Both devices seem to be specific to the ARM platform. It's confusing
>>> for the users if they show up on other target architectures, too
>>> (e.g. when the user runs QEMU with "-device ?" to get a list of
>>> supported devices). Thus let's introduce proper configuration switches
>>> so that the devices are only compiled and included when they are
>>> really required.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  default-configs/arm-softmmu.mak | 2 ++
>>>  hw/vfio/Makefile.objs           | 4 ++--
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 6de3e16..a78be51 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -94,6 +94,8 @@ CONFIG_VERSATILE_PCI=y
>>>  CONFIG_VERSATILE_I2C=y
>>>  
>>>  CONFIG_PCI_GENERIC=y
>>> +CONFIG_VFIO_XGMAC=y
>>> +CONFIG_VFIO_AMD_XGBE=y
>>>  
>>>  CONFIG_SDHCI=y
>>>  CONFIG_INTEGRATOR_DEBUG=y
>>> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
>>> index c25e32b..05e7fbb 100644
>>> --- a/hw/vfio/Makefile.objs
>>> +++ b/hw/vfio/Makefile.objs
>>> @@ -2,7 +2,7 @@ ifeq ($(CONFIG_LINUX), y)
>>>  obj-$(CONFIG_SOFTMMU) += common.o
>>>  obj-$(CONFIG_PCI) += pci.o pci-quirks.o
>>>  obj-$(CONFIG_SOFTMMU) += platform.o
>>> -obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
>>> -obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
>>> +obj-$(CONFIG_VFIO_XGMAC) += calxeda-xgmac.o
>>> +obj-$(CONFIG_VFIO_AMD_XGBE) += amd-xgbe.o
>>>  obj-$(CONFIG_SOFTMMU) += spapr.o
>>>  endif
>>
>> I can't say that I fully agree that this is a good idea.  How many
>> users are actually confused by this, versus the benefit of ensuring
>> that it builds across all architectures?
> 
> Why do you want this to be build on all architectures? The devices are
> only available on ARM as far as I know, so I can't see any real use for
> this. And it slows down compilation time, too, if we compile it
> everywhere (well, a little bit at least ;-)).
> 
>> Do we want to make platform also specific to ARM
> 
> I did not notice that one yet, since it does not show up in the "-device
> ?" help text (it's apparently an abstract device), so it also does not
> really bother me.
> But if I remove the device from the build, I get a funny error when I
> try to view the device help text:
> 
> $ qemu-system-tricore -device ?
> **
> ERROR:/home/thuth/devel/qemu/qom/object.c:168:type_get_parent: assertion
> failed: (type->parent_type != NULL)
> Aborted (core dumped)
> 
> So I guess we should rather keep that one for now.

FYI I will send patches to make VFIO platform device non abstract.

Thanks

Eric
> 
>> and spapr specific to ppc64?
> 
> I already tried that (with the already existing CONFIG_PSERIES), but the
> code in common.c depends on the code in spapr.c, so it can't be removed
> without reworking the code quite a bit. But spapr.c also does not really
> bug me, since it does not register a type that shows up in the "-device
> ?" help text, so I think it is not worth the effort here.
> 
>  Thomas
> 
