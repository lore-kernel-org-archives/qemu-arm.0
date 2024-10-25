Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1139003njx;
        Fri, 25 Oct 2024 08:26:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaoiLy2BkSsWQFBmQIet3ApXOCJ/oFiNGFw5pjvYxk9rn2ddx+NT0fmiJf6jriLbLF8CX9H0JoW0l0DA==@linaro.org
X-Google-Smtp-Source: AGHT+IHkCKUXtFLLXedkFrdxq5csLhkxZG8p24/uvRmOJ2LzYPL5ga1jvWAh6nWXonKD60w3s50m
X-Received: by 2002:ac8:5d43:0:b0:460:a9ec:b50e with SMTP id d75a77b69052e-46114715479mr146616891cf.38.1729869962607;
        Fri, 25 Oct 2024 08:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729869962; cv=none;
        d=google.com; s=arc-20240605;
        b=MCJ5PWN4HsAZxZjbnFBXgQbGZx42jT4TsHgvWvS14lOBqDO8X/rPAOd8XN0hKqLDtf
         yJnuz89eXZuwDFgjN0VCIT4yia71uOnL/YM6hU2qK3GfEaIpW3WJZgCdFtl7hNeL/Gy6
         weWRvOYHA5uBVxIa0TQOggNnk2GQ6zUjAWmuvGI1geXfXCHMbcBh9PFCQpue+8h81XqL
         mAKkhbA49d1X2CTK1KShLIauYidRGhM1q5ZFs7UR8X9TLvp3tmHLDkpH4w4UVBT/4E6u
         dA3AvK4b7/j0UzolsfPFCan+j1ja06qVirKhqJoKMZNpxGn9V1KJ8/pFib0eXQOSvVea
         f/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id;
        bh=KsYyQttbpL3ZH0ngkRFFWco798b7Y+XxejROx7CxYJ4=;
        fh=Wc6k/MgZRYQS6gWStcrFzRXD5oFgUFWXlKexkMs9HmM=;
        b=EKwMgMJtx7hPNn+0uzCU8eq73+VViiIRJU0646ZC+23/V77ErlfYsmA5Z6XWxt/Guc
         WHVWOp7gFt0EfP5dX3p7v7nql5bgIkXfBdHj58C0gU5X90ag3i1ud/0GGZC//Hzw527z
         MDATiKC8pxoaQkJvMsoAhJo97szFUaUIsS/Drub2uDIg+04skWzTYEqInZPHMQxuNpmi
         zJT1zTUhkSncKKaNRyRQpW/44qztwTJm9zP0HyOU0MVmYjznH6Yc3B8eeD2Wu3y0pUgY
         IQ/Rkrb7lV1ke0G+d1sBKfwGzZHw8p9tkeN9GZiLhBgJNfGuYqOFBRZRNQo/boX3MrNX
         YkWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461323d8ab4si17771301cf.634.2024.10.25.08.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 08:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4MC5-00059X-7P; Fri, 25 Oct 2024 11:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t4MC3-00058w-5p
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 11:25:39 -0400
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t4MC1-00007Y-6o
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 11:25:38 -0400
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1t4MBp-0004XG-Uv; Fri, 25 Oct 2024 17:25:25 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t4MBo-000OFW-2e;
 Fri, 25 Oct 2024 17:25:24 +0200
Received: from localhost ([127.0.0.1])
 by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t4MBo-006ahU-05;
 Fri, 25 Oct 2024 17:25:24 +0200
Message-ID: <b67f302a11a679c3fdb02318eb9ef0be559d14ce.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>, =?ISO-8859-1?Q?C=E9dric?= Le Goater	
 <clg@kaod.org>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>, Joel Stanley
 <joel@jms.id.au>
Date: Fri, 25 Oct 2024 17:25:24 +0200
In-Reply-To: <84c32f2d-7d9a-4e5a-8b67-1f954dd493f6@roeck-us.net>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
 <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
 <a65a224e-4f54-436d-b555-734a8926d941@roeck-us.net>
 <aa7755a2-e6fa-4d23-bcac-a630e6da98db@linaro.org>
 <d9f18091-aee1-4b32-ba72-e1028fe433c9@roeck-us.net>
 <5262a33d-d0c5-452b-9869-f8f482b1c857@linaro.org>
 <07664ec3-6b46-4b27-9d8c-9e2ff34c9dbe@kaod.org>
 <600baa43c3dd3547338934717cfb57c5e12b0d23.camel@pengutronix.de>
 <84c32f2d-7d9a-4e5a-8b67-1f954dd493f6@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-arm@nongnu.org
