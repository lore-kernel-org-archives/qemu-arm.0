Received: by 10.25.21.156 with SMTP id 28csp752142lfv;
        Wed, 24 Aug 2016 23:37:40 -0700 (PDT)
X-Received: by 10.237.43.162 with SMTP id e31mr8490737qtd.110.1472107060003;
        Wed, 24 Aug 2016 23:37:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v49si9437667qta.102.2016.08.24.23.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 23:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcoIF-0001eg-9d
	for alex.bennee@linaro.org; Thu, 25 Aug 2016 02:37:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcoI8-0001dj-3s
	for qemu-arm@nongnu.org; Thu, 25 Aug 2016 02:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcoI7-00022y-53
	for qemu-arm@nongnu.org; Thu, 25 Aug 2016 02:37:32 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bcoI3-00022C-QO; Thu, 25 Aug 2016 02:37:27 -0400
Received: by mail-oi0-x241.google.com with SMTP id s207so3790276oie.0;
	Wed, 24 Aug 2016 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xmUnWW423NbTkBpOrlIsK2M/u7C2G5ckjAMBnQu0tkU=;
	b=NtIJ4ZLIZYd83FsG/PkhN4qFVDk5Tt74CQb75u9aS96+q3wNRFCVKaHEHlw8lLO6G1
	PADzLqCqBBTmx9K1OKf+gzEM09m6Kk/Sr7UzJDBEj+ZXUfPnLqzQ8dvRzMbKGGprtxiM
	CZOCa9rQka5IJE/GysWolS9xT/ZyFmtY1mhuGQEQDVASlx1ckg3/MvhayrQul7JILIJh
	ZtbtD43xEnIedJVeTAynM9Cw77F8c91waUBfZJamopjgEGZnjWcPMzl+f+UOOs97LxYt
	BUxWcMxcVaNgACYWW/6QTkD2Gpvr81XXZyAPZ7xFWhFL8nwHDK9buh4eWrxEfPD4KIMa
	F8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xmUnWW423NbTkBpOrlIsK2M/u7C2G5ckjAMBnQu0tkU=;
	b=YZXVJ24vSFv/zOCwIeqTVyDhgrNHCjHvXooAhPgcfueHcpSrOd7qUBT+bu7zegkyn5
	2nAm2oA1SV5oxKy0npUUXHLpuPUkykB4VN6LHFwXH3YDsHJ5KttIxHWkTbFcumNYXl80
	jZW0495yIQvpfhzhnoljZ4b0H1gf04DpW7x7rTBCyiuyhhO5ZWCxJ2Lf+u1+vPNqmg5W
	X/jEhzsfgkjQxP3opqnRmncqnR8ih+FOgzp2FbGFrAULMwxgXn3LigOH9Toc9vaE+iIa
	/wDpQuCqyJJNv4TuVNejQPgqJxY2RpVzdS0nQqBKUDaHxCPAtyuiYIrH3OvC3dN448DO
	1Y4g==
X-Gm-Message-State: AEkoouuD7PIFE4veP7KT2dZ2mcOhquOVONdhL2nypthzT0yyLTCUwHsy7SrXDxvCxFVZpDbx/rgw6Y3Hx72wAQ==
X-Received: by 10.202.206.20 with SMTP id e20mr5076581oig.136.1472107047261;
	Wed, 24 Aug 2016 23:37:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.203 with HTTP; Wed, 24 Aug 2016 23:37:26 -0700 (PDT)
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 25 Aug 2016 12:07:26 +0530
Message-ID: <CALicx6v1BgkW8saxZcgLGt5Hd47MSgfOEQQ8-mdsTgYMgnqvJw@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
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
X-TUID: uXZr5nvSW9p0

Hi Richard,

  Migration fails on arm64 with these patches.
On the destination VM, follow errors are appearing.

qemu-system-aarch64: VQ 0 size 0x400 Guest index 0x0 inconsistent with
Host index 0x1937: delta 0xe6c9
qemu-system-aarch64: error while loading state for instance 0x0 of
device 'virtio-mmio@000000000a003e00/virtio-net'
qemu-system-aarch64: load of migration failed: Operation not permitted
qemu-system-aarch64: network script /etc/qemu-ifdown failed with status 256

Regards
Vijay


On Wed, Aug 24, 2016 at 9:47 AM, Richard Henderson <rth@twiddle.net> wrote:
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
