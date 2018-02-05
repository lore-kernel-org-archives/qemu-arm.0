Received: by 10.28.71.27 with SMTP id u27csp2699296wma;
        Mon, 5 Feb 2018 08:30:50 -0800 (PST)
X-Google-Smtp-Source: AH8x225/RImC/WUOM2mXYRc3Mr1OqYdC7yswPs5L49o5c2xDE0Rw0MvU+IJstRQX/OEi0m4o8AA1
X-Received: by 10.37.173.132 with SMTP id z4mr12574707ybi.263.1517848250580;
        Mon, 05 Feb 2018 08:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517848250; cv=none;
        d=google.com; s=arc-20160816;
        b=Wy7uugiBUA97B2ybg4DndTE9nUBwmInqTn1SWdUFkyk9QDvv69+D2/p0emtxgbVNLT
         NWZDFKCciquN74wvXKf9IWjp9fWU+CMy/NccxvJZMqJyKRhoDmNabVt3D3/9u0iMCx7i
         n9Tk8U//TGNA1kFPeyxqKQ7xQ56xNcsa2uctn7iD5KGkscX+AKyrWDWqXP4IKmv2FoNz
         hi0l3QbjlK91/L3VkpQHG2Gow/kSHESBveiCn+pOt3WGb6H4iCFNzAK/kLIGuVH2usR7
         XdCSrxTDppoWE6gVrPsEhxwyLSsObbkyb/aAjuVcZpU/mhkAiFjzrVOZcfcR0Pw0Yg5s
         nGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=R/9KBjYbGDKIQqWHMabMLXyPWpJ3FipPdi9gBGmXotc=;
        b=tBsEbc+RtcRGibpaBgOVStmBFMMPP65oryKW16jYnRd15xhRmLQLKQDXawqI4gG0gS
         DvNS2pB6d3FeADx1+4e+Vdnh9Wpa9mrhASePO/FQ2ewUMV+ZCdzFF/NIP3Ckx1grNTYP
         x9RYboY5boajB0scj203DgRBAlXiuKZlwwy3bDIIN4YOjUaS3KerHXHAjVEepT/t5aoV
         qQBtGDJj+EP/NdBB8U2ng4/ffVROLsf6OiMg6eXlW3U0rELLAXHajeb2h/0Uu2n6XBkt
         sDnNWwyk0ON21Wq0Lh/kh5uFaeNcLdKLJm1STbxwAJ4JwRa9snrjoY3q00yzsQFDgJ3w
         SYmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jjQg0gdu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si1168904ybn.807.2018.02.05.08.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 08:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jjQg0gdu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eijfO-0002az-0V
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 11:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eijaT-0006VQ-NL
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 11:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eijaS-0004fJ-Bf
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 11:25:45 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eijaS-0004dj-5e
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 11:25:44 -0500
Received: by mail-ot0-x242.google.com with SMTP id m20so9031346otf.3
	for <qemu-arm@nongnu.org>; Mon, 05 Feb 2018 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R/9KBjYbGDKIQqWHMabMLXyPWpJ3FipPdi9gBGmXotc=;
	b=jjQg0gduSlYqwgXe3lyC1H2BlCVoLsA9l2WOjHJ/1p0dH4aJC+Hv2jc7unCUMeR0kz
	7Af130IwAhEWY+Z/H5wjRGrDeVhxHvcV1bctPXV2XKO2nzVJWHoFjTtmbJZOywnZ4QTd
	qjvSe3IzNqcX5JBcyZryrQ3w4FcayuP33RIzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R/9KBjYbGDKIQqWHMabMLXyPWpJ3FipPdi9gBGmXotc=;
	b=a5NcQP11vW4CVjfnYqo9syxXjE65FQOwGtTCwffHZGN9pxi4abCBGEBr4TaQxM+Y9T
	BvTMyG5eo4kijJyQvSdQq6IXSWoEaTJcOpKAsmRrExyiF5446Gub5/kI+BqO7m+y9NmO
	AzFvBlHeblnPmzlopUIK7ILPaYiUP6/1bwi0b99vSimiNVmc+hheUeKFGN68005ryf5m
	+n7G4ajgZBLmGWet2srABct6707UzTzr4aM3f5Su3wEyXUbLKL4HMVR6k45B+qHyRNWk
	IS0KBPAzaMVjvEiNtY6OVenibzDNKOtmuiKAV9MxfuJ/3NIFlY+G0L4Tot9yG4KuLr87
	3teA==
