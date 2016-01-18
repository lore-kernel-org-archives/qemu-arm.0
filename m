Received: by 10.25.159.19 with SMTP id i19csp1797711lfe;
        Mon, 18 Jan 2016 01:09:00 -0800 (PST)
X-Received: by 10.55.73.68 with SMTP id w65mr29249373qka.68.1453108140881;
        Mon, 18 Jan 2016 01:09:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si30045426qka.41.2016.01.18.01.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 01:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL5o4-0000og-9j
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 04:09:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL5o1-0000kg-Ox
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 04:08:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL5o0-0000QN-Kx
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 04:08:57 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:36160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL5ny-0000Q5-0n; Mon, 18 Jan 2016 04:08:54 -0500
Received: by mail-wm0-x22f.google.com with SMTP id l65so90514212wmf.1;
	Mon, 18 Jan 2016 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=cjHUWwxLdkm+1yOBSH69FBAlUH95SUGWeynGkDTLUA8=;
	b=NGFqTW6C8vPxNSJWr7Q1vEcVhG0nDZb5ZWS2o7SXxY4+dtasUFLtCg9Qf5P7IaqOkc
	PkNK80BsCG7SGIlrXMWpPNC4QnDRMTyLe6wm/S+wk1rybBe9rcZCkTt1DVLs8pHm0cu9
	Bq5SHSuJee5/bKxQhxusK6A0IuSHNvEnAjFMniB9pp4kBCk6+4OKVRi/5VqJZMwOtpwm
	K/pOw9UK4uNSeAH2mYHmow7ypKlmK3A+WP+CtV/SPxF0aU0vY2jhrtyL46u0jiL/QP4f
	i5mX61OgCA5bvsrvw5CvoB880Va7Nu57+lCvIjRtOchpHXs71qtccymO1G6WS3dNvgPK
	G3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cjHUWwxLdkm+1yOBSH69FBAlUH95SUGWeynGkDTLUA8=;
	b=V3ArwZpsZin5I2mRndSLNZxdQu0N1sn8gIGfkLrFwsaG2i2cfxr/mm/WrQp1okurJA
	IAZ0JARB+Xyt6LBy/T9gLY7xZD/yXEyypS2IGzYqoscewhN25BwBjWgJb9ixx7rCScP1
	nmFJAaO3VO7t1k0BNm1Ph+AcKnx1s228gID9/HcuJJxvZ1ZWGwx1gaWzLOg1ZjPXVVJO
	eKfpOLltdm3NQa1loJxYuWeEh4A5MJei7DXhYk16ehHOzPqzFtUoRAsaHNjXTeoUJIaJ
	nrdXo9qTj+qw8ITYgdWWO5slmxoqO8xC2BMvRr98kVl4VkskJn8wXrqtCJ6U/Aii6DSa
	oK0g==
X-Gm-Message-State: ALoCoQnK74byeX2L9XA+Q97bdHWfx0QaKdYa6nBv/QEWyn+z0Z5nNH4maETP2ttUSdmTlu3DU3iiL4Ocj7oTW9M82yXUjg90rA==
MIME-Version: 1.0
X-Received: by 10.194.112.130 with SMTP id iq2mr22559208wjb.102.1453108133351; 
	Mon, 18 Jan 2016 01:08:53 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Mon, 18 Jan 2016 01:08:53 -0800 (PST)
In-Reply-To: <569C9E87.2030001@redhat.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
	<CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
	<569C9E87.2030001@redhat.com>
Date: Mon, 18 Jan 2016 01:08:53 -0800
Message-ID: <CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
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
X-TUID: hlDDRWV47+3E

On Mon, Jan 18, 2016 at 12:12 AM, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 01/18/2016 03:04 PM, Peter Crosthwaite wrote:
>> On Sun, Jan 17, 2016 at 10:50 PM, Jason Wang <jasowang@redhat.com> wrote=
:
>>>
>>> On 01/14/2016 05:43 PM, Michael S. Tsirkin wrote:
>>>> gem_receive copies a packet received from network into an rxbuf[2048]
>>>> array on stack, with size limited by descriptor length set by guest.  =
If
>>>> guest is malicious and specifies a descriptor length that is too large=
,
>>>> and should packet size exceed array size, this results in a buffer
>>>> overflow.
>>>>
>>>> Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>  hw/net/cadence_gem.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>> Apply to my -net with tweak on commit log (changing receive to transmit
>>> as noticed).
>>>
>> As this is actually an unimplemented feature you should change the
>> message to a LOG_UNIMP rather than a debug printf.
>>
>> Regards,
>> Peter
>
> Thanks for the reminding. But we need know the whether real device could
> send packet whose length is greater than 2048. Do you know the link to
> the manual? (Haven't fond it in cadence page.) A hint is the linux

Xilinx UG585 has details:

http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM=
.pdf

Regards,
Peter

> driver (drivers/net/ethernet/cadence/macb.c), use 1500 as its MTU.
>
>>
>>> Thanks
>>>
>>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>>> index 3639fc1..15a0786 100644
>>>> --- a/hw/net/cadence_gem.c
>>>> +++ b/hw/net/cadence_gem.c
>>>> @@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
>>>>              break;
>>>>          }
>>>>
>>>> +        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_pa=
cket)) {
>>>> +            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space=
 0x%x\n",
>>>> +                     (unsigned)packet_desc_addr,
>>>> +                     (unsigned)tx_desc_get_length(desc),
>>>> +                     sizeof(tx_packet) - (p - tx_packet));
>>>> +            break;
>>>> +        }
>>>> +
>>>>          /* Gather this fragment of the packet from "dma memory" to ou=
r contig.
>>>>           * buffer.
>>>>           */
>
