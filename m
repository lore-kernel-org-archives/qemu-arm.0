Received: by 10.223.159.74 with SMTP id f10csp3897376wrg;
        Tue, 12 Dec 2017 06:39:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBottZZ4KH8PE9o38oR1Pxfjs1SnpDr0xe1zAv2xSiSK8YWwF41mwZKuWMxzqSpJ4KqtWyiht
X-Received: by 10.37.83.197 with SMTP id h188mr2920701ybb.61.1513089581139;
        Tue, 12 Dec 2017 06:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513089581; cv=none;
        d=google.com; s=arc-20160816;
        b=NE69SkBw4WAUzrARyLFtXCrEfUZxM5tD4oJwXtNXEj00q8JBllv+de6m/1Ndt3qG/t
         JE2dRCjdDLY8J/ibYiHjoCOYCtWYKT1GyU8mIkqZKjCYTbc6DB1vKmfmCi+OpCYvAwXl
         iIp7V0ffbsq/eEdpnnoZVsR75wlcFdMRhXrk3Tj5BhXAJU8e7b98hFSB/eMWjrzYgDsl
         UWrIuWG3LkW1CBxEHaIMnQZBFBWTmPYoyBsDYTkAgR4ExJ1PULyGMHqFQwyV+0Zatp4s
         JLVGui43cNTwRaob373N0EBul3crbwXZ1HvLXA2i15I/K3bVHcwSONogTd8irZAyseQS
         kK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=1JxY+/ddn+AJsJ7dljdjmMIdA/rFoQ7NhOcQxHKDwkY=;
        b=DOSIlPM7uHJVHyXpadjrU2nxhbbs/gC7QoX1FYvBDmNgcaZE7PGRNCNwqw0uPC0wWW
         DwFlrX2VOn0t2q9gZZO3Chi1y3HGMhuULytM9lTVe7NmkDYqA3KD06xbEuVxXOfqhcze
         7St+5TmDZMl5LQTZ0qjwde2lJijVwVexEbHowj0jS1uUy5eltIFqRNTomaHYYArNKAMG
         AaPVTcpp0vKNjMavd+LdYENJF2fhPNChDK+wREjudABq4YLdSWur4je0GQ3UcJ0intDl
         e1B9foRbwmgWdUmOAAMMlZWMIgqBumoXOy2cG0uN+vk3agCbDcv6hHBU6XT9+Vf6v521
         YsQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x68si1917353ybe.94.2017.12.12.06.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:39:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlie-0003X3-Jp
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:39:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOliW-0003Wi-2X
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:39:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOliS-00042f-2C
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:39:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOliR-00042P-SA; Tue, 12 Dec 2017 09:39:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8AA55D68B;
	Tue, 12 Dec 2017 14:39:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD66870A0C;
	Tue, 12 Dec 2017 14:39:24 +0000 (UTC)
Date: Tue, 12 Dec 2017 15:39:22 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171212143922.cl7wyhupqdopqcdj@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512745328-5109-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 12 Dec 2017 14:39:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/virt: Add virt-2.12
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xrz/+RWEVjE0

On Fri, Dec 08, 2017 at 03:02:06PM +0000, Peter Maydell wrote:
> Add virt-2.12 machine type.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/compat.h |  3 +++
>  hw/arm/virt.c       | 19 +++++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)


Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/include/hw/compat.h b/include/hw/compat.h
> index cf389b4..263de97 100644
> --- a/include/hw/compat.h
> +++ b/include/hw/compat.h
> @@ -1,6 +1,9 @@
>  #ifndef HW_COMPAT_H
>  #define HW_COMPAT_H
>  
> +#define HW_COMPAT_2_11 \
> +    /* empty */
> +
>  #define HW_COMPAT_2_10 \
>      {\
>          .driver   = "virtio-mouse-device",\
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 151592b..543f9bd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1618,7 +1618,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> -static void virt_2_11_instance_init(Object *obj)
> +static void virt_2_12_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> @@ -1678,10 +1678,25 @@ static void virt_2_11_instance_init(Object *obj)
>      vms->irqmap = a15irqmap;
>  }
>  
> +static void virt_machine_2_12_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
> +
> +#define VIRT_COMPAT_2_11 \
> +    HW_COMPAT_2_11
> +
> +static void virt_2_11_instance_init(Object *obj)
> +{
> +    virt_2_12_instance_init(obj);
> +}
> +
>  static void virt_machine_2_11_options(MachineClass *mc)
>  {
> +    virt_machine_2_12_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 11)
> +DEFINE_VIRT_MACHINE(2, 11)
>  
>  #define VIRT_COMPAT_2_10 \
>      HW_COMPAT_2_10
> -- 
> 2.7.4
> 
> 
