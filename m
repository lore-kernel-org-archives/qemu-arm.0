Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C775ECA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 17:07:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utUTY-0007aa-Rr; Tue, 02 Sep 2025 13:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1utUTY-0007a6-2d
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 13:07:20 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1utUTU-0007ca-EO
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 13:07:19 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b4cb3367d87so3191253a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1756832834; x=1757437634;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CR78GFxKiZmUL74IgiD/HidqP9HCZYHKqFZRrAYZYq0=;
 b=UjAkt0XaVpuxDcWnMqpcvbNVXurov85yk/VbVSzoZmgxt7KiuZZZjkKaDFbgKsptno
 mtNWneQ/p9kLfacsY2mZNY8YhA+o5qerw5fwYy1npO/4g4Qp5fPz0NphcuDetunh6sua
 U2gahXu/K1QATGdJ6HAkFvyOPPUrY35iUyuWfAHkiwOsjbXGqs0L9UUq8vdL7D6Ikz/s
 bosX/0ajlUMjOH19V2PmVh9w3BJDw+D1Ceh9AKuMjG6h+JLEOw4mymxm57N0rXy2KfIJ
 3XyYpMrwK43xA9OnCXVtoFJz2wrtlTjzOsrKUHliLqGIWiILR0MrNzM144FGVGOMvk4k
 +aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756832834; x=1757437634;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CR78GFxKiZmUL74IgiD/HidqP9HCZYHKqFZRrAYZYq0=;
 b=BfsxfosvjrB3afkYf8PLoqrftCXEcJEjCFBLuIYmIsCQZE1sZrY5b8m+OdPNgwqLVT
 AMA1yBbhV/e1xqpZvGAhJDDtWSN0AyHhjE4RCJNWNq7n6OspVUqWnFQTmJ/o2szN3mMN
 YARvCnOX8rbannTcNUDs9gaxhJEMWDLWUEtQjgPNdNwBZvn+SmbqahGRKY1eamd+m6Mp
 TOeCHa/tAaYNsUfE7QX8I0zt6YVnHio5X4DWTPAy4Pa2nWnXj3vuEa0n2ahxG0Prg/BQ
 oWLUFELMWfPtKSq3B8pNqSTDg3ClFT29tZCRzmaQTAyXdsdJM3+0YU7xvAIASwNmsrvl
 ys3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS364eGeqWQ6pd6EDBquLtnmMrgB93kRYrpz1o2QNZ7gPCUv9CkBz4u1RmzhgMxYMS55/cPRaE6w==@nongnu.org
X-Gm-Message-State: AOJu0YzY/FoX2ybw+1INp/GeKtAxE1YaGNMT2GLOVixiZLEF1aD4lYl5
 vtPkAwErHJeFAzxnNIKBuDAfwjfHkRU9hPQsNgzjkT1YSMt3wYi9xrvnBCAsxP+pOX0uBtWDTkT
 /xed4SD8CcghxLwNi2uSe5vHgjoxKbh7hUsgDThyqNQ==
X-Gm-Gg: ASbGncuDT0SIwJ+1CXQkTtj4ET5hJMBTHJxTU1eJS2SsL4TtxUmTcUazCr3gcYDNeYq
 h6+Go2/UlI5pCb7oMuL5O7mF4Vwq8hy5aZ4fkeehkX45kyjwjKYYYjUN+yT1jkOQ7n3QiBRmmwR
 pSl5MJyogAfEhe1VgigalC/l5Qy7WYMgQ/8SHFcdQ8hXAwXChp5EUYHdXt9PWwkn+eqEj3Npa2N
 hgQGdJqG2GZ0h0YYnCYBq4f1+SSifAOtnh0NOk=
