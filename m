Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp76207wru;
        Fri, 3 Aug 2018 06:31:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfnDW7BBFtgvP6vyVF2fTB8ksQX0cW3i5xVJQmMkmVhPdogAx58fN9RWBSV/oq36/01Pyyy
X-Received: by 2002:ac8:4085:: with SMTP id p5-v6mr3889166qtl.14.1533303107976;
        Fri, 03 Aug 2018 06:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533303107; cv=none;
        d=google.com; s=arc-20160816;
        b=HaSBKq3l+3UxNU5ZPUbO/Iif2KprXZ2QhOyhEoRuR+LssOhsU4jw0ypQsVLyXAGJVe
         o+v5/NLCVDxvH4r6N2ZVnhMsalc910otzt2DzDMxK+DvaUs9RXL6ToCJnMc8BmmuSjHc
         xSUZrRr+zF+bT52uQlzIQZvMBiGCHu5qaLZwc+g7Eg3c3iYaQWb+Lj5ZMFjhqNzo6XOw
         jNQjW07ZjGYSLMnikk/qfwa3C9ZPmQ7S6GE8AIwOkvikAwMTT+IHWyp3sl33n3OM4XEt
         VxIWAZoYMEOehyD+LUJXMb6e1cWpuZRHr1ZppuUSeoeLYumLmrGeNAAlFBdVets9+HLR
         lY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rTi6Ox/g936zlCvjnrqJNoXBWpwJrsptTd9bI+HcOlw=;
        b=oLmznicOJ7kPbGGNw90A63JtUOoBjOxSfiW+6dTLaAHOYb6f0+jtRmyxDgSvw79JrQ
         M/ijpbzVba3zD9xYvubKEIPDf/CeyBoAx5lImnyJJ7V9uBXG65uU+Lm8hYmNGurJGFGP
         2GALMbZzFmT4fly40hSfGYL9YsIUE4QETXLHwHY7Jt5XExx41hmIDkTXd3wOLadU45vj
         TphhlKty4gt4CsqM4gE8VZBJMI1+jBFzF9ng3ForT5b8rMYJIOMyRSfmX4PdGKEbTdVi
         3NRAsMzOU9r7cdRnqxxQHQGZbeIg3qwitKy8n4oJxik//hAYfP/pRUN+r8PP5GXIhE1H
         9QYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bh06mqS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3-v6si277385qvl.167.2018.08.03.06.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 06:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bh06mqS2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flaBH-0004lo-Da
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 09:31:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1flaB5-0004lC-TI
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 09:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1flaB5-0007dC-5S
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 09:31:35 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1flaB5-0007cv-0U
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 09:31:35 -0400
Received: by mail-oi0-x243.google.com with SMTP id j205-v6so9828550oib.4
	for <qemu-arm@nongnu.org>; Fri, 03 Aug 2018 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rTi6Ox/g936zlCvjnrqJNoXBWpwJrsptTd9bI+HcOlw=;
	b=bh06mqS2apU89V7uY3hmTN3P5D6/EO+uZh6MI1hhlY8RdCnE8RsH7chskNvgHQRcqN
	WLBOSJO5Hw0GQjNiTsBcpNW+LJPN8nbLkUM7RgWO4e6Z7xhIgnvQmDvhG1QMkQ94EJoM
	jmAoZO0fgMdGgsWpfrMfGnDVT9Bg9SuI4XHj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rTi6Ox/g936zlCvjnrqJNoXBWpwJrsptTd9bI+HcOlw=;
	b=MKtf+iMKgOFGs9tj2tjJPdNGjmGRtasiX5oGbEZSSn4nt39cugUsYYxDhFPihV47ZM
	ERJllAbfviETv5oiyUzqxaHcFZQcgBjcWXQ8LAYS+lG5x5YTHCT+C6G+mHwVqz/iaOVc
	vS/i24qmCYcbjmADMMUDtrk//S175An1MdncbUPlvHBWu0smxRA2qCA9PFuVbI24GcmG
	wofZTz/tk0ocCKrkIU1mYUwlyJh0nlCDyhxsQhqEvYn06GSgypw0+QfccDeUOXeRXnRC
	O7gr3zmChpUflSwOF9yMX6tHygz5RdAJhrlV9oF4RLJY325o1imP5Et8JM6cFxwoiYN3
	EzOQ==
X-Gm-Message-State: AOUpUlEVAsUFXJ9PlbXtESHmEJ4viVjpJLi+OkMZikGl8a6AIpkhw8aO
	QRsg4beQsVmOL+GMBpQ7GfEr/pl2MW8Nk0mxjuE/ow==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr2947850oia.164.1533303094130; 
	Fri, 03 Aug 2018 06:31:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 06:31:13 -0700 (PDT)
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Aug 2018 14:31:13 +0100
Message-ID: <CAFEAcA8nYGquX_AT6i8ZMKfYnP=TuSGfhA6q6btgbPkUUW9NDw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 0/4] target/arm sve fixes
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mfd1RFX4b8IU

On 1 August 2018 at 13:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> These four patches are minor, reported by Laurent this week.
>
> If there happens to be an -rc4 release, it would be nice if
> they were included.  But if not, no biggie.  I suspect that
> other minor issues will be found past these four, so I would
> hope everyone who cares about sve is just as happy working
> from a branch anyway.

Applied to target-arm.for-3.1, thanks.

(I currently expect there will be an -rc4, but I only
want to put in fixes for regressions from 2.12.)

-- PMM
