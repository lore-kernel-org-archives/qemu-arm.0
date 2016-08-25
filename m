Received: by 10.25.21.156 with SMTP id 28csp787548lfv;
        Thu, 25 Aug 2016 01:04:51 -0700 (PDT)
X-Received: by 10.55.164.199 with SMTP id n190mr8664471qke.17.1472112291152;
        Thu, 25 Aug 2016 01:04:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q185si9567752qkb.284.2016.08.25.01.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Aug 2016 01:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcpec-0000Zz-Ic
	for alex.bennee@linaro.org; Thu, 25 Aug 2016 04:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcpeV-0000XH-K3
	for qemu-arm@nongnu.org; Thu, 25 Aug 2016 04:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcpeT-0003IZ-Fn
	for qemu-arm@nongnu.org; Thu, 25 Aug 2016 04:04:42 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bcpeP-0003Fn-RH; Thu, 25 Aug 2016 04:04:37 -0400
Received: by mail-oi0-x244.google.com with SMTP id b22so3933674oii.3;
	Thu, 25 Aug 2016 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fp+e1J/6xxiv6vZMtvzTsNMR4jlbP15Z760nleMhqMc=;
	b=ydzPz0S/wyL8i6Fy6CPSFKvJUSeZKEyj4cn46irvFo8jB3xoRXd+561Xy2HfBu3BTf
	hRB8x5Oon+ndjzkc6oCdGldy3lLZl3cfIwbxJxjDntFMoNccceYwkg8t5cIUSmIJq/gx
	3DHX8yTrqVFHneAOAoAhRyZgOQ/EeZtdwpSZ6C2yP0uOA/JwqsCJgODrKp0FfQHQuP89
	kpVNb3atwOQ7lj+KxKrR4CRh5SgupgaIdRgBzLjCeWqAuWvLtPugbzIjGSaYMZ6kBycw
	buEflAfDX8WcCb9gUY81dECDnpU4Sp8vR1D+kJCdADydJFchU49e9Dre2eNaWeO/wO1s
	Ifkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fp+e1J/6xxiv6vZMtvzTsNMR4jlbP15Z760nleMhqMc=;
	b=iuaImt4PsDdTQzHXrxxmqQpl0tvDSoRZtOf3PQVe9hGA2Y73vC1Pe0nJlJ5KUUWhTu
	s5ul0tH8/CKezUKQ3NVu/TM4pYCBrlEdV/X6ZddiLA0xAttCGp76CLmMsoWxZXKw3kOZ
	dLIlFUVetzR4Rcu9MXV1BZUvw0jwFo5qFrhSO/+ewymSshzh024smlbAq46WoD4+do6Z
	B+q4XeG+wtP7HoHsr8JO0pkYQPYnq2QjBVoAtdj7n6BlX0pnvbw+SDRfohj8FT4DDvUe
	lh/KqlVjk+vxg33FHrtC61CbTC2vWz1V1flix+urVJOZl5RbIyFDhTEJcGbed4gGz2EF
	0m0w==
X-Gm-Message-State: AEkoout2wYFoX2NErjQnRpa14Eu44nJ5AoIi59YBUdPhwN3rP3YKZyIWHiYxs6+LGWBRz3wz1Ra7A0CPMc1OZA==
X-Received: by 10.202.60.87 with SMTP id j84mr5661556oia.53.1472112277098;
	Thu, 25 Aug 2016 01:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.203 with HTTP; Thu, 25 Aug 2016 01:04:36 -0700 (PDT)
In-Reply-To: <CALicx6v1BgkW8saxZcgLGt5Hd47MSgfOEQQ8-mdsTgYMgnqvJw@mail.gmail.com>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<CALicx6v1BgkW8saxZcgLGt5Hd47MSgfOEQQ8-mdsTgYMgnqvJw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 25 Aug 2016 13:34:36 +0530
Message-ID: <CALicx6vZiE7mDabb5i+nrOK3J+LBQMMJbCiLY1ORvRwyEN6O-Q@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 0/7] Improve buffer_is_zero
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKWWpOr1Dutc

On Thu, Aug 25, 2016 at 12:07 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> Hi Richard,
>
>   Migration fails on arm64 with these patches.
> On the destination VM, follow errors are appearing.
>
> qemu-system-aarch64: VQ 0 size 0x400 Guest index 0x0 inconsistent with
> Host index 0x1937: delta 0xe6c9
> qemu-system-aarch64: error while loading state for instance 0x0 of
> device 'virtio-mmio@000000000a003e00/virtio-net'
> qemu-system-aarch64: load of migration failed: Operation not permitted
> qemu-system-aarch64: network script /etc/qemu-ifdown failed with status 256

