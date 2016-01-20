Received: by 10.25.159.19 with SMTP id i19csp3393431lfe;
        Wed, 20 Jan 2016 15:08:42 -0800 (PST)
X-Received: by 10.140.236.68 with SMTP id h65mr51705234qhc.13.1453331322530;
        Wed, 20 Jan 2016 15:08:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t105si46242492qgd.119.2016.01.20.15.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 15:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:45412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM1rl-0007Ss-TT
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 18:08:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM1rj-0007R0-7X
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 18:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM1ri-00079c-8w
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 18:08:39 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aM1rg-00079J-5S; Wed, 20 Jan 2016 18:08:36 -0500
Received: by mail-oi0-x241.google.com with SMTP id x140so1216849oif.1;
	Wed, 20 Jan 2016 15:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=sVj9NUUiEwdcF/Z2P4IoIysZkxxq7aQrCmqK4QnXrg8=;
	b=A78gGzb8tyOxmR0wMzsMR7CpnAMjtpV4iEY1FRpuduE4D6FPA8hdM6LXhxqsJzv12L
	MX1zxov4/twv7xiQRLoyGaXmMqZpP9oyF1BFZb7an6GGi9ZPvYc5q4GF4ZUo5QlaR0O4
	M2rwzUe0lmErxZnJEL2DG4RTnogDFbJsx0sc8EFOBNIUccuS03qCgHjHiYujfHVFeOnE
	V3E2MoEYb7CxB7mrhUsUgiqFREvYS+wjlllUKL6VUtoTnsYyyCVtX5VTIcRqFR/uIHcd
	m5mX9oHlzUrVA2lkDEzToBHbldtxh8CxgJQPWwUuZg0bbDQTIgxfThS3YZYCM/tFJT1k
	HLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=sVj9NUUiEwdcF/Z2P4IoIysZkxxq7aQrCmqK4QnXrg8=;
	b=cEmIAqDoxDcUxZyf6Hfwisxi4/vlIvUlpwW7I/g4XznxYIznGAfv1yXtCpB8Wsw+RT
	ooKg7iAHUVe1i5+qF9llk6jum2LfUejmP9VePxL036QqRV5qhB41E6ooMOucnu30vr0x
	r36p3V/lHshQNx0kr0PZX6RmSPtS8Lmu3m0+JZxWKqu6WmLolYNfrBxN27xIW8DkLMEW
	NuAEZHe5+cyAP6gurqNEqeA214EkgcS5yJmpByeqdkNTC+M4Zim+uG3020YBOMnRSfLm
	iS16UiFDx8gdSINprA8pJWS47eyGREfqGsgRqXjlrf2eAOBABqE3z2jrE1HV3rtT2oWa
	uX5A==
X-Gm-Message-State: ALoCoQnazrNE1FpvazHzt8hwc5elGD76i74Oqui3BNLvn8Sz7E510Hc4/0Ogkrl48zAHyqvRGgCHRYasFl8UFhl9Pp0zeU4w1Q==
X-Received: by 10.202.208.65 with SMTP id h62mr29571287oig.57.1453331315537;
	Wed, 20 Jan 2016 15:08:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 20 Jan 2016 15:08:06 -0800 (PST)
In-Reply-To: <CAFEAcA-h=hmiZ+z2vFukaAGqKBX6qVYK4nkFDB62AjkmCgLbAQ@mail.gmail.com>
References: <118acc7c92ab1eac93ad2dcb25944569f4c6ae59.1453328768.git.alistair.francis@xilinx.com>
	<CAFEAcA-h=hmiZ+z2vFukaAGqKBX6qVYK4nkFDB62AjkmCgLbAQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 20 Jan 2016 15:08:06 -0800
X-Google-Sender-Auth: wnDgwVLK5FZPiZC3HcQJrg8A0xA
Message-ID: <CAKmqyKNGVNak7auGNwUO1J2cdxFvNVQZYVsJRxaQPaVfAOTmEg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
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
X-TUID: QtbM9XxFLssy

On Wed, Jan 20, 2016 at 2:48 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 20 January 2016 at 22:42, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Update the GIC ID registers (registers above 0xfe0) based on the GIC
>> revision instead of using the sames values for all GIC implementations.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>> V2:
>>  - Update array indexing to match new values
>>  - Check the maximum value of offset as well
>>
>>  hw/intc/arm_gic.c | 35 ++++++++++++++++++++++++++++++-----
>>  1 file changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 13e297d..8eb3a2d 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -31,8 +31,16 @@ do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__=
); } while (0)
>>  #define DPRINTF(fmt, ...) do {} while(0)
>>  #endif
>>
>> -static const uint8_t gic_id[] =3D {
>> -    0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>> +static const uint8_t gic_id_11mpcore[] =3D {
>> +    0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0=
xb1
>> +};
>> +
>> +static const uint8_t gic_id_gicv1[] =3D {
>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb3, 0x1b, 0x00, 0x0d, 0xf0, 0x05, 0=
xb1
>> +};
>> +
>> +static const uint8_t gic_id_gicv2[] =3D {
>> +    0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0=
xb1
>>  };
>>
>>  static inline int gic_get_current_cpu(GICState *s)
>> @@ -683,13 +691,30 @@ static uint32_t gic_dist_readb(void *opaque, hwadd=
r offset, MemTxAttrs attrs)
>>          }
>>
>>          res =3D s->sgi_pending[irq][cpu];
>> -    } else if (offset < 0xfe0) {
>> +    } else if (offset < 0xfd0) {
>>          goto bad_reg;
>> -    } else /* offset >=3D 0xfe0 */ {
>> +    } else /* offset >=3D 0xfd0 */ {
>>          if (offset & 3) {
>>              res =3D 0;
>> +        } else if (offset > 0xfdf) {
>> +            goto bad_reg;
>
> Where did this condition come from? It will mean all
> the ID regs fe0 and above end up treated as bad registers
> rather than taking the code below to return the ID value.

Woops, I copied the wrong value. I mean that to be 0xffc

Do you still want a maximum check (otherwise it will walk off the array)?

Thanks,

Alistair

>
>>          } else {
>> -            res =3D gic_id[(offset - 0xfe0) >> 2];
>> +            switch (s->revision) {
>> +            case REV_11MPCORE:
>> +                res =3D gic_id_11mpcore[(offset - 0xfd0) >> 2];
>> +                break;
>> +            case 1:
>> +                res =3D gic_id_gicv1[(offset - 0xfd0) >> 2];
>> +                break;
>> +            case 2:
>> +                res =3D gic_id_gicv2[(offset - 0xfd0) >> 2];
>> +                break;
>> +            case REV_NVIC:
>> +                /* Shouldn't be able to get here */
>> +                abort();
>> +            default:
>> +                res =3D 0;
>> +            }
>>          }
>>      }
>>      return res;
>> --
>> 2.5.0
>>
>
> thanks
> -- PMM
>
