Received: by 10.182.158.201 with SMTP id ww9csp6971027obb;
        Mon, 28 Dec 2015 12:36:18 -0800 (PST)
X-Received: by 10.140.99.86 with SMTP id p80mr71819229qge.97.1451334977994;
        Mon, 28 Dec 2015 12:36:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si66300080qkt.81.2015.12.28.12.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 12:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDeWf-00021b-OL
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 15:36:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDeWd-00021A-4e
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:36:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDeWc-0005BL-58
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:36:15 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDeWc-0005BB-1T
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:36:14 -0500
Received: by mail-vk0-x22b.google.com with SMTP id f2so144942873vkb.3
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 12:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CQ2mfg+lbN7fObfstMDboDHn517bQ4IanvN7oE0x4fs=;
	b=dI8BGIIhHflYxUs9sX8HhEYaC3JTTCbABiUkHW9cCmRlHGGWnIlfj2bBaRa7H98X3N
	OIi2l+HCGG9t107IKcbd5otUzjHmMWHOFqozZBCEE2FQPAUG7C0c6bQkyE4QedZ+UTGT
	xpyzqas+ce0NPGXpjgTgQqF9TD5QMH1bx8yFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CQ2mfg+lbN7fObfstMDboDHn517bQ4IanvN7oE0x4fs=;
	b=PgJ69uIs4jQGjLn+UIBNillfpEVYp6oKB9sOrI1GFRsiC6PnFW/j/Rz4rEAzZwvRnJ
	Tql1kO6EH/AIXSJxfJZZ388JV342yBk0/pusrA4i52maX8rxa0XZxSogWfcNWHxFtH2F
	sK5LNKcED4hbZGm2X0e+UxxhdeHRw+4F2tnh8rUtjzeCMs6CXf7lIZpsj5hM0DL2gSkH
	Vx6ElzJlOYBn0sN0lYoe5tpupvozxPav7yab0BNqxgHsvKhbvZh9jIMk68nx9ECzU0N0
	E14vImIcBg8ZAgnYFHZeWg6R5RKysHMDbZETDRSmXToY63zEAlgifaXFHnfQPd9otUGJ
	fwtg==
X-Gm-Message-State: ALoCoQlkKkW2o/v1wd5/eu9O06bWXtmYs+npiJKTaNQWBbKNAkOXUKeFVs0en413xv9GmqkrS8VbfoYvi8/lTJF+FHEEcRoraLdGch4fF/ATvbr/yCOOPvo=
X-Received: by 10.31.52.147 with SMTP id b141mr29269670vka.82.1451334973431;
	Mon, 28 Dec 2015 12:36:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 12:35:54 -0800 (PST)
In-Reply-To: <20151226190759.GA8638@gallifrey>
References: <20151226190759.GA8638@gallifrey>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 20:35:54 +0000
Message-ID: <CAFEAcA9JudnGrMGrx-d9tGQYWJ-QA=kjeKjw_-VOjuh5yzzmew@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] v7m reset vs rom loading ordering
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
X-TUID: V3lGlD45hRDH

(You forgot to cc qemu-devel, which meant this message got hung
up in the "people who haven't posted to qemu-arm yet end up in
the semi-automatic moderation" machinery, and nobody saw it because
there was no qemu-devel cc.)

On 26 December 2015 at 19:07, Dr. David Alan Gilbert <dave@treblig.org> wrote:
> Hi,
>   I'm having problems with the v7m reset code happening before the loading
> of the ROM code, and hence getting the wrong starting location.
> I'm using the stm32f205 model (modified to take an m4 and change the
> sizes of ram/flash for the 401), with a board that's the same as the
> netduino. It has the stm's internal flash and an alias for that flash at
> address 0.

> I seem to be ending up on the bottom half of this (because of the alias?)
> and it ends up loading both 0, even though I can see load_elf has already
> been called.

This does AFAICT work for the stellaris boards, though it's all an
ugly hack for the fact we don't have a nice way to say "this happens
when the CPU comes out of reset" (and also no nice way for that to
interact with an attached debugger). I don't think that rom_ptr()
cares about whether the memory it's going to put the ROM into is an
alias or not, so that is probably a red herring.

> The reset gets called after the realize triggered in the netduino board's
> init function; but all that happens before the rom_check_and_register_reset
> is called and gets the ROM data in the right place.
>
> In Michael's world he has the extra comment (from 'remove extra cpu_reset'):
> +    /* Realizing cpu calls cpu_reset(), which must have rom image
> +     * already mapped to find the correct entry point.
> +     */
>
> so it sounds like the same problem, even in his world.
> (I've hit this both on head and head with Michael's patches from the
> start of December applied).

You shouldn't need to care about intermediate resets that happen at
realize time, because vl.c will do a system reset which should
include resetting the CPU and this should happen after the ROMs are
all properly present.

> I've bodged around this by adding a call to arm_load_kernel to armv7m_realize
> so that the arm reset handler is called and then doing a system_reset
> after I get to the hmp; but obviously that's not the fix.

Why does the system_reset from hmp work but the one done by vl.c
after machine creation not?

thanks
-- PMM
