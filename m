Received: by 10.25.0.144 with SMTP id 138csp840192lfa;
        Thu, 13 Apr 2017 10:28:08 -0700 (PDT)
X-Received: by 10.55.94.198 with SMTP id s189mr3288205qkb.225.1492104488482;
        Thu, 13 Apr 2017 10:28:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v144si23266900qka.79.2017.04.13.10.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 10:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyiXP-0002Do-VD
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 13:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cyiWp-0001rN-Oy
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 13:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cyiWl-0007TC-HE
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 13:27:31 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:50309)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cyiWl-0007Rr-Bb
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 13:27:27 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 604FF315BA
	for <qemu-arm@nongnu.org>; Thu, 13 Apr 2017 19:27:24 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 9CD061C007E;
	Thu, 13 Apr 2017 19:27:15 +0200 (CEST)
To: Samuel Thibault <samuel.thibault@gnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
	<1492076514-28821-6-git-send-email-clg@kaod.org>
	<cae91a9e-cc37-347f-d8fb-85a3173d9dcd@amsat.org>
	<20170413140818.flntaxvwt54a2pgp@var.youpi.perso.aquilenet.fr>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <779b9c49-dc28-22c5-80f9-4f1110459f5b@kaod.org>
Date: Thu, 13 Apr 2017 19:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170413140818.flntaxvwt54a2pgp@var.youpi.perso.aquilenet.fr>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 13041298624592120627
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrudekgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.227
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/5] slirp: add a fake NC-SI
 backend
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
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wuh7gNQx8FXV

On 04/13/2017 04:08 PM, Samuel Thibault wrote:
> Hello,
>=20
> Philippe Mathieu-Daud=E9, on jeu. 13 avril 2017 08:45:23 -0300, wrote:
>>> The NCSI header file <ncsi-pkt.h> comes from mainline Linux
>=20
> Please mention within the file which file it comes from exactly.

OK.


>>> +    case NCSI_PKT_CMD_SMA:
>>> +        rnh->common.length =3D htons(4);
>>> +        break;
>>> +    case NCSI_PKT_CMD_GVI:
>>> +        rnh->common.length =3D htons(36);
>>> +        break;
>>> +    case NCSI_PKT_CMD_GC: {
>>> +        rnh->common.length =3D htons(32);
> ...
>>> +        break;
>>> +    }
>>> +
>>> +    case NCSI_PKT_CMD_GLS: {
>>> +        rnh->common.length =3D htons(16);
>>> +        break;
>>> +    }
>>> +
>>> +    slirp_output(slirp->opaque, ncsi_reply, sizeof(ncsi_reply));
>=20
> Are we really supposed to send sizeof(ncsi_reply), and not accordingly
> to the size announced withing the packet?

no. it should be: sizeof(header) + payload + 4.  I will that in the next=20
version.

=20
> Appart from that,
>=20
> Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks,

C.=20
=20

