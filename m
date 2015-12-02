Received: by 10.182.158.201 with SMTP id ww9csp3381972obb;
        Wed, 2 Dec 2015 15:04:38 -0800 (PST)
X-Received: by 10.140.175.65 with SMTP id v62mr7769770qhv.75.1449097478592;
        Wed, 02 Dec 2015 15:04:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o85si5865002qki.46.2015.12.02.15.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 15:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:60703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GRv-000178-Ij
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 18:04:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GRu-00016i-1I
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:04:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GRt-0004ji-3y
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:04:33 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4GRs-0004jX-Ut
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 18:04:33 -0500
Received: by vkca188 with SMTP id a188so35196206vkc.0
	for <qemu-arm@nongnu.org>; Wed, 02 Dec 2015 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=B9N2OJiBYesEuxTYnInStHl6wXPVURWr3IoObPgdcq8=;
	b=LCEl/MIMxASgUbhRJRy2BCQVT2Vs6QA4tBiO+oq+XK97FkXCEptm8bzbTWjPS7SYDD
	Gee1UfXZ+73FlhKxhZU61T9DEOBgmZzvdwEftp7tMsXkDjR9fhIVaxtyjYOWVHS/Mbfb
	FNPl8tPb6FE0Z3i1+M1xyqCU7pOU6i4fp81lfylraOL+tvRE5Uhx3/bzS/baT4Yjog7I
	EODeMx8cZ6XxAgpj6ngSK+vrKJhQt1XpKCjR2CxnLy8MGVNDKCVEj7CAz4n7eKYqw2aW
	1J9kO6Xey8yuqaJbAFFFJgR1RM014Z94kK6Bk0U1VvaUU6iz0TqbHbgrajYU9WpKwA1n
	f2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B9N2OJiBYesEuxTYnInStHl6wXPVURWr3IoObPgdcq8=;
	b=Q82OgasktARZgwzv9d8lkC9aFQLezyxwSXI/R8koTcvPOBFEQm43N2AZ6hrc75L84/
	+wbXOxQTbAx8YCJhAWJNa41tCBjrvmjdoYAIj5pEVICT+EFTrJBAzW5XGV7eCnEEP3SR
	GYJP2Z1sJh5uj+j67mzL2g6MJUNHsdl+CjskXXRk2DNUm66kt8RpcGg43i5L7TJOS6s6
	2Xd6mGAYiabZlGWIn77pOWFUhpFhCoYsMFxK+MuYRK3BtOX9mxvluXkqG8v0ZjUKr1oB
	asVuvE9NuZiMjxwvVMcYujvvrx5v/ezTqzwGD6d8BYTjkiKAIi3fmef0qKtSRJg5nBR7
	BY9Q==
X-Gm-Message-State: ALoCoQnng/xw2waJrdYxZMjpx6PO8a/JZMpTayLdmf8si9lxn/i2AJ+ycxlEpcaJQciTp24w9tzx
X-Received: by 10.31.131.203 with SMTP id f194mr4046501vkd.90.1449097472336;
	Wed, 02 Dec 2015 15:04:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 2 Dec 2015 15:04:12 -0800 (PST)
In-Reply-To: <565F75F4.1080402@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-2-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_vH5thMyAD+nrz_zoB-oBV=EujBEv86j+1gL5Xv-Fgqg@mail.gmail.com>
	<565F75F4.1080402@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Dec 2015 23:04:12 +0000
Message-ID: <CAFEAcA_ZwkxX2UDPoARoc85YS==0CAu0GzPF=xGpGn2BeKrpSQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
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
X-TUID: Qora6cGZvL8u

On 2 December 2015 at 22:51, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>
>
> On 11/17/2015 12:09 PM, Peter Maydell wrote:
>> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>>> The MRS and MSR instruction handling isn't checking
>>> the current permission level.
>>>
>>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>>> ---
>>>  target-arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
>>>  1 file changed, 37 insertions(+), 42 deletions(-)
>>
>> This patch looks good overall, but there's one style nit:
>>
>>> +    case 0 ... 7: /* xPSR sub-fields */
>>> +        mask = 0;
>>> +        if ((reg&1) && el) {
>>
>> you want spaces around operators, so "reg & 1" here and elsewhere.
>
> Would be nice if checkpatch.pl caught these, but I understand that
> this would be quite difficult to do well.  I've tried to catch this
> with grep and sort through the false positives.  I think I got them
> all.

It looks like this is a case where checkpatch.pl is applying
Linux kernel style (since that's where we borrowed it from)
which is looser than ours, or at least looser than what I think
our style is. There's a specific check:

       # << and >> may either have or not have spaces both sides
    } elsif ($op eq '<<' or $op eq '>>' or
             $op eq '&' or $op eq '^' or $op eq '|' or
             $op eq '+' or $op eq '-' or
             $op eq '*' or $op eq '/' or
             $op eq '%')

and those operators are only checked for "must have consistent
spacing both sides" rather than "must have spaces on both sides".

thanks
-- PMM
