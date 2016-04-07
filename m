Received: by 10.25.208.211 with SMTP id h202csp416535lfg;
        Thu, 7 Apr 2016 03:30:29 -0700 (PDT)
X-Received: by 10.140.128.21 with SMTP id 21mr2565874qha.59.1460025029843;
        Thu, 07 Apr 2016 03:30:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p75si5356118qha.97.2016.04.07.03.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 03:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao7Cm-0004HW-RI
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 06:30:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ao7Cg-0004Bg-W7
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ao7Cb-0008Ao-70
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:30:22 -0400
Received: from mx5-phx2.redhat.com ([209.132.183.37]:43280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ao7CW-0008AJ-Nl; Thu, 07 Apr 2016 06:30:12 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u37AU8OL029198;
	Thu, 7 Apr 2016 06:30:08 -0400
Date: Thu, 7 Apr 2016 06:30:07 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: vijayak@caviumnetworks.com
Message-ID: <1303989769.499295.1460025007144.JavaMail.zimbra@redhat.com>
In-Reply-To: <1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF45 (Linux)/8.0.6_GA_5922)
Thread-Topic: target-arm: Use Neon for zero checking
Thread-Index: vG8pXAB9HU9IErvcWSQk5QGVwDD0iw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.37
Cc: peter maydell <peter.maydell@linaro.org>,
	vijay kilari <vijay.kilari@gmail.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	knv suresh2009 <knv.suresh2009@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Suresh <ksuresh@caviumnetworks.com>,
	Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/3] target-arm: Use Neon for zero
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
X-TUID: RO1PRn0m1rdK


> +#elif defined __aarch64__
> +#include "arm_neon.h"
> +
> +#define NEON_VECTYPE               uint64x2_t
> +#define NEON_LOAD_N_ORR(v1, v2)    (vld1q_u64(&v1) | vld1q_u64(&v2))

Why is the load and orr necessary?  Is ((v1) | (v2)) enough?

> +#define NEON_ORR(v1, v2)           ((v1) | (v2))
> +#define NEON_NOT_EQ_ZERO(v1) \
> +        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1) != 0))
> +
> +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16

Unless you have numbers saying that a 16-unroll is better than an 8-unroll
(and then you should put those in the commit message), you do not need to
duplicate code, just add aarch64 definitions for the existing code.

---

I've now read the rest of the patches, and you're adding prefetch code
that is ARM-specific.  Please provide numbers separately for each
patch, not just in the cover letter.  The cover letter is lost when the
patch is committed, while the commit messages remain.

On top of this, "With these changes, total migration time comes down
from 10 seconds to 2.5 seconds" is not a reproducible experiment.
What was the RAM size?  Was the guest just booted and idle, or was
there a workload?  What was the host?

Thanks,

Paolo

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
> +    NEON_VECTYPE qword0, qword1, qword2, qword3, qword4, qword5, qword6;
> +    uint64_t const *data = buf;
> +
> +    if (!len) {
> +        return 0;
> +    }
> +
> +    assert(can_use_buffer_find_nonzero_offset_neon(buf, len));
> +    len /= sizeof(unsigned long);
> +
> +    for (i = 0; i < len; i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON)
> {
> +        qword0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
> +        qword1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
> +        qword2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
> +        qword3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
> +        qword4 = NEON_ORR(qword0, qword1);
> +        qword5 = NEON_ORR(qword2, qword3);
> +        qword6 = NEON_ORR(qword4, qword5);
> +
> +        if (NEON_NOT_EQ_ZERO(qword6)) {
> +            break;
> +        }
> +    }
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

Then everything below this function is not necessary.

Paolo

> +}
> +
> +bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
> +{
> +    return neon_support() ? can_use_buffer_find_nonzero_offset_neon(buf,
> len) :
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
> 1.7.9.5
> 
> 
