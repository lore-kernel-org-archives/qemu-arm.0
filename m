Received: by 10.25.159.19 with SMTP id i19csp3403883lfe;
        Wed, 20 Jan 2016 15:37:56 -0800 (PST)
X-Received: by 10.55.15.100 with SMTP id z97mr48058534qkg.42.1453333076726;
        Wed, 20 Jan 2016 15:37:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si27223509qhf.80.2016.01.20.15.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 15:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM2K4-00005E-7g
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 18:37:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM2K1-000052-OR
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 18:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM2K0-0002a5-R8
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 18:37:53 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aM2K0-0002ZY-LN
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 18:37:52 -0500
Received: by mail-vk0-x22a.google.com with SMTP id n1so14093468vkb.3
	for <qemu-arm@nongnu.org>; Wed, 20 Jan 2016 15:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=dH5n6TGw5HsqUEhv29IgzLkUX14K/hKJZjhUVQiDowA=;
	b=G39nfXLXDe7LOlLUrOLN0hk3JDCSSuqqTFQkm7PqWPbk8zcTcQ6lL7fqgs+1Xes5mN
	CPLCh3qo9QvXiSV3osyfVt3ysv58uus+AD12jOb1JQZb5Mwhaxo9iEYuwh8bq0JXSIQv
	G9PoANEDtBkytgnDNeCZNPX/l3lTDBBGBJZ84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=dH5n6TGw5HsqUEhv29IgzLkUX14K/hKJZjhUVQiDowA=;
	b=JnmwSUOg2bm124Eqmp6h9TMBEKWAvgVlqTRVZez3S6AWY7wnq+nXhMuwmxE+lCj+sH
	bVL2juR++sTYnq/E3QhLbpTm7tkokYoMhkPs5virR6RmvXYlSOi58rpbEQlra+kwNeNL
	HIKDNbf9ZfT41lIiRKMjNjBy1s9ElKNgt53LCHkF8TTtTJeYbNwH+3G1Tjj2Ay43wNBd
	FOpbowrzx1p/AR6VEj+NxUi6qI8DNgfBrfpwq/i8C96qhERB+hEy57RGt8TX57Tg+5bt
	/3LRAlM3fwWthQJWfkKB9mdNGm97lUIvzrtTyMQjbfcBTmxAs5+rnSODXEX9yfK1Ynrz
	8p8Q==
X-Gm-Message-State: ALoCoQlBhCIB9tRwEWHwsAcj00nSRKmOLLmPG9jTFeFmlmZjqm3zswEY3h88AzyzVhdpkamwBPJcHh/e+tFEi9bC88wOSyYgnx6fy7VTuFwBDppH0SIFiaU=
X-Received: by 10.31.180.145 with SMTP id d139mr23599283vkf.83.1453333072092; 
	Wed, 20 Jan 2016 15:37:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 20 Jan 2016 15:37:32 -0800 (PST)
In-Reply-To: <CAKmqyKNGVNak7auGNwUO1J2cdxFvNVQZYVsJRxaQPaVfAOTmEg@mail.gmail.com>
References: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
	<CAFEAcA-h=hmiZ+z2vFukaAGqKBX6qVYK4nkFDB62AjkmCgLbAQ@mail.gmail.com>
	<CAKmqyKNGVNak7auGNwUO1J2cdxFvNVQZYVsJRxaQPaVfAOTmEg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jan 2016 23:37:32 +0000
Message-ID: <CAFEAcA81GMh=GFqZ54WTUfcEs7LfRQWqRzYDoURPOziojPjdUg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/1] arm_gic: Update ID
	registers based on revision
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
X-TUID: 7kQX+MK+wKm7

On 20 January 2016 at 23:08, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Wed, Jan 20, 2016 at 2:48 PM, Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> On 20 January 2016 at 22:42, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>> Update the GIC ID registers (registers above 0xfe0) based on the GIC
>>> revision instead of using the sames values for all GIC implementations.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>>> ---
>>> V2:
>>>  - Update array indexing to match new values
>>>  - Check the maximum value of offset as well
>>>
>>>  hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
>>>  1 file changed, 30 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>> index 13e297d..8eb3a2d 100644
>>> --- a/hw/intc/arm_gic.c
>>> +++ b/hw/intc/arm_gic.c
>>> @@ -31,8 +31,16 @@ do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS_=
_); } while (0)
>>>  #define DPRINTF(fmt, ...) do {} while(0)
>>>  #endif
>>>
>>> -static const uint8_t gic_id[] =3D {
>>> -    0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>>> +static const uint8_t gic_id_11mpcore[] =3D {
>>> +    0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, =
0xb1
>>> +};
>>> +
>>> +static const uint8_t gic_id_gicv1[] =3D {
>>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb3, 0x1b, 0x00, 0x0d, 0xf0, 0x05, =
0xb1
>>> +};
>>> +
>>> +static const uint8_t gic_id_gicv2[] =3D {
>>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, =
0xb1
>>>  };
>>>
>>>  static inline int gic_get_current_cpu(GICState *s)
>>> @@ -683,13 +691,30 @@ static uint32_t gic_dist_readb(void *opaque, hwad=
dr offset, MemTxAttrs attrs)
>>>          }
>>>
>>>          res =3D s->sgi_pending[irq][cpu];
>>> -    } else if (offset < 0xfe0) {
>>> +    } else if (offset < 0xfd0) {
>>>          goto bad_reg;
>>> -    } else /* offset >=3D 0xfe0 */ {
>>> +    } else /* offset >=3D 0xfd0 */ {
>>>          if (offset & 3) {
>>>              res =3D 0;
>>> +        } else if (offset > 0xfdf) {
>>> +            goto bad_reg;
>>
>> Where did this condition come from? It will mean all
>> the ID regs fe0 and above end up treated as bad registers
>> rather than taking the code below to return the ID value.
>
> Woops, I copied the wrong value. I mean that to be 0xffc
>
> Do you still want a maximum check (otherwise it will walk off the array)?

FFD..FFF should read as zeroes (like the other non-multiple-of-4
offset addresses in this region), and you can't get more than 0xfff
because the size of the memory region is 0x1000. That's not
entirely obvious though, so if you want a max check you can
put one in. I think that having it match the style of the rest
of the if..else if ladder would be better though:

  ...
 else if (offset < 0x1000) {
     array code here;
 else {
     g_assert_not_reached();
 }

or something.

thanks
-- PMM
