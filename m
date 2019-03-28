Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp655826wrx;
        Thu, 28 Mar 2019 06:55:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypjj+Z6LltT41UBPkdtmvjLTtMhlaLv9596jnkZ50fDkxpxKj05ZOfOSN7fzg0MMCfOwxr
X-Received: by 2002:a24:703:: with SMTP id f3mr97358itf.164.1553781302378;
        Thu, 28 Mar 2019 06:55:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k125si1750936itc.60.2019.03.28.06.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 06:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qfIg8EHw;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9VUj-00014x-OX
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 09:55:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h9VUc-00014q-9t
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 09:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h9VUW-0006pZ-Ve
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 09:54:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:55098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
	id 1h9VUW-0006nJ-6Q; Thu, 28 Mar 2019 09:54:48 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 3015896EF0;
	Thu, 28 Mar 2019 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1553781280;
	h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=8C0ZhatGAndARlZsvtOZuBLdpLQC/Tjeu1ygXtIMy08=;
	b=qfIg8EHwK//D4Furclv9rPxys8I7Yh+2T89Zq8GU/T7bQdcT/JJ/yB7f6lypGw8u78ZzwG
	LcUYdDpCb93byuHFQYLOjhoam0ygukWg1ZVqfuMNM3eRV85ncmdNcqjRv3LZpGj2g38eOo
	LCWwqtichx/7ZGI3QgRglzU4BFHW80o=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
	<c2bf4b5983b8f0bb42208eaf62643aaccc0163a2.1553510737.git.damien.hedde@greensocs.com>
	<CAAdtpL6rX-U2Bh4m1y1Z3OGG8zkFfsn3iFz+4n93VZvEvhm7RA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <198c899f-ccb1-a8b1-2b4f-63da226a00b4@greensocs.com>
Date: Thu, 28 Mar 2019 14:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAAdtpL6rX-U2Bh4m1y1Z3OGG8zkFfsn3iFz+4n93VZvEvhm7RA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
	s=mail; t=1553781280;
	h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=8C0ZhatGAndARlZsvtOZuBLdpLQC/Tjeu1ygXtIMy08=;
	b=M+jb3uOCwlIrVjEqUUU9OUpSBi570HgZ42w27qDJYZqRxsEQ1L84pXzH5idvYUm9MXawdS
	HxD1QJ9mI++VOLM5FkvwM0PZb8T24kAyWDpLGmFwBbA7OjKligRE87wik+G6IzxOmXM0sl
	ijQFrzUTF1ZyxLuW9TMmcSs+5Iqe4Tk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1553781280; a=rsa-sha256; cv=none;
	b=YVVYWXKF1uKoRRwzLH7wnU1bKUsT/UzQYjaMAg9pV0b2AuaVm/IoJzgbeH+IsBpq9Fu7Mk
	zBXVMQcnfDbcTmh/ZSVO00/op+APVojXNJWMOqzAEOGtLOhq2Tn3h92ILbvDuEqdS65YxX
	+lwr6xeJAbe7hTkvsNCnwnw7FYZfojw=
ARC-Authentication-Results: i=1; ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [RFC PATCH 15/17] Convert zynq's slcr to 3-phases
 reset
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, alistair.francis@wdc.com,
	pbonzini@redhat.com, marcandre.lureau@redhat.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3yNnvCACv61

Hi Philippe,

On 3/25/19 2:28 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Damien,
>=20
> Le lun. 25 mars 2019 12:16, Damien Hedde <damien.hedde@greensocs.com
> <mailto:damien.hedde@greensocs.com>> a =C3=A9crit=C2=A0:
>=20
>     Change the legacy reset function into the init phase and test the
>     resetting flag in register accesses.
>=20
>     Signed-off-by: Damien Hedde <damien.hedde@greensocs.com
>     <mailto:damien.hedde@greensocs.com>>
>     ---
>     =C2=A0hw/misc/zynq_slcr.c | 14 +++++++++++---
>     =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
> [...]
>     @@ -346,6 +346,10 @@ static uint64_t zynq_slcr_read(void *opaque,
>     hwaddr offset,
>     =C2=A0 =C2=A0 =C2=A0offset /=3D 4;
>     =C2=A0 =C2=A0 =C2=A0uint32_t ret =3D s->regs[offset];
>=20
>     +=C2=A0 =C2=A0 if (qdev_is_resetting((DeviceState *) opaque)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     +=C2=A0 =C2=A0 }
>     +
>     =C2=A0 =C2=A0 =C2=A0if (!zynq_slcr_check_offset(offset, true)) {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR, "z=
ynq_slcr: Invalid read
>     access to "
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0" addr %" HWADDR_PRIx "\n", offset * 4);
>     @@ -361,6 +365,10 @@ static void zynq_slcr_write(void *opaque,
>     hwaddr offset,
>     =C2=A0 =C2=A0 =C2=A0ZynqSLCRState *s =3D (ZynqSLCRState *)opaque;
>     =C2=A0 =C2=A0 =C2=A0offset /=3D 4;
>=20
>     +=C2=A0 =C2=A0 if (qdev_is_resetting((DeviceState *) opaque)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>=20
>=20
> I wonder if that could be moved to generic parent, as an abstract metho=
d.=C2=A0
> But then I'm not sure we can use a generic read() return value.=C2=A0
>=20

I agree it would be better not have to add this kind of test everywhere.
It is one my unresolved problem but I am not sure what is the best soluti=
on.

There is two approachs here I think:
Either we disable/enable explicitely the memory regions in the reset
handlers. But then we have to handle the migration of the memory regions
flags.
Or the memory region handlers somehow check the resetting state (like
here) and we have only to handle the resetting state migration.

Memory region are added using the following code in sysbus:
```
memory_region_init_io(&s->iomem, obj, &uart_ops, s, "uart", 0x1000);
sysbus_init_mmio(sbd, &s->iomem);
sysbus_mmio_map(s, mmio_index, addr);
```
To intercept the read and write without needing a modification of every
read/write handlers, I see two options:

+ we can either find a way to "override" the read and write handlers of
the memory regions. For example, this could be done in sysbus_init_mmio,
or in a dedicated version of the function (eg sysbus_init_mmio_with_reset=
)

+ or we can use the MemoryRegion owner field (here _obj_ in
memory_region_init_io call) to test if the owner is Resettable and
whether it is resetting or not before calling the handlers. In that
case, this will not be limited to sysbus devices.

--
Thanks
Damien



