Received: by 10.25.159.19 with SMTP id i19csp269631lfe;
        Thu, 14 Jan 2016 22:19:09 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr11294695qka.96.1452838749762;
        Thu, 14 Jan 2016 22:19:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i1si5675162qkh.31.2016.01.14.22.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 22:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJxj3-0001iJ-5V
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 01:19:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJxj0-0001e3-9U
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 01:19:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJxiz-000883-20
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 01:19:06 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:34156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJxiv-00087e-RU; Fri, 15 Jan 2016 01:19:02 -0500
Received: by mail-wm0-x22c.google.com with SMTP id u188so10160367wmu.1;
	Thu, 14 Jan 2016 22:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=IPwe99PRuoG/+cVW1At44+kfKUGSYuZDj0+wpB+SBYs=;
	b=ISzs1jzkv+7bU5ZTRAXG6u5mx6JP8ojbSMYaPPCcu6F8yuwbWeU6S6nG6XFNKxbq5d
	u9019mDmfWEzfMVWBIFFz1TpXRMm3thlbTz0qm7hi4g4uUQlAPtTGtejcQHU4SVwlj+5
	+Mlveso/QOpWsHEhFWQp/GnKGYVTy8H946NqI82KFZh2dYfnbb8E57gH3p0DNwF82Yda
	TQt+aSJMl98V8Q5ILpFevf+a7jR3fP6d7tWHaiBKEylr4f2GdySeRsBgWPl6FyesVOHa
	+eCIQWYqHBx46s+RDzmVxT57mUDLqIiUeCHLSXT35CVgoaLc8MhJYQHbDMZTp7gdUMO9
	52Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IPwe99PRuoG/+cVW1At44+kfKUGSYuZDj0+wpB+SBYs=;
	b=XlASYON/291KAlNIYQFe5CWu6W9yuLU9617LrJmOit4hdfvvJ10CEcdPQcQ0800wPx
	1XzP4NsYtBvBAOPL9EfqD1/9tyRX6eWgMH8HBWbIR1cJ7LVXtygpZK0NruyMX0qnGTST
	I+uZjtv84jOxVhUd/dwXAI47l/yQv3qvfoeZ1A9QJg9eL4SCBUniB3Ri1l514t7/VZpa
	Bnu8CeiEkSPgzU1FragCk64RUM9Eqfg/mc5j4VSH8MNrQbQmA1gyWlkCxHdxQLHUuRD0
	rsGW5YgJ3iYydz1xoS+oDc3Zh+MmgpUy54FIG58LxSGNTH0bXCEJzKT639mjuNbmrflb
	lj7Q==
X-Gm-Message-State: ALoCoQkkqqwpaUcQBXW8/hjZrRpcE/Jv5BJ0hj+A8Je6yOQgM9yFnU2tKhYhwr4DVtUmrf7e+wTF85cYn3hL5iWEIYQr0Htoaw==
MIME-Version: 1.0
X-Received: by 10.194.112.130 with SMTP id iq2mr7799849wjb.102.1452838741194; 
	Thu, 14 Jan 2016 22:19:01 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 14 Jan 2016 22:19:01 -0800 (PST)
In-Reply-To: <CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
Date: Thu, 14 Jan 2016 22:19:01 -0800
Message-ID: <CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
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
X-TUID: dHX/rbWeRGA1

On Thu, Jan 14, 2016 at 2:03 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 14 January 2016 at 09:43, Michael S. Tsirkin <mst@redhat.com> wrote:
>> gem_receive copies a packet received from network into an rxbuf[2048]
>> array on stack, with size limited by descriptor length set by guest.  If
>> guest is malicious and specifies a descriptor length that is too large,
>> and should packet size exceed array size, this results in a buffer
>> overflow.
>>
>> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  hw/net/cadence_gem.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index 3639fc1..15a0786 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>>              break;
>>          }
>>
>> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_pack=
et)) {
>> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0=
x%x\n",
>> +                     (unsigned)packet_desc_addr,
>> +                     (unsigned)tx_desc_get_length(desc),
>> +                     sizeof(tx_packet) - (p - tx_packet));
>> +            break;
>> +        }
>
> Is this what the real hardware does in this situation?
> Should we log this as a guest error?
>

I'm not sure it is a guest error. I think its just a shortcut in the
original implementation. I guess QEMU needs the whole packet before
handing off to the net layer and the assumption is that the packet is
always within 2048. I think the hardware is just going to put the data
on the wire as it goes. The easiest solution is to realloc the buffer
as it goes with the increasing sizes. Otherwise you could refactor the
code to be two pass over the descriptor ring section (containing the
packet). If we want to fix the buffer overflow more urgently, the
correct error would be an assert().

Regards,
Peter

>> +
>>          /* Gather this fragment of the packet from "dma memory" to our =
contig.
>>           * buffer.
>>           */
>> --
>> MST
>>
>
> thanks
> -- PMM
>
