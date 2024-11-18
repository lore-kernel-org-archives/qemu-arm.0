Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2533439njc;
        Mon, 18 Nov 2024 04:16:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVDQ+BhZkBg8GYzzlaUWQKabqfTLHvuwnT1ZFMpJ2xgLMdwhiPy6SwVF42HugjpVxTxtESg5RLkbt5+g==@linaro.org
X-Google-Smtp-Source: AGHT+IHgBiaPnyPmgtb0M+/9BnJfNWBTStFTU4XWIX69LOUSDrQ3GxQhYoBa77xYlbndcIKUVCX/
X-Received: by 2002:a05:6214:5bc2:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6d3fb7c5ca4mr227665286d6.23.1731932187996;
        Mon, 18 Nov 2024 04:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731932187; cv=none;
        d=google.com; s=arc-20240605;
        b=em94bkhWkgmYEivujhPVBsxopRI+9HpNvwfgEjVGlshJcIr+YeVaGJ1U1IEXZYfNsv
         lmUDKCf4oVTbfWJjavBNMFLklj70Xeo/m3ZM9us1zYXU8N6GCPJn+IdhhiymxHLwHVpK
         ZMyga7Py2hbgROlhdXDGC0lZwSeRErErM4Dfmnc+2aFHKIREZDmp0bERuB12gpx5KrAX
         xjXJe4wrOFCoSd7PbJAu8UfgFazJD0vXkok5OVGO2tElBfXi9X5Mj9oypRzVegiTFpGX
         BRunxVztT4ugnnN6PmhW3KvHporm2WpApAIhkbI7IJOd3OMfuYwxg7hemvkiTpLPTZsO
         D68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id;
        bh=n1Ln2iiquUNzKFRIJmqbXsKSiav+3QsxArEI37YO20U=;
        fh=/0iCECF544qkrE6X+sFxmz8wmEL5BBJv3+C7p25e4J4=;
        b=W+UVxRTA8N6fgCdP28ZyfxVM9V/dqzbgf62L0ByTFl3BZ1mh7KSzEpF59cZkJBbkA1
         ZHTaCYTBCcGeWC3J8m4OBrraq+gDXltN1+R/NY5DaW1JeUA6h8x+Ov4/xbju7Jq4cXLY
         mA71hSpIYRVFpowm5AhT3BZ3cotTkJuDCQHkE2gB2Tp36GCYCAd0xX1SPmmk+EwH34Pp
         hF+T68ZzS7BEvkWuJRUVV2poC60RnMbO5vxPMYCiW2Q4fV9U3mRkD+IIwGHf0RVhSVK1
         12WVb8AlSmo1OXM4VLAngcMOEPCJObqHYqb4lnvLAWLzU0HazGS4tqjBJrVQ/ICWguk0
         viWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40db71e1fsi63019326d6.55.2024.11.18.04.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 04:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD0fo-0005Yf-5n; Mon, 18 Nov 2024 07:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1tD0fe-0005WN-DZ
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 07:16:05 -0500
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1tD0fb-0000oF-L1
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 07:15:57 -0500
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1tD0fK-0001jL-Cx; Mon, 18 Nov 2024 13:15:38 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1tD0fJ-001ORb-39;
 Mon, 18 Nov 2024 13:15:37 +0100
Received: from localhost ([127.0.0.1])
 by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1tD0fJ-0069h9-2k;
 Mon, 18 Nov 2024 13:15:37 +0100
Message-ID: <dc456cff7aa40543ac245ccfd9bf504f3c114a9f.camel@pengutronix.de>
Subject: Re: backing storage for eMMC boot partitions
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Guenter Roeck
 <linux@roeck-us.net>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>,  Joel Stanley <joel@jms.id.au>, qemu-block
 <qemu-block@nongnu.org>
Date: Mon, 18 Nov 2024 13:15:37 +0100
In-Reply-To: <7c8658ef-e61b-4a46-91cf-6dc26e78158c@kaod.org>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <d9f18091-aee1-4b32-ba72-e1028fe433c9@roeck-us.net>
 <5262a33d-d0c5-452b-9869-f8f482b1c857@linaro.org>
 <07664ec3-6b46-4b27-9d8c-9e2ff34c9dbe@kaod.org>
 <600baa43c3dd3547338934717cfb57c5e12b0d23.camel@pengutronix.de>
 <84c32f2d-7d9a-4e5a-8b67-1f954dd493f6@roeck-us.net>
 <b67f302a11a679c3fdb02318eb9ef0be559d14ce.camel@pengutronix.de>
 <53cbb597-e7f2-4742-bf85-928c704ddbcf@linaro.org>
 <443f1b0c-8184-4bf4-9f68-c23d7de3bc36@roeck-us.net>
 <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
 <c27fbed6-596e-4ce7-a6ca-6d12d7205e99@roeck-us.net>
 <86fa6e68-5861-4d4d-941f-95b278074eb6@kaod.org>
 <1c917e4a-de50-45b9-ac9c-eb04d51401a2@roeck-us.net>
 <00997cca-6f4a-4b99-9616-2af6a25cd4fb@kaod.org>
 <4246f82b-597c-4a5d-9a55-18a584e7d8c7@roeck-us.net>
 <670fa7bf052d8f292f9bd25c330c8d7bdba02770.camel@pengutronix.de>
 <b6641b83-33dc-46f8-b61b-fbdb9ab9bc40@roeck-us.net>
 <9046a4327336d4425f1e7e7a973edef9e9948e80.camel@pengutronix.de>
 <7c8658ef-e61b-4a46-91cf-6dc26e78158c@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
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
X-TUID: ZAEhTaZj4hC0

Hi,

On Mon, 2024-11-18 at 10:14 +0100, C=C3=A9dric Le Goater wrote:
> > > also boots from the emmc controller. How do I provide the
> > > bus and bus index ? "bus=3Dsdhci-bus.2" doesn't work for me.
> > > There is "sd-bus", but it does not have an index.
>=20
> Yes. Changes are required in the sdhci model and in the boards using
> it.
>=20
> > I've not really understood how to assemble more complex setups
> > using qemu's commandline when the board already creates some of the
> > devices.
>=20
> Yes. That's a "problem" to fix for emmc/sd devices. They should only
> be created when defaults_enabled(), just like the flash devices.

This is -nodefaults, right? The man-page for that says:
  -nodefaults
         Don't  create default devices. Normally, QEMU sets the de=E2=80=90
         fault devices like serial  port,  parallel  port,  virtual
         console,  monitor  device,  VGA adapter, floppy and CD-ROM
         drive and others. The -nodefaults option will disable  all
         those default devices.

That sounds like it would require explicit configuration of the devices
on the SoC (such as UARTs) as well? Having to specify them (perhaps
even with their MMIO addresses) doesn't seem convenient. :)

aspeed seems to only (or additionally?) skip creation of the flash
devices with -nodefaults.

Isn't there a way to configure only default devices as disabled? Or to
dynamically attach a user-created SD/eMMC device to an existing SD
controller?

In system/vl.c, I found 'default_sdcard', which is disabled in some
cases. I wasn't able to figure out how to use it or if it would help
for this use-case.

Jan

> > Perhaps C=C3=A9dric can explain how the different boot options are
> > configured for aspeed?
>=20
> See
> https://qemu.readthedocs.io/en/v9.1.0/system/arm/aspeed.html#boot-options
> and the avocado/functional tests for examples.
>=20
> The eMMC case is missing from the docs. Here is a proposal :
> https://lore.kernel.org/qemu-devel/20241118090648.187720-1-clg@redhat.com=
/
>=20
> Thanks,
>=20
> C.
