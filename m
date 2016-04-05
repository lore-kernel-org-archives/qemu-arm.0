Received: by 10.25.208.211 with SMTP id h202csp458582lfg;
        Tue, 5 Apr 2016 07:37:17 -0700 (PDT)
X-Received: by 10.55.79.17 with SMTP id d17mr40590408qkb.56.1459867037068;
        Tue, 05 Apr 2016 07:37:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198si26415715qhb.20.2016.04.05.07.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Apr 2016 07:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anS6W-00062A-KL
	for alex.bennee@linaro.org; Tue, 05 Apr 2016 10:37:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anS6M-0005wi-BN
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 10:37:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anS6L-0005uO-1q
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 10:37:06 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anS6J-0005u4-QL
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 10:37:04 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k1so20158390vkb.0
	for <qemu-arm@nongnu.org>; Tue, 05 Apr 2016 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cBhFPz1cRg/UqpGUnvoSlgUOrryC5wYw2UIUuDJg6sk=;
	b=OI8DDvjiXM19JNuyQ19hYwGWfTbx4mcuJSFMwLjyG1UHrndQDUgr0MReaLOGlioM6Y
	rLUmrp/EW4DtRBTyeXidJcQzhPD9t7Db21Pb8Y7AxNZ/mrE+/gbga4ERt4XOAs5dRvRN
	z8IlxYnUUu8vrKpuiKrVZQQX/Zughzf+SvL+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cBhFPz1cRg/UqpGUnvoSlgUOrryC5wYw2UIUuDJg6sk=;
	b=g9HgMf2Y2c1UjOuiremPWH1KJyMePQGHYa1y1Ab5xYgmE31F7UejQ7W2Lk53892eFh
	j2Qc7+Xswe3zeB6+MPkAwpcqiIkI92+QyoSYNc+eRVpRhdn1nOHseBcEmMLPsvEy7/+H
	n68yIxmFOuheqAZNBU+gn+EOn/hdcgEwFmHJFu/DWSY7FP6x4VDxUdoB39v3o+AR+RR9
	bREvE8fVUX32drCjHdE6L5N5HCGXJk77vf+qpoDLZwTlTcl4UFAyKzPhRVywTLYJTOhc
	ee5B7b8AKLkLxe+QtARivSl4Ro1JJHDAja403ukjkjJRjtYihNz7KGeZeAxBLWJb5FdB
	qXAQ==
X-Gm-Message-State: AD7BkJKjRth9tksNbUOfUqsxj8E8MkbG7UlukZaOwAowgBUgtNVR2FgR5iwPo890yI2D5YkO/vkTO6CpD1Z2vU02
X-Received: by 10.159.38.3 with SMTP id 3mr7253284uag.107.1459867023233; Tue,
	05 Apr 2016 07:37:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 07:36:43 -0700 (PDT)
In-Reply-To: <1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 15:36:43 +0100
Message-ID: <CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Vijay <vijayak@cavium.com>
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
X-TUID: hXoaEmfGVrNp

On 4 April 2016 at 14:39,  <vijayak@caviumnetworks.com> wrote:
> From: Vijay <vijayak@cavium.com>
>
> Use Neon instructions to perform zero checking of
> buffer. This is helps in reducing downtime during
> live migration.
>
> Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
> ---
>  util/cutils.c |   81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/util/cutils.c b/util/cutils.c
> index 43d1afb..d343b9a 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -352,6 +352,87 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
>      return func;
>  }
>  #pragma GCC pop_options
> +
> +#elif defined __aarch64__
> +#include "arm_neon.h"

Can we rely on all compilers having this, or do we need to
test in configure?

> +
> +#define NEON_VECTYPE               uint64x2_t
> +#define NEON_LOAD_N_ORR(v1, v2)    vorrq_u64(vld1q_u64(&v1), vld1q_u64(&v2))
> +#define NEON_ORR(v1, v2)           vorrq_u64(v1, v2)
> +#define NEON_EQ_ZERO(v1) \
> +        ((vgetq_lane_u64(vceqzq_u64(v1), 0) == 0) || \
> +         (vgetq_lane_u64(vceqzq_u64(v1), 1)) == 0)

The intrinsics are a bit confusing, but shouldn't we be
testing that both lanes of v1 are 0, rather than whether
either of them is? (so "&&", not "||").

> +
> +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16
> +
> +/*
> + * Zero page/buffer checking using SIMD(Neon)
> + */
> +
> +static bool
> +can_use_buffer_find_nonzero_offset_neon(const void *buf, size_t len)
> +{
> +    return (len % (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON
> +                   * sizeof(NEON_VECTYPE)) == 0
> +            && ((uintptr_t) buf) % sizeof(NEON_VECTYPE) == 0);
> +}
> +
> +static size_t buffer_find_nonzero_offset_neon(const void *buf, size_t len)
> +{
> +    size_t i;
> +    NEON_VECTYPE d0, d1, d2, d3, d4, d5, d6;
> +    NEON_VECTYPE d7, d8, d9, d10, d11, d12, d13, d14;
> +    uint64_t const *data = buf;
> +
> +    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
> +    len /= sizeof(unsigned long);
> +
> +    for (i = 0; i < len; i += 32) {
> +        d0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
> +        d1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
> +        d2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
> +        d3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
> +        d4 = NEON_ORR(d0, d1);
> +        d5 = NEON_ORR(d2, d3);
> +        d6 = NEON_ORR(d4, d5);
> +
> +        d7 = NEON_LOAD_N_ORR(data[i + 16], data[i + 18]);
> +        d8 = NEON_LOAD_N_ORR(data[i + 20], data[i + 22]);
> +        d9 = NEON_LOAD_N_ORR(data[i + 24], data[i + 26]);
> +        d10 = NEON_LOAD_N_ORR(data[i + 28], data[i + 30]);
> +        d11 = NEON_ORR(d7, d8);
> +        d12 = NEON_ORR(d9, d10);
> +        d13 = NEON_ORR(d11, d12);
> +
> +        d14 = NEON_ORR(d6, d13);
> +        if (NEON_EQ_ZERO(d14)) {
> +            break;
> +        }
> +    }

Both the other optimised find_nonzero implementations in this
file have two loops, not just one. Is it OK that this
implementation has only a single loop?

Paolo: do you know why we have two loops in the other
implementations?

> +
> +    return i * sizeof(unsigned long);
> +}
> +
> +static inline bool neon_support(void)
> +{
> +    /*
> +     * Check if neon feature is supported.
> +     * By default neon is supported for aarch64.
> +     */
> +    return true;
> +}

There doesn't seem much point in this. We can assume Neon exists
on any CPU we're going to run on (it's part of the ABI, the kernel
assumes it, etc etc). So you can just implement the functions without
the indirection functions below.

> +
> +bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
> +{
> +    return neon_support() ? can_use_buffer_find_nonzero_offset_neon(buf, len) :
> +           can_use_buffer_find_nonzero_offset_inner(buf, len);
> +}
> +
> +size_t buffer_find_nonzero_offset(const void *buf, size_t len)
> +{
> +    return neon_support() ? buffer_find_nonzero_offset_neon(buf, len) :
> +           buffer_find_nonzero_offset_inner(buf, len);
> +}
>  #else
>  bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
>  {
> --

thanks
-- PMM
