Received: by 10.182.158.201 with SMTP id ww9csp1986502obb;
        Tue, 24 Nov 2015 04:14:17 -0800 (PST)
X-Received: by 10.31.128.82 with SMTP id b79mr25296444vkd.47.1448367257424;
        Tue, 24 Nov 2015 04:14:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s71si8721562vkf.105.2015.11.24.04.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:14:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CUC-0004A3-UB
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:14:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1CUB-00049x-1w
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:14:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1CU7-000187-Sx
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:14:14 -0500
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e]:36089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a1CU7-000181-L1; Tue, 24 Nov 2015 07:14:11 -0500
Received: by lfs39 with SMTP id 39so17803042lfs.3;
	Tue, 24 Nov 2015 04:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=TSeY514QFC1rvyYMFJabGd0qDEPKCKkctIkP7ADVSlw=;
	b=pC4uocF9GEj8dm134b6fFl6sO0K7YPzci7t7a38vv0FFk4Xqir8TkGHRtBn0K73PUD
	qqlfnOLp/bJaRz42MKI7qUk2BXLDZXFwhdyVxp4t/X6njP3aa5dbY0Nm5KR+JwT8a/VC
	yUSGDej+DJ1o+cpWjXhUDl/bitXeCq9aZid6HNNAfIIzwoEcomkl48D19OYzrEQZv8Jy
	UGV9/qBLdf6INYe5mKAfhdFVWLeibg1oVL/1CCgeZ+Gbwt+6UqPp/yZA+s2OTAPFL7ML
	Pc/vFSqr5AoWPuPBG17H5x8/dmeDrpKiHxAzUt/ZsRRVHULN7DHaN7L/fuic4aRRA4Wm
	brKA==
X-Received: by 10.25.64.5 with SMTP id n5mr11048486lfa.18.1448367250572;
	Tue, 24 Nov 2015 04:14:10 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	n65sm1585713lfb.43.2015.11.24.04.14.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 04:14:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8Xvw+Q4PjOrhswT__M4a-Aj2uPpEcsZqpNbSAoKmTBmQ@mail.gmail.com>
	<56535E25.90305@gmail.com> <565360FD.6010301@gmail.com>
	<CAFEAcA_M2GVTK-Xt--EsoHN=44Hq3S1jz_ZoDG0dCKjx3NY41g@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56545490.4060305@gmail.com>
Date: Tue, 24 Nov 2015 15:14:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_M2GVTK-Xt--EsoHN=44Hq3S1jz_ZoDG0dCKjx3NY41g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22e
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
X-TUID: kaSpjCLji51L

On 24.11.2015 14:03, Peter Maydell wrote:
> On 23 November 2015 at 18:54, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 23.11.2015 21:42, Sergey Fedorov wrote:
>>> On 23.11.2015 19:49, Peter Maydell wrote:
>>>> Ping? I forgot to mark this for-2.5, and given how long the bug's
>>>> been hanging around there's not much urgency to fixing it, but
>>>> we might as well put the fix into 2.5 if it gets reviewed.
>>>>
>>> Hi, Peter. I'm going to review this carefully in a few days :)
>>> For now, I see that the comment for this function should be updated to
>>> match new code.
>>>
>> However, I've just checked the logic of the patch was correct. Just the
>> comment needs to be adjusted.
> Looking through the rest of the file, in general we don't try
> to note in the instruction-format comments all the unallocated
> encoding possibilities, so I think the simplest thing will be
> just to delete that part of the comment. I don't think duplicating
> the information in the code itself really gains us much.
>
> I'll send out a v2.
>

I would just agree with you. No need to duplicate that low-level
knowledge which is obvious from the code.

Best regards,
Sergey
