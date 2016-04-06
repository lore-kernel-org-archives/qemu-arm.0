Received: by 10.25.208.211 with SMTP id h202csp846185lfg;
        Wed, 6 Apr 2016 01:32:20 -0700 (PDT)
X-Received: by 10.140.37.113 with SMTP id q104mr26059854qgq.104.1459931539843;
        Wed, 06 Apr 2016 01:32:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t105si1251505qge.124.2016.04.06.01.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 01:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anist-0003Yv-3m
	for alex.bennee@linaro.org; Wed, 06 Apr 2016 04:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1anisj-0003IK-C4
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 04:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1anisf-0006N9-5B
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 04:32:09 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1anise-0006My-U5; Wed, 06 Apr 2016 04:32:05 -0400
Received: by mail-oi0-x243.google.com with SMTP id v67so5926242oie.0;
	Wed, 06 Apr 2016 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=zdSOkISx6K5wdMMIYuShh9LAKgzCKexgFQkM8q0+i3M=;
	b=CcxzIogZo7jHyssB/1d1p4yIzcDh/5xR03NW3ud2738vOU3dRLClJQPfZexQD6epfy
	ArB7fdt4mEUC9IrOCTM+/3CGzO5Xigd5ocuD+2TTlnj07klxPWFETwjFUTYRMAIbQeRP
	Y12WcnI7IKwtkY1Nv152lKOiy6tyetSKIuOUk4zneO+cCR+GFz1INduFANyu7PVRmapw
	OehvjOCmpZY0N2W72yqLaurtPo7pMdhxll/4h/fy8TqWW+MNT2thv24pTWtPJqJtchyc
	/kSjPMPLd9W7G+wXsFuiNH6nNndgbwwd6nZn6LNLwtYACHpEt9P18rncJC+OmMNOxr6L
	rexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=zdSOkISx6K5wdMMIYuShh9LAKgzCKexgFQkM8q0+i3M=;
	b=PwJjWwDN9JTSQgjaZ6/PHhFvNtV36mB+JYYzDFzA9E0VcjLetz4jl7OKD4G6dz6SFF
	FNF+1v4UmVWtw4dTL7kKrXj3X5a7G3JuT9VMsJOAw8UvQOQ5tUADt10qmoINpki4D0e/
	9Ht4ApcRU+QE2tmcr2TjcM4FCthyC6INbNux/GOIldR+Rpq+yXLEjQOBJVSeEfuaLMYH
	qYlTQ+YBcdDEMfrkRA9LARwtdjvzijA7zvpFg9y9lgUKuFpsOpGXOfQJHCrc4x7VoETF
	d4bIbSq5c6F+5hKFmiBp5XEbGf2krQDbuiKhDM/PpwRUjejhu+j8iTJ/DR1PEamzhd1m
	2Rzg==
X-Gm-Message-State: AD7BkJLocknVlSGngTvPyyXAO04/Vi78nVoSbdqMLZDS9ZdDTswLjB3pWr8oSrPQtNhTyx+9dyszP2yXrEDgvA==
MIME-Version: 1.0
X-Received: by 10.157.44.139 with SMTP id p11mr17158618otb.124.1459931524131; 
	Wed, 06 Apr 2016 01:32:04 -0700 (PDT)
Received: by 10.157.29.134 with HTTP; Wed, 6 Apr 2016 01:32:04 -0700 (PDT)
In-Reply-To: <CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
Date: Wed, 6 Apr 2016 14:02:04 +0530
Message-ID: <CALicx6tVZhH==LT5no5k_=y1x_ixHyu_u_+MSgB7SPAfamu80Q@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijay <vijayak@cavium.com>,
	Paolo Bonzini <pbonzini@redhat.com>
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
X-TUID: 6VqfxRa4tT5e

On Tue, Apr 5, 2016 at 8:06 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 April 2016 at 14:39,  <vijayak@caviumnetworks.com> wrote:
>> From: Vijay <vijayak@cavium.com>
>>
>> Use Neon instructions to perform zero checking of
>> buffer. This is helps in reducing downtime during
>> live migration.
>>
>> Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
>> ---
>>  util/cutils.c |   81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index 43d1afb..d343b9a 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -352,6 +352,87 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
>>      return func;
>>  }
>>  #pragma GCC pop_options
>> +
>> +#elif defined __aarch64__
>> +#include "arm_neon.h"
>
> Can we rely on all compilers having this, or do we need to
> test in configure?

GCC and armcc support the same intrinsics. Both needs inclusion
of arm_neon.h.

