Received: by 10.25.27.66 with SMTP id b63csp299287lfb;
        Fri, 3 Jun 2016 08:03:49 -0700 (PDT)
X-Received: by 10.140.108.183 with SMTP id j52mr3599733qgf.90.1464966229530;
        Fri, 03 Jun 2016 08:03:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si2621666qkh.47.2016.06.03.08.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 08:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8qdZ-00054t-09
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 11:03:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8qci-00041H-6C
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:03:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1b8qce-0003b9-Rl
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 11:02:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:54486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1b8qce-0003aj-Le; Fri, 03 Jun 2016 11:02:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BBE55AC71;
	Fri,  3 Jun 2016 15:02:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Jun 2016 17:02:50 +0200
From: agraf <agraf@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
	<CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
Message-ID: <cb8c755ac75873a05b570a0ac1267254@suse.de>
X-Sender: agraf@suse.de
User-Agent: Roundcube Webmail
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
Cc: Eric Auger <eric.auger@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Mihai Claudiu Caraman <mike.caraman@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DvpCa+eKrOg/

On 2016-06-03 16:37, Peter Maydell wrote:
> On 3 June 2016 at 15:22, Mihai Claudiu Caraman <mike.caraman@nxp.com> 
> wrote:
>> In particular for virtual and emulated devices the host CPU behaves
>> as a DMA coherent 'device'. This should have been stated in patch
>> description.
> 
> Wouldn't that imply that we should just always have the "dma-coherent"
> property set, and we don't need to do any of the messing around looking
> at the host sysfs ?

What happens with VFIO targets that don't have coherent DMA on their PCI 
bus then? I think eventually we'll need to be able to spawn a second bus 
with explicit coherency setting.


Alex

