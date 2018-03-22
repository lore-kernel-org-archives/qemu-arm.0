Received: by 10.28.71.155 with SMTP id m27csp51017wmi;
        Thu, 22 Mar 2018 01:02:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvHDq59v0QHlHbNszTPq5tmrbAy0xp2DC7e+maPWaLJY4HtSNhsc9OCbs4LtDVNWGU7sOuh
X-Received: by 10.237.47.165 with SMTP id m34mr34825750qtd.178.1521705743106;
        Thu, 22 Mar 2018 01:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521705743; cv=none;
        d=google.com; s=arc-20160816;
        b=eCL0C0CtgKJde6mC9aOX+jwk5ye7nB5rxgjcuSCEOI9Y+ErSMEc9zO+iH7JrTst1it
         rHDZo36jBK5sXzok5B8co57aTLl8WQMQDv94F1QFUD5MSHe35tFnZIJNhiQzbpw4H1Wk
         XM3fjDAfbn1mhpz4peZk55srgoNMnjjgqqDzbQQnwHqs5fbTd+IPW2E4vkbVjJcBmBYc
         TuBLg1Yu9IeFK/rfsxBWnEmMGD48R6yUKEQnLcyviT7uqLNtR4DXw56AI0vKiNtbka8F
         b91EbDc5Qcjd73IitJABG51lFmqlibS6ykv1EpgncVvuVlDMvHIe2PFVT0kQUmAptWQ/
         WPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=rWrw5zD7xy7jQkOUuoN2Za/p2TGKvql9y/X26n94e+k=;
        b=BRWNCZgeRPPJ/7hj0tLpy0Sq3KxT20HOv7KB+NE2n+YU7U7kJk1Gr0ANlVxCIA+6gS
         S3w7aEdUj5nYxVdvEhjBq9muFIkYQ67qUhxIq7Ok3fsmUE/wvZoSWS5ZTiZDE8ylWPJw
         wuLMT/Ctuux6ZLTm6JmaZW4dGPyrgH2WxnAqdTVEhwvBBr14c0VFYUdQSTnCy+2jtn9T
         uVNCjofVdpjFZBBSs/diDqZE/1RzqrBia0gSolCrJd/bKu8extpQvgTtm3a5jr889AGX
         zN30itZENOm3sQFcQR0U7kpG8HgkChX0XJEVzLIIeZN+jYdk65/6o7M/aV7O3mDJ7Dou
         hFLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si809353qtk.363.2018.03.22.01.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvB0-0003eI-MJ
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:02:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eyvAs-0003dr-Iz
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eyvAo-0006Ew-Jh
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:02:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58966 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eyvAo-0006E0-Ee; Thu, 22 Mar 2018 04:02:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 375554072459;
	Thu, 22 Mar 2018 08:02:04 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-151.brq.redhat.com [10.40.204.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDFED2026980;
	Thu, 22 Mar 2018 08:01:58 +0000 (UTC)
Date: Thu, 22 Mar 2018 09:01:56 +0100
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20180322080156.x2q7w6wtdrvc3wk3@hawk.localdomain>
References: <20180322031216.14569-1-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322031216.14569-1-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 08:02:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 08:02:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->desc
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yILwUeleRdzD

On Wed, Mar 21, 2018 at 10:12:16PM -0500, Wei Huang wrote:
> Instead of using "1.0" as the system version of SMBIOS, we should use
> mc->desc for mach-virt machine type. With this patch, "dmidecode -t 1"
> (e.g., "-M virt-2.12,accel=kvm") will show:
> 
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: QEMU 2.12 ARM Virtual Machine
>             Serial Number: Not Specified
>             ...
> 
> instead of:
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: 1.0
>             Serial Number: Not Specified
>             ...
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2c07245047..da7228b297 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1132,6 +1132,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
> @@ -1145,7 +1146,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>      }
>  
>      smbios_set_defaults("QEMU", product,
> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> +                        mc->desc, false, true, SMBIOS_ENTRY_POINT_30);
>  
>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>                        &smbios_anchor, &smbios_anchor_len);
> -- 
> 2.14.3

I agree we should change the useless 1.0, but shouldn't we use
mc->name instead of mc->desc? mc->name would make it consistent
with pc-piix and q35 and also be a less verbose "version". We'd
get e.g.

 System Information
	Manufacturer: QEMU
	Product Name: KVM Virtual Machine
	Version: virt-2.12
	Serial Number: Not Specified

Thanks,
drew
