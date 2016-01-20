Received: by 10.25.159.19 with SMTP id i19csp3407712lfe;
        Wed, 20 Jan 2016 15:49:57 -0800 (PST)
X-Received: by 10.140.92.215 with SMTP id b81mr49679893qge.44.1453333797031;
        Wed, 20 Jan 2016 15:49:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si46377333qkt.81.2016.01.20.15.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 15:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:45515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM2Vg-00054R-LS
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 18:49:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM2VM-0004n0-5i
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 18:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM2VL-0007xw-2V
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 18:49:36 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aM2VK-0007xs-Rx; Wed, 20 Jan 2016 18:49:34 -0500
Received: by mail-oi0-x242.google.com with SMTP id a202so1254051oib.3;
	Wed, 20 Jan 2016 15:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=njM2BBrFp+dwlfAwUc7EupxarVuHvOKXqkRAJqe7isE=;
	b=eDXHKxmCupMA5EfrPLOBcDJvo9HL4fJMcWxdPyNXSqLnAwDg9+Vaz5AL/SkdzFqpB8
	DauHR9iuqVmhDhVaFacKiOPG3k8foGeHlOK0CmrgBlBDdtbvCisChLJR3XbanQgWKeqT
	//PpwJ2QMhlVUIFNfUT4z08z7SBHy4qfyxUdhb5OhvpYixKRhvfK+FViJGoH4tNhSVnT
	VRLQ+aWNmQr+nAWAZGHH7zd7vUT5WNKFjsMmscLJgnuLholiY8cY+Lua6jowoJ9AKRmm
	qPdFrWAMmuTOxzugtO9hDifDank9vWJ67jR9Fddyav+3Xizn2CPGBTpZ6+6PUoj3sRMZ
	Mvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=njM2BBrFp+dwlfAwUc7EupxarVuHvOKXqkRAJqe7isE=;
	b=kHFJ+W7CaWzjondMKq3r7ewdP/bxEUnF9t40VWPZg5kva84sdzwsIPv1APzj69eym3
	htuA2VI8RHQFfev5DVKNYkYWRE9BV5i+MpaBhgv9FTTqy0EvDRRaZnSes5H2UiyKg6UH
	bZNebb+Sk1HCRodismQ+hqfLz4WO6LLvdY4ff5sRZ1jVJNRBDaWIyRuIsJ0G1oyZSRrh
	y0pdU2D5uJFcFmjWxLZSEgj4Jqp1d0ZlFJexz86Zez7Q+YGVwb/nkuURedWgjFrSZCre
	UMKVaRwjippoJLOryw/aApTerf5B7pNLf4B1M+sCSdxNRRXs1gbAkRz/Rb5PuDMVRedN
	z2CA==
X-Gm-Message-State: ALoCoQkfr202MbX0gxKsmDGL+EAZ1WBy+d9+m/eIiYg2+Vr2fiOBlHIQYjY/8Km9IbH050bnkr1m6nESWklexvm/6kZVrMNL7Q==
X-Received: by 10.202.83.139 with SMTP id h133mr29268734oib.127.1453333774197; 
	Wed, 20 Jan 2016 15:49:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 20 Jan 2016 15:49:04 -0800 (PST)
In-Reply-To: <CAFEAcA81GMh=GFqZ54WTUfcEs7LfRQWqRzYDoURPOziojPjdUg@mail.gmail.com>
References: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
	<CAFEAcA-h=hmiZ+z2vFukaAGqKBX6qVYK4nkFDB62AjkmCgLbAQ@mail.gmail.com>
	<CAKmqyKNGVNak7auGNwUO1J2cdxFvNVQZYVsJRxaQPaVfAOTmEg@mail.gmail.com>
	<CAFEAcA81GMh=GFqZ54WTUfcEs7LfRQWqRzYDoURPOziojPjdUg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 20 Jan 2016 15:49:04 -0800
X-Google-Sender-Auth: 6srGWulw9dGx39OXG6pESsVQMO4
Message-ID: <CAKmqyKPe3DaVCxVMWq75jdiE3RFdGiEHAq9dn=0Uh=wwZB7YBg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-devel] [PATCH v2 1/1] arm_gic: Update ID registers based
	on revision
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
X-TUID: fxeYticxCTNC

On Wed, Jan 20, 2016 at 3:37 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 20 January 2016 at 23:08, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Wed, Jan 20, 2016 at 2:48 PM, Peter Maydell <peter.maydell@linaro.org=
> wrote:
>>> On 20 January 2016 at 22:42, Alistair Francis
>>> <alistair.francis@xilinx.com> wrote:
>>>> Update the GIC ID registers (registers above 0xfe0) based on the GIC
>>>> revision instead of using the sames values for all GIC implementations=
.
>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>>> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>>>> ---
>>>> V2:
>>>>  - Update array indexing to match new values
>>>>  - Check the maximum value of offset as well
>>>>
>>>>  hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 30 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>>> index 13e297d..8eb3a2d 100644
>>>> --- a/hw/intc/arm_gic.c
>>>> +++ b/hw/intc/arm_gic.c
>>>> @@ -31,8 +31,16 @@ do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS=
__); } while (0)
>>>>  #define DPRINTF(fmt, ...) do {} while(0)
>>>>  #endif
>>>>
>>>> -static const uint8_t gic_id[] =3D {
>>>> -    0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>>>> +static const uint8_t gic_id_11mpcore[] =3D {
>>>> +    0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05,=
 0xb1
>>>> +};
>>>> +
>>>> +static const uint8_t gic_id_gicv1[] =3D {
>>>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb3, 0x1b, 0x00, 0x0d, 0xf0, 0x05,=
 0xb1
>>>> +};
>>>> +
>>>> +static const uint8_t gic_id_gicv2[] =3D {
>>>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05,=
 0xb1
>>>>  };
>>>>
>>>>  static inline int gic_get_current_cpu(GICState *s)
>>>> @@ -683,13 +691,30 @@ static uint32_t gic_dist_readb(void *opaque, hwa=
ddr offset, MemTxAttrs attrs)
>>>>          }
>>>>
>>>>          res =3D s->sgi_pending[irq][cpu];
>>>> -    } else if (offset < 0xfe0) {
>>>> +    } else if (offset < 0xfd0) {
>>>>          goto bad_reg;
>>>> -    } else /* offset >=3D 0xfe0 */ {
>>>> +    } else /* offset >=3D 0xfd0 */ {
>>>>          if (offset & 3) {
>>>>              res =3D 0;
>>>> +        } else if (offset > 0xfdf) {
>>>> +            goto bad_reg;
>>>
>>> Where did this condition come from? It will mean all
>>> the ID regs fe0 and above end up treated as bad registers
>>> rather than taking the code below to return the ID value.
>>
>> Woops, I copied the wrong value. I mean that to be 0xffc
>>
>> Do you still want a maximum check (otherwise it will walk off the array)=
?
>
> FFD..FFF should read as zeroes (like the other non-multiple-of-4
> offset addresses in this region), and you can't get more than 0xfff
> because the size of the memory region is 0x1000. That's not
> entirely obvious though, so if you want a max check you can
> put one in. I think that having it match the style of the rest
> of the if..else if ladder would be better though:
>
>   ...
>  else if (offset < 0x1000) {
>      array code here;
>  else {
>      g_assert_not_reached();
>  }
>

Ok, I like that.

Thanks,

Alistair

> or something.
>
> thanks
> -- PMM
>
