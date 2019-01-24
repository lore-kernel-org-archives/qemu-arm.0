Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1940326wrt;
        Thu, 24 Jan 2019 05:41:36 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5T0GrSGhpX+oMys4bfDUN908nlBrCHemybLoy4tq36dMqryLjxWUWkf7pIowYXOTToVUGX
X-Received: by 2002:a1c:85d2:: with SMTP id h201mr2586416wmd.151.1548337296139;
        Thu, 24 Jan 2019 05:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548337296; cv=none;
        d=google.com; s=arc-20160816;
        b=dpk4VKKAtiT/2B/eOhGVcZAHKlHSrOMsMPuQo4+FIy+ZPPrD5+ctH5N4zuysO26fXv
         xCVaTaLl6NqsZ6Mp2xaqGE+yCUEL1gMKtiKqjrYkvrNP6EiKmiH4zrTVXIbgARfdE1f3
         OaEVFrLFvwjg7RWek/3WiO9gc7wBMe6F6RDyPLW7+7FyCpxmwF1JaxqXuuFtQZ2KKqr8
         HsYmxrmm7cv9LcFfUoy1qSUQieeBhi90G7ORfYz7KezXNdYm3muU81Qpl9ohYHvSJhCk
         aggmYAweFfUyiM9AygRvQ6gzez8sjRGomT8rrRbjvhOauDJ78cBXgXSxXn97zAWwwScI
         Gckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7MPwuASp2gLofIr1eK1YeETyoAQaLUBaM4DC8gex67c=;
        b=zU+rCzctOtkSnqPEYV+5ZHuCm1Ifyo6+LNR4Hl//Godgip6WMA2seBAPzkb7rSoQWv
         MVKykVh2qx5iT79ea2TEHIyBoeO6kXV1t0kHX7pI7kbf5txRPz94ieXnhOi/Kf3fmdXP
         lFOIeSd7EjfJDyrsaHsQJqrEe6c9mJmzAYoK9OZzADQQEoo7xGjHeuX6MwyQdDYrAuWA
         6PVIXs81Nf5mAFbnXaLLRn6HUT99gIzZkKLtf7OQpOF1m8zcitf+7kgaPz5YoBiPnoWN
         W+VGFjdVtgqC+mxoqr7LlRS0N3MIxrY9IPffd2A4M/CUKaXah/66bLEvDErDfebdDELF
         kYTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AaYiBMcP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si72526190wrr.113.2019.01.24.05.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 05:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AaYiBMcP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfGB-0005ze-7e
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 08:41:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfFT-0005Nz-32
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfDM-00048j-Ii
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:38:42 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmfDL-000446-8t
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:38:40 -0500
Received: by mail-oi1-x242.google.com with SMTP id v6so4839533oif.2
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7MPwuASp2gLofIr1eK1YeETyoAQaLUBaM4DC8gex67c=;
	b=AaYiBMcPgTrKUOC6NjMJSNstZC4JB8WfMAMUVXeWZzONjTqEnDxwkwqNRSbNjlAe45
	18vW0o9uxtA3UhaurfZb2ayqLTqXhzHeHDVRIJZfjhyvLTG2qt4DixeZl+PIoApgSFuK
	yg/O60c3cqgFOJghH7FW0Ko2bPsWntMeYe2Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7MPwuASp2gLofIr1eK1YeETyoAQaLUBaM4DC8gex67c=;
	b=VccH7tIkJwu6i9WcoUbm6x86m/tEZXzAj08sLWc0KTo5bWO5wg1EjEnwnVtyFkcYIW
	ZTxQeXaulQB/0wqAcmp4+KNQG+r0vJy8uxexmHNqF1ewryS8DDasg3lfvBIi3emciqpU
	DqKzAwTq+DaRIHGRMT9lr+/iLh0jjdOuQsaep0kv8g/Qy3kvMSH/RG8UAcDf1epQkrLx
	5uXrfpsmJrQQ239NW4Eg8kjMvzthctI6iuN98dSS1tbFIccqEs0twV0qnIwQbRXJjQDB
	F1ra1WaBD6YjWwC8UKNSXca4body5V3OmmvEh4yNnK+Ih5BsNV4oRh8XiqZC1xEbuJ1O
	yg1Q==
X-Gm-Message-State: AHQUAubGK3JrR5medJQbjxDAEdg5kYqVzv/YA1DA6HhBCUt40zzr8/Jc
	onEaHJbZ5JXEZLRnNY0QREQ+ZB4fzo3CuhmohHSHvg==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr1179067oit.325.1548337114556;
	Thu, 24 Jan 2019 05:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20190123212234.32068-1-stefanha@redhat.com>
In-Reply-To: <20190123212234.32068-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 13:38:21 +0000
Message-ID: <CAFEAcA_Edcs-w4UCmARzwV69XUw61ey0qO08_nuEC=Zsvi0N6w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 0/5] arm: microbit Non-Volatile Memory
 Controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Jim Mussared <jim@groklearning.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tfimOOcNJeUW

On Wed, 23 Jan 2019 at 21:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> v2:
>  * Add Patch 2 to call memory_region_flush_rom_device() from pflash devices
>    [Peter]
>
> This series adds the Non-Volatile Memory Controller, which controls access to
> the User Information Control Registers (UICR), Factory Information Control
> Registers (FICR), and flash memory.
>
> This is the last piece of microbit work needed to make basic programs like
> Micropython "Hello world" work under QEMU.

I've applied patches 1, 3, 4 and 5 to target-arm.next, thanks.
Philippe has review comments on 2 and it's not really microbit
related anyway.

thanks
-- PMM
