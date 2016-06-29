Received: by 10.25.21.96 with SMTP id l93csp2153188lfi;
        Wed, 29 Jun 2016 05:53:51 -0700 (PDT)
X-Received: by 10.55.24.35 with SMTP id j35mr9627735qkh.120.1467204830611;
        Wed, 29 Jun 2016 05:53:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si2892825qke.261.2016.06.29.05.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 05:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIF02-0002V0-3C
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 08:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIEzx-0002Uh-QX
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 08:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIEzu-0002PV-La
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 08:53:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bIEzu-0002PH-FH; Wed, 29 Jun 2016 08:53:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C2C380083;
	Wed, 29 Jun 2016 12:53:41 +0000 (UTC)
Received: from [10.36.112.42] (ovpn-112-42.ams2.redhat.com [10.36.112.42])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5TCraEL014111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Jun 2016 08:53:38 -0400
To: vijayak@cavium.com, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9b75ea7f-4b2f-4377-483e-aab3ae36a01b@redhat.com>
Date: Wed, 29 Jun 2016 14:53:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1467190029-694-2-git-send-email-vijayak@cavium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 29 Jun 2016 12:53:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/1] target-arm: Use Neon for zero checking
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
Cc: Prasun.Kapoor@cavium.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Suresh <ksuresh@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b2ke9K/GiuW4



On 29/06/2016 10:47, vijayak@cavium.com wrote:
> From: Vijay <vijayak@cavium.com>
> 
> Use Neon instructions to perform zero checking of
> buffer. This is helps in reducing total migration time.
> 
> Use case: Idle VM live migration with 4 VCPUS and 8GB ram
> running CentOS 7.
> 
> Without Neon, the Total migration time is 3.5 Sec
> 
> Migration status: completed
> total time: 3560 milliseconds
> downtime: 33 milliseconds
> setup: 5 milliseconds
> transferred ram: 297907 kbytes
> throughput: 685.76 mbps
> remaining ram: 0 kbytes
> total ram: 8519872 kbytes
> duplicate: 2062760 pages
> skipped: 0 pages
> normal: 69808 pages
> normal bytes: 279232 kbytes
> dirty sync count: 3
> 
> With Neon, the total migration time is 2.9 Sec
> 
> Migration status: completed
> total time: 2960 milliseconds
> downtime: 65 milliseconds
> setup: 4 milliseconds
> transferred ram: 299869 kbytes
> throughput: 830.19 mbps
> remaining ram: 0 kbytes
> total ram: 8519872 kbytes
> duplicate: 2064313 pages
> skipped: 0 pages
> normal: 70294 pages
> normal bytes: 281176 kbytes
> dirty sync count: 3
> 
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> Signed-off-by: Suresh <ksuresh@cavium.com>
> ---
>  util/cutils.c |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index 5830a68..4779403 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
>  #define SPLAT(p)       _mm_set1_epi8(*(p))
>  #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
>  #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
> +#elif __aarch64__
> +#include "arm_neon.h"
> +#define VECTYPE        uint64x2_t
> +#define ALL_EQ(v1, v2) \
> +        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
> +         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
> +#define VEC_OR(v1, v2) ((v1) | (v2))
>  #else
>  #define VECTYPE        unsigned long
>  #define SPLAT(p)       (*(p) * (~0UL / 255))
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
