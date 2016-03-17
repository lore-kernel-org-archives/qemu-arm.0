Received: by 10.25.208.211 with SMTP id h202csp506200lfg;
        Thu, 17 Mar 2016 08:24:21 -0700 (PDT)
X-Received: by 10.141.28.202 with SMTP id f193mr8278651qhe.53.1458228261209;
        Thu, 17 Mar 2016 08:24:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si8214607qka.41.2016.03.17.08.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 08:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agZme-00071L-J5
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 11:24:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZmW-0006sX-HS
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZmV-0000Xp-7R
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:24:12 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:32769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agZmV-0000Xa-3J
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 11:24:11 -0400
Received: by mail-vk0-x22d.google.com with SMTP id k1so106505988vkb.0
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LAdWY4jMp4diT+BL1i3VRrW34DUcw/Zh0mGwSN+/zLQ=;
	b=Yi1ujWqPmn/f7/VUjEODj8ren7uuY96s9JJhF8+1cBHvaof1u6LV0RtGtVNkGV+4RH
	Qy74MomqlFsNlHjfsfocVAtPwKKnKV/TL6kezU0UqEd5qtbJXwArvfLCLUI4fV1bMSd3
	7D7QetViZcfbe1CMjI6ADeoEmthuqs/uJrW/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LAdWY4jMp4diT+BL1i3VRrW34DUcw/Zh0mGwSN+/zLQ=;
	b=MUw8iyukLSpLWQbLqpGNQiklPj2cf8qaNdMibUAQVQNyLmikOm9W62qNHX0Tc4nzUJ
	NO5oAXMys+kpET5dxbJ/JZ63yzk18kIOUzw45aA1Sb617bv8vF9cYvj5N1MdZzTDoPMK
	DxOvS/EmSxSOFiElaG7PgbBt594WdieSP5FM4S1gj1GIcn5JMlxOOK+i3LOMb8XXnx7H
	l2g0oL2EUqAhGt3c377fOCGBl9k/cOT/A0j7rG9uRQTwu+old/tmr0b/vR26TmR+7GaQ
	PgsBYB4H1zt3wPjk7umo0YBWQiVO/9e9tATLvJrQRqPe4QUJmRh4olDrBXYXZXMg0Vv9
	Q5zQ==
X-Gm-Message-State: AD7BkJIHkw+UVn5z8k2fBup2zgwB5webhN8hhEyzmukbQA6Uez+ByNmVu3zN96boBXzc8xEfmLUWZShnqJCX226t
X-Received: by 10.31.47.207 with SMTP id v198mr12142494vkv.6.1458228250625;
	Thu, 17 Mar 2016 08:24:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 08:23:51 -0700 (PDT)
In-Reply-To: <628941458228094@web26j.yandex.ru>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
	<CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
	<628941458228094@web26j.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 15:23:51 +0000
Message-ID: <CAFEAcA_+znhWyJFWC3eMi8JiZw-nb2MyK_+uD6Fww76reinoeQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
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
X-TUID: +ph4P6OCFdab

On 17 March 2016 at 15:21, Sergey Sorokin <afarallax@yandex.ru> wrote:
> 17.03.2016, 14:40, "Peter Maydell" <peter.maydell@linaro.org>:
>> On 13 March 2016 at 18:28, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>>> If you want to implement the AddressSize checks that's fine,
>>>> but otherwise please leave this bit of the code alone.
>>>
>>>  You said me that my code is not correct, I have proved that it conforms
>>>  to the documentation.
>>>  It's a bit obfuscating when the doc explicitly says to take bits up to 39
>>>  from the descriptor, but in QEMU we take bits up to 47 relying on the check in
>>>  another part of the code, even if both ways are correct.
>>
>> The way the code in QEMU is structured is that we extract the
>> descriptor field in one go and then will operate on it
>> (checking for need to AddressSize fault, etc) as a second
>> action. The field descriptors themselves are the sizes I said.
>
> Well, may be it's enough just to change this comment as you intend:
>
>>> -    /* The address field in the descriptor goes up to bit 39 for ARMv7
>>> -     * but up to bit 47 for ARMv8.
>>> +    /* The address field in the descriptor goes up to bit 39 for AArch32
>>> +     * but up to bit 47 for AArch64.
>>>       */

The comment is correct as it stands.

thanks
-- PMM
