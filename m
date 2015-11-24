Received: by 10.182.158.201 with SMTP id ww9csp1951334obb;
        Tue, 24 Nov 2015 03:04:00 -0800 (PST)
X-Received: by 10.31.47.88 with SMTP id v85mr25154693vkv.118.1448363040642;
        Tue, 24 Nov 2015 03:04:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d141si17023488vka.151.2015.11.24.03.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 03:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1BOC-0001kK-B0
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 06:04:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1BO9-0001jb-LF
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 06:03:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1BO8-0005Lf-MS
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 06:03:57 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1BO8-0005LS-GX
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 06:03:56 -0500
Received: by vkha189 with SMTP id a189so8665237vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 Nov 2015 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=b6Y0U42CEy6PDp/GXccIS8+pRpZZEYlp9DTnm/raqcc=;
	b=mZnv4EIm7zVgTc1ezaqGyIZ/vGfFJ2YJp4G0ISuyi87TA6W9cGau9iKjsWSrdG8h/e
	b7zTagigsBp0+h8DxPodROn5vDzxEWv8z8SNAfr1R+xm0W0AXRQXnUc9kW0H9Q2xnQss
	j0VUeZ06yumphX3+VLO3i06pb6wfETdfQkgEFehWn3hKHsJfgXVAUzx1/kamviM4unQr
	HCLPjVG9fpoVjsV8OOdL3dbI+NuY28eNtSo6UfFDVcN1TwRxs3ygg2uFLgm4nHqAheMU
	7zSBjX0J09HvnoFFe0ER3kUuehJKxcCxJs5El6gDPcIwAf8niO1YZkORlVB2CsCOBnxg
	ZKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b6Y0U42CEy6PDp/GXccIS8+pRpZZEYlp9DTnm/raqcc=;
	b=WxgToM5OzsUMHbEARpPAw4XeEBf8TyWwt9/crclbafZp8JS2w7h/xIBdr6x9HHHXsU
	ivHcZQVS+CcwB0JCKouGoV5h0NBLcyZtO+N5rttrZfx0qB9PZW26gBj82lQUNbyRA1Jn
	lKiQHorht0PGOK532IUEHQeYaOhqwtJ7RhQYKDL9eVOxUFdkh+rz2Am6MAE9KCcls/e7
	OPWbqFzKJB5Ey7Tuti3vEHA08wiGbfYZdatmiMmAyg98XtX2kkrc+XqPnx2zASeXEurZ
	5aSqJZTIHeXCfgHyOsG/rILtwJoaWLLLMYsgxe1+sk3RSQDzhisUfARKCGygpEYpyLqa
	Uxsg==
X-Gm-Message-State: ALoCoQmdkfoGuOKpVBnVdHeZbjFg47XfDmkuq0vAwVLcdSb0eY9hJ+dXLJ0GQgPtRYIxHUJ/Et+c
X-Received: by 10.31.47.197 with SMTP id v188mr25462021vkv.6.1448363036053;
	Tue, 24 Nov 2015 03:03:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 24 Nov 2015 03:03:36 -0800 (PST)
In-Reply-To: <565360FD.6010301@gmail.com>
References: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8Xvw+Q4PjOrhswT__M4a-Aj2uPpEcsZqpNbSAoKmTBmQ@mail.gmail.com>
	<56535E25.90305@gmail.com> <565360FD.6010301@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2015 11:03:36 +0000
Message-ID: <CAFEAcA_M2GVTK-Xt--EsoHN=44Hq3S1jz_ZoDG0dCKjx3NY41g@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm/translate-a64.c: Correct
 unallocated checks for ldst_excl
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
X-TUID: iuTWqP3bIKnS

On 23 November 2015 at 18:54, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 23.11.2015 21:42, Sergey Fedorov wrote:
>> On 23.11.2015 19:49, Peter Maydell wrote:
>>> Ping? I forgot to mark this for-2.5, and given how long the bug's
>>> been hanging around there's not much urgency to fixing it, but
>>> we might as well put the fix into 2.5 if it gets reviewed.
>>>
>> Hi, Peter. I'm going to review this carefully in a few days :)
>> For now, I see that the comment for this function should be updated to
>> match new code.
>>
>
> However, I've just checked the logic of the patch was correct. Just the
> comment needs to be adjusted.

Looking through the rest of the file, in general we don't try
to note in the instruction-format comments all the unallocated
encoding possibilities, so I think the simplest thing will be
just to delete that part of the comment. I don't think duplicating
the information in the code itself really gains us much.

I'll send out a v2.

thanks
-- PMM
