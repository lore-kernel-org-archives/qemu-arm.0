Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1912067wre;
        Thu, 24 May 2018 07:14:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqbKlLe9ZXOLD9o13ynV55l31ZfIKgplOxkvVSldznV2/tXruk7iztGc0Z3lebQNmmuNtSo
X-Received: by 2002:ac8:29d0:: with SMTP id 16-v6mr6842638qtt.174.1527171264231;
        Thu, 24 May 2018 07:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527171264; cv=none;
        d=google.com; s=arc-20160816;
        b=EPIeTbfLsU9d6GTlj5FI7s4pUbwGywm/M4JzI9MVBmHXT3nOOM4k2EK7B1WJd35QXR
         ZhSxkrENCQ8crFr7DThbz86uKHkjrUgQBSkBRncMfn1vwpm+HV+31EQosVW3AKAlvnq+
         cz0VPLxJf6sK+VWne1+F7pREylMlleJJKfJ1XgoDMqsrH7odbD3ntKVTH/NUAA/CiQza
         zqFRqGAsTEwgqqeQjct2KxWTGaobiNuWtlYIqtwKKhllQ/+fyQ15yh4eqKoGNAxbQsV1
         8BsH0n6Fi3Fs0IN1FsDHWdh31ZtPApxaI+cIy/gfsswo9yIly9kNWR42YO6MUp506iXw
         /hoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+p7JWrhkk1ghnVvt4ef3TZ39tJ6F95LZwxfdMDsu+nw=;
        b=DHbRD57DRM/kw1Y2bLrNY6bDmmORo6LVcaNnR2M7aJURlO+/ysM9cGy3tGg6D0ORIq
         i0uoDajIZRzNF47/wPE5jGNzNkTRs2EeX0PLpj6JDbxwHAh02Q0df7BuGHBBGTDEPV77
         8LJ1uxXmZny+QWewZBwPyVcm5/suZO7eQ6DtGbcfx0AbxVgZTdfDRx+oFJv/rtwKacIO
         thkKshOY/JVpXmJaVMRzUtbpCyKvrvq8F47U8ICKT79jJQzUx4AzGwxI+frzBClzA4el
         5JL+5ap6VJi09a5iayvE7y3/wZihjwJPP01A+5RC0la//UYQIZmEZ05jPR+tXWGzNfLG
         MPsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dX7IgLuW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i39-v6si409190qte.250.2018.05.24.07.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dX7IgLuW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLr0Z-0001XQ-RB
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fLr0T-0001XC-7s
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fLr0N-0005FI-Dp
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:14:17 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:36373)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1fLr0N-0005Ez-8F
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:14:11 -0400
Received: by mail-io0-x241.google.com with SMTP id d73-v6so2468844iog.3
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+p7JWrhkk1ghnVvt4ef3TZ39tJ6F95LZwxfdMDsu+nw=;
	b=dX7IgLuWKw8s4iWfCBuqHMoppHL1YJ2JOlUhYFbGgme7cdj5IDAMN/QpLFxOQIhQ0i
	wfuJncNwuzp71PRqWrwteWTP7IQGHTIHjfmjiy2D9KLE9lj6ZdPuMOAXdTS8+NZ8TRA7
	GNTfHrhqAs4lXEcfjNtCoae5YaeJXNJ4M2nUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+p7JWrhkk1ghnVvt4ef3TZ39tJ6F95LZwxfdMDsu+nw=;
	b=exsIms/KPr3CRabDRuyEdAT/VhrQpDexF/33f3QhxhuetvCQmJK8LIIqhZPvUH6LZm
	KgGOj0kr1/d2bLSkE8UrPQfJMInYy3KohcAh2+G/HuI6DeNUpOBIbpGd6IuPn1Gs1d9j
	R/llP7iuUHf8LNMpwgjrKq/Adn5FQ2RB62SVoKT3Mu5UK3Xy21KW9iYFeu3OT9JaKlKX
	gGL+8NZ7egfA1ISZcUZDulWUSraqJFnPrIcG2bBrNtwIKcSf8n4uQPgvQbckDAZUBNaU
	LYjaci814LMUegdecPjsoxcOuskXo2MDKQQ2iOL+jZXpUiXg5F3ImGeUQJLRafwsHSAS
	cFzw==
X-Gm-Message-State: ALKqPwfHvbQs8TgyCjSlXY0iEHqR3T75ry+dkPYJM5StHzwMTyYCYThW
	bm/1NFY3lWlxCvGXQaG3SjoIeduHPFIPYLZLKS2lMQ==
X-Received: by 2002:a6b:545:: with SMTP id 66-v6mr6824358iof.173.1527171250383;
	Thu, 24 May 2018 07:14:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:bb86:0:0:0:0:0 with HTTP; Thu, 24 May 2018 07:14:09
	-0700 (PDT)
In-Reply-To: <ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
	<ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 24 May 2018 16:14:09 +0200
Message-ID: <CAKv+Gu8Lp7gUqdurVSYF2wVP0TPHY7Vox5J8ZdT=g0UytoKOUg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fVsbJoYS7nck

On 24 May 2018 at 15:59, Laszlo Ersek <lersek@redhat.com> wrote:
> On 05/24/18 15:07, Peter Maydell wrote:
>> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>>> On 05/24/18 11:11, Peter Maydell wrote:
>>>> Won't it also break a guest which is just Linux loaded not via
>>>> firmware which is an aarch32 kernel without LPAE support?
>>>
>>> Does such a thing exist? (I honestly have no clue.)
>>
>> Yes, it does; LPAE isn't a mandatory kernel config option.
>> This is why we have the machine 'highmem' option, so that
>> we can run on those kernels by not putting anything above
>> the 4G boundary. Looking back at the history on that, we
>> opted at the time for "default to highmem on, and if you're
>> running an non-lpae kernel you need to turn it off manually".
>
> Ah, OK, I didn't know that.
>
>> So we can handle those kernels by just not putting ECAM
>> above 4G if highmem is false.
>
> The problem is we can have a combination of 32-bit UEFI firmware (which
> certainly lacks LPAE) and a 32-bit kernel which supports LPAE.
> Previously, you wouldn't specify highmem=off, and things would just work
> -- the firmware would simply ignore the >=4GB MMIO aperture, and use the
> 32-bit MMIO aperture only (and use the sole 32-bit ECAM). The kernel
> could then use both low and high MMIO apertures, however (I gather?).
>
> The difference with "high ECAM" is that it is *moved* (not *added*), so
> the 32-bit firmware is left with nothing for config space access. For
> booting the same combination as above, you are suddenly forced to add
> highmem=off, just to keep the ECAM low -- and that, while it keeps the
> firmware happy, prevents the LPAE-capable kernel from using the high
> MMIO aperture.
>
> So I think "highmem_ecam" should be computed like this:
>
>   highmem_ecam = highmem_ecam_machtype_default &&
>                  highmem &&
>                  (!firmware_loaded || aarch64);
>

Given that the firmware is tightly coupled to the platform, we may
decide not to care about ECAM for UEFI itself, and invent a secondary
config space access mechanism that does not consume such a huge amount
of address space. For instance, legacy PCI uses a pair of I/O ports
for this, one to set the address and one to perform the actual read or
write, and we could easily implement something similar (such an
interface is problematic in SMP context but we don't care about that
anyway)

Just a thought - perhaps we don't care enough about 32-bit to go
through the trouble, but it would be nice if LPAE capable 32-bit
guests could make use of the expanded PCIe config space as well.
