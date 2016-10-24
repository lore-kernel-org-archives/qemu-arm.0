Received: by 10.37.193.4 with SMTP id r4csp2714742ybf;
        Mon, 24 Oct 2016 04:27:29 -0700 (PDT)
X-Received: by 10.55.142.130 with SMTP id q124mr13847493qkd.220.1477308449429;
        Mon, 24 Oct 2016 04:27:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si10645818qtc.120.2016.10.24.04.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 04:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bydPc-0003U7-9Z
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 07:27:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bydO7-0002l9-Es
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 07:25:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bydO6-0006Oh-DR
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 07:25:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1bydNy-0006MO-Uv; Mon, 24 Oct 2016 07:25:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EFD861E67;
	Mon, 24 Oct 2016 11:25:46 +0000 (UTC)
Received: from [10.36.112.47] (ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9OBPdtQ009766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 24 Oct 2016 07:25:43 -0400
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	rth@twiddle.net
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-4-git-send-email-vijay.kilari@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <538a5505-fef3-fc2b-4411-bbaa8537c9c7@redhat.com>
Date: Mon, 24 Oct 2016 13:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477288523-10819-4-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 24 Oct 2016 11:25:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/3] utils: Add prefetch for Thunderx
 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M1DkJtdBgd6e



On 24/10/2016 07:55, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>=20
> Thunderx pass2 chip requires explicit prefetch
> instruction to give prefetch hint.
>=20
> To speed up live migration on Thunderx platform,
> prefetch instruction is added in zero buffer check
> function.The below results show live migration time improvement
> with prefetch instruction. VM with 4 VCPUs, 8GB RAM is migrated.
>=20
> Without prefetch total migration time is ~13 seconds
> adding prefetch total migration time is 9.5 seconds
>=20
> Code for decoding cache size is taken from Richard's
> patch
>=20
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  util/bufferiszero.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/util/bufferiszero.c b/util/bufferiszero.c
> index 421d945..f50b8df 100644
> --- a/util/bufferiszero.c
> +++ b/util/bufferiszero.c
> @@ -25,6 +25,10 @@
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/bswap.h"
> +#include <math.h>
> +
> +static uint32_t cache_line_factor =3D 1;

Let's express this in bytes, with a default value of 64 (so rename
cache_line_factor->cache_line_size).

> +static uint32_t prefetch_line_dist =3D 1;
> =20
>  static bool
>  buffer_zero_int(const void *buf, size_t len)
> @@ -49,7 +53,8 @@ buffer_zero_int(const void *buf, size_t len)
>          const uint64_t *e =3D (uint64_t *)(((uintptr_t)buf + len) & -8=
);
> =20
>          for (; p + 8 <=3D e; p +=3D 8) {
> -            __builtin_prefetch(p + 8, 0, 0);
> +            __builtin_prefetch(p +
> +               (8 * cache_line_factor * prefetch_line_dist), 0, 0);

You should precompute cache_line_bytes * prefetch_line_dist /
sizeof(uint64_t) in a single variable, prefetch_distance.  This saves
the effort of loading global variables repeatedly.  Then you can do

    __builtin_prefetch(p + prefetch_distance, 0, 0);

>              if (t) {
>                  return false;
>              }
> @@ -293,6 +298,30 @@ bool test_buffer_is_zero_next_accel(void)
>  }
>  #endif
> =20
> +#if defined(__aarch64__)
> +#include "qemu/aarch64-cpuid.h"
> +
> +static void __attribute__((constructor)) aarch64_init_cache_size(void)
> +{
> +    uint64_t t;
> +
> +    /* Use the DZP block size as a proxy for the cacheline size,
> +       since the later is not available to userspace.  This seems
> +       to work in practice for existing implementations.  */
> +    asm("mrs %0, dczid_el0" : "=3Dr"(t));
> +    if (pow(2, (t & 0xf)) * 4 >=3D 128) {
> +        cache_line_factor =3D 2;
> +    } else {
> +        cache_line_factor =3D 1;
> +    }
> +
> +    get_aarch64_cpu_id();
> +    if (is_thunderx_pass2_cpu()) {
> +        prefetch_line_dist =3D 3;
> +    }
> +}
> +#endif
> +
>  /*
>   * Checks if a buffer is all zeroes
>   */
> @@ -305,6 +334,12 @@ bool buffer_is_zero(const void *buf, size_t len)
>      /* Fetch the beginning of the buffer while we select the accelerat=
or.  */
>      __builtin_prefetch(buf, 0, 0);
> =20
> +#if defined(__aarch64__)
> +    if (is_thunderx_pass2_cpu()) {
> +        __builtin_prefetch(buf + 16, 0, 0);
> +        __builtin_prefetch(buf + 32, 0, 0);

This should not be ThunderX or aarch64 specific; it should be a loop like

    prefetch_distance_bytes =3D prefetch_line_dist * cache_line_size;
    for (i =3D 0; i < prefetch_distance_bytes; i +=3D cache_line_size)
         __builtin_prefetch(buf + i, 0, 0);

In the default case, cache_line_bytes =3D=3D prefetch_distance_bytes (bot=
h
are 64) and you will get the same behavior as the existing

    __builtin_prefetch(buf, 0, 0);

Thanks,

Paolo

> +    }
> +#endif
>      /* Use an optimized zero check if possible.  Note that this also
>         includes a check for an unrolled loop over 64-bit integers.  */
>      return select_accel_fn(buf, len);
>=20
