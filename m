Received: by 10.25.77.65 with SMTP id a62csp211652lfb;
        Thu, 26 Jan 2017 05:34:35 -0800 (PST)
X-Received: by 10.55.18.165 with SMTP id 37mr2775727qks.22.1485437675448;
        Thu, 26 Jan 2017 05:34:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4si1145805qtf.42.2017.01.26.05.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 05:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWkC8-00074I-Qu
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 08:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWkC2-00072d-Py
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 08:34:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWkBz-0001EA-Jg
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 08:34:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWkBz-0001Cf-EY; Thu, 26 Jan 2017 08:34:23 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 364F9C04BD23;
	Thu, 26 Jan 2017 13:34:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BFE1888AF;
	Thu, 26 Jan 2017 13:34:18 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-3-git-send-email-drjones@redhat.com>
	<CAFEAcA92X+oCMji_bnWkjRWvqQ+CyqrR0ogy-SKOGW7TRYsZ3g@mail.gmail.com>
	<6442c7ab-a539-c1e2-bb54-23d4643bba65@redhat.com>
	<CAFEAcA-R3CBd4_g=83Gq2U0LK6qf0k-sxb3Kiu3GSv9AXqZH2A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ddd1f11a-3816-11fb-100b-356e7dbeb5e7@redhat.com>
Date: Thu, 26 Jan 2017 14:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-R3CBd4_g=83Gq2U0LK6qf0k-sxb3Kiu3GSv9AXqZH2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 26 Jan 2017 13:34:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/virt: no ITS on
 older machine types
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmZHUawOdneh

Hi Peter,

On 26/01/2017 11:41, Peter Maydell wrote:
> On 26 January 2017 at 07:58, Auger Eric <eric.auger@redhat.com> wrote:
>> On 20/01/2017 16:52, Peter Maydell wrote:
>>> So this patch added a no_its flag which gets set for virt-2.7
>>> and earlier, but there's no user-facing way to say "I'd like
>>> a virt-2.8 board with no ITS", right? That's a bit unfortunate
>>> because the ITS can't be migrated, which means there's no way
>>> to ask for a post-2.7 virt board which can be migrated...
>>
>> Sorry for the delay.
>>
>> For 2.9 machine I can add a new property that would allow the user to
>> deselect the ITS. Would that make sense?
> 
> Maybe, but Christoffer pointed out to me that we can't do
> migration of the GICv3 yet anyway, so I was getting a bit
> ahead of myself -- non-migratable ITS doesn't break something
> that worked previously. So perhaps we're OK the way we are?
Yes indeed GICv3 migration is not yet upstreamed although under way. For
2.9 your concern still is relevant if ITS migration functionality does
not get supported in 2.9 along with GICv3 one. I will pay attention to this.

Thanks

Eric
> 
> thanks
> -- PMM
> 
