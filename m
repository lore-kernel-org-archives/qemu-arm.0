Received: by 10.223.188.70 with SMTP id a6csp4615252wrh;
        Tue, 22 Aug 2017 01:37:32 -0700 (PDT)
X-Received: by 10.55.138.69 with SMTP id m66mr27956067qkd.46.1503391052398;
        Tue, 22 Aug 2017 01:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503391052; cv=none;
        d=google.com; s=arc-20160816;
        b=XWfvX6bDmp0AlyYclik1bIurTOb+GlH3vg7RYw3ifl1DqemycahB1g+cVLx3AmbOsT
         DigS9ZRVUoDK8np/WBwxiVXv1nH1TagU0RPl5bXdMkx2dDxD2tjNgOJKMXufZBCLaa8J
         rZYtry6J+N0eI6/4hhzsk22mJoN+v2ooZkzYViTSveTq/NQ5WR8hd9YDxoVO6NOs18i8
         o0an8Ue57bKAipEPw1SFwmHvSkY2wyFdq5ZD/SS9t2SF+WrIUqAJ6WJdO53c+Juij5H5
         kdZJvE4GVg2fA5cgY7NDdfJOEBHXKzYRuId3ZMjlGPKIK1MUClplAgXbNa8vdTstOrNI
         xZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=CCc/iWJ2QXg6j/xykQjePhd6JVQ35U4HJYFOp0ZfzN0=;
        b=rDp3WCB6EzBDPhy/OvovpWbdhwYQmoQ8gI3oJ0uExmzv8jRdc7wG2z5zEbTvA84dMT
         h/xhzgPWfb1GTzK1/WSSRQmMM1PYzd5yQzJhKztc4fZBWx2w0v3+7rtusyTefyzfvMr7
         BhNRH9sQtx0FOasL76fIX7hoaFHvd4XiCMt9ISF8A7qGTQT7WmWknTkWAhWSWlR65VTR
         Y0U2oZZwcWw2un19dyRzRcyLgSxNYcCVFvfoetOeIE0BKDdmbhQ7IsTwSYXw6EIXNqi4
         oVthz6PJWi406Whl2C5gnOqH3GA2ZOU51/FVqWfcy7Ue3f7yE/CdrIM+H47oIq5wTRIu
         hKCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JQ1HtqVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g138si3539957qke.336.2017.08.22.01.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 01:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JQ1HtqVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk4gk-0003nR-27
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 04:37:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk4gb-0003mG-Pi
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 04:37:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk4ga-0006dg-UF
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 04:37:21 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:33806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dk4ga-0006d0-Mb
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 04:37:20 -0400
Received: by mail-wr0-x232.google.com with SMTP id p14so50151932wrg.1
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CCc/iWJ2QXg6j/xykQjePhd6JVQ35U4HJYFOp0ZfzN0=;
	b=JQ1HtqVJUvZelvXcuk2v9fENhbwcFrogn+l8BIeZXomiUjVvgB8jFEuCb67CWCqJBz
	8mIx6aH0oKJUsP04ksUu5yAtswsOMRMfYEkZIQupguJL0JXK5nipVBka2EnaGZXZl9oz
	Xy4Y3xHYPnF2gz8V4WuqHRzELhnxsg9LkE5/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CCc/iWJ2QXg6j/xykQjePhd6JVQ35U4HJYFOp0ZfzN0=;
	b=N2S7vm/fGcqGVbHywiB4yMC8bk2A0IdthcQK3fTBdF2Sl6daNRCPGFrtbJeAoCfLT6
	wj0dv/SBoeEN58sR5uXxR/N2557JVaLqu/rzytC/mDe5/DdDByTv44qQzuGsj3FkpS7t
	19U0P74cfMgkGGbVo//Apicoer3kPC/mNj3os4gD8EtWgRRxkBUhuTYLaUCfbGGSjcyN
	jEadbOj1DcvMrpmiYJpe6E26RFMuiqAeoFlp291dWvMIwkSW82NAqJpc9USYToQd6zKh
	cXX2FdHfoimbyUqIL17cbV+3NRuH0q3yzZO8qBKL6HxaZ4mOIfAmdIEZTTjl0RRkJyAG
	6krw==
X-Gm-Message-State: AHYfb5hR5vgIqSqKCKRTT4NC0TIgfPvuy2jgDexZSNqUNUdZezvv+dH9
	an2KVVC0l7RMf+AcOJrrYDcTvqrOrxtg
X-Received: by 10.28.193.10 with SMTP id r10mr8834540wmf.157.1503391039586;
	Tue, 22 Aug 2017 01:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 01:36:59 -0700 (PDT)
In-Reply-To: <aa6caac1-e06c-9e1c-2aba-18d672fafb55@amsat.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
	<c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
	<CAFEAcA_nPya92Vatwt7RiZnhKTH4_GKypSrX_KgPj3GitxV0Tg@mail.gmail.com>
	<CAFEAcA97eXYPABgaE8Y_+EkWscR7CCH2WUHoM7ttZ6gVWQrqxw@mail.gmail.com>
	<aa6caac1-e06c-9e1c-2aba-18d672fafb55@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 09:36:59 +0100
Message-ID: <CAFEAcA9Ci+0cjFORmzL7-73Jj4pm4jST3iEbXmHjXuPyiyt03g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y5LvCUq2QCtb

On 22 August 2017 at 04:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/17/2017 07:25 AM, Peter Maydell wrote:
>>
>> On 5 August 2017 at 11:13, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>> So, this question (should we have a board flag to disable reporting
>> of tx failures to the CPU hook, or use unimplemented_device as a
>> sort of background region) seems to be the main unanswered question
>> for this series. I think (as outlined above) that the board flag
>> is simpler and safer; are people happy for me to put this series
>> in target-arm.next with that approach, or should I rethink this bit?
>
> As remarked previously in this thread, the current QEMU behavior on
> transaction error isn't always matching real hardware.
> Matching correctly throwing errors is likely to break various
> current users.

Yes, hence this patchseries keeping the wrong but back compatible
behaviour...

> If we are worried about being backward compatible, defaulting background
> region to unimp() won't throw any transaction error.

As I said, it will, for the cases of device model directly
returning a MEMTX_ERROR, or a transaction dispatched to
a memory region whose MemoryRegionOps valid settings
prohibit it (eg byte accesses to a word-access-only device), etc.
The only simple way to guarantee that we don't generate exceptions
on transaction errors is to cause the hook not to be called
(or to have the hook decide to do nothing, I suppose).

> I'm somehow afraid that "ignore_memory_transaction_failures" ends up like
> the "cannot_instantiate_with_device_add_yet" flag - a hard to remove klud=
ge
> outliving his purpose.

I agree that it's going to be around for a long time, possibly
forever, but that's life when we have so many old boards.
Any approach we take is almost certainly going to be hanging
around forever.

> Anyway I'm not unhappy with this approach, but I'd be very happy to have
> unimp() covering the whole background region.

I think this would be a reasonable approach for converting
boards away from this ignore_memory_transaction_failures hook
on a board-by-board basis but you'd still want to test some
common guest software for each conversion.

thanks
-- PMM
