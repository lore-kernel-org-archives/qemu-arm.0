Received: by 10.25.208.211 with SMTP id h202csp2789033lfg;
        Thu, 3 Mar 2016 08:37:34 -0800 (PST)
X-Received: by 10.140.20.104 with SMTP id 95mr4203459qgi.40.1457023054879;
        Thu, 03 Mar 2016 08:37:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f80si41650959qkh.107.2016.03.03.08.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 08:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abWFq-0003kg-DP
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 11:37:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abWFj-0003e5-H8
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:37:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abWFi-0001xj-J8
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:37:27 -0500
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231]:33883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1abWFe-0001vC-5z; Thu, 03 Mar 2016 11:37:22 -0500
Received: by mail-lb0-x231.google.com with SMTP id cf7so13846940lbb.1;
	Thu, 03 Mar 2016 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DgRp/zNZfBqFLA/8FvCjB7FQV3JV5m1bOvcvPERJVwQ=;
	b=Gf71ugbWlfDBIPhGKmVQzPAoro+ywWpQZyy92T/ZIwSvQjBnyaS1AOVNIkIX5PBDUJ
	WTqwKWCIWUkLoFgUsLRBYB0t45jR7PSr9rH8uANhzLVeKyrIZL3QWJ89xxkPwSeF/+bf
	EefO0/KDRsGbnYX1Spe0fXYbgmBaINhBux23a9loLktK1htP0AZDrd9HW7wRckpBW+at
	5TNt6IMZwQvKKzqM0JZtZT3MkRj67fepBwNI9Q7tzJK6yVfsRh40LL3PU+Xd/biqimNz
	al9/1vM3k6dXwMCefH+OW/w9XQ1R3Rw9gd74lHDSBYFfEHlZ1Bs+3xy4EMn88+0TOmnR
	s8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DgRp/zNZfBqFLA/8FvCjB7FQV3JV5m1bOvcvPERJVwQ=;
	b=LC/wk6YmgkEL2Dv00k7OsYo5xdKRVcjA8EUB0dZwl3AOgw//F8cmWmBJ8LJPCLUMg4
	rPzUh5iI58P4/lGsGQH19F4xub09bEZHA8aqFx6AVi8BT3kw6SyMLN23iwEa/dkeLXg6
	ZAjyNgxeRPMOEWhTKzy4xO9MKPNIMMNOHhXclWPwPyEx6n4J71j77IrnwKUhhn2bNLhp
	kzoD5LFGLMBbkgpDLbj5q9z+nlTzxa07pdp/x6KaDrx92OhJ/ZTf7uPdm8I/n4IfFsMj
	WxD/Rrm8gAFxSsqAeoe5ceunodc8K0Q2nulODptjNe0E0Ri1Yb6VuvamgUx3AoZPooh2
	bxZQ==
X-Gm-Message-State: AD7BkJIwFVxt4cVqdaBgphpI8XTW0+QWtd0uR91rJLUFyJ2opMrX/5HfNSG+WidTYQlY9A==
X-Received: by 10.25.138.5 with SMTP id m5mr1333784lfd.28.1457023041215;
	Thu, 03 Mar 2016 08:37:21 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	j75sm4931293lfb.9.2016.03.03.08.37.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 08:37:19 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
	<56D84EB5.30808@gmail.com>
	<CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D8683D.1080004@gmail.com>
Date: Thu, 3 Mar 2016 19:37:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::231
Cc: Sergey Sorokin <afarallax@yandex.ru>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
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
X-TUID: ZwIb/Fbx/J8x

On 03.03.2016 17:55, Peter Maydell wrote:
> On 3 March 2016 at 14:48, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 03.03.2016 16:49, Peter Maydell wrote:
>>> On 2 March 2016 at 19:19, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>>>> On 02.03.2016 21:04, Sergey Sorokin wrote:
>>>>> Qemu reports translation fault on 1st level instead of 0th level in case of
>>>>> AArch64 address translation if the translation table walk is disabled or
>>>>> the address is in the gap between the two regions.
>>>> It's probably not a very clear description in the commit message. IIUC,
>>>> level 0 fault is reported in case of any fault from TTBR in AArch64 state.
>>> Yes (though you mean "under an AArch64 translation regime"). Conversely, the
>>> only fault reported at level 0 under an AArch32 translation regime is
>>> the AddressSize fault (for bad addresses in TTBR0/1), which we don't
>>> currently implement.
>>>
>>> There's also a code path later in the function that does
>>>     level = va_size == 64 ? 0 : 1;
>>>
>>> but I'm not sure it's worth rearranging that code to avoid the
>>> duplication of "what level do we report this kind of fault at?".
>> Right, but actually I think this patch is going to fix the two "goto
>> do_fault" cases which can happen before this "level = va_size == 64 ? 0
>> : 1", namely the EDP check and the check for virtual address which is in
>> the gap between TTBR0 and TTBR1 regions.
> Yes, this patch is definitely fixing a bug; I'm just mentioning that other
> code path because it seems to be the result of previously fixing the bug
> for a particular special case...
>
>

Ah, right, I think I understand you :) So we'd better remove these lines:

            /* AArch64 reports these as level 0 faults.
             * AArch32 reports these as level 1 faults.
             */
            level = va_size == 64 ? 0 : 1;
            fault_type = translation_fault;

Kind regards,
Sergey
