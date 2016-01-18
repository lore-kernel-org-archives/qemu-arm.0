Received: by 10.25.159.19 with SMTP id i19csp1745692lfe;
        Sun, 17 Jan 2016 22:50:43 -0800 (PST)
X-Received: by 10.140.239.79 with SMTP id k76mr20159634qhc.87.1453099843800;
        Sun, 17 Jan 2016 22:50:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si29556788qgf.7.2016.01.17.22.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 22:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL3eF-0005Z5-Cd
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 01:50:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL3e9-0005VO-Iw
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 01:50:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL3e4-0001vF-Qk
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 01:50:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aL3e4-0001uk-Li; Mon, 18 Jan 2016 01:50:32 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E9C8C7AE8B;
	Mon, 18 Jan 2016 06:50:31 +0000 (UTC)
Received: from [10.72.5.6] (vpn1-5-6.pek2.redhat.com [10.72.5.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I6oHhT008353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Jan 2016 01:50:25 -0500
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569C8B29.4040300@redhat.com>
Date: Mon, 18 Jan 2016 14:50:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452764448-17953-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	Prasad Pandit <ppandit@redhat.com>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: QgBHsToqW8WO



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

Apply to my -net with tweak on commit log (changing receive to transmit
as noticed).

Thanks

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

