Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1757128wrq;
        Thu, 5 Jul 2018 08:49:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGOGtmyXcqxJfylTTdWF5LLPs25xDiu+1rCO+U/U+uC1L6BTx17pER7TLJ5akGtacdeLWz
X-Received: by 2002:ac8:19db:: with SMTP id s27-v6mr6134460qtk.215.1530805796629;
        Thu, 05 Jul 2018 08:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530805796; cv=none;
        d=google.com; s=arc-20160816;
        b=pqfsEOUvk7YoOrgtooqlssQ1rmfGZCEng5vUnqXRRNwhxmOcJgiXvB/G0GKGaeP7dE
         PHZLe62Q04Gop5WFBXe18VgF9PgJgy0Tmbi7R0yXNT44kZgff7/GtSAGsTO971EZyjm/
         4FK2DJs3xWbOF97VY56TrS55LO5RirXD4OA+rqdZ+cYbCxzAC4LsOHF9fvSZeS+zbcIz
         HoocBwcx9ggd1QjoyhNJWeN7QEwe1VHuh7IeUSiNjA7hudiKzA5XJrOcJ0co98EUnERq
         0y54/9AyJIRNmoIep/ZRxs4VWLykOlw6CqifFsBOgfvuOjYKX/wCM446swMyThruspCa
         Fgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=AB8bnWYrCS0AqfeLiL8pynBms0I1yBAppCPu37717mw=;
        b=jBSwfqsut2fZ8iY2gaIiM3+Y/8NnRkwb94v6//mKDgUJchfQdsYDAKn2Wd6/lSuc8B
         L3g8MmrLQfqxTQdWaAX9cTomhtkwu38HP5xPApO3+0v1Ie8Sph2iL73h6M4bQs4Fg5Sl
         NdzoDvF97V8kx1RBp2FCVkrn6+aBcGs5HqOj3sUwzYKXoI8BCZ6162lrqS4Qw8lf+Sch
         9Q0tJtwk9J6/yal8zFU6cMHyvjsZBorQsWrcpOAEBTTiklDAM6evLMPeQTzBRoKfrO7X
         2mngSt6YZTFMhmLW3eIhd9B8JGPiwjp/NXKdyo773Y0WO9nfrQEmAt3ueDPsU5JHPH3d
         EHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V1RQLeF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2-v6si3178862qti.85.2018.07.05.08.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 08:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V1RQLeF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb6W4-0001B5-6h
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 11:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6Vs-0001AW-PP
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6Vr-0006td-UT
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:49:44 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb6Vr-0006tP-Od
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:49:43 -0400
Received: by mail-oi0-x243.google.com with SMTP id d189-v6so17770459oib.6
	for <qemu-arm@nongnu.org>; Thu, 05 Jul 2018 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AB8bnWYrCS0AqfeLiL8pynBms0I1yBAppCPu37717mw=;
	b=V1RQLeF2Qa4z6m9R7uJBqvSkwyIkD5iFYD+23FYO5rtlyk6WC0KoKccvHf9Im9IAk7
	aBOYwIJRx6aaox7IdWkyp0Xiknx/ugEF63yZQG52zv5SHfWyJd9S7YhE2pHMYmM2JoNr
	tJNJRqANpu688Ospl0UIGdyc938AygCE8eEHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AB8bnWYrCS0AqfeLiL8pynBms0I1yBAppCPu37717mw=;
	b=c75J7LnBYMB00jBKeoj6ff49mEAOOm/0AxqVhP3d1hQoxsjTzqzUg1ltldDexPLHNK
	SRZPbHY2Ec79KMc+QgYulPDqUylV2nu059rkDOQLad0t8JTUa59dLr6/ukNJzVGXmdGJ
	qH060IqhZTflQIAZzxkPN9y5tyNntQppp8c4K9L0xQrJJoOT73lmFjC6nbWmu32cumQ0
	PpJHRUKYYzB0PWPNpd5sL77LGY6MUgunlMCSrHkFVl/D7vRjisUFChYzd9jPgnmm+sCX
	NHNi4a+P17C5RChJbA9Jw0qsZCxw3T9cYu5HSBPMpVPopPIeD0zYh/IGeHlgsEuTDGBt
	m85Q==
X-Gm-Message-State: APt69E3csmS60bLypRG7oexeYTE6tNNoZYHOQ/REMOAUHqxkNOJ51LJG
	iEEDtbM03yMadFLZfBkAlcO5FXoLCvgyH1TEXY7/kQ==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr7776138oih.102.1530805783087; 
	Thu, 05 Jul 2018 08:49:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 08:49:22 -0700 (PDT)
In-Reply-To: <CAFEAcA-boywojdasSCZ5EnnGMtETMH7JZw30fOR7fepMQaqctQ@mail.gmail.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-2-stefanha@redhat.com>
	<CAFEAcA-boywojdasSCZ5EnnGMtETMH7JZw30fOR7fepMQaqctQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 16:49:22 +0100
Message-ID: <CAFEAcA8AzjD3f44U+He1Y10p8iNR8EaWODdv3XRUQtQiDdCotg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/arm: extract ARM M Profile base
 class from ARMv7-M
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrcYtYc1XV8Z

On 5 July 2018 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> The ARMv7-M code is largely similar to what other M Profile CPUs need.
>> Extract the common M Profile aspects into the ARMMProfileState base
>> class.  ARMv6-M will inherit from this class in the following patch.
>>
>> It might be possible to make ARMv6-M the base class of ARMv7-M, but it
>> seems cleaner to have an M Profile base class instead of saying an
>> "ARMv7-M is an ARMv6-M".
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> This makes sense, I guess (though it currently leaves us in the
> odd position that we have separate a object for v6m, but the v7m
> object handles both v7m and v8m...)

...though I guess the counter-argument is that the only thing that
the v7m object is doing that v6m doesn't want is creating
the bitbanding device, and in fact bitbanding is optional in v7m
(you can configure a Cortex-M3 without it). So maybe we should
instead just have a QOM property to let you turn off the
bitbanding ?

thanks
-- PMM