>
>> +
>> +#define NEON_VECTYPE               uint64x2_t
>> +#define NEON_LOAD_N_ORR(v1, v2)    vorrq_u64(vld1q_u64(&v1), vld1q_u64(&v2))
>> +#define NEON_ORR(v1, v2)           vorrq_u64(v1, v2)
>> +#define NEON_EQ_ZERO(v1) \
>> +        ((vgetq_lane_u64(vceqzq_u64(v1), 0) == 0) || \
>> +         (vgetq_lane_u64(vceqzq_u64(v1), 1)) == 0)
>
> The intrinsics are a bit confusing, but shouldn't we be
> testing that both lanes of v1 are 0, rather than whether
> either of them is? (so "&&", not "||").

Above check is correct. vceqzq() sets all bits to 1 if value is 0.
So if one lane is 0, then it means it is non-zero buffer. I think
redefining this macro as below would be better and avoid
vceqzq_u64()

#define NEON_NOT_EQ_ZERO(v1) \
        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1)) != 0)

>
>> +
>> +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16
>> +
>> +/*
>> + * Zero page/buffer checking using SIMD(Neon)
>> + */
>> +
>> +static bool
>> +can_use_buffer_find_nonzero_offset_neon(const void *buf, size_t len)
>> +{
>> +    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON
>> +                   * sizeof(NEON_VECTYPE)) == 0
>> +            && ((uintptr_t) buf) % sizeof(NEON_VECTYPE) == 0);
>> +}
>> +
>> +static size_t buffer_find_nonzero_offset_neon(const void *buf, size_t len)
>> +{
>> +    size_t i;
>> +    NEON_VECTYPE d0, d1, d2, d3, d4, d5, d6;
>> +    NEON_VECTYPE d7, d8, d9, d10, d11, d12, d13, d14;
>> +    uint64_t const *data = buf;
>> +
>> +    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
>> +    len /= sizeof(unsigned long);
>> +
>> +    for (i = 0; i < len; i += 32) {
>> +        d0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
>> +        d1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
>> +        d2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
>> +        d3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
>> +        d4 = NEON_ORR(d0, d1);
>> +        d5 = NEON_ORR(d2, d3);
>> +        d6 = NEON_ORR(d4, d5);
>> +
>> +        d7 = NEON_LOAD_N_ORR(data[i + 16], data[i + 18]);
>> +        d8 = NEON_LOAD_N_ORR(data[i + 20], data[i + 22]);
>> +        d9 = NEON_LOAD_N_ORR(data[i + 24], data[i + 26]);
>> +        d10 = NEON_LOAD_N_ORR(data[i + 28], data[i + 30]);
>> +        d11 = NEON_ORR(d7, d8);
>> +        d12 = NEON_ORR(d9, d10);
>> +        d13 = NEON_ORR(d11, d12);
>> +
>> +        d14 = NEON_ORR(d6, d13);
>> +        if (NEON_EQ_ZERO(d14)) {
>> +            break;
>> +        }
>> +    }
>
> Both the other optimised find_nonzero implementations in this
> file have two loops, not just one. Is it OK that this
> implementation has only a single loop?
>
> Paolo: do you know why we have two loops in the other
> implementations?

Paolo was right as he mentioned in the previous email.
But with two loops, I don't see much benefit. So restricted to
one loop.

>
>> +
>> +    return i * sizeof(unsigned long);
>> +}
>> +
>> +static inline bool neon_support(void)
>> +{
>> +    /*
>> +     * Check if neon feature is supported.
>> +     * By default neon is supported for aarch64.
>> +     */
>> +    return true;
>> +}
>
> There doesn't seem much point in this. We can assume Neon exists
> on any CPU we're going to run on (it's part of the ABI, the kernel
> assumes it, etc etc). So you can just implement the functions without
> the indirection functions below.
>
 Hmm. One reason was compilation fails if we don't call
can_use_buffer_find_nonzero_offset_inner() function from inside neon
implementation.
So I added this similar to AVX2 intel. Also thought if any platform
does not implement
Neon, then can simply skip changes this function.

>> +
>> +bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
>> +{
>> +    return neon_support() ? can_use_buffer_find_nonzero_offset_neon(buf, len) :
>> +           can_use_buffer_find_nonzero_offset_inner(buf, len);
>> +}
>> +
>> +size_t buffer_find_nonzero_offset(const void *buf, size_t len)
>> +{
>> +    return neon_support() ? buffer_find_nonzero_offset_neon(buf, len) :
>> +           buffer_find_nonzero_offset_inner(buf, len);
>> +}
>>  #else
>>  bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
>>  {
>> --
>
> thanks
> -- PMM
