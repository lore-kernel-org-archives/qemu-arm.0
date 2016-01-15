Received: by 10.25.159.19 with SMTP id i19csp208067lfe;
        Thu, 14 Jan 2016 19:17:14 -0800 (PST)
X-Received: by 10.140.108.8 with SMTP id i8mr10488339qgf.83.1452827834060;
        Thu, 14 Jan 2016 19:17:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b130si10853467qhd.95.2016.01.14.19.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 19:17:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJusz-0000FL-HZ
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 22:17:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aJusd-0008Nh-IB
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 22:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aJusc-0006zb-Je
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 22:16:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aJusX-0006xk-Ui; Thu, 14 Jan 2016 22:16:46 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 5B1C68A14E;
	Fri, 15 Jan 2016 03:16:45 +0000 (UTC)
Received: from [10.66.15.133] (dhcp-15-133.nay.redhat.com [10.66.15.133])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0F3GVd6028348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 Jan 2016 22:16:37 -0500
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5698648F.6000104@redhat.com>
Date: Fri, 15 Jan 2016 11:16:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452764448-17953-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	Prasad Pandit <ppandit@redhat.com>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /81KkKyc0xXA



On 01/14/2016 05:43 PM, Michael S. Tsirkin wrote:
> gem_receive copies a packet received from network into an rxbuf[2048]
> array on stack, with size limited by descriptor length set by guest.  I=
f
> guest is malicious and specifies a descriptor length that is too large,
> and should packet size exceed array size, this results in a buffer
> overflow.
>
> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/net/cadence_gem.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 3639fc1..15a0786 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>              break;
>          }
> =20
> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_pac=
ket)) {
> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space =
0x%x\n",
> +                     (unsigned)packet_desc_addr,
> +                     (unsigned)tx_desc_get_length(desc),
> +                     sizeof(tx_packet) - (p - tx_packet));
> +            break;
> +        }
> +
>          /* Gather this fragment of the packet from "dma memory" to our=
 contig.
>           * buffer.
>           */

Looks like we need similar issue in gen_receive(), need to fix that?
