Received: by 10.182.158.201 with SMTP id ww9csp3376473obb;
        Wed, 2 Dec 2015 14:51:39 -0800 (PST)
X-Received: by 10.140.104.19 with SMTP id z19mr7277762qge.75.1449096699765;
        Wed, 02 Dec 2015 14:51:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u42si5800047qge.50.2015.12.02.14.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 14:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GFP-00028n-CI
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 17:51:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GFN-00028h-QX
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GFJ-00014l-Mm
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:51:37 -0500
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:33264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GFJ-00014h-J3; Wed, 02 Dec 2015 17:51:33 -0500
Received: by qgea14 with SMTP id a14so46614489qge.0;
	Wed, 02 Dec 2015 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=7Gj6+vR2kPqWdxpoYbPjVixS2gITCIhcId2tCJQwQb0=;
	b=rE/Noj4htMqm7jjQZDPZdmcJXjcdmPBHbfT3vfHR4FbdrpazIYkRCjx7o5sWyhPkKJ
	nE6y28d4zDKYAKAt1bU6JIIRIBTpl8ajluCGBkqt5DJ2qtFecmQ5MtkqfxglIVXQ9lQX
	feS0vg8TzujoFZMQVyW8L3e+aKClxMGfeeSisga56U+Pkl3F9B/yEf9029Rq9FZTWA24
	qoEKJ4wNnyfflRqAxudOkQY26+2iUviqCDQKr34vITESju/YGJaO2Iq6F+Wz3Kq/LAbf
	wwderAF3/lqLGOZ3tV3DzIJJazkeUEnCyzO3YJw0C6C0cavdE/dnj/rxchJeO7/hnBlm
	EkFg==
X-Received: by 10.140.161.137 with SMTP id h131mr7800166qhh.57.1449096693256; 
	Wed, 02 Dec 2015 14:51:33 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	64sm2133156qhh.19.2015.12.02.14.51.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 14:51:32 -0800 (PST)
Message-ID: <565F75F4.1080402@gmail.com>
Date: Wed, 02 Dec 2015 17:51:32 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-2-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_vH5thMyAD+nrz_zoB-oBV=EujBEv86j+1gL5Xv-Fgqg@mail.gmail.com>
In-Reply-To: <CAFEAcA_vH5thMyAD+nrz_zoB-oBV=EujBEv86j+1gL5Xv-Fgqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 01/18] armv7m: MRS/MSR handle unprivileged
	access
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
X-TUID: u/lYDmqNA7Ah



On 11/17/2015 12:09 PM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> The MRS and MSR instruction handling isn't checking
>> the current permission level.
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> ---
>>  target-arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
>>  1 file changed, 37 insertions(+), 42 deletions(-)
> 
> This patch looks good overall, but there's one style nit:
> 
>> +    case 0 ... 7: /* xPSR sub-fields */
>> +        mask = 0;
>> +        if ((reg&1) && el) {
> 
> you want spaces around operators, so "reg & 1" here and elsewhere.

Would be nice if checkpatch.pl caught these, but I understand that this would be quite difficult to do well.  I've tried to catch this with grep and sort through the false positives.  I think I got them all.

> It would also be good to mention in the commit message the
> other things this patch is fixing:
>  * privileged attempts to write EPSR should do nothing
>  * accessing an unknown special register now triggers a
>    guest-error warning rather than aborting QEMU

Will do.
