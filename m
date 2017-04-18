Received: by 10.25.0.144 with SMTP id 138csp1534218lfa;
        Mon, 17 Apr 2017 21:07:05 -0700 (PDT)
X-Received: by 10.237.33.69 with SMTP id 63mr4397647qtc.195.1492488425399;
        Mon, 17 Apr 2017 21:07:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m82si12780051qke.65.2017.04.17.21.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 21:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0KPw-0005hn-RK
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 00:07:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1d0KPr-0005de-LR
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 00:07:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1d0KPo-0000H5-H7
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 00:06:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1d0KPo-0000Gl-9W; Tue, 18 Apr 2017 00:06:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3D6E4E35B;
	Tue, 18 Apr 2017 04:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D3D6E4E35B
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jasowang@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D3D6E4E35B
Received: from [10.72.8.29] (ovpn-8-29.pek2.redhat.com [10.72.8.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A367E581;
	Tue, 18 Apr 2017 04:06:50 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1492158903-8016-1-git-send-email-clg@kaod.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ea904ecf-4fe5-c437-e595-691c864ca142@redhat.com>
Date: Tue, 18 Apr 2017 12:06:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492158903-8016-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Apr 2017 04:06:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/5] FTGMAC100 nic model for the Aspeed
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
X-TUID: +oHvFuLSiNeK



On 2017=E5=B9=B404=E6=9C=8814=E6=97=A5 16:34, C=C3=A9dric Le Goater wrote=
:
> Hi,
>
> The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
> controllers. This series proposes a model for this device and a way to
> customize the bit definitions which are slightly different from the
> Faraday definitions.
>
> The last patch adds a fake NC-SI (Network Controller Sideband
> Interface) backend to pretend a NIC is being managed. This is only
> usable with the slirp stack for the moment.
>
> The model has been tested on the 'palmetto', 'romulus' and
> 'ast2500-evb' machines using different implementations of the Linux
> driver and with U-Boot. It has been stressed with iperf.
>
> The full patchset is available here, based on QEMU v2.9.0-rc4 :
>
>    https://github.com/legoater/qemu/commits/aspeed
>
> To test, grab a palmetto or a romulus BMC firmware image :
>
>    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpal=
metto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
>    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Drom=
ulus/lastSuccessfulBuild/artifact/images/romulus/flash-romulus
>
> and start the machines with  :
>
>    qemu-system-arm -m 512 -M romulus-bmc  -drive file=3Dflash-romulus,f=
ormat=3Draw,if=3Dmtd  -nographic
>    qemu-system-arm -m 512 -M palmetto-bmc -drive file=3Dflash-palmetto,=
format=3Draw,if=3Dmtd -nographic
>
> the fake NC-SI NIC should come up :
>
>    ftgmac100 1e660000.ethernet eth0: NCSI interface up
>
> and to log, use credentials root/0penBmc
>
> Thanks,
>
> C.
>
> Changes since v2:
>   - rebased on QEMU v2.9.0-rc4
>   - modified the 'ncsi-pkt.h' file to add its location under the Linux
>     tree
>   - removed useless zeroing of the 'reserved' fields
>   - introduced a ncsi_rsp_handlers array to hold the payload size and
>     a specific handler routine for each command
>   - fixed the output size of the frame to match the command payload
>     size
>
> Changes since v1:
>   - removed TODO comments and used LOG_UNIMP in the read/write ops
>   - used camelcase for struct names and typedefs.
>   - removed the useless struct definitions for ring descriptors and
>     the alignment pragma
>   - introduced a frame buffer at the machine level to reduce stack
>     usage in the tx path.
>   - introduced symbolic constants for PHY values.
>   - introduced rtl8211e PHY chip specific registers
>   - removed qemu_set_irq() in reset path
>   - checked for dma_memory_read() errors. Also for write but that was
>     less important as the descriptor is first read so it should be
>     valid for the write.
>   - removed the irq state
>   - removed the weird hack to catch a first valid descriptor.
>   - fixed the read of the mac address
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
>   slirp/ncsi-pkt.h                |  419 ++++++++++++++++
>   slirp/ncsi.c                    |  130 +++++
>   slirp/slirp.c                   |    4 +
>   slirp/slirp.h                   |    3 +
>   13 files changed, 1716 insertions(+), 19 deletions(-)
>   create mode 100644 hw/net/ftgmac100.c
>   create mode 100644 include/hw/net/ftgmac100.h
>   create mode 100644 slirp/ncsi-pkt.h
>   create mode 100644 slirp/ncsi.c
>

Queued for 2.10.

Thanks
