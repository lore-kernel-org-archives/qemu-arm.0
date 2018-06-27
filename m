Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6298159wrq;
        Wed, 27 Jun 2018 07:35:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpccBkd3nzyBujTUYVY6X2NAEx6qO7MY4vfBHwnbPa0jtvPZvPBforoCxv2+VX4LDlKTzN0X
X-Received: by 2002:ac8:249:: with SMTP id o9-v6mr5657080qtg.355.1530110150608;
        Wed, 27 Jun 2018 07:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530110150; cv=none;
        d=google.com; s=arc-20160816;
        b=WtvuUX/NvNSLdNuSRvHZvA4DqLZIyfW3M6TS0Dhwosx2UOBd4VlH2enIGtNxk0X/yM
         U4NvukknKQmRlY9U2ugLG0Md8nMTJHxyx0txawTi6EL832bKH80KnVp1yNLuLoN8Krse
         66BU65mTVyYVlCZ/7Gly7mam9uq8apJtJW0ZeSsHhlZcp9nzRo5YlvRivwNGaKD3XCMR
         o6QNOz8XEml6ZIshDhgsT3u8liybPiovN4E/lOIsV9Vxc2sr1GTsYQpkuADIn8z42GZH
         /Viay2jALQ6zImm4/SUjGmQfL16YFT9kli78QtRaB6xDmO93NOvpEWiJWRYJUTWEdTka
         ESHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ZIVMJc9dfGTzv1gfDzpo7k5lOmE/8CQgi5gktB0W28A=;
        b=jP2PZX9pEJV303+ndAGlSD0ZRS7sYpuZkBRtk9fl4UWIM3xr91ChPbDivRxdyZCMRC
         egIRPdadaQuQJZfYKCE9kYUk10c031NV9RkE6jXx22svLQf5XpxR7QKX4zpUUCu6/ny7
         CkksYs2KwBZdWm7BmLNMOxyPZ2sNj4K9kRtFRNj7m5ilGkamQHHX3xAjV75GW0gUix85
         OtyvDVg92wkicultKa6T/rkxaIhapdtNfynQyj+QA0VCM+b7SgmagrTjzcPtsPJivbCC
         Mdwgh1SesgCOuGdglhuck4vtVsJBz1dsAm2xr4JfU9A8PXQgGG1h9tHXVLvXEW1USLPW
         QFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b/lDQe2D";
       dkim=fail header.i=@jms.id.au header.s=google header.b="J2525V/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d3-v6si312719qkf.178.2018.06.27.07.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b/lDQe2D";
       dkim=fail header.i=@jms.id.au header.s=google header.b="J2525V/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBXx-0001c8-VB
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:35:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBXn-0001WR-Um
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBXm-0000xm-JV
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:35:39 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fYBXj-0000s0-PV; Wed, 27 Jun 2018 10:35:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id o2-v6so1134379qkc.13;
	Wed, 27 Jun 2018 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZIVMJc9dfGTzv1gfDzpo7k5lOmE/8CQgi5gktB0W28A=;
	b=b/lDQe2DVPzPhP6Oq/HKqBZ5BKH3Kv0AW3VbCRO0PeHVpKLai+L61AqK+ITCHPXz+U
	Ox99aRhnUQbj1y4dYyXghxTkzeIgsK11FluTN+gDBnZP2XeVg/FzDwxvMEPCgw0cyPum
	jcPUk8vR3RpmhzNcn5golB61gJY9jY9Qzn1gF3cU3WAwFES1Hyq6FWEIUMz7qGGm9sfY
	/aiNm6lLmjzb2RNjCSvSt282lY8W1gwQonHQnvCYqy4cJx+V9q5+hqSlIJdAicMufkI5
	Zo/IvjhWHNXABUgrm0pBhla5xZRLeXVlGhGHgfYCaE2wcCEfE2bdsQvJjGQizuO6TeIg
	jRCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZIVMJc9dfGTzv1gfDzpo7k5lOmE/8CQgi5gktB0W28A=;
	b=J2525V/aRzJ0swEC8hA/8hkXZ/UYYMlbQJGoCMGRdO8JubH0Jz0F/oFUyLdM8tj+Xn
	1PYl2LmuGljbyszu3Mlhuw7qxV4vWgeRqwk9WAOdZXHQY+tg8UihZgxcNqPysa4gjsWU
	Nng9/Vapd8quhnmL6KG+wDoDZkNhE+tlbhyV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ZIVMJc9dfGTzv1gfDzpo7k5lOmE/8CQgi5gktB0W28A=;
	b=cZmsP8ro91bEGTjekNojpmEseJ6UrSjETVBr2H006/oB8lnOFh5p6EEJxCPugKmAQV
	Tuehl7kfYQQCExakZ96lBcyLqyIScoT2EE2icPlB1o2QJF4syQApfjGrKBTVvTE6U5X6
	J2KGAa7WV/WSlqY9h06Aos9diyifPDa5Bsg0PaNuaefpmbcFHGTVJoFnWCs+SuI0Dh11
	0JGMFEWWsx2XgUlEgbeIXlO2qT+MzBlL3vNl4AzfLznCyL9AoLxEwXN7bZlEj81viSxw
	Pl8RKknt0VL08YmQH6wkKLglkqnVb20r2lmZ9NHOpRXTXk8XLNsNMFlaiTsXZiiKdAn8
	2RkQ==
