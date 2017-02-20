Received: by 10.25.0.147 with SMTP id 141csp143652lfa;
        Mon, 20 Feb 2017 10:52:10 -0800 (PST)
X-Received: by 10.237.38.133 with SMTP id q5mr19997167qtd.21.1487616730344;
        Mon, 20 Feb 2017 10:52:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si5351405qtg.125.2017.02.20.10.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 10:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cft4D-0008Qn-J4
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 13:52:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cft46-0008Ih-4o
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 13:52:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cft45-0002uu-1h
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 13:52:02 -0500
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:33113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cft44-0002uf-QB
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 13:52:00 -0500
Received: by mail-wr0-x230.google.com with SMTP id 35so29217632wrw.0
	for <qemu-arm@nongnu.org>; Mon, 20 Feb 2017 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3vjq+kSeT5XR++XxF2kb9NPt3NQMFdmujLA7Ft14X80=;
	b=b8uymkxab0kee035KyLTT2BlfCo0qloLXuIa74j1GT0waSVqNjf7pClSkwr+RrdHL8
	b5Yfd/LCWHaqq4l/4cSiw/d533CCHBzwkEJLzQxbZCeQ8TjfGJv1k2vxzIvKzZwZAb4G
	G1NyklS5Nb4S9eqvGOlDL6ePW4jFG2EvGbe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3vjq+kSeT5XR++XxF2kb9NPt3NQMFdmujLA7Ft14X80=;
	b=LFg++B7I20w+mHMVmcQK2evhpty8kARI8PjzRe3vDOenG3DEUq9u7BmprMtup9lXpi
	VJUEF4y7oyTXLI3nPmiHepTZ5PZjiofYPDNms7nFbsPXoIUWoCA2NjbZH6PndpblUIl1
	07YaaNDdyi4RsiLtT9jH+IQ4Vs0Efg3QdQasuvuH+xwr2x1rFKcGNkqoHCn0CI+zsLZW
	wChQSYXd6hz+q9YvHcg7bv+E4C+MHhy+zv042yEKyV65Kt7XGxx2vPDfx8etP6apovpO
	UbM4Z8VtYdJWRxhXXH8WfBHfsErR4AK3JQamdJMMmDBHLhWQl/CrnNEQXFajtvxoNuWu
	B5Dg==
X-Gm-Message-State: AMke39laW7f83cRCEKeRsmIRaeLnYifJDgtBdniEeewnnISKB7uMPN5Wt8Z9AG5zju+MktsDSROTBYTvHR41ORi5
X-Received: by 10.223.150.209 with SMTP id u75mr47076wrb.195.1487616719632;
	Mon, 20 Feb 2017 10:51:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 10:51:39 -0800 (PST)
In-Reply-To: <b13702b2-44be-563b-5743-33c773a6e037@amsat.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-10-git-send-email-peter.maydell@linaro.org>
	<b13702b2-44be-563b-5743-33c773a6e037@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 18:51:39 +0000
Message-ID: <CAFEAcA_KnJPrKU2gWCkPJELkU3QtbTOu+_fMrHWwkPcwS+NE2w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [PATCH 09/11] armv7m: Split systick out from NVIC
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gNFkURb0fy3

On 20 February 2017 at 17:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 02/20/2017 12:36 PM, Peter Maydell wrote:
>> +/* Conversion factor from qemu timer to SysTick frequencies.  */
>> +static inline int64_t systick_scale(SysTickState *s)
>> +{
>> +    if (s->control & SYSTICK_CLKSOURCE) {
>> +        return system_clock_scale;
>> +    } else {
>> +        return 1000;
>
>
> this magic seems to be SYSTICK_SCALE
> (Paul Brook's commit 9ee6e8bb85)

This patch is just copying this function from one file to the other...
at some point we might want to try to improve the handling of
the clock scale factors but that leads into complication, because
the external-clocksource scale factor should really be board
level configurable. (Slightly confusingly the leg of this if/else
which is board-configurable is the one for the internal clock,
because we're modelling the ability of the stellaris board to
configure the PLLs so as to downclock the whole CPU, which
incidentally affects the timing of the internal systick clock.
Modelling this properly needs to wait on Fred Konrad's clocktree
patches getting in, I think.) For the moment I chose to just
leave the existing source alone, mostly.

>> +static void systick_instance_init(Object *obj)
>> +{
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>> +    SysTickState *s =3D SYSTICK(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick",
>> 0xe0);
>
>
> It seems to me the correct size is 0x10. The manual describes the range
> 0x20-0xFF as _reserved_. This _reserved_ description is at the end of the
> 'SysTick' chapter which seems weird to me... I rather think this range
> belong to the 'Interrupt Controller'@'System Control Space'.

The table of the System Control Space (B3-3 in the v7M ARM ARM
rev E.b) defines the Systick space as 0xE000E010 - 0xE000E0FF,
which makes it 0xE0 bytes in size. The NVIC doesn't start
until 0xE000E100 in this table.

The table of the SysTick registers (B3-7) agrees, in that
it defines the registers as covering 0xE000E010 to 0xE000E0FF.
In the current architecture everything from 0x20..0xFF is
reserved, which just means there's nothing there, but if
there was ever a need for systick to get another register
for some reason then it would go into that space (and if
we then implemented the new register in QEMU we wouldn't need
to change the NVIC code, only the systick code).

I think the way this patch has modelled things matches the
architecture -- it's a guest error to access the gap between
0XE000E020 and 0xE000E0FF, but we should report it as an
attempt to access an invalid systick register rather than
an access to an invalid NVIC register.

thanks
-- PMM
