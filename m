Received: by 10.25.208.211 with SMTP id h202csp300957lfg;
        Thu, 17 Mar 2016 01:54:55 -0700 (PDT)
X-Received: by 10.140.20.183 with SMTP id 52mr12550747qgj.38.1458204895108;
        Thu, 17 Mar 2016 01:54:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si7079451qgy.13.2016.03.17.01.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 01:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agThm-00056o-Oh
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 04:54:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1agThk-00056f-Cn
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1agThg-0008O9-7C
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:54:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1agThg-0008O4-1V; Thu, 17 Mar 2016 04:54:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 7BA05627C3;
	Thu, 17 Mar 2016 08:54:47 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2H8skH0028130; Thu, 17 Mar 2016 04:54:47 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id B5A2E81727; Thu, 17 Mar 2016 09:54:45 +0100 (CET)
Message-ID: <1458204885.26199.11.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Date: Thu, 17 Mar 2016 09:54:45 +0100
In-Reply-To: <BLUPR0301MB2034B9E6F037E31B3AC6E3619E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA_6NvDW4LYHTmcuH3j07zQds6gH=J2FC4zV9JDg13JWwA@mail.gmail.com>
	<BLUPR0301MB2034B9E6F037E31B3AC6E3619E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 17 Mar 2016 08:54:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?ISO-8859-1?Q?Gr=E9gory?= ESTRADE <gregory.estrade@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/5] Raspberry Pi framebuffer,
 DMA and Windows support
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
X-TUID: llmSo6VfykyC

  Hi,

> [    9.167683] mmc0: command never completed.
> [    9.172133] mmc0:>cmd op 52 arg 0xc00 flags 0x195 - resp 00000000 0000=
0000 00000000 00000000, err 0
> [    9.180379] mmc0: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REGISTER DUMP =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    9.187193] mmc0: SDCMD  0x00008034
> [    9.190113] mmc0: SDARG  0x00000c00
> [    9.192952] mmc0: SDTOUT 0x00f00000
> [    9.196064] mmc0: SDCDIV 0x0000026f
> [    9.199091] mmc0: SDRSP0 0x00000000
> [    9.201915] mmc0: SDRSP1 0x00000000
> [    9.204915] mmc0: SDRSP2 0x00000000
> [    9.207672] mmc0: SDRSP3 0x00000000
> [    9.210453] mmc0: SDHSTS 0x000007f8
> [    9.213612] mmc0: SDVDD  0x00000001
> [    9.216977] mmc0: SDEDM  0x00010800
> [    9.219728] mmc0: SDHCFG 0x0000040a
> [    9.222666] mmc0: SDHBCT 0x00000000
> [    9.228116] mmc0: SDHBLC 0x00000000
> [    9.230866] mmc0: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Saw that one too (4.4 kernel).

Also I had to remove the rng from the device tree to come that far in
the first place, otherwise the kernel hangs earlier when trying to
initialize the rng.

cheers,
  Gerd

