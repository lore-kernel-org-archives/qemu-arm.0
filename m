Received: by 10.223.172.38 with SMTP id v35csp5465265wrc;
        Mon, 11 Sep 2017 05:43:35 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAPMN9XWxkb8oOLqaVNjTMavGR9agCgazti16jJKRUpMtCO/NSu/NqPU4QMDWtKSBZz/FnG
X-Received: by 10.200.33.143 with SMTP id 15mr16709561qty.187.1505133815511;
        Mon, 11 Sep 2017 05:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505133815; cv=none;
        d=google.com; s=arc-20160816;
        b=uYYLoRMxF0jyO3zWXFYr7yrWHlw+DLUbXRtJqWf4O4cbDc/7te+sh8AFxG0XKigUrB
         mnBM7yY70WmJMgbBabyxxYR+xesgogS5lf2yHBvpsIQkgPcQXx4UCoyAT1Z4bLYbZh+d
         P/uQltOFs6g71ErdWTEEZeT5KqFQX4tLI1vsKPylOWuWfv+haN+Cq1NZUB9Imff3fE6G
         nzOqG09UM1zFNXkpcKlmSPGT/SfysO+3RP9Fi2Fkd8rML9vnr8V0xT4xQ5QGTo0k+3Y+
         6aOOuihl0z+gynHGYv+0Zrdq88ghGy6djs15Mv6zRSHUWArWRHtTd5nkXJhlbsZ/LqC+
         kE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=PpAz0rc9oOfWH2b/P3vY1v+WM1U5ba9AdwMIvhqTdVs=;
        b=ELHCo3U37So0/srcg+zPwUtN6WBnUo2MHH773vq/twg+ojz4JScqOtOJdo3NSgG3Kl
         koktmiw9aiXbg9svmzoueQo/WP0eiRfErbe+yFs0z/6L7g8hXduLBnvyRG665D0foP4F
         3wmBPCOLb+gOeRdQ/wHW6tevwdbpcqF8vEEOaalTC/r4kVkizV+DYIHtC3BbCVQVtirW
         Ns4CZ/LatqkCX+TGhU6Q1R7ES5zcdXbGQ7EnStOvcFGISlWp8kW4YIq8vfx7XVRBOyc8
         rpmF4T0sejANnBsuuDM3X3kfgC9smfNY1RpgHusvgg5Bn6qanr1ysSmbOxS9mHhEs/qY
         5tpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l184si9189732qkd.222.2017.09.11.05.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 05:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drO3p-0002Ej-90
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 08:43:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drO3a-0002AJ-5c
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drO3U-00012M-EH
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:43:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1drO3U-00012E-8R; Mon, 11 Sep 2017 08:43:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B17A2C95;
	Mon, 11 Sep 2017 12:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3B17A2C95
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from hawk.localdomain (ovpn-204-91.brq.redhat.com [10.40.204.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11CCE6FDDC;
	Mon, 11 Sep 2017 12:43:01 +0000 (UTC)
Date: Mon, 11 Sep 2017 14:42:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170911124258.nng5ejtjnsbdyyww@hawk.localdomain>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
	<1499634139-20399-3-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499634139-20399-3-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 11 Sep 2017 12:43:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v3 2/3] hw/arm/virt: Set
 INTx/gsi mapping
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, agraf@suse.de,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	pranavkumar@linaro.org, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1VDaUVhwrJ9

On Sun, Jul 09, 2017 at 11:02:18PM +0200, Eric Auger wrote:
> From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> 
> Let's provide the GPEX host bridge with the INTx/gsi mapping. This is
> needed for INTx/gsi routing.
> 
> Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 010f724..f86c229 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1012,6 +1012,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
>      char *nodename;
>      int i;
>      PCIHostState *pci;
> +    GPEXHost *s;
>  
>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
>      qdev_init_nofail(dev);
> @@ -1047,8 +1048,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
>      /* Map IO port space */
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
>  
> +    s = GPEX_HOST(dev);
> +
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> +        gpex_set_irq_num(s, i, irq + i);

nit: don't need the 's' variable for the one use, just do
gpex_set_irq_num(GPEX_HOST(dev), ...)

>      }
>  
>      pci = PCI_HOST_BRIDGE(dev);
> -- 
> 2.5.5
> 
>

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>
