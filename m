Received: by 10.25.159.19 with SMTP id i19csp1683141lfe;
        Sun, 17 Jan 2016 19:14:25 -0800 (PST)
X-Received: by 10.55.75.203 with SMTP id y194mr28838837qka.2.1453086865537;
        Sun, 17 Jan 2016 19:14:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si5236425qgt.88.2016.01.17.19.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 19:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL0Gu-00089a-OA
	for alex.bennee@linaro.org; Sun, 17 Jan 2016 22:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL0Gs-00089T-Tg
	for qemu-arm@nongnu.org; Sun, 17 Jan 2016 22:14:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL0Gp-0000EG-J7
	for qemu-arm@nongnu.org; Sun, 17 Jan 2016 22:14:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aL0Gp-0000EB-Az; Sun, 17 Jan 2016 22:14:19 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 73103C09FA95;
	Mon, 18 Jan 2016 03:14:17 +0000 (UTC)
Received: from [10.72.5.6] (vpn1-5-6.pek2.redhat.com [10.72.5.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I3E4C6020879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 17 Jan 2016 22:14:11 -0500
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
	<CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569C587B.3080505@redhat.com>
Date: Mon, 18 Jan 2016 11:14:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>,
	Alistair Francis <alistair.francis@xilinx.com>
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
X-TUID: jItpyrVr35b6



On 01/15/2016 02:19 PM, Peter Crosthwaite wrote:
> On Thu, Jan 14, 2016 at 2:03 AM, Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> On 14 January 2016 at 09:43, Michael S. Tsirkin <mst@redhat.com> wrote=
:
>>> gem_receive copies a packet received from network into an rxbuf[2048]
>>> array on stack, with size limited by descriptor length set by guest. =
 If
>>> guest is malicious and specifies a descriptor length that is too larg=
e,
>>> and should packet size exceed array size, this results in a buffer
>>> overflow.
>>>
>>> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>  hw/net/cadence_gem.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>> index 3639fc1..15a0786 100644
>>> --- a/hw/net/cadence_gem.c
>>> +++ b/hw/net/cadence_gem.c
>>> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>>>              break;
>>>          }
>>>
>>> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_p=
acket)) {
>>> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x spac=
e 0x%x\n",
>>> +                     (unsigned)packet_desc_addr,
>>> +                     (unsigned)tx_desc_get_length(desc),
>>> +                     sizeof(tx_packet) - (p - tx_packet));
>>> +            break;
>>> +        }
>> Is this what the real hardware does in this situation?
>> Should we log this as a guest error?
>>
> I'm not sure it is a guest error. I think its just a shortcut in the
> original implementation. I guess QEMU needs the whole packet before
> handing off to the net layer and the assumption is that the packet is
> always within 2048. I think the hardware is just going to put the data
> on the wire as it goes.

If we are not sure this is what real hardware did, dropping looks more
safe than sending the truncated packets on the wire.

>  The easiest solution is to realloc the buffer
> as it goes with the increasing sizes.

This could allow possible DOS from guest (see
cde31a0e3dc0e4ac83e454d6096350cec584adf1).

> Otherwise you could refactor the
> code to be two pass over the descriptor ring section (containing the
> packet). If we want to fix the buffer overflow more urgently, the
> correct error would be an assert().
>
> Regards,
> Peter

Let's avoid putting guest trigger-able assert() here. The patch looks
good for fixing the issue. Refactoring could be done on top.

Thanks

>
>>> +
>>>          /* Gather this fragment of the packet from "dma memory" to o=
ur contig.
>>>           * buffer.
>>>           */
>>> --
>>> MST
>>>
>> thanks
>> -- PMM
>>

