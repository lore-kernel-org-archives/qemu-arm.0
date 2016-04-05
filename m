Received: by 10.25.208.211 with SMTP id h202csp483380lfg;
        Tue, 5 Apr 2016 08:21:40 -0700 (PDT)
X-Received: by 10.140.101.238 with SMTP id u101mr47797896qge.33.1459869700640;
        Tue, 05 Apr 2016 08:21:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g60si26577156qge.120.2016.04.05.08.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Apr 2016 08:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anSnU-0001qS-4l
	for alex.bennee@linaro.org; Tue, 05 Apr 2016 11:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1anSnM-0001pL-Ao
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 11:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1anSnE-0003vb-8y
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 11:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1anSnE-0003vU-1D; Tue, 05 Apr 2016 11:21:24 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63211804E2;
	Tue,  5 Apr 2016 15:21:23 +0000 (UTC)
Received: from [10.36.112.72] (ovpn-112-72.ams2.redhat.com [10.36.112.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u35FLJGe011647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Apr 2016 11:21:20 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5703D7EE.2000005@redhat.com>
Date: Tue, 5 Apr 2016 17:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	Vijay <vijayak@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/2] target-arm: Use Neon for zero
	checking
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
X-TUID: NcHxSkyJ84kd



On 05/04/2016 16:36, Peter Maydell wrote:
>> > +
>> > +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16
>> > +
>> > +/*
>> > + * Zero page/buffer checking using SIMD(Neon)
>> > + */
>> > +
>> > +static bool
>> > +can_use_buffer_find_nonzero_offset_neon(const void *buf, size_t len=
)
>> > +{
>> > +    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON
>> > +                   * sizeof(NEON_VECTYPE)) =3D=3D 0
>> > +            && ((uintptr_t) buf) % sizeof(NEON_VECTYPE) =3D=3D 0);
>> > +}
>> > +
>> > +static size_t buffer_find_nonzero_offset_neon(const void *buf, size=
_t len)
>> > +{
>> > +    size_t i;
>> > +    NEON_VECTYPE d0, d1, d2, d3, d4, d5, d6;
>> > +    NEON_VECTYPE d7, d8, d9, d10, d11, d12, d13, d14;
>> > +    uint64_t const *data =3D buf;
>> > +
>> > +    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
>> > +    len /=3D sizeof(unsigned long);
>> > +
>> > +    for (i =3D 0; i < len; i +=3D 32) {
>> > +        d0 =3D NEON_LOAD_N_ORR(data[i], data[i + 2]);
>> > +        d1 =3D NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
>> > +        d2 =3D NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
>> > +        d3 =3D NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
>> > +        d4 =3D NEON_ORR(d0, d1);
>> > +        d5 =3D NEON_ORR(d2, d3);
>> > +        d6 =3D NEON_ORR(d4, d5);
>> > +
>> > +        d7 =3D NEON_LOAD_N_ORR(data[i + 16], data[i + 18]);
>> > +        d8 =3D NEON_LOAD_N_ORR(data[i + 20], data[i + 22]);
>> > +        d9 =3D NEON_LOAD_N_ORR(data[i + 24], data[i + 26]);
>> > +        d10 =3D NEON_LOAD_N_ORR(data[i + 28], data[i + 30]);
>> > +        d11 =3D NEON_ORR(d7, d8);
>> > +        d12 =3D NEON_ORR(d9, d10);
>> > +        d13 =3D NEON_ORR(d11, d12);
>> > +
>> > +        d14 =3D NEON_ORR(d6, d13);
>> > +        if (NEON_EQ_ZERO(d14)) {
>> > +            break;
>> > +        }
>> > +    }
> Both the other optimised find_nonzero implementations in this
> file have two loops, not just one. Is it OK that this
> implementation has only a single loop?
>=20
> Paolo: do you know why we have two loops in the other
> implementations?

Because usually the first one or two iterations are enough to exit the
function if the page is nonzero.  It's measurably slower to go through
the unrolled loop in that case.  On the other hand, once the first few
iterations found only zero bytes, the buffer is very likely entirely
zero and the unrolled loop helps.

But in theory it should be enough to add a new #elif branch like this:

#include "arm_neon.h"
#define VECTYPE   uint64x2_t
#define VEC_OR(a, b) ((a) | (b))
#define ALL_EQ(a, b) /* ??? :) */

around the

/* vector definitions */

comment in util/cutils.c.  GCC should do everything else.

Paolo