X-Google-Smtp-Source: AGHT+IEtCo2SErTdbJRmoaaLMDJrXnZKoGryLg8ZEVHBUJ46QuxVleZjWNBpiPVNJwmTE0AWMS1NxVSTyLFFZoeBPKQ=
X-Received: by 2002:a17:90b:3f84:b0:329:d85b:d9ee with SMTP id
 98e67ed59e1d1-329d85bdae7mr4963809a91.23.1756832833763; Tue, 02 Sep 2025
 10:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756706188.git.jan.kiszka@siemens.com>
 <86217712232abd5152e7dfa98111f57b9b78d83b.1756706188.git.jan.kiszka@siemens.com>
 <6289fe04-82be-4a34-9fed-b0cc08e3b8f0@linaro.org>
 <a9fdf524-0ca1-45db-be39-7bfccc468f0f@siemens.com>
 <11808e86-cee0-48bf-8fbd-de13a9a25ed0@linaro.org>
 <4c039b3c-dc2c-4478-b1bb-90b925e56245@linaro.org>
 <c8e1a073-7702-4bad-b7f1-2b4f51da47f4@kaod.org>
 <03a51e36-9a15-4b49-a310-c36a4d0af360@linaro.org>
 <2abbaeda-f9dc-4045-a9f7-b2b48451255f@kaod.org>
 <42310bdb-4fad-4df2-b7ad-3ff3f863e248@linaro.org>
 <d21f6449-e646-42fc-8277-b011a886e9c9@linaro.org>
 <41d2e67e-3345-4720-b3aa-1051224025de@siemens.com>
 <21b6726a-1ceb-4782-a219-36f32cebb774@siemens.com>
 <a1463f9e36d8b3e6289859bec9a0a5a758709316.camel@pengutronix.de>
In-Reply-To: <a1463f9e36d8b3e6289859bec9a0a5a758709316.camel@pengutronix.de>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 2 Sep 2025 11:07:02 -0600
X-Gm-Features: Ac12FXw2wEKjxkKgZ1N5Of__fmN_Hz8kxEuAxNu7KA6yksaDaPvkX6BLdNR5q9o
Message-ID: <CANCZdfprQZTVskt-EPgT-ALMO3HU-akdcw+yZ5=9Cmu1F00etQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/sd/sdcard: Fix size check for backing block
 image
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: multipart/alternative; boundary="000000000000fc96ce063dd484e4"
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=wlosh@bsdimp.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000fc96ce063dd484e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 10:49=E2=80=AFAM Jan L=C3=BCbbe <jlu@pengutronix.de>=
 wrote:

> On Tue, 2025-09-02 at 18:39 +0200, Jan Kiszka wrote:
> > > > I expect us to be safe and able to deal with non-pow2 regions if we
> use
> > > > QEMUSGList from the "system/dma.h" API. But this is a rework nobody
> had
> > > > time to do so far.
> > >
> > > We have to tell two things apart: partitions sizes on the one side an=
d
> > > backing storage sizes. The partitions sizes are (to my reading) clear=
ly
> > > defined in the spec, and the user partition (alone!) has to be power =
of
> > > 2. The boot and RPMB partitions are multiples of 128K. The sum of the=
m
> > > all is nowhere limited to power of 2 or even only multiples of 128K.
> > >
> >
> > Re-reading the part of the device capacity, the rules are more complex:
> >  - power of two up to 2 GB
> >  - multiple of 512 bytes beyond that
> >
> > So that power-of-two enforcement was and still is likely too strict.
>

It is. Version 0 (and MMC) cards had the capacity encoded like so:
                m =3D mmc_get_bits(raw_csd, 128, 62, 12);
                e =3D mmc_get_bits(raw_csd, 128, 47, 3);
                csd->capacity =3D ((1 + m) << (e + 2)) * csd->read_bl_len;
