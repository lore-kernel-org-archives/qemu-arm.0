Received: by 10.25.159.19 with SMTP id i19csp1675940lfe;
        Thu, 14 Jan 2016 02:11:31 -0800 (PST)
X-Received: by 10.140.158.4 with SMTP id e4mr4171192qhe.81.1452766291662;
        Thu, 14 Jan 2016 02:11:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g13si6654430qhc.69.2016.01.14.02.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 02:11:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJesN-0001wH-3K
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 05:11:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aJesL-0001tz-0S
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 05:11:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aJesH-00054b-PT
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 05:11:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aJesH-00054X-K9; Thu, 14 Jan 2016 05:11:25 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D4387C0BF2B1;
	Thu, 14 Jan 2016 10:11:24 +0000 (UTC)
Received: from redhat.com (vpn1-7-92.ams2.redhat.com [10.36.7.92])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0EABL1t016498; Thu, 14 Jan 2016 05:11:22 -0500
Date: Thu, 14 Jan 2016 12:11:21 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160114121016-mutt-send-email-mst@redhat.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?utf-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: HXKd0FB2vGuh

On Thu, Jan 14, 2016 at 10:03:15AM +0000, Peter Maydell wrote:
> On 14 January 2016 at 09:43, Michael S. Tsirkin <mst@redhat.com> wrote:
> > gem_receive copies a packet received from network into an rxbuf[2048]
> > array on stack, with size limited by descriptor length set by guest. =
 If
> > guest is malicious and specifies a descriptor length that is too larg=
e,
> > and should packet size exceed array size, this results in a buffer
> > overflow.
> >
> > Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  hw/net/cadence_gem.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index 3639fc1..15a0786 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
> >              break;
> >          }
> >
> > +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_p=
acket)) {
> > +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x spac=
e 0x%x\n",
> > +                     (unsigned)packet_desc_addr,
> > +                     (unsigned)tx_desc_get_length(desc),
> > +                     sizeof(tx_packet) - (p - tx_packet));
> > +            break;
> > +        }
>=20
> Is this what the real hardware does in this situation?
> Should we log this as a guest error?

I don't really know.  This is just consistent with what this device does
for other descriptor errors.

> > +
> >          /* Gather this fragment of the packet from "dma memory" to o=
ur contig.
> >           * buffer.
> >           */
> > --
> > MST
> >
>=20
> thanks
> -- PMM
