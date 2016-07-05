Received: by 10.25.21.96 with SMTP id l93csp272770lfi;
        Tue, 5 Jul 2016 05:25:30 -0700 (PDT)
X-Received: by 10.200.41.163 with SMTP id 32mr27179113qts.101.1467721530384;
        Tue, 05 Jul 2016 05:25:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si2047562qkd.80.2016.07.05.05.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jul 2016 05:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKPPt-0002TR-Pn
	for alex.bennee@linaro.org; Tue, 05 Jul 2016 08:25:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bKPOp-0001wF-5P
	for qemu-devel@nongnu.org; Tue, 05 Jul 2016 08:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bKPOm-0006AM-EY
	for qemu-devel@nongnu.org; Tue, 05 Jul 2016 08:24:22 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bKPOm-0006AB-7B; Tue, 05 Jul 2016 08:24:20 -0400
Received: by mail-oi0-x244.google.com with SMTP id s17so27317075oih.1;
	Tue, 05 Jul 2016 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ei4P52ktSGytKxzftl6ZMQEeIrECR/7SEVfrW99jQ/M=;
	b=i6fDGt9rzv5u3TRNUAg2hGFmsddl4SNC1rzM8rKumXWDuSdpnPuB8halV8LyKnhotp
	JMzlmY5uqJsbz3dDzBWOuzbERqhw52UmizJTM9QD9/FomEoqZ7By1qovAHxVBTRb6VgW
	W9Yax+bGj9/O6Tc/VBQwGtMTUqBiFsgQKGT/YDB6WAwv7tMe5FUzJE93uPHE7DxTO1QQ
	3jJI3UR1meZ0zYSxLrz5SLwUvMRghrilEq88sah6zgX/TfpmLBc9CMpbRH/rJQoNKh7S
	KU+bmOFFhOmT37peB+Z/dGozIIC2bvlHK39NniWt3ZQ6g3SUcZ9ayR3ER72liNi/DCxc
	wHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ei4P52ktSGytKxzftl6ZMQEeIrECR/7SEVfrW99jQ/M=;
	b=Mq6TEMN73MDRNX9cT2UhXU52SYr3GST74QzNln6+FJxuWEikO07wArCc96L62UIOq/
	jZVTZrCjtAAuCBmDSmzIFrYoefoKCab0QYCLmQJL6xPIX8Z3791HH/Qjo2edVcg6C7lv
	5xgpEFOSRlb7BAXCNnN5bQp8meTyB6C3I3MSGUbZhmFRMJ5cE52RlhAGSUedRhY8FdrZ
	+2fB77ShE4d9PEr/4hYWW2stMB4TX8SXDHZKegxlhnIsjxrbJdLpBCtMT6ViYd1GGyQi
	4Gmdyyv4bKsYOUAK+nzUI9Z/kli3dmRGzGjx/s9n1xF5h7Tbvs4yDt0d8CSe9J3yNgmZ
	lHag==
X-Gm-Message-State: ALyK8tJ9/i9+eik7JqPIzN/lkEUYAl+E4G8eAU8dUq/FuE+qouqK8P3bWdaCfYvIJDIRNmOW1JHDh0K5uzoPfg==
X-Received: by 10.202.218.215 with SMTP id r206mr9580198oig.55.1467721459383; 
	Tue, 05 Jul 2016 05:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.7 with HTTP; Tue, 5 Jul 2016 05:24:18 -0700 (PDT)
In-Reply-To: <de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
	<CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
	<de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 5 Jul 2016 17:54:18 +0530
Message-ID: <CALicx6uJ=nK0-EKqi2j4_wQvikf2vRWV+Td1Ke5C6ysrv7ombA@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v3 1/1] target-arm: Use Neon for zero
 checking
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>, Suresh <ksuresh@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Vijay <vijayak@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kU0ljpqKHs9u

