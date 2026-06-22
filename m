Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D25CDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 12:05:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbdOj-0000kL-Fn; Mon, 22 Jun 2026 08:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <M.Chehab@huawei.com>)
 id 1wbb5m-0007EO-FE
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 05:37:23 -0400
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <M.Chehab@huawei.com>)
 id 1wbb5i-0004Oy-Og
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 05:37:22 -0400
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=T6OMGlJa40Q9T6dI10weGVXZ3INrLA2lPZOh1zkcU1U=;
 b=Uo2+LUTDdWGAdCD08UMXRK9DM0TO1MVw3aA+H3xx+PIA/UI7w4Kt1bMBd01BkMEP7JlbeCqfq
 2MLV7YggYrq1Dp4rs4c7z92oy5uYfnKarKZtU+UZJUq1KPJyrBOaUUk4LYYME0pZPN+SJ+ydMSz
 csfZM8dP9tl/dTUKWDZhBmU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
 by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gkNCY42CpzRhWZ;
 Mon, 22 Jun 2026 17:27:53 +0800 (CST)
Received: from kwepemf200003.china.huawei.com (unknown [7.202.181.229])
 by mail.maildlp.com (Postfix) with ESMTPS id 50FF640537;
 Mon, 22 Jun 2026 17:36:56 +0800 (CST)
Received: from frapema500006.china.huawei.com (7.182.19.102) by
 kwepemf200003.china.huawei.com (7.202.181.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 17:36:55 +0800
Received: from frapema500006.china.huawei.com ([7.182.19.102]) by
 frapema500006.china.huawei.com ([7.182.19.102]) with mapi id 15.02.1544.011;
 Mon, 22 Jun 2026 11:36:53 +0200
From: Mauro Carvalho Chehab <M.Chehab@huawei.com>
To: Jonathan Cameron <jic23@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: "uswg@uefi.org" <uswg@uefi.org>, "taoxiaofei@huawei.com"
 <taoxiaofei@huawei.com>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Dong Wei <Dong.Wei@arm.com>, Samer El-Haj-Mahmoud
 <Samer.El-Haj-Mahmoud@arm.com>, Jose Marinho <jose.marinho@arm.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
Subject: RE: [RESEND] troubles with ARM processor type changes on UEFI 2.11
Thread-Topic: [RESEND] troubles with ARM processor type changes on UEFI 2.11
Thread-Index: AQHdAiC3zXX3hVkmG0i2Z5Vam7BRhrZKIFqAgAAwj9A=
Date: Mon, 22 Jun 2026 09:36:53 +0000
Message-ID: <d685e5a9d5a2470c8a30cfd96e2f81d5@huawei.com>
References: <20260622102518.0ad0e4de@foz.lan>
 <20260622094233.1088c8bf@jic23-huawei>
In-Reply-To: <20260622094233.1088c8bf@jic23-huawei>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.224.107.182]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=113.46.200.221; envelope-from=M.Chehab@huawei.com;
 helo=canpmsgout06.his.huawei.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Jun 2026 08:05:01 -0400
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

On Mon, 22 Jun 2026 09:42:33 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 22 Jun 2026 10:25:18 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>=20
> > (as I got no answer, I'm resending it, c/c some ARM people as well)
> >=20
> > Hi,
> >=20
> > I maintain ACPI HEST support on QEMU and I'm one of the Linux kernel re=
viewers
> > for the RAS subsystem. I'm also the author and maintainer of Linux rasd=
aemon,
> > responsible to handle RAS reports (including from GHES) on Linux.
> >=20
> > There is an incompatible change at UEFI 2.11 spec at Section N.2.4.4.1,
> > which, according with UEFI 2.11 changelog, it is related to this issue:
> >=20
> > 	2462 - Fix the Type mnemonic description in the ARM Processor Error In=
formation Structure
> >=20
> > This is the second time the specs changed the meaning of the type field
> > inside the ARM processor error info:
> >=20
> > - Before UEFI 2.9A, the spec has a list of values for error type.=20
> >   From the specs, type, at offset 4 was described as:
> >    =20
> >             - Cache error
> >             - TLB Error
> >             - Bus Error
> >             - Micro-architectural Error
> >             All other values are reserved
> >    =20
> >     Yet, there was no information about how this would be encoded.
> >    =20
> > - UEFI 2.9A defined the actual expected values as:
> >    =20
> >             - Bit 1 - Cache Error
> >             - Bit 2 - TLB Error
> >             - Bit 3 - Bus Error
> >             - Bit 4 - Micro-architectural Error
> >             All other values are reserved
> >=20
> >     However, even being an incompatible change, the spec didn't change
> >     version field at Section N.2.4.4.1.
> >=20
> >    Linux, QEMU, rasdaemon and likely several BIOS implementations
> >    were updated accordingly.
> >=20
> > - UEFI 2.11 changed the definition to:
> >=20
> >             - Bit 0 - Cache Error
> >             - Bit 1 - TLB Error
> >             - Bit 2 - Bus Error
> >             - Bit 3 - Micro-architectural Error
> >             All other values are reserved
> >=20
> >   Again, another incompatible change and without changing the version
> >   field at Section N.2.4.4.1.
> >=20
> > With the current mess, it is impossible for the OSPM (and RAS apps) to
> > properly map ARM processor error types, as for instance, type=3D2 can
> > mean:
> >=20
> > 	- Bus error (up to UEFI 2.9)
> > 	- Cache error (UEFI 2.9A and UEFI 2.10)
> > 	- TLB error (UEFI 2.11)
> >=20
> > Please issue an errata incrementing version number, to allow OSPM
> > QEMU and rasdaemon to properly interpret this field.
> >  =20
> FWIW I fully agree that an errata is needed. (Though, even though ambiguo=
us,
> changing meaning should probably have been done by deprecating that field
> and adding a new one... too late now!)=20
>=20
> It seems a bit odd to do it this way but Mauro, you should be able
> to file a code first proposal at:
> https://github.com/tianocore/edk2/issues?q=3Dis%3Aissue%20state%3Aopen%20=
label%3Atype%3Acode-first

Thank you to point it to me. I opted to open this as a bug:
	https://github.com/tianocore/edk2/issues/12708

As the root cause for such regression was another bug:
	https://github.com/tianocore/edk2/issues/10524
=09

>=20
> Make sure it has a code first label.  I think you also need
> someone to take it through the committee though (I'm sadly not
> in a position to do so at the moment).
>=20
> Samer or Jose (+CC), can you deal with this one?
>=20
> Thanks,
>=20
> Jonathan
>=20
> > Thanks,
> > Maur =20


--=20
Thanks,
Mauro

