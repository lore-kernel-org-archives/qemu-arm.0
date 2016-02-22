Received: by 10.25.208.211 with SMTP id h202csp1097992lfg;
        Mon, 22 Feb 2016 02:12:21 -0800 (PST)
X-Received: by 10.140.92.181 with SMTP id b50mr33559283qge.44.1456135941426;
        Mon, 22 Feb 2016 02:12:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20si17984618qge.41.2016.02.22.02.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 02:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXnTY-0007TR-OZ
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 05:12:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aXnTW-0007T7-9a
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 05:12:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aXnTR-0002Qp-7Z
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 05:12:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aXnTR-0002Ql-27; Mon, 22 Feb 2016 05:12:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 165AA2DC373;
	Mon, 22 Feb 2016 10:12:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-93.phx2.redhat.com
	[10.3.113.93])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1MAC9lD009318; Mon, 22 Feb 2016 05:12:10 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1455898919-13868-1-git-send-email-peter.maydell@linaro.org>
	<56C78330.7050107@redhat.com>
	<CAKv+Gu-D=s895j7Phyx7AfFejcC1+gAZu1WK7oNkGN9p=UxSTQ@mail.gmail.com>
	<56C78FFA.1090609@redhat.com>
	<CAFEAcA-nzx2JwaC64NfBm2bpWURxezwmZoC+HOXmhrBzWptZqw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56CADEF9.3010103@redhat.com>
Date: Mon, 22 Feb 2016 11:12:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nzx2JwaC64NfBm2bpWURxezwmZoC+HOXmhrBzWptZqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Assume EL3 boot
 rom will handle PSCI if one is provided
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
X-TUID: 3tlaovu85Y5N

On 02/20/16 12:31, Peter Maydell wrote:
> On 19 February 2016 at 21:58, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 02/19/16 22:41, Ard Biesheuvel wrote:
>>> On 19 February 2016 at 22:03, Laszlo Ersek <lersek@redhat.com> wrote:
>>>> Ard, any opinion on this?
>>>>
>>>
>>> I agree with Peter. Note that this is strictly about emulation, under
>>> KVM we always run at EL1 or below and PSCI calls are handled by the
>>> host kernel, not QEMU
>>
>> Great, that's all I wanted to hear -- out of scope for me. :)
>>
>> Actually, I have now read the patch even, and I have the following comments:
>>
>> - As long as "using_psci" is true, the behavior doesn't change. Great.
>>
>> - The only place where using_psci *changes* to false is reachable only
>> with (vms->secure && firmware_loaded). That's what wasn't immediately
>> obvious from the patch -- when vms->secure is true (-machine secure=on),
>> it's out of scope for me. :)
>>
>> - However, I think I might have noticed a bug -- or rather missed
>> something trivial --, namely, where is "using_psci" *initially* set to
>> true? The "machines" static array is not touched.
> 
> Derp. I changed at the last minute from having using_psci be a
> local bool in the machvirt_init() function to putting it in the
> vbi struct, and forgot that when I deleted the "bool using_psci = true;"

Independently, I think that may be why some projects (edk2 for example,
and perhaps even some of the BSDs?) forbid initialization of auto
variables in their coding styles. Could be a little heavy-handed, so I'm
certainly not suggesting that QEMU adopt that rule; it's just
interesting to see that it really occurs sometimes.

Thanks!
Laszlo

> I needed to add something to init vbi->using_psci to true.
> 
> thanks
> -- PMM
> 

