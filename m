Received: by 10.25.208.211 with SMTP id h202csp2739269lfg;
        Thu, 3 Mar 2016 06:56:01 -0800 (PST)
X-Received: by 10.140.218.139 with SMTP id o133mr3720248qhb.33.1457016961017;
        Thu, 03 Mar 2016 06:56:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si10053830qkb.86.2016.03.03.06.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 06:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:35646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUfY-0008EL-Fh
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 09:56:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUfW-0008Cj-Aq
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUfV-0007Es-1R
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:55:58 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUfU-0007Eg-SP
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:55:56 -0500
Received: by mail-vk0-x22e.google.com with SMTP id k1so7213304vkb.0
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 06:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bKJWixfFxWiWOlcg6YiPcfp9i/syWHIi5FPVyarGMuM=;
	b=TG+qQENjobpg7RTCXykvKPN6IwxvdSNTHP6QXqHh/eODkFwaWLvP5NdZBK8TpNRRGq
	o5/KVz94deTr4ZlT5SRo5ECHGXlU3+c1NKC/wrJsKBvugC3P+mvOkLDFAdgjhNHlUpgs
	5f7rUGnWY8EwEP2qZnr00QU7TxQX/B8MYVoG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bKJWixfFxWiWOlcg6YiPcfp9i/syWHIi5FPVyarGMuM=;
	b=jp8EA1RyXQZbB43sSo/2pdHFrdyVJ2UetMPmtKaM0f2fQm5UQvJO/lZcVwxpAUVGsK
	ARfJd+rW9tiolW4Ze3OktktwWiXn23fUB1HJHwPqPa0wkU9OlYTd0Kb6w5QWK7BzIght
	SOXRUgiP7nVo1OOzbhGM3QpRLVoBOXAx9lEG1gndjtMGuaqmErqhOcC+7JOp8UnUF9nv
	iUWgaMHcdsR9wC4wPzpfrxxY3+oMmr4FMYR+0V1hrCqpEapw/i9WQadOMycWY4NEs+QY
	A8tO4N8hzd1XzRNU8QOQSeYzieKeO31iMPiDXWPK45oNvKZAbG/y6nmhCkI63WvnrgMy
	31NQ==
X-Gm-Message-State: AD7BkJKrzVFLCjrAEF2JWkrWUPfzKV+bPhuNuk5W52TqfukI5nCZEavytSGCdGGs4y+c0/bRonkIQD+KvCAhgHYH
X-Received: by 10.31.8.210 with SMTP id 201mr2314701vki.90.1457016956359; Thu,
	03 Mar 2016 06:55:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 06:55:36 -0800 (PST)
In-Reply-To: <56D84EB5.30808@gmail.com>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
	<56D84EB5.30808@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 14:55:36 +0000
Message-ID: <CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
X-TUID: qALGcvCM8b6y

On 3 March 2016 at 14:48, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 03.03.2016 16:49, Peter Maydell wrote:
>> On 2 March 2016 at 19:19, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>>> On 02.03.2016 21:04, Sergey Sorokin wrote:
>>>> Qemu reports translation fault on 1st level instead of 0th level in case of
>>>> AArch64 address translation if the translation table walk is disabled or
>>>> the address is in the gap between the two regions.
>>> It's probably not a very clear description in the commit message. IIUC,
>>> level 0 fault is reported in case of any fault from TTBR in AArch64 state.
>> Yes (though you mean "under an AArch64 translation regime"). Conversely, the
>> only fault reported at level 0 under an AArch32 translation regime is
>> the AddressSize fault (for bad addresses in TTBR0/1), which we don't
>> currently implement.
>>
>> There's also a code path later in the function that does
>>     level = va_size == 64 ? 0 : 1;
>>
>> but I'm not sure it's worth rearranging that code to avoid the
>> duplication of "what level do we report this kind of fault at?".
>
> Right, but actually I think this patch is going to fix the two "goto
> do_fault" cases which can happen before this "level = va_size == 64 ? 0
> : 1", namely the EDP check and the check for virtual address which is in
> the gap between TTBR0 and TTBR1 regions.

Yes, this patch is definitely fixing a bug; I'm just mentioning that other
code path because it seems to be the result of previously fixing the bug
for a particular special case...

-- PMM
