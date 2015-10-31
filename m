Received: by 10.182.105.169 with SMTP id gn9csp221505obb;
        Fri, 30 Oct 2015 20:40:13 -0700 (PDT)
X-Received: by 10.140.42.16 with SMTP id b16mr14837663qga.78.1446262813081;
        Fri, 30 Oct 2015 20:40:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u76si8808867qkl.113.2015.10.30.20.40.12
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 20:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsN1Y-0005MW-O4
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 23:40:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsN1W-0005Ju-Nm
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 23:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsN1V-000794-Lv
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 23:40:10 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:34865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZsN1T-00077o-EN; Fri, 30 Oct 2015 23:40:07 -0400
Received: by wicll6 with SMTP id ll6so21339610wic.0;
	Fri, 30 Oct 2015 20:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vXRkIG61viJNn39viwOOawlbJYReVq1puFaSf2aHNSk=;
	b=iI2IKucsR2Hs3oZhphNAhZ/qsKmUYzsxkx/pHCEQjojleWKUa+RmgOPcdkQx86oSDQ
	i4/7lGfbb8ksyVDuHSKn322dqEYtEl3Sq8MTutaWeuGBhx3OTtH0dWmbMBZ7p7QoQKJg
	54TJr1CmIEH5yHrGEsTqMY8uiqcuu3Z21CvkYO9fFYPxO2Gvp1x69TOwS9NyCXwaFoum
	9tNBLk9PL4J8hH3kCAf3gvmcsicxuQjBM9TPN+83ZCmskC+3pRadQohRSRLu38WpzzkC
	t6tIAdgmb8JIzXEQoM2VtPqK6HY/VjcIBZ6NWN7e9pUvUm3i65nIIh0DXCD3G47VB0eI
	/dRw==
MIME-Version: 1.0
X-Received: by 10.194.23.228 with SMTP id p4mr13268419wjf.151.1446262806829;
	Fri, 30 Oct 2015 20:40:06 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Fri, 30 Oct 2015 20:40:06 -0700 (PDT)
In-Reply-To: <CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
	<CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
Date: Fri, 30 Oct 2015 20:40:06 -0700
Message-ID: <CAPokK=rLGL4PW_qMVA_Ve4xTm9Uzrm-FSPDtN9pdHv5iSohn0w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
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
X-TUID: AAsPTEazGYWF

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

Does the same apply to secure_boot flag as well? I can't see any
guarding or erroring out there. secure_boot is simply ignored when
there is no EL3, and the same if on EL3 will apply to this new flag as
well. If we need to fix this, we should fix them both together.

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
>

And a similar conflict must happen in KVM if secure_boot is set right?
So whatever check/fix logic we apply to secure_board_setup needs to
apply to secure_boot too.

Regards,
Peter

> thanks
> -- PMM
