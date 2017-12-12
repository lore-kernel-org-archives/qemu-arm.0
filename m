Received: by 10.223.159.74 with SMTP id f10csp3773504wrg;
        Tue, 12 Dec 2017 04:47:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBou+ihlZMzwUyqNVHgDvOF97rWXqA9nKMMYgRf93Wj+mW6UcAnZZ22/oWHJx0ViWHvbxZEYv
X-Received: by 10.129.122.83 with SMTP id v80mr2749331ywc.502.1513082859136;
        Tue, 12 Dec 2017 04:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513082859; cv=none;
        d=google.com; s=arc-20160816;
        b=sbwzsAb3POTQmJZBCl2u3FCgtjvij/aH5SOzQJlKOog7zvRmpemIipmjZYyJ79KEEo
         4kNxByGwXqOVKIeVyT1Z23S6bhUnvtIIL4VxTY1sGLQs3jgkAfTc9iMhEfabcWz+X80W
         5JSZuVguUolC/8Ufni10pZzmzBc1wabtv2GxW+WUQ5MUKUVglllZpIwZUoLxLNUjxgtq
         oxKG/L++OlkPep42aSJ8Q8eXJQg4XjjLc4fHrRoA/ptKIvBothrOC8iUQ3b8uCz4i4Wt
         GYEJOheK5APiAHt1CnBwuXgPTf/9tSCupVjeYxkwV+bLKFFovfQyhzQDfQsMkTEMl+jq
         5LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DXhyX5NCPsKGhgVham+v5VWqW074OHeh1FlXyQb+yig=;
        b=ICZv6S896sReYX7r1rZxCDBTp3NfXb1L3BdwlX4JvGPs4cso7gSP0qfUJfBoBGJOmi
         GXneD+I7/vxCUqVGOor9HRQwL9RpIhIq84QbwbTtYvLeKPI6vxTR5fpxpMp8KbivhY1L
         yiGDERWHRrCb3/KoNyss1kLPy7KfAIUXA1mFM59fuevzmGlbQzCA5za5OLJQzk3owg27
         5xsvbUWAflIkfe+WIoDo148eWhvAWoTaZwC5N2CUL2h3T/0/rd4RFUd0YnPwtOQDFDwM
         gMz0rMqvKyaJWyhp2rvMeE5w47oPYnrd1AOiygSO+bfr3kHL7+7LJUGCsdJgWuPlMVE2
         +kag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8+C0KSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si2417766ybh.466.2017.12.12.04.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 04:47:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8+C0KSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOjyE-0001DB-L7
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 07:47:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOjy5-0001D1-0V
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOjy4-0008Ds-09
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:47:29 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:40746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOjy3-0008DT-QY
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:47:27 -0500
Received: by mail-ot0-x243.google.com with SMTP id e74so17655693ote.7
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DXhyX5NCPsKGhgVham+v5VWqW074OHeh1FlXyQb+yig=;
	b=H8+C0KSwDI7vGT3Awf6vI/8OJEhXjKrtJxusHKeTrwr+H8rnL/gO9+8sKEqDUMGvK4
	Qbpv4z6i6KikH+LIL+W0x9TjOYGzjtfwT0BEhEWcuvogQ3OguvJjg5zywlAFtVernXa/
	AXus09Ynz+smocbF+b0sw5rhZyLOVpXpznqVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DXhyX5NCPsKGhgVham+v5VWqW074OHeh1FlXyQb+yig=;
	b=fyp9BoTcXZrOLCwIksaac/yetwL4raFsbaonPezdZE3ghNJHkCrFOeUQRJQhrJPUDi
	3gZc+3XRtxD/sPdEU2JX5V5jqCwHmFoA4xkskQN/hNCD2ASgm+P+xd27KgYbesIoLJ69
	4sI2yp9PtlIABeemEmfsa3iZazyAbEQsW+AgPp/GHsbExAgFgDJWvbEvD6cjsBl42wSR
	KGpEmuik0a3NGSHTXyEe3Qu3JNOCNl2gi0nyw4zwSGMz8eSA3hk4+z0POGLmxRU9PTEi
	cB+8RpqMGODM3TqTT1KYHzJ+DzNEy/OfuY6B/WsNtVF2QlPT1k4hm5QrUM0cq9gaYf0W
	NrMA==
X-Gm-Message-State: AKGB3mLAKM7WYecnnk7pNAsZf9EoqzdyhvrU838SME+J3fr04VMrjV3d
	Gji1uNgOlR3NfoNlYiEn+nzr1+1nF+1Fosdnd6VoCg==
X-Received: by 10.157.80.24 with SMTP id a24mr2928788oth.335.1513082846887;
	Tue, 12 Dec 2017 04:47:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 04:47:06 -0800 (PST)
In-Reply-To: <09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 12:47:06 +0000
Message-ID: <CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+OwMr1W/oPJ

On 12 December 2017 at 12:41, Laszlo Ersek <lersek@redhat.com> wrote:
> I agree. There's one user-visible complication: while with one UART,
> it's not possible to mix things up, with two UARTs, users will
> inevitably want to assign inverse roles to them, relative to what QEMU /
> the firmware assigns originally.
>
> E.g. if one PL011 is redirected to a regular file (debug messages) and
> the other one to stdio (console), there will be complaints that "I
> wanted it the other way around". The redirection happens on the backend
> (chardev) level, but the firmware won't see the difference on the
> frontend (PL011) level.
>
> Is it possible to add a new property to the UART nodes in the DTB, like
> "purpose"?

This is what the "chosen" stdout-path node in the DTB is for,
but you said you didn't want to look at that :-) (it means
"device to be used for boot console output".)

> Or can we make a virt-arm policy that "first -serial is always ...,
> second -serial is always ..."?

Well, the first -serial will always be the 0x09000000 one
that we have today, and the second -serial will be the other
one (unless you have -machine secure=yes, in which case
second -serial is the secure-only UART and third -serial is
the second NS UART).

Is this any different to the x86 case, where there are two
UARTs at different IO port/IRQ locations?

I think the only thing users really expect is that if you're
using just the one serial port for anything then it's the
first one.

thanks
-- PMM
