Received: by 10.25.21.156 with SMTP id 28csp1162843lfv;
        Sun, 10 Jul 2016 13:17:54 -0700 (PDT)
X-Received: by 10.55.170.20 with SMTP id t20mr21814536qke.162.1468181874639;
        Sun, 10 Jul 2016 13:17:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197si725000qkb.148.2016.07.10.13.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jul 2016 13:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMLAo-0004Rl-3O
	for alex.bennee@linaro.org; Sun, 10 Jul 2016 16:17:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bMLAj-0004Rg-H0
	for qemu-arm@nongnu.org; Sun, 10 Jul 2016 16:17:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bMLAf-0007qg-Ai
	for qemu-arm@nongnu.org; Sun, 10 Jul 2016 16:17:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bMLAf-0007qc-4u; Sun, 10 Jul 2016 16:17:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E4B1C049D5C;
	Sun, 10 Jul 2016 20:17:43 +0000 (UTC)
Received: from [10.36.5.187] (vpn1-5-187.ams2.redhat.com [10.36.5.187])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6AKHbJH004152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 10 Jul 2016 16:17:40 -0400
To: eric.auger.pro@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, p.fedin@samsung.com
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
	<1467798364-9049-3-git-send-email-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3a9875c6-2719-b9a5-ac66-3bffa7a46553@redhat.com>
Date: Sun, 10 Jul 2016 22:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467798364-9049-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 10 Jul 2016 20:17:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 2/6] target-arm: move gicv3_class_name from
 machine to kvm_arm.h
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
Cc: diana.craciun@freescale.com, shlomopongratz@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bLLweWVIrRMF

Hi
On 06/07/2016 11:46, Eric Auger wrote:
> Machine.c contains code related to migration. Let's move
> gicv3_class_name to kvm_arm.h instead.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> 
> v4: creation
> ---
>  target-arm/kvm_arm.h | 16 +++++++++++++++-
>  target-arm/machine.c | 16 ----------------
>  2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
> index 544e404..4fb6d15 100644
> --- a/target-arm/kvm_arm.h
> +++ b/target-arm/kvm_arm.h
> @@ -223,7 +223,21 @@ static inline const char *gic_class_name(void)
>   *
>   * Returns: class name to use
>   */
> -const char *gicv3_class_name(void);
> +static inline const char *gicv3_class_name(void)
> +{
> +    if (kvm_irqchip_in_kernel()) {
> +#ifdef TARGET_AARCH64
> +        return "kvm-arm-gicv3";
> +#else
> +        error_report("KVM GICv3 acceleration is not supported on this "
> +                     "platform");
this fails to compile without adding
#include "qemu/error-report.h"

I will correct this on the next version.

Sorry for the oversight.

Best Regards

Eric
> +#endif
> +    } else {
> +        return "arm-gicv3";
> +    }
> +
> +    exit(1);
> +}
>  
>  /**
>   * kvm_arm_handle_debug:
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 2dbeb82..d90943b 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -331,19 +331,3 @@ const VMStateDescription vmstate_arm_cpu = {
>          NULL
>      }
>  };
> -
> -const char *gicv3_class_name(void)
> -{
> -    if (kvm_irqchip_in_kernel()) {
> -#ifdef TARGET_AARCH64
> -        return "kvm-arm-gicv3";
> -#else
> -        error_report("KVM GICv3 acceleration is not supported on this "
> -                     "platform");
> -#endif
> -    } else {
> -        return "arm-gicv3";
> -    }
> -
> -    exit(1);
> -}
> 
