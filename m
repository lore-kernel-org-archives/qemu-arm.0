Received: by 10.28.173.206 with SMTP id w197csp915840wme;
        Thu, 11 Jan 2018 11:28:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBosYyClsyKDrlXpkqmP1oS84YgmMZIxMIzqaJeh/s+D5orb3fnOGIt8dFQJmAruO3EF0e6Qt
X-Received: by 10.129.76.4 with SMTP id z4mr21418203ywa.255.1515698886390;
        Thu, 11 Jan 2018 11:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515698886; cv=none;
        d=google.com; s=arc-20160816;
        b=so61OTTx6HER1C/QBaSfKxoFORJHX4W5Nqo04TmLlENrJEnfODtxJJcswvbQrtW8yK
         qosYtF0vrjxbXx6/5XoFdtYOiGUfJCTF9MPBe1M92WwF1qU++UzkY/gJE16gFepHAOP5
         hAiFQQiFyg4dc6yIjgcE6DJdcrFv1K5I0hvm0edoSFrxISrPY4KRwmXj5S7wCzhtDUT3
         4VAff2R5FUvPV6MZaaragcpBZ+uQNzZZ1PvYQNegaiDWr6JZtQ0nZPuejZG0vB0GUwH9
         D0On8HENNWercVlHEsmo9tWaAub7U2/z8n1VnCB3NjF7obq8c6yvPfAhkN3zFqNTlhLC
         eYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rn+fjIcPdVcQGV/2lRtwhTj075XRWhhZv4fGdLX2k+c=;
        b=0a7PdmLiyZc4cWkmjiCPEjr9KqYfpkb/BDeBCztovecOXMzEUjLArGfDLsbWCPc43h
         Tlm3wst7n5SQPw8QTmbVN37nq7iFjg5NgHfMkro5Amgphbe+IhsqJzizoObjGd+g5FhU
         CQ14yxA3eXqYDCM/Yxwb4amA3hAjYISnV3NJ8oiStwZ6njdtZjOlv+s0e9wVDIkvu5kX
         QDV5D9MWXDgtpIbwJk+y6Wci38bOtVNwRWIdXvQsONZg2U6A+pEq0hyViCeOdv4VzSdg
         dcLFEx+V05tJ7oHnvl7afS9akZi5+EqYQUPTpKb48atmuhQJwWuHJvhPXexmfPp3Vhm+
         GbNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KWSZZ842;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x126si4041680ywe.732.2018.01.11.11.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KWSZZ842;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiWD-0000gW-PU
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:28:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZiW3-0000en-0n
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:27:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZiW2-0002Nd-4H
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:27:55 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:43919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZiW1-0002Mu-Vo
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:27:54 -0500
Received: by mail-ot0-x22e.google.com with SMTP id t28so3059583oti.10
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rn+fjIcPdVcQGV/2lRtwhTj075XRWhhZv4fGdLX2k+c=;
	b=KWSZZ8428uusFpOKLEbxo+HDYtT5PaBTWyl2VHMzkdzgbJFQH1ayDPIcwe/RN/f401
	QIHL2KNmRWoSSIyG4hGHng13JXEe94sjsMDxuThKCyDUIwaN+8SrF47wkE9zEUikUnXB
	F1WXEV65aiM4lituz6F2vFeLn9pX6MnjNadq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rn+fjIcPdVcQGV/2lRtwhTj075XRWhhZv4fGdLX2k+c=;
	b=l4dPlg66ESP6F8cVvQCrcHzgtnLViC6kLYCxcfLrr8UrG400bWr85e6QBLhAkNJMna
	NDh3yFqWZRQzu1pRNBXZ+NlKESFq6RO47b2xSHHAOHzJ9ntGf7r6ajFCfmwoCtvajmzQ
	CH9T1cbeCzo9vct9vMWmDAFEmvIadoA+Da92+WJju+x7ZzvUwFx4V7r6JgMhrDchZEyy
	cJctUem7tyekmzy6Lzs/U//ct059fodA2tT+yMSwBHaxOK/LhC7Zly2wdC8ioe46eId8
	67aayW6m1+BdYIVzHPYsbKbokjP6FLDFmRNKPTsaUD5HTIjuWGm6stYodW/LjRdFkZkG
	6TUQ==
X-Gm-Message-State: AKwxytfuYyKgFa9njKcBEqyx6RzC4OvrgNFqW2vjRGvE/xRg0uo0GTNv
	KFOWjlhbM3fOwJqmsZpX+uH8y0kA5cLeOKDzyCqzig==
X-Received: by 10.157.51.76 with SMTP id u12mr3694088otd.197.1515698873249;
	Thu, 11 Jan 2018 11:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 11:27:32 -0800 (PST)
In-Reply-To: <f82e02e3-40dd-8e74-6fe5-3205cdd42758@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
	<f82e02e3-40dd-8e74-6fe5-3205cdd42758@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 19:27:32 +0000
Message-ID: <CAFEAcA9eNzA9Yar4SC5UKWzMij0ypyXKATRqU1pVx8UTf33u7Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [RFC 00/23] target/arm: decode generator and initial
 sve patches
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
X-TUID: Qq/1f51EhtEL

On 11 January 2018 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/11/2018 09:56 AM, Peter Maydell wrote:
>> On 18 December 2017 at 17:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> The most important part here, for review, is the first patch.
>>>
>>> I add a code generator, writen in python, which takes an input file
>>> that describes the opcode bits and field bits of the instructions,
>>> and outputs a function that does all of the decoding.
>>>
>>> The subsequent patches begin to add SVE support and also demonstrate
>>> how I envision how both the decoder and the tcg host vector support
>>> are to be used.  Thus, review of the direction would be appreciated
>>> before there are another 100 patches along the same style.
>>
>> This doesn't apply to master -- do you have an example of
>> what the generated code comes out like?
>
> That's why I gave you a link to a buildable branch on Tuesday.

tgt-arm-cplx ? I had a look at that but it seemed to be a different
set of patches to this lot.

thanks
-- PMM
