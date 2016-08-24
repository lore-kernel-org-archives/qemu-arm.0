Received: by 10.25.21.156 with SMTP id 28csp204107lfv;
        Wed, 24 Aug 2016 01:35:11 -0700 (PDT)
X-Received: by 10.55.157.142 with SMTP id g136mr1839955qke.171.1472027711887;
        Wed, 24 Aug 2016 01:35:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m63si5592253qkb.20.2016.08.24.01.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 01:35:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcTeR-0003S7-Dd
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 04:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bcTeM-0003Qb-MK
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:35:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bcTeJ-0004LQ-Gn
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:35:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bcTeJ-0004KJ-Ba; Wed, 24 Aug 2016 04:35:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07983C00F08B;
	Wed, 24 Aug 2016 08:35:02 +0000 (UTC)
Received: from work-vm (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7O8Yw3U016509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 24 Aug 2016 04:35:00 -0400
Date: Wed, 24 Aug 2016 09:34:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20160824083457.GA2032@work-vm>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 24 Aug 2016 08:35:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: peter.maydell@linaro.org, vijay.kilari@gmail.com, liang.z.li@intel.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bIXjLP4vtB83


cc'ing in Liang Li who did the original avx2 code.

Dave


* Richard Henderson (rth@twiddle.net) wrote:
> Patches 1-3 remove the use of ifunc from the implementation.
> 
> Patch 5 adjusts the x86 implementation a bit more to take
> advantage of ptest (in sse4.1) and unaligned accesses (in avx1).
> 
> Patches 2 and 6 are the result of my conversation with Vijaya
> Kumar with respect to ThunderX.
> 
> Patch 7 is the result of seeing some really really horrible code
> produced for ppc64le (gcc 4.9 and mainline).
> 
> This has had limited testing.  What I don't know is the best way
> to benchmark this -- the only way I know to trigger this is via
> the console, by hand, which doesn't make for reasonable timing.
> 
> 
> r~
> 
> 
> Richard Henderson (7):
>   cutils: Remove SPLAT macro
>   cutils: Export only buffer_is_zero
>   cutils: Rearrange buffer_is_zero acceleration
>   cutils: Add generic prefetch
>   cutils: Rewrite x86 buffer zero checking
>   cutils: Rewrite aarch64 buffer zero checking
>   cutils: Rewrite ppc buffer zero checking
> 
>  configure             |  21 +-
>  include/qemu/cutils.h |   2 -
>  migration/ram.c       |   2 +-
>  migration/rdma.c      |   5 +-
>  util/cutils.c         | 526 +++++++++++++++++++++++++++++++++-----------------
>  5 files changed, 352 insertions(+), 204 deletions(-)
> 
> -- 
> 2.7.4
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
