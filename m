Received: by 10.25.208.211 with SMTP id h202csp422911lfg;
        Thu, 7 Apr 2016 03:45:18 -0700 (PDT)
X-Received: by 10.140.23.18 with SMTP id 18mr2491437qgo.91.1460025918336;
        Thu, 07 Apr 2016 03:45:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si5409928qhc.33.2016.04.07.03.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 03:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao7R7-0005QR-DN
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 06:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7R4-0005OG-RI
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7R3-000328-Qm
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:45:14 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7R3-000321-KN
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:45:13 -0400
Received: by mail-vk0-x235.google.com with SMTP id k1so93564825vkb.0
	for <qemu-arm@nongnu.org>; Thu, 07 Apr 2016 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kliGAKwcIe6EOCJigSntEaurUFCarUh3kNV+1Y9t5gY=;
	b=Xtbh59rElLVQp+OWWxW8drKjVmDZVTqBMRPbSc6vGbk0hZJH7YOkjDjm+VAofUUsdM
	b+wmukOrsPKi/6zxvTo9NcMTgj71BuLbrhhcARtkLk4V+UMGwA1pkhdeLQDQ1ddxxcTh
	iN/B4Xn1jsYvBqVjgsnMp8x1oj1Za/3l+7OUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kliGAKwcIe6EOCJigSntEaurUFCarUh3kNV+1Y9t5gY=;
	b=mjqtQH+Kg7pb+sacBOpUq3GDafk4PFWSpLZpOcFYB6HC+YtZ9/Q9swXe4PHXBvNfBp
	s857ctLCZtIRMQx4eGZKcwzq2++BqE6Tc1R4b5miHFcAzp2MDu0e9QEprs4mTvbyVUz+
	5MltaT7CZcLg8KVgohrC9DWoM/8gVqR7v9SZ5kYjccyGknTwbQhKzZomKN5puxjVffX3
	AQPkwjwsgjSgi7RrQz1+8an6J/P9FHpoX0/pnqo+C1cIhGRyc5HhObRTfzoB0wr2fVwv
	0Jh6oFQgGMFlQaEYVtJ9QMHUGIo5EdfpwQ2XFDQvY6O1YBJSdwA0hz0xrnSSsUGDxFDv
	4jOg==
X-Gm-Message-State: AD7BkJJn7bY9kpp8i4z3iJyt6I/Y5UR0DorXQYRiO3E2RnF1omPI7dd+cHYuc4radjOUDO91tABooSeyB8TaeYja
X-Received: by 10.176.6.41 with SMTP id f38mr853166uaf.38.1460025913049; Thu,
	07 Apr 2016 03:45:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 7 Apr 2016 03:44:53 -0700 (PDT)
In-Reply-To: <1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2016 11:44:53 +0100
Message-ID: <CAFEAcA-tS1LNdcf7C49dRvAFr-8Fd7_GXwc=hL1t+_jaMXf_KQ@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>, knv.suresh2009@gmail.com,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Vijay <vijayak@cavium.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
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
X-TUID: 65+69SfLzY42

On 7 April 2016 at 10:58,  <vijayak@caviumnetworks.com> wrote:
> From: Vijay <vijayak@cavium.com>
>
> Use Neon instructions to perform zero checking of
> buffer. This is helps in reducing downtime during
> live migration.
>
> Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
> Signed-off-by: Suresh <ksuresh@caviumnetworks.com>
> ---
>  util/cutils.c |   74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>
> diff --git a/util/cutils.c b/util/cutils.c
> index 43d1afb..bb61c91 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -352,6 +352,80 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
>      return func;
>  }
>  #pragma GCC pop_options
> +
> +#elif defined __aarch64__
> +#include "arm_neon.h"
> +
> +#define NEON_VECTYPE               uint64x2_t
> +#define NEON_LOAD_N_ORR(v1, v2)    (vld1q_u64(&v1) | vld1q_u64(&v2))
> +#define NEON_ORR(v1, v2)           ((v1) | (v2))
> +#define NEON_NOT_EQ_ZERO(v1) \
> +        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1) != 0))
> +
> +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16

This says 16 lots of loads of uint64x2_t...

> +    for (i = 0; i < len; i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON) {
> +        qword0 = NEON_LOAD_N_ORR(data[i], data[i + 2]);
> +        qword1 = NEON_LOAD_N_ORR(data[i + 4], data[i + 6]);
> +        qword2 = NEON_LOAD_N_ORR(data[i + 8], data[i + 10]);
> +        qword3 = NEON_LOAD_N_ORR(data[i + 12], data[i + 14]);
> +        qword4 = NEON_ORR(qword0, qword1);
> +        qword5 = NEON_ORR(qword2, qword3);
> +        qword6 = NEON_ORR(qword4, qword5);

...but the loop is only loading 8 lots of uint64x2_t.


thanks
-- PMM
