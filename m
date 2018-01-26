Received: by 10.28.71.27 with SMTP id u27csp726322wma;
        Fri, 26 Jan 2018 05:50:42 -0800 (PST)
X-Google-Smtp-Source: AH8x227+FXC2wMcOCq5QXH9z2Ravd7GXJPg8MkKAR6olBcQJ+dwRIkXsM7m1rykkkgKW5Dxf1AEs
X-Received: by 10.129.228.73 with SMTP id t9mr10803048ywl.354.1516974642130;
        Fri, 26 Jan 2018 05:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516974642; cv=none;
        d=google.com; s=arc-20160816;
        b=jxS69iDBrd18Fhb3fdhm4bmIYDZW0pxR+NYpnF/0lt1yewsaZ/V9u9KkInvUhugIoF
         KXLdU5sMK1jvVE+Her4VHveC4nMhxQthTZGWSAE+YM1cGW3ExYJOejcbcJcPocnPJjqU
         pOgAuN8t+ZW+vJo62RgpylPP43vwkgBADHv8uszkO4VExraKPkKaopqknCf+CSIHEwzX
         sN6PtuEO1aP/Qum/iv5c/9To6wG0O4BfS59bAsyWoWf2gBo9ndywb6WbOL4vWuyFOthQ
         L0TuK+1Yu5p9VLs4Rf6IrH0Gl8gP+azDnnpc19hA52KNp74VATHS/uwLnPOMdpVhq7sG
         D3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FaNRZy9NX69VZ/TlZpxbEKWTFjvHxnYYcQPRa4elJfM=;
        b=Ri9DrY7f/Y4yZmeaWm6wggI0Qj8ItF0/+kUW6XjUxHbbgO/HhgT/OtVF25joJMD+vC
         EHZcVRE5FR0gxE6gE3z9AkFtJWKwby0aoQPLWZY5tT/SMt1/lWh1ayoJsu1hqry4lJVK
         N699xzpL517CVoXvqNrQ1Z+4aI9P9B9VDqnvPXfqYf+4xL4dnNz3QjbXxkxcvz0yuAHt
         GtjBH4gth7uycMgBjPQ6UFOkCAppCsB179kbvBKaPcdEEbF8K/dgYSd2iM4bZ/dCGbZX
         fPrjcN8jIolD2Oq3IfnAfYpKc1nzpvj8z0gNnVVJuafGDwzXXL5oWv6W6JuwFDZc/E+X
         APuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KAvSKeOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z11si899678ywb.158.2018.01.26.05.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 05:50:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KAvSKeOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef4Ov-0004iN-HM
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 08:50:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef4On-0004hw-KK
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef4Om-0007kk-C1
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:50:33 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:39633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef4Oj-0007iX-P8
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:50:32 -0500
Received: by mail-oi0-x241.google.com with SMTP id t8so335904oie.6
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FaNRZy9NX69VZ/TlZpxbEKWTFjvHxnYYcQPRa4elJfM=;
	b=KAvSKeOR1qyehW9sUrYMPd/R5lQHVpqNUAgp1EWczOAh+82OV0YcXy2I8czQ4Yt0es
	i5omaw79rhf/DMrQPNUm1Hojo4UG7cLMjZEpRvMS1a3yHXpUpSKOoOCNiwjbT6A/SYIK
	lQTwQNnEq/EKMHYKolPyWIKjMaW4q7kJILjFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FaNRZy9NX69VZ/TlZpxbEKWTFjvHxnYYcQPRa4elJfM=;
	b=ca+TuWRTPQ2e3gdlkSCxJiOdS53hRbc2EBonTWBt5adlZkbfzRcXgWkX5+Fmp5sz5q
	JgeRHAqaAx//PYZwF9hRJUwFKbpzqzvnAtK33YBH/VPEu/cGLBpW74rd688H/naggAMJ
	yXfPgdV/Yy9sK87eHUk7cpOXvSVkBej9wwNb4AyNvnKkgyTVA7pxzzUqGpZlq3ZHWCsE
	/NBmC+T/TXRfP/yzp0iNSillFhoBqHA5ZMghRpFHW+2IePy0BhyN35QLdYXJ9uvhx0ns
	N7grrJV+geUnXPnRp2+X3yEBtwCK7QROZcnLviOlwxdXk1tRlgO6XJCgXxqSs19eV8np
	dFgg==
X-Gm-Message-State: AKwxytfZQ/weMABcanRXl814usRMsjbCzyQtKlZfbch+UuwsxUSKSf5j
	mG/qiSPnFT2M2BFObdYclInMc8GvSXKMBz4Mp95eXLji
X-Received: by 10.202.96.212 with SMTP id u203mr3436438oib.63.1516961166013;
	Fri, 26 Jan 2018 02:06:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 02:05:45 -0800 (PST)
In-Reply-To: <80dfd9f6-e104-918e-9a31-bd22e9990f4f@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-7-richard.henderson@linaro.org>
	<CAFEAcA9XeA6Osy90-NH6rzPH5o7DdPvAwz9iHWxVOORy9KRU0w@mail.gmail.com>
	<80dfd9f6-e104-918e-9a31-bd22e9990f4f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 10:05:45 +0000
Message-ID: <CAFEAcA9qpJD--HYNaGv45CBU2To=D0brsRmkgkcZj-v6zXz5LQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 06/11] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
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
X-TUID: e1e0NW8fIDnz

On 26 January 2018 at 07:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/15/2018 09:47 AM, Peter Maydell wrote:
>> On 18 December 2017 at 17:24, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  target/arm/translate.c | 38 +++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 35 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>>> index a9587ae242..1a0b0eaced 100644
>>> --- a/target/arm/translate.c
>>> +++ b/target/arm/translate.c
>>> @@ -6973,11 +6973,43 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>>>                          }
>>>                          neon_store_reg64(cpu_V0, rd + pass);
>>>                      }
>>> +                    break;
>>> +                case 14: /* VQRDMLAH scalar */
>>> +                case 15: /* VQRDMLSH scalar */
>>> +                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
>>> +                        return 1;
>>> +                    }
>>> +                    if (u && ((rd | rn) & 1)) {
>>> +                        return 1;
>>> +                    }
>>
>> The pseudocode also has UNDEF if Q==1 && Vm<0> == 1 ....
>
> Not for the indexed version, encoding A2.

Ah, yes.

>>
>>> +                    tmp2 = neon_get_scalar(size, rm);
>>> +                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
>>> +                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
>>> +                                   TCGv_i32, TCGv_i32);
>>
>> Can we define a typedef for this, please ?
>
> What would you name it?

NeonGenThreeOpEnvFn would fit the naming scheme we've got
in translate-a64.c.

thanks
-- PMM
