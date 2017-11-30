Received: by 10.223.159.82 with SMTP id f18csp594910wrg;
        Thu, 30 Nov 2017 04:51:58 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbnvnsyk6gR0LnA9f5/4I6s9vFybwfJEFVA5ecsaFZ5B1wxH8YbpdTPcy08MnS4E73epVvj
X-Received: by 10.129.112.78 with SMTP id l75mr1320847ywc.299.1512046318541;
        Thu, 30 Nov 2017 04:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512046318; cv=none;
        d=google.com; s=arc-20160816;
        b=soLlsvGKjjfjodLVsasPyN8Y9v86O8glHPm+VsvitmYRqBwe3Uj8FKGCRsw5Ux5x7O
         6d+QvI8IdKt8gqd0vKW9LkOm1Pe5kzOYt7iCcSlqrFRua61LxWFTgkgsRjSgerH7WhDV
         pT+OAFcCiB9q47T5VIOe98dK+pYpiOt27uOaH4mZFOgV3AWoXP7mFWfzozoQBpD/LY7/
         ELtGnOeD0/V58mb8t4aCgWLcHJMyVPTCDLo/pDi9OfoLqXYh4q7RKHkGHnFgAROwyBGM
         aD/dSfOhXiIRNQ3pmZLLq6ImdLPwSyT9SNMXhlLdlBBZCJoCJdErZbQ1TIHaVYoAtKkm
         fdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X0sJBX+9TYDu1p+qQKxkE3j0oda5NLm07iITCmJjz0g=;
        b=RU/qF3ZFF8q86W/Fp0/a5Uv0lArcYvosjpLQDy5pbYPlrzmF1wruncDf3F0HXAyJiH
         Wl/z1yykzdRJR4Op2yDoNV/2E/LaS7H6yR8krtpOqBon3sRetC+0uQswqj2nF2/iYkpi
         pgGUktQDnKG55kLAJOXUskNw5JxUGAzpFSTNqz49Tkn5KrnY7uKi4v/NGqyNMrWzNsi5
         AUJqLZnZ+PnvJqwA87rNvb0Qg092sjOlIX7VXFDD1wMtadD6/oJG9l4saVeB+cxi+2dY
         CL1QveLC9hnaT+x11EYlToONex5b5jT14+sUuVCkuUmnDbRljlhXgMxG9kIkNFUN5ADf
         D19w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t8si779202ywe.346.2017.11.30.04.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 04:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKOJq-0005AQ-0s
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 07:51:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKOJh-0005AJ-S2
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:51:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKOJe-0007Xm-Oq
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:51:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKOJe-0007VT-Gp; Thu, 30 Nov 2017 07:51:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 701F325C50;
	Thu, 30 Nov 2017 12:51:45 +0000 (UTC)
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ADF54DA33;
	Thu, 30 Nov 2017 12:51:43 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
	<22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <34115e36-ab8c-d828-d1a1-3ac7f32ae80b@redhat.com>
Date: Thu, 30 Nov 2017 13:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 30 Nov 2017 12:51:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vA5vJ+C/mpj8

On 30.11.2017 13:40, Paolo Bonzini wrote:
> On 30/11/2017 13:14, Peter Maydell wrote:
>> On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
>>> +static const uint8_t kernel_mcf5208[] =3D {
>>> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
>>> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
>>> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     =
Enable TX */
>>> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   =
Print 'T' */
>>> +    0x60, 0xfa                              /* bra.s  loop */
>>> +};
>>
>> This approach doesn't seem to be scalable to me -- are we
>> really going to have 50 or more fragments of hand-coded hex in
>> this file to cover the various board models?
>>
>> I'd much rather see us have a framework for being able
>> to build test blobs from source using a cross compiler
>> setup (and docker or similar so anybody can rebuild
>> the test blobs). That will be much easier to maintain
>> and easier to extend to having tests that test other
>> parts of the board or other aspects of TCG emulation.
>=20
> It seems a bit overkill, as these snippets are ~16 bytes long.
>=20
> However, it would be useful to have a basic patching mechanism so that
> board descriptions could include a common hand-coded const array and
> place an address at a given offset.  So you'd have
>=20
>     struct HexFirmware {
>         int     patch_offset;
>         short   patch_size;
>         bool    patch_bigendian;
>         uint8_t data[32];
>     }
>=20
> and microblaze boards could have:
>=20
> struct HexFirmware kernel_microblaze =3D {
>     .patch_offset    =3D 0,
>     .patch_size      =3D 2,
>     .patch_bigendian =3D false,
>     .data =3D {
>         0xaa, 0xaa, 0x00, 0xb0,                 /* imm   0x???? */
>         0x00, 0x10, 0x60, 0x30,                 /* addik r3,r0,0x1000 *=
/
>         0x54, 0x00, 0x80, 0x30,                 /* addik r4,r0,'T' */
>         0x00, 0x00, 0x83, 0xf0,                 /* sbi   r4,r3,0 */
>         0xfc, 0xff, 0x00, 0xb8,                 /* bri   -4  loop */
>     }
> };
>=20
> ...
>=20
>     { "microblaze", "petalogix-s3adsp1800", "", "TT",
>       kernel_microblaze, 0x8400 },
>     { "microblazeel", "petalogix-ml605", "", "TT",
>       kernel_microblaze, 0x83a0 },

The two micrablaze data arrays are completely different, since one is
big endian, the other is little, so I'd need to byte-swap the whole
array on the fly, too. Not sure whether it makes sense to add such
complex code just to safe 16 bytes of blob data...?

> Likewise, you could have just two copies of the code for all ARM boards
> that have a pl011 (or any other UART with a simple byte-long transmit
> register), one 32-bit and one 64-bit.

OK, having a patching mechanism in place likely makes sense as soon as
we want to include multiple ARM boards here. I can do that, but I'd
rather like to do it as a second step. It was already quite hard work to
come up with all these assembler snippets (from CPUs where I don't have
a clue of) and to determine which machines could be tested this way at
all, so I'd first like to wait and see whether this patch series is
acceptable at all or not, since Peter has objections.

 Thomas
