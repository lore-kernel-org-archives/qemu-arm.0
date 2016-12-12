Received: by 10.25.205.13 with SMTP id d13csp1551874lfg;
        Mon, 12 Dec 2016 02:13:55 -0800 (PST)
X-Received: by 10.237.62.202 with SMTP id o10mr80185872qtf.2.1481537635492;
        Mon, 12 Dec 2016 02:13:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m1si25960375qtd.319.2016.12.12.02.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 02:13:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGNcI-0007d8-Uk
	for alex.bennee@linaro.org; Mon, 12 Dec 2016 05:13:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGNbZ-0007Dr-26
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 05:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGNbW-0002PU-AM
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 05:13:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGNbW-0002PL-4k; Mon, 12 Dec 2016 05:13:06 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5897E7FD52;
	Mon, 12 Dec 2016 10:13:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCAD2fo015632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 12 Dec 2016 05:13:04 -0500
Date: Mon, 12 Dec 2016 11:13:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161212101301.pls7yf6fnymo444k@kamzik.brq.redhat.com>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481301020-21777-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 12 Dec 2016 10:13:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/4] hw/arm/virt: add 2.9 machine type
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8nT9IMhLGWAE

On Fri, Dec 09, 2016 at 04:30:17PM +0000, Peter Maydell wrote:
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/compat.h |  3 +++
>  hw/arm/virt.c       | 19 +++++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/include/hw/compat.h b/include/hw/compat.h
> index 0f06e11..f8b8354 100644
> --- a/include/hw/compat.h
> +++ b/include/hw/compat.h
> @@ -1,6 +1,9 @@
>  #ifndef HW_COMPAT_H
>  #define HW_COMPAT_H
>  
> +#define HW_COMPAT_2_8 \
> +    /* empty */
> +
>  #define HW_COMPAT_2_7 \
>      {\
>          .driver   = "virtio-pci",\
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d04e4ac..11c53a5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1525,7 +1525,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> -static void virt_2_8_instance_init(Object *obj)
> +static void virt_2_9_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>  
> @@ -1558,10 +1558,25 @@ static void virt_2_8_instance_init(Object *obj)
>                                      "Valid values are 2, 3 and host", NULL);
>  }
>  
> +static void virt_machine_2_9_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
> +
> +#define VIRT_COMPAT_2_8 \
> +    HW_COMPAT_2_8
> +
> +static void virt_2_8_instance_init(Object *obj)
> +{
> +    virt_2_9_instance_init(obj);
> +}
> +
>  static void virt_machine_2_8_options(MachineClass *mc)
>  {
> +    virt_machine_2_9_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_8);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 8)
> +DEFINE_VIRT_MACHINE(2, 8)
>  
>  #define VIRT_COMPAT_2_7 \
>      HW_COMPAT_2_7
> -- 
> 2.7.4
> 
