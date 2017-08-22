Received: by 10.223.188.70 with SMTP id a6csp4350838wrh;
        Mon, 21 Aug 2017 20:46:27 -0700 (PDT)
X-Received: by 10.200.8.71 with SMTP id x7mr11383148qth.20.1503373586938;
        Mon, 21 Aug 2017 20:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503373586; cv=none;
        d=google.com; s=arc-20160816;
        b=JDiDqETs15ppHCTQWMj4fcRczly1pYwItuIInP1USPXu684rov2IBwetjk7G4djJyI
         QIevwV0jCDICUjpn09XCH+N/b31iu7MBmLf6rtcgVpEPojyHoWOJNHqcezCKpT2BWHld
         KD2fByvE3H6snU6x0XQx31vLX+iNSZDdshX1abB6NFEIEEl6ztpRQTyWLZ+0fQk+3j9s
         LXwME0C98yL2nudmvW5Z/St192XM+VRxZn3L3VNpxReoVQ5RvrZEv/H4mZ8aph7V4YSC
         PL1Lh8yhC2NecbGF9mkTCJ8IrKziw0ARLul30gVOkv37aeP1ktEvwgP5ZBTxLEMRvf7Q
         bJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=V7LBQ/qWMDQxHsAj/Keba9qDii5HAanJKMX6HnIQ/p0=;
        b=LmhGfkjMiR3Myj0N1XwcLtPUp+PGwYgncuhC/pFCJ/mfQHZQ+ZxAUZH5vX32AMR0xo
         Wm/5AyI0ThkNtm64bReHUkSHKjB8ugibuAYsIIdwqo6nYtAb7nmJ10JybBhKb8gZlR5y
         8WzANNXC3Ye6tjOdApNsMI/eeajF5tVp5edlQYHlQA5ihJg0DLVYtp6jelx2a9lnoQua
         T9jwEP3XbnBOyFXGXP9JxqC23mNu7KdbOu31rEVn3LO6rUBMR4gO6lsErK2MZYmxCmuH
         POH3syizsxKalPY+zP9GCOwCmxUlU5Kit0np0jCwrUq2dYh7SvphzPOU4IIMLz3cjPnl
         S4Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nb6LWv/G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si12569115qth.97.2017.08.21.20.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Aug 2017 20:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nb6LWv/G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk092-0003Of-Kd
	for alex.bennee@linaro.org; Mon, 21 Aug 2017 23:46:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dk08q-0003Lx-8e
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 23:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dk08p-0003f9-4H
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 23:46:12 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:32876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dk08i-0003b0-To; Mon, 21 Aug 2017 23:46:04 -0400
Received: by mail-qk0-x234.google.com with SMTP id a77so91789863qkb.0;
	Mon, 21 Aug 2017 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=V7LBQ/qWMDQxHsAj/Keba9qDii5HAanJKMX6HnIQ/p0=;
	b=nb6LWv/GGth4gvpOK59UpRBfM3hDznhbQY6MsfAPf3aNLGAzn3MjKnEcp5zMVXKJiT
	JxvWJk3khQOqKSzmzcxPTyJ3hVT46BlTw9rk5ibg9Zfx+d1rdeSGsgl2C0orCMpfyslh
	pB9p1Rlj4nUJpEWdHphrcv70mvuwQrKWJXaegxHUFTqMZGxvzBSRk4lfnvcG/7S0HF20
	4oh16dsZVXyi6x2Ljk/BbZle4TpTK7hrj3z2oKBpRLvLPh9gENwtEMrzwok8yYYOeANf
	h2C9ZnJy/1tFirSFZjo4Hk92SkQ+GQ3tJR6BCVERCGRTN/AYqJjU/Ha2nVQ7XCw+WXHh
	pJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V7LBQ/qWMDQxHsAj/Keba9qDii5HAanJKMX6HnIQ/p0=;
	b=Zoyvuw7mwZ1IL8+xcoOp9TW1SvdhTBDuUugkkguS8NCZ8CZXuAViqaG3gausQXuQbI
	V5Ryy24Ezntett+tQTOXdO4wz1Ynj51J8VodQaSjeoIsng51yX9oVAZ4LjX0VpKgVQBC
	m3jt6CKj7wqwVczrkEZBoaMXWxKmS75BJJJnwa39oqr0CQhogvpuxQOknUSNrOpNGGmL
	rmqd4b1vGj1AXskOi+lAtyPrDIi9dT5UwLof0KiqgNtVslVeJwB47MvYaUqcJVAYv9hG
	KYdbeafWwmHBLAFYwUVPK2niWuwFUs6KMb9diY5oTwJDnW4C+ye/3/g9cRKqhrqaHopz
	W67Q==
