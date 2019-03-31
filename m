Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3698707wrx;
        Sun, 31 Mar 2019 00:23:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzKNnnJyPuX13qEl2hz6sl4VoZdq7qOpA9zSUftMz+tSJLM/AxRYUVlRW/vW34UuF1JmcC
X-Received: by 2002:a81:554b:: with SMTP id j72mr48795471ywb.54.1554017026705;
        Sun, 31 Mar 2019 00:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554017026; cv=none;
        d=google.com; s=arc-20160816;
        b=dmBJZ/K/IaHXq4WthIAS0ZRQBYkHekMFnNIltXck8uunx2k0dASJ2AOeYkKBZnO05V
         WBv4ZgRE/VDZaGUe8b1p964WkngU4/iSzlyGk4PkzRJqaFhncLoHaE4+dvw2srIAywQM
         FT4joEYAdXyx2CcLY5DYdZ+aj+o9helpNpM1x6cH+M83YbivhosKpUxyYYZN9U+Rk5OF
         0Ao4lXknxspzp8TgIbG6eN5a9ylczqZFkVC4wv2ZrZMg2fqBezYU4QBgoqzp0wIGq6HV
         54doVC4Ngzgwt5Bfd72QYtO1qQURwoCgYn7lmML8tZCN6nrq8t/p1SvOwMmo8CqVK9oW
         IjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T5S6La0gU1wwG2IjrJgM598D65GRMGm/o4BXTpq6TdE=;
        b=FG1f1B3FT3hRmLGH3CH1aEU+HiGxhTqRIUfUryia/RvM02fmLjH14yFbMBW8TU7c7E
         itce5KxSdh5Jbpl4UiFQyoWyMP9h0PfdUKOmrcKlEa0zyTb93LOfBJ1wPG3o9zlcu997
         5jzwuYWMOrWmY5PAz2qH8LlfpgGMbE2XCpOMnRmqUn94D3RQj+zipnGarLLduYBIEp/T
         WNbLTXtSi/WxenfPPIozpu/NGSl58SDyXmvKMJID2Dl1eATMTc97/SaIwOwsykpSl6md
         MSDF1P3feBaXBRHzuPJWTq9nZP/iKD6xpAnbJnTv0ffRPj2KF0I5k+TorlIm1BGpmoJX
         B7+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5SU1VqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t186si4344560ywb.157.2019.03.31.00.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Mar 2019 00:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5SU1VqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAUok-00069Q-7V
	for alex.bennee@linaro.org; Sun, 31 Mar 2019 03:23:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hAUoY-00068z-LE
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 03:23:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hAUoX-000147-Hc
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 03:23:34 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hAUoW-00012c-PL
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 03:23:33 -0400
Received: by mail-ot1-x333.google.com with SMTP id d24so5731745otl.11
	for <qemu-arm@nongnu.org>; Sun, 31 Mar 2019 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T5S6La0gU1wwG2IjrJgM598D65GRMGm/o4BXTpq6TdE=;
	b=z5SU1VqXYIFM7Z9xl9Ib5ljG+l1jvqOWYjcWELXUuUqTvFpZWwIPhjDn7hiYGs4/do
	2QgmTwrXCiWfL1Mnsg02C2j7uNIj/QtliQA+a/fCNjcIk5cP6y0X1CIZ1lrzEOgPy9wZ
	v/KSq6E0m99W0O+xDSGa+LDdf3ciFoeFokO0bkuAaG67a/xTkD5jX97CLp1dKov/VM+1
	YRaJN5GafIKthVdfE4/C7cRWAalDdR7R9nAVuPbWYVgfh+eTn09nPR/wcVNJp295zad6
	b53VvkZhnlf4I4ndraNFogPko4Sto2EJi/it9EhO+dQ/AYD9O2atS4Hx3Aan/bQ1P9XZ
	Q5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T5S6La0gU1wwG2IjrJgM598D65GRMGm/o4BXTpq6TdE=;
	b=ulVtrh0ndKG1e7k+OD2EeiFrAi4z3q4Qet9Bgx7d5YuFsVWf4degN4IdRUvtFR9w1y
	rkdu1IVsDObQW8vIXyN+LZOWe1rIirMO31jlZrHSYSdHNkM5PHi4+slSguzwlUjTSSh/
	GuU0yfj6Cak+5MsmAHGOUvWqKBiYb8HJh4K35oVJxDsJmoGvXVYJHIRHLmMi8OI5zSXB
	W6krONBwRMIOpQLq7IZe/8f3MN8OAvJqZwCi+fUcm8BXGinw++m5P8vANdbxV1jCddg9
	+E6RCDssCi08HxHWoFntg6g4n0TZ0qmEw4OsckkRN9+dH+5TRI5lVCx/ZRea1el8epQx
	XL4g==
X-Gm-Message-State: APjAAAVLW/BgtAaQk9ZrGdmzUjLbxXuY6aOcLhUkDMA+Vpd5jN+JDai6
	tEbsDitqj1RipM79fzRwj24pWwcnpdGOdRYKPAJLoRD+N8Q=
X-Received: by 2002:a9d:130:: with SMTP id 45mr39977359otu.352.1554017011573; 
	Sun, 31 Mar 2019 00:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <E280E863-EBA4-4011-A4EF-499FBF6219D5@deepvision.io>
In-Reply-To: <E280E863-EBA4-4011-A4EF-499FBF6219D5@deepvision.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 Mar 2019 07:23:19 +0000
Message-ID: <CAFEAcA_q6-fTmSTAR-wGp0FSzzTOyQHEzU4VoYtfhgmFShgwaw@mail.gmail.com>
To: ratna manoj <ratna@deepvision.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-arm] Panic when PCI trying to read secure mem area.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cRCJoS4b8pde

On Sun, 31 Mar 2019 at 05:22, ratna manoj <ratna@deepvision.io> wrote:
> I am getting a kernel panic when PCI is trying to read at 0xe0880000 in VIRT_SECURE_MEM area. ([VIRT_SECURE_MEM] = { 0x0e000000, 0x01000000 })

Hi. The address 0xe0880000 is not in the range starting at
                0x0e000000
-- I suspect you've miscounted your zeroes. So whatever is going
wrong, it's probably not the fault of the VIRT_SECURE_MEM block.

I see you've already figured out that the answer is to pass
-machine highmem=off. By default the virt board creates
PCI windows in areas of physical address space above the 4GB mark
and advertises them in the device tree. Some older kernel versions
are buggy when configured without LPAE support, and instead of
correctly identifying that they can't reach these PCI windows
and ignoring them, they truncate the addresses to 32 bits and
try to access PCI at bogus addresses. The other ways to fix this
are to build your guest kernel with LPAE support enabled, or to
use a new enough kernel that has the bug fixed.

PS: I recommend against using 'secure=on' unless you have a
specific strong reason to want to run in the Secure world.
The expected and more tested configuration for "I just want
to boot a Linux guest" is the default (secure=off).

thanks
-- PMM
