Received: by 10.80.166.35 with SMTP id d32csp91068edc;
        Tue, 11 Oct 2016 09:44:26 -0700 (PDT)
X-Received: by 10.55.52.1 with SMTP id b1mr3927293qka.223.1476204266272;
        Tue, 11 Oct 2016 09:44:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13si1851696qkl.43.2016.10.11.09.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 09:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0AD-0007dx-OO
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 12:44:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu0A9-0007dq-RM
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 12:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu0A7-0003SN-PC
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 12:44:20 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu0A7-0003Ro-DO
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 12:44:19 -0400
Received: by mail-vk0-x22b.google.com with SMTP id b186so25647523vkb.1
	for <qemu-arm@nongnu.org>; Tue, 11 Oct 2016 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RQJgw0G391Vz9YoUvfZG2U7atrAWI94kC+rBC9d2CK4=;
	b=Dy5NuuTW9Jbj8KiZn2JbPokrj2zzNfWpK17/977C+rSK/AnUNjPsQpcrTdegyTWZmt
	INqP+D3tJlMelRoGxbISm7o/fHJz5H5DcL6Styl5PsXPJgt99f+I4TA07Vfg3Vr3svUu
	QeiaVi5Xbel1l1rLBJD6fXfXCGgk0lpqkeEcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RQJgw0G391Vz9YoUvfZG2U7atrAWI94kC+rBC9d2CK4=;
	b=Ux23EYLJrcs8nq4Etg+sRazZx3ChnrR4hWTiclLkDDVzesgx/Ze8Ba8YuVsVb0UVYY
	iRbWsL9mzYQnnATZ/FfSnb8j6uft/eu2j0zL6fKp4LYfwf3sk8j/HxAaAfl7K3XAw2Tu
	q3+AgEB+JE2DYguuugj+NFCxis6QGnvYLTv7mw8STreSg3ok5DitpCICbwi0ZgjtGn1K
	QzWErx47XTyk3AnvgOEEFCgynMth0Ngbomj9p52BAXnfwHKDcOBUP/TYvb8jkOwc+j6S
	FPbvt7L8mwcztPSB1uf0gJrQybsYPfC5erTPvcGHE2VINhjZEcvinvxeSLW902DUtbjQ
	FlQQ==
X-Gm-Message-State: AA6/9Rle7zAhEHXxHgN5hn6DIwIpI95MDBkm1+CWUOqLUy4WcANoQHQEuey7jVeUS8/O2/WViTgWr5OzkE/gXyrh
X-Received: by 10.31.206.198 with SMTP id e189mr3276667vkg.51.1476204258593;
	Tue, 11 Oct 2016 09:44:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 11 Oct 2016 09:43:58 -0700 (PDT)
In-Reply-To: <20161011163202.19720-1-cov@codeaurora.org>
References: <20161011163202.19720-1-cov@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2016 17:43:58 +0100
Message-ID: <CAFEAcA-4wmWBxj+T=A+vFO=oyLNCJZbbLfzbLNpemLXLyU6EdQ@mail.gmail.com>
To: Christopher Covington <cov@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gic_kvm: Fix build on aarch64
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nyqkd7jITSk2

On 11 October 2016 at 17:32, Christopher Covington <cov@codeaurora.org> wrote:
> Remove unused debugging code to fix native building on aarch64. Without
> this change, the following -Werr output inhibits make from completing.
>
>   qemu/hw/intc/arm_gic_kvm.c:38:18: error: debug_gic_kvm defined but not used [-Werror=unused-const-variable=]
>    static const int debug_gic_kvm = 0;
>                     ^~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>   qemu/rules.mak:60: recipe for target 'hw/intc/arm_gic_kvm.o' failed
>   make[1]: *** [hw/intc/arm_gic_kvm.o] Error 1
>   Makefile:205: recipe for target 'subdir-aarch64-softmmu' failed

This builds for me on aarch64, so presumably this is a "newer
compiler is more picky" warning.

> Signed-off-by: Christopher Covington <cov@codeaurora.org>
> ---
>  hw/intc/arm_gic_kvm.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index ae7ac58..11729ee 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -30,20 +30,6 @@
>  #include "gic_internal.h"
>  #include "vgic_common.h"
>
> -//#define DEBUG_GIC_KVM
> -
> -#ifdef DEBUG_GIC_KVM
> -static const int debug_gic_kvm = 1;
> -#else
> -static const int debug_gic_kvm = 0;
> -#endif
> -
> -#define DPRINTF(fmt, ...) do { \
> -        if (debug_gic_kvm) { \
> -            printf("arm_gic: " fmt , ## __VA_ARGS__); \
> -        } \
> -    } while (0)
> -
>  #define TYPE_KVM_ARM_GIC "kvm-arm-gic"
>  #define KVM_ARM_GIC(obj) \
>       OBJECT_CHECK(GICState, (obj), TYPE_KVM_ARM_GIC)

In any case, since we don't use the DPRINTF macro we may as well
dump it (we should use tracepoints if we want to add interesting
debug-logging in future anyhow).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