With below changes, migration is working fine on arm64.

diff --git a/util/cutils.c b/util/cutils.c
index 30fac02..9bbf31f 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -170,6 +170,7 @@ static bool __attribute__((noinline))
             \
 NAME(const void *buf, size_t len)                               \
 {                                                               \
     const void *end = buf + len;                                \
+    const VECTYPE zero = (VECTYPE){0};                          \
     do {                                                        \
         const VECTYPE *p = buf;                                 \
         VECTYPE t;                                              \
@@ -185,7 +186,7 @@ NAME(const void *buf, size_t len)
             \
         } else {                                                \
             link_error();                                       \
         }                                                       \
-        if (unlikely(!ZERO(t))) {                               \
+        if (unlikely(!ZERO(t, zero))) {                         \
             return false;                                       \
         }                                                       \
         buf += SIZE;                                            \
@@ -227,7 +228,7 @@ buffer_zero_base(const void *buf, size_t len)
     return true;
 }
-#define IDENT_ZERO(X)  (X)
+#define IDENT_ZERO(X1, X2)  (X1 == X2)
 ACCEL_BUFFER_ZERO(buffer_zero_int, 4*sizeof(long), long, IDENT_ZERO)

 static bool select_accel_int(const void *buf, size_t len)
@@ -511,7 +512,9 @@ static bool select_accel_fn(const void *buf, size_t len)
 #elif defined(__aarch64__)
 #include "arm_neon.h"

-#define DO_ZERO(X)  (vgetq_lane_u64((X), 0) | vgetq_lane_u64((X), 1))
+#define DO_ZERO(X1, X2) \
+        ((vgetq_lane_u64(X1, 0) == vgetq_lane_u64(X2, 0)) && \
+         (vgetq_lane_u64(X1, 1) == vgetq_lane_u64(X2, 1)))
 ACCEL_BUFFER_ZERO(buffer_zero_neon_64, 64, uint64x2_t, DO_ZERO)
 ACCEL_BUFFER_ZERO(buffer_zero_neon_128, 128, uint64x2_t, DO_ZERO)

@@ -526,7 +529,7 @@ static void __attribute__((constructor))
init_buffer_zero_accel(void)
        since the later is not available to userspace.  This seems
        to work in practice for existing implementations.  */
     asm("mrs %0, dczid_el0" : "=r"(t));
-    if ((t & 15) * 16 >= 128) {
+    if (pow(2, (t & 0xf)) * 4 >= 128) {
         buffer_zero_line_mask = 128 - 1;
         buffer_zero_accel = buffer_zero_neon_128;
     } else {


>
> Regards
> Vijay
>
>
> On Wed, Aug 24, 2016 at 9:47 AM, Richard Henderson <rth@twiddle.net> wrote:
>> Patches 1-3 remove the use of ifunc from the implementation.
>>
>> Patch 5 adjusts the x86 implementation a bit more to take
>> advantage of ptest (in sse4.1) and unaligned accesses (in avx1).
>>
>> Patches 2 and 6 are the result of my conversation with Vijaya
>> Kumar with respect to ThunderX.
>>
>> Patch 7 is the result of seeing some really really horrible code
>> produced for ppc64le (gcc 4.9 and mainline).
>>
>> This has had limited testing.  What I don't know is the best way
>> to benchmark this -- the only way I know to trigger this is via
>> the console, by hand, which doesn't make for reasonable timing.
>>
>>
>> r~
>>
>>
>> Richard Henderson (7):
>>   cutils: Remove SPLAT macro
>>   cutils: Export only buffer_is_zero
>>   cutils: Rearrange buffer_is_zero acceleration
>>   cutils: Add generic prefetch
>>   cutils: Rewrite x86 buffer zero checking
>>   cutils: Rewrite aarch64 buffer zero checking
>>   cutils: Rewrite ppc buffer zero checking
>>
>>  configure             |  21 +-
>>  include/qemu/cutils.h |   2 -
>>  migration/ram.c       |   2 +-
>>  migration/rdma.c      |   5 +-
>>  util/cutils.c         | 526 +++++++++++++++++++++++++++++++++-----------------
>>  5 files changed, 352 insertions(+), 204 deletions(-)
>>
>> --
>> 2.7.4
>>
