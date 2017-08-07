Received: by 10.25.221.202 with SMTP id w71csp3452096lfi;
        Mon, 7 Aug 2017 16:12:10 -0700 (PDT)
X-Received: by 10.55.165.204 with SMTP id o195mr2860705qke.11.1502147529962;
        Mon, 07 Aug 2017 16:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502147529; cv=none;
        d=google.com; s=arc-20160816;
        b=CwoPGpnnDYB324JsWFkZenEauqSQNDntPs9xl4ASGXyZATCCRuPw4wU38fvbin3h5Z
         Uo+G3ZjI1+e7cW7ZvpNXgwV64D+qkRT21UQlMw4syeGM7VNuXuL+R4QjYeE0n64ysD91
         /exuM4Edts8f6+0TCRRYJKpp/ap8QslNJYa5ZpoVxfFBbB0EC21dNqfelj/sCJTUkYUL
         Ju+0/6bQXNnFxMIMl1FB3+oo4YYvVuJzvstC6hOpb3iJlvLzgFIcNyM7q2AxLJ6frAt3
         xl/vszS+GwY+zAyBM50SvZvvLkcFgWjkeGaHHdU5M9qVUEfR8TvF68nuuo0mGPmiPVEt
         9HRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dfW3x2LbxjWtmPaAvRNvDNQzQkXnkpzc+CwRt6BGtQ4=;
        b=W9l/yr3cb9bPsBFo9D6VZFHe+mc2ZDRY91NLGqfPH/a1zrk3HCBO19glay/zm3iTse
         P+b30VOywcIn/wjBLM+mywJ4iBkNBK9iDWwIlFrPtTSAWRhVv8jUcy6FRr9uFb6qBs8y
         dejJCIEA1yEU3p4CzOVOeDQ5cZ3N4vNdTaKt3pRV935NfFVxj+loKV/MdvAtGteZeU6p
         YjLEejaosYo8k/S6ajs1n911/D4wAErFSEXXU37apfXbbhhTpGO2W7QZtLJ3DBA9XRjC
         Fve8VpCyD88oqAuXju+WM/7NHPIADTS3dfyuozI3RWFkG8Lg7pIxRk1OJDYUU/yZZGWz
         FeBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Vog0d8rH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si8242658qtd.473.2017.08.07.16.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 16:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Vog0d8rH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1derBv-0002eY-6e
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 19:12:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1derBn-0002e4-6d
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 19:12:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1derBi-0002zR-34
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 19:11:59 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:38862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1derBh-0002y9-SE; Mon, 07 Aug 2017 19:11:54 -0400
Received: by mail-wr0-x241.google.com with SMTP id g32so1262164wrd.5;
	Mon, 07 Aug 2017 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dfW3x2LbxjWtmPaAvRNvDNQzQkXnkpzc+CwRt6BGtQ4=;
	b=Vog0d8rHm/R4Z2P8PaqEUCNqlpFaYmCAaUxUVEvxT+/ZYkwSLbs3JthmFJv4WZS9TE
	hi54a74b/D7+D2aX+PKru8UaNiBiVG+bZHa6ZeMK6t4I7Yc8yNjaAztJIvxxWmPhwxa3
	j1lzBoKcKLhYh6PUeR7CsNG73e+yhJQc1MeO6xicM8vCPUfu+/kpMXLHiYalNKADfB2+
	mHMyUziCGHNHJmUAKX2NzAN1saySVKhRBMUsTuy+gOFPE6kug/8bZAl6/s7Z3tG54Nba
	0HsvqE5huEq8ro/738F4/LiChiUMWaRtvr2RGlsLaHNCNq665lYHARUi8IwQC9AeKSkc
	dNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dfW3x2LbxjWtmPaAvRNvDNQzQkXnkpzc+CwRt6BGtQ4=;
	b=j2hQxmIXAEHSkn2US2+Sg5n4NwP4CR34wc7E3VPRGHaorpqRz+9UZyCh+j74AwIJ4Q
	c5ehXqaqH+uQoYjtzI0NRmHWtPHDjBY8eJukEcQGtQG9XVPG4GrrXQf+FMuXLwM7u85B
	OEgAEvl7NkSUXwdJ3278hE6brQ0ZNJLC7OibAN1kGLnMWGI1KKn4HSeFquKFjfDAOqae
	w9Q0O48qd6Pfx6F7ZRwHlPhnrS8UbNBRwiD0sugH2NiG4yJnaf4WzDsgm8IJEjcDQSkD
	UPzjZuMwtmlDv3bU0/Oyx/NphVwO+bT9sCtdWDyNDscsEqiDb+pZljx0PgPpicYfZKyn
	pZiQ==
X-Gm-Message-State: AHYfb5g4cauRcoz37u/WM2lshWtqUabqKnjkXycx9G/u9AprLlZe7Myo
	RRjsSPEbfi33lxfNgMnoi06e2EHU0w==
X-Received: by 10.223.135.35 with SMTP id a32mr1460747wra.138.1502147510893;
	Mon, 07 Aug 2017 16:11:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 7 Aug 2017 16:11:20 -0700 (PDT)
In-Reply-To: <20170805005949.GY4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
	<20170805005949.GY4859@toto>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Aug 2017 16:11:20 -0700
Message-ID: <CAKmqyKNJO+f-=ca7RpdOEHaB322DJJA+XcCrTB43BNpO0LU9xA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/8] memory.h: Move MemTxResult
 type to memattrs.h
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z9sXmeuP+U4X

On Fri, Aug 4, 2017 at 5:59 PM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, Aug 04, 2017 at 06:20:42PM +0100, Peter Maydell wrote:
>> Move the MemTxResult type to memattrs.h. We're going to want to
>> use it in cpu/qom.h, which doesn't want to include all of
>> memory.h. In practice MemTxResult and MemTxAttrs are pretty
>> closely linked since both are used for the new-style
>> read_with_attrs and write_with_attrs callbacks, so memattrs.h
>> is a reasonable home for this rather than creating a whole
>> new header file for it.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>
>
>> ---
>>  include/exec/memattrs.h | 10 ++++++++++
>>  include/exec/memory.h   | 10 ----------
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index e601061..d4a1642 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -46,4 +46,14 @@ typedef struct MemTxAttrs {
>>   */
>>  #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
>>
>> +/* New-style MMIO accessors can indicate that the transaction failed.
>> + * A zero (MEMTX_OK) response means success; anything else is a failure
>> + * of some kind. The memory subsystem will bitwise-OR together results
>> + * if it is synthesizing an operation from multiple smaller accesses.
>> + */
>> +#define MEMTX_OK 0
>> +#define MEMTX_ERROR             (1U << 0) /* device returned an error */
>> +#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
>> +typedef uint32_t MemTxResult;
>> +
>>  #endif
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 400dd44..1dcd312 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -112,16 +112,6 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>>      n->end = end;
>>  }
>>
>> -/* New-style MMIO accessors can indicate that the transaction failed.
>> - * A zero (MEMTX_OK) response means success; anything else is a failure
>> - * of some kind. The memory subsystem will bitwise-OR together results
>> - * if it is synthesizing an operation from multiple smaller accesses.
>> - */
>> -#define MEMTX_OK 0
>> -#define MEMTX_ERROR             (1U << 0) /* device returned an error */
>> -#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
>> -typedef uint32_t MemTxResult;
>> -
>>  /*
>>   * Memory region callbacks
>>   */
>> --
>> 2.7.4
>>
>>
>