X-Gm-Message-State: AHYfb5iw7t6K5uvkJIpvLAmtWHwc8coaOfxVDqMB8FxwN1m/92pl3SgM
	FgwcZGU8/mtll8VQFc0=
X-Received: by 10.55.143.195 with SMTP id r186mr28612114qkd.276.1503373564125; 
	Mon, 21 Aug 2017 20:46:04 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	x33sm2524810qth.80.2017.08.21.20.46.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 20:46:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
	<c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
	<CAFEAcA_nPya92Vatwt7RiZnhKTH4_GKypSrX_KgPj3GitxV0Tg@mail.gmail.com>
	<CAFEAcA97eXYPABgaE8Y_+EkWscR7CCH2WUHoM7ttZ6gVWQrqxw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa6caac1-e06c-9e1c-2aba-18d672fafb55@amsat.org>
Date: Tue, 22 Aug 2017 00:45:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97eXYPABgaE8Y_+EkWscR7CCH2WUHoM7ttZ6gVWQrqxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gmXjMDShUdS

Hi Peter,

On 08/17/2017 07:25 AM, Peter Maydell wrote:
> On 5 August 2017 at 11:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 4 August 2017 at 20:23, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> On 08/04/2017 11:09 AM, Philippe Mathieu-Daudé wrote:
>>>> Since create_unimplemented_device() register overlapped with low priority, why
>>>> not register it as default device directly, over the whole address space?
>>>
>>> That's a good suggestion.  It makes more sense to me than adding a flag on the
>>> MachineClass.
>>
>> Yeah, I did think about implementing it that way, but...
>>
>> That wouldn't handle the case of a device model directly
>> returning a MEMTX_ERROR, or a transaction dispatched to
>> a memory region whose MemoryRegionOps valid settings
>> prohibit it (eg byte accesses to a word-access-only device),
>> or accesses to a MemoryRegion that was created by passing
>> a NULL MemoryRegionOps pointer to memory_region_init_io
>> (I dunno why you'd do that but some code does).
>>
>> In short, there are lots of ways the memory subsystem might
>> end up returning a transaction error -- this mechanism
>> ensures that none of them start generating exceptions
>> when they previously did not, and is (I hope) easy to
>> review in the sense of being sure that it does what it
>> intends to do without the need to audit a lot of corner
>> cases.
> 
> So, this question (should we have a board flag to disable reporting
> of tx failures to the CPU hook, or use unimplemented_device as a
> sort of background region) seems to be the main unanswered question
> for this series. I think (as outlined above) that the board flag
> is simpler and safer; are people happy for me to put this series
> in target-arm.next with that approach, or should I rethink this bit?
As remarked previously in this thread, the current QEMU behavior on 
transaction error isn't always matching real hardware.
Matching correctly throwing errors is likely to break various current users.

If we are worried about being backward compatible, defaulting background 
region to unimp() won't throw any transaction error.

Since the default is no transaction error, users who expect hardware 
error can implement the correct behavior, per region/bus transaction errors.

I'm somehow afraid that "ignore_memory_transaction_failures" ends up 
like the "cannot_instantiate_with_device_add_yet" flag - a hard to 
remove kludge outliving his purpose.

Anyway I'm not unhappy with this approach, but I'd be very happy to have 
unimp() covering the whole background region.

Regards,

Phil.