so any card less than 2GB (well, technically 4GB, but 4GB version 0 cards
were
rare and broke some stacks... I have one and I love it on my embedded ARM
board
that can't do version 1 cards). Version 1 cards encoded it like:
                csd->capacity =3D ((uint64_t)mmc_get_bits(raw_csd, 128, 48,
22) +
                    1) * 512 * 1024;
So it's a multiple of 512k. These are also called 'high capacity' cards.

Version 4 introduces an extended CSD, which had a pure sector count in the
EXT CSD. I think this
is only for MMC cards. And also the partition information.


> > But I still see no indication, neither in the existing eMMC code of QEM=
U
> > nor the spec, that the boot and RPMB partition sizes are included in
> that.
>
> Correct. Non-power-of-two sizes are very common for real eMMCs. Taking a
> random
> one from our lab:
> [    1.220588] mmcblk1: mmc1:0001 S0J56X 14.8 GiB
> [    1.228055]  mmcblk1: p1 p2 p3 p4
> [    1.230375] mmcblk1boot0: mmc1:0001 S0J56X 31.5 MiB
> [    1.233651] mmcblk1boot1: mmc1:0001 S0J56X 31.5 MiB
> [    1.236682] mmcblk1rpmb: mmc1:0001 S0J56X 4.00 MiB, chardev (244:0)
>
> For eMMCs using MLC NAND, you can also configure part of the user data
> area to
> be pSLC (pseudo single level cell), which changes the available capacity
> (after
> a required power cycle).
>

Yes. Extended partitions are a feature of version 4 cards, so don't have
power-of-2 limits since they are a pure sector count in the ext_csd.

Warner

--000000000000fc96ce063dd484e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 2, =
2025 at 10:49=E2=80=AFAM Jan L=C3=BCbbe &lt;<a href=3D"mailto:jlu@pengutron=
ix.de">jlu@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, 2025-09-02 at 18:39 +0200, Jan Kiszka wrot=
e:<br>
&gt; &gt; &gt; I expect us to be safe and able to deal with non-pow2 region=
s if we use<br>
&gt; &gt; &gt; QEMUSGList from the &quot;system/dma.h&quot; API. But this i=
s a rework nobody had<br>
&gt; &gt; &gt; time to do so far.<br>
&gt; &gt; <br>
&gt; &gt; We have to tell two things apart: partitions sizes on the one sid=
e and<br>
&gt; &gt; backing storage sizes. The partitions sizes are (to my reading) c=
learly<br>
&gt; &gt; defined in the spec, and the user partition (alone!) has to be po=
wer of<br>
&gt; &gt; 2. The boot and RPMB partitions are multiples of 128K. The sum of=
 them<br>
&gt; &gt; all is nowhere limited to power of 2 or even only multiples of 12=
8K.<br>
&gt; &gt; <br>
&gt; <br>
&gt; Re-reading the part of the device capacity, the rules are more complex=
:<br>
&gt; =C2=A0- power of two up to 2 GB<br>
&gt; =C2=A0- multiple of 512 bytes beyond that<br>
&gt; <br>
&gt; So that power-of-two enforcement was and still is likely too strict.<b=
r></blockquote><div><br></div><div>It is. Version 0 (and MMC) cards had the=
 capacity encoded like so:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 m =3D mmc_get_bits(raw_csd, 128, 62, 12);</div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D mmc_get_bits(raw_csd, 1=
28, 47, 3);</div><div class=3D"gmail_quote gmail_quote_container"><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csd-&gt;capacity =3D (=
(1 + m) &lt;&lt; (e + 2)) * csd-&gt;read_bl_len;</div><div>so any card less=
 than 2GB (well, technically 4GB, but 4GB version 0 cards were</div><div>ra=
re and broke some stacks... I have one and I love it on=C2=A0my embedded AR=
M board</div><div>that can&#39;t do version 1 cards). Version 1 cards encod=
ed it like:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 csd-&gt;capacity =3D ((uint64_t)mmc_get_bits(raw_csd, 128, 48, 22) +<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1) *=
 512 * 1024;</div><div>So it&#39;s a multiple of 512k. These are also calle=
d &#39;high capacity&#39; cards.</div><div><br></div><div>Version 4 introdu=
ces an extended CSD, which had a=C2=A0pure sector count in the EXT CSD. I t=
hink this</div><div>is only for MMC cards. And also the partition informati=
on.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; But I still see no indication, neither in the existing eMMC code of QE=
MU<br>
&gt; nor the spec, that the boot and RPMB partition sizes are included in t=
hat.<br>
<br>
Correct. Non-power-of-two sizes are very common for real eMMCs. Taking a ra=
ndom<br>
one from our lab:<br>
[=C2=A0 =C2=A0 1.220588] mmcblk1: mmc1:0001 S0J56X 14.8 GiB<br>
[=C2=A0 =C2=A0 1.228055]=C2=A0 mmcblk1: p1 p2 p3 p4<br>
[=C2=A0 =C2=A0 1.230375] mmcblk1boot0: mmc1:0001 S0J56X 31.5 MiB<br>
[=C2=A0 =C2=A0 1.233651] mmcblk1boot1: mmc1:0001 S0J56X 31.5 MiB<br>
[=C2=A0 =C2=A0 1.236682] mmcblk1rpmb: mmc1:0001 S0J56X 4.00 MiB, chardev (2=
44:0)<br>
<br>
For eMMCs using MLC NAND, you can also configure part of the user data area=
 to<br>
be pSLC (pseudo single level cell), which changes the available capacity (a=
fter<br>
a required power cycle).<br></blockquote><div><br></div><div>Yes. Extended =
partitions are a feature of version 4 cards, so don&#39;t have power-of-2 l=
imits since they are a pure sector count in the ext_csd.</div><div><br></di=
v><div>Warner=C2=A0</div></div></div>

--000000000000fc96ce063dd484e4--

