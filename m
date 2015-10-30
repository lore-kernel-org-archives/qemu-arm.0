Received: by 10.182.105.169 with SMTP id gn9csp108335obb;
        Fri, 30 Oct 2015 14:24:46 -0700 (PDT)
X-Received: by 10.140.133.198 with SMTP id 189mr13243492qhf.99.1446240286810;
        Fri, 30 Oct 2015 14:24:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f18si7666686qka.6.2015.10.30.14.24.46
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 14:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsHAE-00081O-Eq
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 17:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsHAB-0007zd-Tv
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsHAB-0007AP-3L
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:24:43 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZsHA9-0007A6-1c; Fri, 30 Oct 2015 17:24:41 -0400
Received: by wmeg8 with SMTP id g8so21139128wme.1;
	Fri, 30 Oct 2015 14:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U66iQ14e/+x7UI7u0+5laBFhA/H4dCB8ovfw6NTD9g8=;
	b=CMkDEbK0py4zUSKA2KBhmvfjtMdhw/5yzGx3jV3IPaswG5v67XuGrAASy/DuIirvWh
	8bWe9zu86cCEBrr37mdpJLOVvcE38iOiIN8QlCRU4sesBm15+ygidsuFOrTuqI5Exyvd
	37k0PpHWY64HDr8TsnmwUoWGwHKK/nlUAX10jn+EBDS1HUUXtDS7MqSisCaLGa8yDYz/
	oRhbu70U8opGr++jkVDL3lBgZCK69G7PkZek2NZtwJMHwG3dWCWarHyF1aMogmOPiz2m
	+tQgyx5V43/Gn55UEU5zp9evNO+nFfjfmSpsXBtfeW+xcCyC5cmRz2KmjWBL8jC/kOKL
	LDFA==
MIME-Version: 1.0
X-Received: by 10.28.146.82 with SMTP id u79mr318796wmd.96.1446240280471; Fri,
	30 Oct 2015 14:24:40 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Fri, 30 Oct 2015 14:24:40 -0700 (PDT)
In-Reply-To: <CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
	<CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
Date: Fri, 30 Oct 2015 14:24:40 -0700
Message-ID: <CAPokK=riDMV3v7BZ_2r8U6mi28ELvfgEKut5Lx8XX0Tr4UtGJQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22d
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
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
X-TUID: 9n6kWyLcpEcc

On Fri, Oct 30, 2015 at 2:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 October 2015 at 20:59, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Fri, Oct 30, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> I thought you were planning to have the generic code do the
>>> S->NS transition; but I guess it works better in the board
>>> code (we have to go up into Monitor and back down again, right?)
>>>
>>
>> Yes I had to change my mind on this one. The issue was that ARM arch
>> doesn't guarantee a NS switch by simply modding SCR.NS inline and I
>> wanted to follow this convention. The recommended way is via eret
>> (presumably from monitor mode?). So to implement this for highbank I
>> do a dummy SMC after the SCR.NS switch (from secure EL1). This can't
>> be done generically as board-setup may or may-not install a functional
>> monitor.
>>
>>> Is it an error for the board to set secure_board_setup if
>>> the CPU doesn't have EL3? (if so, worth mentioning in this
>>> comment; maybe assert?)
>>>
>>
>> I don't like assert, as has_el3 is in theory is user modifiable (via
>> either -cpu transplants or directly via -global). I think it is an
>> error_exit().
>
> The other question is what happens on a board like this if
> the user says -enable-kvm -cpu cortex-a15 ? Does that get us
> a CPU without the EL3 property? (I forget...) In any case it
> shouldn't be an error unless the board genuinely can't work
> with KVM at all, and if we're using KVM then the board
> blob definitely won't be running in Secure (and can't flip
> to Monitor mode either).

I think all we can do is exit on !kvm and have the board if() the
firmware blob for the same. What is supposed to actually happen when a
virtualized guest running under KVM calls SMC? Does the VM have any
say on what that SMC does or is that the property of the host OS? The
latter suggests that Highbank Linux simply cannot be run under KVM.

Regards,
Peter

>
> thanks
> -- PMM
