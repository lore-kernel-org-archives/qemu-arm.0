Received: by 10.80.166.35 with SMTP id d32csp1106956edc;
        Fri, 4 Nov 2016 04:18:36 -0700 (PDT)
X-Received: by 10.157.17.174 with SMTP id v43mr10213990otf.251.1478258316134;
        Fri, 04 Nov 2016 04:18:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w8si7867689otb.44.2016.11.04.04.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Nov 2016 04:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2cW2-0003Wz-L6
	for alex.bennee@linaro.org; Fri, 04 Nov 2016 07:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c2cVn-0003RD-6z
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 07:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c2cVi-0004o8-3X
	for qemu-arm@nongnu.org; Fri, 04 Nov 2016 07:18:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35336)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c2cVh-0004nX-SE; Fri, 04 Nov 2016 07:18:14 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5024C057EC9;
	Fri,  4 Nov 2016 11:18:12 +0000 (UTC)
Received: from [10.36.116.45] (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA4BI91H001327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Nov 2016 07:18:10 -0400
References: <1476266275-11155-1-git-send-email-thuth@redhat.com>
	<CAKmqyKMkt5ii21KqUV_J8=oNqsqXaYH9dUkxCy1+u4+P-Uqthg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5f8ea14d-8d98-139c-d54a-051d577f944b@redhat.com>
Date: Fri, 4 Nov 2016 12:18:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMkt5ii21KqUV_J8=oNqsqXaYH9dUkxCy1+u4+P-Uqthg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="naDFjoDOqWOGOjkb3Lo20X2rkarSl99ec"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 04 Nov 2016 11:18:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] MAINTAINERS: Add some ARM
 related files to the corresponding sections
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
Cc: Peter Chubb <peter.chubb@nicta.com.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2LH/pHkrqew

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--naDFjoDOqWOGOjkb3Lo20X2rkarSl99ec
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.10.2016 15:34, Alistair Francis wrote:
> On Wed, Oct 12, 2016 at 11:57 AM, Thomas Huth <thuth@redhat.com> wrote:=

>> The files w/cpu/a*mpcore.c are already assigned to the ARM CPU
>> section, but the corresponding headers include/hw/cpu/a*mpcore.h
>> are still missing.
>>
>> The file hw/*/imx* are already assigned to the i.MX31 machine, but
>> the corresponding header files include/hw/*/imx* are still missing.
>>
>> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
>> CP, hw/cpu/realview_mpcore.c seems to belong to Real View, and
>> hw/misc/mst_fpga.c seems to belong to PXA2XX.
>>
>> And the files hw/misc/zynq* and include/hw/misc/zynq* seem to belong
>> to the Xilinx Zynq machine.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2:
>>  - Added some more file
>>  - Dropped hw/misc/arm_sysctl.c since it's unclear right now how to
>>    represent a file that belong to multiple machines
>>
>>  MAINTAINERS | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8c1c0a1..7fc5c9d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -107,6 +107,7 @@ S: Maintained
>>  F: target-arm/
>>  F: hw/arm/
>>  F: hw/cpu/a*mpcore.c
>> +F: include/hw/cpu/a*mpcore.h
>>  F: disas/arm.c
>>  F: disas/arm-a64.cc
>>  F: disas/libvixl/
>> @@ -408,6 +409,7 @@ M: Peter Chubb <peter.chubb@nicta.com.au>
>>  L: qemu-arm@nongnu.org
>>  S: Odd fixes
>>  F: hw/*/imx*
>> +F: include/hw/*/imx*
>>  F: hw/arm/kzm.c
>>  F: include/hw/arm/fsl-imx31.h
>>
>> @@ -416,6 +418,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/arm/integratorcp.c
>> +F: hw/misc/arm_integrator_debug.c
>>
>>  Musicpal
>>  M: Jan Kiszka <jan.kiszka@web.de>
>> @@ -440,6 +443,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/arm/realview*
>> +F: hw/cpu/realview_mpcore.c
>>  F: hw/intc/realview_gic.c
>>  F: include/hw/intc/realview_gic.h
>>
>> @@ -452,6 +456,7 @@ F: hw/arm/spitz.c
>>  F: hw/arm/tosa.c
>>  F: hw/arm/z2.c
>>  F: hw/*/pxa2xx*
>> +F: hw/misc/mst_fpga.c
>>  F: include/hw/arm/pxa.h
>>
>>  Stellaris
>> @@ -473,7 +478,8 @@ L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/*/xilinx_*
>>  F: hw/*/cadence_*
>> -F: hw/misc/zynq_slcr.c
>> +F: hw/misc/zynq*
>> +F: include/hw/misc/zynq*
>>  X: hw/ssi/xilinx_*
>=20
> For the Zynq/Xilinx part:
>=20
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

*ping* - Peter, do you think this update to MAINTAINERS is OK now?

 Thomas



--naDFjoDOqWOGOjkb3Lo20X2rkarSl99ec
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJYHG5xAAoJEC7Z13T+cC21/tsP/1GvNzbHiwCnY9gk1UVN8in3
+WPa0RJolcnckh94aj26s9jy06fIBvQ0GDmTyFKFPXHsyh5q5634fEZKYBpSfh2l
5bn/Lb4yv4fHJyz6EvZe0Sadqi25cVaDXXgK2t/YlOlwTHdTNiUBdg8DHSYsKGNT
xcAfmvy3Z+rUH8RYFbobxcgibhkLTDujOF5Y5vBcvgrwbiZWksLeVE0klMhb0/9V
PRtFgk6pVoW6Tnoo5/9vKCUmWrHkTVaUJdcBfkG5Ng8spyzcr9z4JrNsi19ZrbgK
YL4ie9s2stI1lNJNRyMMNY0PcqNWeROmLlM1iZCbAOz61b2I5bLOt9fHgqOwxvQl
56c9v8FmTUUtfbQsCYtxDQq4UhapMY6J+PvwHomy5z0kUeVawZhW9OKPbwbaArdp
1sSTaNFrhqyo2TfQ6Fv+mlnVF2hPsXP1rVgOnF4yTCXUPpy/u2KztjHm5kBEx4g0
9sSBhTqCPv+N3Zbdp+uXRuUPvQDZ2dpxO3/zOS1D4qcTvSoA4nIh0qVCRTbX58gL
eVvd/JX991Ucq4rCOpwphito3hBVSKD4H1VG7eVoxUhzIorKqqYoIEXCqigyXLTg
/q+LbZFA/otFJRd3eMqt2zllsLwP0QKdc0My7BvDuWPbcfodXo6hK/iVD2uVslk4
nPR4yHnBEyFyEZYE3xe7
=/06V
-----END PGP SIGNATURE-----

--naDFjoDOqWOGOjkb3Lo20X2rkarSl99ec--
