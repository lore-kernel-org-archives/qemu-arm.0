Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5648793wrt;
        Tue, 16 Oct 2018 03:02:43 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61GZZfc0x3DH4uwg1hnbroAoKx5HXpGq8XiWAHxm22DpanVAr1DCJs02QXsbamI5mXh0t8r
X-Received: by 2002:ac8:19ea:: with SMTP id s39-v6mr20064115qtk.215.1539684163557;
        Tue, 16 Oct 2018 03:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539684163; cv=none;
        d=google.com; s=arc-20160816;
        b=CypO33cCdU9BNXHOXcSUQgqLm4JZ9tODyG7QKFcSKcoT/GDjJiY+zhDxHZ9w5nwrWC
         S/QYGZCBPRi1oE2zDq0EojUcFr5mBerfJBqrWZgFh0KP3eCdsaddgIiH4nLGVWrZ6v2h
         2PfQSPdDEMV/GQQObW115KQXxu06hVrPyRriYeYg3lexANIQIM6o7GZ1Dddd+GIfZE3y
         2M1UldnZMayUWGIrXIHu5rgJ16fOwN87FUfnot2/BkZ0vfntdjjviqLLmD3l8e6BW2dg
         h1fdJZejJxIifrfERfjKv5YaQsgMp1q7goAsn+pLVIBKjgMbtv6W5A0PKE9VrnOBWmc6
         QRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=y72Oa4do7W/B6/io2iUdaD+lXYSHQjBQDiBL8lmaEJQ=;
        b=pKWlqLG4eJB5esLeOhm41eCPjJZRXqo8uxFCVa84kaqa+wwB5VGDwjT5L8lRcCs6Iq
         QQ1SZPpWN3KvLRFf3tomOAqA9024LtRa9+Fx7mfld8ctT5YW7Cp2L81bQa1EokID3X2j
         PbfbRPIxk507JooIFSBuexPAEaf+naPNc94+iK6Y3E1V9UwgQQdx/SzNUaIelNrpdPJU
         ShULx7mPzyePPPMH4QLqW+knvO1u9BMyeVwvDO5F3Y/NqCMyJOuwabJ08N+nZY9YbbB3
         78Zn041FLilrICPW48092ztm0wjNCFuA2Kr2fWnk8ePXdRn1d4+qe8ohIz8hrE6syFHj
         MxwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198-v6si2723092qkb.168.2018.10.16.03.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 03:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCMBV-0008QX-7y
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 06:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>) id 1gCMBF-0008Ks-U4
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>) id 1gCMB1-0002bY-OP
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:02:17 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:40980
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andre.przywara@arm.com>)
	id 1gCMB1-0002Wa-HK; Tue, 16 Oct 2018 06:02:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47160341;
	Tue, 16 Oct 2018 03:02:09 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F5603F71F;
	Tue, 16 Oct 2018 03:02:08 -0700 (PDT)
Date: Tue, 16 Oct 2018 11:02:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Message-ID: <20181016110200.0b20a7f3@donnerap.cambridge.arm.com>
In-Reply-To: <65e2edeee9d94a288938da9cec4b16bb@dornerworks.com>
References: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
	<73dcea68-2342-63b7-9691-a151f00a42e8@redhat.com>
	<65e2edeee9d94a288938da9cec4b16bb@dornerworks.com>
Organization: ARM
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: Increase
 compliance with kernel arm64 boot protocol.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WBenXQT5GJS2

On Tue, 16 Oct 2018 01:19:35 +0000
Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com> wrote:

Hi,

Stewart, thanks a lot for picking this up!

> On Monday, October 15, 2018 6:05 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Stewart,
> >=20
> > On 15/10/2018 23:26, Stewart Hildebrand wrote: =20
> > > +            /* For the virt board, we write our startup
> > > "bootloader" at the very
> > > +             * bottom of RAM, so that bit can't be used for the
> > > image. To avoid
> > > +             * overlap in case the image requests to be loaded
> > > at an offset
> > > +             * smaller than our bootloader, we increment the
> > > load offset to the
> > > +             * next 2MB.
> > > +             */
> > > +            if (kernel_load_offset < FIXUP_MAX) { =20
> >=20
> > I don't understand how this is related to FIXUP_MAX... =20
>=20
> You're right, my apologies, it's not directly related.
> write_bootloader() calculates the size of the bootloader like so:
>     len =3D 0;
>     while (insns[len].fixup !=3D FIXUP_TERMINATOR) {
>         len++;
>     }
>=20
> The size of the bootloader then would be len * sizeof(uint32_t)
>=20
> It would be nice not to have to repeat that logic in
> load_aarch64_image(). I'll send out a v2 after I take some time to
> wrap my head around it...=20

I wonder if this could be done much easier, since TEXT_OFFSET must
actually be page aligned. So all we would need is an *upper bound* for
the bootloader size, as long as that is below 4K we wouldn't even loose
anything.

Cheers,
Andre.

> >  =20
> > > +                kernel_load_offset +=3D 2 << 20; =20
> >=20
> > You can use +=3D 2 * MiB; which is easier to review. =20
>=20
> OK, I will include this in v2.

