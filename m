Received: by 10.25.208.211 with SMTP id h202csp2707293lfg;
        Thu, 3 Mar 2016 05:50:18 -0800 (PST)
X-Received: by 10.55.82.85 with SMTP id g82mr2983648qkb.107.1457013018536;
        Thu, 03 Mar 2016 05:50:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si3632735qht.19.2016.03.03.05.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 05:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abTdx-0001AV-Iz
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 08:50:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTdt-00016W-NB
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTds-0006bO-U9
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:50:13 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abTdr-0006b2-Dg
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 08:50:12 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e6so21629327vkh.2
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yHatWUVK0MDkalXGPg3O0gjl6XqTqgMhfB+O9LD7ZZc=;
	b=kXv0Zv3l+qRRRyGGsqAmMc3F/gXKX8zhvvFaTsdGN14pbDieAL7QIqemdR+cX/7xlb
	Ul+Ur5MnUwLjrXDdLVIQ/30BiPJML9lxWYtDDbEILxMYgtUvEtQdZHodmzl0O+sR1dBE
	Vilh/xvQPMENsvxt05Qmy+6/FCm6Y3+PQa3H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yHatWUVK0MDkalXGPg3O0gjl6XqTqgMhfB+O9LD7ZZc=;
	b=Hbm2ZEZpHy2/+DqUL7tWQFrV8ewvbPZ5o1tyzolgfDPf8lLJxTCJJ4ev8CEPPRwLTN
	f9Ys47sCBighBnja80f2NYKRUzijNM/VgiM+XpU+q6bU59hlMQ8yLj35hpPChozrNrlP
	WE6LJ3srxn+m93z/EDgQw6Ltbse5gtkMNTIwRXunqlkpXOwiOZIok+IlHFMuJy5jqAjE
	hc32+vvwpDXHacfj+LxLAXm7gsWWisko9EXPsbzygcBzyLZcCV7IST7lj9QpFmh4dKkk
	pu4Y5URyQsc0b5UBBGdwtFTVYMwuRxOYuCISAhoJpDIZlMTNMqc90ccsXYtxA31xl2um
	3tgw==
X-Gm-Message-State: AD7BkJI+YLpxH9KwmUwQbyScjyz6PiE+m7jJOIFuUb2uvZA01CnA7XFkKDnhazSHl9b02zb7FLtcXZ3edG/QHPCW
X-Received: by 10.31.107.194 with SMTP id k63mr1664472vki.27.1457013010533;
	Thu, 03 Mar 2016 05:50:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 05:49:51 -0800 (PST)
In-Reply-To: <56D73CB6.7040702@gmail.com>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 13:49:51 +0000
Message-ID: <CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Sergey Sorokin <afarallax@yandex.ru>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: doLAc+MfgV7s

On 2 March 2016 at 19:19, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 02.03.2016 21:04, Sergey Sorokin wrote:
>> Qemu reports translation fault on 1st level instead of 0th level in case of
>> AArch64 address translation if the translation table walk is disabled or
>> the address is in the gap between the two regions.
>
> It's probably not a very clear description in the commit message. IIUC,
> level 0 fault is reported in case of any fault from TTBR in AArch64 state.

Yes (though you mean "under an AArch64 translation regime"). Conversely, the
only fault reported at level 0 under an AArch32 translation regime is
the AddressSize fault (for bad addresses in TTBR0/1), which we don't
currently implement.

There's also a code path later in the function that does
    level = va_size == 64 ? 0 : 1;

but I'm not sure it's worth rearranging that code to avoid the
duplication of "what level do we report this kind of fault at?".

thanks
-- PMM
