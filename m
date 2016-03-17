Received: by 10.25.208.211 with SMTP id h202csp378378lfg;
        Thu, 17 Mar 2016 04:41:06 -0700 (PDT)
X-Received: by 10.55.76.213 with SMTP id z204mr13211645qka.58.1458214866476;
        Thu, 17 Mar 2016 04:41:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d34si7577528qkh.0.2016.03.17.04.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 04:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agWIc-0006Nr-11
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 07:41:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agWI6-0005us-Hk
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 07:40:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agWI5-0006t4-6S
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 07:40:34 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:36511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agWI5-0006sw-0P
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 07:40:33 -0400
Received: by mail-vk0-x232.google.com with SMTP id q138so6394179vkb.3
	for <qemu-devel@nongnu.org>; Thu, 17 Mar 2016 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DZaP6pKAxOdP18Il/Lp4MJZjXzpA4C4xERftWfhi1uY=;
	b=aCu9u7G+od1XwD8mwRQ2aLdZ8Z7GuVcgHT+7JiqnCEGQLCZlEv0QRJfFdy3dgIYf7s
	nlhcEo+rT72BayS4XWiTWc5zoSid0ALGSabNo5SpcPoWRzDvDMqOkeUqSbRqVZqv0LkZ
	OXQL2E/TXNCtbSNMlxHsXVXKIqLlD/cYblDsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DZaP6pKAxOdP18Il/Lp4MJZjXzpA4C4xERftWfhi1uY=;
	b=GQbX6dPTvPUzEh7u3d8o3YtjnLuhIJV9rxxnoP78kntKo8RhHobF4rAwtFHoUApQRV
	uchElRnUFLu9zGfJf0LMU9DKzaeh19zmD757mLR9+iywimDRuxdLYe5iG0QymRr0FSk1
	9OgR59e2Ehvq8fBazzWKOMGHjwNYbshZ+f0haZfem1fXMW8ZjvDR0Y59X4ymU1B5QO/X
	WiRDVOdwnI7Pc+olHbDKcD6uDtNZVJiJnnvWrT7nBZLed4SS3xoMufn+cdjRbJ83tq89
	OwgeZuLmbVPhE7V5KxdhYYmv6t3s0nQAjXNkdIM3F5mUZH0Avx9CTwkU3ijHZHOYXHbn
	6ODQ==
X-Gm-Message-State: AD7BkJKwh4ja3D6Kpr3HgYneC3laaQOC7N4MzO+FxOxdXHNCAhRVJhZKXnS7iBFxlCBXdvQZoRye9wqmVB9gVHhE
X-Received: by 10.31.47.207 with SMTP id v198mr11035408vkv.6.1458214832322;
	Thu, 17 Mar 2016 04:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 04:40:12 -0700 (PDT)
In-Reply-To: <4542001457893724@web22h.yandex.ru>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 11:40:12 +0000
Message-ID: <CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pxws09U9kVME

On 13 March 2016 at 18:28, Sergey Sorokin <afarallax@yandex.ru> wrote:
> 12.03.2016, 03:18, "Peter Maydell" <peter.maydell@linaro.org>:
>>(I agree we have a bug here, I'm just trying to work out when it
>>can trigger; if it's only possible for S2 page tables then it's
>>not a visible bug yet because no CPUs have EL2 support enabled.)
>
> I can not anwer you to this question. The bug was found by our internal
> corporate test suite with EL2 enabled.

OK, sounds like it is the stage-2 only stuff. Thanks for
helping to flush out the bugs.

>>If you want to implement the AddressSize checks that's fine,
>>but otherwise please leave this bit of the code alone.
>
> You said me that my code is not correct, I have proved that it conforms
> to the documentation.
> It's a bit obfuscating when the doc explicitly says to take bits up to 39
> from the descriptor, but in QEMU we take bits up to 47 relying on the check in
> another part of the code, even if both ways are correct.

The way the code in QEMU is structured is that we extract the
descriptor field in one go and then will operate on it
(checking for need to AddressSize fault, etc) as a second
action. The field descriptors themselves are the sizes I said.

> Nevertheless there is another bug in descaddrmask in QEMU.
> From ARM ARM:
> baseaddress = desc<39:grainsize>:Zeros(grainsize);
>
> But currently QEMU does:
> descaddrmask = 0xfffffffff000ULL;
>
> It assumes that grainsize is always 12, but it can be greater
> in AArch64 translation regime.

Yes, we get that wrong at the moment and should fix it.

> The patch fixes the bug,
> and completely conforms to the doc, doesn't it?

It doesn't structure the code the way I would prefer it to
be structured though.

thanks
-- PMM
