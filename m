Received: by 10.25.159.19 with SMTP id i19csp3377596lfe;
        Wed, 20 Jan 2016 14:24:25 -0800 (PST)
X-Received: by 10.140.104.100 with SMTP id z91mr14832658qge.26.1453328665722;
        Wed, 20 Jan 2016 14:24:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f22si46032052qkf.115.2016.01.20.14.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 14:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:45284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aM1Av-00052g-5M
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 17:24:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM1As-0004za-P7
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:24:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aM1Ar-0003gX-Lg
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 17:24:22 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aM1Ap-0003g5-LT; Wed, 20 Jan 2016 17:24:19 -0500
Received: by mail-oi0-x242.google.com with SMTP id e195so1173136oig.2;
	Wed, 20 Jan 2016 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=SPRDCFSPSH8xm6Lt/vIOTdgCuQI/803O1WVqYhQnlFM=;
	b=ygDAnxhEum7qmTcqdMN4PacvejAdv0lhmObdhjYlRnXXgvGeCFtwjTTT+zAJrgYrUd
	RvQRBxSWFwbVzXs7JwuLByF9rTdiS41u2mbTmOmIMDlYld9vykGf3mhE4UUP11X70h4v
	gGts9O2TkmE+ZwN+LnNaelUpW6Q5c9sJMJD+YQ+I+odzVnXYnAQap++2QeZdjHGYUOL0
	m9vxxA0uZIBZ7TqQIsMeANQqShj/95fbrBQ5nHEpztt7/F1PBjzeiUNTjpDIvh4inUSr
	6A3rkRZcSn1BXvM/jURt06so+6/VW+i7eiWvK1JKWxo0VSAtEEqDOC9FOdYx7A8tn6dV
	wjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=SPRDCFSPSH8xm6Lt/vIOTdgCuQI/803O1WVqYhQnlFM=;
	b=UQkrZQ+DThLFR3yC/L5NzSltm/rWpG5a/tvLuowoamEnyLcX1X5vWdw+RkCwKgpGjj
	WXAfvOKIR8NST1pGB93XVTywWPIBSkzX/OeVuuCCnFHY9wIlENiNjykAR8fwsh5RZ950
	avbzeBksmad1toDnrqJYXsNzWv7bcu0u9P9NeostnDH3t3T+UjwaUqs3Dv6ZX9e620k/
	7nFRqQlyR2oTTFg4Y3tNbDwUchyQ0hQNovsuohQN07sSl07MAY5A+l9UFiq2lSE5vjGC
	2eJLnhEEOGWTugGt34X3nNT+8UWwgg4zhRVTIQz1/DZW1TwIxEvZXSpYPP4aoTqtB9pN
	6hbg==
X-Gm-Message-State: ALoCoQldBsyTuP0Wr67oy7z2kq5TA5uI5oHhdiaK+cpTWlWxhQP+Hb/sQHVfuBh9gqUrSdbtrH0ZoXXl/0DdUx9nOCnnvA64EQ==
X-Received: by 10.202.75.15 with SMTP id y15mr26303446oia.16.1453328659001;
	Wed, 20 Jan 2016 14:24:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 20 Jan 2016 14:23:49 -0800 (PST)
In-Reply-To: <CAFEAcA9QvgNUTvAjBZAu5apxj25RwV7bRFs0g0eUWVfDD1DrtA@mail.gmail.com>
References: <e83ff2fc1c0fcdc6c435e53b1f83f1049b2a87a3.1453166915.git.alistair.francis@xilinx.com>
	<CAFEAcA9QvgNUTvAjBZAu5apxj25RwV7bRFs0g0eUWVfDD1DrtA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 20 Jan 2016 14:23:49 -0800
X-Google-Sender-Auth: NQAxI9tzuEd_vZOVBbwc3lRp9hg
Message-ID: <CAKmqyKPXwwJjqFxK1fHLxP4Z3e5re1j7RGGZjSbR5vS+WdD8EA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] arm_gic: Update ID
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
X-TUID: C+XxsNlROQNe

On Tue, Jan 19, 2016 at 12:48 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 19 January 2016 at 01:33, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Update the GIC ID registers (registers above 0xfe0) based on the GIC
>> revision instead of using the sames values for all GIC implementations.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>>
>>  hw/intc/arm_gic.c | 29 ++++++++++++++++++++++++++---
>>  1 file changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 13e297d..f6bfa53 100644
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
>> @@ -689,7 +697,22 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>>          if (offset & 3) {
>>              res =3D 0;
>>          } else {
>> -            res =3D gic_id[(offset - 0xfe0) >> 2];
>> +            switch (s->revision) {
>> +            case REV_11MPCORE:
>> +                res =3D gic_id_11mpcore[(offset - 0xfe0) >> 2];
>> +                break;
>> +            case 1:
>> +                res =3D gic_id_gicv1[(offset - 0xfe0) >> 2];
>> +                break;
>> +            case 2:
>> +                res =3D gic_id_gicv2[(offset - 0xfe0) >> 2];
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
>
> You've expanded the arrays to include the fd0...fdc values
> (which is right) but the logic also needs to change to
> make offset =3D=3D 0xfd0..0xfdf go through this code path and
> also to use the new indexing into the array.

I see what you mean, fixing it now.

Thanks,

Alistair

>
> thanks
> -- PMM
>
