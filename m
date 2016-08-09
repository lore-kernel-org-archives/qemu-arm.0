Received: by 10.25.21.156 with SMTP id 28csp303650lfv;
        Mon, 8 Aug 2016 20:51:38 -0700 (PDT)
X-Received: by 10.55.24.149 with SMTP id 21mr32316079qky.232.1470714698595;
        Mon, 08 Aug 2016 20:51:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si19759651qkc.169.2016.08.08.20.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 20:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWy4o-00073k-0n
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 23:51:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bWy4g-00072N-Eq
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 23:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bWy4d-0006SG-BW
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 23:51:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1bWy4d-0006S8-4w; Mon, 08 Aug 2016 23:51:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78F3D83F41;
	Tue,  9 Aug 2016 03:51:26 +0000 (UTC)
Received: from [10.72.4.63] (vpn1-4-63.pek2.redhat.com [10.72.4.63])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u793pJEQ022595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Aug 2016 23:51:24 -0400
To: chaojianhu <chaojianhu@hotmail.com>, qemu-devel@nongnu.org
References: <BLU437-SMTP43591ADA801E900D4BCE81DB1C0@phx.gbl>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b24fb98f-c6ef-3581-5031-8e63de2526dd@redhat.com>
Date: Tue, 9 Aug 2016 11:51:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <BLU437-SMTP43591ADA801E900D4BCE81DB1C0@phx.gbl>
Content-Type: text/plain; charset=utf-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 Aug 2016 03:51:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/net: Fix a heap overflow in
 xlnx.xps-ethernetlite
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a+dMp7M5O15Y



On 2016=E5=B9=B408=E6=9C=8809=E6=97=A5 10:24, chaojianhu wrote:
> The .receive callback of xlnx.xps-ethernetlite doesn't check the length
> of data before calling memcpy. As a result, the NetClientState object i=
n
> heap will be overflowd. All versions of qemu with=E3=80=80xlnx.xps-ethe=
rnetlite
> will be affected.
>
> Reported-by: chaojianhu <chaojianhu@hotmail.com>

Patch looks correct. But as reported, please add Signed-off-by with your=20
name and repost.

Thanks

>
> ---
>   hw/net/xilinx_ethlite.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 54db2b8..6d3eecc 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -197,6 +197,10 @@ static ssize_t eth_rx(NetClientState *nc, const ui=
nt8_t *buf, size_t size)
>       }
>  =20
>       D(qemu_log("%s %zd rxbase=3D%x\n", __func__, size, rxbase));
> +    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4 ) {
> +        D(qemu_log("ethlite packet is too big, size=3D%x\n", size);
> +        return -1;
> +    }
>       memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
>  =20
>       s->regs[rxbase + R_RX_CTRL0] |=3D CTRL_S;

