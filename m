Received: by 10.25.208.211 with SMTP id h202csp2398265lfg;
        Wed, 24 Feb 2016 10:28:19 -0800 (PST)
X-Received: by 10.140.27.174 with SMTP id 43mr49947767qgx.67.1456338499131;
        Wed, 24 Feb 2016 10:28:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20si3872205qhe.122.2016.02.24.10.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 10:28:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYeAc-0005LS-MR
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 13:28:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1aYeAH-00053V-Ac
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 13:27:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1aYeAG-00025w-33
	for qemu-devel@nongnu.org; Wed, 24 Feb 2016 13:27:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1aYeAB-000259-0Z; Wed, 24 Feb 2016 13:27:51 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 7A644C057867;
	Wed, 24 Feb 2016 18:27:50 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-58-102.rdu2.redhat.com
	[10.10.58.102])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1OIRmhQ015842; Wed, 24 Feb 2016 13:27:49 -0500
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mats Malmberg <mats.malmberg@tritech.se>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <56CDF624.6050104@redhat.com>
Date: Wed, 24 Feb 2016 13:27:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tHArIZZaxhbx



On 02/24/2016 01:04 PM, Andrew Baumann wrote:
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> Sent: Wednesday, 24 February 2016 9:49 AM
>>
>> On 24 February 2016 at 15:40, Mats Malmberg <mats.malmberg@tritech.se>
>> wrote:
>>>
>>> Hello all!
>>>
>>> TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it with
>>> ordinary rpi distros? If not, what is the best way to emulate raspberry
>>> pi 2 via Qemu?
>>
>> Hi; I've cc'd the main qemu-devel list and Andrew Baumann who contributed
>> the rpi2 support. I know there are still some missing pieces to be
>> added later but I forget the details.
> 
> There are still a number of missing pieces (including display and USB) which I hope to submit soon, but you should be able to boot Linux with a serial console. Brief instructions are at the end of this page: https://github.com/0xabu/qemu/wiki
> 
> BTW, instead of -hda you need to pass -sd for the image file.
> 
> Cheers,
> Andrew
> 

Is it worth changing the default interface for the "raspi2" board to be
SD so that "-hda xxxxx" mounts an SD card?

Or do we support using that for an imagined S/ATA interface? (BCM2836
doesn't have SATA, right?)

>>
>>> Host 'uname -a' output:
>>> Linux user-Precision-M4700 3.19.0-49-generic #55~14.04.1-Ubuntu SMP Fri
>> Jan 22 11:24:31 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
>>>
>>> Qemu version (via apt-get) 2.5.50
>>>
>>>
>>>
>>> I have been trying lately to get an emulation going with the raspi2 machine.
>> I admit that this is my first encounter with trying to use qemu, so perhaps
>> some of my attempts have been naive in their approach. Still, I've spent a lot
>> of time googling guides, qemu user documentation, blog posts, git
>> repositories etc, but with no success. Now I'm all out of ideas...
>>>
>>> I've tried more ways than suitable to describe here, but in short I typically:
>>> 1. take a official linux distro for raspberry pi (alpine, raspbian-jessie, Hypriot
>> etc) (all of them verified to work on actual target)
>>> 2. find a (what I think is) a compatible kernel, either by copying from
>> distro's rootfs boot/ directory or by building a qemu kernel from source
>> (https://github.com/dhruvvyas90/qemu-rpi-kernel)
>>> 3. try and start the emulation with
>>> qemu-system-arm -kernel kernel_file -M raspi2 -hda linux_image_file.img
>>>
>>> at this point, the terminal says "VNC server running on '127.0.0.1;5900'
>>> 4. using vinagre client i connect to the given address, but it only gives me a
>> compat_monitor0 console
>>>
>>> Thus I wonder, is the raspi2 machine a feature that is ready to use?
>>> If so, where do I fail in my attempts? If not, what is a recommended
>> alternative?
>>>
>>> Any help or pointers on how to be able to emulate my target (raspberry pi
>> 2) would be very appreciated.
>>
>> thanks
>> -- PMM
