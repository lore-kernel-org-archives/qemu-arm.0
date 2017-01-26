Received: by 10.25.77.65 with SMTP id a62csp84931lfb;
        Wed, 25 Jan 2017 23:58:49 -0800 (PST)
X-Received: by 10.55.48.140 with SMTP id w134mr1318067qkw.253.1485417529079;
        Wed, 25 Jan 2017 23:58:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p44si583231qtf.55.2017.01.25.23.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jan 2017 23:58:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWexC-0003ca-Dt
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 02:58:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWex7-0003cR-06
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 02:58:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWex2-0001Wt-55
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 02:58:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWex1-0001Uy-VX; Thu, 26 Jan 2017 02:58:36 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDEB14E328;
	Thu, 26 Jan 2017 07:58:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8EB517E8FA;
	Thu, 26 Jan 2017 07:58:33 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-3-git-send-email-drjones@redhat.com>
	<CAFEAcA92X+oCMji_bnWkjRWvqQ+CyqrR0ogy-SKOGW7TRYsZ3g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6442c7ab-a539-c1e2-bb54-23d4643bba65@redhat.com>
Date: Thu, 26 Jan 2017 08:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92X+oCMji_bnWkjRWvqQ+CyqrR0ogy-SKOGW7TRYsZ3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 26 Jan 2017 07:58:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: no ITS on older machine
 types
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6YXovqcE8b9r

Hi Peter,

On 20/01/2017 16:52, Peter Maydell wrote:
> On 10 October 2016 at 17:35, Andrew Jones <drjones@redhat.com> wrote:
>> We should avoid exposing new hardware (through DT and ACPI) on older
>> machine types. This patch keeps 2.7 and older from changing, despite
>> the introduction of ITS support for 2.8.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> ---
>>
>> As Eduardo pointed out long ago for a different reason, we should
>> probably replace VirtGuestInfo with direct use of VirtMachineClass,
>> like x86 has done to replace PcGuestInfo with direct use of
>> PCMachineClass. I'll work on that, but wanted to get this ITS
>> fixup in sooner than later, so I'm posting this patch now, which
>> requires 'no_its' to be duplicated.
> 
> So this patch added a no_its flag which gets set for virt-2.7
> and earlier, but there's no user-facing way to say "I'd like
> a virt-2.8 board with no ITS", right? That's a bit unfortunate
> because the ITS can't be migrated, which means there's no way
> to ask for a post-2.7 virt board which can be migrated...

Sorry for the delay.

For 2.9 machine I can add a new property that would allow the user to
deselect the ITS. Would that make sense?

Thanks

Eric


> thanks
> -- PMM
> 
