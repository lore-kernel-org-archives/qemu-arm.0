Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp549334wru;
        Wed, 15 Aug 2018 03:59:28 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzAgHjW+xtbMjkhiBrqxUhYfdjuJ7c4v/krW4EY2vDVAfNyuX7ciM5VUMT74V76VbcfQ7Wy
X-Received: by 2002:ae9:ed82:: with SMTP id c124-v6mr23560544qkg.303.1534330767969;
        Wed, 15 Aug 2018 03:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534330767; cv=none;
        d=google.com; s=arc-20160816;
        b=0vIm5kLpsh9EHR/Fzhw9ksLNqVQ/jdxkCzuyntqana1tvwcjk5D1/mlefymucaHnY8
         XwUn6IAHn4JMwDWzm6wi2/Hz9L4uMQaPg3mq75ZjrBUYXxQ5dgpCvHW1ff2OvNsiEfKY
         sPZxDMCNrJd2GRf9M/ZImdr5UQ3obBu+3wDLdUFO1HolAPj8XBxjOL227vau3lOM7LQ2
         pTnqOPNcM5qapVZTfsTGHETCyeNwu7te30N72ihJ3JJ8rhsCRN7lSCPQtLBTKfsVFInC
         FFy59k/qMAzqvcIwW9ZnpwbVxnh4ow2Rz+XPHXip6PP+iuYVx9dhWZk0wQc9lQwD0wal
         fveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9Rb9hlFxof67mdrtetm/VxsDD975nhbflYUmkKLe+jo=;
        b=eE+W0FVTOKyS+H3YxuX6qNEJCG7wGpjX7bFRNpTXyq9BaklLoGfg2hj2GaRJORRfep
         wZ3RygAEPk+cD5rtnWM0E46DOzfMBsZSSYMlYKckeOHZkSBprC2dlJ+Yf7mM1bbTTpaN
         nwU9SFQUOgwmnf2z8JAGCnLp+8LOr0z4+f3YdXVgJchm9mMw8pua/lYhxlhvEa8KQXr9
         BwQuhQoqpHQzkAZSMEYl0SVqhozFKYpladlgD9/0hLx9JP/t99mJlCUf1Mstg6Nby+mx
         JCWYbSyVIN6Zl7rD6qAOqE06aZ4Kk8fPwa4/Yf5vu1OGNJAa66FyfkWXCnSfqI7J0chN
         f0eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKKhkTdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13-v6si5132899qto.159.2018.08.15.03.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 03:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKKhkTdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptWR-0006li-Dp
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 06:59:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptWH-0006kM-Bh
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptWG-00058x-6R
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:59:17 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fptWC-0004yM-QG
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 06:59:15 -0400
Received: by mail-oi0-x244.google.com with SMTP id j205-v6so1267458oib.4
	for <qemu-arm@nongnu.org>; Wed, 15 Aug 2018 03:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Rb9hlFxof67mdrtetm/VxsDD975nhbflYUmkKLe+jo=;
	b=kKKhkTdJVeI88EE7NMa9DfXLj+ohf4r2k39yLtBim0kmP+xfoxdcsqblIIo7dq1wxv
	IkhGhATFYxjlzI7GGpfA4l1rMKdzQXCivpoEXJU4Quq8NFD7kX1ektWm5CJmhgsDl7RJ
	iVR+QGRzbdrRjFIZaJQFCWspD4vJyVSiCub50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Rb9hlFxof67mdrtetm/VxsDD975nhbflYUmkKLe+jo=;
	b=dna1J9Ym5n5UiWQWxO/xbiF3rbHddfxsS+Qc2YetD/IkbKFfD1Y1T1NYUkd13aWb/P
	ajPvLzyQPoqAyAETxjv9gYg6FHeI6VrV5aOexNceALe3UBwnMFa3GoQJxWZ4ekcRvaKn
	pj1pR2k+W8zZuUrXcxohl99sI8M8akONfPEeX1P8yZSb7ppyE2Qy0VPWFpS4e8ZgRPa3
	LpFOhv2nV1Gx0sxvpugqzqBSB9wRnd3BVqsmBz1Hmi1+9dDr9VYDzvH/qxPNeMHb/P7l
	MTLNbcGwusL+c8eTUvVeBH3fEHhNv+TaSYYORhr+KIMN09e6OmQkfz7+QK6gO3uI+Ehb
	Mh0g==
X-Gm-Message-State: AOUpUlFSOLVdUh1hBtXwyGFoHMWwakiRRsyv6eVZFX0/W6IxjlRXM3Xj
	WQDIKGHqPkPHeYclK+6EUmhitziALmh5a8gQoLStOjhHUY1jYg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr27807373oic.252.1534330751212; 
	Wed, 15 Aug 2018 03:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 03:58:50
	-0700 (PDT)
In-Reply-To: <20180815105430.e6satguezkvfudf5@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-11-peter.maydell@linaro.org>
	<20180815105430.e6satguezkvfudf5@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Aug 2018 11:58:50 +0100
Message-ID: <CAFEAcA9xhUQt72bgj9kCJsKSFPeywsSH0usXYqbYhmexO33yAA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 10/10] target/arm: Implement support for
 taking exceptions to Hyp mode
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
Cc: Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0oY9EDYqHrRb

On 15 August 2018 at 11:54, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, Aug 14, 2018 at 01:42:54PM +0100, Peter Maydell wrote:
>> Implement the necessary support code for taking exceptions
>> to Hyp mode in AArch32.
>
> Hi Peter,
>
> A general comment that I think this would be a little easier
> to look at if it was split into two patches, one non-functional
> change to break-out take_aarch32_exception() and then another
> patch to add the new logic...

Yeah, you're right. I'll split it.

>> +    mask = 0;
>> +    if (!(env->cp15.scr_el3 & SCR_EA)) {
>> +        mask |= CPSR_A;
>> +    }
>> +    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
>> +        mask |= CPSR_I;
>> +    }
>> +    if (!(env->cp15.scr_el3 & SCR_IRQ)) {a
>                                  ^^^^^^^
> I think this should test for SCR_FIQ.

Yep, cut-n-paste error.

thanks
-- PMM