On Sat, Jul 2, 2016 at 3:37 AM, Richard Henderson <rth@twiddle.net> wrote:
> On 06/30/2016 06:45 AM, Peter Maydell wrote:
>>
>> On 29 June 2016 at 09:47,  <vijayak@cavium.com> wrote:
>>>
>>> From: Vijay <vijayak@cavium.com>
>>>
>>> Use Neon instructions to perform zero checking of
>>> buffer. This is helps in reducing total migration time.
>>
>>
>>> diff --git a/util/cutils.c b/util/cutils.c
>>> index 5830a68..4779403 100644
>>> --- a/util/cutils.c
>>> +++ b/util/cutils.c
>>> @@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
>>>  #define SPLAT(p)       _mm_set1_epi8(*(p))
>>>  #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) ==
>>> 0xFFFF)
>>>  #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
>>> +#elif __aarch64__
>>> +#include "arm_neon.h"
>>> +#define VECTYPE        uint64x2_t
>>> +#define ALL_EQ(v1, v2) \
>>> +        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
>>> +         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
>>> +#define VEC_OR(v1, v2) ((v1) | (v2))
>>
>>
>> Should be '#elif defined(__aarch64__)'. I have made this
>> tweak and put this patch in target-arm.next.
>
>
> Consider
>
> #define VECTYPE        uint32x4_t
> #define ALL_EQ(v1, v2) (vmaxvq_u32((v1) ^ (v2)) == 0)
>
>
> which compiles down to
>
>   1c:   6e211c00        eor     v0.16b, v0.16b, v1.16b
>   20:   6eb0a800        umaxv   s0, v0.4s
>   24:   1e260000        fmov    w0, s0
>   28:   6b1f001f        cmp     w0, wzr
>   2c:   1a9f17e0        cset    w0, eq
>   30:   d65f03c0        ret

For me this code compiles as below and migration time is ~100ms more.

See below 3 trails of migration time

  7039cc:       6eb0a800        umaxv   s0, v0.4s
  7039d0:       0e043c02        mov     w2, v0.s[0]
  7039d4:       350000c2        cbnz    w2, 7039ec <f0+0xf4>
  7039d8:       91002084        add     x4, x4, #0x8
  7039dc:       91020063        add     x3, x3, #0x80
  7039e0:       eb01009f        cmp     x4, x1

(qemu) info migrate
capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 3070 milliseconds
downtime: 55 milliseconds
setup: 4 milliseconds
transferred ram: 300637 kbytes
throughput: 802.49 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2062834 pages
skipped: 0 pages
normal: 70489 pages
normal bytes: 281956 kbytes
dirty sync count: 3

(qemu) info migrate
capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 3067 milliseconds
downtime: 47 milliseconds
setup: 5 milliseconds
transferred ram: 290277 kbytes
throughput: 775.61 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2064185 pages
skipped: 0 pages
normal: 67901 pages
normal bytes: 271604 kbytes
dirty sync count: 3
(qemu)

(qemu) info migrate
capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 3067 milliseconds
downtime: 34 milliseconds
setup: 5 milliseconds
transferred ram: 294614 kbytes
throughput: 787.19 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2063365 pages
skipped: 0 pages
normal: 68985 pages
normal bytes: 275940 kbytes
dirty sync count: 3

>
> vs
>
>   34:   4e083c20        mov     x0, v1.d[0]
>   38:   4e083c01        mov     x1, v0.d[0]
>   3c:   eb00003f        cmp     x1, x0
>   40:   52800000        mov     w0, #0
>   44:   54000040        b.eq    4c <f0+0x18>
>   48:   d65f03c0        ret
>   4c:   4e183c20        mov     x0, v1.d[1]
>   50:   4e183c01        mov     x1, v0.d[1]
>   54:   eb00003f        cmp     x1, x0
>   58:   1a9f17e0        cset    w0, eq
>   5c:   d65f03c0        ret
>

My patch compiles to below code and takes ~100ms less time

#define VECTYPE        uint64x2_t
#define ALL_EQ(v1, v2) \
        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))

  7039d0:       4e083c02        mov     x2, v0.d[0]
  7039d4:       b5000102        cbnz    x2, 7039f4 <f0+0xfc>
  7039d8:       4e183c02        mov     x2, v0.d[1]
  7039dc:       b50000c2        cbnz    x2, 7039f4 <f0+0xfc>
  7039e0:       91002084        add     x4, x4, #0x8
  7039e4:       91020063        add     x3, x3, #0x80
  7039e8:       eb04003f        cmp     x1, x4

capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 2973 milliseconds
downtime: 67 milliseconds
setup: 5 milliseconds
transferred ram: 293659 kbytes
throughput: 809.45 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2062791 pages
skipped: 0 pages
normal: 68748 pages
normal bytes: 274992 kbytes
dirty sync count: 3
(qemu)

capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 2972 milliseconds
downtime: 47 milliseconds
setup: 5 milliseconds
transferred ram: 295972 kbytes
throughput: 816.10 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2062861 pages
skipped: 0 pages
normal: 69325 pages
normal bytes: 277300 kbytes
dirty sync count: 3
(qemu)

capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 2982 milliseconds
downtime: 40 milliseconds
setup: 5 milliseconds
transferred ram: 293386 kbytes
throughput: 806.26 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2063199 pages
skipped: 0 pages
normal: 68679 pages
normal bytes: 274716 kbytes
dirty sync count: 4
(qemu)

Regards
Vijay