X-Gm-Message-State: AKwxytc4BrjgCDHDnZ11IZ4oiY1Gdb/pEThIaBVHuIy7OgNAVF7B8ctG
	Amwr76oMa/UMG+cUsagRN060fVVhM3eAt4uzrACGYQ==
X-Received: by 10.157.68.200 with SMTP id p8mr17288963otg.91.1517847943451;
	Mon, 05 Feb 2018 08:25:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Mon, 5 Feb 2018 08:25:23 -0800 (PST)
In-Reply-To: <3659e9bc-4b71-4785-22c7-e4cb97d7b241@amsat.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
	<20180205105720.14620-9-peter.maydell@linaro.org>
	<3659e9bc-4b71-4785-22c7-e4cb97d7b241@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Feb 2018 16:25:23 +0000
Message-ID: <CAFEAcA9oCtpGWJhuV-j8tn=gK8NMJwm-wcA5L6J91xyDU-ATKQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 8/8] hw/intc/armv7m_nvic: Fix
 byte-to-interrupt number conversions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /p2tpgSyJi3+

On 5 February 2018 at 16:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Peter,
>
> On 02/05/2018 07:57 AM, Peter Maydell wrote:
>> In many of the NVIC registers relating to interrupts, we
>> have to convert from a byte offset within a register set
>> into the number of the first interrupt which is affected.
>> We were getting this wrong for:
>>  * reads of NVIC_ISPR<n>, NVIC_ISER<n>, NVIC_ICPR<n>, NVIC_ICER<n>,
>>    NVIC_IABR<n> -- in all these cases we were missing the "* 8"
>>    needed to convert from the byte offset to the interrupt number
>>    (since all these registers use one bit per interrupt)
>>  * writes of NVIC_IPR<n> had the opposite problem of a spurious
>>    "* 8" (since these registers use one byte per interrupt)
>
> What about using inline function (suggested) with those comments to ease
> code review, since this code is kinda confusing at first.
>
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> at any rate:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> ---
>>  hw/intc/armv7m_nvic.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 8726be796e..9433efd1b8 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -1721,7 +1721,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, =
hwaddr addr,
>>          /* fall through */
>>      case 0x180 ... 0x1bf: /* NVIC Clear enable */
>>          val =3D 0;
>> -        startvec =3D offset - 0x180 + NVIC_FIRST_IRQ; /* vector # */
>> +        startvec =3D 8 * (offset - 0x180) + NVIC_FIRST_IRQ; /* vector #=
 */
>
> static uint32_t off2vec_rd(uint32_t offset, uint32_t base)
> {
>     return 8 * (offset - base) + NVIC_FIRST_IRQ;
> }

This function name suggests that it's for reads, which isn't
what's going on here. The 8 * version is for registers which
have 1 bit per interrupt. The version without 8* is for
registers which have 8 bits per interrupt. It just happens
that we got the reads wrong for a bunch of 1-bit-per-interrupt
registers and the writes wrong for an 8-bit-per-interrupt reg.
(I have a feeling this is something I noticed at some point in
code review of the original author's patches, and then didn't
realize had been not quite corrected in all the places it needed
to be, and overcorrected in one spot.)

Also, if you hide the "8 *" inside a function here, you lose
the fact that it parallels the multiplication in "end =3D size * 8"
in each of these loops. So I agree that it's confusing, but
overall I think it's better to have all the logic in one
place so you can read the whole loop easily.

thanks
-- PMM