Received-SPF: pass client-ip=2a0a:edc0:2:b01:1d::104;
 envelope-from=jlu@pengutronix.de; helo=metis.whiteo.stw.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yYQeUmyC2i4U

On Fri, 2024-10-25 at 06:59 -0700, Guenter Roeck wrote:
> On 10/25/24 02:57, Jan L=C3=BCbbe wrote:
> > On Fri, 2024-10-25 at 08:55 +0200, C=C3=A9dric Le Goater wrote:
> > > On 10/24/24 19:59, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > Cc'ing Jan.
> > > >=20
> > > > On 22/10/24 12:04, Guenter Roeck wrote:
> > > >=20
> > > > > I have no idea how this is supposed to work, and I don't think it=
 works
> > > > > as implemented. I'll revert commit e32ac563b83 in my local copy o=
f qemu.
> > > > > Jan, can you have a look at this bug report please? Otherwise I'l=
l
> > > > > have a look during soft freeze.
> >=20
> > Guenter, just to make sure: In your case [1], you had "boot-emmc" (see
> > aspeed_machine_ast2600_class_emmc_init) enabled, right? Otherwise the
>=20
> I tried both enabled and disabled.
>=20
> > boot partition size would be 0, meaning that the eMMC has no boot
> > partitions.
>=20
> That is what I would have expected, but it does not reflect reality.
>=20
> > In that configuration, your backing file needs to have space for the
> > boot partitions at the start (2*1MiB) and the rootfs starts at the 2
> > MiB offset.
> >=20
>=20
> boot-emmc doesn't make a difference, because
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (emmc) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qdev_prop_set_uint64(card, "boot-partition-size", 1 * MiB);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qdev_prop_set_uint8(card, "boot-config",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_emmc ? 0x1 << 3 : 0x0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> in hw/arm/aspeed.c sets the boot partition size independently of the
> boot-emmc flag.=C2=A0

Ah, yes. :/

So you can have SD, eMMC with boot from boot partition *disabled* or
eMMC with boot from boot partition *enabled*.

> I suspect that the expectation is that I always provide
> an emmc image with a 2 MB gap at the beginning, but in my opinion that is
> really hyper-clumsy, and I simply won't do it, sorry.

I was surprised that the boot partitions' contents are stored in the
same backing file as the main area (instead of being separate files).
But I've not researched why it was designed this way.

> I can work around
> the problem by changing the above code to only set boot-partition-size if
> boot_emmc is set, or I can revert commit e32ac563b83. For now I chose the
> latter.

With e32ac563b83 reverted, your backing file layout will change *at
runtime* depending on whether booting from the boot partition is
enabled via EXT CSD registers. You should be able to try that using
'mmc bootpart enable <boot_part> 0 /dev/mmcblk0' (with boot_part=3D0 for
disabled and boot_part=3D1/2 for enabled).


I'm not sure what the best way forward is... perhaps make the boot-
partition-size zero if boot_emmc is false? e.g.

@@ -339,7 +339,12 @@ static void sdhci_attach_drive(SDHCIState *sdhci, Driv=
eInfo *dinfo, bool emmc,
         }
         card =3D qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
         if (emmc) {
-            qdev_prop_set_uint64(card, "boot-partition-size", 1 * MiB);
+            /*
+             * Avoid the requirement for a padded disk image if booting fr=
om
+             * eMMC boot partitions is not needed.
+             */
+            qdev_prop_set_uint64(card, "boot-partition-size",
+                                boot_emmc ? 1 * MiB : 0);
             qdev_prop_set_uint8(card, "boot-config",
                                 boot_emmc ? 0x1 << 3 : 0x0);
         }


Then you'd have the choice between:
- an eMMC, but without boot partitions (and simple backing=C2=A0file=C2=A0l=
ayout)
- an eMMC with boot partitions and need a backing file with=C2=A0
  the=C2=A0boot partitions at the beginning

That might be the lesser evil. :)

Jan

--=20
Pengutronix e.K.                        |                             |
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |


