Received: by 10.25.0.144 with SMTP id 138csp154109lfa;
        Thu, 13 Apr 2017 23:26:55 -0700 (PDT)
X-Received: by 10.200.43.211 with SMTP id n19mr6465656qtn.132.1492151215807;
        Thu, 13 Apr 2017 23:26:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23si994070qtc.141.2017.04.13.23.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 23:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyuh5-0001eL-Bc
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 02:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1cyugz-0001e4-3m
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 02:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1cyugu-0006Dy-6u
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 02:26:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1cyugu-0006DG-0W; Fri, 14 Apr 2017 02:26:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B02854E4F5;
	Fri, 14 Apr 2017 06:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B02854E4F5
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jasowang@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B02854E4F5
Received: from [10.72.8.55] (ovpn-8-55.pek2.redhat.com [10.72.8.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B08681817A;
	Fri, 14 Apr 2017 06:26:39 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <196d16bd-09ad-bdf2-7c41-63e6d8697874@redhat.com>
Date: Fri, 14 Apr 2017 14:26:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492076514-28821-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 14 Apr 2017 06:26:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/5] FTGMAC100 nic model for the Aspeed
 SoCs
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
Cc: Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rREIH9jOn2L6



On 2017=E5=B9=B404=E6=9C=8813=E6=97=A5 17:41, C=C3=A9dric Le Goater wrote=
:
> Hi,
>
> The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
> controllers. This serie proposes a model for this device and a way to
> customize the bit definitions which are slightly different from the
> Faraday definitions.
>
> The last patch adds a fake NC-SI (Network Controller Sideband
> Interface) backend to pretend a NIC is being managed. This is only
> usable with the slirp stack.
>
> The model has been tested on the 'palmetto', 'romulus' and
> 'ast2500-evb' machines using different implementations of the Linux
> driver and with U-Boot.  It has been stressed with iperf.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (5):
>    hw/net: add MII definitions
>    net: add FTGMAC100 support
>    net/ftgmac100: add a 'aspeed' property
>    aspeed: add a FTGMAC100 nic
>    slirp: add a fake NC-SI backend
>
>   default-configs/arm-softmmu.mak |    1 +
>   hw/arm/aspeed_soc.c             |   21 +
>   hw/net/Makefile.objs            |    1 +
>   hw/net/ftgmac100.c              | 1016 ++++++++++++++++++++++++++++++=
+++++++++
>   include/hw/arm/aspeed_soc.h     |    2 +
>   include/hw/net/ftgmac100.h      |   64 +++
>   include/hw/net/mii.h            |   71 ++-
>   include/net/eth.h               |    1 +
>   slirp/Makefile.objs             |    2 +-
>   slirp/ncsi-pkt.h                |  418 ++++++++++++++++
>   slirp/ncsi.c                    |   78 +++
>   slirp/slirp.c                   |    4 +
>   slirp/slirp.h                   |    3 +
>   13 files changed, 1663 insertions(+), 19 deletions(-)
>   create mode 100644 hw/net/ftgmac100.c
>   create mode 100644 include/hw/net/ftgmac100.h
>   create mode 100644 slirp/ncsi-pkt.h
>   create mode 100644 slirp/ncsi.c
>

Want to merge but looks like patch 2 does not apply cleanly on qemu maste=
r.

Thanks