X-Gm-Message-State: APt69E3EzPXBjEC+nF2fd4d7u2cKQ5Ou9XR621r5cchDNndbykwCegQK
	28J8g+gcutlTx7fw5BTBVs8XYFWKpbM0iYy6mAE=
X-Received: by 2002:a37:6983:: with SMTP id
	e125-v6mr5250854qkc.352.1530110134751; 
	Wed, 27 Jun 2018 07:35:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 07:35:14
	-0700 (PDT)
In-Reply-To: <CAFEAcA_dP5QRrZoX8P67xjNVpv7QssnMP9yd5sXqAEu2tQ5Lww@mail.gmail.com>
References: <20180503090532.3113-1-joel@jms.id.au>
	<CAFEAcA_dP5QRrZoX8P67xjNVpv7QssnMP9yd5sXqAEu2tQ5Lww@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 00:05:14 +0930
X-Google-Sender-Auth: joigNxoMwU6ksCy4ZP_FTGqs3QE
Message-ID: <CACPK8XdeN2FBJfcCPV7bi_yq9so-w9z=vW37gyp+Y7sQi_Qjuw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 0/2] arm: Add nRF51 SoC and micro:bit machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIzJb55WmJ7+

On 3 May 2018 at 18:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 May 2018 at 10:05, Joel Stanley <joel@jms.id.au> wrote:
>> Hello,
>>
>> This short series implements a minimal definition of the Nordic
>> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
>> machine that will use this SoC.
>>
>> This work will serve as the base for our Google Summer of Code and
>> Outreachy interns who will work on implementing a number of features on
>> top of this base.
>>
>> I've tested this with a microbit micropython firmware, and checked that
>> it starts running by looking at it with gdb.
>>
>> I chose to keep the nrf51 and the microbit seperate, to not confuse the
>> peripherals that are on the microbit but are not part of the nrf51, and
>> vice versa.
>>
>> Please review!
>
> Hi; thanks for this patchset. I've done some quick overview review.
> It looks broadly ok but there are some details which don't follow
> our current preferences/practices for board and SoC models (we have
> a lot of legacy code in the codebase that follows older approaches
> or is just buggy, so it can be hard to get those right. The mps2
> boards and the iotkit SoC are the most recent I've written so
> probably not a bad pattern to look at.)

Thanks for taking a look. It's taken a while for me to get back to
this, but I've got a v2 on it's way.

I got a bit lost in the mps2, with the different variants and such.
I've had a stab at fixing the specifics that you suggested, but I
might need some more advice there.

Cheers,

Joel

> We should probably not put this into master until we've got at least
> the cortex-m0 model, though.
