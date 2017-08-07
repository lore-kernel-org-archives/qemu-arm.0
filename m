Received: by 10.25.221.202 with SMTP id w71csp2790702lfi;
        Mon, 7 Aug 2017 05:14:36 -0700 (PDT)
X-Received: by 10.55.217.157 with SMTP id q29mr414054qkl.152.1502108076189;
        Mon, 07 Aug 2017 05:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502108076; cv=none;
        d=google.com; s=arc-20160816;
        b=s4VQSsqPOQX5TfuvdReL/EU3pZswJaq91aTuXwoqDwh9vWa7lNFsocHiCoBpU1XzL8
         aTsruJvXUNuHWxmaF/tj7u6mKpRAuAj1O0MIlUN/vLrpZwjGACoEbdyl3+88PwQ3SI8U
         WgvDSPg7q4cmrOL7v9h6AyTzd8b23REUWse1tUsAmj+0DaRQRQLQi0fawlH9tidy5LkA
         qeyd3EAKYRgBMZ0FEM7sfxhRqQQS8hCit2ekb6yGYTLSyUHPS0Al9q+7m430UhB0jdQX
         c1n8WE4zpmbV+vJ9nvXuAOgET2HnqYp/FzR2B+KUHWVpVcQLIaZWhJ/L7tayERrfkPUz
         3iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=FgeDXhhTpu9efrWfyPt6dJQEtXxzTri7cjHwPKTi1l4=;
        b=X4xfZJs2zWao+qYMshcG5Iha5iV46bl+UifjumWth7+slc6X2V1vvJRBHSDnrts1Ya
         WLf4/8yOAI+b/ipp+hqJVJXYtcAVoflxIgRq2NPL/Dd3eXVo7S3/WWdMIAecvviqCuV+
         It5NP0VZbvSuam1l+ZAeegJlbF3ID/8BcvsIzAYdVdWlUFljB7jo74atcDxaLSZU7Yac
         fA3Dx2Aj9RbhkRZKuBD4CvXwA8izeGM9M46UkJr25Ny8HMlP3pDmEWhqr5oGqDlJJ3j9
         2bW7MCK1p9QVkQYjf6PDiVuaSFPjVq2K3mmDaBGbfKithScrV8LVViid6W/ELKzSOqt+
         Lpgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a66si6962698qke.490.2017.08.07.05.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 05:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1degvZ-00047o-Bq
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 08:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1degvQ-000442-Js
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 08:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1degvL-00009z-DE
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 08:14:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1degvL-00009Q-73; Mon, 07 Aug 2017 08:14:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F03F15565;
	Mon,  7 Aug 2017 12:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3F03F15565
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1629C18232;
	Mon,  7 Aug 2017 12:14:12 +0000 (UTC)
Date: Mon, 7 Aug 2017 14:14:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170807121410.2h5k6duxw7aia3ow@kamzik.brq.redhat.com>
References: <1502106581-11714-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502106581-11714-1-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 07 Aug 2017 12:14:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10] hw/arm/virt: Add 2.10
 machine type
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwlzWGVwAVGU

On Mon, Aug 07, 2017 at 11:49:41AM +0000, Eric Auger wrote:
> Add virt-2.10 machine type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> ---
>  hw/arm/virt.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 31739d7..6b7a0fe 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1639,7 +1639,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> -static void virt_2_9_instance_init(Object *obj)
> +static void virt_2_10_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> @@ -1699,10 +1699,25 @@ static void virt_2_9_instance_init(Object *obj)
>      vms->irqmap = a15irqmap;
>  }
>  
> +static void virt_machine_2_10_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
> +
> +#define VIRT_COMPAT_2_9 \
> +    HW_COMPAT_2_9
> +
> +static void virt_2_9_instance_init(Object *obj)
> +{
> +    virt_2_10_instance_init(obj);
> +}
> +
>  static void virt_machine_2_9_options(MachineClass *mc)
>  {
> +    virt_machine_2_10_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
> +DEFINE_VIRT_MACHINE(2, 9)
>  
>  #define VIRT_COMPAT_2_8 \
>      HW_COMPAT_2_8
> -- 
> 1.9.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
