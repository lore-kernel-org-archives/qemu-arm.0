Received: by 10.25.27.66 with SMTP id b63csp311239lfb;
        Fri, 3 Jun 2016 08:26:05 -0700 (PDT)
X-Received: by 10.140.91.53 with SMTP id y50mr3525446qgd.104.1464967565007;
        Fri, 03 Jun 2016 08:26:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si3769518qha.90.2016.06.03.08.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 08:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8qz6-0006un-FJ
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 11:26:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8qz3-0006ue-EI
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8qyw-0000ZK-Kl
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:26:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:55983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1b8qyw-0000ZG-Dv; Fri, 03 Jun 2016 11:25:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A7319AD2E;
	Fri,  3 Jun 2016 15:25:53 +0000 (UTC)
To: Mihai Claudiu Caraman <mike.caraman@nxp.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
	<CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
	<AM2PR04MB07394390024600CB1DD9918084590@AM2PR04MB0739.eurprd04.prod.outlook.com>
From: Alexander Graf <agraf@suse.de>
Message-ID: <5751A180.8040407@suse.de>
Date: Fri, 3 Jun 2016 17:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <AM2PR04MB07394390024600CB1DD9918084590@AM2PR04MB0739.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie
 controller node as dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ch/zqYcpvw2

On 06/03/2016 05:16 PM, Mihai Claudiu Caraman wrote:
>> -----Original Message-----
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> Sent: Friday, June 03, 2016 5:38 PM
>> To: Mihai Claudiu Caraman <mike.caraman@nxp.com>
>> Cc: Bogdan Purcareata <bogdan.purcareata@nxp.com>; QEMU Developers <qemu-devel@nongnu.org>; Peter Crosthwaite <crosthwaite.peter@gmail.com>; Alexander Graf <agraf@suse.de>; qemu-arm <qemu-arm@nongnu.org>; Eric Auger <eric.auger@linaro.org>
>> Subject: Re: [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie controller node as dma-coherent
>>
>> On 3 June 2016 at 15:22, Mihai Claudiu Caraman <mike.caraman@nxp.com> wrote:
>>> In particular for virtual and emulated devices the host CPU behaves as
>>> a DMA coherent 'device'. This should have been stated in patch
>>> description.
>> Wouldn't that imply that we should just always have the "dma-coherent"
>> property set, and we don't need to do any of the messing around looking at the host sysfs ?
>>
>> thanks
>> -- PMM
> We can always set "dma-coherent" for virtual and emulated devices but not for passthrough devices. So we can't have one PCIe controller for all devices marked as "dma-coherent".

The original patch is about the case where PCI is already cache coherent 
on the host.

I think at the end of the day this is simply outside of QEMU's scope to 
decide. What we can do is set dma-coherent per default (if Will and Ard 
agree) on the default PCIe bus and add code that allows to spawn a 
secondary PCIe bus which can then have different dma-coherent attributes 
and that you can then plug your non-coherent vfio devices into.


Alex

