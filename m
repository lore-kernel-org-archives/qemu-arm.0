Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2420797wrd;
        Mon, 24 Sep 2018 04:41:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV611xdyM7hE0GZ7zRtM4/c7CSaHJDKxBzWBsY6kHZvN5ZILRAPSgL2KywSTwQ/LfcCNW2kUH
X-Received: by 2002:a0c:ad8e:: with SMTP id w14-v6mr395202qvc.149.1537789313187;
        Mon, 24 Sep 2018 04:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537789313; cv=none;
        d=google.com; s=arc-20160816;
        b=aQ3AER3hqO45boLQAYwATNJLRUJCl/qGlE079AoFYUswvSuo6hnBE3CAMb6RJqMMyt
         qNUl0dydRRkOOoR4meI+tMkMNpPs9d2hXasCarMcRda7PnQUN5cECWaPEsOIo9xgf+sW
         q1W7IYM/4S7AYH2of7qPRxHcm6LduP9E8HD0orxp0SQLASXvmdz6DxxVNX16hJ50GsQ9
         QNgLhYb7Z2hvpM3HziMtsCeqc7ht858IoQlyi2rVYQuAisk70djvR6Os9S/1QA87POMz
         0EQTSZcZIN4P/ku8cXY7onVvL90EABGyLnJgfWE+WWo63nVuemjAGYPKYZsE19vfqBFx
         WqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=vbX6m08tL8bz8xFiV5rLP31FcmpAel5dYYWENkC19rs=;
        b=eaOGTQFUBTYvsqEPVWO89PpLHMNYcQl9Vyvvd1QpwYl1QuyWP9D0EvTtRG2BYyH39Q
         a6NyIEf87L4hKlaGmjdLGYZsuE7QaeRm0N5TWVsChIlQJc+QC7fFtDTBw42EUXTbuOuG
         b8OBiUW9Zj97sSqTygJIIwsOq2tUsKoDU9UP5oQ1WjJTHNbleXCl35aJHVdbk8T962Lx
         fCCdRQBmp7oi8VFOaaVo1kWoxTeTj89VXWfNYsJQsjbbdO1UzwP3d2pKw/sRHt3isNJN
         cLwP155hbEtdeAi12seloXLr1U5b+Lo/xxg7NV3oxtyqDvN994YxKTyHKfRkqdRVrW0h
         ZTFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0GqpRAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1-v6si6067065qtd.393.2018.09.24.04.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 04:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0GqpRAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4PFQ-0003IZ-0A
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 07:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4PFF-0003HR-91
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 07:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4PFB-0001Mx-IU
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 07:41:38 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4PF6-00012W-TO
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 07:41:34 -0400
Received: by mail-oi0-x242.google.com with SMTP id l82-v6so16593956oih.11
	for <qemu-arm@nongnu.org>; Mon, 24 Sep 2018 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vbX6m08tL8bz8xFiV5rLP31FcmpAel5dYYWENkC19rs=;
	b=j0GqpRAfEugKlJR4to1AzbOXv1+r/Da51kFB3T4kbHX7LVQ08HBNmdepYhAH/hJUgO
	ePZIkqanPgrRZlOYx8z3k2fHjDhWfoDHQGjQWbZX0VlBY3wktykhsRFNQ2G42YCKhnJd
	DSFWyYskZr65dN9vEPD7rCu2bH/zgLgVcxCO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vbX6m08tL8bz8xFiV5rLP31FcmpAel5dYYWENkC19rs=;
	b=ZOo9zM7ttta+2HZcYv7szybOuB2i7MsYuV9bqse1AmkiJHG46hh9aKSBxdqyOQ0EEv
	JJllFlbnaEGKtFbnlC7zs5OWwTYmk4PxX2mQdkRkj4piI0PFqXiPqb00Bi7o8R9wDFK/
	9liO09PL5USe+lpBWdWS6xLCU/8z59adJXov4bb0L2QUw6UG57FpdvuIWKnMI8G/nUCO
	x1DH1UrsIN+48iVuehnfcTXnx/aR8lofQv7gllDTrnLz9VKscZUp1DcGV7Gi9nS6deNN
	MPU0e889MorIHqaTakNlr3jFoG0ugg3uST9gjNyJQlWLX7/LjB9bqcEqwH4+GkXCJjnh
	QpwA==
X-Gm-Message-State: APzg51Bvj9EVaRu+tVLL4lkqTiId9jhxr1qEqAlb1ySxR1944M/lo8yk
	GhPcrxqzJ+m9HTmwXT31iPQ5zJx6CpiLDRUexFK4IQ==
X-Received: by 2002:aca:3bc2:: with SMTP id
	i185-v6mr5415345oia.156.1537789285068; 
	Mon, 24 Sep 2018 04:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 04:41:04
	-0700 (PDT)
In-Reply-To: <2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
	<ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
	<2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Sep 2018 12:41:04 +0100
Message-ID: <CAFEAcA_LsjvJGi8v1Wo0g9GfTFVVo8mzy_WcdkcHb=duwHQ9OA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yh4C2+275i+p

On 19 September 2018 at 11:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> These are the number of read operations done on the flash memory region :
>
>     922478 ~ 3.5 MBytes   OpenBMC U-Boot
>   20569977 ~ 80  MBytes   Mainline U-Boot
>
>
> So we are trashing the TBs I would say. Is there a way to increase the
> TB size ? or some other TB parameter ? Is that directly linked to the
> instruction cache size ?

Well, execution direct from MMIO means we read each instruction
as we execute it -- there's no caching of TBs. (We generate a
temporary TB with a single insn and throw it away after executing
from it.) This is because we can't be sure that we would get the
same data value the next time we read from the address.
So we definitely expect things to go slower -- I'm just a little
surprised that we spend so much time executing from flash devices
that aren't in "romd" mode.

thanks
-- PMM
